
package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.request.ReviewRequest;
import Spring_AdamStore.dto.request.ReviewUpdateRequest;
import Spring_AdamStore.dto.response.ReviewResponse;
import Spring_AdamStore.entity.sql.Review;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface ReviewMapper {

    @Mapping(target = "imageUrls", expression = "java(context.toJsonNode(request.getImageUrls()))")
    Review toReview(ReviewRequest request, @Context ReviewMappingHelper context);


    @Mapping(target = "userAvatarUrl", expression = "java(context.getAvatar(review.getUserId()))")
    @Mapping(target = "userName", expression = "java(context.getUserName(review.getUserId()))")
    ReviewResponse toReviewResponse(Review review, @Context ReviewMappingHelper context);


    @Mapping(target = "imageUrls", expression = "java(context.toJsonNode(request.getImageUrls()))")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void update(@MappingTarget Review review, ReviewUpdateRequest request, @Context ReviewMappingHelper context);


    List<ReviewResponse> toReviewResponseList(List<Review> reviewList, @Context ReviewMappingHelper context);

}
