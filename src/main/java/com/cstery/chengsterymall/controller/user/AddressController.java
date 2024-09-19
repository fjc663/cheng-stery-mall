package com.cstery.chengsterymall.controller.user;

import com.cstery.chengsterymall.domain.vo.AddressVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.AddressService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
