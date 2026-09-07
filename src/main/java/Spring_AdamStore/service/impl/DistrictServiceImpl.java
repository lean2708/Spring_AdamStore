package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.ghn.request.GhnDistrictRequest;
import Spring_AdamStore.dto.ghn.response.GhnDistrictResponse;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.District;
import Spring_AdamStore.entity.sql.Ward;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.DistrictMapper;
import Spring_AdamStore.mapper.WardMapper;
import Spring_AdamStore.repository.sql.DistrictRepository;
import Spring_AdamStore.repository.sql.WardRepository;
import Spring_AdamStore.repository.httpclient.GhnClient;
import Spring_AdamStore.service.DistrictService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j(topic = "DISTRICT-SERVICE")
@RequiredArgsConstructor
public class DistrictServiceImpl implements DistrictService {

    private final DistrictMapper districtMapper;
    private final DistrictRepository districtRepository;
    private final GhnClient ghnClient;
    private final WardMapper wardMapper;
    private final WardRepository wardRepository;

    @Value("${ghn.token}")
    private String ghnToken;

    @Override
    public DistrictResponse fetchById(Integer id) {
        log.info("Fetch District By Id: {}", id);

        District district = findDistrictById(id);

        return districtMapper.toDistrictResponse(district);
    }

    @Override
    public PageResponse<DistrictResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All District");

        Page<District> districtPage = districtRepository.findAll(pageable);

        return PageResponse.<DistrictResponse>builder()
                .page(districtPage.getNumber())
                .size(districtPage.getSize())
                .totalPages(districtPage.getTotalPages())
                .totalItems(districtPage.getTotalElements())
                .items(districtMapper.toDistrictResponseList(districtPage.getContent()))
                .build();
    }


    public List<District> loadDistrictsFromGhn(Integer provinceId){
        log.info("Starting API call to GHN to fetch list of districts for ProvinceId : {}", provinceId);

        GhnDistrictRequest request = GhnDistrictRequest.builder()
                .provinceId(provinceId)
                .build();

        try{
            GhnDistrictResponse response = ghnClient.getDistricts(ghnToken, request);
            if (response != null && response.getData() != null) {
                return districtMapper.GhnDistrictListToDistrictList(response.getData());
            }
        }
        catch (Exception e) {
            log.error("Lỗi khi gọi API GHN để lấy Quận/Huyện: {}", e.getMessage(), e);
            throw new RuntimeException("Lỗi khi gọi API GHN (Quận/Huyện) : " + e.getMessage(), e);
        }
        return List.of();
    }

    @Override
    public PageResponse<WardResponse> fetchWardsByDistrictId(Pageable pageable, Integer districtId) {
        log.info("Fetch All Ward By District");

        Page<Ward> wardPage = wardRepository.findByDistrictId(districtId, pageable);

        return PageResponse.<WardResponse>builder()
                .page(wardPage.getNumber())
                .size(wardPage.getSize())
                .totalPages(wardPage.getTotalPages())
                .totalItems(wardPage.getTotalElements())
                .items(wardMapper.toWardResponseList(wardPage.getContent()))
                .build();
    }

    private District findDistrictById(Integer id) {
        return districtRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DISTRICT_NOT_EXISTED));
    }
}
