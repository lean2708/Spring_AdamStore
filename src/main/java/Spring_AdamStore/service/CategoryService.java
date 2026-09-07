package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.CategoryRequest;
import Spring_AdamStore.dto.request.ProductRequest;
import Spring_AdamStore.dto.response.CategoryResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.ProductResponse;
import jakarta.validation.constraints.Min;
import org.springframework.data.domain.Pageable;

public interface CategoryService {

    CategoryResponse create(CategoryRequest request);

    PageResponse<CategoryResponse> fetchAll(Pageable pageable);

    CategoryResponse update(Long id, CategoryRequest request);

    void delete(Long id);

    PageResponse<ProductResponse> fetchProductByCategory(Pageable pageable, Long categoryId);

    PageResponse<CategoryResponse> fetchAllCategoriesForAdmin(Pageable pageable);

    CategoryResponse restore(long id);

}
