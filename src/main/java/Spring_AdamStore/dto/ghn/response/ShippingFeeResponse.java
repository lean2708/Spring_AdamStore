package Spring_AdamStore.dto.ghn.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShippingFeeResponse {

     @JsonProperty("total")
     private Integer total;
     @JsonProperty("service_fee")
     private Integer serviceFee;
     @JsonProperty("insurance_fee")
     private Integer insuranceFee;
     @JsonProperty("r2s_fee")
     private Integer pickStationFee;
     @JsonProperty("coupon_value")
     private Integer couponValue;
     @JsonProperty("pick_station_fee")
     private Integer r2sFee;
}
