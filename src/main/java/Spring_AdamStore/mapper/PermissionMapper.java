package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.response.PermissionResponse;
import Spring_AdamStore.entity.sql.Permission;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface PermissionMapper {

    PermissionResponse toPermissionResponse(Permission permission);

    List<PermissionResponse> toPermissionResponseList(List<Permission> permissions);


}
