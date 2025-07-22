package Spring_AdamStore.dto.response;

import Spring_AdamStore.dto.basic.ImageBasic;
import Spring_AdamStore.dto.basic.ProductVariantBasic;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartItemResponse {

    private Long id;

    private Double price;
    private Integer quantity;

    private ImageBasic image;

    private ProductVariantBasic productVariantBasic;
}
