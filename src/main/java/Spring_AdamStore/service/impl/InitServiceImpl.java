package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.AppProperties;
import Spring_AdamStore.constants.Gender;
import Spring_AdamStore.constants.RoleEnum;
import Spring_AdamStore.constants.SizeEnum;
import Spring_AdamStore.entity.sql.*;
import Spring_AdamStore.repository.sql.*;
import Spring_AdamStore.service.*;
import Spring_AdamStore.service.relationship.UserHasRoleService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;


@Service
@Slf4j(topic = "INIT-SERVICE")
@RequiredArgsConstructor
public class InitServiceImpl implements InitService {

    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    private final UserRepository userRepository;
    private final UserHasRoleService userHasRoleService;
    private final ProvinceRepository provinceRepository;
    private final DistrictRepository districtRepository;
    private final ProvinceService provinceService;
    private final DistrictService districtService;
    private final SizeRepository sizeRepository;
    private final CartService cartService;
    private final WardService wardService;
    private final WardRepository wardRepository;
    private final AppProperties appProperties;


    @Value("${location.data.province-path}")
    private Resource provinceResource;

    @Value("${location.data.district-path}")
    private Resource districtResource;

    @Value("${location.data.ward-path}")
    private Resource wardResource;

    @Value("${app.batch-size.province}")
    private int provinceBatchSize;

    @Value("${app.batch-size.district}")
    private int districtBatchSize;

    @Value("${app.batch-size.ward}")
    private int wardBatchSize;



    @Transactional
    public void initRoles() {
        log.info("Received request to initialize roles");

        Role userRole = roleRepository.save(Role.builder()
                .name(RoleEnum.USER.name())
                .description("ROLE_USER")
                .build());

        Role adminRole = roleRepository.save(Role.builder()
                .name(RoleEnum.ADMIN.name())
                .description("ROLE_ADMIN")
                .build());

        List<Role> roleList = List.of(userRole, adminRole);
        roleRepository.saveAllAndFlush(roleList);

        log.info("Successfully initialized roles: {}", roleList.size());
    }

    @Transactional
    public void initAdmin() {
        log.info("Received request to initialize admin user.");

        User admin = userRepository.save(User.builder()
                .name("Admin")
                .email(appProperties.getAdmin().getEmail())
                .password(passwordEncoder.encode(appProperties.getAdmin().getPassword()))
                .dob(LocalDate.now())
                .avatarUrl(appProperties.getDefaultAvatarUrl())
                .gender(Gender.MALE)
                .build());

        userHasRoleService.saveUserHasRole(admin, RoleEnum.ADMIN);

        cartService.createCartForUser(admin);

        log.info("Successfully initialized admin user with email: {}", admin.getEmail());
    }


    @Transactional
    public void initSizes() {
        log.info("Received request to initialize sizes.");

        List<Size> sizeList = SizeEnum.getAllSizes();

        sizeRepository.saveAllAndFlush(sizeList);

        log.info("Successfully initialized sizes: {}", sizeList.size());
    }

    public void importProvincesFromCsv() {
        log.info("Received request to import provinces from CSV.");

        try (
                Reader reader = new InputStreamReader(provinceResource.getInputStream(), StandardCharsets.UTF_8);
                CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader())
        ) {
            List<Province> provinces = new ArrayList<>();

            for (CSVRecord record : csvParser) {
                Province province = Province.builder()
                        .id(Integer.parseInt(record.get("id")))
                        .name(record.get("name"))
                        .build();
                provinces.add(province);
            }

            List<List<Province>> batches = Lists.partition(provinces, provinceBatchSize);
            for (List<Province> batch : batches) {
                provinceRepository.saveAll(batch);
            }

            log.info("Successfully imported {} provinces from CSV.", provinces.size());
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi đọc file provinces.csv", e);
        }
    }

    public void importDistrictsFromCsv() {
        log.info("Received request to import districts from CSV.");

        try (
                Reader reader = new InputStreamReader(districtResource.getInputStream(), StandardCharsets.UTF_8);
                CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader())
        ) {
            List<District> districts = new ArrayList<>();

            for (CSVRecord record : csvParser) {
                District district = District.builder()
                        .id(Integer.parseInt(record.get("id")))
                        .name(record.get("name"))
                        .provinceId(Integer.parseInt(record.get("province_id")))
                        .build();
                districts.add(district);
            }

            List<List<District>> batches = Lists.partition(districts, districtBatchSize);
            for (List<District> batch : batches) {
                districtRepository.saveAll(batch);
            }

            log.info("Successfully imported {} districts from CSV.", districts.size());
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi đọc file districts.csv", e);
        }
    }

    @Transactional
    public void importWardFromCsv() {
        log.info("Received request to import wards from CSV.");

        try (
                Reader reader = new InputStreamReader(wardResource.getInputStream(), "UTF-8");
                CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader());
        ) {
            List<Ward> wards = new ArrayList<>();

            for (CSVRecord record : csvParser) {
                Ward ward = Ward.builder()
                        .code(record.get("code"))
                        .name(record.get("name"))
                        .districtId(Integer.parseInt(record.get("district_id")))
                        .build();
                wards.add(ward);
            }

            // Chia tung batch 1000 dong
            List<List<Ward>> batches = Lists.partition(wards, wardBatchSize);
            for (List<Ward> batch : batches) {
                wardRepository.saveAll(batch);
            }

            log.info("Successfully imported {} wards from CSV.", wards.size());
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi đọc file wards.csv", e);
        }
    }


    @Transactional
    public void initProvinces(){
        List<Province> provinceList = provinceService.loadProvincesFromGhn();

        provinceRepository.saveAllAndFlush(provinceList);

        provinceList.forEach(this::saveAllDistrictsByProvince);
    }


    private void saveAllDistrictsByProvince(Province province){
        List<District> districtList = districtService.loadDistrictsFromGhn(province.getId());
        districtList.forEach(district -> district.setProvinceId(province.getId()));

        districtRepository.saveAllAndFlush(districtList);

        districtList.forEach(this::saveAllWardsByDistrict);
    }

    private void saveAllWardsByDistrict(District district){
        List<Ward> wardList = wardService.loadWardsFromGhn(district.getId());
        wardList.forEach(ward -> ward.setDistrictId(district.getId()));

        wardRepository.saveAllAndFlush(wardList);
    }


}
