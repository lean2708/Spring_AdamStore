package Spring_AdamStore.repository.nosql;

import Spring_AdamStore.entity.nosql.RedisPendingUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RedisPendingUserRepository extends CrudRepository<RedisPendingUser, String> {


}
