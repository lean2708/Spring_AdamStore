package Spring_AdamStore.service.impl;

import Spring_AdamStore.service.QRCodeService;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.awt.image.BufferedImage;

@Service
@Slf4j(topic = "QR-CODE-SERVICE")
@RequiredArgsConstructor
public class QRCodeServiceImpl implements QRCodeService {

    @Override
    public BufferedImage generateQRCodeImage(String text) throws WriterException {
        log.info("Generate QR code image: {}", text);

        QRCodeWriter barcodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = barcodeWriter.encode(text, BarcodeFormat.QR_CODE, 200, 200);

        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }
}
