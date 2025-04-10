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
public enum DistrictPhuYenEnum implements DistrictEnum{

    TUY_HOA("Thành phố Tuy Hòa"),
    SÔNG_CÔNG("Thị xã Sông Cầu"),
    PHU_YEN("Huyện Phú Yên"),
    DONG_HOA("Huyện Đông Hòa"),
    HOAI_HAI("Huyện Hòa Hiệp"),
    CÁC_KHÁM("Huyện Các Khám");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .build();
    }

}

