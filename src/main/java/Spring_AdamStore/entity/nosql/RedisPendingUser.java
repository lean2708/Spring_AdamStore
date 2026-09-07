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
@RedisHash("RedisPendingUser")
public class RedisPendingUser {

    @Id
    private String email;

    private String name;
    private String phone;
    private String password;

    @TimeToLive
    private long ttl;
}
