package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.*;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.TokenResponse;
import Spring_AdamStore.dto.response.UserResponse;
import Spring_AdamStore.entity.ForgotPasswordToken;
import Spring_AdamStore.entity.VerificationCodeEntity;
import Spring_AdamStore.service.AccountRecoveryService;
import Spring_AdamStore.service.AuthService;
import com.nimbusds.jose.JOSEException;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

@Slf4j(topic = "AUTH-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1/auth")
@RestController
public class AuthController {

    private final AuthService authService;
    private final AccountRecoveryService accountRecoveryService;

    @PostMapping("/login")
    public ApiResponse<TokenResponse> authenticate(@Valid @RequestBody LoginRequest request) throws JOSEException {
        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.login(request))
                .message("Login")
                .build();
    }

    @PostMapping("/register")
    public ApiResponse<TokenResponse> register(@Valid @RequestBody RegisterRequest request) throws JOSEException {
        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.CREATED.value())
                .result(authService.register(request))
                .message("Register")
                .build();
    }

    @GetMapping("/myInfo")
    public ApiResponse<UserResponse> getMyInfo(){
        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.getMyInfo())
                .message("My Info")
                .build();
    }

    @PostMapping("/refresh-token")
    public ApiResponse<TokenResponse> refreshToken(@Valid @RequestBody RefreshRequest request) throws ParseException, JOSEException {log.info("Received refresh token: {}", request.getRefreshToken());
        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.refreshToken(request))
                .message("Refresh Token")
                .build();
    }

    @Operation(summary = "Change Password",
            description = "API này được sử dụng để thay đổi password khi user đã đăng nhập")
    @PostMapping("/change-password")
    public ApiResponse<UserResponse> changePassword(@Valid @RequestBody ChangePasswordRequest request){
        authService.changePassword(request.getOldPassword(), request.getNewPassword());
        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.getMyInfo())
                .message("My Info")
                .build();
    }


    @PostMapping("/logout")
    public ApiResponse<Void> logout(@Valid @RequestBody TokenRequest request) throws JOSEException, ParseException {
        authService.logout(request);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Logout")
                .build();
    }

    @Operation(summary = "Forgot Password",
            description = "API này được sử dụng để quên mật khẩu")
    @PostMapping("/forgot-password")
    public ApiResponse<VerificationCodeEntity> forgotPassword(@Valid @RequestBody EmailRequest request) {
        return ApiResponse.<VerificationCodeEntity>builder()
                .code(HttpStatus.OK.value())
                .result(accountRecoveryService.forgotPassword(request))
                .message("Mã xác nhận đã được gửi vào email của bạn")
                .build();
    }

    @PostMapping("/forgot-password/verify-code")
    public ApiResponse<ForgotPasswordToken> verifyCode(@Valid @RequestBody VerifyCodeRequest request) throws JOSEException {
        return ApiResponse.<ForgotPasswordToken>builder()
                .code(HttpStatus.OK.value())
                .result(accountRecoveryService.verifyForgotPasswordCode(request.getEmail(), request.getVerificationCode()))
                .message("Mã xác nhận hợp lệ")
                .build();
    }

    @PostMapping("/forgot-password/reset-password")
    public ApiResponse<Void> resetPassword(@Valid @RequestBody ResetPasswordRequest request) {
        accountRecoveryService.resetPassword(request);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Mật khẩu đã được thay đổi thành công")
                .build();
    }
}
