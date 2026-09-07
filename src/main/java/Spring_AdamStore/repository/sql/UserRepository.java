package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    Optional<User> findByEmail(String email);

    @Query(value = "SELECT COUNT(*) FROM users u WHERE u.id = :id AND u.status = :status", nativeQuery = true)
    Integer countById(@Param("id") Long id, @Param("status") String status);

    @Query(value = "SELECT * FROM users u WHERE u.id = :id", nativeQuery = true)
    Optional<User> findUserById(@Param("id") Long id);

    @Query(value = "SELECT COUNT(*) FROM users WHERE email = :email", nativeQuery = true)
    Integer countByEmail(@Param("email") String email);

    @Query(value = "SELECT COUNT(*) FROM users WHERE email = :email AND status = :status", nativeQuery = true)
    Integer countByEmailAndStatus(@Param("email") String email, @Param("status") String status);


    @Query(value = "SELECT * FROM users",
            countQuery = "SELECT COUNT(*) FROM users",
            nativeQuery = true)
    Page<User> findAllUsers(Pageable pageable);
}
