package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.ProductVariantBasic;
import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.entity.Color;
import Spring_AdamStore.entity.ProductImage;
import Spring_AdamStore.entity.ProductVariant;
import org.mapstruct.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface ProductVariantMapper {

    @Named("toSizeSet")
    default Set<EntityBasic> toSizeSet(Set<ProductVariant> productVariants) {
        return new HashSet<>(productVariants.stream()
                .map(pv -> new EntityBasic(pv.getSize().getId(), pv.getSize().getName()))
                .collect(Collectors.toMap(
                        EntityBasic::getId,
                        size -> size,
                        (existing, replacement) -> existing))
                .values());
    }

    @Named("toColorSet")
    default Set<EntityBasic> toColorSet(Set<ProductVariant> productVariants) {
        return new HashSet<>(productVariants.stream()
                .map(pv -> new EntityBasic(pv.getColor().getId(), pv.getColor().getName()))
                .collect(Collectors.toMap(
                        EntityBasic::getId,
                        color -> color,
                        (existing, replacement) -> existing))
                .values());
    }
}
