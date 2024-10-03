package com.cstery.chengsterymall.service.impl;

import com.cstery.chengsterymall.domain.dto.ChartDTO;
import com.cstery.chengsterymall.domain.vo.ChartVO;
import com.cstery.chengsterymall.domain.vo.Hot10VO;
import com.cstery.chengsterymall.domain.vo.ReportVO;
import com.cstery.chengsterymall.service.ChartService;
import com.cstery.chengsterymall.service.OrderService;
import com.cstery.chengsterymall.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Service
@RequiredArgsConstructor
public class ChartServiceImpl implements ChartService {

    private final OrderService orderService;
    private final UserService userService;

    /**
     * 销售报告总览
     * @param chartDTO
     * @return
     */
    @Override
    public ReportVO getReport(ChartDTO chartDTO) {
        ReportVO reportVO = new ReportVO();

        reportVO.setTotalSale(orderService.getTotalSales(chartDTO, false));
        reportVO.setTotalOrder(orderService.getTotalOrders(chartDTO));
        reportVO.setTotalUser(userService.getTotalUsers(chartDTO, false));
        reportVO.setHotProduct(orderService.getHotProduct(chartDTO));

        return reportVO;
    }

    @Override
    public ChartVO getChart(ChartDTO chartDTO) {

        // 查询时间区间前10热门商品
        List<Hot10VO> hot10Product = orderService.getHot10Product(chartDTO);
        List<String> productNameList = new ArrayList<>();
        List<Integer> productList = new ArrayList<>();
        if (hot10Product != null) {
            productNameList = hot10Product.stream().map(Hot10VO::getProductName).toList();
            productList = hot10Product.stream().map(Hot10VO::getProductSales).toList();
        }


        // 查询时间区间商品状态数
        List<Integer> statusList = orderService.getStatusList(chartDTO);

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

            // 一天的时间区间
            ChartDTO timeSection = ChartDTO
                    .builder()
                    .startData(startTime)
                    .endData(startTime)
                    .build();

            // 计算某天销售额
            BigDecimal totalSales = orderService.getTotalSales(timeSection, false);
            saleList.add(totalSales);

            // 计算到某天的累计销售额
            BigDecimal cumulativeSales = orderService.getTotalSales(timeSection, true);
            cumulativeSaleList.add(cumulativeSales);

            // 计算某天用户数
            Integer totalUsers = userService.getTotalUsers(timeSection, false);
            userList.add(totalUsers);

            // 计算到某天的累计用户数
            Integer cumulativeUsers = userService.getTotalUsers(timeSection, true);
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
