package Spring_AdamStore.repository.nosql;

import Spring_AdamStore.entity.nosql.RedisRevokedToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RedisRevokedTokenRepository extends CrudRepository<RedisRevokedToken, String> {

    boolean existsById(String accessToken);

}
