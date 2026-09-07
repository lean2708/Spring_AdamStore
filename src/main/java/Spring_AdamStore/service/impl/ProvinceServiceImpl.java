package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.ghn.response.GhnProvinceResponse;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.District;
import Spring_AdamStore.entity.sql.Province;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.DistrictMapper;
import Spring_AdamStore.mapper.ProvinceMapper;
import Spring_AdamStore.repository.sql.DistrictRepository;
import Spring_AdamStore.repository.sql.ProvinceRepository;
import Spring_AdamStore.repository.httpclient.GhnClient;
import Spring_AdamStore.service.ProvinceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j(topic = "PROVINCE-SERVICE")
@RequiredArgsConstructor
public class ProvinceServiceImpl implements ProvinceService {

    private final ProvinceRepository provinceRepository;
    private final ProvinceMapper provinceMapper;
    private final GhnClient ghnClient;
    private final DistrictMapper districtMapper;
    private final DistrictRepository districtRepository;

    @Value("${ghn.token}")
    private String ghnToken;


    @Override
    public ProvinceResponse fetchById(Integer id) {
        log.info("Fetch Province By Id: {}", id);

        Province province = findProvinceById(id);

        return provinceMapper.toProvinceResponse(province);
    }

    @Override
    public PageResponse<ProvinceResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All Province");

        Page<Province> provincePage = provinceRepository.findAll(pageable);

        return PageResponse.<ProvinceResponse>builder()
                .page(provincePage.getNumber())
                .size(provincePage.getSize())
                .totalPages(provincePage.getTotalPages())
                .totalItems(provincePage.getTotalElements())
                .items(provinceMapper.toProvinceResponseList(provincePage.getContent()))
                .build();
    }

    @Override
    public PageResponse<DistrictResponse> fetchDistrictsByProvinceId(Pageable pageable, Integer provinceId) {
        log.info("Fetch All District By Province");

        Page<District> districtPage = districtRepository.findByProvinceId(provinceId, pageable);

        return PageResponse.<DistrictResponse>builder()
                .page(districtPage.getNumber())
                .size(districtPage.getSize())
                .totalPages(districtPage.getTotalPages())
                .totalItems(districtPage.getTotalElements())
                .items(districtMapper.toDistrictResponseList(districtPage.getContent()))
                .build();
    }


    private Province findProvinceById(Integer id) {
        return provinceRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PROVINCE_NOT_EXISTED));
    }

    public List<Province> loadProvincesFromGhn(){
        log.info("Starting API call to GHN to fetch list of provinces");
        try {
            GhnProvinceResponse response = ghnClient.getProvinces(ghnToken);

            if (response != null && response.getData() != null) {
                return provinceMapper.GhnProvinceListToProvinceList(response.getData());
            }

        } catch (Exception e) {
            log.error("Lỗi khi gọi API GHN để lấy Tỉnh (Feign): {}", e.getMessage(), e);
            throw new RuntimeException("Lỗi khi gọi API GHN (Tỉnh) : " + e.getMessage(), e);
        }
        return List.of();
    }
}
