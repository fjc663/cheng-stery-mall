package com.cstery.chengsterymall.controller.user;

import com.cstery.chengsterymall.domain.vo.FeaturedProductVO;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.FeaturedProductService;
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
    private final FeaturedProductService featuredProductService;

    /**
     * 根据分类id返回商品
     * @param id
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("根据分类id返回商品")
    public Result<List<ProductVO>> getByCategoryId(@ApiParam("分类id") @RequestParam Long id){
        List<ProductVO> productVOList = productService.getByCategoryId(id);
        return Result.success(productVOList);
    }

    /**
     * 根据商品id返回商品
     * @param id
     * @return
     */
    @GetMapping
    @ApiOperation("根据商品id返回商品详细信息")
    public Result<ProductVO> getProductDetailInfo(@ApiParam("商品id") @RequestParam Long id){
        ProductVO productVO = productService.getProductDetailInfo(id);
        return Result.success(productVO);
    }

    /**
     * 返回特色商品数据
     * @return
     */
    @GetMapping("/featured")
    @ApiOperation("返回特色商品数据")
    public  Result<List<FeaturedProductVO>> getFeaturedProducts() {
        List<FeaturedProductVO> featuredProductVOList = featuredProductService.getFeaturedProducts();
        return Result.success(featuredProductVOList);
    }


}
