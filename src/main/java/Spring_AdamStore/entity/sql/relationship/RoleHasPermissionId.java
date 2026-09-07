package Spring_AdamStore.entity.sql.relationship;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class RoleHasPermissionId {

    private Long roleId;

    private Long permissionId;

}
