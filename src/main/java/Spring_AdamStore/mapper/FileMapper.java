package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.response.FileResponse;
import Spring_AdamStore.entity.sql.FileEntity;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface FileMapper {

    FileResponse toFileResponse(FileEntity image);

    List<FileResponse> toFileResponseList(List<FileEntity> imageList);

}
