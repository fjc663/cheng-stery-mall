package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.CategoryDTO;
import com.cstery.chengsterymall.domain.dto.CategoryPageQueryDTO;
import com.cstery.chengsterymall.domain.po.Category;
import com.cstery.chengsterymall.domain.vo.CategoryVO;
import com.cstery.chengsterymall.result.PageResult;

import java.util.List;

public interface CategoryService extends IService<Category> {

    /**
     * 获取一级分类
     * @return
     */
    List<CategoryVO> getCategoryList();

    /**
     * 根据父级分类id获得子级分类
     * @param parentId
     * @return
     */
    List<CategoryVO> getSubCategoryList(Long parentId);

    /**
     * 添加分类
     * @param categoryDTO
     */
    void add(CategoryDTO categoryDTO);

    /**
     * 分类数据分页查询
     * @param categoryPageQueryDTO
     * @return
     */
    PageResult pageQuery(CategoryPageQueryDTO categoryPageQueryDTO);

    /**
     * 修改分类
     * @param categoryDTO
     */
    void edit(CategoryDTO categoryDTO);

    /**
     * 根据分类id删除分类
     * @param id
     */
    void delete(Long id);
}
