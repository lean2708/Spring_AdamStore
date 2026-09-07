package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.PromotionRequest;
import Spring_AdamStore.dto.request.PromotionUpdateRequest;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PromotionResponse;
import Spring_AdamStore.dto.response.UserResponse;
import Spring_AdamStore.entity.sql.Promotion;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.PromotionMapper;
import Spring_AdamStore.repository.criteria.SearchCriteria;
import Spring_AdamStore.repository.criteria.SearchCriteriaQueryConsumer;
import Spring_AdamStore.repository.sql.PromotionRepository;
import Spring_AdamStore.repository.sql.relationship.PromotionUsageRepository;
import Spring_AdamStore.service.PromotionService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.*;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;


@Service
@Slf4j(topic = "PROMOTION-SERVICE")
@RequiredArgsConstructor
public class PromotionServiceImpl implements PromotionService {

    private final PromotionRepository promotionRepository;
    private final PromotionMapper promotionMapper;
    private final PromotionUsageRepository promotionUsageRepository;
    @PersistenceContext
    private EntityManager entityManager;


    @Override
    @Transactional
    public PromotionResponse create(PromotionRequest request) {
        log.info("Creating Promotion with data= {}", request);

        if(promotionRepository.countByCode(request.getCode()) > 0){
            throw new AppException(ErrorCode.PROMOTION_EXISTED);
        }

        Promotion promotion = promotionMapper.toPromotion(request);

        return promotionMapper.toPromotionResponse(promotionRepository.save(promotion));
    }

    @Override
    public PromotionResponse fetchById(Long id) {
        log.info("Fetch Promotion By Id: {}", id);

        Promotion promotion = findPromotionById(id);

        return promotionMapper.toPromotionResponse(promotion);
    }

    @Override
    public PageResponse<PromotionResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All Promotion For Admin");

        Page<Promotion> promotionPage = promotionRepository.findAllPromotions(pageable);

        return PageResponse.<PromotionResponse>builder()
                .page(promotionPage.getNumber())
                .size(promotionPage.getSize())
                .totalPages(promotionPage.getTotalPages())
                .totalItems(promotionPage.getTotalElements())
                .items(promotionMapper.toPromotionResponseList(promotionPage.getContent()))
                .build();
    }

    @Override
    public PageResponse<PromotionResponse> searchPromotion(Pageable pageable, List<String> search) {
        log.info("Searching Promotions with pageable={} and search params={}", pageable, search);

        List<SearchCriteria> criteriaList = new ArrayList<>();

        // lay danh sach cac dieu kien search
        if(search != null){
            for(String s : search){
                Pattern pattern = Pattern.compile("(\\w+?)(~|>|<|=)(.*)");
                Matcher matcher = pattern.matcher(s);
                if(matcher.find()){
                    criteriaList.add(new SearchCriteria(matcher.group(1), matcher.group(2), matcher.group(3)));
                }
            }
        }

        List<Promotion> promotionList = getPromotionList(pageable, criteriaList);

        Long totalElements = getTotalElements(criteriaList);
        int totalPages = (int) Math.ceil((double) totalElements / pageable.getPageSize());

        return PageResponse.<PromotionResponse>builder()
                .page(pageable.getPageNumber())
                .size(pageable.getPageSize())
                .totalPages(totalPages)
                .totalItems(totalElements)
                .items(promotionMapper.toPromotionResponseList(promotionList))
                .build();
    }

    private List<Promotion> getPromotionList(Pageable pageable, List<SearchCriteria> criteriaList) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Promotion> query = builder.createQuery(Promotion.class);
        Root<Promotion> root = query.from(Promotion.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        if(!CollectionUtils.isEmpty(criteriaList)){ // search
            SearchCriteriaQueryConsumer queryConsumer = new SearchCriteriaQueryConsumer(builder, predicate, root);
            criteriaList.forEach(queryConsumer);

            predicate = builder.and(predicate, queryConsumer.getPredicate());
        }

        query.where(predicate);

        // Sort
        List<Order> orders = new ArrayList<>();
        for (Sort.Order order : pageable.getSort()) {
            String property = order.getProperty();

            Path<?> path = root.get(property);
            orders.add(order.isAscending() ? builder.asc(path) : builder.desc(path));
        }

        query.orderBy(orders);

        return entityManager.createQuery(query)
                .setFirstResult((int) pageable.getOffset())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
    }

    private Long getTotalElements(List<SearchCriteria> criteriaList){
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);

        Root<Promotion> root = countQuery.from(Promotion.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        if(!CollectionUtils.isEmpty(criteriaList)){ // search job
            SearchCriteriaQueryConsumer queryConsumer = new SearchCriteriaQueryConsumer(builder, predicate, root);
            criteriaList.forEach(queryConsumer);
            predicate = builder.and(predicate, queryConsumer.getPredicate());
        }

        countQuery.select(builder.count(root));
        countQuery.where(predicate);

        return entityManager.createQuery(countQuery).getSingleResult();
    }


    @Override
    @Transactional
    public PromotionResponse update(Long id, PromotionUpdateRequest request) {
        log.info("Updated Promotion with data= {}", request);

        Promotion promotion = findPromotionById(id);

        if(!request.getCode().equals(promotion.getCode()) && promotionRepository.countByCode(request.getCode()) > 0){
            throw new AppException(ErrorCode.PROMOTION_EXISTED);
        }

        promotionMapper.update(promotion, request);

        return promotionMapper.toPromotionResponse(promotionRepository.save(promotion));
    }

    @Transactional
    @Override
    public void delete(Long id) {
        log.info("Delete Promotion By Id: {}", id);

        Promotion promotion = findPromotionById(id);

        if(promotionUsageRepository.existsByPromotionId(promotion.getId())){
            throw new AppException(ErrorCode.PROMOTION_USAGE_CONFLICT);
        }

        promotionRepository.delete(promotion);
    }

    @Override
    public PromotionResponse restore(long id) {
        log.info("Restore Promotion By Id: {}", id);

        Promotion promotion = promotionRepository.findPromotionById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BRANCH_NOT_EXISTED));

        promotion.setStatus(ACTIVE);
        return promotionMapper.toPromotionResponse(promotionRepository.save(promotion));
    }

    private Promotion findPromotionById(Long id) {
        return promotionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PROMOTION_NOT_EXISTED));
    }
}
