package Spring_AdamStore.entity.sql;

import Spring_AdamStore.constants.EntityStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;

@Getter
@Setter
@Table(name = "product_variants")
@SQLDelete(sql = "UPDATE product_variants SET status = 'INACTIVE' WHERE id = ?")
@SQLRestriction("status = 'ACTIVE'")
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Entity
public class ProductVariant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Boolean isAvailable;
    private Double price;
    private Integer quantity;

    @Enumerated(EnumType.STRING)
    private EntityStatus status;

    private Long productId;

    private Long colorId;

    private Long sizeId;


    @PrePersist
    public void handleBeforeCreate(){
        if(status == null){
            this.status = ACTIVE;
        }
        if(quantity > 0){
            this.isAvailable = true;
        }
    }
}
