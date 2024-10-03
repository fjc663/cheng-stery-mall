package com.cstery.chengsterymall.service;

import com.cstery.chengsterymall.domain.dto.ChartDTO;
import com.cstery.chengsterymall.domain.vo.ChartVO;
import com.cstery.chengsterymall.domain.vo.ReportVO;

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
