package Spring_AdamStore.controller;

import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.service.StatisticsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Slf4j(topic = "STATISTICS-CONTROLLER")
@RequiredArgsConstructor
@Validated
@RequestMapping("/v1/admin/statistics")
@RestController
public class StatisticsController {

    private final StatisticsService statisticsService;


    @Operation(summary = "Get total orders and revenue",
            description = "API lấy tổng số lượng đơn hàng và tổng doanh thu trong khoảng startDate đến endDate (yyyy-MM-dd)")
    @GetMapping("/orders/summary")
    public ApiResponse<OrderStatsDTO> getOrderRevenueSummary(
            @RequestParam @Parameter(example = "2025-06-20") LocalDate startDate,
            @RequestParam @Parameter(example = "2025-08-10") LocalDate endDate) {
        log.info("Received request to get order revenue summary");

        return ApiResponse.<OrderStatsDTO>builder()
                .code(HttpStatus.OK.value())
                .message("Fetched order revenue summary")
                .result(statisticsService.getOrderRevenueSummary(startDate, endDate))
                .build();
    }



    @Operation(summary = "Fetched monthly revenue data",
    description = "API để ấy doanh thu theo tháng trong khoảng (startDate (yyyy-MM-dd) đến endDate (yyyy-MM-dd))")
    @GetMapping("/revenues/monthly")
    public ApiResponse<List<RevenueByMonthDTO>> getMonthlyRevenue(@RequestParam @Parameter(example = "2025-02-20") LocalDate startDate,
                                                       @RequestParam @Parameter(example = "2025-05-10") LocalDate endDate){
        log.info("Received request to Fetched monthly revenue data");

        return ApiResponse.<List<RevenueByMonthDTO>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetched monthly revenue data")
                .result(statisticsService.getRevenueByMonth(startDate, endDate))
                .build();
    }


    @Operation(summary = "Fetched top selling products",
            description = "API để lấy các sản phẩm bán chạy (yyyy-MM-dd)")
    @GetMapping("/products/top-selling")
    public ApiResponse<List<TopSellingDTO>> getTopSellingProducts(@RequestParam("startDate") @Parameter(example = "2025-02-20") LocalDate startDate,
                                                                  @RequestParam("endDate") @Parameter(example = "2025-05-10") LocalDate endDate) {
        log.info("Received request to Fetched top selling products");

        List<TopSellingDTO> stats = statisticsService.getTopSellingProducts(startDate, endDate);
        return ApiResponse.<List<TopSellingDTO>>builder()
                .code(HttpStatus.OK.value())
                .message("Fetched top selling products")
                .result(stats)
                .build();
    }


    @Operation(summary = "Export order revenue report to Excel",
    description = "API để xuất dữ liệu doanh thu của các đơn hàng ra file Excel (yyyy-MM-dd)")
    @GetMapping("/orders/revenue-by-date/export")
    public void exportOrderRevenueToExcel(@RequestParam @Parameter(example = "2025-02-20") LocalDate startDate,
                                          @RequestParam @Parameter(example = "2025-05-10") LocalDate endDate,
                                          HttpServletResponse response){
        log.info("Received request to export order revenue to Excel");

        statisticsService.exportOrderRevenueToExcel(startDate, endDate, response);
    }
}
