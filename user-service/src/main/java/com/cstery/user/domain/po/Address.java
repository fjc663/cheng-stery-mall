package com.cstery.user.domain.po;

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
@ApiModel("地址实体")
@TableName("address")
public class Address implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 地址ID，主键，自增
    @TableId(type = IdType.AUTO)
    private Long id;

    // 用户ID
    private Long userId;

    // 收货人姓名
    private String receiverName;

    // 收货人联系电话
    private String receiverPhone;

    // 省份
    private String province;

    // 城市
    private String city;

    // 区/县
    private String district;

    // 详细地址
    private String detailedAddress;

    // 是否为默认地址
    private Boolean isDefault;

    // 记录创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    // 记录更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
