package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.util.Set;

@Repository
public interface RoleRepository extends JpaRepository<Role,Long> {

    Optional<Role> findByName(String name);

    Set<Role> findAllByIdIn(Set<Long> ids);

    @Query("""
    SELECT r FROM Role r
    JOIN UserHasRole uhr ON r.id = uhr.id.roleId
    WHERE uhr.id.userId = :userId""")
    Set<Role> findRolesByUserId(@Param("userId") Long userId);

}
