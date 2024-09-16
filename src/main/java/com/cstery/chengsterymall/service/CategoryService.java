package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.po.Category;
import com.cstery.chengsterymall.domain.vo.CategoryVO;

import java.util.List;

public interface CategoryService extends IService<Category> {

    /**
     * 获取无父级分类
     * @return
     */
    List<CategoryVO> getCategoryList();
}
