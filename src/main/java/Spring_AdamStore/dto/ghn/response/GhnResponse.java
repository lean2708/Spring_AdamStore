package Spring_AdamStore.dto.ghn.response;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnResponse {

     private Integer code;
     private String message;
     private ShippingFeeResponse data;
}
