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
public enum DistrictHaNamEnum  implements DistrictEnum{

    PHU_LY("Thành phố Phủ Lý"),
    DUC_LOI("Huyện Duy Tiên"),
    BAC_AI("Huyện Bắc Ai"),
    TIEN_LAM("Huyện Tiền Lam"),
    CHI_DO("Huyện Chi Do");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .build();
    }

}
