package Spring_AdamStore.entity;

import Spring_AdamStore.constants.OrderStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;
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

     LocalDate orderDate;
     Double totalPrice;

    @Enumerated(EnumType.STRING)
    OrderStatus orderStatus;

    @ManyToOne
    @JoinColumn(name = "user_id")
     User user;

    @OneToMany(mappedBy = "order")
    Set<OrderItem> orderItems;


    @OneToMany(mappedBy = "order")
    Set<PaymentHistory> payments;

}
