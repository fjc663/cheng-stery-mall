package com.cstery.api.client;

import com.cstery.api.dto.ChartDTO;
import com.cstery.api.vo.AddressVO;
import com.cstery.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;


@FeignClient("user-service")
public interface UserClient {
    @GetMapping("/user/address/{id}")
    Result<AddressVO> queryAddressById(@PathVariable("id") Long id);

    @GetMapping("/user/user/users")
    Result<Integer> getTotalUsers(@RequestParam("chartDTO") ChartDTO chartDTO,
                                  @RequestParam("isCumulative") Boolean isCumulative);

}
