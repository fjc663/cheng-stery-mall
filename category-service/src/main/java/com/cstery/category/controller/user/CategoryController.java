package com.cstery.category.controller.user;

import com.cstery.category.domain.vo.CategoryVO;
import com.cstery.category.service.CategoryService;
import com.cstery.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user/category")
@RequiredArgsConstructor
@Api(tags = "用户端分类相关接口")
public class CategoryController {

    private final CategoryService categoryService;

    /**
     * 获取一级分类
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("获得全部一级分类信息")
    @Cacheable(cacheNames = "categoryData")
    public Result<List<CategoryVO>> getCategoryList(){
        List<CategoryVO> categoryVOList = categoryService.getCategoryList();
        return Result.success(categoryVOList);
    }

    /**
     * 根据父级分类id获得子级分类
     * @param id
     * @return
     */
    @GetMapping("/list/{id}")
    @ApiOperation("根据父级分类id获得子级分类")
    @Cacheable(cacheNames = "subCategoryData", key = "#id")
    public Result<List<CategoryVO>> getSubCategoryList(@PathVariable @ApiParam("父级分类id") Long id){
        List<CategoryVO> categoryVOList = categoryService.getSubCategoryList(id);
        return Result.success(categoryVOList);
    }

}

