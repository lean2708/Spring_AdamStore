package Spring_AdamStore.service;

public interface InitService {

    void initRoles();

    void initAdmin();

    void initSizes();

    void importProvincesFromCsv();

    void importDistrictsFromCsv();

    void importWardFromCsv();

    void initProvinces();
}
