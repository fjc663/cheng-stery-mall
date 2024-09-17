package com.cstery.chengsterymall.controller.user;

import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.ProductService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user/product")
@RequiredArgsConstructor
@Api(tags = "用户端商品相关接口")
public class ProductController {

    private final ProductService productService;

    /**
     * 根据分类id返回商品
     * @param id
     * @return
     */
    @GetMapping
    @ApiOperation("根据分类id返回商品")
    public Result<List<ProductVO>> getByCategoryId(@ApiParam("分类id") @RequestParam Long id){
        List<ProductVO> productVOList = productService.getByCategoryId(id);
        return Result.success(productVOList);
    }
}
