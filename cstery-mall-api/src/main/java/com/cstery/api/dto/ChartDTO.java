package com.cstery.api.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "图标数据日期选择对象")
public class ChartDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "开始日期", example = "2024-10-3")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startData;

    @ApiModelProperty(value = "结束日期", example = "2024-10-7")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endData;
}
