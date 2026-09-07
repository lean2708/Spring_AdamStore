package Spring_AdamStore.constants;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@ConfigurationProperties(prefix = "oauth2.google")
public class GoogleOAuthProperties {

    private String clientId;

    private String clientSecret;

    private String redirectUri;

    private String grantType;

    private String tokenUrl;

    private String userInfoUrl;
}
