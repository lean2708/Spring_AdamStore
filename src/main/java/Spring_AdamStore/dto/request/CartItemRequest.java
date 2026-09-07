package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class CartItemRequest {

    @Min(value = 1, message = "productVariantId phải lớn hơn 0")
    @NotNull(message = "productVariantId không được null")
    private Long productVariantId;

    @Min(value = 1, message = "quantity phải lớn hơn 0")
    @NotNull(message = "quantity không được null")
    private Integer quantity;

}
