package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import org.springframework.data.domain.Pageable;

public interface PermissionService {

    PermissionResponse fetchPermissionById(Long id);

    PageResponse<PermissionResponse> fetchAllPermissions(Pageable pageable);
}
