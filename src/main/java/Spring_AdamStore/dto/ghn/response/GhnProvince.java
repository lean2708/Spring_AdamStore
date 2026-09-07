package Spring_AdamStore.dto.ghn.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnProvince {

    @JsonProperty("ProvinceID")
     private int provinceId;

    @JsonProperty("ProvinceName")
     private String provinceName;
}
