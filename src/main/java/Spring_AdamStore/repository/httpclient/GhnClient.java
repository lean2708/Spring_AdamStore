package Spring_AdamStore.repository.httpclient;

import Spring_AdamStore.dto.ghn.request.GhnDistrictRequest;
import Spring_AdamStore.dto.ghn.request.GhnWardRequest;
import Spring_AdamStore.dto.ghn.request.ShippingFeeRequest;
import Spring_AdamStore.dto.ghn.response.GhnDistrictResponse;
import Spring_AdamStore.dto.ghn.response.GhnProvinceResponse;
import Spring_AdamStore.dto.ghn.response.GhnResponse;
import Spring_AdamStore.dto.ghn.response.GhnWardResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name = "ghnClient", url = "${ghn.base-url}")
public interface GhnClient {

    @PostMapping("/master-data/province")
    GhnProvinceResponse getProvinces(@RequestHeader("token") String token);

    @PostMapping("/master-data/district")
    GhnDistrictResponse getDistricts(@RequestHeader("token") String token, @RequestBody GhnDistrictRequest request);

    @PostMapping("/master-data/ward")
    GhnWardResponse getWards(@RequestHeader("token") String token, @RequestBody GhnWardRequest request);

    @PostMapping("/v2/shipping-order/fee")
    GhnResponse calculateShippingFee(@RequestHeader("token") String token,
            @RequestHeader("shop_id") String shopId, @RequestBody ShippingFeeRequest request);
}

