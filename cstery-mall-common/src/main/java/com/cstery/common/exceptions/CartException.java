package com.cstery.common.exceptions;

/**
 * 购物车相关异常
 */
public class CartException extends BaseException {
    public CartException() {
    }

    public CartException(String msg) {
        super(msg);
    }
}
