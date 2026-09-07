package Spring_AdamStore.dto.ghn.response;

import lombok.*;

import java.util.List;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GhnDistrictResponse {

     private int code;

     private String message;

     private List<GhnDistrict> data;

}
