package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.ImageBasic;
import Spring_AdamStore.dto.basic.ProductVariantBasic;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class OrderItemMappingHelper {

    private final VariantMappingHelper variantMappingHelper;

    public ProductVariantBasic getProductVariantBasic(Long variantId){
        return variantMappingHelper.getProductVariantBasic(variantId);
    }

    public ImageBasic getImageBasic(Long variantId){
        return variantMappingHelper.getImageBasic(variantId);
    }

}
