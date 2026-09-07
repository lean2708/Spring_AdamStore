package Spring_AdamStore.entity.sql;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Table(name = "roles")
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;


}
