package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.request.AddressRequest;
import Spring_AdamStore.dto.response.AddressResponse;
import Spring_AdamStore.entity.sql.Address;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface AddressMapper {

    Address toAddress(AddressRequest request);


    @Mapping(target = "province", expression = "java(context.getProvince(address.getProvinceId()))")
    @Mapping(target = "district", expression = "java(context.getDistrict(address.getDistrictId()))")
    @Mapping(target = "ward", expression = "java(context.getWard(address.getWardCode()))")
    AddressResponse toAddressResponse(Address address, @Context AddressMappingHelper context);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void update(@MappingTarget Address address, AddressRequest request);

    List<AddressResponse> toAddressResponseList(List<Address> addressList, @Context AddressMappingHelper context);
}
