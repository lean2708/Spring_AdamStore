package Spring_AdamStore.dto.response;

import Spring_AdamStore.dto.basic.EntityBasic;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RoleResponse {

    Long id;
    String name;
    String description;

    Set<EntityBasic> permissions;

    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate createdAt;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @JsonFormat(pattern = "dd/MM/yyyy")
    LocalDate updatedAt;

}
