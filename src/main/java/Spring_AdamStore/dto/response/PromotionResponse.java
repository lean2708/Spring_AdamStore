package Spring_AdamStore.dto.response;

import Spring_AdamStore.constants.EntityStatus;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PromotionResponse {

    private Long id;

    private String code;
    private String description;
    private Integer discountPercent;
    private LocalDate startDate;
    private LocalDate endDate;
    private EntityStatus status;

    private String createdBy;
    private LocalDate createdAt;
}
