package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.service.ProvinceService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "PROVINCE-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class ProvinceController {

    private final ProvinceService provinceService;

    @GetMapping("/private/provinces/{id}")
    public ApiResponse<ProvinceResponse> fetchById(@Min(value = 1, message = "ID phải lớn hơn 0")
                                                    @PathVariable Integer id){
        log.info("Received request to fetch province by id: {}", id);

        return ApiResponse.<ProvinceResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Province By Id")
                .result(provinceService.fetchById(id))
                .build();
    }

    @GetMapping("/private/provinces")
    public ApiResponse<PageResponse<ProvinceResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all province");

        return ApiResponse.<PageResponse<ProvinceResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(provinceService.fetchAll(pageable))
                .message("Fetch All Provinces With Pagination")
                .build();
    }

    @Operation(description = "API dùng để lấy danh sách districts theo province")
    @GetMapping("/private/provinces/{provinceId}/districts")
    public ApiResponse<PageResponse<DistrictResponse>> fetchDistrictsByProvince(@ParameterObject @PageableDefault Pageable pageable,
                                                                         @Min(value = 1, message = "provinceId phải lớn hơn 0")
                                                                         @PathVariable Integer provinceId){
        log.info("Received request to fetch all District By Province");

        return ApiResponse.<PageResponse<DistrictResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Districts By Province ID With Pagination")
                .result(provinceService.fetchDistrictsByProvinceId(pageable, provinceId))
                .build();
    }

}
