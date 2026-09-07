package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.ImageBasic;
import Spring_AdamStore.dto.response.ProductVariantResponse;
import Spring_AdamStore.repository.sql.FileRepository;
import Spring_AdamStore.repository.sql.ProductVariantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ProductMappingHelper {

    private final ProductVariantRepository productVariantRepository;
    private final FileRepository fileRepository;
    private final ProductVariantMapper productVariantMapper;
    private final VariantMappingHelper variantMappingHelper;

    public List<ProductVariantResponse> getVariants(Long productId){
        return productVariantRepository.findAllByProductId(productId)
                .stream().map(variant -> productVariantMapper.toProductVariantResponse(variant, variantMappingHelper))
                .toList();
    }

    public List<ImageBasic> getImages(Long productId){
        return fileRepository.findAllByProductId(productId)
                .stream().map(file -> new ImageBasic(file.getId(), file.getImageUrl()))
                .toList();
    }
}
