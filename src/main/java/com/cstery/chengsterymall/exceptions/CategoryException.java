package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class CategoryException extends BaseException {
    public CategoryException() {
    }

    public CategoryException(String msg) {
        super(msg);
    }
}
