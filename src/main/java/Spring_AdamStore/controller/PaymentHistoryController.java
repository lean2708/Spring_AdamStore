package Spring_AdamStore.controller;

import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PaymentHistoryResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.service.PaymentHistoryService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j(topic = "PAYMENT-HISTORY-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class PaymentHistoryController {

    private final PaymentHistoryService paymentHistoryService;


    @Operation(description = "Api này dùng để tìm kiếm Payment-History")
    @GetMapping("/payment-histories/search")
    public ApiResponse<PageResponse<PaymentHistoryResponse>> searchPaymentHistories(@Min(value = 1, message = "pageNo phải lớn hơn 0")
                                                                    @RequestParam(defaultValue = "1") int pageNo,
                                                                                  @RequestParam(defaultValue = "10") int pageSize,
                                                                                  @RequestParam(required = false) String sortBy,
                                                                                  @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
                                                                                  @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate,
                                                                                  @RequestParam(required = false) PaymentStatus paymentStatus){
        return ApiResponse.<PageResponse<PaymentHistoryResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Search Payment-History")
                .result(paymentHistoryService.searchPaymentHistories(pageNo, pageSize, sortBy, startDate, endDate, paymentStatus))
                .build();
    }
}
