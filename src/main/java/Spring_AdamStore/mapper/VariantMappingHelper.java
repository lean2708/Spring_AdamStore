package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.ImageBasic;
import Spring_AdamStore.dto.basic.ProductVariantBasic;
import Spring_AdamStore.entity.sql.ProductVariant;
import Spring_AdamStore.repository.sql.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class VariantMappingHelper {

    private final SizeRepository sizeRepository;
    private final ColorRepository colorRepository;
    private final ProductVariantRepository productVariantRepository;
    private final ProductRepository productRepository;
    private final FileRepository fileRepository;

    public ProductVariantBasic getProductVariantBasic(Long variantId){
        return productVariantRepository.findById(variantId)
                .map(variant -> ProductVariantBasic.builder()
                        .id(variant.getId())
                        .color(getColor(variant.getColorId()))
                        .size(getSize(variant.getSizeId()))
                        .product(getProduct(variant.getProductId()))
                        .build())
                .orElse(null);
    }


    public ImageBasic getImageBasic(Long variantId){
        Long productId = productVariantRepository.findById(variantId)
                .map(ProductVariant::getProductId)
                .orElse(null);

        return fileRepository.findAllByProductId(productId)
                .stream().map(file -> new ImageBasic(file.getId(), file.getImageUrl()))
                .findFirst()
                .orElse(null);
    }


    public EntityBasic getSize(Long sizeId){
        return sizeRepository.findById(sizeId)
                .map(size -> new EntityBasic(size.getId(), size.getName()))
                .orElse(null);
    }

    public EntityBasic getColor(Long colorId){
        return colorRepository.findById(colorId)
                .map(color -> new EntityBasic(color.getId(), color.getName()))
                .orElse(null);
    }

    public EntityBasic getProduct(Long productId){
        return productRepository.findById(productId)
                .map(product -> new EntityBasic(product.getId(), product.getName()))
                .orElse(null);
    }


}
