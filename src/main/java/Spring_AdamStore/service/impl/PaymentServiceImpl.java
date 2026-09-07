package Spring_AdamStore.service.impl;

import Spring_AdamStore.config.VNPAYConfig;
import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.response.OrderResponse;
import Spring_AdamStore.dto.response.VNPayResponse;
import Spring_AdamStore.entity.sql.Order;
import Spring_AdamStore.entity.sql.PaymentHistory;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.OrderMapper;
import Spring_AdamStore.mapper.OrderMappingHelper;
import Spring_AdamStore.repository.sql.OrderRepository;
import Spring_AdamStore.repository.sql.PaymentHistoryRepository;
import Spring_AdamStore.service.PaymentService;
import Spring_AdamStore.util.VNPayUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;

@Service
@Slf4j(topic = "ORDER-SERVICE")
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

    private final OrderRepository orderRepository;
    private final VNPAYConfig vnPayConfig;
    private final PaymentHistoryRepository paymentHistoryRepository;
    private final OrderMapper orderMapper;
    private final OrderMappingHelper orderMappingHelper;


    @Override
    public VNPayResponse processPayment(Long orderId, HttpServletRequest request) {
        Order order = findOrderById(orderId);

        if (!order.getOrderStatus().equals(OrderStatus.PENDING)) {
            throw new AppException(ErrorCode.INVALID_ORDER_STATUS);
        }

        return VNPayResponse.builder()
                .code("OK")
                .message("Mã thanh toán đã được tạo thành công. Bạn sẽ được chuyển đến cổng thanh toán để hoàn tất giao dịch.")
                .paymentUrl(createVnPayPayment(order, request))
                .build();
    }

    public String createVnPayPayment(Order order, HttpServletRequest request) {
        Map<String, String> vnpParamsMap = vnPayConfig.getVNPayConfig();

        long amount = (long) (100 * order.getTotalPrice());

        vnpParamsMap.put("vnp_Amount", String.valueOf(amount));

        vnpParamsMap.put("vnp_IpAddr", VNPayUtil.getIpAddress(request));

        vnpParamsMap.put("vnp_TxnRef", String.valueOf(order.getId()));
        vnpParamsMap.put("vnp_OrderInfo", "Thanh toan don hang:" + order.getId());

        // Tao chuoi da ma hoa
        String queryUrl = VNPayUtil.getPaymentURL(vnpParamsMap, true);

        // Tao chuoi chua ma hoa
        String hashData = VNPayUtil.getPaymentURL(vnpParamsMap, false);
        // Thêm vnp_SecureHash vào URL
        String vnpSecureHash = VNPayUtil.hmacSHA512(vnPayConfig.getSecretKey(), hashData);

        queryUrl += "&vnp_SecureHash=" + vnpSecureHash;

        // Tao URL Final
        return vnPayConfig.getVnp_PayUrl() + "?" + queryUrl;
    }

    @Override
    @Transactional
    public OrderResponse updateOrderAfterPayment(Long orderId) {
        Order order = findOrderById(orderId);
        order.setOrderStatus(OrderStatus.PROCESSING);

        PaymentHistory paymentHistory = paymentHistoryRepository
                .findByOrderIdAndPaymentStatusAndPaymentMethod(order.getId(), PaymentStatus.PENDING, PaymentMethod.VNPAY)
                .orElseThrow(() -> new AppException(ErrorCode.PAYMENT_HISTORY_NOT_EXISTED));

        paymentHistory.setIsPrimary(true);
        paymentHistory.setPaymentStatus(PaymentStatus.PAID);
        paymentHistory.setPaymentTime(LocalDateTime.now());
        paymentHistoryRepository.save(paymentHistory);

        return orderMapper.toOrderResponse(orderRepository.save(order), orderMappingHelper);
    }

    @Override
    public void handleFailedPayment(Long orderId){
        Order order = findOrderById(orderId);
        PaymentHistory  paymentHistory = paymentHistoryRepository
                .findByOrderIdAndPaymentStatusAndPaymentMethod(order.getId(), PaymentStatus.PENDING, PaymentMethod.VNPAY)
                .orElseThrow(() -> new AppException(ErrorCode.PAYMENT_HISTORY_NOT_EXISTED));

        paymentHistory.setPaymentStatus(PaymentStatus.FAILED);
        paymentHistoryRepository.save(paymentHistory);

    }

    @Override
    public VNPayResponse retryPayment(Long orderId, HttpServletRequest request) {
        Order order = findOrderById(orderId);

        if (!order.getOrderStatus().equals(OrderStatus.PENDING)) {
            throw new AppException(ErrorCode.INVALID_ORDER_STATUS);
        }

        String paymentUrl = createVnPayPayment(order, request);

        paymentHistoryRepository.save(PaymentHistory.builder()
                .isPrimary(false)
                .paymentMethod(PaymentMethod.VNPAY)
                .totalAmount(order.getTotalPrice())
                .paymentStatus(PaymentStatus.PENDING)
                .paymentTime(LocalDateTime.now())
                .orderId(order.getId())
                .build());

        return VNPayResponse.builder()
                .code("OK")
                .message("Mã thanh toán đã được tạo thành công. Bạn sẽ được chuyển đến cổng thanh toán để hoàn tất giao dịch.")
                .paymentUrl(paymentUrl)
                .build();
    }

    private Order findOrderById(Long id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ORDER_NOT_EXISTED));
    }
}
