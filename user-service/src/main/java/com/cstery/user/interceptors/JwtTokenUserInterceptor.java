package com.cstery.user.interceptors;

import com.cstery.constant.JwtClaimConstant;
import com.cstery.context.BaseContext;
import com.cstery.user.properties.JwtProperties;
import com.cstery.utils.JwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class JwtTokenUserInterceptor implements HandlerInterceptor {

    @Autowired
    private JwtProperties jwtProperties;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 如果不是controller方法直接放行
        if (!(handler instanceof HandlerMethod)){
            return true;
        }

        // 获得前端传过来的jwt令牌
        String userJwtToken = request.getHeader(jwtProperties.getUserTokenName());

        try {
            // 校验令牌
            Claims claims = JwtUtil.parseJWT(jwtProperties.getUserSecretKey(), userJwtToken);
            // 获得令牌里的用户id信息
            Long adminId = claims.get(JwtClaimConstant.USER_ID, Long.class);

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
