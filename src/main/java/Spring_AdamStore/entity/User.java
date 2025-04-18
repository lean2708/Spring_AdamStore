package Spring_AdamStore.entity;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.constants.Gender;
import Spring_AdamStore.entity.relationship.PromotionUsage;
import Spring_AdamStore.entity.relationship.UserHasRole;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SQLRestriction;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@Table(name = "tbl_user")
@SQLRestriction("status = 'ACTIVE'")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(nullable = false)
    String name;
    @Column(unique = true, nullable = false)
    String email;
    String phone;
    String password;
    String avatarUrl;

    LocalDate dob;
    @Enumerated(EnumType.STRING)
    Gender gender;

    @Enumerated(EnumType.STRING)
    @JoinColumn(name = "status", nullable = false)
    EntityStatus status;


    @CreatedBy
    String createdBy;
    @LastModifiedBy
    String updatedBy;
    @CreationTimestamp
    LocalDate createdAt;
    @UpdateTimestamp
    LocalDate updatedAt;


    @OneToOne(mappedBy = "user")
    Cart cart;

    @OneToMany(mappedBy = "user")
     Set<Order> orders = new HashSet<>();

    @OneToMany(mappedBy = "user")
     Set<Address> addresses = new HashSet<>();

    @OneToMany(mappedBy = "user")
     Set<Review> reviews = new HashSet<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    Set<UserHasRole> roles = new HashSet<>();

    @OneToMany(mappedBy = "user")
    Set<PromotionUsage> promotionUsages = new HashSet<>();

    @PrePersist
    public void prePersist() {
        if (status == null) {
            this.status = EntityStatus.ACTIVE;
        }
    }
}
