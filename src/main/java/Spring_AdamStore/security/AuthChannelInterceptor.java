package Spring_AdamStore.security;

import Spring_AdamStore.constants.TokenType;
import Spring_AdamStore.service.TokenService;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

import java.text.ParseException;

@Slf4j(topic = "WEBSOCKET_AUTH")
@RequiredArgsConstructor
@Component
public class AuthChannelInterceptor implements ChannelInterceptor {

    private final TokenService tokenService;

    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        accessor.setLeaveMutable(true);

        if (StompCommand.CONNECT.equals(accessor.getCommand())) {
            String token = accessor.getFirstNativeHeader("Authorization");

            if (token != null && token.startsWith("Bearer ")) {
                token = token.substring(7);

                try {
                    SignedJWT signedJWT = tokenService.verifyToken(token, TokenType.ACCESS_TOKEN);
                    JWTClaimsSet claims = signedJWT.getJWTClaimsSet();
                    String email = claims.getSubject();

                    UserPrincipal user = new UserPrincipal(email);
                    accessor.setUser(user);
                    log.info("USER :" + user.getName());

                    accessor.getSessionAttributes().put("user", user);

                    log.info("Principal and sessionAttributes set: {}", user);

                } catch (JOSEException | ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        } else {
            Object sessionUser = accessor.getSessionAttributes().get("user");
            if (sessionUser instanceof UserPrincipal up) {
                accessor.setUser(up);
                log.info("Re-applied Principal from sessionAttributes: {}", up);
            }
        }

        log.info("User set in accessor: {}", accessor.getUser());

        return MessageBuilder.createMessage(message.getPayload(), accessor.getMessageHeaders());
    }
}
