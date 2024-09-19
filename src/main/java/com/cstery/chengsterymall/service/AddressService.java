package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.po.Address;
import com.cstery.chengsterymall.domain.vo.AddressVO;

import java.util.List;

public interface AddressService extends IService<Address> {

    /**
     * 返回当前用户的地址
     * @return
     */
    List<AddressVO> getAddress();
}
