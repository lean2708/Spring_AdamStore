package Spring_AdamStore.service.relationship;

import Spring_AdamStore.entity.Order;
import Spring_AdamStore.entity.Promotion;
import Spring_AdamStore.entity.User;
import Spring_AdamStore.entity.relationship.PromotionUsage;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.relationship.PromotionUsageRepository;
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

    public PromotionUsage applyPromotion(Promotion promotion, Order order, User user){
        if (promotion.getStartDate().isAfter(LocalDate.now()) || promotion.getEndDate().isBefore(LocalDate.now())) {
            throw new AppException(ErrorCode.PROMOTION_EXPIRED);
        }

        boolean used = promotionUsageRepository.existsByUserAndPromotion(user, promotion);

        if(used){
            throw new AppException(ErrorCode.PROMOTION_ALREADY_USED);
        }

        return promotionUsageRepository.save(PromotionUsage.builder()
                        .discountAmount(order.getTotalPrice() * (promotion.getDiscountPercent() / 100))
                        .usedAt(LocalDateTime.now())
                        .promotion(promotion)
                        .user(user)
                        .order(order)
                .build());
    }
}
