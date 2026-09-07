package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
public class VerifyCodeRequest {

    @NotBlank(message = "Email không được để trống")
    @Pattern(regexp = "^[A-Za-z0-9._%+-]+@gmail\\.com$", message = "Email phải có định dạng hợp lệ")
    private String email;

    @NotBlank(message = "VerificationCode không được để trống")
    @Pattern(regexp = "^\\d{6}$", message = "Mã xác nhận phải có đúng 6 chữ số")
    private String verificationCode;
}
