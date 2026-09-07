package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.WardBasic;
import Spring_AdamStore.repository.sql.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AddressMappingHelper {

    private final WardRepository wardRepository;
    private final DistrictRepository districtRepository;
    private final ProvinceRepository provinceRepository;

    private final ProductVariantRepository productVariantRepository;
    private final ColorRepository colorRepository;
    private final SizeRepository sizeRepository;
    private final FileRepository fileRepository;
    private final ColorMapper colorMapper;

    private final FileMapper fileMapper;
    private final SizeMapper sizeMapper;

    public WardBasic getWard(String code){
        return wardRepository.findByCode(code)
                .map(ward -> new WardBasic(ward.getCode(), ward.getName()))
                .orElse(null);
    }

    public EntityBasic getDistrict(Integer districtId){
        return districtRepository.findById(districtId)
                .map(district -> new EntityBasic(district.getId().longValue(), district.getName()))
                .orElse(null);
    }

    public EntityBasic getProvince(Integer provinceId){
        return provinceRepository.findById(provinceId)
                .map(province -> new EntityBasic(province.getId().longValue(), province.getName()))
                .orElse(null);
    }


}
