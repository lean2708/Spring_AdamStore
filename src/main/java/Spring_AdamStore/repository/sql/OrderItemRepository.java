package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    boolean existsByProductVariantId(Long productVariantId);

    List<OrderItem> findAllByOrderId(Long orderId);

    void deleteAllByOrderId(Long orderId);

    @Query("""
        SELECT COALESCE(SUM(oi.quantity), 0)
        FROM OrderItem oi
        JOIN ProductVariant pv ON pv.id = oi.productVariantId
        WHERE pv.productId = :productId
    """)
    int getTotalSoldByProductId(Long productId);
}
