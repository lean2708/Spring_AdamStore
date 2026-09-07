package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.ProductRequest;
import Spring_AdamStore.dto.request.PromotionRequest;
import Spring_AdamStore.dto.request.PromotionUpdateRequest;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.service.ProductService;
import Spring_AdamStore.service.PromotionService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j(topic = "PROMOTION-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class PromotionController {

    private final PromotionService promotionService;


    @PostMapping("/admin/promotions")
    public ApiResponse<PromotionResponse> create(@Valid @RequestBody PromotionRequest request){
        log.info("Received request to create Promotion: {}", request);

        return ApiResponse.<PromotionResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Promotion")
                .result(promotionService.create(request))
                .build();
    }


    @GetMapping("/private/promotions/{id}")
    public ApiResponse<PromotionResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                  @PathVariable Long id){
        log.info("Received request to fetch Promotion by id: {}", id);

        return ApiResponse.<PromotionResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Promotion By Id")
                .result(promotionService.fetchById(id))
                .build();
    }


    @Operation(summary = "Fetch All Promotions For Admin")
    @GetMapping("/admin/promotions")
    public ApiResponse<PageResponse<PromotionResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all Promotion for admin");

        return ApiResponse.<PageResponse<PromotionResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(promotionService.fetchAll(pageable))
                .message("Fetch All Promotions For Admin")
                .build();
    }


    @Operation(description = "Api này dùng để search Promotions, giá trị của search: field~value hoặc field>value hoặc field<value")
    @GetMapping("/public/promotions/search")
    public ApiResponse<PageResponse<PromotionResponse>> searchPromotion(@ParameterObject @PageableDefault Pageable pageable,
                                                              @RequestParam(required = false) List<String> search){
        log.info("Received request to Search Promotions with pageable: {} and search params: {}", pageable, search);

        return ApiResponse.<PageResponse<PromotionResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(promotionService.searchPromotion(pageable, search))
                .message("Search Promotions based on attributes with pagination")
                .build();
    }


    @PutMapping("/admin/promotions/{id}")
    public ApiResponse<PromotionResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                               @PathVariable Long id, @Valid @RequestBody PromotionUpdateRequest request){
        log.info("Received request to update Promotion: {}, with Promotion id: {}", request, id);

        return ApiResponse.<PromotionResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Promotion By Id")
                .result(promotionService.update(id, request))
                .build();
    }



    @Operation(summary = "Soft delete Promotion")
    @DeleteMapping("/admin/promotions/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete Promotion by id: {}", id);

        promotionService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Soft Delete Promotion By Id")
                .result(null)
                .build();
    }


    @Operation(summary = "Restore Promotion",
    description = "Api này để khôi phục Promotion")
    @PatchMapping("/admin/promotions/{id}/restore")
    public ApiResponse<PromotionResponse> restore(@Min(value = 1, message = "Id phải lớn hơn 0")
                                                 @PathVariable long id) {
        log.info("Received request to restore Promotion by id: {}", id);

        return ApiResponse.<PromotionResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Restore Promotion By Id")
                .result(promotionService.restore(id))
                .build();
    }
}
