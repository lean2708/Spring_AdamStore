package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.ProductVariantBasic;
import Spring_AdamStore.dto.response.ProductVariantResponse;
import Spring_AdamStore.entity.sql.ProductVariant;
import org.mapstruct.*;
import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface ProductVariantMapper {

    @Mapping(target = "color", expression = "java(context.getColor(variant.getColorId()))")
    @Mapping(target = "size", expression = "java(context.getSize(variant.getSizeId()))")
    ProductVariantResponse toProductVariantResponse(ProductVariant variant, @Context VariantMappingHelper context);

    List<ProductVariantResponse> toProductVariantResponseList(List<ProductVariant> productVariantList, @Context VariantMappingHelper context);

    ProductVariantBasic toProductVariantBasic(ProductVariant productVariant);

}
