package com.cstery.user.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "地址数据传输对象")
public class AddressDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 地址ID
    @ApiModelProperty(value = "地址ID", example = "1")
    private Long id;

    // 收货人姓名
    @ApiModelProperty(value = "收货人姓名", required = true, example = "张三")
    @NotBlank(message = "收货人姓名不能为空")
    @Size(max = 50, message = "收货人姓名长度不能超过50字符")
    private String receiverName;

    // 收货人联系电话
    @ApiModelProperty(value = "收货人联系电话", required = true, example = "13800000000")
    @NotBlank(message = "收货人联系电话不能为空")
    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "联系电话格式不正确")
    private String receiverPhone;

    // 省份
    @ApiModelProperty(value = "省份", required = true, example = "广东省")
    @NotBlank(message = "省份不能为空")
    private String province;

    // 城市
    @ApiModelProperty(value = "城市", required = true, example = "广州市")
    @NotBlank(message = "城市不能为空")
    private String city;

    // 区/县
    @ApiModelProperty(value = "区/县", required = true, example = "天河区")
    @NotBlank(message = "区/县不能为空")
    private String district;

    // 详细地址
    @ApiModelProperty(value = "详细地址", required = true, example = "天河路1号")
    @NotBlank(message = "详细地址不能为空")
    private String detailedAddress;

    // 是否为默认地址
    @ApiModelProperty(value = "是否为默认地址", example = "true")
    private Boolean isDefault;

}
