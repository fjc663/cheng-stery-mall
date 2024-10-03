package com.cstery.chengsterymall.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "图表销售数据")
public class ChartVO implements Serializable {

    @ApiModelProperty(value = "销售列表", example = "[100, 200, 230, 400, 500, ...]")
    private List<BigDecimal> saleList;

    @ApiModelProperty(value = "订单状态列表(对应[待付款, 已支付, 已发货, 已完成, 已取消])", example = "[170, 270, 290, 300, 200]")
    private List<Integer> statusList;

    @ApiModelProperty(value = "用户列表", example = "[100, 200, 230, 400, 500, ...]")
    private List<Integer> userList;

    @ApiModelProperty(value = "前10热门商品名称列表", example = "[手机, 啤酒, 饮料, 耳机, 电脑, ...]")
    private List<String> productNameList;

    @ApiModelProperty(value = "前10热门商品列表", example = "[100, 200, 230, 400, 500, ...]")
    private List<Integer> productList;

    @ApiModelProperty(value = "日期列表", example = "[2024-9-1, 2024-9-2, 2024-9-3, 2024-9-4, 2024-9-5, ...]")
    private List<String> dataList;

    @ApiModelProperty(value = "累计销售列表", example = "[100, 200, 230, 400, 500, ...]")
    private List<BigDecimal> cumulativeSaleList;

    @ApiModelProperty(value = "累计用户列表", example = "[100, 200, 230, 400, 500, ...]")
    private List<Integer> cumulativeUserList;

}
