package Spring_AdamStore.dto.request;

import lombok.Getter;

import java.util.List;

@Getter
public class ProductUpdateRequest {

    private String name;

    private String description;

    private Long categoryId;

    private List<Long> imageIds;

}
