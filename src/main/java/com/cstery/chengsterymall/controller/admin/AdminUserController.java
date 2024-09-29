package com.cstery.chengsterymall.controller.admin;

import com.cstery.chengsterymall.domain.dto.EditPasswordDTO;
import com.cstery.chengsterymall.domain.dto.UserDTO;
import com.cstery.chengsterymall.domain.dto.UserLoginDTO;
import com.cstery.chengsterymall.domain.dto.UserRegisterDTO;
import com.cstery.chengsterymall.domain.vo.LoginVO;
import com.cstery.chengsterymall.domain.vo.UserVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/admin/user")
@RequiredArgsConstructor
@Api(tags = "管理端用户相关接口")
public class AdminUserController {

    private final UserService userService;

    /**
     * 管理端用户登录
     *
     * @param userLoginDTO
     * @return
     */
    @PostMapping("/login")
    @ApiOperation("管理端用户登录")
    public Result<LoginVO> login(@Valid @RequestBody  UserLoginDTO userLoginDTO) {
        LoginVO loginVO = userService.adminLogin(userLoginDTO);
        return Result.success(loginVO);
    }

    /**
     * 返回当前管理员的用户信息
     * @return
     */
    @GetMapping
    @ApiOperation("返回当前管理员的用户信息")
    public Result<UserVO> getAdminUserInfo() {
        UserVO userVO = userService.getUserInfo();
        return Result.success(userVO);
    }

    /**
     * 保存用户信息
     * @param userDTO
     * @return
     */
    @PutMapping
    @ApiOperation("保存用户信息")
    public Result updateUserInfo(@Valid @RequestBody UserDTO userDTO) {
        userService.updateUserInfo(userDTO);
        return Result.success();
    }

    /**
     * 修改密码
     * @param editPasswordDTO
     * @return
     */
    @PutMapping("/editPassword")
    @ApiOperation("修改密码")
    public Result editPassword(@Valid @RequestBody EditPasswordDTO editPasswordDTO) {
        userService.editPassword(editPasswordDTO);
        return Result.success();
    }

}
