package com.cstery.chengsterymall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cstery.chengsterymall.domain.po.OrderItem;
import com.cstery.chengsterymall.domain.vo.Hot10VO;

import java.util.List;

public interface OrderItemsMapper extends BaseMapper<OrderItem> {

    /**
     * 获得前10热门商品
     *
     * @param orderIdList
     * @return
     */
    List<Hot10VO> getHotProduct(List<Long> orderIdList);


}
