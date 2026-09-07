package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.FileResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.exception.FileException;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FileService {

    List<FileResponse> uploadListFile(List<MultipartFile> files) throws FileException, IOException;

    FileResponse uploadFile(MultipartFile file) throws FileException, IOException;

    void deleteFile(Long id) throws FileException, IOException;

    PageResponse<FileResponse> getAllFiles(Pageable pageable);
}
