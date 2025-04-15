package Spring_AdamStore.service.Impl;

import Spring_AdamStore.dto.response.CartItemResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.Cart;
import Spring_AdamStore.entity.CartItem;
import Spring_AdamStore.entity.User;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.CartItemMapper;
import Spring_AdamStore.repository.CartItemRepository;
import Spring_AdamStore.repository.CartRepository;
import Spring_AdamStore.repository.UserRepository;
import Spring_AdamStore.service.AuthService;
import Spring_AdamStore.service.CartService;
import Spring_AdamStore.service.CurrentUserService;
import Spring_AdamStore.service.PageableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j(topic = "CART-SERVICE")
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

    private final UserRepository userRepository;
    private final CartRepository cartRepository;
    private final CurrentUserService currentUserService;
    private final CartItemRepository cartItemRepository;
    private final CartItemMapper cartItemMapper;
    private final PageableService pageableService;

    public void createCartForUser(User user){
        Cart cart = Cart.builder()
                .user(user)
                .build();

        cartRepository.save(cart);
    }


    public PageResponse<CartItemResponse> getCartItemsOfCurrentUser(int pageNo, int pageSize, String sortBy) {
        pageNo = pageNo - 1;

        Pageable pageable = pageableService.createPageable(pageNo, pageSize, sortBy);

        User user = userRepository.findByEmail(currentUserService.getCurrentUsername())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));

        Cart cart = cartRepository.findByUserId(user.getId())
                .orElseThrow(()->new AppException(ErrorCode.CART_NOT_EXISTED));

        Page<CartItem> cartItemPage = cartItemRepository.findByCartId(cart.getId(), pageable);

        return PageResponse.<CartItemResponse>builder()
                .page(cartItemPage.getNumber() + 1)
                .size(cartItemPage.getSize())
                .totalPages(cartItemPage.getTotalPages())
                .totalItems(cartItemPage.getTotalElements())
                .items(cartItemMapper.toCartItemResponseList(cartItemPage.getContent()))
                .build();
    }
}
