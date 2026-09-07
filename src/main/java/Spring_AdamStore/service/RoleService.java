package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.dto.response.RoleResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface RoleService {

    RoleResponse fetchRoleById(long id);

    PageResponse<RoleResponse> fetchAllRoles(Pageable pageable);


    PageResponse<PermissionResponse> getPermissionsByRoleId(Pageable pageable, long roleId);
}
