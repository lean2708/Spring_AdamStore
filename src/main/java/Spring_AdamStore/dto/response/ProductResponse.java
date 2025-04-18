package Spring_AdamStore.dto.response;


import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.basic.ProductVariantBasic;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductResponse {

    Long id;
    String name;
    String description;

    Double averageRating;
    Integer soldQuantity;
    Integer totalReviews;
    Integer quantity;
    Double price;

    String createdBy;
    String updatedBy;
    LocalDate createdAt;
    LocalDate updatedAt;

    EntityBasic category;

    Set<EntityBasic> colors;
    Set<EntityBasic> sizes;

    Set<ProductImageResponse> productImages;


}
