package Spring_AdamStore.service;

import Spring_AdamStore.dto.event.EmailEvent;

public interface EmailService {

    void sendOtpRegisterEmail(EmailEvent event);

    void sendPasswordResetCode(EmailEvent event);
}
