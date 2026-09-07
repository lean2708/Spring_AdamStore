package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.VerificationType;
import Spring_AdamStore.entity.nosql.RedisVerificationCode;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.nosql.RedisVerificationCodeRepository;
import Spring_AdamStore.service.RedisVerificationCodeService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "VERIFICATION-CODE-SERVICE")
@RequiredArgsConstructor
public class VerificationCodeServiceImpl implements RedisVerificationCodeService {

    private final RedisVerificationCodeRepository redisVerificationCodeRepository;

    @Value("${auth.forgot-password.verification-code.expiration-minutes}")
    private long forgotPasswordExpiration;
    @Value("${auth.register.verification-code.expiration-minutes}")
    private long registerExpiration;


    // redis ghi de theo key (email)
    @Transactional
    public RedisVerificationCode saveVerificationCode(String email, VerificationType type){
        String verificationCode = generateVerificationCode();

        String redisKey = email + ":" + type;

        RedisVerificationCode code = RedisVerificationCode.builder()
                .redisKey(redisKey)
                .email(email)
                .verificationCode(verificationCode)
                .verificationType(type)
                .ttl(getExpirationTimeByType(type) * 60)
                .build();

        return redisVerificationCodeRepository.save(code);
    }

    private Long getExpirationTimeByType(VerificationType type){
        switch (type){
            case REGISTER -> {
                return registerExpiration;
            }
            case FORGOT_PASSWORD -> {
                return forgotPasswordExpiration;
            }
            default -> throw new AppException(ErrorCode.CODE_TYPE_INVALID);
        }
    }

    @Override
    public RedisVerificationCode getVerificationCode(String email, VerificationType type, String verificationCode){
        String redisKey = email + ":" + type;

       RedisVerificationCode redisVerificationCode = redisVerificationCodeRepository
                .findById(redisKey)
                .orElseThrow(() -> new AppException(ErrorCode.VERIFICATION_CODE_NOT_FOUND));

        if (!redisVerificationCode.getVerificationCode().equals(verificationCode)) {
            throw new AppException(ErrorCode.VERIFICATION_CODE_INVALID);
        }

        return redisVerificationCode;
    }

    private String generateVerificationCode() {
        return String.format("%06d", (int) (Math.random() * 1000000));
    }
}
