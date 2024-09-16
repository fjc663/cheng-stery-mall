package com.cstery.chengsterymall.controller.user;

import com.cstery.chengsterymall.domain.vo.CategoryVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.CategoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
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
     * 获取无父级分类
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("获得全部分类信息")
    public Result<List<CategoryVO>> getCategoryList(){
        List<CategoryVO> categoryVOList = categoryService.getCategoryList();
        return Result.success(categoryVOList);
    }

}

