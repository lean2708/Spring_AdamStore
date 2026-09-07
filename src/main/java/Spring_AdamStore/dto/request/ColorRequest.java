package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class ColorRequest {

    @NotBlank(message = "name không được để trống")
    private String name;

}
