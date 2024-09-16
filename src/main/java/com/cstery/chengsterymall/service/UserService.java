package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.UserLoginDTO;
import com.cstery.chengsterymall.domain.dto.UserRegisterDTO;
import com.cstery.chengsterymall.domain.po.User;
import com.cstery.chengsterymall.domain.vo.LoginVO;

public interface UserService extends IService<User> {

    /**
     * 用户端用户注册
     * @param userRegisterDTO
     */
    void register(UserRegisterDTO userRegisterDTO);

    /**
     * 用户端用户登录
     * @param userLoginDTO
     * @return
     */
    LoginVO login(UserLoginDTO userLoginDTO);
}
