package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class ProductException extends BaseException {
    public ProductException() {
    }

    public ProductException(String msg) {
        super(msg);
    }
}
