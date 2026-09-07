package Spring_AdamStore.repository.nosql;

import Spring_AdamStore.entity.nosql.RedisVerificationCode;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RedisVerificationCodeRepository extends CrudRepository<RedisVerificationCode, String> {

}



