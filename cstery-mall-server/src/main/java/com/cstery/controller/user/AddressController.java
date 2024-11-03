package com.cstery.controller.user;

import com.cstery.dto.AddressDTO;
import com.cstery.result.Result;
import com.cstery.service.AddressService;
import com.cstery.vo.AddressVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user/address")
@RequiredArgsConstructor
@Api(tags = "用户端地址相关接口")
public class AddressController {

    private final AddressService addressService;

    /**
     * 返回当前用户的地址
     * @return
     */
    @GetMapping
    @ApiOperation("返回当前用户的地址")
    public Result<List<AddressVO>> getAddress(){
        List<AddressVO> addressVOList = addressService.getAddress();
        return Result.success(addressVOList);
    }

    /**
     * 根据id设置默认地址
     * @param id
     * @return
     */
    @PutMapping("/{id}")
    @ApiOperation("根据id设置默认地址")
    public Result setDefaultAddress(@PathVariable @ApiParam("地址id") Long id) {
        addressService.setDefaultAddress(id);
        return Result.success();
    }

    /**
     * 添加新地址
     * @param addressDTO
     * @return
     */
    @PostMapping
    @ApiOperation("添加新地址")
    public Result addAddress(@RequestBody AddressDTO addressDTO) {
        addressService.addAddress(addressDTO);
        return Result.success();
    }

    /**
     * 修改地址
     * @param addressDTO
     * @return
     */
    @PutMapping
    @ApiOperation("修改地址")
    public Result updateAddress(@RequestBody AddressDTO addressDTO) {
        addressService.updateAddress(addressDTO);
        return Result.success();
    }

    /**
     * 删除地址
     * @param id
     * @return
     */
    @DeleteMapping
    @ApiOperation("删除地址")
    public Result deleteAddress(@RequestParam @ApiParam("地址id") Long id){
        addressService.deleteAddress(id);
        return Result.success();
    }
}
