package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class CartItemUpdateRequest {

    @NotNull(message = "colorId không được null")
    private Long colorId;

    @NotNull(message = "sizeId không được null")
    private Long sizeId;

    private Integer quantity;

}
