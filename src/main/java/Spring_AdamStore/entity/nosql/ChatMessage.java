package Spring_AdamStore.entity.nosql;

import lombok.*;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.MongoId;

import java.time.LocalDateTime;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "chat_messages")
public class ChatMessage {

    @MongoId
    private String id;

    @Indexed
    private String conversationId;

    @Indexed
    private String message;

    private ParticipantInfo sender;

    @Indexed
    private LocalDateTime createdDate;

}
