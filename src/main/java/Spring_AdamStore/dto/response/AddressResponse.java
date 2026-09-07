package Spring_AdamStore.dto.response;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.WardBasic;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AddressResponse {

    private Long id;

    private Boolean isDefault;

    private Boolean isVisible;

    private EntityStatus status;

    private String phone;
    private String streetDetail;

    private WardBasic ward;

    private EntityBasic district;

    private EntityBasic province;


}
