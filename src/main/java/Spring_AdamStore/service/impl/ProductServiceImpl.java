package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.ProductRequest;
import Spring_AdamStore.dto.request.ProductUpdateRequest;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.FileEntity;
import Spring_AdamStore.entity.sql.Product;
import Spring_AdamStore.entity.sql.ProductVariant;
import Spring_AdamStore.entity.sql.Review;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.*;
import Spring_AdamStore.repository.criteria.SearchCriteriaQueryConsumer;
import Spring_AdamStore.repository.criteria.SearchCriteria;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.service.ProductService;
import Spring_AdamStore.service.ProductVariantService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.*;
import jakarta.persistence.criteria.Order;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;

@Service
@Slf4j(topic = "PRODUCT-SERVICE")
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductMapper productMapper;
    private final ReviewRepository reviewRepository;
    private final ProductMappingHelper productMappingHelper;
    private final VariantMappingHelper variantMappingHelper;
    private final CategoryRepository categoryRepository;
    private final ReviewMapper reviewMapper;
    private final ProductVariantService productVariantService;
    private final ProductVariantRepository productVariantRepository;
    private final ProductVariantMapper productVariantMapper;
    private final FileRepository fileRepository;
    private final ReviewMappingHelper reviewMappingHelper;
    @PersistenceContext
    private EntityManager entityManager;


    @Transactional
    @Override
    public ProductResponse create(ProductRequest request) {
        log.info("Creating product with data= {}", request);

        if(productRepository.countByName(request.getName()) > 0){
            throw new AppException(ErrorCode.PRODUCT_EXISTED);
        }

        findCategoryById(request.getCategoryId());

        Product product = productMapper.toProduct(request);

        productRepository.save(product);

        // Save Image
        assignImagesToProduct(product.getId(), request.getImageIds());

        productVariantService.saveVariantByProduct(product.getId(), request.getVariants());

        product.setMaxPrice(productVariantRepository.findMaxPriceByProductId(product.getId()));
        product.setMinPrice(productVariantRepository.findMinPriceByProductId(product.getId()));

        return productMapper.toProductResponse(productRepository.save(product), productMappingHelper);
    }

    @Override
    public ProductResponse fetchDetailById(Long id) {
        log.info("Fetch product By Id: {}", id);

        Product product = findProductById(id);

        return productMapper.toProductResponse(product, productMappingHelper);
    }

    @Override
    public PageResponse<ProductResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All Products For User");

        Page<Product> productPage = productRepository.findAll(pageable);

        return PageResponse.<ProductResponse>builder()
                .page(productPage.getNumber())
                .size(productPage.getSize())
                .totalPages(productPage.getTotalPages())
                .totalItems(productPage.getTotalElements())
                .items(productMapper.toProductResponseList(productPage.getContent(), productMappingHelper))
                .build();
    }

    @Override
    public PageResponse<ProductResponse> fetchAllProductsForAdmin(Pageable pageable) {
        log.info("Fetch All Products For Admin");

        Page<Product> productPage = productRepository.findAllProducts(pageable);

        return PageResponse.<ProductResponse>builder()
                .page(productPage.getNumber())
                .size(productPage.getSize())
                .totalPages(productPage.getTotalPages())
                .totalItems(productPage.getTotalElements())
                .items(productMapper.toProductResponseList(productPage.getContent(), productMappingHelper))
                .build();
    }

    @Transactional
    @Override
    public ProductResponse update(Long id, ProductUpdateRequest request) {
        log.info("Updated address with data= {}", request);

        Product product = findProductById(id);

        if (request.getName() != null && !request.getName().equals(product.getName())
                && productRepository.countByName(request.getName()) > 0) {
                throw new AppException(ErrorCode.PRODUCT_EXISTED);
        }
        // Category
        if (request.getCategoryId() != null) {
            findCategoryById(request.getCategoryId());
        }

        productMapper.updateProduct(product, request);

        // Update Image
        if(!CollectionUtils.isEmpty(request.getImageIds())){
            unlinkOldImages(product.getId());

            assignImagesToProduct(product.getId(), request.getImageIds());
        }

        return productMapper.toProductResponse(productRepository.save(product), productMappingHelper);
    }

    @Transactional
    @Override
    public void delete(Long id) {
        log.info("Deleting product id={}", id);

        Product product = findProductById(id);

        List<ProductVariant> productVariantList = productVariantService.findAllProductVariantByProductId(id);
        productVariantList.forEach(productVariant ->
                productVariantService.delete(productVariant.getId()));

        productRepository.delete(product);
    }

    @Override
    public ProductResponse restore(long id) {
        log.info("Restoring product id={}", id);

        Product product = productRepository.findProductById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_EXISTED));

        product.setStatus(ACTIVE);

        // Variant
        List<ProductVariant> variantList = productVariantRepository.getAllByProductId(id);
        variantList.forEach(variant -> productVariantService.restore(variant.getId()));

        return productMapper.toProductResponse(productRepository.save(product), productMappingHelper);
    }

    @Override
    public PageResponse<ProductVariantResponse> getVariantsByProductIdForAdmin(Pageable pageable, Long productId) {
        log.info("Fetching all variants for product id={} (admin) with pageable={}", productId, pageable);

        Page<ProductVariant> productVariantPage = productVariantRepository.findAllVariantsByProductId(productId, pageable);

        return PageResponse.<ProductVariantResponse>builder()
                .page(productVariantPage.getNumber())
                .size(productVariantPage.getSize())
                .totalPages(productVariantPage.getTotalPages())
                .totalItems(productVariantPage.getTotalElements())
                .items(productVariantMapper.toProductVariantResponseList(productVariantPage.getContent(), variantMappingHelper))
                .build();
    }


    @Override
    public PageResponse<ProductResponse> searchProduct(Pageable pageable, List<String> search) {
        log.info("Searching products with pageable={} and search params={}", pageable, search);

       List<SearchCriteria> criteriaList = new ArrayList<>();

        // lay danh sach cac dieu kien search
        if(search != null){
            for(String s : search){
                Pattern pattern = Pattern.compile("(\\w+?)(~|>|<|=)(.*)");
                Matcher matcher = pattern.matcher(s);
                if(matcher.find()){
                    criteriaList.add(new SearchCriteria(matcher.group(1), matcher.group(2), matcher.group(3)));
                }
            }
        }

        List<Product> productList = getProducList(pageable, criteriaList);

        // tong so phan tu
        Long totalElements = getTotalElements(criteriaList);
        int totalPages = (int) Math.ceil((double) totalElements / pageable.getPageSize());

        return PageResponse.<ProductResponse>builder()
                .page(pageable.getPageNumber())
                .size(pageable.getPageSize())
                .totalPages(totalPages)
                .totalItems(totalElements)
                .items(productMapper.toProductResponseList(productList, productMappingHelper))
                .build();
    }


    private List<Product> getProducList(Pageable pageable, List<SearchCriteria> criteriaList){
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        if(!CollectionUtils.isEmpty(criteriaList)){ // search job

            for (SearchCriteria sc : criteriaList) {
                // If colorId
                if ("colorId".equalsIgnoreCase(sc.getKey())) {
                    // Subquery
                    Subquery<Long> subquery = query.subquery(Long.class);
                    Root<ProductVariant> variantRoot = subquery.from(ProductVariant.class);

                    subquery.select(variantRoot.get("productId"))
                            .where(builder.equal(variantRoot.get("colorId"), Long.valueOf(sc.getValue().toString())));

                    predicate = builder.and(predicate, root.get("id").in(subquery));

                } else { // Cac attribute product
                    SearchCriteriaQueryConsumer queryConsumer = new SearchCriteriaQueryConsumer(builder, predicate, root);
                    queryConsumer.accept(sc);
                    predicate = builder.and(predicate, queryConsumer.getPredicate());
                }
            }
        }

        query.where(predicate).distinct(true); // Tranh trung product do nhieu variant

        // Sort
        List<Order> orders = new ArrayList<>();
        for (Sort.Order order : pageable.getSort()) {
            String property = order.getProperty();

            Path<?> path = root.get(property);
            orders.add(order.isAscending() ? builder.asc(path) : builder.desc(path));
        }

        query.orderBy(orders);

        return entityManager.createQuery(query)
                .setFirstResult((int) pageable.getOffset())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
    }



    private Long getTotalElements(List<SearchCriteria> criteriaList){
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);

        Root<Product> root = countQuery.from(Product.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        if(!CollectionUtils.isEmpty(criteriaList)){ // search job
            for (SearchCriteria sc : criteriaList) {
                // If colorId
                if ("colorId".equalsIgnoreCase(sc.getKey())) {
                    Subquery<Long> subquery = countQuery.subquery(Long.class);
                    Root<ProductVariant> variantRoot = subquery.from(ProductVariant.class);

                    subquery.select(variantRoot.get("productId"))
                            .where(builder.equal(variantRoot.get("colorId"), Long.valueOf(sc.getValue().toString())));

                    predicate = builder.and(predicate, root.get("id").in(subquery));

                } else { // Cac attribute product
                    SearchCriteriaQueryConsumer queryConsumer = new SearchCriteriaQueryConsumer(builder, predicate, root);
                    queryConsumer.accept(sc);
                    predicate = builder.and(predicate, queryConsumer.getPredicate());
                }
            }
        }

        countQuery.select(builder.count(root));
        countQuery.where(predicate);

        return entityManager.createQuery(countQuery).getSingleResult();
    }

    @Override
    public PageResponse<ReviewResponse> fetchReviewsByProductId(Pageable pageable, Long productId) {
        log.info("Fetching reviews for productId={} with pageable={}", productId, pageable);

        Product product = findProductById(productId);

        Page<Review> reviewPage = reviewRepository.findAllByProductId(product.getId(), pageable);

        return PageResponse.<ReviewResponse>builder()
                .page(reviewPage.getNumber())
                .size(reviewPage.getSize())
                .totalPages(reviewPage.getTotalPages())
                .totalItems(reviewPage.getTotalElements())
                .items(reviewMapper.toReviewResponseList(reviewPage.getContent(), reviewMappingHelper))
                .build();
    }


    private void findCategoryById(Long id){
        categoryRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CATEGORY_NOT_EXISTED));
    }

    private Product findProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_EXISTED));
    }

    private void assignImagesToProduct(Long productId, List<Long> imageIds) {
        List<FileEntity> fileList = fileRepository.findAllByIdIn(imageIds);

        fileList.forEach(file -> file.setProductId(productId));

        fileRepository.saveAll(fileList);
    }

    private void unlinkOldImages(Long productId){
        List<FileEntity> currentImages = fileRepository.findAllByProductId(productId);

        currentImages.forEach(fileEntity -> fileEntity.setProductId(null));

        fileRepository.saveAll(currentImages);
    }




}
