package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.response.FileResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.sql.FileEntity;
import Spring_AdamStore.exception.FileException;
import Spring_AdamStore.mapper.FileMapper;
import Spring_AdamStore.repository.sql.FileRepository;
import Spring_AdamStore.service.FileService;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Service
@Slf4j(topic = "FILE-SERVICE")
@RequiredArgsConstructor
public class FileServiceImpl implements FileService {

    private final Cloudinary cloudinary;
    private final FileRepository fileRepository;
    private final FileMapper fileMapper;

    @Value("${cloud.folder-image}")
    private String folderImage;

    @Value("${cloud.max-size-image}")
    private String maxSizeImage;

    private static final List<String> IMAGE_TYPES = Arrays.asList("image/jpeg", "image/png", "image/gif", "image/webp");

    public List<FileResponse> uploadListFile(List<MultipartFile> files) throws FileException, IOException {
        if (files == null || files.isEmpty()) {
            throw new FileException("File trống. Không thể lưu trữ file");
        }

        List<FileResponse> responses = new ArrayList<>();
        for (MultipartFile file : files) {
            FileResponse saved = uploadFile(file);
            responses.add(saved);
        }

        return responses;
    }

    @Override
    @Transactional
    public FileResponse uploadFile(MultipartFile file) throws FileException, IOException {
        if (file == null || file.isEmpty()) {
            throw new FileException("File trống. Không thể lưu trữ file");
        }

        validateFile(file, IMAGE_TYPES, maxSizeImage);

        Map<String, Object> options = ObjectUtils.asMap("folder", folderImage);
        Map uploadResult = cloudinary.uploader().upload(file.getBytes(), options);

        FileEntity fileEntity = FileEntity.builder()
                .publicId(uploadResult.get("public_id").toString())
                .fileName(file.getOriginalFilename())
                .imageUrl(uploadResult.get("url").toString())
                .build();

        return fileMapper.toFileResponse(fileRepository.save(fileEntity));
    }

    @Transactional
    public void deleteFile(Long id) throws FileException, IOException {
        FileEntity fileEntity = fileRepository.findById(id)
                .orElseThrow(()-> new FileException("File không tồn tại trong hệ thống"));

        cloudinary.uploader().destroy(fileEntity.getPublicId(), ObjectUtils.emptyMap());
        fileRepository.delete(fileEntity);
    }

    @Override
    public PageResponse<FileResponse> getAllFiles(Pageable pageable) {
        Page<FileEntity> productImagePage = fileRepository.findAll(pageable);

        return PageResponse.<FileResponse>builder()
                .page(productImagePage.getNumber())
                .size(productImagePage.getSize())
                .totalPages(productImagePage.getTotalPages())
                .totalItems(productImagePage.getTotalElements())
                .items(fileMapper.toFileResponseList(productImagePage.getContent()))
                .build();

    }

    private void validateFile(MultipartFile file, List<String> validTypes, String maxSize) throws FileException {
        if (!validTypes.contains(file.getContentType())) {
            throw new FileException("File " + file.getOriginalFilename() + " không hợp lệ. Định dạng file không được hỗ trợ.");
        }
        if (file.getSize() > parseSize(maxSize)) {
            throw new FileException("Ảnh quá lớn! Chỉ được tối đa " + maxSize + ".");
        }
    }

    private long parseSize(String size) {
        size = size.toUpperCase();
        return Long.parseLong(size.replace("MB", "").trim()) * 1024 * 1024;
    }



}
