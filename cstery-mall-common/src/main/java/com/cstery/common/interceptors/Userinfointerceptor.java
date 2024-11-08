package com.cstery.common.interceptors;

import cn.hutool.core.util.StrUtil;
import com.cstery.common.context.BaseContext;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Userinfointerceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1.获取用户登录信息
        String userInfo = request.getHeader("user-info");
        // 2.判断是否了获取了用户，存入ThreadLocal
        if (StrUtil.isNotBlank(userInfo)){
            BaseContext.setCurrentId(Long.valueOf(userInfo));
        }
        // 3.放行
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 清理用户
        BaseContext.removeCurrentId();
    }
}
