package Spring_AdamStore.dto.response;

import Spring_AdamStore.constants.OrderStatus;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderResponse {

    private Long id;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime orderDate;
    private Double discountAmount;
    private Double totalPrice;
    private OrderStatus orderStatus;

    private String customerName;

    private AddressResponse address;

    private List<OrderItemResponse> orderItems;

}
