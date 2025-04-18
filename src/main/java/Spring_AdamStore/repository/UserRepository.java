package Spring_AdamStore.repository;

import Spring_AdamStore.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    Optional<User> findByEmail(String email);

    @Query(value = "SELECT COUNT(*) FROM tbl_user WHERE email = :email", nativeQuery = true)
    Integer countByEmail(@Param("email") String email);

    @Query(value = "SELECT COUNT(*) FROM tbl_user WHERE email = :email AND status = :status", nativeQuery = true)
    Integer countByEmailAndStatus(@Param("email") String email, @Param("status") String status);

    @Query(value = "SELECT COUNT(*) FROM tbl_user WHERE phone = :phone AND status = :status", nativeQuery = true)
    Integer countByPhoneAndStatus(@Param("phone") String phone, @Param("status") String status);
}
