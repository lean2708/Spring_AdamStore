package Spring_AdamStore.controller;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.dto.ghn.response.ShippingFeeResponse;
import Spring_AdamStore.dto.request.OrderRequest;
import Spring_AdamStore.dto.request.ShippingRequest;
import Spring_AdamStore.dto.request.OrderAddressRequest;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.service.OrderService;
import Spring_AdamStore.service.PaymentService;
import Spring_AdamStore.service.ShippingService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Slf4j(topic = "ORDER-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class OrderController {

    private final OrderService orderService;
    private final ShippingService shippingService;
    private final PaymentService paymentService;


    @Operation(summary = "Create Order",
            description = "Api này dùng để tạo đơn hàng")
    @PostMapping("/private/orders")
    public ApiResponse<OrderResponse> create(@Valid @RequestBody OrderRequest request){
        log.info("Received request to create order: {}", request);

        return ApiResponse.<OrderResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Order")
                .result(orderService.create(request))
                .build();
    }


    @Operation(summary = "Fetch Order Detail By Id",
            description = "Api này dùng để lấy chi tiết đơn hàng")
    @GetMapping("/private/orders/{id}/details")
    public ApiResponse<OrderResponse> fetchDetailById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                    @PathVariable Long id){
        log.info("Received request to fetch Order Detail by id: {}", id);

        return ApiResponse.<OrderResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Order By Id")
                .result(orderService.fetchDetailById(id))
                .build();
    }


    @Operation(summary = "Get Orders for Current User",
            description = "Lấy danh sách đơn hàng của người dùng hiện tại, lọc theo trạng thái")
    @GetMapping("/private/user/orders")
    public ApiResponse<List<OrderResponse>> getOrdersForUser(@RequestParam OrderStatus orderStatus) {
        log.info("Received request to get orders for current user. Status = {}", orderStatus);

        return ApiResponse.<List<OrderResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(orderService.getOrdersForUser(orderStatus))
                .message("Orders for Current User")
                .build();
    }


    @Operation(summary = "Search Orders for Admin",
            description = "API cho admin lấy danh sách đơn hàng theo khoảng thời gian và trạng thái (tuỳ chọn)")
    @GetMapping("/admin/orders/search")
    public ApiResponse<PageResponse<OrderResponse>> searchOrdersForAdmin(
            @ParameterObject @PageableDefault Pageable pageable,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam(required = false) OrderStatus orderStatus) {
        log.info("Received request to search orders for admin. From {} to {}, Status = {}", startDate, endDate, orderStatus);

        return ApiResponse.<PageResponse<OrderResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Search orders for admin")
                .result(orderService.searchOrdersForAdmin(pageable, startDate, endDate, orderStatus))
                .build();
    }


    @Operation(summary = "Update Address for Order",
    description = "Cập nhập đia chỉ cho đơn hàng ở trạng thái PENDING hoặc PROCESSING")
    @PutMapping("/private/orders/{orderId}/address")
    public ApiResponse<OrderResponse> updateAddress(@Min(value = 1, message = "orderId phải lớn hơn 0")
                                                 @PathVariable Long orderId, @Valid @RequestBody OrderAddressRequest request){
        log.info("Received request to update address for order");

        return ApiResponse.<OrderResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Order By Id")
                .result(orderService.updateAddress(orderId, request))
                .build();
    }

    @Operation(summary = "Delete Order For Admin",
            description = "Admin xóa đơn hàng")
    @DeleteMapping("/admin/orders/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete Order by id: {}", id);

        orderService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Delete Order By Id")
                .result(null)
                .build();
    }

    @Operation(summary = "Cancel Order",
            description = "Người dùng hủy đơn hàng nếu khi đang ở trạng thái PENDING hoặc PROCESSING")
    @PutMapping("/private/orders/{orderId}/cancel")
    public ApiResponse<OrderResponse> cancelOrder(@Min(value = 1, message = "orderId phải lớn hơn 0")
                                                  @PathVariable Long orderId) {
        log.info("Received request to cancel order by ID: {}", orderId);

        return ApiResponse.<OrderResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Cancel Order")
                .result(orderService.cancelOrder(orderId))
                .build();
    }


    @Operation(summary = "Calculate Shipping Fee",
    description = "Api này dùng để tính phí ship của đơn hàng")
    @PostMapping("/private/shipping/calculate-fee")
    public ApiResponse<ShippingFeeResponse> calculateShippingFee(@RequestBody ShippingRequest request){
        log.info("Received request to calculate shipping fee: {}", request);

        return ApiResponse.<ShippingFeeResponse>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Calculate Shipping Fee")
                .result(shippingService.shippingCost(request))
                .build();
    }

    @Operation(summary = "Payment for Order",
            description = "Api này dùng để thanh toán đơn hàng thông qua VNPAY")
    @GetMapping("/private/orders/{orderId}/vn-pay")
    public ApiResponse<VNPayResponse> pay(@Min(value = 1, message = "ID phải lớn hơn 0")
                                              @PathVariable Long orderId, HttpServletRequest request) {
        log.info("Received request to create VNPay payment URL for orderId: {}", orderId);

        return ApiResponse.<VNPayResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Tạo thành công URL thanh toán VNPay")
                .result(paymentService.processPayment(orderId, request))
                .build();
    }

    @Operation(summary = "Payment CallBack for Order",
            description = "Api này dùng để xử lý sau khi thanh toán đơn hàng")
    @PostMapping("/private/orders/vn-pay-callback")
    public ApiResponse<OrderResponse> payCallbackHandler(@RequestParam String responseCode, @RequestParam Long orderId) {
        log.info("Received VNPay callback for Order ID: {}", orderId);

        if (responseCode.equals("00")) {
            return ApiResponse.<OrderResponse>builder()
                    .code(1000)
                    .message("Thanh toán thành công")
                    .result(paymentService.updateOrderAfterPayment(orderId))
                    .build();
        } else {
            log.error("Thanh toán không thành công với mã phản hồi: " + responseCode);
            paymentService.handleFailedPayment(orderId);
            return new ApiResponse<>(4000, "Thanh toán thất bại", null);
        }
    }

    @Operation(summary = "Retry Payment for Order",
            description = "Api này dùng để thanh toán lại đơn hàng(khi đang trong phần chờ thanh toán)")
    @GetMapping("/private/orders/{orderId}/retry-payment")
    public ApiResponse<VNPayResponse> retryPayment(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                       @PathVariable Long orderId, HttpServletRequest request) {
        log.info("Received request to retry VNPay payment for orderId: {}", orderId);

        return ApiResponse.<VNPayResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Tạo thành công URL thanh toán VNPay")
                .result(paymentService.retryPayment(orderId, request))
                .build();
    }

}
