package Spring_AdamStore.constants.district;

import Spring_AdamStore.constants.ProvinceEnum;
import Spring_AdamStore.entity.District;
import Spring_AdamStore.entity.Province;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public enum DistrictThuaThienHueEnum implements DistrictEnum{

    THUA_THIEN_HUE("Thành phố Huế"),
    HUONG_THUY("Thị xã Hương Thủy"),
    HUONG_TRA("Huyện Hương Trà"),
    PHU_VANG("Huyện Phú Vang"),
    QUANG_DIEN("Huyện Quảng Điền"),
    A_LUOI("Huyện A Lưới"),
    CANH_GIANG("Huyện Canh Giang"),
    PHU_LOC("Huyện Phú Lộc"),
    HAI_CHAU("Quận Hải Châu"),
    THANH_KHE("Quận Thanh Khê");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .build();
    }

}

