package com.cstery.chengsterymall.controller.common;

import com.cstery.chengsterymall.constant.MessageConstant;
import com.cstery.chengsterymall.exceptions.UploadFailException;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.UserService;
import com.cstery.chengsterymall.utils.AliOssUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/upload")
@RequiredArgsConstructor
@Api("上传接口相关操作")
public class UploadController {

    private final AliOssUtil aliOssUtil;
    private final UserService userService;

    /**
     * 头像上传
     * @param avatarFile
     * @return
     */
    @PostMapping("/user/avatar")
    @ApiOperation("头像上传")
    public Result<String> uploadAvatar(MultipartFile avatarFile){
        String avatar = upload(avatarFile, "avatar/");
        userService.updateAvatarUrl(avatar);
        return Result.success(avatar);
    }

    /**
     * 分类图片上传
     * @param categoryFile
     * @return
     */
    @PostMapping("/admin/category")
    @ApiOperation("分类图片上传")
    public Result<String> uploadCategory(MultipartFile categoryFile){
        String category = upload(categoryFile, "category/");
        return Result.success(category);
    }

    /**
     * 管理员头像上传
     * @param avatarFile
     * @return
     */
    @PostMapping("/admin/avatar")
    @ApiOperation("管理员头像上传")
    public Result<String> uploadAdminAvatar(MultipartFile avatarFile){
        String avatar = upload(avatarFile, "avatar/");
        userService.updateAvatarUrl(avatar);
        return Result.success(avatar);
    }

    /**
     * 文件上传
     * @param file
     * @param prefix
     * @return
     */
    private String upload(MultipartFile file, String prefix) {
        String originalFilename = file.getOriginalFilename();

        assert originalFilename != null;
        String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
        String newFilename = prefix + UUID.randomUUID() + extension;

        try {
            return aliOssUtil.upload(file.getBytes(), newFilename);
        } catch (IOException e) {
            throw new UploadFailException(MessageConstant.UPLOADFAILED);
        }
    }
}
