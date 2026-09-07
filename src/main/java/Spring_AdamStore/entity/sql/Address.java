package Spring_AdamStore.entity.sql;

import Spring_AdamStore.constants.EntityStatus;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@SQLRestriction("status = 'ACTIVE'")
@SQLDelete(sql = "UPDATE addresses SET status = 'INACTIVE' WHERE id = ?")
@Table(name = "addresses")
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Boolean isDefault;

    private Boolean isVisible;

    @Enumerated(EnumType.STRING)
    private EntityStatus status;

    private String phone;

    private String streetDetail;

    private String wardCode;

    private Integer districtId;

    private Integer provinceId;

    private Long userId;

    @CreatedBy
    private String createdBy;
    @LastModifiedBy
    private String updatedBy;
    @CreationTimestamp
    private LocalDate createdAt;
    @UpdateTimestamp
    private LocalDate updatedAt;


    @PrePersist
    public void handleBeforeCreate() {
        if (isDefault == null) {
            this.isDefault = false;
        }
        if (status == null) {
            this.status = EntityStatus.ACTIVE;
        }
        if(isVisible == null){
            this.isVisible = true;
        }
    }
}
