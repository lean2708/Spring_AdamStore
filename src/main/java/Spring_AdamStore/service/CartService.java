package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.CartItemResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.sql.User;
import org.springframework.data.domain.Pageable;

public interface CartService {

    void createCartForUser(User user);

    PageResponse<CartItemResponse> getCartItemsOfCurrentUser(Pageable pageable);
}
