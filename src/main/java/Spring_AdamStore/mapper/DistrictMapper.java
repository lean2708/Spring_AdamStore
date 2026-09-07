package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.response.DistrictResponse;
import Spring_AdamStore.dto.ghn.response.GhnDistrict;
import Spring_AdamStore.entity.sql.District;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface DistrictMapper {

    @Mapping(target = "id", source = "districtId")
    @Mapping(target = "name", source = "districtName")
    District GhnDistrictToDistrict(GhnDistrict ghnDistrict);

    DistrictResponse toDistrictResponse(District district);

    List<District> GhnDistrictListToDistrictList(List<GhnDistrict> ghnDistrictList);

    List<DistrictResponse> toDistrictResponseList(List<District> districtList);

}
