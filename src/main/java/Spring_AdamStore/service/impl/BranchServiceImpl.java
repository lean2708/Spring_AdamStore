package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.BranchRequest;
import Spring_AdamStore.dto.request.BranchUpdateRequest;
import Spring_AdamStore.dto.response.BranchResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.sql.Branch;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.BranchMapper;
import Spring_AdamStore.repository.sql.BranchRepository;
import Spring_AdamStore.service.BranchService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;

@Service
@Slf4j(topic = "BRANCH-SERVICE")
@RequiredArgsConstructor
public class BranchServiceImpl implements BranchService {

    private final BranchMapper branchMapper;
    private final BranchRepository branchRepository;

    @Override
    @Transactional
    public BranchResponse create(BranchRequest request) {
        log.info("Creating branch with data= {}", request);

        if(branchRepository.countByName(request.getName()) > 0){
            throw new AppException(ErrorCode.BRANCH_EXISTED);
        }

        if(branchRepository.countByPhone(request.getPhone()) > 0){
            throw new AppException(ErrorCode.PHONE_EXISTED);
        }

        Branch branch = branchMapper.toBranch(request);

        return branchMapper.toBranchResponse(branchRepository.save(branch));
    }

    @Override
    public BranchResponse fetchById(Long id) {
        log.info("Fetch branch By Id: {}", id);

        Branch branch = findActiveBranchById(id);

        return branchMapper.toBranchResponse(branch);
    }

    @Override
    public PageResponse<BranchResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All branch For User");

        Page<Branch> branchPage = branchRepository.findAll(pageable);

        return PageResponse.<BranchResponse>builder()
                .page(branchPage.getNumber())
                .size(branchPage.getSize())
                .totalPages(branchPage.getTotalPages())
                .totalItems(branchPage.getTotalElements())
                .items(branchMapper.toBranchResponseList(branchPage.getContent()))
                .build();
    }

    @Override
    public PageResponse<BranchResponse> fetchAllBranchesForAdmin(Pageable pageable) {
        log.info("Fetch All branch For Admin");

        Page<Branch> branchPage = branchRepository.findAllBranches(pageable);

        return PageResponse.<BranchResponse>builder()
                .page(branchPage.getNumber())
                .size(branchPage.getSize())
                .totalPages(branchPage.getTotalPages())
                .totalItems(branchPage.getTotalElements())
                .items(branchMapper.toBranchResponseList(branchPage.getContent()))
                .build();
    }

    @Override
    @Transactional
    public BranchResponse update(Long id, BranchUpdateRequest request) {
        log.info("Updated branch with data= {}", request);

        Branch branch = findActiveBranchById(id);

        if(!request.getName().equals(branch.getName()) && branchRepository.countByName(request.getName()) > 0){
            throw new AppException(ErrorCode.BRANCH_EXISTED);
        }

        if(!request.getPhone().equals(branch.getPhone()) && branchRepository.countByPhone(request.getPhone()) > 0){
            throw new AppException(ErrorCode.PHONE_EXISTED);
        }

        branchMapper.update(branch, request);

        return branchMapper.toBranchResponse(branchRepository.save(branch));
    }

    @Transactional
    @Override
    public void delete(Long id) {
        log.info("Delete branch By Id: {}", id);

        Branch branch = findActiveBranchById(id);

        branchRepository.delete(branch);
    }

    @Override
    public BranchResponse restore(long id) {
        log.info("Restore branch By Id: {}", id);

        Branch branch = branchRepository.findBranchById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BRANCH_NOT_EXISTED));

        branch.setStatus(ACTIVE);
        return branchMapper.toBranchResponse(branchRepository.save(branch));
    }


    private Branch findActiveBranchById(Long id) {
        return branchRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BRANCH_NOT_EXISTED));
    }
}
