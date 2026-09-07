package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.PromotionRequest;
import Spring_AdamStore.dto.request.PromotionUpdateRequest;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PromotionResponse;
import jakarta.validation.constraints.Min;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PromotionService {

    PromotionResponse create(PromotionRequest request);

    PromotionResponse fetchById(Long id);

    PageResponse<PromotionResponse> fetchAll(Pageable pageable);

    PageResponse<PromotionResponse> searchPromotion(Pageable pageable, List<String> search);

    PromotionResponse update(Long id, PromotionUpdateRequest request);

    void delete(Long id);

    PromotionResponse restore(long id);


}
