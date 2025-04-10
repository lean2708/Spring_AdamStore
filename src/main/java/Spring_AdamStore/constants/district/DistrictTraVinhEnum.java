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
public enum DistrictTraVinhEnum  implements DistrictEnum{

    TRA_VINH("Thành phố Trà Vinh"),
    DUYEN_HAI("Thị xã Duyên Hải"),
    CAU_KE("Huyện Cầu Kè"),
    CAU_NGANG("Huyện Cầu Ngang"),
    CHAU_THANH("Huyện Châu Thành"),
    TIEN_CAN("Huyện Tiểu Cần"),
    TRA_CU("Huyện Trà Cú"),
    VUNG_LIEM("Huyện Vũng Liêm"),
    LONG_DUC("Huyện Long Đức");

    private final String name;

    public District toDistrict() {
        return District.builder()
                .name(this.name)
                .build();
    }

}
