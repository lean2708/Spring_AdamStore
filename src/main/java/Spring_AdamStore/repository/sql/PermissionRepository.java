package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Permission;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface PermissionRepository extends JpaRepository<Permission,Long> {


    @Query("""
    SELECT p FROM Permission p
    JOIN RoleHasPermission rp ON rp.id.permissionId = p.id
    WHERE rp.id.roleId = :roleId""")
    Page<Permission> findAllByRoleId(@Param("roleId") long roleId, Pageable pageable);

}
