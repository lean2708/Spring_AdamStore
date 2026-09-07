package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.OrderResponse;
import Spring_AdamStore.dto.response.VNPayResponse;
import jakarta.servlet.http.HttpServletRequest;

public interface PaymentService {

    VNPayResponse processPayment(Long orderId, HttpServletRequest request);

    OrderResponse updateOrderAfterPayment(Long orderId);

    void handleFailedPayment(Long orderId);

    VNPayResponse retryPayment(Long orderId, HttpServletRequest request);
}
