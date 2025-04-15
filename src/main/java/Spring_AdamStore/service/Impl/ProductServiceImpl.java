package Spring_AdamStore.service.Impl;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.dto.request.ProductRequest;
import Spring_AdamStore.dto.request.ProductUpdateRequest;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.ProductResponse;
import Spring_AdamStore.dto.response.ReviewResponse;
import Spring_AdamStore.entity.*;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.ProductMapper;
import Spring_AdamStore.mapper.ReviewMapper;
import Spring_AdamStore.repository.*;
import Spring_AdamStore.repository.criteria.JobSearchCriteriaQueryConsumer;
import Spring_AdamStore.repository.criteria.SearchCriteria;
import Spring_AdamStore.service.PageableService;
import Spring_AdamStore.service.ProductService;
import Spring_AdamStore.service.ProductVariantService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.*;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j(topic = "PRODUCT-SERVICE")
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductMapper productMapper;
    private final PageableService pageableService;
    private final ReviewRepository reviewRepository;
    private final CategoryRepository categoryRepository;
    private final ColorRepository colorRepository;
    private final ProductImageRepository productImageRepository;
    private final SizeRepository sizeRepository;
    private final ReviewMapper reviewMapper;
    private final ProductVariantService productVariantService;
    @PersistenceContext
    private EntityManager entityManager;


    @Transactional
    @Override
    public ProductResponse create(ProductRequest request) {
        if(productRepository.existsByName(request.getName())){
            throw new AppException(ErrorCode.PRODUCT_EXISTED);
        }
        Product product = productMapper.toProduct(request);

        Category category = categoryRepository.findById(request.getCategoryId())
                .orElseThrow(() -> new AppException(ErrorCode.CATEGORY_NOT_EXISTED));
        product.setCategory(category);

        if(!CollectionUtils.isEmpty(request.getImageIds())){
            Set<ProductImage> productImageSet = setProductImages(request.getImageIds(), product);
            product.setProductImages(productImageSet);
        }

        productRepository.save(product);

        Set<Color> colorSet = validateColors(request.getColorIds());

        Set<Size> sizeSet = validateSizes(request.getSizeIds());

        product.setProductVariants(productVariantService.saveProductVariant(product, sizeSet,
                colorSet, request.getPrice(), request.getQuantity()));

        return productMapper.toProductResponse(product);
    }

    @Override
    public ProductResponse fetchById(Long id) {
        Product product = findProductById(id);

        return productMapper.toProductResponse(product);
    }

    @Override
    public PageResponse<ProductResponse> fetchAll(int pageNo, int pageSize, String sortBy) {
        pageNo = pageNo - 1;

        Pageable pageable = createPageableWithPriceSupport(pageNo, pageSize, sortBy);

        Page<Product> productPage = productRepository.findAll(pageable);

        return PageResponse.<ProductResponse>builder()
                .page(productPage.getNumber() + 1)
                .size(productPage.getSize())
                .totalPages(productPage.getTotalPages())
                .totalItems(productPage.getTotalElements())
                .items(productMapper.toProductResponseList(productPage.getContent()))
                .build();
    }

    @Transactional
    @Override
    public ProductResponse update(Long id, ProductUpdateRequest request) {
        Product product = findProductById(id);

        if (request.getName() != null && !request.getName().equals(product.getName())) {
            if (productRepository.existsByName(request.getName())) {
                throw new AppException(ErrorCode.PRODUCT_EXISTED);
            }
            product.setName(request.getName());
        }

        productMapper.updateProduct(product, request);

        if (request.getCategoryId() != null) {
            Category category = categoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new AppException(ErrorCode.CATEGORY_NOT_EXISTED));
            product.setCategory(category);
        }

        if(!CollectionUtils.isEmpty(request.getImageIds())){
            Set<ProductImage> productImageSet = setProductImages(request.getImageIds(), product);
            product.setProductImages(productImageSet);
        }

        if (!CollectionUtils.isEmpty(request.getSizeIds()) || !CollectionUtils.isEmpty(request.getColorIds())) {
            Set<Color> colorSet = validateColors(request.getColorIds());

            Set<Size> sizeSet = validateSizes(request.getSizeIds());

            product.setProductVariants(productVariantService
                    .updateProductVariants(product, sizeSet, colorSet, request.getPrice(), request.getQuantity()));
        }
        else{
            product.setProductVariants(productVariantService
                    .updatePriceAndQuantity(product, request.getPrice(), request.getQuantity()));
        }

        return productMapper.toProductResponse(productRepository.save(product));
    }

    @Transactional
    @Override
    public void delete(Long id) {
        Product product = findProductById(id);

        product.setStatus(EntityStatus.INACTIVE);

        productRepository.save(product);
    }

    @Override
    public PageResponse<ProductResponse> searchProduct(int pageNo, int pageSize, String sortBy, List<String> search) {
        pageNo = pageNo - 1;

        List<SearchCriteria> criteriaList = new ArrayList<>();

        // lay danh sach cac dieu kien search
        if(search != null){
            for(String s : search){
                Pattern pattern = Pattern.compile("(\\w+?)(~|>|<)(.*)");
                Matcher matcher = pattern.matcher(s);
                if(matcher.find()){
                    criteriaList.add(new SearchCriteria(matcher.group(1), matcher.group(2), matcher.group(3)));
                }
            }
        }

        List<Product> productList = getProducList(pageNo, pageSize, sortBy, criteriaList);

        // tong so phan tu
        Long totalElements = getTotalElements(criteriaList);
        int totalPages = (int) Math.ceil((double) totalElements / pageSize);

        return PageResponse.<ProductResponse>builder()
                .page(pageNo + 1)
                .size(pageSize)
                .totalPages(totalPages)
                .totalItems(totalElements)
                .items(productMapper.toProductResponseList(productList))
                .build();
    }

    private List<Product> getProducList(int pageNo, int pageSize, String sortBy, List<SearchCriteria> criteriaList){
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        Join<Product, ProductVariant> productVariantJoin = root.join("productVariants", JoinType.LEFT);

        // Handle price
        Iterator<SearchCriteria> iterator = criteriaList.iterator();
        predicate = handlePriceSearch(builder, productVariantJoin, iterator, predicate);

        if(!CollectionUtils.isEmpty(criteriaList)){ // search job
            JobSearchCriteriaQueryConsumer queryConsumer = new JobSearchCriteriaQueryConsumer(builder, predicate, root);
            criteriaList.forEach(queryConsumer);

            predicate = builder.and(predicate, queryConsumer.getPredicate());
        }

        query.where(predicate);

        // Sort
        if(StringUtils.hasLength(sortBy)){
            Pattern pattern = Pattern.compile("(\\w+?)(-)(asc|desc)");
            Matcher matcher = pattern.matcher(sortBy);
            if (matcher.find()) {
                String columnName = matcher.group(1);

                // Sort By Price
                if (columnName.equalsIgnoreCase("price")) {
                    if (matcher.group(3).equalsIgnoreCase("desc")) {
                        query.orderBy(builder.desc(productVariantJoin.get("price")));
                    } else {
                        query.orderBy(builder.asc(productVariantJoin.get("price")));
                    }
                }
                // Cac column cua product
                else {
                    if (matcher.group(3).equalsIgnoreCase("desc")) {
                        query.orderBy(builder.desc(root.get(columnName)));
                    } else {
                        query.orderBy(builder.asc(root.get(columnName)));
                    }
                }
            }
        }

        return entityManager.createQuery(query)
                .setFirstResult(pageNo * pageSize)
                .setMaxResults(pageSize)
                .getResultList();
    }

    private Predicate handlePriceSearch(CriteriaBuilder builder, Join<Product, ProductVariant> productVariantJoin, Iterator<SearchCriteria> iterator, Predicate predicate) {
        while (iterator.hasNext()) {
            SearchCriteria criteria = iterator.next();
            if (criteria.getKey().equals("price")) {
                Double priceValue = Double.valueOf(criteria.getValue().toString());

                if (criteria.getOperation().equals(">")) {
                    predicate = builder.and(predicate, builder.greaterThanOrEqualTo(productVariantJoin.get("price"), priceValue));
                } else if (criteria.getOperation().equals("<")) {
                    predicate = builder.and(predicate, builder.lessThanOrEqualTo(productVariantJoin.get("price"), priceValue));
                }
                iterator.remove();
            }
        }
        return predicate;
    }


    private Long getTotalElements(List<SearchCriteria> criteriaList){
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);
        Root<Product> root = countQuery.from(Product.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        // Join ProductVariant
        Join<Product, ProductVariant> productVariantJoin = root.join("productVariants", JoinType.LEFT);

        // Handle price
        Iterator<SearchCriteria> iterator = criteriaList.iterator();
        predicate = handlePriceSearch(builder, productVariantJoin, iterator, predicate);

        if(!CollectionUtils.isEmpty(criteriaList)){ // search job
            JobSearchCriteriaQueryConsumer queryConsumer = new JobSearchCriteriaQueryConsumer(builder, predicate, root);
            criteriaList.forEach(queryConsumer);
            predicate = builder.and(predicate, queryConsumer.getPredicate());
        }

        countQuery.select(builder.count(root));
        countQuery.where(predicate);

        return entityManager.createQuery(countQuery).getSingleResult();
    }

    @Override
    public PageResponse<ReviewResponse> fetchReviewsByProductId(int pageNo, int pageSize, String sortBy, Long productId) {
        pageNo = pageNo - 1;

        Pageable pageable = pageableService.createPageable(pageNo, pageSize, sortBy);

        Product product = findProductById(productId);

        Page<Review> reviewPage = reviewRepository.findAllByProductId(product.getId(), pageable);

        return PageResponse.<ReviewResponse>builder()
                .page(reviewPage.getNumber() + 1)
                .size(reviewPage.getSize())
                .totalPages(reviewPage.getTotalPages())
                .totalItems(reviewPage.getTotalElements())
                .items(reviewMapper.toReviewResponseList(reviewPage.getContent()))
                .build();
    }

    private Product findProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_EXISTED));
    }

    private Set<Color> validateColors(Set<Long> colorIdSet) {
        Set<Color> colorSet = colorRepository.findAllByIdIn(colorIdSet);
        if (colorSet.size() != colorIdSet.size()) {
            throw new AppException(ErrorCode.INVALID_PRODUCT_COLOR_LIST);
        }
        return colorSet;
    }

    private Set<Size> validateSizes(Set<Long> sizeIdSet) {
        Set<Size> sizeSet = sizeRepository.findAllByIdIn(sizeIdSet);
        if (sizeSet.size() != sizeIdSet.size()) {
            throw new AppException(ErrorCode.INVALID_PRODUCT_SIZE_LIST);
        }
        return sizeSet;
    }

    private Set<ProductImage> setProductImages(Set<Long> imageIdSet, Product product) {
        Set<ProductImage> productImageSet = productImageRepository.findAllByIdIn(imageIdSet);
        if (productImageSet.size() != imageIdSet.size()) {
            throw new AppException(ErrorCode.INVALID_PRODUCT_IMAGE_LIST);
        }
        productImageSet.forEach(image -> image.setProduct(product));

        return new HashSet<>(productImageRepository.saveAll(productImageSet));
    }

    private Pageable createPageableWithPriceSupport(int pageNo, int pageSize, String sortBy) {
        if (StringUtils.hasLength(sortBy)) {
            if (sortBy.equalsIgnoreCase("price-asc") || sortBy.equalsIgnoreCase("price-desc")) {
                String direction = sortBy.split("-")[1].toUpperCase();
                Sort sort = Sort.by(new Sort.Order(Sort.Direction.valueOf(direction), "productVariants.price"));
                return PageRequest.of(pageNo, pageSize, sort);
            }
        }
        return pageableService.createPageable(pageNo, pageSize, sortBy);
    }

    @Scheduled(cron = "0 0 0 */7 * ?")
    public void updateProductRatings() {
        List<Product> productList = productRepository.findAll();
        for (Product product : productList) {
            double avgRating = reviewRepository.getAverageRatingByProductId(product.getId());
            int totalReviews = reviewRepository.getTotalReviewsByProductId(product.getId());
            product.setAverageRating(avgRating);
            product.setTotalReviews(totalReviews);
            productRepository.save(product);
        }
        log.info("Update Products Ratings");
    }
}
