package com.cstery.chengsterymall.handler;

import com.cstery.chengsterymall.exceptions.BaseException;
import com.cstery.chengsterymall.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;

/**
 * 捕获全局异常
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 业务异常
     * @param ex
     * @return
     */
    @ExceptionHandler
    public Result<String> exceptionHandler(BaseException ex){
        log.error("异常信息：{}", ex.getMessage());
        return Result.error(ex.getMessage());
    }

    /**
     * sql异常
     * @param ex
     * @return
     */
    @ExceptionHandler
    public Result<String> exceptionHandler2(SQLException ex){
        log.error("异常信息：{}", ex.getMessage());
        return Result.error("请输入正确数据");
    }

    /**
     * 检验异常
     * @param ex
     * @return
     */
    @ExceptionHandler
    public Result<String> validExceptionHandler(BindException ex){
        log.error("异常信息：{}", ex.getBindingResult().getFieldError().getDefaultMessage());
        return Result.error(ex.getBindingResult().getFieldError().getDefaultMessage());
    }

    /**
     * 未知异常
     * @param ex
     * @return
     */
    @ExceptionHandler
    public Result<String> ExceptionHandler(Exception ex){
        log.error("异常信息：{}", ex.getMessage());
        return Result.error("未知异常");
    }

}
