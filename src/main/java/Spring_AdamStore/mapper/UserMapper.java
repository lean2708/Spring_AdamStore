package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.request.RegisterRequest;
import Spring_AdamStore.dto.request.UserCreationRequest;
import Spring_AdamStore.dto.request.UserUpdateRequest;
import Spring_AdamStore.dto.response.UserResponse;
import Spring_AdamStore.entity.nosql.RedisPendingUser;
import Spring_AdamStore.entity.sql.User;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS, uses = {RoleMapper.class})
public interface UserMapper {

    User userCreationToUser(UserCreationRequest request);

    RedisPendingUser registerToRedis(RegisterRequest request);

    User redisToUser(RedisPendingUser redisPendingUser);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void updateUser(@MappingTarget User user, UserUpdateRequest request);

    @Mapping(target = "roles", expression = "java(context.getRoles(user.getId()))")
    UserResponse toUserResponse(User user, @Context UserMappingHelper context);

    List<UserResponse> toUserResponseList(List<User> userList, @Context UserMappingHelper context);

}
