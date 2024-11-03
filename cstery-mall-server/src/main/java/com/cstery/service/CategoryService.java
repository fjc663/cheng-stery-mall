package com.cstery.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.dto.CategoryDTO;
import com.cstery.dto.CategoryPageQueryDTO;
import com.cstery.po.Category;
import com.cstery.result.PageResult;
import com.cstery.vo.CategoryVO;


import java.util.List;

public interface CategoryService extends IService<Category> {

    /**
     * 获取一级分类
     *
     * @return
     */
    List<CategoryVO> getCategoryList();

    /**
     * 根据父级分类id获得子级分类
     *
     * @param parentId
     * @return
     */
    List<CategoryVO> getSubCategoryList(Long parentId);

    /**
     * 添加分类
     *
     * @param categoryDTO
     */
    void add(CategoryDTO categoryDTO);

    /**
     * 分类数据分页查询
     *
     * @param categoryPageQueryDTO
     * @return
     */
    PageResult pageQuery(CategoryPageQueryDTO categoryPageQueryDTO);

    /**
     * 修改分类
     *
     * @param categoryDTO
     */
    void edit(CategoryDTO categoryDTO);

    /**
     * 根据分类id删除分类
     *
     * @param id
     */
    void delete(Long id);

    /**
     * 查询所有可用的二级分类
     *
     * @return
     */
    List<CategoryVO> getAllSubCategory();
}
