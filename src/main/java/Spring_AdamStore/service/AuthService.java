package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.*;
import Spring_AdamStore.dto.response.TokenResponse;
import Spring_AdamStore.dto.response.UserResponse;
import Spring_AdamStore.dto.response.VerificationCodeResponse;
import com.nimbusds.jose.JOSEException;
import jakarta.validation.constraints.NotBlank;

import java.text.ParseException;

public interface AuthService {

    TokenResponse login(LoginRequest request) throws JOSEException;

    VerificationCodeResponse register(RegisterRequest request) throws JOSEException;

    TokenResponse verifyCodeAndRegister(VerifyCodeRequest request) throws JOSEException;

    UserResponse getMyInfo();

    TokenResponse refreshToken(RefreshRequest request) throws ParseException, JOSEException;

    void changePassword(ChangePasswordRequest request);

    void logout(TokenRequest request) throws ParseException, JOSEException;


    TokenResponse loginWithGoogle(String code) throws JOSEException;
}
