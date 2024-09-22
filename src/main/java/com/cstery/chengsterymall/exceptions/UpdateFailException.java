package com.cstery.chengsterymall.exceptions;

/**
 * 处理登录相关异常
 */
public class UpdateFailException extends BaseException{

    public UpdateFailException() {}

    public UpdateFailException(String msg) {
        super(msg);
    }
}
