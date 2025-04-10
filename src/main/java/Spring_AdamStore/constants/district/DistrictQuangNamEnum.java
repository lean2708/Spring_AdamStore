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
public enum DistrictQuangNamEnum implements DistrictEnum{

    TAM_KY("Thành phố Tam Kỳ"),
    HOI_AN("Thành phố Hội An"),
    PHU_NINH("Huyện Phú Ninh"),
    NONG_SON("Huyện Nông Sơn"),
    DAI_LOC("Huyện Đại Lộc"),
    HIEN_LY("Huyện Hiên Lý"),
    QUANHUI("Huyện Quân Hui");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .build();
    }

}
