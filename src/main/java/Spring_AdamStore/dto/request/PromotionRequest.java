package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class PromotionRequest {

    @NotBlank(message = "code không được để trống")
    private String code;
    private String description;
    @NotNull(message = "discountPercent không được null")
    @Min(value = 0, message = "Discount percent phải lớn hơn 0")
    @Max(value = 100, message = "Discount percent phải nhỏ hơn hoặc bằng 100")
    private Integer discountPercent;
    @NotNull(message = "startDate không được null")
    private LocalDate startDate;
    @NotNull(message = "endDate không được null")
    private LocalDate endDate;

}
