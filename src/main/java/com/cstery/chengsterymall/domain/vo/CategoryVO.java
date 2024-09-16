package com.cstery.chengsterymall.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CategoryVO {

    // 分类id
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
}
