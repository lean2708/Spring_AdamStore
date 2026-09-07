package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.request.SizeRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.SizeResponse;
import Spring_AdamStore.service.ColorService;
import Spring_AdamStore.service.SizeService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "SIZE-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class SizeController {

    private final SizeService sizeService;

    @GetMapping("/public/sizes")
    public ApiResponse<PageResponse<SizeResponse>> fetchAll(@ParameterObject @PageableDefault Pageable pageable){

        log.info("Received request to fetch all Size");

        return ApiResponse.<PageResponse<SizeResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(sizeService.fetchAll(pageable))
                .message("Fetch All Sizes With Pagination")
                .build();
    }

}
