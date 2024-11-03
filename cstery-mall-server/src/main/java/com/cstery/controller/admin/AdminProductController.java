package com.cstery.controller.admin;


import com.cstery.dto.ProductDTO;
import com.cstery.dto.ProductPageQueryDTO;
import com.cstery.result.PageResult;
import com.cstery.result.Result;
import com.cstery.service.FeaturedProductService;
import com.cstery.service.ProductService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/product")
@RequiredArgsConstructor
@Api(tags = "管理端商品相关接口")
public class AdminProductController {

    private final ProductService productService;
    private final FeaturedProductService featuredProductService;


    /**
     * 管理端商品分页查询
     * @param productPageQueryDTO
     * @return
     */
    @GetMapping("/page")
    @ApiOperation("管理端商品分页查询")
    public Result<PageResult> pageQuery(ProductPageQueryDTO productPageQueryDTO) {
        PageResult pageResult = productService.adminProductPageQuery(productPageQueryDTO);
        return Result.success(pageResult);
    }

    /**
     * 添加商品
     * @param productDTO
     * @return
     */
    @PostMapping
    @ApiOperation("添加商品")
    @CacheEvict(cacheNames = {"product", "product_page"}, allEntries = true)
    public Result add(@RequestBody ProductDTO productDTO) {
        productService.add(productDTO);
        return Result.success();
    }

    /**
     * 修改商品信息
     * @param productDTO
     * @return
     */
    @PutMapping
    @ApiOperation("修改商品信息")
    @CacheEvict(cacheNames = {"product", "product_page"}, allEntries = true)
    public Result edit(@RequestBody ProductDTO productDTO) {
        productService.edit(productDTO);
        return Result.success();
    }

    /**
     * 删除商品
     * @param id
     * @return
     */
    @DeleteMapping
    @ApiOperation("删除商品")
    @CacheEvict(cacheNames = {"product", "product_page", "product_detail"}, allEntries = true)
    public Result edit(@RequestParam @ApiParam("商品id") Long id) {
        productService.delete(id);
        return Result.success();
    }

    /**
     * 设置商品类型
     * @param id
     * @return
     */
    @PutMapping("/type/{id}")
    @ApiOperation("设置商品类型")
    @CacheEvict(cacheNames = "featured_product", allEntries = true)
    public Result setFeaturedType(@PathVariable @ApiParam("商品id") Long id,
                                  @RequestParam @ApiParam("商品类型") Integer type) {
        featuredProductService.setFeaturedType(id, type);
        return Result.success();
    }

    /**
     * 去除商品类型
     * @param id
     * @return
     */
    @PutMapping("/reset/{id}")
    @ApiOperation("设置商品类型")
    @CacheEvict(cacheNames = "featured_product", allEntries = true)
    public Result resetFeaturedType(@PathVariable @ApiParam("商品id") Long id,
                                  @RequestParam @ApiParam("商品类型") Integer type) {
        featuredProductService.resetFeaturedType(id, type);
        return Result.success();
    }

}
