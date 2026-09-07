package Spring_AdamStore.repository.sql.relationship;

import Spring_AdamStore.entity.sql.relationship.UserHasRole;
import Spring_AdamStore.entity.sql.relationship.UserHasRoleId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserHasRoleRepository extends JpaRepository<UserHasRole, UserHasRoleId> {

    void deleteAllByIdUserId(Long userId);



}
