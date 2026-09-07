package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.*;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.TokenResponse;
import Spring_AdamStore.dto.response.UserResponse;
import Spring_AdamStore.dto.response.VerificationCodeResponse;
import Spring_AdamStore.entity.nosql.RedisForgotPasswordToken;
import Spring_AdamStore.service.AccountRecoveryService;
import Spring_AdamStore.service.AuthService;
import com.nimbusds.jose.JOSEException;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

@Slf4j(topic = "AUTH-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class AuthController {

    private final AuthService authService;
    private final AccountRecoveryService accountRecoveryService;

    @Operation(
            summary = "Login with Google",
            description = "Exchange Google authorization code and generate FlyGo access and refresh tokens."
    )
    @PostMapping("/public/auth/google")
    public ApiResponse<TokenResponse> loginWithGoogle(
            @RequestParam("code") @NotBlank(message = "Google authorization code is required.")
            String code) throws JOSEException {

        TokenResponse response = authService.loginWithGoogle(code);

        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Login with Google successfully.")
                .result(response)
                .build();
    }


    @PostMapping("/public/auth/login")
    public ApiResponse<TokenResponse> login(@Valid @RequestBody LoginRequest request) throws JOSEException {
        log.info("Received login request for email: {}", request.getEmail());

        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.login(request))
                .message("Login")
                .build();
    }

    @PostMapping("/public/auth/register")
    public ApiResponse<VerificationCodeResponse> register(@Valid @RequestBody RegisterRequest request) throws JOSEException {
        log.info("Received registration request for email: {}", request.getEmail());

        return ApiResponse.<VerificationCodeResponse>builder()
                .code(HttpStatus.CREATED.value())
                .result(authService.register(request))
                .message("Mã xác thực đã được gửi đến email của bạn. Vui lòng kiểm tra email và xác thực để hoàn tất quá trình đăng ký")
                .build();
    }

    @PostMapping("/public/auth/register/verify")
    public ApiResponse<TokenResponse> verifyCodeAndRegister(@Valid @RequestBody VerifyCodeRequest request) throws JOSEException {
        log.info("Received registration code verification for email: {}", request.getEmail());

        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.CREATED.value())
                .result(authService.verifyCodeAndRegister(request))
                .message("Đăng ký thành công")
                .build();
    }

    @GetMapping("/private/auth/myInfo")
    public ApiResponse<UserResponse> getMyInfo(){
        log.info("Received request to fetch current user info");

        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.getMyInfo())
                .message("My Info")
                .build();
    }

    @PostMapping("/public/auth/refresh-token")
    public ApiResponse<TokenResponse> refreshToken(@Valid @RequestBody RefreshRequest request) throws ParseException, JOSEException {log.info("Received refresh token: {}", request.getRefreshToken());
        log.info("Refreshing token for refreshToken");

        return ApiResponse.<TokenResponse>builder()
                .code(HttpStatus.OK.value())
                .result(authService.refreshToken(request))
                .message("Refresh Token")
                .build();
    }

    @Operation(summary = "Change Password",
            description = "API này được sử dụng để thay đổi password khi user đã đăng nhập")
    @PutMapping("/private/auth/change-password")
    public ApiResponse<Void> changePassword(@Valid @RequestBody ChangePasswordRequest request){
        log.info("Received change password request for user");

        authService.changePassword(request);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Password changed successfully")
                .build();
    }


    @PostMapping("/private/auth/logout")
    public ApiResponse<Void> logout(@Valid @RequestBody TokenRequest request) throws JOSEException, ParseException {
        log.info("Received logout request");

        authService.logout(request);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Logout")
                .build();
    }

    @Operation(summary = "Forgot Password",
            description = "API này được sử dụng để quên mật khẩu")
    @PostMapping("/public/auth/forgot-password")
    public ApiResponse<VerificationCodeResponse> forgotPassword(@Valid @RequestBody EmailRequest request) {
        log.info("Received forgot password request for email: {}", request.getEmail());

        return ApiResponse.<VerificationCodeResponse>builder()
                .code(HttpStatus.OK.value())
                .result(accountRecoveryService.forgotPassword(request))
                .message("Mã xác nhận đã được gửi vào email của bạn. Vui lòng kiểm tra để hoàn tất quá trình lấy lại mật khẩu")
                .build();
    }

    @PostMapping("/public/auth/forgot-password/verify-code")
    public ApiResponse<RedisForgotPasswordToken> verifyForgotPasswordCode(@Valid @RequestBody VerifyCodeRequest request) throws JOSEException {
        log.info("Received verifying forgot password code for email: {}", request.getEmail());

        return ApiResponse.<RedisForgotPasswordToken>builder()
                .code(HttpStatus.OK.value())
                .result(accountRecoveryService.verifyForgotPasswordCode(request.getEmail(), request.getVerificationCode()))
                .message("Mã xác nhận hợp lệ")
                .build();
    }

    @PostMapping("/public/auth/forgot-password/reset-password")
    public ApiResponse<Void> resetPassword(@Valid @RequestBody ResetPasswordRequest request) {
        log.info("Received password reset request");

        accountRecoveryService.resetPassword(request);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Mật khẩu đã được thay đổi thành công")
                .build();
    }
}
