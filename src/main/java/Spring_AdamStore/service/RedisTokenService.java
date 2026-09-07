package Spring_AdamStore.service;

import Spring_AdamStore.entity.nosql.RedisRevokedToken;

public interface RedisTokenService {

    void saveRevokedToken(RedisRevokedToken redisRevokedToken);

}
