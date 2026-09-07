package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;

@Getter
public class AddressRequest {

    @NotNull(message = "isDefault không được để trống")
    private Boolean isDefault;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^0[35789]\\d{8}$", message = "Số điện thoại phải có 10 số và bắt đầu bằng 0")
    private String phone;

    @NotBlank(message = "streetDetail không được để trống")
    private String streetDetail;

    @NotBlank(message = "wardId không được để trống")
    private String wardCode;

    @NotNull(message = "districtId không được để trống")
    @Min(value = 1, message = "districtId phải lớn hơn 0")
    private Integer districtId;

    @NotNull(message = "provinceId không được để trống")
    @Min(value = 1, message = "provinceId phải lớn hơn 0")
    private Integer provinceId;
}
