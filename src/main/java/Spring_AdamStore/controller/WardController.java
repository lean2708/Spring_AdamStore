package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.DistrictResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.WardResponse;
import Spring_AdamStore.service.DistrictService;
import Spring_AdamStore.service.WardService;
import jakarta.validation.constraints.Min;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "WARD-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class WardController {

    private final WardService wardService;

    @GetMapping("/private/wards/{code}")
    public ApiResponse<WardResponse> fetchById(@PathVariable String code){
        log.info("Received request to fetch ward by code: {}", code);

        return ApiResponse.<WardResponse>builder()
                .code(HttpStatus.OK.value())
                .message("Fetch Ward By Id")
                .result(wardService.fetchById(code))
                .build();
    }

    @GetMapping("/private/wards")
    public ApiResponse<PageResponse<WardResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){
        log.info("Received request to fetch all ward");

        return ApiResponse.<PageResponse<WardResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(wardService.fetchAll(pageable))
                .message("Fetch All Wards With Pagination")
                .build();
    }


}
