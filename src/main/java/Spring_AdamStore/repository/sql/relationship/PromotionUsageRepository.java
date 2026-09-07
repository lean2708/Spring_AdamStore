package Spring_AdamStore.repository.sql.relationship;

import Spring_AdamStore.entity.sql.relationship.PromotionUsage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PromotionUsageRepository extends JpaRepository<PromotionUsage, Long> {

    boolean existsByUserIdAndPromotionId(Long userId, Long promotionId);

    Boolean existsByPromotionId(Long promotionId);

    Boolean existsByUserId(Long userId);

    void deleteAllByOrderId(Long orderId);

    Optional<PromotionUsage> findByUserIdAndOrderId(Long userId, Long orderId);
}
