package Spring_AdamStore.service.Impl;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.dto.request.PromotionRequest;
import Spring_AdamStore.dto.request.PromotionUpdateRequest;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PromotionResponse;
import Spring_AdamStore.entity.Promotion;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.PromotionMapper;
import Spring_AdamStore.repository.PromotionRepository;
import Spring_AdamStore.service.PageableService;
import Spring_AdamStore.service.PromotionService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
@Slf4j(topic = "PROMOTION-SERVICE")
@RequiredArgsConstructor
public class PromotionServiceImpl implements PromotionService {

    private final PromotionRepository promotionRepository;
    private final PromotionMapper promotionMapper;
    private final PageableService pageableService;


    @Override
    @Transactional
    public PromotionResponse create(PromotionRequest request) {
        if(promotionRepository.existsByCode(request.getCode())){
            throw new AppException(ErrorCode.PROMOTION_EXISTED);
        }

        Promotion promotion = promotionMapper.toPromotion(request);

        return promotionMapper.toPromotionResponse(promotionRepository.save(promotion));
    }

    @Override
    public PromotionResponse fetchById(Long id) {
        Promotion promotion = findPromotionById(id);

        return promotionMapper.toPromotionResponse(promotion);
    }

    @Override
    public PageResponse<PromotionResponse> fetchAll(int pageNo, int pageSize, String sortBy) {
        pageNo = pageNo - 1;

        Pageable pageable = pageableService.createPageable(pageNo, pageSize, sortBy, Promotion.class);

        Page<Promotion> promotionPage = promotionRepository.findAll(pageable);

        return PageResponse.<PromotionResponse>builder()
                .page(promotionPage.getNumber() + 1)
                .size(promotionPage.getSize())
                .totalPages(promotionPage.getTotalPages())
                .totalItems(promotionPage.getTotalElements())
                .items(promotionMapper.toPromotionResponseList(promotionPage.getContent()))
                .build();
    }

    @Override
    public PromotionResponse update(Long id, PromotionUpdateRequest request) {
        if(promotionRepository.existsByCode(request.getCode()) && request.getCode() != null){
            throw new AppException(ErrorCode.PROMOTION_EXISTED);
        }

        Promotion promotion = findPromotionById(id);

        promotionMapper.update(promotion, request);

        return promotionMapper.toPromotionResponse(promotionRepository.save(promotion));
    }

    @Transactional
    @Override
    public void delete(Long id) {
        Promotion promotion = findPromotionById(id);

        promotion.setStatus(EntityStatus.INACTIVE);

        promotionRepository.save(promotion);

    }

    private Promotion findPromotionById(Long id) {
        return promotionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PROMOTION_NOT_EXISTED));
    }
}
