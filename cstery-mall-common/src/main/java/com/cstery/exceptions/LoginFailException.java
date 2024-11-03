package com.cstery.exceptions;

/**
 * 处理登录相关异常
 */
public class LoginFailException extends BaseException{

    public LoginFailException() {}

    public LoginFailException(String msg) {
        super(msg);
    }
}
