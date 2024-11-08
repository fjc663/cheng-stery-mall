package com.cstery.gateway.filters;


import com.cstery.common.constant.JwtClaimConstant;
import com.cstery.gateway.properties.AuthProperties;
import com.cstery.gateway.properties.JwtProperties;
import com.cstery.common.utils.JwtUtil;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserGlobalFilter implements GlobalFilter, Ordered {

    private final AuthProperties authProperties;
    private final JwtProperties jwtProperties;
    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        // 1. 获取request
        ServerHttpRequest request = exchange.getRequest();
        // 2. 判断是否需要做登录拦截
        if (isExclude(request.getPath().toString())){
            // 放行
            return chain.filter(exchange);
        }
        // 3. 获取token
        String token = null;
        List<String> headers = request.getHeaders().get(jwtProperties.getUserTokenName());
        if (headers != null && !headers.isEmpty()){
            token = headers.get(0);
        }
        // 4. 检验并解析token
        Long userId;
        try {
            // 校验令牌
            Claims claims = JwtUtil.parseJWT(jwtProperties.getUserSecretKey(), token);
            // 获得令牌里的用户id信息
             userId = claims.get(JwtClaimConstant.USER_ID, Long.class);
        }catch (Exception e){
            // 拦截，设置响应状态码为401
            ServerHttpResponse response = exchange.getResponse();
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            return response.setComplete();
        }
        // 5. 传递用户信息
        String userInfo = userId.toString();
        ServerWebExchange swe = exchange.mutate()
                .request(builder -> builder.header("user-info", userInfo))
                .build();
        // 6.放行
        return chain.filter(swe);
    }

    private boolean isExclude(String path) {
        boolean isIntercept = true;

        // 拦截
        for (String pathPatten : authProperties.getUserIncludePaths()) {
            if (antPathMatcher.match(pathPatten, path)){
                isIntercept = false;
            }
        }

        // 排除
        for (String pathPatten : authProperties.getUserExcludePaths()) {
            if (antPathMatcher.match(pathPatten, path)){
                isIntercept = true;
            }
        }
        return isIntercept;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
