package Spring_AdamStore.entity.nosql;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.TimeToLive;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@RedisHash("RedisForgotPasswordToken")
public class RedisForgotPasswordToken {

    @Id
    private String forgotPasswordToken;

    private String email;

    @TimeToLive
    private long ttl;
}
