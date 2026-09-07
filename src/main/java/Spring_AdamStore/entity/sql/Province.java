package Spring_AdamStore.entity.sql;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Table(name = "provinces")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Province {

    @Id
    private Integer id;
    private String name;


}
