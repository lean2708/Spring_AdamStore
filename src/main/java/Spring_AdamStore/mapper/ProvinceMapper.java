package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.ghn.response.GhnProvince;
import Spring_AdamStore.dto.response.ProvinceResponse;
import Spring_AdamStore.entity.sql.Province;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface ProvinceMapper {

    @Mapping(target = "id", source = "provinceId")
    @Mapping(target = "name", source = "provinceName")
    Province GhnProvinceToProvince(GhnProvince ghnProvince);

    ProvinceResponse toProvinceResponse(Province province);

    List<Province> GhnProvinceListToProvinceList(List<GhnProvince> ghnProvinceList);

    List<ProvinceResponse> toProvinceResponseList(List<Province> provinceList);

}
