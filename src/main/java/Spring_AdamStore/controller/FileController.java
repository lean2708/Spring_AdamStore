package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.exception.FileException;
import Spring_AdamStore.service.FileService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;


@Slf4j(topic = "FILE-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1")
@RestController
public class FileController {

    private final FileService productImageService;


    @Operation(description = "API upload hình ảnh (có thể tải nhiều ảnh lên)")
    @PostMapping(value = "/admin/files/upload/images", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ApiResponse<List<FileResponse>> uploadImage(@RequestPart("files") List<MultipartFile> files) throws IOException, FileException {

        return ApiResponse.<List<FileResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Upload Files")
                .result(productImageService.uploadListFile(files))
                .build();
    }


    @GetMapping("/admin/files/all")
    public ApiResponse<PageResponse<FileResponse>> getAllFiles(@ParameterObject @PageableDefault Pageable pageable){
        return ApiResponse.<PageResponse<FileResponse>>builder()
                .code(HttpStatus.OK.value())
                .result(productImageService.getAllFiles(pageable))
                .message("Fetch All Files With Pagination")
                .build();
    }


    @DeleteMapping("/admin/files/delete/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) throws Exception {
         productImageService.deleteFile(id);
        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Delete File")
                .result(null)
                .build();

    }

}
