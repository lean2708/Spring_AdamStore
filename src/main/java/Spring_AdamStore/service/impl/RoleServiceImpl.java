package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.dto.response.RoleResponse;
import Spring_AdamStore.entity.sql.Permission;
import Spring_AdamStore.entity.sql.Role;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.PermissionMapper;
import Spring_AdamStore.mapper.RoleMapper;
import Spring_AdamStore.repository.sql.PermissionRepository;
import Spring_AdamStore.repository.sql.RoleRepository;
import Spring_AdamStore.service.RoleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "ROLE-SERVICE")
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {

    private final RoleRepository roleRepository;
    private final RoleMapper roleMapper;
    private final PermissionRepository permissionRepository;
    private final PermissionMapper permissionMapper;

    @Override
    public RoleResponse fetchRoleById(long id) {
        log.info("Fetch Role By Id: {}", id);

        Role roleDB = findRoleById(id);

        return roleMapper.toRoleResponse(roleDB);
    }

    @Override
    public PageResponse<RoleResponse> fetchAllRoles(Pageable pageable) {
        Page<Role> rolePage = roleRepository.findAll(pageable);

        return PageResponse.<RoleResponse>builder()
                .page(rolePage.getNumber())
                .size(rolePage.getSize())
                .totalPages(rolePage.getTotalPages())
                .totalItems(rolePage.getTotalElements())
                .items(roleMapper.toRoleResponseList(rolePage.getContent()))
                .build();
    }

    @Override
    public PageResponse<PermissionResponse> getPermissionsByRoleId(Pageable pageable, long roleId) {
        Page<Permission> permissionPage = permissionRepository.findAllByRoleId(roleId, pageable);

        return PageResponse.<PermissionResponse>builder()
                .page(permissionPage.getNumber())
                .size(permissionPage.getSize())
                .totalPages(permissionPage.getTotalPages())
                .totalItems(permissionPage.getTotalElements())
                .items(permissionMapper.toPermissionResponseList(permissionPage.getContent()))
                .build();
    }

    private Role findRoleById(long id) {
        return roleRepository.findById(id).
                orElseThrow(() -> new AppException(ErrorCode.ROLE_NOT_EXISTED));
    }
}
