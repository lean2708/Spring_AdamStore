package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.entity.sql.Permission;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.PermissionMapper;
import Spring_AdamStore.repository.sql.PermissionRepository;
import Spring_AdamStore.service.PermissionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "PERMISSION-SERVICE")
@RequiredArgsConstructor
public class PermissionServiceImpl implements PermissionService {

    private final PermissionRepository permissionRepository;
    private final PermissionMapper permissionMapper;

    @Override
    public PermissionResponse fetchPermissionById(Long id) {
        log.info("Fetch Permission By Id: {}", id);

        Permission permissionDB = permissionRepository.findById(id).
                orElseThrow(() -> new AppException(ErrorCode.PERMISSION_NOT_EXISTED));

        return permissionMapper.toPermissionResponse(permissionDB);
    }

    @Override
    public PageResponse<PermissionResponse> fetchAllPermissions(Pageable pageable) {
        log.info("Fetch All Permission For Admin");

        Page<Permission> permissionPage = permissionRepository.findAll(pageable);

        return PageResponse.<PermissionResponse>builder()
                .page(permissionPage.getNumber())
                .size(permissionPage.getSize())
                .totalPages(permissionPage.getTotalPages())
                .totalItems(permissionPage.getTotalElements())
                .items(permissionMapper.toPermissionResponseList(permissionPage.getContent()))
                .build();
    }
}
