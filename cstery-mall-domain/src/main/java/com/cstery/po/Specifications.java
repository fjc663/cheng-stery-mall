package com.cstery.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
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
@ApiModel("商品规格实体")
@TableName("specifications")
public class Specifications implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 主键，使用自增策略，数据库字段名为 "id"
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    // 规格名称
    private String name;

    // 规格描述
    private String description;

    // 规格状态
    private Integer status;

    // 规格选项
    private String specificationOptions;

    // 创建时间
    private LocalDateTime createdAt;

    // 最后更新时间
    private LocalDateTime updatedAt;

    // 创建该规格的用户ID
    private Long createdBy;

    // 最后更新该规格的用户ID
    private Long updatedBy;
}
