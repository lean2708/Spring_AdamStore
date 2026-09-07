package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Promotion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Long> {

    @Query(value = "SELECT COUNT(*) FROM promotions WHERE code = :code", nativeQuery = true)
    Long countByCode(@Param("code") String code);

    @Query(value = "SELECT * FROM promotions p WHERE p.id = :id", nativeQuery = true)
    Optional<Promotion> findPromotionById(@Param("id") Long id);

    @Query(value = "SELECT * FROM promotions",
            countQuery = "SELECT COUNT(*) FROM promotions",
            nativeQuery = true)
    Page<Promotion> findAllPromotions(Pageable pageable);

    @Query("SELECT p " +
            "FROM Promotion p " +
            "WHERE p.status = 'ACTIVE' " +
            "AND :today BETWEEN p.startDate AND p.endDate " +
            "AND NOT EXISTS (" +
            "    SELECT 1 " +
            "    FROM PromotionUsage pu " +
            "    WHERE pu.userId = :userId " +
            "    AND pu.promotionId = p.id" +
            ")")
    Page<Promotion> findAllAvailableForCustomer(@Param("userId") Long userId, @Param("today") LocalDate today, Pageable pageable);

}
