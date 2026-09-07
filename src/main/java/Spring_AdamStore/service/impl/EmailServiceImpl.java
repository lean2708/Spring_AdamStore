package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.event.EmailEvent;
import Spring_AdamStore.service.EmailService;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Email;
import com.sendgrid.helpers.mail.objects.Personalization;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j(topic = "EMAIL-SERVICE")
@RequiredArgsConstructor
@Service
public class EmailServiceImpl implements EmailService {

    private final SendGrid sendGrid;

    @Value("${spring.sendgrid.sender.email}")
    private String fromEmail;

    @Value("${spring.sendgrid.template-id.otp-register}")
    private String templateIdOtpRegister;

    @Value("${spring.sendgrid.template-id.reset-password-verification}")
    private String templateIdResetPasswordVerification;


    @Async
    public void sendTemplateEmail(String toEmail, String subject, String templateId, Map<String, String> dynamicData) {
        try {
            Email from = new Email(fromEmail);
            Email to = new Email(toEmail);

            Mail mail = new Mail();
            mail.setFrom(from);
            mail.setTemplateId(templateId);


            Personalization personalization = new Personalization();
            personalization.addTo(to);

            for (Map.Entry<String, String> entry : dynamicData.entrySet()) {
                personalization.addDynamicTemplateData(entry.getKey(), entry.getValue());
            }
            personalization.addDynamicTemplateData("subject", subject);

            mail.addPersonalization(personalization);

            // Send Email with SendGrid API
            Request request = new Request();
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());

            Response response = sendGrid.api(request);

            if (response.getStatusCode() == 202) {
                log.info("Email sent successfully to {} ", toEmail);
            } else {
                log.error("Failed to send email to {}. StatusCode: {}, Body: {}", toEmail, response.getStatusCode(), response.getBody());
            }
        } catch (IOException e) {
            log.error("Error occurred while sending email to {}: {} - {}", toEmail, e.getClass().getSimpleName(), e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }


    @Override
    @KafkaListener(topics = "email-register", groupId = "adam-email-register-group")
    public void sendOtpRegisterEmail(EmailEvent event) {
        log.info("Sending OTP email for registration to '{}', name='{}'", event.getToEmail(), event.getName());

        Map<String, String> dynamicData = new HashMap<>();
        dynamicData.put("name", event.getName());
        dynamicData.put("otp", event.getVerificationCode());

        sendTemplateEmail(event.getToEmail(),
                "Hoàn tất đăng ký Adam Store - Mã xác thực",
                templateIdOtpRegister,
                dynamicData);
    }


    @KafkaListener(topics = "email-reset-code", groupId = "adam-email-reset-group")
    @Override
    public void sendPasswordResetCode(EmailEvent event) {
        log.info("Sending password reset email to '{}', name='{}'", event.getToEmail(), event.getName());

        Map<String, String> dynamicData = new HashMap<>();
        dynamicData.put("name", event.getName());
        dynamicData.put("verificationCode", event.getVerificationCode());

        sendTemplateEmail(event.getToEmail(),
                "Đặt lại mật khẩu Adam Store - Mã xác thực",
                templateIdResetPasswordVerification,
                dynamicData);
    }
}
