package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.DistrictResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.ProvinceResponse;
import Spring_AdamStore.entity.sql.Province;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProvinceService {

    ProvinceResponse fetchById(Integer id);

    PageResponse<ProvinceResponse> fetchAll(Pageable pageable);

    PageResponse<DistrictResponse> fetchDistrictsByProvinceId(Pageable pageable, Integer provinceId);

    List<Province> loadProvincesFromGhn();
}
