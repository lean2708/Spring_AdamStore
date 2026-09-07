package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.VariantCreateRequest;
import Spring_AdamStore.dto.request.VariantRequest;
import Spring_AdamStore.dto.request.VariantUpdateRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.ProductVariantResponse;
import Spring_AdamStore.service.ProductVariantService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "PRODUCT-VARIANT-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class ProductVariantController {

    private final ProductVariantService productVariantService;

    @Operation(summary = "Fetch product variant by product, color, size"
            , description = "API để tìm kiếm Product-Variant theo product, color, size")
    @GetMapping("/private/product-variants/{productId}/{colorId}/{sizeId}")
    public ApiResponse<ProductVariantResponse> findByProductAndColorAndSize(@Min(value = 1, message = "productId phải lớn hơn 0")
                                                                                @PathVariable Long productId,
                                                                            @Min(value = 1, message = "colorId phải lớn hơn 0")
                                                                            @PathVariable Long colorId,
                                                                            @Min(value = 1, message = "sizeId phải lớn hơn 0")
                                                                                @PathVariable Long sizeId) {
        log.info("Received request to fetch Variant with productId={}, colorId={}, sizeId={}",
                productId, colorId, sizeId);

        return ApiResponse.<ProductVariantResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch product variant by product, color, size")
                .result(productVariantService.findByProductAndColorAndSize(productId, colorId, sizeId))
                .build();
    }

    @Operation(summary = "Create new product variant",
            description = "API để tạo ProductVariant mới theo product, color, size, giá và số lượng")
    @PostMapping("/admin/product-variants")
    public ApiResponse<ProductVariantResponse> createProductVariant(@RequestBody @Valid VariantCreateRequest request) {
        log.info("Creating new ProductVariant: {}", request);

        return ApiResponse.<ProductVariantResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("ProductVariant created successfully")
                .result(productVariantService.createProductVariant(request))
                .build();
    }



    @Operation(summary = "Update price and quantity for a product variant",
            description = "API để cập nhật giá và số lượng cho ProductVariant")
    @PutMapping("/admin/product-variants/{id}")
    public ApiResponse<ProductVariantResponse> updatePriceAndQuantity(@Min(value = 1, message = "productVariantId phải lớn hơn 0")
                                                                          @PathVariable Long id,
                                                                      @RequestBody @Valid VariantUpdateRequest request) {
        log.info("Received request to update ProductVariant with id={}, new price={}, new quantity={}",
                id, request.getPrice(), request.getQuantity());

        return ApiResponse.<ProductVariantResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update price quantity of Product-variant")
                .result(productVariantService.updatePriceAndQuantity(id, request))
                .build();
    }



    @Operation(summary = "Delete product variant",
            description = "API để xóa ProductVariant")
    @DeleteMapping("/admin/product-variants/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "id phải lớn hơn 0") @PathVariable Long id) {
        log.info("Received request to delete ProductVariant with id={}", id);

        productVariantService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Soft Delete Product-variant by id")
                .result(null)
                .build();
    }


    @Operation(summary = "Restore product variant",
            description = "API để khôi phục ProductVariant")
    @PatchMapping("/admin/product-variants/{id}/restore")
    public ApiResponse<ProductVariantResponse> restore(@Min(value = 1, message = "Id phải lớn hơn 0")
                                                @PathVariable long id) {
        log.info("Received request to restore ProductVariant with id={}", id);

        return ApiResponse.<ProductVariantResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Restore Product-variant By Id")
                .result(productVariantService.restore(id))
                .build();
    }
}
