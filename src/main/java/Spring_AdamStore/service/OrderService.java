package Spring_AdamStore.service;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.dto.request.OrderRequest;
import Spring_AdamStore.dto.request.OrderAddressRequest;
import Spring_AdamStore.dto.response.OrderResponse;
import Spring_AdamStore.dto.response.PageResponse;
import jakarta.validation.constraints.Min;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
import java.util.List;

public interface OrderService {

    OrderResponse create(OrderRequest request);

    OrderResponse fetchDetailById(Long id);

    OrderResponse updateAddress(Long id, OrderAddressRequest request);

    void delete(Long id);

    OrderResponse cancelOrder(Long orderId);

    List<OrderResponse> getOrdersForUser(OrderStatus orderStatus);

    PageResponse<OrderResponse> searchOrdersForAdmin(Pageable pageable, LocalDate startDate, LocalDate endDate, OrderStatus orderStatus);
}
