package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.entity.sql.Color;
import org.mapstruct.*;

import java.util.List;
import java.util.Set;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface ColorMapper {

    Color toColor(ColorRequest request);

    ColorResponse toColorResponse(Color color);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void update(@MappingTarget Color color, ColorRequest request);

    List<ColorResponse> toColorResponseList(List<Color> colorList);

    EntityBasic toEntityBasic(Color color);

    Set<EntityBasic> toEntityBasicSet(Set<Color> colorSet);
}
