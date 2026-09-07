package Spring_AdamStore.dto.response;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.ImageBasic;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductVariantResponse {

    private Long id;

    private Double price;
    private Integer quantity;
    private Boolean isAvailable;

    private EntityStatus status;

    private EntityBasic size;
    private EntityBasic color;
}
