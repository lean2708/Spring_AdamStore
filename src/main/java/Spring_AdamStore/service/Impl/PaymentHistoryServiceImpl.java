package Spring_AdamStore.service.Impl;

import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.constants.RoleEnum;
import Spring_AdamStore.dto.response.OrderResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PaymentHistoryResponse;
import Spring_AdamStore.entity.Order;
import Spring_AdamStore.entity.PaymentHistory;
import Spring_AdamStore.entity.User;
import Spring_AdamStore.mapper.PaymentHistoryMapper;
import Spring_AdamStore.repository.PaymentHistoryRepository;
import Spring_AdamStore.repository.criteria.SearchCriteria;
import Spring_AdamStore.repository.criteria.SearchCriteriaQueryConsumer;
import Spring_AdamStore.service.PageableService;
import Spring_AdamStore.service.PaymentHistoryService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j(topic = "PAYMENT-HISTORY-SERVICE")
@RequiredArgsConstructor
public class PaymentHistoryServiceImpl implements PaymentHistoryService {

    private final PaymentHistoryRepository paymentHistoryRepository;
    private final PageableService pageableService;
    private final PaymentHistoryMapper paymentHistoryMapper;



    @Override
    public PageResponse<PaymentHistoryResponse> searchPaymentHistories(int pageNo, int pageSize, String sortBy, LocalDateTime startDate, LocalDateTime endDate, PaymentStatus paymentStatus) {
        pageNo = pageNo - 1;

        Pageable pageable = pageableService.createPageable(pageNo, pageSize, sortBy, PaymentHistory.class);

        Page<PaymentHistory> paymentHistoryPage = paymentHistoryRepository.searchPaymentHistories(startDate, endDate, paymentStatus, pageable);

        return PageResponse.<PaymentHistoryResponse>builder()
                .page(paymentHistoryPage.getNumber() + 1)
                .size(paymentHistoryPage.getSize())
                .totalPages(paymentHistoryPage.getTotalPages())
                .totalItems(paymentHistoryPage.getTotalElements())
                .items(paymentHistoryMapper.toPaymentHistoryResponseList(paymentHistoryPage.getContent()))
                .build();
    }

}
