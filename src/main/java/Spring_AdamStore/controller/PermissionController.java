package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.service.PermissionService;
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

@Slf4j
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class PermissionController {

    private final PermissionService permissionService;


    @GetMapping("/admin/permissions/{id}")
    public ApiResponse<PermissionResponse> fetchRoleById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                             @PathVariable long id){
        log.info("Received request to fetch permission by id: {}", id);

        return ApiResponse.<PermissionResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Permission By Id")
                .result(permissionService.fetchPermissionById(id))
                .build();
    }


    @GetMapping("/admin/permissions")
    public ApiResponse<PageResponse<PermissionResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all permissions for admin");

        return ApiResponse.<PageResponse<PermissionResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(permissionService.fetchAllPermissions(pageable))
                .message("Fetch All Permissions With Pagination")
                .build();
    }

}
