package com.cstery.service;


import com.cstery.dto.ChartDTO;
import com.cstery.vo.ChartVO;
import com.cstery.vo.ReportVO;

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
