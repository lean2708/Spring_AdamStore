package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.ReviewRequest;
import Spring_AdamStore.dto.request.ReviewUpdateRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.ReviewResponse;
import Spring_AdamStore.service.ReviewService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "REVIEW-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class ReviewController {

    private final ReviewService reviewService;


    @Operation(summary = "Get review by Order Item ID of the current user",
            description = "API này dùng để lấy review theo OrderItemId của người dùng hiện tại")
    @GetMapping("/private/reviews/order-items/{orderItemId}")
    public ApiResponse<ReviewResponse> getByOrderItemId(@PathVariable @Min(value = 1, message = "orderItemId phải lớn hơn 0")
                                                            Long orderItemId) {
        log.info("Received request to get review by OrderItem ID: {}, of the current user", orderItemId);

        return ApiResponse.<ReviewResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Get review by OrderItem ID of the current user")
                .result(reviewService.getByOrderItemId(orderItemId))
                .build();
    }


    @Operation(summary = "Product Review",
    description = "API này dùng để đánh giá sản phẩm")
    @PostMapping("/private/reviews")
    public ApiResponse<ReviewResponse> create(@Valid @RequestBody ReviewRequest request){
        log.info("Received request to create review: {}", request);

        return ApiResponse.<ReviewResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Review")
                .result(reviewService.create(request))
                .build();
    }


    @PutMapping("/private/reviews/{id}")
    public ApiResponse<ReviewResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                 @PathVariable Long id, @Valid @RequestBody ReviewUpdateRequest request){
        log.info("Received request to update review: {}, with review id: {}", request, id);

        return ApiResponse.<ReviewResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Review By Id")
                .result(reviewService.update(id, request))
                .build();
    }


    @DeleteMapping("/private/reviews/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete review by id: {}", id);

        reviewService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Delete Review By Id")
                .result(null)
                .build();
    }

    @Operation(summary = "Check if current user reviewed the order item",
            description = "API kiểm tra xem user hiện tại đã đánh giá sản phẩm trong đơn hàng chưa")
    @GetMapping("/private/reviews/check/{orderItemId}")
    public ApiResponse<Boolean> isOrderItemReviewedByUser(@PathVariable @Min(value = 1, message = "orderItemId phải lớn hơn 0")
                                                              Long orderItemId) {
        log.info("Received request to check if current user has reviewed order item with ID: {}", orderItemId);

        boolean hasReviewed = reviewService.isOrderItemReviewedByUser(orderItemId);

        return ApiResponse.<Boolean>builder()
                .code(HttpStatus.OK.value())
                .message("Check if user reviewed this order item")
                .result(hasReviewed)
                .build();
    }


}
