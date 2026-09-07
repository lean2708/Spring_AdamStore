package Spring_AdamStore.constants;

import Spring_AdamStore.entity.sql.Size;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum SizeEnum {
    XS,
    S,
    M,
    L,
    XL,
    XXL,
    XXXL;


    public Size toSize(){
        return Size.builder()
                .name(this.name())
                .build();
    }

    public static List<Size> getAllSizes() {
        return Arrays.stream(SizeEnum.values())
                .map(SizeEnum::toSize)
                .collect(Collectors.toList());
    }
}
