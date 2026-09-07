package Spring_AdamStore.controller;

import Spring_AdamStore.dto.request.ConversationRequest;
import Spring_AdamStore.dto.response.ApiResponse;
import Spring_AdamStore.dto.response.ColorResponse;
import Spring_AdamStore.dto.response.ConversationResponse;
import Spring_AdamStore.service.ConversationService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@Slf4j(topic = "CONVERSATION-CONTROLLER")
@RestController
@RequiredArgsConstructor
@RequestMapping("/v1/private/conversations")
public class ConversationController {

    private final ConversationService conversationService;
    private final SimpMessagingTemplate messagingTemplate;


    @Operation(summary = "Create or retrieve a conversation",
            description = "API dùng để tạo mới một conversation nếu chưa tồn tại, hoặc lấy ra conversation đã tồn tại")
    @PostMapping("/create")
    ApiResponse<ConversationResponse> createConversation(@RequestBody @Valid ConversationRequest request) {
        log.info("Received request to create Conversation: {}", request);

        ConversationResponse conversation = conversationService.createConversation(request);

        conversation.getParticipants().forEach(user -> {
            String destination = "/topic/user." + user.getUserId();
            messagingTemplate.convertAndSend(destination, conversation);
        });

        return ApiResponse.<ConversationResponse>builder()
                .code(HttpStatus.CREATED.value())
                .message("Create Conversation")
                .result(conversation)
                .build();
    }


    @Operation(summary = "Get conversations of current user",
            description = "Lấy danh sách các cuộc trò chuyện của người dùng hiện tại")
    @GetMapping("/my-conversations")
    ApiResponse<List<ConversationResponse>> myConversations() {
        log.info("Received request to fetch Conversations for Current User");

        return ApiResponse.<List<ConversationResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("My Conversations")
                .result(conversationService.myConversations())
                .build();
    }


    @GetMapping("/search")
    @Operation(summary = "Search conversations by Name", description = "Tìm kiếm các cuộc hội thoại theo tên (conversationName)")
    public ApiResponse<List<ConversationResponse>> searchConversationsByName(@RequestParam String name) {
        log.info("Received request to searching conversations with name: {}", name);

        return ApiResponse.<List<ConversationResponse>>builder()
                .code(HttpStatus.OK.value())
                .message("Search results")
                .result(conversationService.searchConversationsByName(name))
                .build();
    }



}
