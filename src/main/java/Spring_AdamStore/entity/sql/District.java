package Spring_AdamStore.entity.sql;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Table(name = "districts")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class District {

    @Id
    private Integer id;

    private String name;

    private Integer provinceId;
}
