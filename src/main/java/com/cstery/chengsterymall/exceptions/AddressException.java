package com.cstery.chengsterymall.exceptions;

/**
 * 温馨提示购物车为空
 */
public class AddressException extends BaseException {
    public AddressException() {
    }

    public AddressException(String msg) {
        super(msg);
    }
}
