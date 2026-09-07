package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.EntityStatus;
import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.constants.RoleEnum;
import Spring_AdamStore.dto.request.UserCreationRequest;
import Spring_AdamStore.dto.request.UserUpdateRequest;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.*;
import Spring_AdamStore.entity.sql.relationship.UserHasRole;
import Spring_AdamStore.entity.sql.relationship.UserHasRoleId;
import Spring_AdamStore.exception.AppException;
import Spring_AdamStore.exception.ErrorCode;
import Spring_AdamStore.exception.FileException;
import Spring_AdamStore.mapper.*;
import Spring_AdamStore.repository.criteria.SearchCriteria;
import Spring_AdamStore.repository.criteria.SearchCriteriaQueryConsumer;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.repository.sql.relationship.PromotionUsageRepository;
import Spring_AdamStore.repository.sql.relationship.UserHasRoleRepository;
import Spring_AdamStore.service.*;
import Spring_AdamStore.service.relationship.UserHasRoleService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.*;
import jakarta.persistence.criteria.Order;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import static Spring_AdamStore.constants.EntityStatus.ACTIVE;

@Service
@Slf4j(topic = "USER-SERVICE")
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    private final UserHasRoleRepository userHasRoleRepository;
    private final AddressRepository addressRepository;
    private final CartService cartService;
    private final AddressMapper addressMapper;
    private final PromotionRepository promotionRepository;
    private final OrderRepository orderRepository;
    private final CurrentUserService currentUserService;
    private final PromotionUsageRepository promotionUsageRepository;
    private final PromotionMapper promotionMapper;
    private final UserMappingHelper userMappingHelper;
    private final AddressMappingHelper addressMappingHelper;
    private final FileService fileService;
    @PersistenceContext
    private EntityManager entityManager;


    @Override
    @Transactional
    public UserResponse create(UserCreationRequest request) {
        log.info("Creating user with data= {}", request);

        checkEmailExist(request.getEmail());
        User user = userMapper.userCreationToUser(request);

        user.setPassword(passwordEncoder.encode(request.getPassword()));

        userRepository.save(user);

        Set<Role> roleSet = roleRepository.findAllByIdIn(request.getRoleIds());
        if (roleSet.isEmpty()){
            throw new AppException(ErrorCode.ROLE_NOT_EXISTED);
        }

        List<UserHasRole> userRoles = roleSet.stream().map(role -> UserHasRole.builder()
                .id(new UserHasRoleId(user.getId(), role.getId()))
                        .state(ACTIVE)
                        .build())
                .collect(Collectors.toList());
        userHasRoleRepository.saveAll(userRoles);

        // Cart
        cartService.createCartForUser(user);

        return userMapper.toUserResponse(user, userMappingHelper);
    }

    @Override
    public UserResponse fetchUserById(Long id) {
        log.info("Fetch user By Id: {}", id);

        User user = findActiveUserById(id);

        return userMapper.toUserResponse(user, userMappingHelper);
    }

    @Override
    public PageResponse<UserResponse> fetchAllUsers(Pageable pageable) {
        log.info("Fetch All User For Admin");

        Page<User> userPage = userRepository.findAllUsers(pageable);

        return PageResponse.<UserResponse>builder()
                .page(userPage.getNumber())
                .size(userPage.getSize())
                .totalPages(userPage.getTotalPages())
                .totalItems(userPage.getTotalElements())
                .items(userMapper.toUserResponseList(userPage.getContent(), userMappingHelper))
                .build();
    }

    @Override
    public PageResponse<UserResponse> searchUser(Pageable pageable, List<String> search) {
        log.info("Searching Users with pageable={} and search params={}", pageable, search);

        List<SearchCriteria> criteriaList = new ArrayList<>();

        // lay danh sach cac dieu kien search
        if(search != null){
            for(String s : search){
                Pattern pattern = Pattern.compile("(\\w+?)(~|>|<|=)(.*)");
                Matcher matcher = pattern.matcher(s);
                if(matcher.find()){
                    criteriaList.add(new SearchCriteria(matcher.group(1), matcher.group(2), matcher.group(3)));
                }
            }
        }

        List<User> userList = getUserList(pageable, criteriaList);

        Long totalElements = getTotalElements(criteriaList);
        int totalPages = (int) Math.ceil((double) totalElements / pageable.getPageSize());

        return PageResponse.<UserResponse>builder()
                .page(pageable.getPageNumber())
                .size(pageable.getPageSize())
                .totalPages(totalPages)
                .totalItems(totalElements)
                .items(userMapper.toUserResponseList(userList, userMappingHelper))
                .build();
    }

    private List<User> getUserList(Pageable pageable, List<SearchCriteria> criteriaList) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root<User> root = query.from(User.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        if(!CollectionUtils.isEmpty(criteriaList)){ // search
            SearchCriteriaQueryConsumer queryConsumer = new SearchCriteriaQueryConsumer(builder, predicate, root);
            criteriaList.forEach(queryConsumer);

            predicate = builder.and(predicate, queryConsumer.getPredicate());
        }

        query.where(predicate);

        // Sort
        List<Order> orders = new ArrayList<>();
        for (Sort.Order order : pageable.getSort()) {
            String property = order.getProperty();

            Path<?> path = root.get(property);
            orders.add(order.isAscending() ? builder.asc(path) : builder.desc(path));
        }

        query.orderBy(orders);

        return entityManager.createQuery(query)
                .setFirstResult((int) pageable.getOffset())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
    }

    private Long getTotalElements(List<SearchCriteria> criteriaList){
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);

        Root<User> root = countQuery.from(User.class);

        // Xu ly dieu kien tim kiem
        Predicate predicate = builder.conjunction();

        if(!CollectionUtils.isEmpty(criteriaList)){ // search job
            SearchCriteriaQueryConsumer queryConsumer = new SearchCriteriaQueryConsumer(builder, predicate, root);
            criteriaList.forEach(queryConsumer);
            predicate = builder.and(predicate, queryConsumer.getPredicate());
        }

        countQuery.select(builder.count(root));
        countQuery.where(predicate);

        return entityManager.createQuery(countQuery).getSingleResult();
    }

    @Override
    @Transactional
    public UserResponse update(Long id, UserUpdateRequest request) {
        log.info("Updated User with data= {}", request);

        User user = findActiveUserById(id);

        userMapper.updateUser(user, request);

        if(!CollectionUtils.isEmpty(request.getRoleIds())){
            userHasRoleRepository.deleteAllByIdUserId(user.getId());

            Set<Role> roleSet = roleRepository.findAllByIdIn(request.getRoleIds());
            if (roleSet.isEmpty()){
                throw new AppException(ErrorCode.ROLE_NOT_EXISTED);
            }

            Set<UserHasRole> userRoles = roleSet.stream().map(role -> UserHasRole.builder()
                            .id(new UserHasRoleId(user.getId(), role.getId()))
                            .build())
                    .collect(Collectors.toSet());

            userHasRoleRepository.saveAll(userRoles);
        }

        return userMapper.toUserResponse(userRepository.save(user), userMappingHelper);
    }

    @Override
    public void delete(Long id) {
        log.info("Delete User By Id: {}", id);

        User userDB = findActiveUserById(id);

        List<OrderStatus> activeStatuses = List.of(OrderStatus.PROCESSING, OrderStatus.SHIPPED, OrderStatus.DELIVERED);
        if(orderRepository.existsByUserIdAndOrderStatusIn(userDB.getId(), activeStatuses)){
            throw new AppException(ErrorCode.USER_HAS_ACTIVE_ORDER);
        }

        if(promotionUsageRepository.existsByUserId(userDB.getId())){
            throw new AppException(ErrorCode.USER_HAS_ACTIVE_PROMOTION_USAGE);
        }

        userRepository.delete(userDB);
    }

    @Override
    public UserResponse restore(long id) {
        log.info("Restore User By Id: {}", id);

        User user = userRepository.findUserById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));

        user.setStatus(ACTIVE);
        return userMapper.toUserResponse(userRepository.save(user), userMappingHelper);
    }

    @Override
    public UserResponse updateAvatar(MultipartFile file) throws FileException, IOException {
        log.info("Updated Avatar For User");

        User user = currentUserService.getCurrentUser();

        FileResponse fileResponse = fileService.uploadFile(file);

        user.setAvatarUrl(fileResponse.getImageUrl());

        return userMapper.toUserResponse(userRepository.save(user), userMappingHelper);
    }

    @Override
    public PageResponse<AddressResponse> getAllAddressesByUser(Pageable pageable) {
        log.info("Fetch All Address For User");

        User user = currentUserService.getCurrentUser();

        Page<Address> addressPage = addressRepository.findAllByUserIdAndIsVisible(user.getId(), true, pageable);

        return PageResponse.<AddressResponse>builder()
                .page(addressPage.getNumber())
                .size(addressPage.getSize())
                .totalPages(addressPage.getTotalPages())
                .totalItems(addressPage.getTotalElements())
                .items(addressMapper.toAddressResponseList(addressPage.getContent(), addressMappingHelper))
                .build();
    }

    @Override
    public PageResponse<PromotionResponse> getPromotionsByUser(Pageable pageable) {
        log.info("Fetch All Promotion For User");

        User user = currentUserService.getCurrentUser();

        Page<Promotion> promotionPage = promotionRepository.findAllAvailableForCustomer(user.getId(), LocalDate.now(), pageable);

        return PageResponse.<PromotionResponse>builder()
                .page(promotionPage.getNumber())
                .size(promotionPage.getSize())
                .totalPages(promotionPage.getTotalPages())
                .totalItems(promotionPage.getTotalElements())
                .items(promotionMapper.toPromotionResponseList(promotionPage.getContent()))
                .build();
    }

    private void checkEmailExist(String email) {
        if (userRepository.countByEmailAndStatus(email, ACTIVE.name()) > 0) {
            throw new AppException(ErrorCode.EMAIL_EXISTED);
        }
        if (userRepository.countByEmailAndStatus(email, EntityStatus.INACTIVE.name()) > 0) {
            throw new AppException(ErrorCode.EMAIL_DISABLED);
        }
    }

    private User findActiveUserById(Long id) {
        if(userRepository.countById(id, EntityStatus.INACTIVE.name()) > 0){
            throw new AppException(ErrorCode.USER_DISABLED);
        }
        return userRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_EXISTED));
    }

}
