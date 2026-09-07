package Spring_AdamStore.dto.request;


import jakarta.validation.constraints.NotBlank;
import lombok.Getter;


@Getter
public class RefreshRequest {

    @NotBlank(message = "refreshToken không được để trống")
    private String refreshToken;


}
