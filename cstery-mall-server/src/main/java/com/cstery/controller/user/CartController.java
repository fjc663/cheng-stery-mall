package com.cstery.controller.user;

import com.cstery.dto.CartDTO;
import com.cstery.result.Result;
import com.cstery.service.CartService;
import com.cstery.vo.CartVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user/cart")
@RequiredArgsConstructor
@Api(tags = "用户端购物车相关接口")
public class CartController {

    private final CartService cartService;

    /**
     * 添加商品到购物车
     * @param cartDTO
     * @return
     */
    @PostMapping
    @ApiOperation("添加商品到购物车")
    public Result add(@RequestBody CartDTO cartDTO){
        cartService.add(cartDTO);
        return Result.success();
    }

    /**
     * 获得当前用户购物车的商品数量（同种商品算一个）
     * @return
     */
    @GetMapping("/cartItemsNum")
    @ApiOperation("获得当前用户购物车的商品数量（同种商品算一个）")
    public Result<Integer> getCartItemsNum() {
        Integer cartItemsNum =  cartService.getCartItemsNum();
        return Result.success(cartItemsNum);
    }

    /**
     * 根据用户id返回购物车数据
     * @return
     */
    @GetMapping("/cartItems")
    @ApiOperation("根据用户id返回购物车数据")
    public Result<List<CartVO>> getCartItems() {
        List<CartVO> cartVOList = cartService.getByUserId();
        return Result.success(cartVOList);
    }

    /**
     * 根据购物车记录ID更新商品数量
     * @param id
     * @return
     */
    @PutMapping
    @ApiOperation("根据购物车记录ID更新商品数量")
    public Result updateCart(@RequestParam @ApiParam("购物车记录ID") Long id,
                             @RequestParam @ApiParam("要更新的商品数量") Integer quantity) {
        cartService.updateCart(id, quantity);
        return Result.success();
    }

    /**
     * 根据ID删除购物车记录
     * @param id
     * @return
     */
    @DeleteMapping
    @ApiOperation("根据ID删除购物车记录")
    public Result deleteCart(@RequestParam @ApiParam("购物车记录ID") Long id){
        cartService.deleteCart(id);
        return Result.success();
    }

    /**
     * 清空购物车
     * @return
     */
    @DeleteMapping("/all")
    @ApiOperation("清空购物车")
    public Result deleteAllItem(){
        cartService.deleteAllItem();
        return Result.success();
    }
}
