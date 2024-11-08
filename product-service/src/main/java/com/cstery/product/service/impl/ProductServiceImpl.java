package com.cstery.product.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.common.constant.ProductConstant;
import com.cstery.common.constant.StatusConstant;
import com.cstery.common.context.BaseContext;
import com.cstery.product.domain.dto.ProductDTO;
import com.cstery.product.domain.dto.ProductPageQueryDTO;
import com.cstery.product.domain.po.Product;
import com.cstery.product.domain.po.ProductFavorite;
import com.cstery.product.domain.po.ProductSpecifications;
import com.cstery.product.domain.po.Specifications;
import com.cstery.product.domain.vo.ProductVO;
import com.cstery.product.domain.vo.SpecificationVO;
import com.cstery.product.mapper.ProductMapper;
import com.cstery.product.service.ProductService;
import com.cstery.common.result.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    private final RedisTemplate redisTemplate;

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

    private String buildPaginationCacheKey(int page, int pageSize, Long categoryId) {
        return "product_page:" + categoryId + ":" + page + ":" + pageSize;
    }

    /**
     * 分页查询商品数据
     *
     * @param productPageQueryDTO
     * @return
     */
    @Override
    public PageResult productPageQuery(ProductPageQueryDTO productPageQueryDTO) {
        // 判断是否有附加查询条件
        boolean hasAdditionalConditions = !productPageQueryDTO.getName().isEmpty()
                || productPageQueryDTO.getIsALLData()
                || Boolean.TRUE.equals(productPageQueryDTO.getIsOrderBypriceASC())
                || Boolean.TRUE.equals(productPageQueryDTO.getIsOrderBypriceDESC());

        // 如果没有附加查询条件，使用缓存
        ValueOperations ops = redisTemplate.opsForValue();
        String cacheKey = buildPaginationCacheKey(productPageQueryDTO.getPage(), productPageQueryDTO.getPageSize(), productPageQueryDTO.getCategoryId());
        if (!hasAdditionalConditions) {
            // 尝试从 Redis 获取缓存数据
            PageResult pageResult = (PageResult) ops.get(cacheKey);
            if (pageResult != null) {
                return pageResult;
            }
        }

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

        // 如果没有附加查询条件，使用缓存
        if (!hasAdditionalConditions) {
            // 将结果存入 Redis
            ops.set(cacheKey, pageResult);
        }

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

        // 删除缓存
        redisTemplate.delete("product_detail::" + productDTO.getId());

        // 更新
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

    /**
     * 增加被取消商品的库存
     * @param ids
     * @param quantities
     */
    @Override
    @Transactional
    public void increaseStock(Map<String, Integer> quantities) {
        baseMapper.batchIncreaseStock(quantities);
    }

    /**
     * 增加商品销量
     * @param sales
     */
    @Override
    @Transactional
    public void increaseSales(Map<String, Integer> sales) {
        baseMapper.batchIncreaseSale(sales);
    }

    /**
     * 减少商品的库存
     * @param quantities
     */
    @Override
    @Transactional
    public void decreaseStock(Map<String, Integer> quantities) {
        baseMapper.batchDecreaseStock(quantities);
    }
}

