package com.cstery.controller.admin;

import com.cstery.dto.ChartDTO;
import com.cstery.result.Result;
import com.cstery.service.ChartService;
import com.cstery.vo.ChartVO;
import com.cstery.vo.ReportVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/chart")
@RequiredArgsConstructor
@Api(tags = "管理端图表相关的接口")
public class AdminChartController {

    private final ChartService chartService;

    /**
     * 销售报告总览
     * @param chartDTO
     * @return
     */
    @GetMapping
    @ApiOperation("销售报告总览")
    public Result<ReportVO> getReport(ChartDTO chartDTO) {
        ReportVO reportVO = chartService.getReport(chartDTO);
        return Result.success(reportVO);
    }

    /**
     * 获得图表数据
     * @param chartDTO
     * @return
     */
    @GetMapping("/data")
    @ApiOperation("获得图表数据")
    public Result<ChartVO> getChart(ChartDTO chartDTO) {
        ChartVO chartVO = chartService.getChart(chartDTO);
        return Result.success(chartVO);
    }
}
