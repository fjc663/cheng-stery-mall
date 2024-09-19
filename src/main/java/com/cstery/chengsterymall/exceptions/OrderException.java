package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class OrderException extends BaseException {
    public OrderException() {
    }

    public OrderException(String msg) {
        super(msg);
    }
}
