package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.DistrictResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.WardResponse;
import Spring_AdamStore.entity.sql.District;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface DistrictService {

    DistrictResponse fetchById(Integer id);

    PageResponse<DistrictResponse> fetchAll(Pageable pageable);

    List<District> loadDistrictsFromGhn(Integer provinceId);

    PageResponse<WardResponse> fetchWardsByDistrictId(Pageable pageable, Integer districtId);
}
