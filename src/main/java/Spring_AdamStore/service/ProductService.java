package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.ProductRequest;
import Spring_AdamStore.dto.request.ProductUpdateRequest;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.dto.response.ProductResponse;
import Spring_AdamStore.dto.response.ProductVariantResponse;
import Spring_AdamStore.dto.response.ReviewResponse;
import jakarta.validation.constraints.Min;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {

    ProductResponse create(ProductRequest request);

    ProductResponse fetchDetailById(Long id);

    PageResponse<ProductResponse> fetchAll(Pageable pageable);

    PageResponse<ProductResponse> fetchAllProductsForAdmin(Pageable pageable);

    ProductResponse update(Long id, ProductUpdateRequest request);

    void delete(Long id);

    PageResponse<ReviewResponse> fetchReviewsByProductId(Pageable pageable,Long productId);

    PageResponse<ProductResponse> searchProduct(Pageable pageable, List<String> search);

    ProductResponse restore(long id);

    PageResponse<ProductVariantResponse> getVariantsByProductIdForAdmin(Pageable pageable, Long productId);
}
