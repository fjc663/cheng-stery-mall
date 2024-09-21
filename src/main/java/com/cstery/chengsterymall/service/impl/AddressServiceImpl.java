package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.chengsterymall.constant.DefaultConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.AddressDTO;
import com.cstery.chengsterymall.domain.po.Address;
import com.cstery.chengsterymall.domain.vo.AddressVO;
import com.cstery.chengsterymall.mapper.AddressMapper;
import com.cstery.chengsterymall.service.AddressService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
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

    /**
     * 设置默认地址
     * @param id
     */
    @Override
    @Transactional
    public void setDefaultAddress(Long id) {
        // 将该用户所有地址都设为不是默认
        LambdaUpdateWrapper<Address> addressLambdaUpdateWrapper = new LambdaUpdateWrapper<Address>()
                .set(Address::getIsDefault, DefaultConstant.NONDEFAULT)
                .eq(Address::getUserId, BaseContext.getCurrentId());
        update(addressLambdaUpdateWrapper);

        // 设置对应地址为默认
        addressLambdaUpdateWrapper = new LambdaUpdateWrapper<Address>()
                .set(Address::getIsDefault, DefaultConstant.DEFAULT)
                .set(Address::getUpdatedAt, LocalDateTime.now())
                .eq(Address::getId, id);
        update(addressLambdaUpdateWrapper);
    }

    /**
     * 添加新地址
     * @param addressDTO
     */
    @Override
    @Transactional
    public void addAddress(AddressDTO addressDTO) {
        if (addressDTO.getIsDefault()) {
            // 将该用户所有地址都设为不是默认
            LambdaUpdateWrapper<Address> addressLambdaUpdateWrapper = new LambdaUpdateWrapper<Address>()
                    .set(Address::getIsDefault, DefaultConstant.NONDEFAULT)
                    .eq(Address::getUserId, BaseContext.getCurrentId());
            update(addressLambdaUpdateWrapper);
        }

        Address address = BeanUtil.copyProperties(addressDTO, Address.class);

        address.setUserId(BaseContext.getCurrentId());
        address.setCreatedAt(LocalDateTime.now());
        address.setUpdatedAt(LocalDateTime.now());

        save(address);
    }

    /**
     * 修改地址
     * @param addressDTO
     */
    @Override
    @Transactional
    public void updateAddress(AddressDTO addressDTO) {
        Address address = BeanUtil.copyProperties(addressDTO, Address.class);

        address.setUpdatedAt(LocalDateTime.now());

        updateById(address);
    }

    /**
     * 删除地址
     * @param id
     */
    @Override
    @Transactional
    public void deleteAddress(Long id) {
        removeById(id);
    }
}
