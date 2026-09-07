package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import java.util.List;


@Getter
public class ConversationRequest {

    @NotBlank(message = "type không được để trống")
    String type; // GROUP, DIRECT

    @Size(min = 1)
    @NotNull(message = "participantIds không được để trống")
    List<Long> participantIds;

}
