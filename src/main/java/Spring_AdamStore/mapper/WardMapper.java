package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.ghn.response.GhnWard;
import Spring_AdamStore.dto.response.WardResponse;
import Spring_AdamStore.entity.sql.Ward;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface WardMapper {

    @Mapping(target = "code", source = "wardCode")
    @Mapping(target = "name", source = "wardName")
    Ward ghnWardToWard(GhnWard ghnWard);

    WardResponse toWardResponse(Ward ward);

    List<Ward> ghnWardListToWardList(List<GhnWard> ghnWardList);

    List<WardResponse> toWardResponseList(List<Ward> wardList);

}
