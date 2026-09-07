package Spring_AdamStore.dto.request;


import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
public class TokenRequest {

    @NotBlank(message = "accessToken không được để trống")
    private String accessToken;
}
