package com.cstery.chart.service.impl;


import com.cstery.api.client.OrderClient;
import com.cstery.api.client.UserClient;
import com.cstery.api.dto.ChartDTO;
import com.cstery.api.vo.Hot10VO;
import com.cstery.chart.domain.vo.ChartVO;
import com.cstery.chart.domain.vo.ReportVO;
import com.cstery.chart.service.ChartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Service
@RequiredArgsConstructor
public class ChartServiceImpl implements ChartService {

    private final OrderClient orderClient;
    private final UserClient userClient;

    /**
     * 销售报告总览
     * @param chartDTO
     * @return
     */
    @Override
    public ReportVO getReport(ChartDTO chartDTO) {
        ReportVO reportVO = new ReportVO();

        reportVO.setTotalSale(orderClient.getTotalSales(chartDTO.getStartData(), chartDTO.getEndData(), false).getData());
        reportVO.setTotalOrder(orderClient.getTotalOrders(chartDTO.getStartData(), chartDTO.getEndData()).getData());
        reportVO.setTotalUser(userClient.getTotalUsers(chartDTO.getStartData(), chartDTO.getEndData(), false).getData());
        reportVO.setHotProduct(orderClient.getHotProduct(chartDTO.getStartData(), chartDTO.getEndData()).getData());

        return reportVO;
    }

    @Override
    public ChartVO getChart(ChartDTO chartDTO) {

        // 查询时间区间前10热门商品
        List<Hot10VO> hot10Product = orderClient.getHot10Product(chartDTO.getStartData(), chartDTO.getEndData()).getData();
        List<String> productNameList = new ArrayList<>();
        List<Integer> productList = new ArrayList<>();
        if (hot10Product != null) {
            productNameList = hot10Product.stream().map(Hot10VO::getProductName).toList();
            productList = hot10Product.stream().map(Hot10VO::getProductSales).toList();
        }


        // 查询时间区间商品状态数
        List<Integer> statusList = orderClient.getStatusList(chartDTO.getStartData(), chartDTO.getEndData()).getData();

        // 查询时间区间内的销售额、用户
        List<String> dataList = new ArrayList<>();
        List<BigDecimal> saleList = new ArrayList<>();
        List<Integer> userList = new ArrayList<>();
        List<BigDecimal> cumulativeSaleList = new ArrayList<>();
        List<Integer> cumulativeUserList = new ArrayList<>();

        LocalDate startTime = chartDTO.getStartData();
        while (!startTime.isAfter(chartDTO.getEndData())) {
            // 日期字符串列表
            dataList.add(startTime.toString());

            // 计算某天销售额
            BigDecimal totalSales = orderClient.getTotalSales(startTime, startTime, false).getData();
            saleList.add(totalSales);

            // 计算到某天的累计销售额
            BigDecimal cumulativeSales = orderClient.getTotalSales(startTime, startTime, true).getData();
            cumulativeSaleList.add(cumulativeSales);

            // 计算某天用户数
            Integer totalUsers = userClient.getTotalUsers(startTime, startTime, false).getData();
            userList.add(totalUsers);

            // 计算到某天的累计用户数
            Integer cumulativeUsers = userClient.getTotalUsers(startTime, startTime, true).getData();
            cumulativeUserList.add(cumulativeUsers);

            startTime = startTime.plusDays(1);

        }

        return ChartVO.builder()
                .saleList(saleList)
                .statusList(statusList)
                .userList(userList)
                .productNameList(productNameList)
                .productList(productList)
                .dataList(dataList)
                .cumulativeSaleList(cumulativeSaleList)
                .cumulativeUserList(cumulativeUserList)
                .build();
    }
}
