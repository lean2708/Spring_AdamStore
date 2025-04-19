package Spring_AdamStore.repository.relationship;

import Spring_AdamStore.entity.Promotion;
import Spring_AdamStore.entity.User;
import Spring_AdamStore.entity.relationship.PromotionUsage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PromotionUsageRepository extends JpaRepository<PromotionUsage, Long> {

    boolean existsByUserAndPromotion(User user, Promotion promotion);
}
