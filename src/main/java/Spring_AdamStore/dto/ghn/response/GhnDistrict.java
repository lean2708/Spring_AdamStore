package Spring_AdamStore.dto.ghn.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnDistrict {

     @JsonProperty("DistrictID")
     private int districtId;

     @JsonProperty("DistrictName")
     private String districtName;
}
