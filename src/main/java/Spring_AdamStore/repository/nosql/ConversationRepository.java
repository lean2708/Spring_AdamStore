package Spring_AdamStore.repository.nosql;

import Spring_AdamStore.entity.nosql.Conversation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ConversationRepository extends MongoRepository<Conversation, String> {

    Optional<Conversation> findByParticipantsHash(String hash);

    @Query("{'participants.userId' : ?0}")
    List<Conversation> findAllByParticipantIdsContains(Long userId);

    @Query("{ 'conversationName': { $regex: ?0, $options: 'i' } }")
    List<Conversation> findByConversationNameContainingIgnoreCase(String keyword);

}
