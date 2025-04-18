package Spring_AdamStore.repository;

import Spring_AdamStore.entity.OrderItem;
import Spring_AdamStore.entity.Promotion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Long> {

    boolean existsByCode(String code);


    @Query("SELECT p " +
            "FROM Promotion p " +
            "WHERE p.status = 'ACTIVE' " +
            "AND :today BETWEEN p.startDate AND p.endDate " +
            "AND NOT EXISTS (" +
            "    SELECT 1 " +
            "    FROM PromotionUsage pu " +
            "    WHERE pu.user.id = :userId " +
            "    AND pu.promotion.id = p.id" +
            ")")
    Page<Promotion> findAllAvailableForCustomer(@Param("userId") Long userId, @Param("today") LocalDate today, Pageable pageable);

}
