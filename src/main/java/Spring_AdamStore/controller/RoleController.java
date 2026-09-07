package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.dto.response.RoleResponse;
import Spring_AdamStore.service.RoleService;
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


@Slf4j(topic = "ROLE-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class RoleController {

    private final RoleService roleService;


    @GetMapping("/admin/roles/{id}")
    public ApiResponse<RoleResponse> fetchRoleById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                   @PathVariable long id){
        log.info("Received request to fetch role by id: {}", id);

        return ApiResponse.<RoleResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Role By Id")
                .result(roleService.fetchRoleById(id))
                .build();
    }


    @GetMapping("/admin/roles")
    public ApiResponse<PageResponse<RoleResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all roles for admin");

        return ApiResponse.<PageResponse<RoleResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(roleService.fetchAllRoles(pageable))
                .message("Fetch All Roles With Pagination")
                .build();
    }


    @GetMapping("/admin/roles/{roleId}/permissions")
    public ApiResponse<PageResponse<PermissionResponse>> getPermissionsByRole(@ParameterObject @PageableDefault Pageable pageable,
                                                                              @PathVariable long roleId) {
        log.info("Received request to fetch all permissions by Role");

        return ApiResponse.<PageResponse<PermissionResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Permissions by Role Id")
                .result(roleService.getPermissionsByRoleId(pageable, roleId))
                .build();
    }

}
