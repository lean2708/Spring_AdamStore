package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.EmailRequest;
import Spring_AdamStore.dto.request.ResetPasswordRequest;
import Spring_AdamStore.dto.response.VerificationCodeResponse;
import Spring_AdamStore.entity.nosql.RedisForgotPasswordToken;
import com.nimbusds.jose.JOSEException;

public interface AccountRecoveryService {

    VerificationCodeResponse forgotPassword(EmailRequest request);

    RedisForgotPasswordToken verifyForgotPasswordCode(String email, String verificationCode) throws JOSEException;

    void resetPassword(ResetPasswordRequest request);
}
