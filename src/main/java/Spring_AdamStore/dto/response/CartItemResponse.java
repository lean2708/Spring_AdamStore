package Spring_AdamStore.dto.response;

import Spring_AdamStore.dto.basic.ImageBasic;
import Spring_AdamStore.dto.basic.ProductVariantBasic;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartItemResponse {

    private Long id;

    private Double price;
    private Integer quantity;
    private LocalDateTime createdAt;

    private ImageBasic image;

    private ProductVariantBasic productVariantBasic;
}
