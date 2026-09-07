package Spring_AdamStore.repository.nosql;

import Spring_AdamStore.entity.nosql.RedisForgotPasswordToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface RedisForgotPwdTokenRepository extends CrudRepository<RedisForgotPasswordToken, String> {


}
