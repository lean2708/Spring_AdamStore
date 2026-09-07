package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.SizeResponse;
import Spring_AdamStore.entity.sql.Size;
import Spring_AdamStore.mapper.SizeMapper;
import Spring_AdamStore.repository.sql.SizeRepository;
import Spring_AdamStore.service.SizeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "SIZE-SERVICE")
@RequiredArgsConstructor
public class SizeServiceImpl implements SizeService {

    private final SizeRepository sizeRepository;
    private final SizeMapper sizeMapper;


    @Override
    public PageResponse<SizeResponse> fetchAll(Pageable pageable) {
        log.info("Fetch All Size");

        Page<Size> sizePage = sizeRepository.findAll(pageable);

        return PageResponse.<SizeResponse>builder()
                .page(sizePage.getNumber())
                .size(sizePage.getSize())
                .totalPages(sizePage.getTotalPages())
                .totalItems(sizePage.getTotalElements())
                .items(sizeMapper.toSizeResponseList(sizePage.getContent()))
                .build();
    }

}
