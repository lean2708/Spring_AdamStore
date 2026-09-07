package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class PromotionUpdateRequest {

    @NotBlank(message = "Code không được để trống")
    private String code;
    private String description;
    @Min(value = 0, message = "Discount percent phải lớn hơn 0")
    @Max(value = 100, message = "Discount percent phải nhỏ hơn hoặc bằng 100")
    private Integer discountPercent;
    private LocalDate startDate;
    private LocalDate endDate;

}
