package Spring_AdamStore.dto.request;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BranchRequest {

    String name;
    String location;
    String phone;
}
