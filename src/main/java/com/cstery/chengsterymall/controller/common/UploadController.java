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
     * 文件上传
     * @param avatarFile
     * @return
     */
    @PostMapping("/avatar")
    @ApiOperation("头像上传")
    public Result<String> upload(MultipartFile avatarFile){

        String originalFilename = avatarFile.getOriginalFilename();

        assert originalFilename != null;
        String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
        String newFilename = "avatar/" + UUID.randomUUID() + extension;

        try {
            String imgPath = aliOssUtil.upload(avatarFile.getBytes(), newFilename);
            userService.updateAvatarUrl(imgPath);
            return Result.success(imgPath);
        } catch (IOException e) {
            throw new UploadFailException(MessageConstant.UPLOADFAILED);
        }

    }
}
