package com.cstery.chengsterymall.controller.user;

import com.cstery.chengsterymall.domain.dto.UserLoginDTO;
import com.cstery.chengsterymall.domain.dto.UserRegisterDTO;
import com.cstery.chengsterymall.domain.vo.LoginVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/user/user")
@RequiredArgsConstructor
@Api("用户端用户相关接口")
public class UserController {

    private final UserService userService;

    /**
     * 用户端用户注册
     *
     * @param userRegisterDTO
     * @return
     */
    @PostMapping("/register")
    @ApiOperation("用户端用户注册")
    public Result register(@Valid @RequestBody  UserRegisterDTO userRegisterDTO) {
        userService.register(userRegisterDTO);
        return Result.success();
    }

    /**
     * 用户端用户登录
     *
     * @param userLoginDTO
     * @return
     */
    @PostMapping("/login")
    @ApiOperation("用户端用户登录")
    public Result<LoginVO> login(@Valid @RequestBody  UserLoginDTO userLoginDTO) {
        LoginVO loginVO = userService.login(userLoginDTO);
        return Result.success(loginVO);
    }

}
