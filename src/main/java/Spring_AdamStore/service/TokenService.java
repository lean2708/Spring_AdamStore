package Spring_AdamStore.service;

import Spring_AdamStore.constants.TokenType;
import Spring_AdamStore.entity.sql.User;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jwt.SignedJWT;

import java.text.ParseException;

public interface TokenService {

    String generateToken(User user, TokenType type) throws JOSEException;

    SignedJWT verifyToken(String token, TokenType type) throws JOSEException, ParseException;

    void saveRefreshToken(String token);
}
