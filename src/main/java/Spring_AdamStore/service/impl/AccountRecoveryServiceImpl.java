package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.TokenType;
import Spring_AdamStore.dto.event.EmailEvent;
import Spring_AdamStore.dto.request.EmailRequest;
import Spring_AdamStore.dto.request.ResetPasswordRequest;
import Spring_AdamStore.dto.response.VerificationCodeResponse;
import Spring_AdamStore.entity.nosql.RedisForgotPasswordToken;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.entity.nosql.RedisVerificationCode;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.nosql.RedisForgotPwdTokenRepository;
import Spring_AdamStore.repository.sql.UserRepository;
import Spring_AdamStore.repository.nosql.RedisVerificationCodeRepository;
import Spring_AdamStore.service.AccountRecoveryService;
import Spring_AdamStore.service.EmailService;
import Spring_AdamStore.service.TokenService;
import Spring_AdamStore.service.RedisVerificationCodeService;
import com.nimbusds.jose.JOSEException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.jwt.BadJwtException;
import org.springframework.stereotype.Service;

import java.text.ParseException;

import static Spring_AdamStore.constants.VerificationType.FORGOT_PASSWORD;


@Service
@Slf4j(topic = "ACCOUNT-RECOVERY-SERVICE")
@RequiredArgsConstructor
public class AccountRecoveryServiceImpl implements AccountRecoveryService {

    private final UserRepository userRepository;
    private final EmailService emailService;
    private final RedisVerificationCodeRepository redisVerificationCodeRepository;
    private final TokenService tokenService;
    private final RedisForgotPwdTokenRepository redisForgotPwdTokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final RedisVerificationCodeService redisVerificationCodeService;
    private final KafkaTemplate<String, Object> kafkaTemplate;

    @Value("${jwt.reset.expiry-in-minutes}")
    private long resetTokenExpiration;


    @Override
    public VerificationCodeResponse forgotPassword(EmailRequest request) {
        log.info("Forgot password requested for email: {}", request.getEmail());

        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));

        RedisVerificationCode redisVerificationCode = redisVerificationCodeService
                    .saveVerificationCode(user.getEmail(), FORGOT_PASSWORD);

        // Kafka
        kafkaTemplate.send("email-reset-code", EmailEvent.builder()
                .toEmail(user.getEmail())
                .name(user.getName())
                .verificationCode(redisVerificationCode.getVerificationCode())
                .build());

        return VerificationCodeResponse.builder()
                .email(redisVerificationCode.getEmail())
                .verificationCode(redisVerificationCode.getVerificationCode())
                .ttl(redisVerificationCode.getTtl())
                .build();

    }

    @Override
    public RedisForgotPasswordToken verifyForgotPasswordCode(String email, String verificationCode) throws JOSEException {
        log.info("Verifying forgot password code for email: {}", email);

        RedisVerificationCode redisVerificationCode = redisVerificationCodeService
                .getVerificationCode(email, FORGOT_PASSWORD, verificationCode);

        User user = userRepository.findByEmail(email).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));

        String forgotPasswordToken = tokenService.generateToken(user, TokenType.RESET_PASSWORD_TOKEN);

        RedisForgotPasswordToken token = RedisForgotPasswordToken.builder()
                .forgotPasswordToken(forgotPasswordToken)
                .email(email)
                .ttl(resetTokenExpiration * 60)
                .build();

        redisVerificationCodeRepository.delete(redisVerificationCode);

        return redisForgotPwdTokenRepository.save(token);
    }

    @Transactional
    @Override
    public void resetPassword(ResetPasswordRequest request) {
        log.info("Resetting password");

        try {
            tokenService.verifyToken(request.getForgotPasswordToken(), TokenType.RESET_PASSWORD_TOKEN);
        } catch (JOSEException | ParseException e) {
            throw new BadJwtException(e.getMessage());
        } catch (AppException ex){
            throw new BadJwtException("Token không hợp lệ");
        }

        RedisForgotPasswordToken redisForgotPasswordToken = redisForgotPwdTokenRepository
                .findById(request.getForgotPasswordToken())
                .orElseThrow( () -> new AppException(ErrorCode.FORGOT_PASSWORD_TOKEN_NOT_FOUND));

        User user = userRepository.findByEmail(redisForgotPasswordToken.getEmail()).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));

        if (!request.getNewPassword().equals(request.getConfirmPassword())) {
            throw new AppException(ErrorCode.PASSWORD_MISMATCH);
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);

        redisForgotPwdTokenRepository.delete(redisForgotPasswordToken);
    }


}
