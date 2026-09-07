package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.CartItemRequest;
import Spring_AdamStore.dto.request.CartItemUpdateRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.CartItemResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.service.CartItemService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j(topic = "CART-ITEM-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class CartItemController {

    private final CartItemService cartItemService;

    @Operation(description = "API thêm sản phẩm vào giỏ hàng")
    @PostMapping("/private/cart-items")
    public ApiResponse<CartItemResponse> create(@Valid @RequestBody CartItemRequest request){
        log.info("Received create cart item request: {}", request);

        return ApiResponse.<CartItemResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create CartItem")
                .result(cartItemService.create(request))
                .build();
    }


    @GetMapping("/private/cart-items/{id}")
    public ApiResponse<CartItemResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                   @PathVariable Long id){
        log.info("Received fetch cart item by id request: id={}", id);

        return ApiResponse.<CartItemResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch CartItem By Id")
                .result(cartItemService.fetchById(id))
                .build();
    }

    @PutMapping("/private/cart-items/{id}")
    public ApiResponse<CartItemResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                @PathVariable Long id, @Valid @RequestBody CartItemUpdateRequest request){
        log.info("Received update cart item request: id={}, data={}", id, request);

        return ApiResponse.<CartItemResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update CartItem By Id")
                .result(cartItemService.update(id, request))
                .build();
    }


    @DeleteMapping("/private/cart-items/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received delete cart item request: id={}", id);

        cartItemService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Delete CartItem By Id")
                .result(null)
                .build();
    }

    @Operation(description = "API xoá nhiều cart item theo danh sách ID")
    @DeleteMapping("/private/cart-items")
    public ApiResponse<Void> deleteCartItems(@RequestBody @NotEmpty(message = "Danh sách ID không được trống") List<Long> ids) {
        log.info("Received delete multiple cart items request: ids={}", ids);

        cartItemService.deleteCartItems(ids);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Delete CartItems By Id List")
                .result(null)
                .build();
    }
}
