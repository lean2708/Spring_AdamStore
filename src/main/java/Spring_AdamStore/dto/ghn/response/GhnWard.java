package Spring_AdamStore.dto.ghn.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnWard {

    @JsonProperty("WardCode")
     private String wardCode;
    @JsonProperty("WardName")
     private String wardName;
}
