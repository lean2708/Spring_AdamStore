package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.ChatMessageRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.ChatMessageResponse;
import Spring_AdamStore.entity.nosql.ChatMessage;
import Spring_AdamStore.service.ChatMessageService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Map;


@Slf4j(topic = "CHAT-MESSAGE-CONTROLLER")
@RestController
@RequiredArgsConstructor
@RequestMapping("/v1")
public class ChatMessageController {

    private final ChatMessageService chatMessageService;
    private final SimpMessagingTemplate messagingTemplate;


    @MessageMapping("/chat.sendMessage")
    void create(@Payload @Valid ChatMessageRequest request, Principal principal) {
        log.info("Received message from user = {} : {}", principal.getName(), request.getMessage());

        ChatMessageResponse response = chatMessageService.createMessage(request, principal);

        messagingTemplate.convertAndSend(
                "/topic/conversation." + request.getConversationId(),
                response);

        log.info("User {} sent message successfully. Message ID: {}, Conversation ID: {}",
                response.getSender().getName(), response.getId(), request.getConversationId());
    }


    @Operation(summary = "Fetch all messages for conversationId",
            description = "Lấy danh sách tin nhắn  trong một cuộc trò chuyện")
    @GetMapping("/private/messages")
    public ApiResponse<List<ChatMessageResponse>> getMessages(@RequestParam("conversationId") String conversationId) {
        log.info("Received request to fetch messages for conversationId: {}", conversationId);

        return ApiResponse.<List<ChatMessageResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Get Messages for conversationId")
                .result(chatMessageService.getMessages(conversationId))
                .build();
    }


    @Operation(summary = "Search messages in a conversation by keyword")
    @GetMapping("/private/messages/search")
    public ApiResponse<List<ChatMessageResponse>> searchMessages(
            @RequestParam String conversationId,
            @RequestParam String keyword) {
        log.info("Received request search messages conversationId {}, with keyword: {}", conversationId, keyword);

        return ApiResponse.<List<ChatMessageResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Search messages in a conversation by keyword")
                .result(chatMessageService.searchMessages(conversationId, keyword))
                .build();
    }


    @Operation(summary = "Delete message by id")
    @DeleteMapping("/private/messages/{messageId}")
    public ApiResponse<Void> deleteMessage(@PathVariable String messageId) {
        log.info("Received request to delete message with id: {}", messageId);

        ChatMessage deletedMsg = chatMessageService.deleteMessage(messageId);

        // Delete message realtime
        messagingTemplate.convertAndSend("/topic/conversation." + deletedMsg.getConversationId(),
                Map.of("type", "DELETE", "messageId", messageId)
        );

        log.info(" Message with ID: {} deleted successfully", messageId);

        return ApiResponse.<Void>builder()
                .code(HttpStatus.OK.value())
                .message("Delete Message By Id")
                .build();
    }



}
