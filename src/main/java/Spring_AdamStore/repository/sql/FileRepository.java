package Spring_AdamStore.repository.sql;

import Spring_AdamStore.entity.sql.FileEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileRepository extends JpaRepository<FileEntity, Long> {

     List<FileEntity> findAllByIdIn(List<Long> idList);

     List<FileEntity> findAllByProductId(Long productId);

}
