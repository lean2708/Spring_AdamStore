package Spring_AdamStore.dto.ghn.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShippingFeeRequest {

     @JsonProperty("service_type_id")
     private Integer serviceTypeId;

     @JsonProperty("insurance_value")
     private Integer insuranceValue;

     @JsonProperty("coupon")
     private String coupon;

     @JsonProperty("to_ward_code")
     private String toWardCode;

     @JsonProperty("to_district_id")
     private Integer toDistrictId;

     @JsonProperty("from_district_id")
     private Integer fromDistrictId;

     @JsonProperty("weight")
     private Integer weight;

     @JsonProperty("length")
     private Integer length;

     @JsonProperty("width")
     private Integer width;

     @JsonProperty("height")
     private Integer height;
}
