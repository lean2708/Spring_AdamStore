package Spring_AdamStore.service.Impl;

import Spring_AdamStore.dto.request.ShippingFeeRequest;
import Spring_AdamStore.dto.response.GhnResponse;
import Spring_AdamStore.dto.response.ShippingFeeResponse;
import Spring_AdamStore.service.ShippingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
@Service
@Slf4j(topic = "SHIPPING-SERVICE")
@RequiredArgsConstructor
public class ShippingServiceImpl implements ShippingService {

    private final RestTemplate restTemplate;

    @Value("${ghn.token}")
    private String ghnToken;

    @Value("${ghn.shop-id}")
    private String shopId;

    @Value("${ghn.fee-url}")
    private String feeUrl;

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
    public ShippingFeeResponse shippingCost(Double totalPrice, String toWardCode, Integer toDistrictId){
        int insuranceValue = (int) Math.round(totalPrice);

        ShippingFeeRequest request = ShippingFeeRequest.builder()
                .insuranceValue(insuranceValue)
                .toWardCode(toWardCode)
                .toDistrictId(toDistrictId)
                .coupon(null)
                .fromDistrictId(fromDistrictId)
                .weight(weight)
                .length(length)
                .width(width)
                .height(height)
                .serviceTypeId(serviceTypeId)
                .build();

        return calculateShippingFee(request);
    }

    public ShippingFeeResponse calculateShippingFee(ShippingFeeRequest request) {
        // Set header token and shop_id
        HttpHeaders headers = new HttpHeaders();
        headers.set("token", ghnToken);
        headers.set("shop_id", shopId);

        // Create body
        Map<String, Object> body = new HashMap<>();
        body.put("service_type_id", request.getServiceTypeId());
        body.put("insurance_value", request.getInsuranceValue());
        body.put("coupon", request.getCoupon());
        body.put("to_ward_code", request.getToWardCode());
        body.put("to_district_id", request.getToDistrictId());
        body.put("from_district_id", request.getFromDistrictId());
        body.put("weight", request.getWeight());
        body.put("length", request.getLength());
        body.put("width", request.getWidth());
        body.put("height", request.getHeight());

        // HttpEntity voi body va headers
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        try {
            // Call Api
            ResponseEntity<GhnResponse> response = restTemplate.exchange(
                    feeUrl,
                    HttpMethod.POST,
                    requestEntity,
                    GhnResponse.class
            );

            // Kiểm tra phản hồi từ API
            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                GhnResponse ghnResponse = response.getBody();

                if (ghnResponse.getCode() == 200) {
                    return ghnResponse.getData();
                } else {
                    throw new RuntimeException("GHN API trả về lỗi: " + ghnResponse.getMessage());
                }
            } else {
                throw new RuntimeException("Lỗi khi gọi API GHN, mã lỗi: " + response.getStatusCode());
            }

        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi tính phí vận chuyển: " + e.getMessage(), e);
        }
    }
}
