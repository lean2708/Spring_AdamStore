package Spring_AdamStore.client.google;

import Spring_AdamStore.constants.GoogleOAuthProperties;
import Spring_AdamStore.dto.response.GoogleTokenResponse;
import Spring_AdamStore.exception.AuthException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

@Component
@RequiredArgsConstructor
@Slf4j(topic = "GOOGLE-AUTH-CLIENT")
public class GoogleAuthClient {

    private final RestClient restClient;
    private final GoogleOAuthProperties googleOAuthProperties;


    public GoogleTokenResponse exchangeToken(String code) {

        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();

        formData.add("code", code);
        formData.add("client_id", googleOAuthProperties.getClientId());
        formData.add("client_secret", googleOAuthProperties.getClientSecret());
        formData.add("redirect_uri", googleOAuthProperties.getRedirectUri());
        formData.add("grant_type", googleOAuthProperties.getGrantType());

        try {

            GoogleTokenResponse response = restClient.post()
                            .uri(googleOAuthProperties.getTokenUrl())
                            .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                            .body(formData)
                            .retrieve()
                            .body(GoogleTokenResponse.class);

            if (response == null || response.getAccessToken() == null || response.getAccessToken().isBlank()) {
                throw new AuthException("Google did not return an access token.");
            }

            return response;

        } catch (RestClientException exception) {

            log.warn("Google authorization-code exchange failed: {}", exception.getMessage());

            throw new AuthException("Google authentication failed.");
        }
    }
}