package Spring_AdamStore.mapper;

import Spring_AdamStore.constants.PaymentStatus;
import Spring_AdamStore.dto.response.AddressResponse;
import Spring_AdamStore.dto.response.OrderItemResponse;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.entity.sql.relationship.PromotionUsage;
import Spring_AdamStore.repository.sql.AddressRepository;
import Spring_AdamStore.repository.sql.OrderItemRepository;
import Spring_AdamStore.repository.sql.PaymentHistoryRepository;
import Spring_AdamStore.repository.sql.UserRepository;
import Spring_AdamStore.repository.sql.relationship.PromotionUsageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class OrderMappingHelper {

    private final AddressRepository addressRepository;
    private final AddressMapper addressMapper;
    private final AddressMappingHelper addressMappingHelper;
    private final UserRepository userRepository;
    private final OrderItemRepository orderItemRepository;
    private final OrderItemMapper orderItemMapper;
    private final PromotionUsageRepository promotionUsageRepository;
    private final OrderItemMappingHelper orderItemMappingHelper;
    private final PaymentHistoryRepository paymentHistoryRepository;


    public AddressResponse getAddressResponse(Long addressId){
        return addressRepository.findById(addressId)
                .map(address -> addressMapper.toAddressResponse(address, addressMappingHelper))
                .orElse(null);
    }

    public String getUserName(Long userId){
        return userRepository.findById(userId)
                .map(User::getName)
                .orElse(null);
    }

    public Double getDiscountAmount(Long userId, Long orderId){
        return promotionUsageRepository.findByUserIdAndOrderId(userId, orderId)
                .map(PromotionUsage::getDiscountAmount)
                .orElse(0.0);
    }

    public List<OrderItemResponse> getListOrderItemResponse(Long orderId){
        return orderItemMapper.toOrderItemResponseList(orderItemRepository.findAllByOrderId(orderId), orderItemMappingHelper);
    }

    public String getPaymentMethod(Long orderId){
        return paymentHistoryRepository.findByOrderIdAndPaymentStatus(orderId, PaymentStatus.PAID)
                .map(paymentHistory -> paymentHistory.getPaymentMethod().toString())
                .orElse(null);
    }


}
