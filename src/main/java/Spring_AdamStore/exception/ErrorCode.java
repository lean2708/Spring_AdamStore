package Spring_AdamStore.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
@AllArgsConstructor
public enum ErrorCode {

    UNCATEGORIZED_EXCEPTION(9999, "Lỗi hệ thống không xác định", HttpStatus.INTERNAL_SERVER_ERROR),
    UNAUTHENTICATED(1000, "Chưa xác thực người dùng", HttpStatus.UNAUTHORIZED),
    UNAUTHORIZED(1001, "Bạn chưa được phân quyền truy cập", HttpStatus.FORBIDDEN),
    USER_EXISTED(1002, "User đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    USER_NOT_EXISTED(1003, "Người dùng không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    INVALID_PASSWORD(1004, "Mật khẩu không chính xác", HttpStatus.UNAUTHORIZED),
    INVALID_OLD_PASSWORD(1005, "Mật khẩu cũ không chính xác", HttpStatus.BAD_REQUEST),
    INVALID_SORT_FIELD(1006, "Thuộc tính không hợp lệ để sắp xếp", HttpStatus.BAD_REQUEST),
    INVALID_SORT_FORMAT(1007, "Định dạng sortBy không hợp lệ phải là: field-asc hoặc field-desc", HttpStatus.BAD_REQUEST),
    EMAIL_SEND_FAILED(1008, "Lỗi khi gửi email", HttpStatus.BAD_REQUEST),
    EMAIL_EXISTED(1009, "Email đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    EMAIL_DISABLED(1010, "Email của bạn đã bị vô hiệu hóa", HttpStatus.FORBIDDEN),
    PHONE_EXISTED(1011, "Phone đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    PHONE_DISABLED(1012, "Phone của bạn đã bị vô hiệu hóa", HttpStatus.FORBIDDEN),
    USER_DISABLED(1013, "User đã bị vô hiệu hóa", HttpStatus.FORBIDDEN),
    TOKEN_TYPE_INVALID(1014, "Loại token không hợp lệ", HttpStatus.UNAUTHORIZED),
    INVALID_REFRESH_TOKEN(1015, "Refresh token không hợp lệ hoặc đã hết hạn", HttpStatus.UNAUTHORIZED),
    PROVINCE_EXISTED(1016, "Province đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    PROVINCE_NOT_EXISTED(1017, "Province không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    PRODUCT_EXISTED(1018, "Product đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    PRODUCT_NOT_EXISTED(1019, "Product không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    CATEGORY_EXISTED(1020, "Category đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    CATEGORY_NOT_EXISTED(1021, "Category không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    BRANCH_EXISTED(1022, "Branch đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    BRANCH_NOT_EXISTED(1023, "Branch không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    VERIFICATION_CODE_NOT_FOUND(1024, "Mã xác minh không tồn tại", HttpStatus.NOT_FOUND),
    VERIFICATION_CODE_INVALID(1025, "Mã xác minh không đúng. Vui lòng thử lại.", HttpStatus.BAD_REQUEST),
    FORGOT_PASSWORD_TOKEN_NOT_FOUND(1026, "Token đặt lại mật khẩu không tồn tại hoặc đã hết hạn", HttpStatus.NOT_FOUND),
    VERIFICATION_CODE_EXPIRED(1027, "Mã xác nhận đã hết hạn", HttpStatus.BAD_REQUEST),
    ROLE_NOT_EXISTED(1028, "Role không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    PERMISSION_NOT_EXISTED(1029, "Permission không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    ORDER_ITEM_NOT_EXISTED(1030, "OrderItem không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    ORDER_NOT_EXISTED(1031, "Order không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    PROMOTION_EXISTED(1032, "Promotion đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    PROMOTION_NOT_EXISTED(1033, "Promotion không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    REVIEW_NOT_EXISTED(1034, "Review không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    DISTRICT_NOT_EXISTED(1035, "District không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    ADDRESS_NOT_EXISTED(1036, "Address không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    INVALID_PROVINCE_FOR_DISTRICT(1037, "District không thuộc Province đã chọn", HttpStatus.BAD_REQUEST),
    INVALID_DISTRICT_FOR_WARD(1038, "Ward không thuộc District đã chọn", HttpStatus.BAD_REQUEST),
    COLOR_EXISTED(1039, "Color đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    COLOR_NOT_EXISTED(1040, "Color không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    SIZE_EXISTED(1041, "Size đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    SIZE_NOT_EXISTED(1042, "Size không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    PASSWORD_MISMATCH(1043, "Mật khẩu nhập lại không khớp", HttpStatus.BAD_REQUEST),
    CART_ITEM_EXISTED(1044, "CartItem đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    CART_ITEM_NOT_EXISTED(1045, "CartItem không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    PRODUCT_VARIANT_EXISTED(1046, "ProductVariant đã tồn tại trong hệ thống", HttpStatus.BAD_REQUEST),
    PRODUCT_VARIANT_NOT_EXISTED(1047, "ProductVariant không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    OUT_OF_STOCK(1048, "Không đủ hàng trong kho", HttpStatus.BAD_REQUEST),
    INVALID_IMAGE_LIST(1049, "Danh sách Image không hợp lệ", HttpStatus.BAD_REQUEST),
    INVALID_PRODUCT_COLOR_LIST(1050, "Danh sách Color không hợp lệ", HttpStatus.BAD_REQUEST),
    INVALID_PRODUCT_SIZE_LIST(1051, "Danh sách Size không hợp lệ", HttpStatus.BAD_REQUEST),
    CODE_TYPE_INVALID(1052, "Loại verificationCode không hợp lệ", HttpStatus.UNAUTHORIZED),
    PENDING_USER_NOT_FOUND(1053, "Không tìm thấy thông tin đăng ký", HttpStatus.NOT_FOUND),
    WARD_NOT_EXISTED(1054, "Ward không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    CART_NOT_EXISTED(1055, "Cart không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    PROMOTION_EXPIRED(1056, "Promotion đã hết hạn hoặc không hợp lệ", HttpStatus.BAD_REQUEST),
    ORDER_CANNOT_UPDATE_ADDRESS(1057, "Không thể cập nhật địa chỉ khi đơn hàng đã được giao hoặc huỷ", HttpStatus.BAD_REQUEST),
    ADDRESS_NOT_BELONG_TO_USER(1058, "Địa chỉ không thuộc về người dùng hiện tại", HttpStatus.FORBIDDEN),
    ORDER_NOT_BELONG_TO_USER(1059, "Đơn hàng không thuộc về người dùng hiện tại", HttpStatus.FORBIDDEN),
    PAYMENT_HISTORY_NOT_EXISTED(1060, "PaymentHistory không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    INVALID_ORDER_STATUS(1061, "Đơn hàng không ở trạng thái PENDING", HttpStatus.FORBIDDEN),
    PROMOTION_ALREADY_USED(1062, "Bạn đã sử dụng mã khuyến mãi này rồi", HttpStatus.BAD_REQUEST),
    CATEGORY_DELETE_CONFLICT(1063, "Không thể xóa Category vì vẫn còn Product đang hoạt động", HttpStatus.CONFLICT),
    PROMOTION_USAGE_CONFLICT(1064, "Không thể xóa Promotion này vì đã được sử dụng trong đơn hàng", HttpStatus.FORBIDDEN),
    USER_HAS_ACTIVE_PROMOTION_USAGE(1065, "Không thể xóa người dùng vì đã từng sử dụng khuyến mãi", HttpStatus.FORBIDDEN),
    USER_HAS_ACTIVE_ORDER(1066, "Người dùng có đơn hàng đang ở trạng thái Processing, Shipped hoặc Delivered", HttpStatus.FORBIDDEN),
    PRODUCT_VARIANT_USED_IN_ORDER(1067, "Không thể xóa mềm Product (Product Variant) vì đã được sử dụng trong đơn hàng.", HttpStatus.FORBIDDEN),
    COLOR_HAS_USED_VARIANT(1068, "Không thể xóa màu vì có product variant đã sử dụng color này.", HttpStatus.FORBIDDEN),
    DEFAULT_ADDRESS_CANNOT_BE_DELETED(1069, "Không thể xóa địa chỉ mặc định", HttpStatus.BAD_REQUEST),
    ADDRESS_USED_IN_ORDER(1070, "Địa chỉ đã được sử dụng trong đơn hàng", HttpStatus.BAD_REQUEST),
    FILE_NOT_EXISTED(1071, "File không tồn tại trong hệ thống", HttpStatus.NOT_FOUND),
    ORDER_CANNOT_BE_CANCELLED(1072, "Đơn hàng không thể huỷ vì không ở trạng thái cho phép (PENDING hoặc PROCESSING)", HttpStatus.BAD_REQUEST),
    CONVERSATION_NOT_FOUND(1073, "Không tìm thấy conversation", HttpStatus.NOT_FOUND),
    NOT_A_PARTICIPANT(1074, "Bạn không có quyền truy cập cuộc hội thoại này", HttpStatus.FORBIDDEN),
    MESSAGE_NOT_FOUND(1075,"Message not found", HttpStatus.NOT_FOUND)

    ;



    private final int code;
    private final String message;
    private final HttpStatus statusCode;
}
