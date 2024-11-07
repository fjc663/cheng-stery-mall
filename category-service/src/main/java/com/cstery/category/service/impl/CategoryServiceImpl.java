package com.cstery.category.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.api.client.ProductClient;
import com.cstery.api.vo.ProductVO;
import com.cstery.category.domain.dto.CategoryDTO;
import com.cstery.category.domain.dto.CategoryPageQueryDTO;
import com.cstery.category.domain.po.Category;
import com.cstery.category.domain.vo.CategoryVO;
import com.cstery.category.mapper.CategoryMapper;
import com.cstery.category.service.CategoryService;
import com.cstery.constant.MessageConstant;
import com.cstery.constant.StatusConstant;
import com.cstery.context.BaseContext;
import com.cstery.exceptions.CategoryException;
import com.cstery.result.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    private final RedisTemplate redisTemplate;
    private final ProductClient productClient;

    /**
     * 获取一级分类
     * @return
     */
    @Override
    public List<CategoryVO> getCategoryList() {
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                .eq(Category::getStatus, StatusConstant.ENABLE)
                .isNull(Category::getParentId)
                .orderByAsc(Category::getSortOrder);
        List<Category> categoryList = list(categoryLambdaQueryWrapper);

        return BeanUtil.copyToList(categoryList, CategoryVO.class);
    }

    /**
     * 根据父级分类id获得子级分类
     * @param parentId
     * @return
     */
    @Override
    public List<CategoryVO> getSubCategoryList(Long parentId) {
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                .eq(Category::getStatus, StatusConstant.ENABLE)
                .eq(Category::getParentId, parentId)
                .orderByAsc(Category::getSortOrder);
        List<Category> categoryList = list(categoryLambdaQueryWrapper);

        return BeanUtil.copyToList(categoryList, CategoryVO.class);

    }

    /**
     * 添加分类
     * @param categoryDTO
     */
    @Override
    @Transactional
    public void add(CategoryDTO categoryDTO) {
        // 判断分类名称是否重复
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper =
                new LambdaQueryWrapper<Category>().eq(Category::getName, categoryDTO.getName());
        Category category = getOne(categoryLambdaQueryWrapper);
        if (category != null) {
            throw new CategoryException(MessageConstant.CATEGORYNAMEEXISTS);
        }

        category = BeanUtil.copyProperties(categoryDTO, Category.class);

        // 设置分类对象其他数据
        category.setCreatedAt(LocalDateTime.now());
        category.setUpdatedAt(LocalDateTime.now());
        category.setCreatedBy(BaseContext.getCurrentId());
        category.setUpdatedBy(BaseContext.getCurrentId());

        save(category);
    }

    /**
     * 分类数据分页查询
     * @param categoryPageQueryDTO
     * @return
     */
    @Override
    public PageResult pageQuery(CategoryPageQueryDTO categoryPageQueryDTO) {
        // 添加分页条件
        IPage<Category> categoryIPage = new Page<>(categoryPageQueryDTO.getPage(), categoryPageQueryDTO.getPageSize());

        // 设置查询条件
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<>();
        categoryLambdaQueryWrapper.isNull(Category::getParentId).orderByAsc(Category::getSortOrder);
        if (categoryPageQueryDTO.getName() != null) {
            categoryLambdaQueryWrapper.like(Category::getName, categoryPageQueryDTO.getName());
        }

        if (categoryPageQueryDTO.getStatus() != null) {
            categoryLambdaQueryWrapper.eq(Category::getStatus, categoryPageQueryDTO.getStatus());
        }

        IPage<Category> page = page(categoryIPage, categoryLambdaQueryWrapper);

        // 设置返回结果
        PageResult pageResult = new PageResult();
        pageResult.setTotal(page.getTotal());

        // 为一级分类设置二级分类
        List<CategoryVO> categoryVOList = BeanUtil.copyToList(page.getRecords(), CategoryVO.class);
        for (CategoryVO categoryVO : categoryVOList) {
            LambdaQueryWrapper<Category> subCategoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                    .eq(Category::getParentId, categoryVO.getId())
                    .orderByAsc(Category::getSortOrder);

            List<CategoryVO> subCategoryList = BeanUtil.copyToList(list(subCategoryLambdaQueryWrapper), CategoryVO.class);

            categoryVO.setSubCategories(subCategoryList);
        }
        pageResult.setRecords(categoryVOList);

        return pageResult;
    }

    /**
     * 修改分类
     * @param categoryDTO
     */
    @Override
    @Transactional
    public void edit(CategoryDTO categoryDTO) {
        Category category = BeanUtil.copyProperties(categoryDTO, Category.class);

        category.setCreatedAt(LocalDateTime.now());
        category.setCreatedBy(BaseContext.getCurrentId());

        updateById(category);
    }

    /**
     * 根据分类id删除分类
     * @param id
     */
    @Override
    public void delete(Long id) {
        //  判断分类存不存在
        Category category = getById(id);
        if (category == null) {
            throw new CategoryException(MessageConstant.CATEGORYNOTEXISTS);
        }

        // 查询商品表，如果该分类下有商品则无法删除
        List<ProductVO> productList = productClient.queryProductByCategoryId(id).getData();

        if (productList != null && !productList.isEmpty()) {
            throw new CategoryException(MessageConstant.CATEGORYRELATEDPRODUCT);
        }

        // 如果该分类下有子分类无法删除
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                .eq(Category::getParentId, id);
        List<Category> categoryList = list(categoryLambdaQueryWrapper);

        if (categoryList != null && !categoryList.isEmpty()) {
            throw new CategoryException(MessageConstant.CATEGORYRELATEDSUB);
        }

        // 判断是否为一级分类
        if (category.getParentId() == null) {
            // 如果是一级分类，清除 categoryData
            redisTemplate.delete(redisTemplate.keys("categoryData*"));
        } else {
            // 如果是二级分类，仅清除该 id 的 subCategoryData 缓存
            redisTemplate.delete("subCategoryData::" + category.getParentId());
        }

        // 删除分类
        removeById(id);

    }

    /**
     * 查询所有可用的二级分类
     * @return
     */
    @Override
    public List<CategoryVO> getAllSubCategory() {
        // 构造查询条件
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                .isNotNull(Category::getParentId)
                .orderByAsc(Category::getSortOrder)
                .eq(Category::getStatus, StatusConstant.ENABLE);

        // 查询
        List<Category> categoryList = list(categoryLambdaQueryWrapper);

        return BeanUtil.copyToList(categoryList, CategoryVO.class);
    }
}
