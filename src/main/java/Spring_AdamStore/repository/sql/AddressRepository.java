package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Address;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {

    List<Address> findAllByUserId(Long userId);

    Page<Address> findAllByUserIdAndIsVisible(Long userId, Boolean isVisible, Pageable pageable);

    @Query(value = "SELECT * FROM addresses a WHERE a.id = :id", nativeQuery = true)
    Optional<Address> findAddressById(@Param("id") Long id);

    @Query(value = "SELECT * FROM addresses",
            countQuery = "SELECT COUNT(*) FROM addresses",
            nativeQuery = true)
    Page<Address> findAllAddresses(Pageable pageable);
}
