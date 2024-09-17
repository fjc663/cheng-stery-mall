package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.mapper.ProductMapper;
import com.cstery.chengsterymall.service.ProductService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    /**
     * 根据分类id返回商品
     * @param categoryId
     * @return
     */
    @Override
    public List<ProductVO> getByCategoryId(Long categoryId) {
        LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<Product>()
                .eq(Product::getCategoryId, categoryId);

        List<Product> productList = list(productLambdaQueryWrapper);

        return BeanUtil.copyToList(productList, ProductVO.class);
    }
}
