package com.cstery.common.exceptions;

/**
 * 根异常
 */
public class BaseException extends RuntimeException{

    public BaseException() {}

    public BaseException(String msg) {
        super(msg);
    }
}
