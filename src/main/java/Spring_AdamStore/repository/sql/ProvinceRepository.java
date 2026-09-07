package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Province;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProvinceRepository extends JpaRepository<Province, Integer> {


}
