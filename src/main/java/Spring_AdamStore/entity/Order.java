package Spring_AdamStore.entity;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.entity.relationship.PromotionUsage;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@Table(name = "tbl_order")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @JoinColumn(nullable = false)
     LocalDate orderDate;
    @JoinColumn(nullable = false)
    @ColumnDefault(value = "0")
     Double totalPrice;

    @Enumerated(EnumType.STRING)
    @JoinColumn(nullable = false)
    OrderStatus orderStatus;

    @CreationTimestamp
    LocalDate createdAt;
    @UpdateTimestamp
    LocalDate updatedAt;

    @OneToMany(mappedBy = "order")
    Set<OrderItem> orderItems = new HashSet<>();;

    @OneToMany(mappedBy = "order")
    Set<PaymentHistory> payments = new HashSet<>();;

    @OneToOne(mappedBy = "order")
     PromotionUsage promotionUsage;

    @ManyToOne
    @JoinColumn(name = "address_id")
    Address address;

    @ManyToOne
    @JoinColumn(name = "user_id")
     User user;


}
