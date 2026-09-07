package Spring_AdamStore.dto.response;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewResponse {

    private Long id;

    private String userName;
    private String userAvatarUrl;

    private Double rating;
    private String comment;
    private JsonNode imageUrls;

    private LocalDate createdAt;
    private LocalDate updatedAt;
}
