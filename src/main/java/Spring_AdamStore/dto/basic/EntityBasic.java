package Spring_AdamStore.dto.basic;

import lombok.*;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EntityBasic {
    long id;
    String name;
}
