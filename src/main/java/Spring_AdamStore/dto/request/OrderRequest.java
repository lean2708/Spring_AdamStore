package Spring_AdamStore.dto.request;

import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.dto.validator.EnumPattern;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

import java.util.List;

@Getter
public class OrderRequest {

    @Min(value = 0, message = "addressId phải lớn hơn hoặc bằng 0")
    @NotNull(message = "addressId không được null")
    private Long addressId;

    @NotEmpty(message = "orderItems không được để trống")
    private List<OrderItemRequest> orderItems;

    private Long promotionId;

    @Min(value = 0, message = "shippingFee phải lớn hơn hoặc bằng 0")
    @NotNull(message = "shippingFee không được null")
    private Integer shippingFee;

    @NotNull(message = "paymentMethod không được để trống")
    @EnumPattern(name = "paymentMethod", regexp = "VNPAY|CASH")
    private PaymentMethod paymentMethod;
}
