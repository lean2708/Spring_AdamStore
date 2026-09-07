package Spring_AdamStore.entity.nosql;

import lombok.*;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ParticipantInfo {

    private Long userId;
    private String email;
    private String name;
    private String avatarUrl;

}
