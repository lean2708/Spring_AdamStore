package Spring_AdamStore.dto.response;


import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.ImageBasic;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductResponse {

    private Long id;

    private Boolean isAvailable;
    private String name;
    private String description;

    private Double averageRating;
    private Integer soldQuantity;
    private Integer totalReviews;

    private Double minPrice;
    private Double maxPrice;

    private EntityStatus status;

    private LocalDate createdAt;

    private List<ImageBasic> images;

    private List<ProductVariantResponse> variants;


}
