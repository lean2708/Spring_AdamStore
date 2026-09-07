package Spring_AdamStore.client.google;

import Spring_AdamStore.constants.GoogleOAuthProperties;
import Spring_AdamStore.dto.response.GoogleUserResponse;
import Spring_AdamStore.exception.AuthException;
import com.google.common.net.HttpHeaders;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

@Component
@RequiredArgsConstructor
@Slf4j(topic = "GOOGLE-USER-INFO-CLIENT")
public class GoogleUserInfoClient {

    private final RestClient restClient;
    private final GoogleOAuthProperties googleOAuthProperties;


    public GoogleUserResponse getUserInfo(String accessToken) {
        try {

            GoogleUserResponse response = restClient.get()
                            .uri(googleOAuthProperties.getUserInfoUrl())
                            .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                            .retrieve()
                            .body(GoogleUserResponse.class);

            if (response == null) {
                throw new AuthException("Google did not return user information.");
            }

            if (response.getEmail() == null || response.getEmail().isBlank()) {
                throw new AuthException("Google did not return user email.");
            }

            return response;

        } catch (RestClientException exception) {

            log.warn("Failed to get Google user information: {}", exception.getMessage());

            throw new AuthException("Google authentication failed.");
        }
    }
}
