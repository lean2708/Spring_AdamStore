package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
public class SizeRequest {

    @NotBlank(message = "name không được để trống")
    private String name;

}
