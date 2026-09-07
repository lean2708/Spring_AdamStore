package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.WardResponse;
import Spring_AdamStore.entity.sql.Ward;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface WardService {

    WardResponse fetchById(String id);

    PageResponse<WardResponse> fetchAll(Pageable pageable);

    List<Ward> loadWardsFromGhn(int districtId);
}
