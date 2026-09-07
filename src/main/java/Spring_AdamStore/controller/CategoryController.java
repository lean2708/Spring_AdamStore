package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.CategoryRequest;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.service.CategoryService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "CATEGORY-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class CategoryController {

    private final CategoryService categoryService;


    @PostMapping("/admin/categories")
    public ApiResponse<CategoryResponse> create(@Valid @RequestBody CategoryRequest request){
        log.info("Received request to create Category: {}", request);

        return ApiResponse.<CategoryResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Category")
                .result(categoryService.create(request))
                .build();
    }

    @Operation(summary = "Fetch All Categories For User",
    description = "Api này để lấy tất cả Categories (ACTIVE) cho User")
    @GetMapping("/public/categories")
    public ApiResponse<PageResponse<CategoryResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all Category for User");

        return ApiResponse.<PageResponse<CategoryResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(categoryService.fetchAll(pageable))
                .message("Fetch All Categories For User")
                .build();
    }


    @Operation(summary = "Fetch All Categories For Admin",
            description = "Api này để lấy tất cả Categories (cả ACTIVE và INACTIVE) cho Admin")
    @GetMapping("/admin/categories")
    public ApiResponse<PageResponse<CategoryResponse>> fetchAllCategoriesForAdmin(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all Category for Admin");

        return ApiResponse.<PageResponse<CategoryResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(categoryService.fetchAllCategoriesForAdmin(pageable))
                .message("Fetch All Categories For Admin")
                .build();
    }


    @PutMapping("/admin/categories/{id}")
    public ApiResponse<CategoryResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                               @PathVariable Long id, @Valid @RequestBody CategoryRequest request){
        log.info("Received request to update Category: {}, with Category id: {}", request, id);

        return ApiResponse.<CategoryResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Category By Id")
                .result(categoryService.update(id, request))
                .build();
    }



    @Operation(summary = "Soft Delete Category")
    @DeleteMapping("/admin/categories/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete Category by id: {}", id);

        categoryService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Soft Delete Category By Id")
                .result(null)
                .build();
    }


    @Operation(summary = "Restore Category")
    @PatchMapping("/admin/categories/{id}/restore")
    public ApiResponse<CategoryResponse> restore(@Min(value = 1, message = "Id phải lớn hơn 0")
                                               @PathVariable long id) {
        log.info("Received request to restore Category by id: {}", id);

        return ApiResponse.<CategoryResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Restore Category By Id")
                .result(categoryService.restore(id))
                .build();
    }

    @Operation(summary = "Fetch All Products By Category For User",
            description = "API dùng để lấy danh sách products của category cho user")
    @GetMapping("/public/categories/{categoryId}/products")
    public ApiResponse<PageResponse<ProductResponse>> fetchProductByCategory(@ParameterObject @PageableDefault Pageable pageable,
                                                                         @Min(value = 1, message = "categoryId phải lớn hơn 0")
                                                                         @PathVariable Long categoryId){
        log.info("Received request to fetch all product by Category");

        return ApiResponse.<PageResponse<ProductResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch All Products By Category For User")
                .result(categoryService.fetchProductByCategory(pageable, categoryId))
                .build();
    }

}
