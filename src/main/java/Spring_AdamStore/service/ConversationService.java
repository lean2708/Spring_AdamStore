package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.ConversationRequest;
import Spring_AdamStore.dto.response.ConversationResponse;

import java.util.List;

public interface ConversationService {
    
    ConversationResponse createConversation(ConversationRequest request);

    List<ConversationResponse> myConversations();

    List<ConversationResponse> searchConversationsByName(String name);

}
