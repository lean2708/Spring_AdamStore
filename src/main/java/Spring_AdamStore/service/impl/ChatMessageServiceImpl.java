package Spring_AdamStore.service.impl;

import Spring_AdamStore.dto.request.ChatMessageRequest;
import Spring_AdamStore.dto.response.ChatMessageResponse;
import Spring_AdamStore.entity.nosql.ChatMessage;
import Spring_AdamStore.entity.nosql.Conversation;
import Spring_AdamStore.entity.nosql.ParticipantInfo;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.repository.nosql.ChatMessageRepository;
import Spring_AdamStore.repository.nosql.ConversationRepository;
import Spring_AdamStore.repository.sql.UserRepository;
import Spring_AdamStore.security.UserPrincipal;
import Spring_AdamStore.service.ChatMessageService;
import Spring_AdamStore.service.CurrentUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Slf4j(topic = "CHAT-MESSAGE-SERVICE")
@RequiredArgsConstructor
public class ChatMessageServiceImpl implements ChatMessageService {

    private final ConversationRepository conversationRepository;
    private final UserRepository userRepository;
    private final ChatMessageRepository chatMessageRepository;
    private final CurrentUserService currentUserService;

    public ChatMessageResponse createMessage(ChatMessageRequest request, Principal principal) {
        log.info("Create Message for conversationId {}", request.getConversationId());

        UserPrincipal userPrincipal = (UserPrincipal) principal;
        String email = userPrincipal.getName();

        // check conversation
        conversationRepository.findById(request.getConversationId())
                .orElseThrow(() -> new AppException(ErrorCode.CONVERSATION_NOT_FOUND))
                .getParticipants()
                .stream()
                .filter(participantInfo -> email.equals(participantInfo.getEmail()))
                .findAny()
                .orElseThrow(() -> new AppException(ErrorCode.CONVERSATION_NOT_FOUND));

        User currentUser = userRepository.findByEmail(email)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));

        ChatMessage chatMessage = ChatMessage.builder()
                .conversationId(request.getConversationId())
                .message(request.getMessage())
                .sender(createSender(currentUser))
                .createdDate(LocalDateTime.now())
                .build();

        return toChatMessageResponse(chatMessageRepository.save(chatMessage), currentUser);
    }

    public List<ChatMessageResponse> getMessages(String conversationId) {
        log.info("Fetch all messages for conversationId : {}", conversationId);

        User curentUser = currentUserService.getCurrentUser();

        // check conversation
        conversationRepository.findById(conversationId)
                .orElseThrow(() -> new AppException(ErrorCode.CONVERSATION_NOT_FOUND))
                .getParticipants()
                .stream()
                .filter(participantInfo -> curentUser.getEmail().equals(participantInfo.getEmail()))
                .findAny()
                .orElseThrow(() -> new AppException(ErrorCode.CONVERSATION_NOT_FOUND));

        List<ChatMessage> messages = chatMessageRepository.findAllByConversationIdOrderByCreatedDateDesc(conversationId);

        return messages.stream()
                .map(chatMessage -> toChatMessageResponse(chatMessage, curentUser))
                .toList();
    }

    @Override
    public List<ChatMessageResponse> searchMessages(String conversationId, String keyword) {
        log.info("Search Message for Conversation : {}", conversationId);

        User curentUser = currentUserService.getCurrentUser();

        // Check current user join conversation
        Conversation conversation = conversationRepository.findById(conversationId)
                .orElseThrow(() -> new AppException(ErrorCode.CONVERSATION_NOT_FOUND));

        boolean isParticipant = conversation.getParticipants().stream()
                .anyMatch(p -> curentUser.getEmail().equals(p.getEmail()));

        if (!isParticipant) {
            throw new AppException(ErrorCode.NOT_A_PARTICIPANT);
        }

        // Tìm kiếm message
        List<ChatMessage> messages = chatMessageRepository.searchMessagesInConversation(conversationId, keyword);

        return messages.stream()
                .map(m -> toChatMessageResponse(m, curentUser))
                .toList();
    }

    @Override
    public ChatMessage deleteMessage(String messageId) {
        log.info("Delete Message By Id : {}", messageId);

        ChatMessage chatMessage = chatMessageRepository.findById(messageId)
                .orElseThrow(() -> new AppException(ErrorCode.MESSAGE_NOT_FOUND));

        User currentUser = currentUserService.getCurrentUser();
        if (!chatMessage.getSender().getEmail().equals(currentUser.getEmail())) {
            throw new AppException(ErrorCode.UNAUTHORIZED);
        }

        chatMessageRepository.deleteById(messageId);

        return chatMessage;
    }



    private ParticipantInfo createSender(User user){
        return ParticipantInfo.builder()
                .userId(user.getId())
                .email(user.getEmail())
                .name(user.getName())
                .avatarUrl(user.getAvatarUrl())
                .build();
    }

    private ChatMessageResponse toChatMessageResponse(ChatMessage chatMessage, User currentUser) {
        return ChatMessageResponse.builder()
                .id(chatMessage.getId())
                .message(chatMessage.getMessage())
                .conversationId(chatMessage.getConversationId())
                .createdDate(chatMessage.getCreatedDate())
                .sender(chatMessage.getSender())
                .me(chatMessage.getSender().getUserId().equals(currentUser.getId()))
                .build();
    }
}
