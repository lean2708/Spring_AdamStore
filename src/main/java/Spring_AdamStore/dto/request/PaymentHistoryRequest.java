package Spring_AdamStore.dto.request;

import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.validator.EnumPattern;
import lombok.Getter;

@Getter
public class PaymentHistoryRequest {

    private String paymentMethod;
    private Double totalAmount;
    @EnumPattern(name = "paymentStatus", regexp = "PAID|REFUNDED|CANCELED")
    private PaymentStatus paymentStatus;
    private String note;


}
