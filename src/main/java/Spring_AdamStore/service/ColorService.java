package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.request.PromotionRequest;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PromotionResponse;
import org.springframework.data.domain.Pageable;

public interface ColorService {

    ColorResponse create(ColorRequest request);

    PageResponse<ColorResponse> fetchAll(Pageable pageable);

    ColorResponse update(Long id, ColorRequest request);

    void delete(Long id);
}
