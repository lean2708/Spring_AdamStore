package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.BranchRequest;
import Spring_AdamStore.dto.request.BranchUpdateRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.BranchResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.service.BranchService;
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

@Slf4j(topic = "BRANCH-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class BranchController {

    private final BranchService branchService;


    @PostMapping("/admin/branches")
    public ApiResponse<BranchResponse> create(@Valid @RequestBody BranchRequest request){
        log.info("Received request to create branch: {}", request);

        return ApiResponse.<BranchResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Branch")
                .result(branchService.create(request))
                .build();
    }


    @GetMapping("/public/branches/{id}")
    public ApiResponse<BranchResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                   @PathVariable Long id){
        log.info("Received request to fetch branch by id: {}", id);

        return ApiResponse.<BranchResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Branch By Id")
                .result(branchService.fetchById(id))
                .build();
    }


    @Operation(summary = "Fetch All Branches For User",
    description = "API để lấy tất cả Branch (ACTIVE) cho user")
    @GetMapping("/public/branches")
    public ApiResponse<PageResponse<BranchResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all branch for user");

        return ApiResponse.<PageResponse<BranchResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(branchService.fetchAll(pageable))
                .message("Fetch All Branches For User")
                .build();
    }


    @Operation(summary = "Fetch All Branches For Admin",
    description = "API này để lấy tất cả Branch (cả ACTIVE và INACTIVE) cho admin quản lý")
    @GetMapping("/admin/branches")
    public ApiResponse<PageResponse<BranchResponse>> fetchAllBranchesForAdmin(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all branch for admin");

        return ApiResponse.<PageResponse<BranchResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(branchService.fetchAllBranchesForAdmin(pageable))
                .message("Fetch All Branches For Admin")
                .build();
    }


    @PutMapping("/admin/branches/{id}")
    public ApiResponse<BranchResponse> update(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                @PathVariable Long id, @Valid @RequestBody BranchUpdateRequest request){
        log.info("Received request to update branch: {}, with branch id: {}", request, id);

        return ApiResponse.<BranchResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Update Branch By Id")
                .result(branchService.update(id, request))
                .build();
    }


    @Operation(summary = "Soft Delete Branch",
    description = "Api này để soft delete branch")
    @DeleteMapping("/admin/branches/{id}")
    public ApiResponse<Void> delete(@Min(value = 1, message = "ID phải lớn hơn 0")
                                    @PathVariable Long id){
        log.info("Received request to delete branch by id: {}", id);

        branchService.delete(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.NO_CONTENT.value())
                .message("Soft Delete Branch By Id")
                .result(null)
                .build();
    }


    @Operation(summary = "Restore Branch",
    description = "Api này để khôi phục Branch")
    @PatchMapping("/admin/branches/{id}/restore")
    public ApiResponse<BranchResponse> restore(@Min(value = 1, message = "Id phải lớn hơn 0")
                                             @PathVariable long id) {
        log.info("Received request to restore branch by id: {}", id);

        return ApiResponse.<BranchResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Restore Branch By Id")
                .result(branchService.restore(id))
                .build();
    }
}
