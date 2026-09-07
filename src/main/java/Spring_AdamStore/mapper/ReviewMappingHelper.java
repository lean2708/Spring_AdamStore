package Spring_AdamStore.mapper;

import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.repository.sql.UserRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ReviewMappingHelper {

    private final ObjectMapper objectMapper;
    private final UserRepository userRepository;

    public JsonNode toJsonNode(List<String> imageUrls) {
        return objectMapper.valueToTree(imageUrls);
    }

    public String getUserName(Long userId){
        return userRepository.findById(userId)
                .map(User::getName)
                .orElse(null);
    }

    public String getAvatar(Long userId){
        return userRepository.findById(userId)
                .map(User::getAvatarUrl)
                .orElse(null);
    }

}
