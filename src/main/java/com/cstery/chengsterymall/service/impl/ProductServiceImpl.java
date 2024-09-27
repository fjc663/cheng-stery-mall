package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.constant.StatusConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.ProductPageQueryDTO;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.po.ProductFavorite;
import com.cstery.chengsterymall.domain.po.ProductSpecifications;
import com.cstery.chengsterymall.domain.po.Specifications;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.domain.vo.SpecificationVO;
import com.cstery.chengsterymall.mapper.ProductMapper;
import com.cstery.chengsterymall.result.PageResult;
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
                .eq(Product::getStatus, StatusConstant.ENABLE)
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

        // 转化为VO对象
        ProductVO productVO = BeanUtil.copyProperties(product, ProductVO.class);

        // 查询收藏表
        List<ProductFavorite> productFavoriteList = Db.lambdaQuery(ProductFavorite.class)
                .eq(ProductFavorite::getUserId, BaseContext.getCurrentId())
                .eq(ProductFavorite::getProductId, id)
                .list();

        // 设置是否被收藏字段
        productVO.setIsFavorites(productFavoriteList != null && !productFavoriteList.isEmpty());

        // 查询商品规格关联表
        List<Long> specificationIdList = Db.lambdaQuery(ProductSpecifications.class)
                .select(ProductSpecifications::getSpecificationId)
                .eq(ProductSpecifications::getProductId, id)
                .list()
                .stream().map(ProductSpecifications::getSpecificationId).toList();

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

    /**
     * 分页查询商品数据
     * @param productPageQueryDTO
     * @return
     */
    @Override
    public PageResult productPageQuery(ProductPageQueryDTO productPageQueryDTO) {
        IPage<Product> productIPage = new Page<>(productPageQueryDTO.getPage(), productPageQueryDTO.getPageSize());

        // 根据要求构建查询语句
        LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (!productPageQueryDTO.getIsALLData()) {
            productLambdaQueryWrapper.eq(Product::getCategoryId, productPageQueryDTO.getCategoryId());
        }

        if (productPageQueryDTO.getName() != null){
            productLambdaQueryWrapper.like(Product::getName, productPageQueryDTO.getName());
        }

        if (productPageQueryDTO.getIsOrderBypriceASC() != null && productPageQueryDTO.getIsOrderBypriceASC()) {
            productLambdaQueryWrapper.orderByAsc(Product::getPrice);
        }

        if (productPageQueryDTO.getIsOrderBypriceDESC() != null && productPageQueryDTO.getIsOrderBypriceDESC()) {
            productLambdaQueryWrapper.orderByDesc(Product::getPrice);
        }

        IPage<Product> page = page(productIPage, productLambdaQueryWrapper);

        // 取出查询结果并返回
        PageResult pageResult = new PageResult();
        pageResult.setTotal(page.getTotal());
        pageResult.setRecords(BeanUtil.copyToList(page.getRecords(), ProductVO.class));

        return pageResult;
    }
}
