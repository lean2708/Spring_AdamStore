
package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.CartItemRequest;
import Spring_AdamStore.dto.request.CartItemUpdateRequest;
import Spring_AdamStore.dto.response.CartItemResponse;

import java.util.List;

public interface CartItemService {

    CartItemResponse create(CartItemRequest request);

    CartItemResponse fetchById(Long id);

    CartItemResponse update(Long id, CartItemUpdateRequest request);

    void delete(Long id);

    void deleteCartItems(List<Long> ids);
}
