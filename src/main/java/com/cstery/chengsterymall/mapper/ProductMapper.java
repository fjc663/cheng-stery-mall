package com.cstery.chengsterymall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper extends BaseMapper<Product> {

    IPage<ProductVO> selectProductPage(IPage<ProductVO> page,
                                       @Param("name") String name,
                                       @Param("categoryId") Long categoryId,
                                       @Param("status") Integer status,
                                       @Param("type") Integer type);
}
