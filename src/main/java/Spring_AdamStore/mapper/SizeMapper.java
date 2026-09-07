package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.request.SizeRequest;
import Spring_AdamStore.dto.response.SizeResponse;
import Spring_AdamStore.entity.sql.Size;
import org.mapstruct.*;

import java.util.List;
import java.util.Set;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface SizeMapper {

    SizeResponse toSizeResponse(Size size);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void update(@MappingTarget Size size, SizeRequest request);

    List<SizeResponse> toSizeResponseList(List<Size> sizeList);


    EntityBasic toEntityBasic(Size size);

    Set<EntityBasic> toEntityBasicSet(Set<Size> sizeSet);
}
