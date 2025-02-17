package com.cstery.user.controller.user;


import com.cstery.common.result.Result;
import com.cstery.common.utils.AliOssUtil;
import com.cstery.user.domain.dto.EditPasswordDTO;
import com.cstery.user.domain.dto.UserDTO;
import com.cstery.user.domain.dto.UserLoginDTO;
import com.cstery.user.domain.dto.UserRegisterDTO;
import com.cstery.user.domain.vo.LoginVO;
import com.cstery.user.domain.vo.UserVO;
import com.cstery.user.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;

@RestController
@RequestMapping("/user/user")
@RequiredArgsConstructor
@Api(tags = "用户端用户相关接口")
public class UserController {

    private final UserService userService;
    private final AliOssUtil aliOssUtil;

    /**
     * 用户端用户注册
     *
     * @param userRegisterDTO
     * @return
     */
    @PostMapping("/register")
    @ApiOperation("用户端用户注册")
    public Result register(@Valid @RequestBody UserRegisterDTO userRegisterDTO) {
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
    public Result<LoginVO> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
        LoginVO loginVO = userService.userLogin(userLoginDTO);
        return Result.success(loginVO);
    }

    /**
     * 返回当前用户的用户信息
     * @return
     */
    @GetMapping
    @ApiOperation("返回当前用户的用户信息")
    public Result<UserVO> getUserInfo() {
        UserVO userVO = userService.getUserInfo();
        return Result.success(userVO);
    }

    /**
     * 修改用户信息
     * @param userDTO
     * @return
     */
    @PutMapping
    @ApiOperation("修改用户信息")
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
     * 头像上传
     * @param avatarFile
     * @return
     */
    @PostMapping("/upload/avatar")
    @ApiOperation("头像上传")
    public Result<String> uploadAvatar(MultipartFile avatarFile){
        String avatar = aliOssUtil.upload(avatarFile, "avatar/");
        userService.updateAvatarUrl(avatar);
        return Result.success(avatar);
    }

}
