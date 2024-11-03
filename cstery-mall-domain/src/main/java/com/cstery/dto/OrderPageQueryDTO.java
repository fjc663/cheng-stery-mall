package com.cstery.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "分页查询订单数据传输对象")
public class OrderPageQueryDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "页码", required = true, example = "1")
    private Integer page;

    @ApiModelProperty(value = "每页订单数", required = true, example = "10")
    private Integer pageSize;

    @ApiModelProperty(value = "订单状态 1-待支付, 2-已支付, 3-已发货, 4-已完成, 5-已取消", example = "1")
    private Integer status;

}
