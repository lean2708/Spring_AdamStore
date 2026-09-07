package Spring_AdamStore.service;

import com.google.zxing.WriterException;

import java.awt.image.BufferedImage;

public interface QRCodeService {

    BufferedImage generateQRCodeImage(String text) throws WriterException;
}
