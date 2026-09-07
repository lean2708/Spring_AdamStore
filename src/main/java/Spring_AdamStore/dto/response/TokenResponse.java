package Spring_AdamStore.dto.response;

import Spring_AdamStore.dto.basic.EntityBasic;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.Set;


@Getter
@Setter
@Builder
public class TokenResponse {

    private String accessToken;
    private String refreshToken;
    private boolean authenticated;
    private String email;

    private Set<EntityBasic> roles;

}
