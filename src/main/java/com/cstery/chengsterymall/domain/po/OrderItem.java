package com.cstery.chengsterymall.domain.po;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("订单商品实体")
@TableName("order_items")
public class OrderItem implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 订单商品记录ID，主键，自增
    @TableId(type = IdType.AUTO)
    private Long id;

    // 订单ID，关联订单表
    private Long orderId;

    // 商品ID，关联商品表
    private Long productId;

    // 商品名称，冗余字段
    private String productName;

    // 商品数量
    private Integer quantity;

    // 商品单价
    private BigDecimal productPrice;

    // 商品图片URL
    private String productImageUrl;

    // 商品规格，JSON格式
    private String specifications;

    // 记录创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}