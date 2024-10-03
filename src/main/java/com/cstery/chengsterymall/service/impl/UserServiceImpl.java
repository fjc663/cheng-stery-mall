package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cstery.chengsterymall.constant.JwtClaimConstant;
import com.cstery.chengsterymall.constant.MessageConstant;
import com.cstery.chengsterymall.constant.StatusConstant;
import com.cstery.chengsterymall.constant.UserRoleConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.*;
import com.cstery.chengsterymall.domain.po.Order;
import com.cstery.chengsterymall.domain.po.User;
import com.cstery.chengsterymall.domain.vo.LoginVO;
import com.cstery.chengsterymall.domain.vo.UserVO;
import com.cstery.chengsterymall.exceptions.LoginFailException;
import com.cstery.chengsterymall.exceptions.UpdateFailException;
import com.cstery.chengsterymall.mapper.UserMapper;
import com.cstery.chengsterymall.properties.JwtProperties;
import com.cstery.chengsterymall.service.UserService;
import com.cstery.chengsterymall.utils.JwtUtil;
import com.cstery.chengsterymall.utils.SaltGeneratorUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private static final String DEFAULTAVATARURL = "http://localhost:8080/defaultAvatar.png";

    private final JwtProperties jwtProperties;

    /**
     * 用户端用户注册
     *
     * @param userRegisterDTO
     */
    @Override
    @Transactional
    public void register(UserRegisterDTO userRegisterDTO) {
        User user = BeanUtil.copyProperties(userRegisterDTO, User.class);

        // 加密密码
        String salt = SaltGeneratorUtil.generateSalt();
        String saltPassword = salt + user.getPassword();
        String password = DigestUtil.md5Hex(saltPassword.getBytes());
        user.setPassword(password);
        user.setSalt(salt);

        user.setAvatarUrl(DEFAULTAVATARURL);
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        user.setLastLogin(LocalDateTime.now());

        save(user);
    }

    /**
     * 用户端用户登录
     *
     * @param userLoginDTO
     * @return
     */
    @Override
    public LoginVO userLogin(UserLoginDTO userLoginDTO) {
        return login(userLoginDTO, JwtClaimConstant.USER_ID, jwtProperties.getUserSecretKey(), jwtProperties.getUserTtl());
    }

    /**
     * 返回当前用户的用户信息
     *
     * @return
     */
    @Override
    public UserVO getUserInfo() {
        User user = getById(BaseContext.getCurrentId());

        return BeanUtil.copyProperties(user, UserVO.class);
    }

    /**
     * 修改用户信息
     *
     * @param userDTO
     */
    @Override
    @Transactional
    public void updateUserInfo(UserDTO userDTO) {
        User user = BeanUtil.copyProperties(userDTO, User.class);
        user.setUpdatedAt(LocalDateTime.now());

        updateById(user);
    }

    /**
     * 更新头像
     *
     * @param newAvaratUrl
     */
    @Override
    @Transactional
    public void updateAvatarUrl(String newAvaratUrl) {
        User user = User
                .builder()
                .id(BaseContext.getCurrentId())
                .avatarUrl(newAvaratUrl)
                .build();
        updateById(user);
    }

    /**
     * 修改密码
     *
     * @param editPasswordDTO
     */
    @Override
    @Transactional
    public void editPassword(EditPasswordDTO editPasswordDTO) {
        // 查询用户信息
        User user = getById(BaseContext.getCurrentId());

        // 加密传过来的旧密码，同时比较查到的密码
        String saltOldPassword = user.getSalt() + editPasswordDTO.getOldPassword();
        String cOldPassword = DigestUtil.md5Hex(saltOldPassword.getBytes());

        // 不正确抛出异常
        if (!cOldPassword.equals(user.getPassword())) {
            throw new UpdateFailException(MessageConstant.OLDPASSWORDERROR);
        }

        // 加密新密码并换盐值
        String salt = SaltGeneratorUtil.generateSalt();
        String saltNewPassword = salt + editPasswordDTO.getNewPassword();
        String cNewPassword = DigestUtil.md5Hex(saltNewPassword.getBytes());

        // 修改密码
        user = User
                .builder()
                .id(BaseContext.getCurrentId())
                .salt(salt)
                .password(cNewPassword)
                .updatedAt(LocalDateTime.now())
                .build();

        // 更新
        updateById(user);
    }

    /**
     * 管理端用户登录
     *
     * @param userLoginDTO
     * @return
     */
    @Override
    public LoginVO adminLogin(UserLoginDTO userLoginDTO) {
        return login(userLoginDTO, JwtClaimConstant.ADMIN_ID, jwtProperties.getAdminSecretKey(), jwtProperties.getAdminTtl());
    }

    private LoginVO login(UserLoginDTO userLoginDTO, String ID, String secretKey, Long ttl) {
        // 根据用户名查询用户信息
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(User::getUsername, userLoginDTO.getUsername());
        User user = getOne(userLambdaQueryWrapper);

        // 用户不存在
        if (user == null) {
            throw new LoginFailException(MessageConstant.USERNAMEORPASSWORDERROR);
        }

        if (ID.equals(JwtClaimConstant.ADMIN_ID)) {
            // 判断用户权限
            if (!user.getRole().equals(UserRoleConstant.SUPER) && !user.getRole().equals(UserRoleConstant.ADMIN)) {
                throw new LoginFailException(MessageConstant.PERMISSIONDENIED);
            }
        }

        // 判断账号是否被禁用
        if (user.getStatus().equals(StatusConstant.DISABLE)) {
            throw new LoginFailException(MessageConstant.USERDISABLE);
        }

        // 校验密码
        String salt = user.getSalt();
        String saltPassword = salt + userLoginDTO.getPassword();
        String userPassword = DigestUtil.md5Hex(saltPassword.getBytes());

        // 密码错误
        if (!userPassword.equals(user.getPassword())) {
            throw new LoginFailException(MessageConstant.USERNAMEORPASSWORDERROR);
        }

        // 账号密码正确生成jwt令牌
        Long userId = user.getId();
        Map<String, Object> map = new HashMap<>();
        map.put(ID, userId);
        String jwt = JwtUtil.createJWT(secretKey, ttl, map);

        // 更新登录时间
        LambdaUpdateWrapper<User> userLambdaUpdateWrapper = new LambdaUpdateWrapper<User>()
                .set(User::getLastLogin, LocalDateTime.now());
        update(userLambdaUpdateWrapper);

        // 返回jwt令牌
        return LoginVO
                .builder()
                .id(userId)
                .token(jwt)
                .avatarUrl(user.getAvatarUrl())
                .build();
    }

    /**
     * 获得用户总数
     * @param chartDTO
     * @param isCumulative
     * @return
     */
    @Override
    public Integer getTotalUsers(ChartDTO chartDTO, Boolean isCumulative) {
        // 构造日期条件限制
        LocalDateTime beginTime = LocalDateTime.of(chartDTO.getStartData(), LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(chartDTO.getEndData(), LocalTime.MAX);

        LambdaQueryWrapper<User> orderLambdaQueryWrapper = new LambdaQueryWrapper<User>()
                .ge(User::getRole, UserRoleConstant.USER);

        // 判断是累计还是仅是今天的
        if (isCumulative) {
            orderLambdaQueryWrapper.le(User::getCreatedAt, endTime);
        } else {
            orderLambdaQueryWrapper.between(User::getCreatedAt, beginTime, endTime);
        }

        long count = count(orderLambdaQueryWrapper);

        return (int) count;
    }
}
