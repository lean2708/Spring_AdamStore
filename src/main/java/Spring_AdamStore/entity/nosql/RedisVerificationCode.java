package Spring_AdamStore.entity.nosql;

import Spring_AdamStore.constants.VerificationType;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.TimeToLive;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@RedisHash("RedisVerificationCode")
public class RedisVerificationCode {

    @Id
    private String redisKey;

    private String email;
    private String verificationCode;

    @Enumerated(EnumType.STRING)
    private VerificationType verificationType;

    @TimeToLive
     long ttl;
}
