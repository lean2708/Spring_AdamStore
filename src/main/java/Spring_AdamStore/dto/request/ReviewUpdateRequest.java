package Spring_AdamStore.dto.request;

import lombok.Getter;

import java.util.List;

@Getter
public class ReviewUpdateRequest {

    private Double rating;
    private String comment;
    private List<String> imageUrls;


}
