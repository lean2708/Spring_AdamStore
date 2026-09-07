package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.dto.request.*;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.*;
import Spring_AdamStore.entity.sql.relationship.PromotionUsage;
import Spring_AdamStore.entity.sql.Order;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.OrderMapper;
import Spring_AdamStore.mapper.OrderMappingHelper;
import Spring_AdamStore.repository.sql.relationship.PromotionUsageRepository;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.service.CurrentUserService;
import Spring_AdamStore.service.OrderService;
import Spring_AdamStore.service.PaymentHistoryService;
import Spring_AdamStore.service.relationship.PromotionUsageService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

@Service
@Slf4j(topic = "ORDER-SERVICE")
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final OrderMapper orderMapper;

    private final CurrentUserService currentUserService;
    private final AddressRepository addressRepository;
    private final ProductVariantRepository productVariantRepository;
    private final OrderItemRepository orderItemRepository;
    private final PromotionRepository promotionRepository;
    private final PaymentHistoryRepository paymentHistoryRepository;
    private final PromotionUsageService promotionUsageService;
    private final PromotionUsageRepository promotionUsageRepository;
    private final PaymentHistoryService paymentHistoryService;
    private final OrderMappingHelper orderMappingHelper;


    @Override
    @Transactional
    public OrderResponse create(OrderRequest request) {
        log.info("Creating order with data= {}", request);

        // ShippingFee
        double totalPrice = request.getShippingFee();

        OrderStatus orderStatus = request.getPaymentMethod() == PaymentMethod.CASH
                ? OrderStatus.PROCESSING
                : OrderStatus.PENDING;

        Order order = Order.builder()
                .userId(currentUserService.getCurrentUser().getId())
                .addressId(findAddressById(request.getAddressId()).getId())
                .orderStatus(orderStatus)
                .totalPrice(totalPrice)
                .orderDate(LocalDateTime.now())
                .build();

        orderRepository.save(order);

        // orderItem
        Set<OrderItem> orderItemSet = new HashSet<>();
        for(OrderItemRequest orderItemRequest : request.getOrderItems()){
            ProductVariant productVariant = productVariantRepository.findById(orderItemRequest.getProductVariantId())
                    .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

            // check sl hang con
            if (productVariant.getQuantity() < orderItemRequest.getQuantity()) {
                throw new AppException(ErrorCode.OUT_OF_STOCK);
            }

            OrderItem orderItem = OrderItem.builder()
                    .quantity(orderItemRequest.getQuantity())
                    .unitPrice(productVariant.getPrice())
                    .orderId(order.getId())
                    .productVariantId(productVariant.getId())
                    .build();

            // tru so luong hang trong kho
            productVariant.setQuantity(productVariant.getQuantity() - orderItemRequest.getQuantity());
            productVariantRepository.save(productVariant);

            orderItemSet.add(orderItem);
            totalPrice += orderItem.getQuantity() * orderItem.getUnitPrice();
        }
        orderItemRepository.saveAll(orderItemSet);

        // Promotion
        if (request.getPromotionId() != null) {
            totalPrice = applyPromotion(request.getPromotionId(), order, totalPrice);
        }

        order.setTotalPrice(totalPrice);

        // PaymentHistory
        paymentHistoryService.savePaymentHistory(order, request.getPaymentMethod());

        return orderMapper.toOrderResponse(orderRepository.save(order), orderMappingHelper);
    }


    @Override
    public OrderResponse fetchDetailById(Long id) {
        log.info("Fetch Order By Id: {}", id);

        Order order = findOrderById(id);

        return orderMapper.toOrderResponse(order, orderMappingHelper);
    }

    @Override
    @Transactional
    public OrderResponse updateAddress(Long id, OrderAddressRequest request) {
        log.info("Updated update address for orderId= {}" , id);

        Order order = findOrderById(id);

        if (!(order.getOrderStatus() == OrderStatus.PENDING || order.getOrderStatus() == OrderStatus.PROCESSING)) {
            throw new AppException(ErrorCode.ORDER_CANNOT_UPDATE_ADDRESS);
        }

        Address newAddress = findAddressById(request.getAddressId());


        order.setAddressId(newAddress.getId());
        return orderMapper.toOrderResponse(orderRepository.save(order), orderMappingHelper);
    }

    @Transactional
    @Override
    public void delete(Long id) {
        log.info("Delete Order By Id: {}", id);

        Order order = findOrderById(id);

        orderItemRepository.deleteAllByOrderId(order.getId());

        paymentHistoryRepository.deleteAllByOrderId(order.getId());

        promotionUsageRepository.deleteAllByOrderId(order.getId());

        orderRepository.delete(order);
    }

    @Override
    public OrderResponse cancelOrder(Long orderId) {
        log.info("Cancel order with ID: {}", orderId);

        Order order = findOrderById(orderId);

        if (order.getOrderStatus() != OrderStatus.PENDING && order.getOrderStatus() != OrderStatus.PROCESSING) {
            throw new AppException(ErrorCode.ORDER_CANNOT_BE_CANCELLED);
        }

        order.setOrderStatus(OrderStatus.CANCELLED);

        return orderMapper.toOrderResponse(orderRepository.save(order), orderMappingHelper);
    }

    @Override
    public List<OrderResponse> getOrdersForUser(OrderStatus orderStatus) {
        log.info("Fetching orders for current user, with status: {}",orderStatus);

        User user = currentUserService.getCurrentUser();

        List<Order> orderList = orderRepository.findByUserIdAndOrderStatus(user.getId(), orderStatus);

        return orderMapper.toOrderResponseList(orderList, orderMappingHelper);
    }

    @Override
    public PageResponse<OrderResponse> searchOrdersForAdmin(Pageable pageable, LocalDate startDate, LocalDate endDate, OrderStatus orderStatus) {
        log.info("Admin search orders from {} to {}, with status: {}", startDate, endDate, orderStatus);

        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(LocalTime.MAX);

        Page<Order> orderPage = orderRepository.findOrdersByDateAndStatus(startDateTime, endDateTime, orderStatus, pageable);

        return PageResponse.<OrderResponse>builder()
                .page(orderPage.getNumber())
                .size(orderPage.getSize())
                .totalPages(orderPage.getTotalPages())
                .totalItems(orderPage.getTotalElements())
                .items(orderMapper.toOrderResponseList(orderPage.getContent(), orderMappingHelper))
                .build();
    }


    private Order findOrderById(Long id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ORDER_NOT_EXISTED));
    }


    private Address findAddressById(Long addressId){
        return addressRepository.findById(addressId)
                .orElseThrow(() -> new AppException(ErrorCode.ADDRESS_NOT_EXISTED));
    }


    private double applyPromotion(Long promotionId, Order order, double currentTotal) {
        Promotion promotion = promotionRepository.findById(promotionId)
                .orElseThrow(() -> new AppException(ErrorCode.PROMOTION_NOT_EXISTED));

        PromotionUsage usage = promotionUsageService.applyPromotion(promotion, order, currentUserService.getCurrentUser(), currentTotal);

        log.info("Usage Discount Amount: {}", usage.getDiscountAmount());
        log.info("Discount : {}", currentTotal * usage.getDiscountAmount());
        return currentTotal - usage.getDiscountAmount();
    }





}
