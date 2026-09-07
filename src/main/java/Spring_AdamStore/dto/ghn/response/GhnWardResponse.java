package Spring_AdamStore.dto.ghn.response;

import lombok.*;
import java.util.List;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnWardResponse {

     private Integer code;
     private String message;
     private List<GhnWard> data;
}
