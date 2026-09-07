package Spring_AdamStore.service;

import Spring_AdamStore.dto.response.*;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;
import java.util.List;

public interface StatisticsService {

    OrderStatsDTO getOrderRevenueSummary(LocalDate startDate, LocalDate endDate);

    List<RevenueByMonthDTO> getRevenueByMonth(LocalDate startDate, LocalDate endDate);

    List<TopSellingDTO> getTopSellingProducts(LocalDate startDate, LocalDate endDate);

    void exportOrderRevenueToExcel(LocalDate startDate, LocalDate endDate, HttpServletResponse response);


}
