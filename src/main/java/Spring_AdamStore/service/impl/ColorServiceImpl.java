package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.ColorRequest;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.sql.Color;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.ColorMapper;
import Spring_AdamStore.repository.sql.ColorRepository;
import Spring_AdamStore.repository.sql.ProductVariantRepository;
import Spring_AdamStore.service.ColorService;
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
    private final ProductVariantRepository productVariantRepository;

    @Override
    @Transactional
    public ColorResponse create(ColorRequest request) {
        log.info("Creating color with data: {}", request);

        if(colorRepository.existsByName(request.getName())){
            throw new AppException(ErrorCode.COLOR_EXISTED);
        }

        Color color = colorMapper.toColor(request);

        return colorMapper.toColorResponse(colorRepository.save(color));
    }


    @Override
    public PageResponse<ColorResponse> fetchAll(Pageable pageable) {
        log.info("Fetching all colors with pagination");

        Page<Color> colorPage = colorRepository.findAll(pageable);

        return PageResponse.<ColorResponse>builder()
                .page(colorPage.getNumber())
                .size(colorPage.getSize())
                .totalPages(colorPage.getTotalPages())
                .totalItems(colorPage.getTotalElements())
                .items(colorMapper.toColorResponseList(colorPage.getContent()))
                .build();
    }

    @Override
    @Transactional
    public ColorResponse update(Long id, ColorRequest request) {
        log.info("Updating color with id: {}", id);

        Color color = findColorById(id);

        if(!request.getName().equals(color.getName()) && colorRepository.existsByName(request.getName())){
            throw new AppException(ErrorCode.COLOR_EXISTED);
        }

        colorMapper.update(color, request);

        return colorMapper.toColorResponse(colorRepository.save(color));
    }

    @Transactional
    @Override
    public void delete(Long id) {
        log.info("Deleting color with id: {}", id);

        Color color = findColorById(id);

        long count = productVariantRepository.countByColorId(color.getId());

        if (count > 0) {
            throw new AppException(ErrorCode.COLOR_HAS_USED_VARIANT);
        }

        colorRepository.delete(color);
    }

    private Color findColorById(Long id) {
        return colorRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.COLOR_NOT_EXISTED));
    }
}
