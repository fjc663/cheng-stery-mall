package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.chengsterymall.domain.po.Category;
import com.cstery.chengsterymall.domain.vo.CategoryVO;
import com.cstery.chengsterymall.mapper.CategoryMapper;
import com.cstery.chengsterymall.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    /**
     * 获取无父级分类
     * @return
     */
    @Override
    public List<CategoryVO> getCategoryList() {
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                .isNull(Category::getParentId);
        List<Category> categoryList = list(categoryLambdaQueryWrapper);

        return BeanUtil.copyToList(categoryList, CategoryVO.class);
    }
}
