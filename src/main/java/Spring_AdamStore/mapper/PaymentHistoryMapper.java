package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.response.PaymentHistoryResponse;
import Spring_AdamStore.entity.sql.PaymentHistory;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface PaymentHistoryMapper {

    PaymentHistoryResponse toPaymentHistoryResponse(PaymentHistory paymentHistory);

    List<PaymentHistoryResponse> toPaymentHistoryResponseList(List<PaymentHistory> paymentHistoryList);
}
