package Spring_AdamStore.dto.response;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderStatsDTO {

    private Long totalOrders;
    private Double totalRevenue;

}
