package Spring_AdamStore.dto.event;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmailEvent {

    private String toEmail;
    private String name;
    private String verificationCode;

}
