package com.cstery.chengsterymall.domain.po;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("特色商品实体")
@TableName("featured_product")
public class FeaturedProduct implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long productId;

    // 显示位置类型：1-轮播图，2-热门商品，3-新品
    private Integer type;

    // 显示顺序
    private Integer displayOrder;

    // 创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    // 更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
