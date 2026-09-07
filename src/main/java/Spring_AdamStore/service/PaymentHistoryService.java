package Spring_AdamStore.service;

import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PaymentHistoryResponse;
import Spring_AdamStore.entity.sql.Order;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;

public interface PaymentHistoryService {

    void savePaymentHistory(Order order, PaymentMethod method);

    PageResponse<PaymentHistoryResponse> searchPaymentHistories(Pageable pageable,
                                                                LocalDateTime startDate, LocalDateTime endDate,
                                                                PaymentStatus paymentStatus);

    void delete(Long id);

}
