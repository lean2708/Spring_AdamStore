package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.Pattern;
import lombok.Getter;

@Getter
public class BranchUpdateRequest {

    private String name;
    private String location;
    @Pattern(regexp = "^0[35789]\\d{8}$", message = "Số điện thoại phải có 10 số và bắt đầu bằng 0")
    private String phone;
}
