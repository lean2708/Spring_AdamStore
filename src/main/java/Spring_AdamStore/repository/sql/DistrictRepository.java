package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.District;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DistrictRepository extends JpaRepository<District, Integer> {

    Page<District> findByProvinceId(Integer provinceId, Pageable pageable);

}
