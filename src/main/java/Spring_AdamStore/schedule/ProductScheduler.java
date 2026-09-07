package Spring_AdamStore.schedule;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.entity.sql.Product;
import Spring_AdamStore.entity.sql.ProductVariant;
import Spring_AdamStore.repository.sql.OrderItemRepository;
import Spring_AdamStore.repository.sql.ProductRepository;
import Spring_AdamStore.repository.sql.ProductVariantRepository;
import Spring_AdamStore.repository.sql.ReviewRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Slf4j(topic = "PRODUCT-SCHEDULER")
@Component
@RequiredArgsConstructor
public class ProductScheduler {

    private final ProductRepository productRepository;
    private final ReviewRepository reviewRepository;
    private final ProductVariantRepository productVariantRepository;
    private final OrderItemRepository orderItemRepository;


    @Scheduled(cron = "0 0 0 * * ?")
    public void updateProductRatings() {
        log.info("Updating all Products ratings, reviews, and sold quantities...");

        List<Product> productList = productRepository.findAll();
        for (Product product : productList) {
            double avgRating = reviewRepository.getAverageRatingByProductId(product.getId());
            product.setAverageRating(avgRating);

            int totalReviews = reviewRepository.getTotalReviewsByProductId(product.getId());
            product.setTotalReviews(totalReviews);

            int totalSold = orderItemRepository.getTotalSoldByProductId(product.getId());
            product.setSoldQuantity(totalSold);
        }

        productRepository.saveAll(productList);
    }

    @Scheduled(cron = "0 0 * * * ?")
    @Transactional
    public void checkProductsAvailability() {
        log.info("The product availability check...");

        Iterable<ProductVariant> productVariants = productVariantRepository.findAll();

        List<ProductVariant> variantsToUpdate = new ArrayList<>();
        for (ProductVariant variant : productVariants) {
            if (variant.getQuantity() == 0) {
                variant.setIsAvailable(false);
                variantsToUpdate.add(variant);
            }
        }
        productVariantRepository.saveAll(variantsToUpdate);


        List<Product> products = productRepository.findAll();
        for (Product product : products) {
            List<ProductVariant> productVariantList = getListProductVariant(product);

            boolean allVariantsUnavailable = productVariantList.stream()
                    .filter(variant -> variant.getStatus() == EntityStatus.ACTIVE)
                    .noneMatch(ProductVariant::getIsAvailable);

            if (allVariantsUnavailable) {
                product.setIsAvailable(false);
                productRepository.save(product);
            }

        }
    }

    private List<ProductVariant> getListProductVariant(Product product){
        return productVariantRepository.findAllByProductId(product.getId());
    }
}
