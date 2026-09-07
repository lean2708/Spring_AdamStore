package Spring_AdamStore.dto.response;

import Spring_AdamStore.constants.EntityStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TopSellingDTO {

    private Long productId;
    private String productName;
    private String imageUrl;
    private EntityStatus status;
    private Long soldQuantity;
    private Double totalRevenue;
}
