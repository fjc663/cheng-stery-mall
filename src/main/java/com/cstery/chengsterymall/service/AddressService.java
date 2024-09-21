package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.AddressDTO;
import com.cstery.chengsterymall.domain.po.Address;
import com.cstery.chengsterymall.domain.vo.AddressVO;

import java.util.List;

public interface AddressService extends IService<Address> {

    /**
     * 返回当前用户的地址
     * @return
     */
    List<AddressVO> getAddress();

    /**
     * setDefaultAddress
     * @param id
     */
    void setDefaultAddress(Long id);

    /**
     * 添加新地址
     * @param addressDTO
     */
    void addAddress(AddressDTO addressDTO);

    /**
     * 修改地址
     * @param addressDTO
     */
    void updateAddress(AddressDTO addressDTO);

    /**
     * 删除地址
     * @param id
     */
    void deleteAddress(Long id);
}
