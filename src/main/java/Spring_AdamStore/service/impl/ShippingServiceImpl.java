package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.OrderItemRequest;
import Spring_AdamStore.dto.ghn.request.ShippingFeeRequest;
import Spring_AdamStore.dto.request.ShippingRequest;
import Spring_AdamStore.dto.ghn.response.GhnResponse;
import Spring_AdamStore.dto.ghn.response.ShippingFeeResponse;
import Spring_AdamStore.entity.sql.Address;
import Spring_AdamStore.entity.sql.ProductVariant;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.sql.AddressRepository;
import Spring_AdamStore.repository.sql.ProductVariantRepository;
import Spring_AdamStore.repository.httpclient.GhnClient;
import Spring_AdamStore.service.ShippingService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Slf4j(topic = "SHIPPING-SERVICE")
@RequiredArgsConstructor
public class ShippingServiceImpl implements ShippingService {

    private final ProductVariantRepository productVariantRepository;
    private final AddressRepository addressRepository;
    private final GhnClient ghnClient;

    @Value("${ghn.token}")
    private String ghnToken;

    @Value("${ghn.shop-id}")
    private String shopId;

    @Value("${shipping.from_district_id}")
    private Integer fromDistrictId;

    @Value("${shipping.service_type_id}")
    private Integer serviceTypeId;

    @Value("${shipping.weight}")
    private Integer weight;

    @Value("${shipping.length}")
    private Integer length;

    @Value("${shipping.width}")
    private Integer width;

    @Value("${shipping.height}")
    private Integer height;


    @Override
    @Transactional
    public ShippingFeeResponse shippingCost(ShippingRequest request){

        // Total price
        double totalPrice = 0.0;
        for(OrderItemRequest orderItemRequest : request.getOrderItems()){
            ProductVariant productVariant = productVariantRepository.findById(orderItemRequest.getProductVariantId())
                    .orElseThrow(() -> new AppException(ErrorCode.PRODUCT_VARIANT_NOT_EXISTED));

            // check sl hang con
            if (productVariant.getQuantity() < orderItemRequest.getQuantity()) {
                throw new AppException(ErrorCode.OUT_OF_STOCK);
            }
            totalPrice += orderItemRequest.getQuantity() * productVariant.getPrice();
        }
        int insuranceValue = (int) Math.round(totalPrice);

        // Address
        Address address = addressRepository.findById(request.getAddressId())
                .orElseThrow(() -> new AppException(ErrorCode.ADDRESS_NOT_EXISTED));

        ShippingFeeRequest shippingFeeRequest = ShippingFeeRequest.builder()
                .insuranceValue(insuranceValue)
                .toWardCode(address.getWardCode())
                .toDistrictId(address.getDistrictId())
                .coupon(null)
                .fromDistrictId(fromDistrictId)
                .weight(weight)
                .length(length)
                .width(width)
                .height(height)
                .serviceTypeId(serviceTypeId)
                .build();

        return calculateShippingFee(shippingFeeRequest);
    }

    public ShippingFeeResponse calculateShippingFee(ShippingFeeRequest request) {

        try {
            GhnResponse response = ghnClient.calculateShippingFee(ghnToken, shopId, request);

            if (response != null && response.getCode() == 200) {
                return response.getData();
            } else {
                throw new RuntimeException("GHN API trả về lỗi: " + response.getMessage());
            }

        }catch (Exception e) {
            log.error("Lỗi khi tính phí vận chuyển (Feign): {}", e.getMessage(), e);
            throw new RuntimeException("Lỗi khi tính phí vận chuyển: " + e.getMessage(), e);
        }
    }
}
