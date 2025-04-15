package Spring_AdamStore.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnDistrict {

     @JsonProperty("DistrictID")
     int districtId;
     @JsonProperty("DistrictName")
     String districtName;
}
