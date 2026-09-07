package Spring_AdamStore.service.relationship;

import Spring_AdamStore.entity.sql.Order;
import Spring_AdamStore.entity.sql.Promotion;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.entity.sql.relationship.PromotionUsage;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.sql.relationship.PromotionUsageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Slf4j(topic = "PROMOTION-USAGE-SERVICE")
@Service
@RequiredArgsConstructor
public class PromotionUsageService {

    private final PromotionUsageRepository promotionUsageRepository;

    public PromotionUsage applyPromotion(Promotion promotion, Order order, User user, double currentTotal){
        if (promotion.getStartDate().isAfter(LocalDate.now()) || promotion.getEndDate().isBefore(LocalDate.now())) {
            throw new AppException(ErrorCode.PROMOTION_EXPIRED);
        }

        // check user su dung chua
        boolean used = promotionUsageRepository.existsByUserIdAndPromotionId(user.getId(), promotion.getId());

        if(used){
            throw new AppException(ErrorCode.PROMOTION_ALREADY_USED);
        }

        return promotionUsageRepository.save(PromotionUsage.builder()
                        .discountAmount(currentTotal * (promotion.getDiscountPercent() / 100.0))
                        .usedAt(LocalDateTime.now())
                        .promotionId(promotion.getId())
                        .userId(user.getId())
                        .orderId(order.getId())
                .build());
    }
}
