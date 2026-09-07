package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.CartItemResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.service.CartService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j(topic = "CART-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class CartController {

    private final CartService cartService;

    @Operation(summary = "Fetched paginated cart items for current user",
    description = "API để lấy tất cả sản phẩm đã thêm vào giỏ hàng")
    @GetMapping("/private/carts/cart-items")
    public ApiResponse<PageResponse<CartItemResponse>> getCartItemsOfCurrentUser(@ParameterObject @PageableDefault Pageable pageable) {
        log.info("Received request to fetch all cart items for current user");

        return ApiResponse.<PageResponse<CartItemResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetched paginated cart items for current user")
                .result(cartService.getCartItemsOfCurrentUser(pageable))
                .build();
    }
}
