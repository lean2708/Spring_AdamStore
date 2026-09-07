package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Branch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface BranchRepository extends JpaRepository<Branch, Long> {

    @Query(value = "SELECT COUNT(*) FROM branches b WHERE b.name = :name", nativeQuery = true)
    Long countByName(@Param("name") String name);

    @Query(value = "SELECT COUNT(*) FROM branches b WHERE b.phone = :phone", nativeQuery = true)
    Long countByPhone(@Param("phone") String phone);

    @Query(value = "SELECT * FROM branches b WHERE b.id = :id", nativeQuery = true)
    Optional<Branch> findBranchById(@Param("id") Long id);

    @Query(value = "SELECT * FROM branches",
            countQuery = "SELECT COUNT(*) FROM branches",
            nativeQuery = true)
    Page<Branch> findAllBranches(Pageable pageable);

}
