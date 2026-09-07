package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

import java.util.List;

@Getter
public class ShippingRequest {

    @Min(value = 0, message = "addressId phải lớn hơn hoặc bằng 0")
    @NotNull(message = "addressId không được null")
    private Long addressId;

    @NotEmpty(message = "orderItems không được để trống")
    private List<OrderItemRequest> orderItems;
}
