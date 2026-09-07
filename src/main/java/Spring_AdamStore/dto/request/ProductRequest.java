package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;

import java.util.List;

@Getter
public class ProductRequest {

    @NotBlank(message = "Tên sản phẩm không được để trống")
    private String name;

    @NotBlank(message = "Mô tả sản phẩm không được để trống")
    private String description;

    @NotNull(message = "categoryId không được null")
    private Long categoryId;

    @NotNull(message = "imageIds không được null")
    private List<Long> imageIds;

    @NotEmpty(message = "Danh sách biến thể sản phẩm không được để trống")
    @Size(min = 1, message = "Phải có ít nhất một biến thể sản phẩm")
    private List<VariantRequest> variants;


}
