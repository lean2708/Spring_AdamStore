package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.CartItemRequest;
import Spring_AdamStore.dto.request.CartItemUpdateRequest;
import Spring_AdamStore.dto.response.CartItemResponse;
import Spring_AdamStore.entity.sql.Cart;
import Spring_AdamStore.entity.sql.CartItem;
import Spring_AdamStore.entity.sql.ProductVariant;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.CartItemMapper;
import Spring_AdamStore.mapper.CartItemMappingHelper;
import Spring_AdamStore.repository.sql.CartItemRepository;
import Spring_AdamStore.repository.sql.CartRepository;
import Spring_AdamStore.repository.sql.ProductVariantRepository;
import Spring_AdamStore.service.CartItemService;
import Spring_AdamStore.service.CurrentUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j(topic = "CART-ITEM-SERVICE")
@RequiredArgsConstructor
public class CartItemServiceImpl implements CartItemService {

    private final CartItemRepository cartItemRepository;
    private final ProductVariantRepository productVariantRepository;
    private final CartRepository cartRepository;
    private final CartItemMapper cartItemMapper;
    private final CartItemMappingHelper cartItemMappingHelper;
    private final CurrentUserService currentUserService;

    @Override
    @Transactional
    public CartItemResponse create(CartItemRequest request) {
        log.info("Creating CartItem with data= {}", request);

        Cart cart = findCartByUser();

        ProductVariant productVariant = findProductVariant(request.getProductVariantId());

        // check sl hang con
        if (productVariant.getQuantity() < request.getQuantity()) {
            throw new AppException(ErrorCode.OUT_OF_STOCK);
        }

        Optional<CartItem> existingCartItem = cartItemRepository
                .findByCartIdAndProductVariantId(cart.getId(), request.getProductVariantId());

        CartItem cartItem;
        if (existingCartItem.isPresent()) {
            cartItem = existingCartItem.get();
            cartItem.setQuantity(cartItem.getQuantity() + request.getQuantity());
        } else{
            cartItem = CartItem.builder()
                    .quantity(request.getQuantity())
                    .price(productVariant.getPrice())
                    .productVariantId(productVariant.getId())
                    .cartId(cart.getId())
                    .build();
        }
        return cartItemMapper.toCartItemResponse(cartItemRepository.save(cartItem), cartItemMappingHelper);
    }

    @Override
    public CartItemResponse fetchById(Long id) {
        log.info("Fetching cart item by id: {}", id);

        CartItem cartItem = findCartItemById(id);
        return cartItemMapper.toCartItemResponse(cartItem, cartItemMappingHelper);
    }


    @Override
    @Transactional
    public CartItemResponse update(Long id, CartItemUpdateRequest request) {
        log.info("Updating cart item id: {} with data: {}", id, request);

        CartItem cartItem = findCartItemById(id);

        if (request.getQuantity() != null && request.getQuantity() > 0) {
            cartItem.setQuantity(request.getQuantity());
        }

        ProductVariant variant = findProductVariant(cartItem.getProductVariantId());

        ProductVariant newVariant = productVariantRepository
                .findByProductIdAndColorIdAndSizeId(variant.getProductId(), request.getColorId(), request.getSizeId())
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

        cartItem.setProductVariantId(newVariant.getId());

        return cartItemMapper.toCartItemResponse(cartItemRepository.save(cartItem), cartItemMappingHelper);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        log.info("Deleting cart item with id: {}", id);

        CartItem cartItem = findCartItemById(id);

        cartItemRepository.delete(cartItem);
    }


    @Override
    @Transactional
    public void deleteCartItems(List<Long> ids) {
        log.info("Deleting cart items with ids: {}", ids);

        List<CartItem> cartItems = cartItemRepository.findAllById(ids);

        if (cartItems.size() != ids.size()) {
            throw new AppException(ErrorCode.CART_ITEM_NOT_EXISTED);
        }

        cartItemRepository.deleteAll(cartItems);
    }


    private CartItem findCartItemById(Long id) {
        return cartItemRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CART_ITEM_NOT_EXISTED));
    }

    private Cart findCartByUser(){
        User user = currentUserService.getCurrentUser();

        return cartRepository.findByUserId(user.getId())
                .orElseThrow(()->new AppException(ErrorCode.CART_NOT_EXISTED));
    }

    private ProductVariant findProductVariant(Long id){
        return productVariantRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));
    }

}
