package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PaymentHistoryResponse;
import Spring_AdamStore.entity.sql.Order;
import Spring_AdamStore.entity.sql.PaymentHistory;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.PaymentHistoryMapper;
import Spring_AdamStore.repository.sql.PaymentHistoryRepository;
import Spring_AdamStore.service.PaymentHistoryService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@Slf4j(topic = "PAYMENT-HISTORY-SERVICE")
@RequiredArgsConstructor
public class PaymentHistoryServiceImpl implements PaymentHistoryService {

    private final PaymentHistoryRepository paymentHistoryRepository;
    private final PaymentHistoryMapper paymentHistoryMapper;


    public void savePaymentHistory(Order order, PaymentMethod method) {
        PaymentHistory payment = PaymentHistory.builder()
                .isPrimary(false)
                .paymentMethod(method)
                .totalAmount(order.getTotalPrice())
                .paymentStatus(PaymentStatus.PENDING)
                .paymentTime(LocalDateTime.now())
                .orderId(order.getId())
                .build();

        paymentHistoryRepository.save(payment);
    }

    @Override
    public PageResponse<PaymentHistoryResponse> searchPaymentHistories(Pageable pageable, LocalDateTime startDate, LocalDateTime endDate, PaymentStatus paymentStatus) {
        log.info("Searching PaymentHistories with startDate={}, endDate={}, paymentStatus={}", startDate, endDate, paymentStatus);

        Page<PaymentHistory> paymentHistoryPage = paymentHistoryRepository.searchPaymentHistories(startDate, endDate, paymentStatus, pageable);

        return PageResponse.<PaymentHistoryResponse>builder()
                .page(paymentHistoryPage.getNumber())
                .size(paymentHistoryPage.getSize())
                .totalPages(paymentHistoryPage.getTotalPages())
                .totalItems(paymentHistoryPage.getTotalElements())
                .items(paymentHistoryMapper.toPaymentHistoryResponseList(paymentHistoryPage.getContent()))
                .build();
    }

    @Override
    @Transactional
    public void delete(Long id) {
        log.info("Attempting to delete PaymentHistory with id: {}", id);

        PaymentHistory paymentHistory = paymentHistoryRepository.findById(id)
                .orElseThrow(()-> new AppException(ErrorCode.PAYMENT_HISTORY_NOT_EXISTED));

        paymentHistoryRepository.delete(paymentHistory);
    }

}
