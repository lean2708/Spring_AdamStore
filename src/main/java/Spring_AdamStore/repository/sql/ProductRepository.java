package Spring_AdamStore.repository.sql;

import Spring_AdamStore.dto.response.TopSellingDTO;
import Spring_AdamStore.entity.sql.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query(value = "SELECT COUNT(*) FROM products WHERE name = :name", nativeQuery = true)
    Long countByName(@Param("name") String name);

    @Query(value = "SELECT * FROM products p WHERE p.id = :id", nativeQuery = true)
    Optional<Product> findProductById(@Param("id") Long id);

    Page<Product> findByCategoryId(Long categoryId, Pageable pageable);

    @Query(value = "SELECT COUNT(*) FROM products p WHERE p.category_id = :categoryId AND p.status = :status", nativeQuery = true)
    Long countActiveProductsByCategoryId(@Param("categoryId") Long categoryId, @Param("status") String status);

    @Query(value = "SELECT * FROM products",
            countQuery = "SELECT COUNT(*) FROM products",
            nativeQuery = true)
    Page<Product> findAllProducts(Pageable pageable);



    @Query("""
        SELECT new Spring_AdamStore.dto.response.TopSellingDTO(
            p.id,
            p.name,
            COALESCE(MIN(f.imageUrl), ''),
            p.status,
            SUM(oi.quantity),
            SUM(CAST(oi.quantity * oi.unitPrice AS double))
        )
        FROM OrderItem oi
        JOIN ProductVariant pv ON oi.productVariantId = pv.id
        JOIN Product p ON pv.productId = p.id
        JOIN Order o ON oi.orderId = o.id
        LEFT JOIN FileEntity f ON f.productId = p.id
        WHERE o.orderStatus = 'DELIVERED'
          AND o.orderDate BETWEEN :startDate AND :endDate
        GROUP BY p.id, p.name, p.status
        ORDER BY SUM(oi.quantity) DESC
    """)
    List<TopSellingDTO> findTopSellingProductsBetween(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );

}
