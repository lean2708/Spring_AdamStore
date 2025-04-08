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
public enum DistrictCanThoEnum {

    BINH_THUY("Quận Bình Thủy"),
    CAI_RANG("Quận Cái Răng"),
    NINH_KIEU("Quận Ninh Kiều"),
    THOT_NOT("Quận Thốt Nốt"),
    O_MON("Quận Ô Môn"),
    PHONG_DIEN("Huyện Phong Điền"),
    CO_DO("Huyện Cờ Đỏ"),
    THOI_LAI("Huyện Thới Lai"),
    VINH_THANH("Huyện Vĩnh Thạnh");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .province(ProvinceEnum.CAN_THO.toProvince())
                .build();
    }

    public static List<District> getAllDistricts() {
        return Arrays.stream(DistrictCanThoEnum.values())
                .map(DistrictCanThoEnum::toDistrict)
                .collect(Collectors.toList());
    }
}
