package com.cstery.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.common.result.PageResult;
import com.cstery.user.domain.dto.*;
import com.cstery.user.domain.po.User;
import com.cstery.user.domain.vo.LoginVO;
import com.cstery.user.domain.vo.UserVO;

import java.time.LocalDate;


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
    LoginVO userLogin(UserLoginDTO userLoginDTO);

    /**
     * 返回当前用户的用户信息
     * @return
     */
    UserVO getUserInfo();

    /**
     * 修改用户信息
     * @param userDTO
     */
    void updateUserInfo(UserDTO userDTO);

    /**
     * 更新头像
     * @param newAvaratUrl
     */
    void updateAvatarUrl(String newAvaratUrl);

    /**
     * 修改密码
     * @param editPasswordDTO
     */
    void editPassword(EditPasswordDTO editPasswordDTO);

    /**
     * 管理端用户登录
     * @param userLoginDTO
     * @return
     */
    LoginVO adminLogin(UserLoginDTO userLoginDTO);

    /**
     * 获得用户总数
     * @param startData
     * @param endData
     * @param isCumulative
     * @return
     */
    Integer getTotalUsers(LocalDate startData, LocalDate endData, Boolean isCumulative);

    /**
     * 分页查询用户数据
     * @param userPageQueryDTO
     * @return
     */
    PageResult pageQuery(UserPageQueryDTO userPageQueryDTO);

    /**
     * 设置用户角色
     * @param id
     * @param role
     */
    void setRole(Long id, String role);

    /**
     * 重设密码
     * @param id
     * @param password
     */
    void resetPassword(Long id, String password);
}
