package Spring_AdamStore.service;

import Spring_AdamStore.dto.request.ChatMessageRequest;
import Spring_AdamStore.dto.response.ChatMessageResponse;
import Spring_AdamStore.entity.nosql.ChatMessage;

import java.security.Principal;
import java.util.List;

public interface ChatMessageService {

     ChatMessageResponse createMessage(ChatMessageRequest request, Principal principal);

     List<ChatMessageResponse> getMessages(String conversationId);

     List<ChatMessageResponse> searchMessages(String conversationId, String keyword);

     ChatMessage deleteMessage(String id);
}
