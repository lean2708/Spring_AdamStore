package Spring_AdamStore.repository.sql;

import Spring_AdamStore.constants.PaymentMethod;
import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.response.RevenueByMonthDTO;
import Spring_AdamStore.entity.sql.PaymentHistory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface PaymentHistoryRepository extends JpaRepository<PaymentHistory, Long> {

    void deleteAllByOrderId(Long orderId);

    List<PaymentHistory> findAllByOrderId(Long orderId);

    Optional<PaymentHistory> findByOrderIdAndPaymentStatusAndPaymentMethod(Long orderId, PaymentStatus paymentStatus, PaymentMethod paymentMethod);


    Optional<PaymentHistory> findByOrderIdAndPaymentStatus(Long orderId, PaymentStatus paymentStatus);


    @Query("SELECT p FROM PaymentHistory p " +
            "WHERE p.paymentTime >= :startDate " +
            "AND p.paymentTime <= :endDate " +
            "AND (:paymentStatus IS NULL OR p.paymentStatus = :paymentStatus)")
    Page<PaymentHistory> searchPaymentHistories(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate,
            @Param("paymentStatus") PaymentStatus paymentStatus, Pageable pageable);



    @Query(value = """
    SELECT new Spring_AdamStore.dto.response.RevenueByMonthDTO(
        FUNCTION('TO_CHAR', ph.paymentTime, 'YYYY-MM'),
        SUM(ph.totalAmount)
    )
    FROM PaymentHistory ph
    WHERE ph.isPrimary = true
      AND ph.paymentStatus = 'PAID'
      AND ph.paymentTime >= :startDate AND ph.paymentTime <= :endDate
    GROUP BY FUNCTION('TO_CHAR', ph.paymentTime, 'YYYY-MM')
    ORDER BY FUNCTION('TO_CHAR', ph.paymentTime, 'YYYY-MM')
    """)
    List<RevenueByMonthDTO> getRevenueByMonth(@Param("startDate") LocalDateTime startDate,
                                              @Param("endDate") LocalDateTime endDate);

}
