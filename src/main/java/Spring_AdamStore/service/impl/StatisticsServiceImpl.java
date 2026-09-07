package Spring_AdamStore.service.impl;

import Spring_AdamStore.constants.OrderStatus;
import Spring_AdamStore.dto.response.*;
import Spring_AdamStore.entity.sql.Order;
import Spring_AdamStore.mapper.OrderMapper;
import Spring_AdamStore.mapper.OrderMappingHelper;
import Spring_AdamStore.repository.sql.OrderRepository;
import Spring_AdamStore.repository.sql.PaymentHistoryRepository;
import Spring_AdamStore.repository.sql.ProductRepository;
import Spring_AdamStore.service.StatisticsService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Slf4j(topic = "STATISTICS-SERVICE")
@RequiredArgsConstructor
@Service
public class StatisticsServiceImpl implements StatisticsService {

    private final PaymentHistoryRepository paymentHistoryRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final OrderMapper orderMapper;
    private final OrderMappingHelper orderMappingHelper;

    @Override
    public OrderStatsDTO getOrderRevenueSummary(LocalDate startDate, LocalDate endDate) {
        log.info("Calculating total orders and revenue from {} to {}", startDate, endDate);

        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(LocalTime.MAX);

        List<Order> orders = orderRepository.findAllByOrderDateBetweenAndOrderStatus(
                startDateTime, endDateTime, OrderStatus.DELIVERED);

        long totalOrders = orders.size();
        double totalRevenue = orders.stream()
                .mapToDouble(Order::getTotalPrice)
                .sum();

        return new OrderStatsDTO(totalOrders, totalRevenue);
    }

    @Override
    public List<RevenueByMonthDTO> getRevenueByMonth(LocalDate startDate, LocalDate endDate) {
        log.info("Getting monthly revenue from {} to {}", startDate, endDate);

        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(LocalTime.MAX);

        return paymentHistoryRepository.getRevenueByMonth(startDateTime, endDateTime);
    }

    @Override
    public List<TopSellingDTO> getTopSellingProducts(LocalDate startDate, LocalDate endDate) {
        log.info("Fetching top-selling products from {} to {}", startDate, endDate);

        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(LocalTime.MAX);

        return productRepository.findTopSellingProductsBetween(startDateTime, endDateTime);
    }

    public void exportOrderRevenueToExcel(LocalDate startDate, LocalDate endDate, HttpServletResponse response){
        log.info("Starting to export order revenue report from {} to {}", startDate, endDate);

        List<OrderRevenueDTO> data = getOrderRevenueByDate(startDate, endDate);
        log.info("Retrieved {} order revenue records", data.size());

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Order Revenue");

            // Tạo dòng header
            Row headerRow = sheet.createRow(0);
            String[] headers = {"ID", "Tên khách hàng", "Tổng tiền", "Phương thức thanh toán", "Ngày đặt", "Trạng thái đơn"};
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }

            for (int i = 0; i < data.size(); i++) {
                OrderRevenueDTO dto = data.get(i);
                Row row = sheet.createRow(i + 1);
                row.createCell(0).setCellValue(dto.getId());
                row.createCell(1).setCellValue(dto.getCustomerName());
                row.createCell(2).setCellValue(dto.getTotalPrice());
                row.createCell(3).setCellValue(dto.getPaymentMethod());
                row.createCell(4).setCellValue(dto.getOrderDate().toString());
                row.createCell(5).setCellValue(dto.getOrderStatus());
            }

            for (int i = 0; i < headers.length; i++) {
                sheet.autoSizeColumn(i);
            }

            String fileName = "Danh_Sach_Don_Hang_" + startDate + "_toi_" + endDate + ".xlsx";
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

            workbook.write(response.getOutputStream());
            response.flushBuffer();

        } catch (IOException e) {
            log.error("Failed to export Excel file", e);
            throw new RuntimeException("Lỗi khi xuất file Excel");
        }
    }

    private List<OrderRevenueDTO> getOrderRevenueByDate(LocalDate startDate, LocalDate endDate) {
        log.info("Fetching daily order revenue from {} to {}", startDate, endDate);

        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(LocalTime.MAX);

        List<Order> orderList = orderRepository.findAllByOrderDateBetweenAndOrderStatus(
                startDateTime, endDateTime, OrderStatus.DELIVERED);

        return orderMapper.tOrderRevenueDtoList(orderList, orderMappingHelper);
    }

}
