package com.cstery.chengsterymall.domain.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SpecificationVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "规格ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "规格名称", example = "颜色")
    private String name;

    @ApiModelProperty(value = "规格描述", example = "可选颜色")
    private String description;

    @ApiModelProperty(value = "规格状态", allowableValues = "0, 1", example = "1")
    private Integer status;

    @ApiModelProperty(value = "规格选项", example = "黑色,白色,灰色,棕色,蓝色")
    private String specificationOptions;

}
