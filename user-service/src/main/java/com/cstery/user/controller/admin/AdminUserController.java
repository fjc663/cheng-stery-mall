package com.cstery.user.controller.admin;


import com.cstery.result.PageResult;
import com.cstery.result.Result;
import com.cstery.user.domain.dto.*;
import com.cstery.user.domain.vo.LoginVO;
import com.cstery.user.domain.vo.UserVO;
import com.cstery.user.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
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
    public Result<LoginVO> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
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

    /**
     * 分页查询用户数据
     * @param userPageQueryDTO
     * @return
     */
    @GetMapping("/page")
    @ApiOperation("分页查询用户数据")
    public Result<PageResult> pageQuery(UserPageQueryDTO userPageQueryDTO) {
        PageResult pageResult = userService.pageQuery(userPageQueryDTO);
        return Result.success(pageResult);
    }

    /**
     * 设置用户角色
     * @param id
     * @param role
     * @return
     */
    @PutMapping("/role/{id}")
    @ApiOperation("设置用户角色")
    public Result setRole(@PathVariable @ApiParam("用户id") Long id, @RequestParam @ApiParam("用户角色") String role) {
        userService.setRole(id, role);
        return Result.success();
    }

    /**
     * 重设密码
     * @param id
     * @param password
     * @return
     */
    @PutMapping("/reset/{id}")
    @ApiOperation("重设密码")
    public Result resetPassword(@PathVariable @ApiParam("用户id") Long id, @RequestParam @ApiParam("密码") String password) {
        userService.resetPassword(id, password);
        return Result.success();
    }

    /**
     * 获得用户总数
     * @param chartDTO
     * @param isCumulative
     * @return
     */
    @GetMapping("/users")
    @ApiOperation("获得用户总数")
    public Result<Integer> getTotalUsers(ChartDTO chartDTO, Boolean isCumulative) {
        Integer totalUsers = userService.getTotalUsers(chartDTO, isCumulative);
        return Result.success(totalUsers);
    }

}
