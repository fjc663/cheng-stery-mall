package com.cstery.interceptors;

import com.cstery.exceptions.UserException;
import com.cstery.service.UserService;
import com.cstery.constant.JwtClaimConstant;
import com.cstery.constant.MessageConstant;
import com.cstery.constant.UserRoleConstant;
import com.cstery.context.BaseContext;
import com.cstery.properties.JwtProperties;
import com.cstery.po.User;
import com.cstery.utils.JwtUtil;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
@RequiredArgsConstructor
public class JwtTokenAdminInterceptor implements HandlerInterceptor {

    private final JwtProperties jwtProperties;
    private final UserService userService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 如果不是controller方法直接放行
        if (!(handler instanceof HandlerMethod)){
            return true;
        }

        // 获得前端传过来的jwt令牌
        String adminJwtToken = request.getHeader(jwtProperties.getAdminTokenName());

        try {
            // 校验令牌
            Claims claims = JwtUtil.parseJWT(jwtProperties.getAdminSecretKey(), adminJwtToken);
            // 获得令牌里的用户id信息
            Long adminId = claims.get(JwtClaimConstant.ADMIN_ID, Long.class);

            // 判断用户是否有权限
            User user = userService.getById(adminId);
            if (!user.getRole().equals(UserRoleConstant.ADMIN) && !user.getRole().equals(UserRoleConstant.SUPER)) {
                throw new UserException(MessageConstant.PERMISSIONDENIED);
            }

            // 将用户id信息存入当前线程副本空间
            BaseContext.setCurrentId(adminId);
            return true;
        }catch (Exception ex){
            // 校验失败，返回401
            response.setStatus(401);
            return false;
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 执行完业务后，清理用户
        BaseContext.removeCurrentId();
    }
}
