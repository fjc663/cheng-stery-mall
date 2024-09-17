package com.cstery.chengsterymall.domain.po;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("商品实体")
@TableName("product")
public class Product {
    
    // 商品ID，自增主键
    @TableId(type = IdType.AUTO)
    private Long id;

    // 商品名称
    private String name;

    // 商品描述
    private String description;

    // 商品价格，使用BigDecimal来存储，保证精度
    private BigDecimal price;

    // 商品库存量
    private Integer stock;

    // 分类ID，指向分类表的外键
    private Long categoryId;

    // 商品状态，1表示上架，0表示下架
    private Integer status;

    // 商品销量
    private Integer sales;

    // 商品图片的URL地址
    private String imageUrl;

    // 创建时间，自动填充字段
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    // 最后更新时间，自动填充字段
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;

    // 创建该商品的用户ID
    private Long createdBy;

    // 最后更新该商品的用户ID
    private Long updatedBy;
}
