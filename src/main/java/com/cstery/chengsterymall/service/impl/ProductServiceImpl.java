package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.po.ProductSpecifications;
import com.cstery.chengsterymall.domain.po.Specifications;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.domain.vo.SpecificationVO;
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

    /**
     * 根据商品id返回商品
     * @param id
     * @return
     */
    @Override
    public ProductVO getProductDetailInfo(Long id) {
        Product product = getById(id);

        // 查询商品规格关联表
        List<Long> specificationIdList = Db.lambdaQuery(ProductSpecifications.class)
                .select(ProductSpecifications::getSpecificationId)
                .eq(ProductSpecifications::getProductId, id)
                .list()
                .stream().map(ProductSpecifications::getSpecificationId).toList();

        // 转化为VO对象
        ProductVO productVO = BeanUtil.copyProperties(product, ProductVO.class);

        if (specificationIdList.isEmpty()){
            return productVO;
        }

        // 查询关联的规格
        List<Specifications> specificationList = Db.lambdaQuery(Specifications.class)
                .in(Specifications::getId, specificationIdList).list();

        List<SpecificationVO> specificationVOList = BeanUtil.copyToList(specificationList, SpecificationVO.class);
        productVO.setSpecifications(specificationVOList);

        return productVO;
    }
}
