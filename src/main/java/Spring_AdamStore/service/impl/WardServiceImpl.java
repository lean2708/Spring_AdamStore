package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.ghn.request.GhnWardRequest;
import Spring_AdamStore.dto.ghn.response.GhnWardResponse;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.Ward;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.WardMapper;
import Spring_AdamStore.repository.sql.WardRepository;
import Spring_AdamStore.repository.httpclient.GhnClient;
import Spring_AdamStore.service.WardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j(topic = "WARD-SERVICE")
@RequiredArgsConstructor
public class WardServiceImpl implements WardService {

    private final WardRepository wardRepository;
    private final WardMapper wardMapper;
    private final GhnClient ghnClient;

    @Value("${ghn.token}")
    private String ghnToken;


    @Override
    public WardResponse fetchById(String code) {
        log.info("Fetch ward By code: {}", code);

        Ward ward = findWardById(code);

        return wardMapper.toWardResponse(ward);
    }

    @Override
    public PageResponse<WardResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All Ward");

        Page<Ward> wardPage = wardRepository.findAll(pageable);

        return PageResponse.<WardResponse>builder()
                .page(wardPage.getNumber())
                .size(wardPage.getSize())
                .totalPages(wardPage.getTotalPages())
                .totalItems(wardPage.getTotalElements())
                .items(wardMapper.toWardResponseList(wardPage.getContent()))
                .build();
    }

    @Override
    public List<Ward> loadWardsFromGhn(int districtId) {
        log.info("Starting API call to GHN to fetch list of wards for District Id : {}", districtId);

        GhnWardRequest request =  GhnWardRequest.builder()
                .districtId(districtId)
                .build();

        try {
            GhnWardResponse response = ghnClient.getWards(ghnToken, request);
            if (response != null && response.getData() != null) {
                return wardMapper.ghnWardListToWardList(response.getData());
            }

        } catch (Exception e) {
            log.error("Lỗi khi gọi API GHN để lấy phường/xã: {}", e.getMessage(), e);
            throw new RuntimeException("Lỗi khi gọi API GHN (Phường/Xã) : " + e.getMessage(), e);
        }
        return List.of();
    }

    private Ward findWardById(String code) {
        return wardRepository.findById(code)
                .orElseThrow(() -> new AppException(ErrorCode.WARD_NOT_EXISTED));
    }
}
