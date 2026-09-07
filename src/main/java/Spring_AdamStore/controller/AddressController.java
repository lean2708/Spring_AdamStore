package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.AddressRequest;
import Spring_AdamStore.dto.response.AddressResponse;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.BranchResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.service.AddressService;
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

@Slf4j(topic = "ADDRESS-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class AddressController {

    private final AddressService addressService;


    @Operation(summary = "Create New Address",
            description = "Api dùng để tạo địa chỉ mới")
    @PostMapping("/private/addresses")
    public ApiResponse<AddressResponse> create(@Valid @RequestBody AddressRequest request){
        log.info("Received request to create address: {}", request);

        return ApiResponse.<AddressResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Address")
                .result(addressService.create(request))
                .build();
    }


    @GetMapping("/private/addresses/{id}")
    public ApiResponse<AddressResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                 @PathVariable Long id){
        log.info("Received request to fetch address by id: {}", id);

        return ApiResponse.<AddressResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Address By Id")
                .result(addressService.fetchById(id))
                .build();
    }

    @PreAuthorize("hasRole('ADMIN')")
    @Operation(summary = "Fetch All Addresses For Admin",
    description = "API này để lấy tất cả address bên trong hệ thống (page bắt đầu từ 0)")
    @GetMapping("/admin/addresses")
    public ApiResponse<PageResponse<AddressResponse>> fetchAllForAdmin(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all addresses for Admin");

        return ApiResponse.<PageResponse<AddressResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(addressService.fetchAllForAdmin(pageable))
                .message("Fetch All Addresses For Admin")
                .build();
    }


    @Operation(description = "API để update địa chỉ")
    @PutMapping("/private/addresses/{id}")
    public ApiResponse<AddressResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                              @PathVariable Long id, @Valid @RequestBody AddressRequest request){
        log.info("Received request to update address: {}, with address id: {}", request, id);

        return ApiResponse.<AddressResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Address By Id")
                .result(addressService.update(id, request))
                .build();
    }


    @Operation(summary = "Hide User Address",
    description = "Api này cho phép user xóa địa chỉ của chính user đó trong giao diện người dùng")
    @PatchMapping("/private/addresses/{id}/hide")
    public ApiResponse<Void> hideAddress(@Min(value = 1, message = "ID phải lớn hơn 0")
                                               @PathVariable Long id){
        log.info("Received request to hide address by id: {}", id);

        addressService.hideAddress(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Address has been successfully hidden")
                .result(null)
                .build();
    }


    @Operation(summary = "Soft Delete Address",
    description = "API để Admin xóa mềm address")
    @DeleteMapping("/admin/addresses/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete address by id: {}", id);

        addressService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Delete Address By Id")
                .result(null)
                .build();
    }


    @Operation(summary = "Restore Address",
            description = "Api này để khôi phục Address")
    @PatchMapping("/admin/addresses/{id}/restore")
    public ApiResponse<AddressResponse> restore(@Min(value = 1, message = "Id phải lớn hơn 0")
                                               @PathVariable long id) {
        log.info("Received request to restore address by id: {}", id);

        return ApiResponse.<AddressResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Restore Address By Id")
                .result(addressService.restore(id))
                .build();
    }
}
