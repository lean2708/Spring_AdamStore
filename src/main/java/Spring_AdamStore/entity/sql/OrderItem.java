package Spring_AdamStore.entity.sql;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Table(name = "order_items")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity;
    private Double unitPrice;

    private Long productVariantId;

    private Long orderId;

}
