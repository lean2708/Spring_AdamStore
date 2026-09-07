package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.request.ProductRequest;
import Spring_AdamStore.dto.request.ProductUpdateRequest;
import Spring_AdamStore.dto.response.ProductResponse;
import Spring_AdamStore.entity.sql.Product;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, uses = {ProductVariantMapper.class})
public interface ProductMapper {

    Product toProduct(ProductRequest request);

    @Mapping(target = "variants", expression = "java(context.getVariants(product.getId()))")
    @Mapping(target = "images", expression = "java(context.getImages(product.getId()))")
    ProductResponse toProductResponse(Product product, @Context ProductMappingHelper context);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void updateProduct(@MappingTarget Product product, ProductUpdateRequest request);

    List<ProductResponse> toProductResponseList(List<Product> products, @Context ProductMappingHelper context);

    EntityBasic toEntityBasic(Product product);
}
