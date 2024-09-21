package com.cstery.chengsterymall.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "地址对象")
public class AddressVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 地址ID
    @ApiModelProperty(value = "地址ID", example = "1")
    private Long id;

    // 收货人姓名
    @ApiModelProperty(value = "收货人姓名", example = "张三")
    private String receiverName;

    // 收货人联系电话
    @ApiModelProperty(value = "收货人联系电话", example = "13800000000")
    private String receiverPhone;

    // 省份
    @ApiModelProperty(value = "省份", example = "广东省")
    private String province;

    // 城市
    @ApiModelProperty(value = "城市", example = "广州市")
    private String city;

    // 区/县
    @ApiModelProperty(value = "区/县", example = "天河区")
    private String district;

    // 详细地址
    @ApiModelProperty(value = "详细地址", example = "天河路1号")
    private String detailedAddress;

    // 是否为默认地址
    @ApiModelProperty(value = "是否为默认地址", example = "true")
    private Boolean isDefault;
}
