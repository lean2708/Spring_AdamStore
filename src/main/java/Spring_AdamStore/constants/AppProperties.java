package Spring_AdamStore.constants;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "app")
@Getter
@Setter
public class AppProperties {

    private Admin admin;
    private String defaultAvatarUrl;

    @Getter
    @Setter
    public static class Admin {
        private String email;
        private String password;
    }
}