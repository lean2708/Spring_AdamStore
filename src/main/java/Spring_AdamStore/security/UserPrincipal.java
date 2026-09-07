package Spring_AdamStore.security;

import lombok.*;

import java.security.Principal;

@AllArgsConstructor
@Setter
@Getter
public class UserPrincipal implements Principal {

    private final String email;

    @Override
    public String getName() {
        return email;
    }
}
