package com.cstery.api.client;

import com.cstery.api.vo.AddressVO;
import com.cstery.common.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;


@FeignClient("user-service")
public interface UserClient {

    /**
     * 根据地址ID返回地址数据
     */
    @GetMapping("/user/address/{id}")
    Result<AddressVO> queryAddressById(@PathVariable("id") Long id);

    /**
     * 获得总用户数
     */
    @GetMapping("/admin/user/users")
    Result<Integer> getTotalUsers(@RequestParam("startData") LocalDate startData,
                                  @RequestParam("endData") LocalDate endData,
                                  @RequestParam("isCumulative") Boolean isCumulative);

}
