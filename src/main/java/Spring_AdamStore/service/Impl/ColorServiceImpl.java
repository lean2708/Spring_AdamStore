package Spring_AdamStore.service.Impl;

import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.SizeResponse;
import Spring_AdamStore.entity.Category;
import Spring_AdamStore.entity.Color;
import Spring_AdamStore.entity.Size;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.ColorMapper;
import Spring_AdamStore.repository.ColorRepository;
import Spring_AdamStore.service.ColorService;
import Spring_AdamStore.service.PageableService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "COLOR-SERVICE")
@RequiredArgsConstructor
public class ColorServiceImpl implements ColorService {

    private final ColorRepository colorRepository;
    private final ColorMapper colorMapper;
    private final PageableService pageableService;

    @Override
    public ColorResponse create(ColorRequest request) {
        if(colorRepository.existsByName(request.getName())){
            throw new AppException(ErrorCode.COLOR_EXISTED);
        }

        Color color = colorMapper.toColor(request);

        return colorMapper.toColorResponse(colorRepository.save(color));
    }

    @Override
    public ColorResponse fetchById(Long id) {
       Color color = findColorById(id);

        return colorMapper.toColorResponse(color);
    }

    @Override
    public PageResponse<ColorResponse> fetchAll(int pageNo, int pageSize, String sortBy) {
        pageNo = pageNo - 1;

        Pageable pageable = pageableService.createPageable(pageNo, pageSize, sortBy);

        Page<Color> colorPage = colorRepository.findAll(pageable);

        return PageResponse.<ColorResponse>builder()
                .page(colorPage.getNumber() + 1)
                .size(colorPage.getSize())
                .totalPages(colorPage.getTotalPages())
                .totalItems(colorPage.getTotalElements())
                .items(colorMapper.toColorResponseList(colorPage.getContent()))
                .build();
    }

    @Override
    public ColorResponse update(Long id, ColorRequest request) {
        if(colorRepository.existsByName(request.getName())){
            throw new AppException(ErrorCode.COLOR_EXISTED);
        }

        Color color = findColorById(id);

        colorMapper.update(color, request);

        return colorMapper.toColorResponse(colorRepository.save(color));
    }

    @Transactional
    @Override
    public void delete(Long id) {
        Color color = findColorById(id);

        colorRepository.delete(color);
    }

    private Color findColorById(Long id) {
        return colorRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.COLOR_NOT_EXISTED));
    }
}
