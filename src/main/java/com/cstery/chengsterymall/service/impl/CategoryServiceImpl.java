package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.chengsterymall.constant.StatusConstant;
import com.cstery.chengsterymall.domain.po.Category;
import com.cstery.chengsterymall.domain.vo.CategoryVO;
import com.cstery.chengsterymall.mapper.CategoryMapper;
import com.cstery.chengsterymall.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

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
}
