package Spring_AdamStore.entity.sql;

import Spring_AdamStore.constants.EntityStatus;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.*;
import org.hibernate.annotations.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;


@Getter
@Setter
@Table(name = "products")
@SQLDelete(sql = "UPDATE products SET status = 'INACTIVE' WHERE id = ?")
@SQLRestriction("status = 'ACTIVE'")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Boolean isAvailable;

    private String name;
    private String description;

    private Integer soldQuantity;
    private Double averageRating;
    private Integer totalReviews;

    private Double minPrice;
    private Double maxPrice;


    @Enumerated(EnumType.STRING)
    private EntityStatus status;

    @CreatedBy
    private String createdBy;
    @LastModifiedBy
    private String updatedBy;
    @CreationTimestamp
    private LocalDate createdAt;
    @UpdateTimestamp
    private LocalDate updatedAt;


    private Long categoryId;


    @PrePersist
    public void handleBeforeCreate() {
        if(status == null){
            this.status = ACTIVE;
        }
        if(soldQuantity == null){
            this.soldQuantity = 0;
        }
        if(averageRating == null){
            this.averageRating = 5.0;
        }
        if(totalReviews == null){
            this.totalReviews = 0;
        }
        if(isAvailable == null){
            this.isAvailable = true;
        }
    }
}
