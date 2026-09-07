package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.ReviewRequest;
import Spring_AdamStore.dto.request.ReviewUpdateRequest;
import Spring_AdamStore.dto.response.ReviewResponse;
import Spring_AdamStore.entity.sql.*;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.ReviewMapper;
import Spring_AdamStore.mapper.ReviewMappingHelper;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.service.CurrentUserService;
import Spring_AdamStore.service.ReviewService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "REVIEW-SERVICE")
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewRepository reviewRepository;
    private final CurrentUserService currentUserService;
    private final ReviewMapper reviewMapper;
    private final ProductVariantRepository productVariantRepository;
    private final ReviewMappingHelper reviewMappingHelper;
    private final OrderItemRepository orderItemRepository;


    @Override
    public ReviewResponse getByOrderItemId(Long orderItemId) {
        log.info("Fetching review by OrderItemId: {}, of the current user", orderItemId);

        User user = currentUserService.getCurrentUser();

        Review review = findReviewByOrderItemAndUser(orderItemId, user.getId());

        return reviewMapper.toReviewResponse(review, reviewMappingHelper);
    }

    @Override
    public boolean isOrderItemReviewedByUser(Long orderItemId) {
        log.info("Checking if current user has reviewed order item with ID: {}", orderItemId);

        User user = currentUserService.getCurrentUser();

        return reviewRepository.findByOrderItemIdAndUserId(orderItemId, user.getId()).isPresent();
    }


    @Override
    @Transactional
    public ReviewResponse create(ReviewRequest request) {
        log.info("Creating review with data= {}", request);

        OrderItem orderItem = findOrderItemById(request.getOrderItemId());

        Review review = reviewMapper.toReview(request, reviewMappingHelper);

        ProductVariant variant = findProductVariantById(orderItem.getProductVariantId());
        review.setProductId(variant.getProductId());

        User user = currentUserService.getCurrentUser();
        review.setUserId(user.getId());

        return reviewMapper.toReviewResponse(reviewRepository.save(review), reviewMappingHelper);
    }

    @Override
    @Transactional
    public ReviewResponse update(Long id, ReviewUpdateRequest request) {
        log.info("Updated review with data= {}", request);

        Review review = findReviewById(id);

        reviewMapper.update(review, request, reviewMappingHelper);

        return reviewMapper.toReviewResponse(reviewRepository.save(review), reviewMappingHelper);
    }

    @Override
    public void delete(Long id) {
        log.info("Delete Review By Id: {}", id);

        Review review = findReviewById(id);
        reviewRepository.delete(review);
    }

    private Review findReviewByOrderItemAndUser(Long orderId, Long userId) {
        return reviewRepository.findByOrderItemIdAndUserId(orderId, userId)
                .orElseThrow(() -> new AppException(ErrorCode.REVIEW_NOT_EXISTED));
    }


    private Review findReviewById(Long id) {
        return reviewRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.REVIEW_NOT_EXISTED));
    }

   private ProductVariant findProductVariantById(Long id){
        return productVariantRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));
   }

    private OrderItem findOrderItemById(Long id) {
        return orderItemRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ORDER_ITEM_NOT_EXISTED));
    }
}
