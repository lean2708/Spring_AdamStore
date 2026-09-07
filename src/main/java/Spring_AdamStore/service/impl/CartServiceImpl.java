package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.response.CartItemResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.sql.Cart;
import Spring_AdamStore.entity.sql.CartItem;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.CartItemMapper;
import Spring_AdamStore.mapper.CartItemMappingHelper;
import Spring_AdamStore.repository.sql.CartItemRepository;
import Spring_AdamStore.repository.sql.CartRepository;
import Spring_AdamStore.service.CartService;
import Spring_AdamStore.service.CurrentUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "CART-SERVICE")
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

    private final CartRepository cartRepository;
    private final CurrentUserService currentUserService;
    private final CartItemRepository cartItemRepository;
    private final CartItemMapper cartItemMapper;
    private final CartItemMappingHelper cartItemMappingHelper;


    @Transactional
    public void createCartForUser(User user){
        log.info("Create Cart For Current User");

        Cart cart = Cart.builder()
                .userId(user.getId())
                .build();

        cartRepository.save(cart);
    }

    public PageResponse<CartItemResponse> getCartItemsOfCurrentUser(Pageable pageable) {
        log.info("Get Cart Item For Current User");

        User user = currentUserService.getCurrentUser();

        Cart cart = cartRepository.findByUserId(user.getId())
                .orElseThrow(()->new AppException(ErrorCode.CART_NOT_EXISTED));

        Page<CartItem> cartItemPage = cartItemRepository.findByCartId(cart.getId(), pageable);

        return PageResponse.<CartItemResponse>builder()
                .page(cartItemPage.getNumber())
                .size(cartItemPage.getSize())
                .totalPages(cartItemPage.getTotalPages())
                .totalItems(cartItemPage.getTotalElements())
                .items(cartItemMapper.toCartItemResponseList(cartItemPage.getContent(), cartItemMappingHelper))
                .build();
    }
}
