package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SizeRepository extends JpaRepository<Size, Long> {

}
