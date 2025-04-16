package Spring_AdamStore.dto.response;

import Spring_AdamStore.constants.OrderStatus;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDate;
import java.util.List;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderResponse {

    Long id;
    LocalDate orderDate;
    Double totalPrice;
    OrderStatus orderStatus;


    AddressResponse address;

    List<OrderItemResponse> orderItems;

    LocalDate createdAt;
    LocalDate updatedAt;
}
