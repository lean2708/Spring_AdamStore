package Spring_AdamStore.entity.nosql;

import lombok.*;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.MongoId;

import java.time.LocalDateTime;
import java.util.List;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "conversations")
public class Conversation {

    @MongoId
    private String id;

    private String type; // GROUP, DIRECT

    @Indexed
    private String conversationName;

    @Indexed
    private String conversationAvatar;

    @Indexed(unique = true)
    private String participantsHash;

    private List<ParticipantInfo> participants;

    private LocalDateTime createdDate;

    private LocalDateTime modifiedDate;

}
