package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.VariantCreateRequest;
import Spring_AdamStore.dto.request.VariantRequest;
import Spring_AdamStore.dto.request.VariantUpdateRequest;
import Spring_AdamStore.dto.response.ProductVariantResponse;
import Spring_AdamStore.entity.sql.*;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.ProductVariantMapper;
import Spring_AdamStore.mapper.VariantMappingHelper;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.service.CartItemService;
import Spring_AdamStore.service.ProductVariantService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;

@Service
@Slf4j(topic = "PRODUCT-VARIANT-SERVICE")
@RequiredArgsConstructor
public class ProductVariantServiceImpl implements ProductVariantService {

    private final ProductVariantRepository productVariantRepository;
    private final ProductVariantMapper productVariantMapper;
    private final VariantMappingHelper variantMappingHelper;
    private final ProductRepository productRepository;
    private final SizeRepository sizeRepository;
    private final ColorRepository colorRepository;
    private final OrderItemRepository orderItemRepository;
    private final CartItemRepository cartItemRepository;
    private final CartItemService cartItemService;


    @Override
    public ProductVariantResponse findByProductAndColorAndSize(Long productId, Long colorId, Long sizeId){
        log.info("Fetching ProductVariant with productId={}, colorId={}, sizeId={}", productId, colorId, sizeId);

        ProductVariant variant = productVariantRepository
                .findByProductIdAndColorIdAndSizeId(productId, colorId, sizeId)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

        return productVariantMapper.toProductVariantResponse(variant, variantMappingHelper);
    }


    @Override
    public ProductVariantResponse createProductVariant(VariantCreateRequest request) {
        findProductById(request.getProductId());

        Color color = findColorById(request.getColorId());
        Size size = findSizeById(request.getSizeId());

        productVariantRepository
                .findByProductIdAndColorIdAndSizeId(request.getProductId(), request.getColorId(), request.getSizeId())
                .ifPresent(variant -> {throw new AppException(ErrorCode.PRODUCT_VARIANT_EXISTED);});

        ProductVariant variant = ProductVariant.builder()
                .productId(request.getProductId())
                .colorId(color.getId())
                .sizeId(size.getId())
                .price(request.getPrice())
                .quantity(request.getQuantity())
                .isAvailable(true)
                .build();

        productVariantRepository.save(variant);

        updateMinMaxPriceForProduct(request.getProductId());

        return productVariantMapper.toProductVariantResponse(variant, variantMappingHelper);
    }


    @Override
    @Transactional
    public ProductVariantResponse updatePriceAndQuantity(Long id, VariantUpdateRequest request) {
        log.info("Updating ProductVariant id={} with price={}, quantity={}", id, request.getPrice(), request.getQuantity());

        ProductVariant productVariant = productVariantRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

        productVariant.setPrice(request.getPrice());
        productVariant.setQuantity(request.getQuantity());
        productVariantRepository.save(productVariant);

        updateMinMaxPriceForProduct(productVariant.getProductId());

        return productVariantMapper.toProductVariantResponse(productVariant, variantMappingHelper);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        log.info("Attempting to delete ProductVariant id={}", id);

        ProductVariant productVariant = productVariantRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

        if(orderItemRepository.existsByProductVariantId(productVariant.getId())){
            throw new AppException(ErrorCode.PRODUCT_VARIANT_USED_IN_ORDER);
        }

        List<CartItem> cartItemList = cartItemRepository.findAllByProductVariantId(id);
        cartItemList.forEach(cartItem -> cartItemService.delete(cartItem.getId()));

        productVariantRepository.delete(productVariant);
    }

    @Override
    public ProductVariantResponse restore(long id) {
        log.info("Restoring ProductVariant id={}", id);

        ProductVariant productVariant = productVariantRepository.findProductVariantById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

        productVariant.setStatus(ACTIVE);
        return productVariantMapper.toProductVariantResponse(productVariantRepository.save(productVariant), variantMappingHelper);
    }

    @Override
    @Transactional
    public Set<ProductVariant> saveVariantByProduct(Long productId, List<VariantRequest> variantRequests) {
        Set<ProductVariant> variantSet = new HashSet<>();

        for (VariantRequest request : variantRequests) {
            Color color = findColorById(request.getColorId());
            Size size = findSizeById(request.getSizeId());

            ProductVariant variant = ProductVariant.builder()
                    .productId(productId)
                    .colorId(color.getId())
                    .sizeId(size.getId())
                    .price(request.getPrice())
                    .quantity(request.getQuantity())
                    .isAvailable(true)
                    .build();

            variantSet.add(variant);
        }

        return new HashSet<>(productVariantRepository.saveAll(variantSet));
    }


    @Override
    public List<ProductVariant> findAllProductVariantByProductId(Long id) {
        return productVariantRepository.findAllByProductId(id);
    }

    private Color findColorById(Long id) {
        return colorRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.COLOR_NOT_EXISTED));
    }

    private Size findSizeById(Long id) {
        return sizeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.SIZE_NOT_EXISTED));
    }

    private Product findProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_NOT_EXISTED));
    }

    private void updateMinMaxPriceForProduct(Long productId){
        Product product = findProductById(productId);

        product.setMaxPrice(productVariantRepository.findMaxPriceByProductId(product.getId()));
        product.setMinPrice(productVariantRepository.findMinPriceByProductId(product.getId()));

        productRepository.save(product);
    }

}
