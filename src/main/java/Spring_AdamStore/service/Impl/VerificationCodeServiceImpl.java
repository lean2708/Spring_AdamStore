package Spring_AdamStore.service.Impl;

import Spring_AdamStore.constants.VerificationType;
import Spring_AdamStore.entity.RedisVerificationCode;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.RedisVerificationCodeRepository;
import Spring_AdamStore.service.RedisVerificationCodeService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@Slf4j(topic = "USER-SERVICE")
@RequiredArgsConstructor
public class VerificationCodeServiceImpl implements RedisVerificationCodeService {

    private final RedisVerificationCodeRepository redisVerificationCodeRepository;

    @Value("${app.forgot-password.verification-code.expiration-minutes}")
    private long forgotPasswordExpiration;
    @Value("${app.register.verification-code.expiration-minutes}")
    private long registerExpiration;


    // redis ghi de theo key (email)
    @Transactional
    public RedisVerificationCode saveVerificationCode(String email, VerificationType type){
        String verificationCode = generateVerificationCode();

        LocalDateTime expirationTime = getExpirationTimeByType(type);

        long ttl = java.time.Duration.between(LocalDateTime.now(), expirationTime).getSeconds();

        String redisKey = email + ":" + type;

        RedisVerificationCode code = RedisVerificationCode.builder()
                .redisKey(redisKey)
                .email(email)
                .verificationCode(verificationCode)
                .verificationType(type)
                .expirationTime(expirationTime)
                .ttl(ttl)
                .build();

        return redisVerificationCodeRepository.save(code);
    }

    private LocalDateTime getExpirationTimeByType(VerificationType type){
        switch (type){
            case REGISTER -> {
                return LocalDateTime.now().plusMinutes(registerExpiration);
            }
            case FORGOT_PASSWORD -> {
                return LocalDateTime.now().plusMinutes(forgotPasswordExpiration);
            }
            default -> throw new AppException(ErrorCode.CODE_TYPE_INVALID);
        }
    }

    public RedisVerificationCode getVerificationCode(String email, VerificationType type, String verificationCode){
        String redisKey = email + ":" + type;

       RedisVerificationCode redisVerificationCode = redisVerificationCodeRepository
                .findById(redisKey)
                .orElseThrow(() -> new AppException(ErrorCode.VERIFICATION_CODE_NOT_FOUND));

        if (!redisVerificationCode.getVerificationCode().equals(verificationCode)) {
            throw new AppException(ErrorCode.VERIFICATION_CODE_INVALID);
        }

        if (redisVerificationCode.getExpirationTime().isBefore(LocalDateTime.now())) {
            throw new AppException(ErrorCode.VERIFICATION_CODE_EXPIRED);
        }
        return redisVerificationCode;
    }

    private String generateVerificationCode() {
        return String.format("%06d", (int) (Math.random() * 1000000));
    }
}
