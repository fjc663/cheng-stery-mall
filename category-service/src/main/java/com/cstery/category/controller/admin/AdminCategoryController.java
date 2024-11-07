package com.cstery.category.controller.admin;

import com.cstery.category.domain.dto.CategoryDTO;
import com.cstery.category.domain.dto.CategoryPageQueryDTO;
import com.cstery.category.domain.vo.CategoryVO;
import com.cstery.category.service.CategoryService;
import com.cstery.result.PageResult;
import com.cstery.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/category")
@RequiredArgsConstructor
@Api(tags = "管理端分类相关接口")
public class AdminCategoryController {

    private final CategoryService categoryService;


    /**
     * 添加分类
     * @param categoryDTO
     * @return
     */
    @PostMapping
    @ApiOperation("添加分类")
    @CacheEvict(cacheNames = "categoryData", condition = "#categoryDTO.parentId == null", allEntries = true)
    public Result addCategory(@RequestBody CategoryDTO categoryDTO) {
        categoryService.add(categoryDTO);
        return Result.success();
    }

    /**
     * 分类数据分页查询
     * @param categoryPageQueryDTO
     * @return
     */
    @GetMapping("/page")
    @ApiOperation("分类数据分页查询")
    public Result<PageResult> pageQuery(CategoryPageQueryDTO categoryPageQueryDTO) {
        PageResult pageResult = categoryService.pageQuery(categoryPageQueryDTO);
        return Result.success(pageResult);
    }

    /**
     * 修改分类
     * @param categoryDTO
     * @return
     */
    @PutMapping
    @ApiOperation("修改分类")
    @CacheEvict(cacheNames = {"categoryData", "subCategoryData"}, allEntries = true)
    public Result editCategory(@RequestBody CategoryDTO categoryDTO) {
        categoryService.edit(categoryDTO);
        return Result.success();
    }

    /**
     * 根据分类id删除分类
     * @param id
     * @return
     */
    @DeleteMapping
    @ApiOperation("根据分类id删除分类")
    public Result deleteCategory(@RequestParam @ApiParam("分类id") Long id) {
        categoryService.delete(id);
        return Result.success();
    }

    /**
     * 查询所有可用的二级分类
     * @return
     */
    @GetMapping("/allSub")
    @ApiOperation("查询所有可用的二级分类")
    public Result<List<CategoryVO>> getAllSubCategory() {
        List<CategoryVO> categoryVOList = categoryService.getAllSubCategory();
        return Result.success(categoryVOList);
    }
}
