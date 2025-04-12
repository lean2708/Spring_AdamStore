package Spring_AdamStore.dto.request;

import Spring_AdamStore.constants.Gender;
import Spring_AdamStore.dto.validator.EnumPattern;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.Set;


@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserUpdateRequest {
    @NotBlank(message = "Name không được để trống")
    String name;
    String avatarUrl;
    @NotNull(message = "Ngày sinh không được để trống")
    LocalDate dob;
    @NotNull(message = "gender không được để trống")
    @EnumPattern(name = "gender", regexp = "FEMALE|MALE|OTHER")
    Gender gender;

    Set<Long> roleIds;
}
