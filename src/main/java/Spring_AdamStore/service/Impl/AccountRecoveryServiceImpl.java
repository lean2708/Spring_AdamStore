package Spring_AdamStore.service.Impl;

import Spring_AdamStore.constants.TokenType;
import Spring_AdamStore.dto.request.EmailRequest;
import Spring_AdamStore.dto.request.ResetPasswordRequest;
import Spring_AdamStore.dto.response.VerificationCodeResponse;
import Spring_AdamStore.entity.ForgotPasswordToken;
import Spring_AdamStore.entity.User;
import Spring_AdamStore.entity.RedisVerificationCode;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.ForgotPasswordTokenRepository;
import Spring_AdamStore.repository.UserRepository;
import Spring_AdamStore.repository.RedisVerificationCodeRepository;
import Spring_AdamStore.service.AccountRecoveryService;
import Spring_AdamStore.service.EmailService;
import Spring_AdamStore.service.TokenService;
import Spring_AdamStore.service.RedisVerificationCodeService;
import com.nimbusds.jose.JOSEException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.jwt.BadJwtException;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.time.LocalDateTime;

import static Spring_AdamStore.constants.VerificationType.FORGOT_PASSWORD;


@Service
@Slf4j(topic = "ACCOUNT-RECOVERY-SERVICE")
@RequiredArgsConstructor
public class AccountRecoveryServiceImpl implements AccountRecoveryService {

    private final UserRepository userRepository;
    private final RedisVerificationCodeRepository redisVerificationCodeRepository;
    private final TokenService tokenService;
    private final ForgotPasswordTokenRepository forgotPasswordTokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;
    private final RedisVerificationCodeService redisVerificationCodeService;

    @Value("${jwt.reset.expiry-in-minutes}")
    private long resetTokenExpiration;


    @Override
    public VerificationCodeResponse forgotPassword(EmailRequest request) {
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));
        try {
            RedisVerificationCode redisVerificationCode = redisVerificationCodeService
                    .saveVerificationCode(user.getEmail(), FORGOT_PASSWORD);
            emailService.sendPasswordResetCode(user, redisVerificationCode.getVerificationCode());

            return VerificationCodeResponse.builder()
                    .email(redisVerificationCode.getEmail())
                    .verificationCode(redisVerificationCode.getVerificationCode())
                    .expirationTime(redisVerificationCode.getExpirationTime())
                    .build();

        } catch (Exception e) {
            log.error("Lỗi gửi email: ", e);
            throw new AppException(ErrorCode.EMAIL_SEND_FAILED);
        }
    }

    @Override
    public ForgotPasswordToken verifyForgotPasswordCode(String email, String verificationCode) throws JOSEException {
        RedisVerificationCode verificationCodeEntity = redisVerificationCodeService
                .getVerificationCode(email, FORGOT_PASSWORD, verificationCode);

        User user = userRepository.findByEmail(email).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));

        String forgotPasswordToken = tokenService.generateToken(user, TokenType.RESET_PASSWORD_TOKEN);
        ForgotPasswordToken token = ForgotPasswordToken.builder()
                .email(email)
                .forgotPasswordToken(forgotPasswordToken)
                .expiryTime(LocalDateTime.now().plusMinutes(resetTokenExpiration))
                .build();

        redisVerificationCodeRepository.delete(verificationCodeEntity);

        return forgotPasswordTokenRepository.save(token);
    }

    @Transactional
    @Override
    public void resetPassword(ResetPasswordRequest request) {
        try {
            tokenService.verifyToken(request.getForgotPasswordToken(), TokenType.RESET_PASSWORD_TOKEN);
        } catch (JOSEException | ParseException e) {
            throw new BadJwtException(e.getMessage());
        } catch (AppException ex){
            throw new BadJwtException("Token không hợp lệ");
        }
        ForgotPasswordToken forgotPasswordToken = forgotPasswordTokenRepository
                .findByForgotPasswordToken(request.getForgotPasswordToken())
                .orElseThrow( () -> new AppException(ErrorCode.FORGOT_PASSWORD_TOKEN_NOT_FOUND));

        User user = userRepository.findByEmail(forgotPasswordToken.getEmail()).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));

        if (!request.getNewPassword().equals(request.getConfirmPassword())) {
            throw new AppException(ErrorCode.PASSWORD_MISMATCH);
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);

        forgotPasswordTokenRepository.delete(forgotPasswordToken);
    }


}
