package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class CartException extends BaseException {
    public CartException() {
    }

    public CartException(String msg) {
        super(msg);
    }
}
