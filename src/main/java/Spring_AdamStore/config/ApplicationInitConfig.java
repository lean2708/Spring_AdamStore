package Spring_AdamStore.config;

import Spring_AdamStore.constants.Gender;
import Spring_AdamStore.constants.RoleEnum;
import Spring_AdamStore.entity.Role;
import Spring_AdamStore.entity.User;
import Spring_AdamStore.repository.RoleRepository;
import Spring_AdamStore.repository.UserRepository;
import Spring_AdamStore.service.relationship.UserHasRoleService;
import lombok.RequiredArgsConstructor;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

@Slf4j(topic = "APPLICATION-INITIALIZATION")
@RequiredArgsConstructor
@Configuration
public class ApplicationInitConfig {

    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    private final UserRepository userRepository;
    private final UserHasRoleService userHasRoleService;

    @NonFinal
    static final String ADMIN_EMAIL = "admin@gmail.com";

    @NonFinal
    static final String ADMIN_PASSWORD = "admin";

    @Bean
    ApplicationRunner applicationRunner() {
        log.info("INIT APPLICATION....");

        return args -> {

            if (roleRepository.count() == 0) {
                Role userRole = roleRepository.save(Role.builder()
                        .name(RoleEnum.USER.name())
                        .description("ROLE_USER")
                        .build());

                Role adminRole = roleRepository.save(Role.builder()
                        .name(RoleEnum.ADMIN.name())
                        .description("ROLE_ADMIN")
                        .build());

                List<Role> roleList = List.of(userRole, adminRole);
                roleRepository.saveAllAndFlush(roleList);
            }

            if (userRepository.countByEmail(ADMIN_EMAIL) == 0) {
                User admin = userRepository.save(User.builder()
                        .name("Admin")
                        .email(ADMIN_EMAIL)
                        .phone("099999999")
                        .password(passwordEncoder.encode(ADMIN_PASSWORD))
                        .age(100)
                        .gender(Gender.MALE)
                        .build());

            userHasRoleService.saveUserHasRole(admin, RoleEnum.ADMIN);
            }
        };
    }



}
