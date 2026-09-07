package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.request.BranchRequest;
import Spring_AdamStore.dto.request.BranchUpdateRequest;
import Spring_AdamStore.dto.response.BranchResponse;
import Spring_AdamStore.entity.sql.Branch;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface BranchMapper {

    Branch toBranch(BranchRequest request);

    BranchResponse toBranchResponse(Branch branch);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void update(@MappingTarget Branch branch, BranchUpdateRequest request);

    List<BranchResponse> toBranchResponseList(List<Branch> branchList);

}
