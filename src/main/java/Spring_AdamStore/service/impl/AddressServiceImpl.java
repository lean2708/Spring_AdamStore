package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.dto.request.AddressRequest;
import Spring_AdamStore.dto.response.AddressResponse;
import Spring_AdamStore.dto.response.PageResponse;
import Spring_AdamStore.entity.sql.Address;
import Spring_AdamStore.entity.sql.User;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.mapper.AddressMapper;
import Spring_AdamStore.mapper.AddressMappingHelper;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.service.AddressService;
import Spring_AdamStore.service.CurrentUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j(topic = "ADDRESS-SERVICE")
@RequiredArgsConstructor
public class AddressServiceImpl implements AddressService {

    private final AddressRepository addressRepository;
    private final AddressMapper addressMapper;
    private final DistrictRepository districtRepository;
    private final ProvinceRepository provinceRepository;
    private final WardRepository wardRepository;
    private final CurrentUserService currentUserService;
    private final OrderRepository orderRepository;
    private final AddressMappingHelper addressMappingHelper;


    @Override
    @Transactional
    public AddressResponse create(AddressRequest request) {
        log.info("Creating address with data= {}", request);

        findWardByCode(request.getWardCode());

        findDistrictById(request.getDistrictId());

        findProvinceById(request.getProvinceId());

        Address address = addressMapper.toAddress(request);

        User user = currentUserService.getCurrentUser();
        address.setUserId(user.getId());

        if (Boolean.TRUE.equals(request.getIsDefault())) {
            List<Address> addressList = addressRepository.findAllByUserId(user.getId());

            addressList.stream()
                    .filter(Address::getIsDefault)
                    .forEach(userAddress -> {
                        userAddress.setIsDefault(false);
                        addressRepository.save(userAddress);
                    });
        }

        return addressMapper.toAddressResponse(addressRepository.save(address), addressMappingHelper);
    }

    @Override
    public AddressResponse fetchById(Long id) {
        log.info("Fetch Address By Id: {}", id);

        Address address = findAddressById(id);

        return addressMapper.toAddressResponse(address, addressMappingHelper);
    }

    @Override
    public PageResponse<AddressResponse> fetchAllForAdmin(Pageable pageable) {
        log.info("Fetch All Address For Admin");

        Page<Address> addressPage = addressRepository.findAllAddresses(pageable);

        return PageResponse.<AddressResponse>builder()
                .page(addressPage.getNumber())
                .size(addressPage.getSize())
                .totalPages(addressPage.getTotalPages())
                .totalItems(addressPage.getTotalElements())
                .items(addressMapper.toAddressResponseList(addressPage.getContent(), addressMappingHelper))
                .build();
    }

    @Override
    @Transactional
    public AddressResponse update(Long id, AddressRequest request) {
        log.info("Updated address with data= {}", request);

        Address address = findAddressById(id);

        findWardByCode(request.getWardCode());

        findDistrictById(request.getDistrictId());

        findProvinceById(request.getProvinceId());

        addressMapper.update(address, request);

        if (Boolean.TRUE.equals(request.getIsDefault())) {
            List<Address> addressList = addressRepository.findAllByUserId(address.getUserId());
            addressList.stream()
                    .filter(Address::getIsDefault)
                    .forEach(userAddress -> {
                        userAddress.setIsDefault(false);
                        addressRepository.save(userAddress);
                    });
            address.setIsDefault(true);
        }

        return addressMapper.toAddressResponse(addressRepository.save(address), addressMappingHelper);
    }

    @Override
    @Transactional
    public void hideAddress(Long id) {
        log.info("Hide Address By id: {}", id);

        Address address = findAddressById(id);
        address.setIsVisible(false);

        addressRepository.save(address);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        log.info("Delete Address By Id: {}", id);

        Address address = findAddressById(id);

        if (Boolean.TRUE.equals(address.getIsDefault())) {
            throw new AppException(ErrorCode.DEFAULT_ADDRESS_CANNOT_BE_DELETED);
        }

        if(orderRepository.existsByAddressIdAndStatusIn(address.getId(),
                List.of(OrderStatus.PENDING, OrderStatus.PROCESSING, OrderStatus.SHIPPED,
                        OrderStatus.DELIVERED, OrderStatus.CANCELLED))){
            throw new AppException(ErrorCode.ADDRESS_USED_IN_ORDER);
        }

        addressRepository.delete(address);
    }

    @Override
    @Transactional
    public AddressResponse restore(long id) {
        log.info("Restore Address By Id: {}", id);

        Address address = addressRepository.findAddressById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ADDRESS_NOT_EXISTED));

        address.setStatus(EntityStatus.ACTIVE);
        return addressMapper.toAddressResponse(addressRepository.save(address), addressMappingHelper);
    }


    private Address findAddressById(Long id) {
        return addressRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ADDRESS_NOT_EXISTED));
    }

    private void findWardByCode(String code) {
          wardRepository.findByCode(code)
                .orElseThrow(() -> new AppException(ErrorCode.WARD_NOT_EXISTED));
    }

    private void findDistrictById(Integer id) {
         districtRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DISTRICT_NOT_EXISTED));
    }

    private void findProvinceById(Integer id) {
         provinceRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.PROVINCE_NOT_EXISTED));
    }


}


