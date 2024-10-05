package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.constant.ProductConstant;
import com.cstery.chengsterymall.constant.StatusConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.ProductDTO;
import com.cstery.chengsterymall.domain.dto.ProductPageQueryDTO;
import com.cstery.chengsterymall.domain.po.*;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.domain.vo.SpecificationVO;
import com.cstery.chengsterymall.mapper.ProductMapper;
import com.cstery.chengsterymall.result.PageResult;
import com.cstery.chengsterymall.service.ProductService;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    /**
     * 根据分类id返回商品
     *
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
     *
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

        if (specificationIdList.isEmpty()) {
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
     *
     * @param productPageQueryDTO
     * @return
     */
    @Override
    public PageResult productPageQuery(ProductPageQueryDTO productPageQueryDTO) {
        IPage<Product> productIPage = new Page<>(productPageQueryDTO.getPage(), productPageQueryDTO.getPageSize());

        // 根据要求构建查询语句
        LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<>();

        // 非管理员只显示上架商品
        productLambdaQueryWrapper.eq(Product::getStatus, StatusConstant.ENABLE);

        if (!productPageQueryDTO.getIsALLData()) {
            productLambdaQueryWrapper.eq(Product::getCategoryId, productPageQueryDTO.getCategoryId());
        }

        if (productPageQueryDTO.getName() != null) {
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

    /**
     * 管理端分页查询商品数据
     *
     * @param productPageQueryDTO
     * @return
     */
    @Override
    public PageResult adminProductPageQuery(ProductPageQueryDTO productPageQueryDTO) {
        // 分页条件
        IPage<ProductVO> productIPage = new Page<>(productPageQueryDTO.getPage(), productPageQueryDTO.getPageSize());

        // 联表查询商品及其对应的特色属性
        IPage<ProductVO> page = baseMapper.selectProductPage(productIPage,
                productPageQueryDTO.getName(),
                productPageQueryDTO.getCategoryId(),
                productPageQueryDTO.getStatus(),
                productPageQueryDTO.getType());

        // 取出查询结果并返回
        PageResult pageResult = new PageResult();
        pageResult.setTotal(page.getTotal());

        List<ProductVO> productVOS = page.getRecords();
        for (ProductVO productVO : productVOS) {
            // 设置是否为特色商品的判断
            boolean isSlides = false;
            boolean isHot = false;
            boolean isNew = false;

            if (productVO.getFeaturedTypes() != null && !productVO.getFeaturedTypes().isEmpty()) {
                if (productVO.getFeaturedTypes().contains(ProductConstant.SLIDES)) {
                    isSlides = true;
                }

                if (productVO.getFeaturedTypes().contains(ProductConstant.HOT)) {
                    isHot = true;
                }

                if (productVO.getFeaturedTypes().contains(ProductConstant.NEW)) {
                    isNew = true;
                }
            }

            productVO.setIsSlides(isSlides);
            productVO.setIsHot(isHot);
            productVO.setIsNew(isNew);
        }

        pageResult.setRecords(productVOS);

        return pageResult;
    }

    /**
     * 添加商品
     *
     * @param productDTO
     */
    @Override
    @Transactional
    public void add(ProductDTO productDTO) {
        Product product = BeanUtil.copyProperties(productDTO, Product.class);

        // 设置其他信息
        product.setCreatedAt(LocalDateTime.now());
        product.setUpdatedAt(LocalDateTime.now());
        product.setCreatedBy(BaseContext.getCurrentId());
        product.setUpdatedBy(BaseContext.getCurrentId());

        save(product);

        Long productId = product.getId();

        // 关联规格对象
        List<ProductSpecifications> productSpecificationsList = new ArrayList<>();

        // 设置商品关联的规格
        for (Long specId : productDTO.getSpecIds()) {
            ProductSpecifications productSpecifications = ProductSpecifications
                    .builder()
                    .productId(productId)
                    .specificationId(specId)
                    .createdAt(LocalDateTime.now())
                    .updatedAt(LocalDateTime.now())
                    .createdBy(BaseContext.getCurrentId())
                    .updatedBy(BaseContext.getCurrentId())
                    .build();

            productSpecificationsList.add(productSpecifications);
        }

        // 批量插入关联对象
        Db.saveBatch(productSpecificationsList);
    }

    /**
     * 修改商品信息
     *
     * @param productDTO
     */
    @Override
    @Transactional
    public void edit(ProductDTO productDTO) {
        Product product = BeanUtil.copyProperties(productDTO, Product.class);

        if (productDTO.getSpecIds() != null) {
            // 删除原先规格数据
            LambdaQueryWrapper<ProductSpecifications> productSpecificationsLambdaQueryWrapper =
                    new LambdaQueryWrapper<>(ProductSpecifications.class)
                            .eq(ProductSpecifications::getProductId, productDTO.getId());
            Db.remove(productSpecificationsLambdaQueryWrapper);

            // 设置新的关联规格数据
            List<ProductSpecifications> productSpecificationsList = new ArrayList<>();

            // 设置商品关联的规格
            for (Long specId : productDTO.getSpecIds()) {
                ProductSpecifications productSpecifications = ProductSpecifications
                        .builder()
                        .productId(productDTO.getId())
                        .specificationId(specId)
                        .createdAt(LocalDateTime.now())
                        .updatedAt(LocalDateTime.now())
                        .createdBy(BaseContext.getCurrentId())
                        .updatedBy(BaseContext.getCurrentId())
                        .build();

                productSpecificationsList.add(productSpecifications);
            }

            // 批量插入关联对象
            Db.saveBatch(productSpecificationsList);
        }

        // 设置其他信息
        product.setUpdatedAt(LocalDateTime.now());
        product.setUpdatedBy(BaseContext.getCurrentId());

        updateById(product);

    }

    /**
     * 删除商品
     *
     * @param id
     */
    @Override
    @Transactional
    public void delete(Long id) {
        removeById(id);
    }
}
