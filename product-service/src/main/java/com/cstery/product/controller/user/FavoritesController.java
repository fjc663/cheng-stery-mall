package com.cstery.product.controller.user;

import com.cstery.product.domain.vo.ProductFavoriteVO;
import com.cstery.product.service.ProductFavoritesService;
import com.cstery.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user/favorites")
@RequiredArgsConstructor
@Api(tags = "用户端商品收藏相关接口")
public class FavoritesController {

    private final ProductFavoritesService productFavoritesService;


    /**
     * 添加商品到收藏夹
     * @param id
     * @return
     */
    @PostMapping("/{id}")
    @ApiOperation("添加商品到收藏夹")
    public Result addToFavorites(@ApiParam("商品id") @PathVariable Long id) {
        productFavoritesService.addToFavorites(id);
        return Result.success();
    }

    /**
     * 查询收藏商品信息
     * @return
     */
    @GetMapping
    @ApiOperation("查询收藏夹信息")
    public Result<List<ProductFavoriteVO>> getFavorites() {
        List<ProductFavoriteVO> productFavoriteVOList = productFavoritesService.getFavorites();
        return Result.success(productFavoriteVOList);
    }

    /**
     * 删除收藏夹商品
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    @ApiOperation("删除收藏夹商品")
    public Result deleteFavoritesProduct(@ApiParam("商品id") @PathVariable Long id) {
        productFavoritesService.deleteFavoritesProduct(id);
        return Result.success();
    }
}
