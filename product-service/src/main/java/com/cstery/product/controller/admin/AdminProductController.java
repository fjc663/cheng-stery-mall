package com.cstery.product.controller.admin;


import com.cstery.common.utils.AliOssUtil;
import com.cstery.product.domain.dto.ProductDTO;
import com.cstery.product.domain.dto.ProductPageQueryDTO;
import com.cstery.product.service.FeaturedProductService;
import com.cstery.product.service.ProductService;
import com.cstery.common.result.PageResult;
import com.cstery.common.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/admin/product")
@RequiredArgsConstructor
@Api(tags = "管理端商品相关接口")
public class AdminProductController {

    private final ProductService productService;
    private final FeaturedProductService featuredProductService;
    private final AliOssUtil aliOssUtil;


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

    /**
     * 增加被取消商品的库存
     * @param quantities
     * @return
     */
    @PutMapping("/stock/inc")
    @ApiOperation("增加被取消商品的库存")
    public Result increaseStock(@RequestParam @ApiParam("商品ID和数量集合") Map<String, Integer> quantities) {
        productService.increaseStock(quantities);
        return Result.success();
    }

    /**
     * 增加商品销量
     * @param sales
     * @return
     */
    @PutMapping("/sales")
    @ApiOperation("增加商品销量")
    public Result increaseSales(@RequestParam @ApiParam("商品ID和数量集合") Map<String, Integer> sales) {
        productService.increaseSales(sales);
        return Result.success();
    }

    /**
     * 减少商品的库存
     * @param quantities
     * @return
     */
    @PutMapping("/stock/dec")
    @ApiOperation("减少商品的库存")
    public Result decreaseStock(@RequestParam @ApiParam("商品ID和数量集合") Map<String, Integer> quantities) {
        productService.decreaseStock(quantities);
        return Result.success();
    }

    /**
     * 商品图片上传
     * @param productFile
     * @return
     */
    @PostMapping("/upload")
    @ApiOperation("商品图片上传")
    public Result<String> uploadProduct(MultipartFile productFile){
        String product = aliOssUtil.upload(productFile, "product/");
        return Result.success(product);
    }

}
