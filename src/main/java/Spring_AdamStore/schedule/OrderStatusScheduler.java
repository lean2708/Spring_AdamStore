package Spring_AdamStore.schedule;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.entity.sql.Order;
import Spring_AdamStore.entity.sql.PaymentHistory;
import Spring_AdamStore.repository.sql.OrderRepository;
import Spring_AdamStore.repository.sql.PaymentHistoryRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static Spring_AdamStore.constants.OrderStatus.PENDING;

@Slf4j(topic = "ORDER-STATUS-SCHEDULER")
@Component
@RequiredArgsConstructor
public class OrderStatusScheduler {

    private final OrderRepository orderRepository;
    private final PaymentHistoryRepository paymentHistoryRepository;


    @Value("${order.status.processing-to-shipped-days:1}")
    private int processingToShippedDays;

    @Value("${order.status.shipped-to-delivered-days:3}")
    private int shippedToDeliveredDays;

    @Value("${order.status.pending-to-cancel-days:1}")
    private int pendingToCancelDays;


    @Scheduled(cron = "0 0 0 * * ?")
    @Transactional
    public void updateOrderStatusProcessingToShipped() {
        log.info("Update Order From Processing To Shipped");

        LocalDateTime currentDate = LocalDateTime.now();

        List<Order> orderList = orderRepository.findByOrderStatusAndOrderDateBefore(OrderStatus.PROCESSING,
                currentDate.minusDays(processingToShippedDays));

        orderList.forEach(order ->  order.setOrderStatus(OrderStatus.SHIPPED));
        orderRepository.saveAll(orderList);
    }

    @Scheduled(cron = "0 0 0 * * ?")
    @Transactional
    public void updateOrderStatusShippedToDelivered() {
        log.info("Update Order From Shipped To Delivered");

        LocalDateTime currentDate = LocalDateTime.now();

        List<Order> orderList = orderRepository.findByOrderStatusAndOrderDateBefore(OrderStatus.SHIPPED,
                currentDate.minusDays(shippedToDeliveredDays));

        orderList.forEach(order -> {
            order.setOrderStatus(OrderStatus.DELIVERED);

            updatePendingCashPaymentsToPaid(order);
        });

        orderRepository.saveAll(orderList);
    }

    private void updatePendingCashPaymentsToPaid(Order order) {
        List<PaymentHistory> paymentHistoryList = paymentHistoryRepository.findAllByOrderId(order.getId());

        List<PaymentHistory> updatedPayments = new ArrayList<>();

        paymentHistoryList.stream()
                .filter(payment -> payment.getPaymentMethod() == PaymentMethod.CASH
                        && payment.getPaymentStatus() == PaymentStatus.PENDING)
                .forEach(payment -> {
                    payment.setIsPrimary(true);
                    payment.setPaymentStatus(PaymentStatus.PAID);
                    updatedPayments.add(payment);
                });

        paymentHistoryRepository.saveAll(updatedPayments);
    }


    @Scheduled(cron = "0 0 0 * * ?")
    @Transactional
    public void cancelPendingOrdersOverOneDay() {
        log.info("Cancel Pending Orders Over One Day");

        LocalDateTime currentDate = LocalDateTime.now();

        List<Order> orderList = orderRepository.findByOrderStatusAndOrderDateBefore(PENDING,
                currentDate.minusDays(pendingToCancelDays));

        orderList.forEach(order ->  order.setOrderStatus(OrderStatus.CANCELLED));
        orderRepository.saveAll(orderList);
    }


}
