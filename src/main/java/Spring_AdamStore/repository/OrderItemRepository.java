package Spring_AdamStore.repository;

import Spring_AdamStore.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    boolean existsByProductVariantId(Long productVariantId);
}
