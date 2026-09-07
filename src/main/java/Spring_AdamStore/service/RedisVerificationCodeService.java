package Spring_AdamStore.service;

import Spring_AdamStore.constants.VerificationType;
import Spring_AdamStore.entity.nosql.RedisVerificationCode;

public interface RedisVerificationCodeService {

    RedisVerificationCode saveVerificationCode(String email, VerificationType type);

    RedisVerificationCode getVerificationCode(String email, VerificationType type, String verificationCode);
}
