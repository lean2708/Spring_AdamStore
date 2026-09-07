package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;

import java.util.List;

@Getter
public class ReviewRequest {

    @NotNull(message = "Rating không được để trống")
    @Min(value = 1, message = "Rating phải lớn hơn hoặc bằng 1")
    @Max(value = 5, message = "Rating phải nhỏ hơn hoặc bằng 5")
    private Double rating;
    @NotBlank(message = "comment không được để trống")
    private String comment;

    private List<String> imageUrls;

    @NotNull(message = "orderItemId không được để trống")
    @Min(value = 1, message = "orderItemId phải lớn hơn 0")
    private Long orderItemId;
}
