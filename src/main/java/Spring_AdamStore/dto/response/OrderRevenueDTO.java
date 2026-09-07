package Spring_AdamStore.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderRevenueDTO {

     private Long id;
     private String customerName;
     private Double totalPrice;
     private String paymentMethod;
     @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
     private LocalDateTime orderDate;
     private String orderStatus;

}
