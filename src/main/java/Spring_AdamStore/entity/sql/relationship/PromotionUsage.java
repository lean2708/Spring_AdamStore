package Spring_AdamStore.entity.sql.relationship;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

@Getter
@Setter
@Table(name = "promotion_usages")
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Entity
public class PromotionUsage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double discountAmount;
    private LocalDateTime usedAt;

    private Long userId;

    private Long promotionId;

    private Long orderId;


}
