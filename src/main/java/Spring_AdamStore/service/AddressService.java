package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.AddressRequest;
import Spring_AdamStore.dto.request.BranchRequest;
import Spring_AdamStore.dto.response.AddressResponse;
import Spring_AdamStore.dto.response.BranchResponse;
import Spring_AdamStore.dto.response.PageResponse;
import jakarta.validation.constraints.Min;
import org.springframework.data.domain.Pageable;

public interface AddressService {

    AddressResponse create(AddressRequest request);

    AddressResponse fetchById(Long id);

    PageResponse<AddressResponse> fetchAllForAdmin(Pageable pageable);

    AddressResponse update(Long id, AddressRequest request);

    void hideAddress(Long id);

    void delete(Long id);

    AddressResponse restore(long id);


}
