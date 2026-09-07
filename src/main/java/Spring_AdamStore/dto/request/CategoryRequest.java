package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class CategoryRequest {

    @NotBlank(message = "name không được để trống")
    private String name;

    @NotBlank(message = "image không được để trống")
    private String imageUrl;
}
