package Spring_AdamStore.entity.sql;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Table(name = "wards")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Ward {

    @Id
    private String code;

    private String name;

    private Integer districtId;
}
