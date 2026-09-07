package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Query("SELECT COALESCE(AVG(r.rating), 0) FROM Review r WHERE r.productId = :productId")
    double getAverageRatingByProductId(@Param("productId") Long productId);

    @Query("SELECT COUNT(r) FROM Review r WHERE r.productId = :productId")
    int getTotalReviewsByProductId(@Param("productId") Long productId);

    Page<Review> findAllByProductId(Long productId, Pageable pageable);

    Optional<Review> findByOrderItemIdAndUserId(Long orderItemId, Long userId);

}
