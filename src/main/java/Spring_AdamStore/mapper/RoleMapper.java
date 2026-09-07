package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.response.RoleResponse;
import Spring_AdamStore.entity.sql.Role;
import org.mapstruct.*;

import java.util.List;
import java.util.Set;


@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, uses = {PermissionMapper.class})
public interface RoleMapper {

    RoleResponse toRoleResponse(Role role);

    List<RoleResponse> toRoleResponseList(List<Role> roles);

    EntityBasic toEntityBasic(Role role);

    Set<EntityBasic> toEntityBasicSet(Set<Role> roleSet);
}
