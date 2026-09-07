package Spring_AdamStore.dto.ghn.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GhnDistrictRequest {

    @JsonProperty("province_id")
    private Integer provinceId;
}
