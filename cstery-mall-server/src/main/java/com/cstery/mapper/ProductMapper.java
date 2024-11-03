package com.cstery.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.cstery.po.Product;
import com.cstery.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper extends BaseMapper<Product> {

    IPage<ProductVO> selectProductPage(IPage<ProductVO> page,
                                       @Param("name") String name,
                                       @Param("categoryId") Long categoryId,
                                       @Param("status") Integer status,
                                       @Param("type") Integer type);
}
