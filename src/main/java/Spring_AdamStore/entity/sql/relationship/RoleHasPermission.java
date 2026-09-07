package Spring_AdamStore.entity.sql.relationship;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@Table(name = "role_has_permission")
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Entity
public class RoleHasPermission {

    @Id
    @EmbeddedId
    private RoleHasPermissionId id;


}
