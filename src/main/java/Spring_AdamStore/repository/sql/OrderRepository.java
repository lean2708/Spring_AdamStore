package Spring_AdamStore.repository.sql;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.entity.sql.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o FROM Order o WHERE o.userId = :userId AND o.orderStatus = :orderStatus")
    List<Order> findByUserIdAndOrderStatus(@Param("userId") Long userId,
                                           @Param("orderStatus") OrderStatus orderStatus);


    @Query("SELECT o FROM Order o " +
            "WHERE o.orderDate >= :startDate AND o.orderDate <= :endDate " +
            "AND (:orderStatus IS NULL OR o.orderStatus = :orderStatus)")
    Page<Order> findOrdersByDateAndStatus(@Param("startDate") LocalDateTime startDate,
                                          @Param("endDate") LocalDateTime endDate,
                                          @Param("orderStatus") OrderStatus orderStatus,
                                          Pageable pageable);

    List<Order> findByOrderStatusAndOrderDateBefore(OrderStatus orderStatus, LocalDateTime dateTime);


    @Query("SELECT COUNT(o) > 0 FROM Order o WHERE o.userId = :userId AND o.orderStatus IN :statuses")
    Boolean existsByUserIdAndOrderStatusIn(@Param("userId") Long userId, @Param("statuses") List<OrderStatus> statuses);

    List<Order> findAllByOrderDateBetweenAndOrderStatus(LocalDateTime startDate,
                                                        LocalDateTime endDate,
                                                        OrderStatus orderStatus);


    @Query("SELECT COUNT(o) > 0 FROM Order o WHERE o.addressId = :addressId AND o.orderStatus IN :statuses")
    boolean existsByAddressIdAndStatusIn(@Param("addressId") Long addressId,
                                         @Param("statuses") List<OrderStatus> statuses);

}
