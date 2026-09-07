package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    @Query(value = "SELECT COUNT(*) FROM categories WHERE name = :name", nativeQuery = true)
    Long countByName(@Param("name") String name);

    @Query(value = "SELECT * FROM categories c WHERE c.id = :id", nativeQuery = true)
    Optional<Category> findCategoryById(@Param("id") Long id);

    @Query(value = "SELECT * FROM categories",
            countQuery = "SELECT COUNT(*) FROM categories",
            nativeQuery = true)
    Page<Category> findAllCategories(Pageable pageable);

}
