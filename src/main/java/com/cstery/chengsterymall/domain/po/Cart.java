package com.cstery.chengsterymall.domain.po;

import com.baomidou.mybatisplus.annotation.*;
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
@ApiModel("购物车实体")
@TableName("cart")
public class Cart implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 购物车记录ID，主键，自增
    @TableId(type = IdType.AUTO)
    private Long id;

    // 用户ID，关联用户表
    private Long userId;
    
    // 商品ID，关联商品表
    private Long productId;
    
    // 商品数量
    private Integer quantity;

    // 商品规格
    private String specifications;

    // 添加到购物车的时间，默认当前时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    // 购物车最后一次修改时间，自动更新
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;

}
