package Spring_AdamStore.entity.sql;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Table(name = "sizes")
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Size {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;


}
