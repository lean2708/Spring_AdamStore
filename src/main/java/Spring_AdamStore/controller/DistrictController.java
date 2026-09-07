package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.service.DistrictService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "DISTRICT-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class DistrictController {

    private final DistrictService districtService;

    @GetMapping("/private/districts/{id}")
    public ApiResponse<DistrictResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                   @PathVariable Integer id){
        log.info("Received request to fetch District by id: {}", id);

        return ApiResponse.<DistrictResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch District By Id")
                .result(districtService.fetchById(id))
                .build();
    }

    @GetMapping("/private/districts")
    public ApiResponse<PageResponse<DistrictResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all District");

        return ApiResponse.<PageResponse<DistrictResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(districtService.fetchAll(pageable))
                .message("Fetch All Districts With Pagination")
                .build();
    }

    @Operation(description = "API dùng để lấy danh sách wards theo district")
    @GetMapping("/private/districts/{districtId}/wards")
    public ApiResponse<PageResponse<WardResponse>> fetchWardsByDistrict(@ParameterObject @PageableDefault Pageable pageable,
                                                                        @Min(value = 1, message = "provinceId phải lớn hơn 0")
                                                                            @PathVariable Integer districtId) {
        log.info("Received request to fetch all Ward By District");

        return ApiResponse.<PageResponse<WardResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch All Wards for District")
                .result(districtService.fetchWardsByDistrictId(pageable, districtId))
                .build();
    }

}
