package Spring_AdamStore.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class ChatMessageRequest {

    @NotBlank(message = "conversationId không được để trống")
    private String conversationId;
    @NotBlank(message = "message không được để trống")
    private String message;

}
