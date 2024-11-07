package com.cstery.chart.service;


import com.cstery.api.dto.ChartDTO;
import com.cstery.chart.domain.vo.ChartVO;
import com.cstery.chart.domain.vo.ReportVO;

public interface ChartService {

    /**
     * 销售报告总览
     * @param chartDTO
     * @return
     */
    ReportVO getReport(ChartDTO chartDTO);

    /**
     * 获得图表数据
     * @param chartDTO
     * @return
     */
    ChartVO getChart(ChartDTO chartDTO);
}
