package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.request.AddressRequest;
import Spring_AdamStore.dto.request.BranchRequest;
import Spring_AdamStore.dto.response.AddressResponse;
import Spring_AdamStore.dto.response.BranchResponse;
import Spring_AdamStore.entity.Address;
import Spring_AdamStore.entity.Branch;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface AddressMapper {

    Address toAddress(AddressRequest request);

    AddressResponse toAddressResponse(Address address);

    void update(@MappingTarget Address address, AddressRequest request);

    List<AddressResponse> toAddressResponseList(List<Address> addressList);

}
