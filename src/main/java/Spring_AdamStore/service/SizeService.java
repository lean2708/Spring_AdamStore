package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.request.SizeRequest;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.SizeResponse;
import org.springframework.data.domain.Pageable;

public interface SizeService {


    PageResponse<SizeResponse> fetchAll(Pageable pageable);
}
