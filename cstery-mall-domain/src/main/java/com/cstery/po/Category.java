package com.cstery.po;

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
@ApiModel("分类实体")
@TableName("category")
public class Category implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 分类主键，id
    @TableId(type = IdType.AUTO)
    private Long id;

    // 分类名称
    private String name;

    // 分类描述
    private String description;

    // 分类图片url
    private String imageUrl;

    // 分类状态
    private Integer status;

    // 排序字段
    private Integer sortOrder;

    // 父分类id
    private Long parentId;

    // 创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    // 更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;

    // 创建用户的ID
    private Long createdBy;

    // 更新用户的ID
    private Long updatedBy;
}
