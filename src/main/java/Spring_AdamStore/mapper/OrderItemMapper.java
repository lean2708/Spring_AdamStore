package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.response.OrderItemResponse;
import Spring_AdamStore.entity.sql.OrderItem;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface OrderItemMapper {

    @Mapping(target = "productVariant", expression = "java(context.getProductVariantBasic(orderItem.getProductVariantId()))")
    @Mapping(target = "image", expression = "java(context.getImageBasic(orderItem.getProductVariantId()))")
    OrderItemResponse toOrderItemResponse(OrderItem orderItem, @Context OrderItemMappingHelper context);

    List<OrderItemResponse> toOrderItemResponseList(List<OrderItem> orderItemList, @Context OrderItemMappingHelper context);

}
