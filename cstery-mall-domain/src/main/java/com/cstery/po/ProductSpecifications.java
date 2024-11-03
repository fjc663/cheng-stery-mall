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
@ApiModel("规格商品关联实体")
@TableName("product_specifications")
public class ProductSpecifications implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 主键，使用自增策略，数据库字段名为 "id"
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    // 商品id
    private Long productId;

    // 规格id
    private Long specificationId;

    // 创建时间
    private LocalDateTime createdAt;

    // 最后更新时间
    private LocalDateTime updatedAt;

    // 创建该规格的用户ID
    private Long createdBy;

    // 最后更新该规格的用户ID
    private Long updatedBy;
}
