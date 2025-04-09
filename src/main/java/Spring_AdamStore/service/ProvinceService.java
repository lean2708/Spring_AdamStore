package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.ProvinceResponse;

public interface ProvinceService {


    ProvinceResponse fetchById(Long id);

    PageResponse<ProvinceResponse> fetchAll(int pageNo, int pageSize, String sortBy);

}
