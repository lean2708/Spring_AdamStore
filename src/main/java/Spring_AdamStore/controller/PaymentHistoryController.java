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
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
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
    @GetMapping("/admin/payment-histories/search")
    public ApiResponse<PageResponse<PaymentHistoryResponse>> searchPaymentHistories(@ParameterObject @PageableDefault Pageable pageable,
                                                                                  @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
                                                                                  @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate,
                                                                                  @RequestParam(required = false) PaymentStatus paymentStatus){
        log.info("Received search request for Payment-Histories: startDate={}, endDate={}, status={}", startDate, endDate, paymentStatus);

        return ApiResponse.<PageResponse<PaymentHistoryResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Search Payment-History")
                .result(paymentHistoryService.searchPaymentHistories(pageable, startDate, endDate, paymentStatus))
                .build();
    }


    @DeleteMapping("/admin/payment-histories/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete Payment-History with id: {}", id);

        paymentHistoryService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Delete Payment-History By Id")
                .result(null)
                .build();
    }
}
