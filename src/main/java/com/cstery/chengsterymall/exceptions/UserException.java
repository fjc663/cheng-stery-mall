package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class UserException extends BaseException {
    public UserException() {
    }

    public UserException(String msg) {
        super(msg);
    }
}
