package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class OrderAddressRequest {

    @Min(value = 0, message = "productVariantId phải lớn hơn hoặc bằng 0")
    @NotNull(message = "productVariantId không được null")
    private Long addressId;

}
