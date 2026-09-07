package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.UserCreationRequest;
import Spring_AdamStore.dto.request.UserUpdateRequest;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.exception.FileException;
import Spring_AdamStore.service.UserService;
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
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Slf4j(topic = "USER-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class UserController {

    private final UserService userService;



    @Operation(summary = "Create User with Role",
            description = "API này được sử dụng để tạo user và gán role vào user đó")
    @PostMapping("/admin/users")
    public ApiResponse<UserResponse> create(@Valid @RequestBody UserCreationRequest request){
        log.info("Received request to create User: {}", request);

        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create User With Role")
                .result(userService.create(request))
                .build();
    }


    @GetMapping("/private/users/{id}")
    public ApiResponse<UserResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                               @PathVariable long id){
        log.info("Received request to fetch User by id: {}", id);

        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch User By Id")
                .result(userService.fetchUserById(id))
                .build();
    }

    @Operation(summary = "Fetch All Users For Admin")
    @GetMapping("/admin/users")
    public ApiResponse<PageResponse<UserResponse>> fetchAllForAdmin(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all user for admin");

        return ApiResponse.<PageResponse<UserResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(userService.fetchAllUsers(pageable))
                .message("Fetch All Users For Admin")
                .build();
    }


    @Operation(description = "Api này dùng để search Users, giá trị của search: field~value hoặc field>value hoặc field<value")
    @GetMapping("/admin/users/search")
    public ApiResponse<PageResponse<UserResponse>> searchUser(@ParameterObject @PageableDefault Pageable pageable,
                                                                    @RequestParam(required = false) List<String> search){
        log.info("Received request to Search Users with pageable: {} and search params: {}", pageable, search);

        return ApiResponse.<PageResponse<UserResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(userService.searchUser(pageable, search))
                .message("Search Users based on attributes with pagination")
                .build();
    }


    @Operation(summary = "Update User (No update Password)",
            description = "API này được sử dụng để update user")
    @PutMapping("/private/users/{id}")
    public ApiResponse<UserResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                            @PathVariable long id,@Valid @RequestBody UserUpdateRequest request){
        log.info("Received request to update user: {}, with user id: {}", request, id);

        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update User By Id")
                .result(userService.update(id, request))
                .build();
    }


    @Operation(summary = "Soft Delete User")
    @DeleteMapping("/admin/users/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable long id){
        log.info("Received request to delete user by id: {}", id);

        userService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Soft Delete User By Id")
                .result(null)
                .build();
    }


    @Operation(summary = "Restore User")
    @PatchMapping("/admin/users/{id}/restore")
    public ApiResponse<UserResponse> restore(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable long id){
        log.info("Received request to restore user by id: {}", id);

        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Restore User By Id")
                .result(userService.restore(id))
                .build();
    }

    @Operation(summary = "Upload Avatar",
    description = "API để update avatar")
    @PutMapping(value = "/private/users/avatar", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    ApiResponse<UserResponse> updateAvatar(@RequestPart("file") MultipartFile file) throws FileException, IOException {
        log.info("Received request to Update Avatar");

        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Avatar")
                .result(userService.updateAvatar(file))
                .build();
    }

    @Operation(summary = "Fetch All Addresses For User",
            description = "Api lấy tất cả địa chỉ của user")
    @GetMapping("/private/users/addresses")
    public ApiResponse<PageResponse<AddressResponse>> getAddressesByUser(@ParameterObject @PageableDefault Pageable pageable) {
        log.info("Received request to fetch all Address For User");

        return ApiResponse.<PageResponse<AddressResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Addresses By User Id With Pagination")
                .result(userService.getAllAddressesByUser(pageable))
                .build();
    }


    @Operation(summary = "Fetch Promotions By User",
            description = "Api lấy tất cả mã giảm giá mà user có thể sử dụng")
    @GetMapping("/private/users/promotions/available")
    public ApiResponse<PageResponse<PromotionResponse>> getPromotionsByUser(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all Promotion For User");

        return ApiResponse.<PageResponse<PromotionResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(userService.getPromotionsByUser(pageable))
                .message("Fetch Promotions By User With Pagination")
                .build();
    }

}
