package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class GetCartFailException extends BaseException {
    public GetCartFailException() {
    }

    public GetCartFailException(String msg) {
        super(msg);
    }
}
