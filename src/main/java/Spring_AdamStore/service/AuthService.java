package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.*;
import Spring_AdamStore.dto.response.TokenResponse;
import Spring_AdamStore.dto.response.UserResponse;
import com.nimbusds.jose.JOSEException;

import java.text.ParseException;

public interface AuthService {

    TokenResponse login(LoginRequest request) throws JOSEException;

    TokenResponse register(RegisterRequest request) throws JOSEException;

    UserResponse getMyInfo();

    TokenResponse refreshToken(RefreshRequest request) throws ParseException, JOSEException;

    void changePassword(ChangePasswordRequest request);

    void logout(TokenRequest request) throws ParseException, JOSEException;

    String getCurrentUsername();
}
