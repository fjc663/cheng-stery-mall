package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.po.Address;
import com.cstery.chengsterymall.domain.vo.AddressVO;
import com.cstery.chengsterymall.mapper.AddressMapper;
import com.cstery.chengsterymall.service.AddressService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements AddressService {

    /**
     * 返回当前用户的地址
     * @return
     */
    @Override
    public List<AddressVO> getAddress() {
        LambdaQueryWrapper<Address> addressLambdaQueryWrapper = new LambdaQueryWrapper<Address>()
                .eq(Address::getUserId, BaseContext.getCurrentId());
        List<Address> addressList = list(addressLambdaQueryWrapper);

        return BeanUtil.copyToList(addressList, AddressVO.class);
    }
}
