package Spring_AdamStore.constants.district;

import Spring_AdamStore.constants.ProvinceEnum;
import Spring_AdamStore.entity.District;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public enum DistrictHaTinhEnum {

    HA_TINH("Thành phố Hà Tĩnh"),
    HA_MAI("Huyện Hương Sơn"),
    CHI_KHONG("Huyện Cẩm Xuyên"),
    TRUONG_TINH("Huyện Kỳ Anh"),
    MANG_TA("Huyện Vũ Quang"),
    THANH_BAO("Huyện Thạch Hà"),
    VIEN_LAM("Huyện Nghi Xuân"),
    LAM_QUE("Huyện Can Lộc");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .province(ProvinceEnum.HA_TINH.toProvince())
                .build();
    }

    public static List<District> getAllDistricts() {
        return Arrays.stream(DistrictHaTinhEnum.values())
                .map(DistrictHaTinhEnum::toDistrict)
                .collect(Collectors.toList());
    }
}
