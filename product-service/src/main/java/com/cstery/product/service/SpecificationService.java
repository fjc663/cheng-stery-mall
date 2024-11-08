package com.cstery.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.product.domain.dto.SpecificationDTO;
import com.cstery.product.domain.dto.SpecificationPageQueryDTO;
import com.cstery.product.domain.po.Specifications;
import com.cstery.product.domain.vo.SpecificationVO;
import com.cstery.common.result.PageResult;

import java.util.List;

public interface SpecificationService extends IService<Specifications> {

    /**
     * 规格分页查询
     * @param specificationPageQueryDTO
     * @return
     */
    PageResult pageQuery(SpecificationPageQueryDTO specificationPageQueryDTO);

    /**
     * 添加规格
     * @param specificationDTO
     */
    void add(SpecificationDTO specificationDTO);

    /**
     * 修改规格
     * @param specificationDTO
     */
    void edit(SpecificationDTO specificationDTO);

    /**
     * 删除规格
     * @param id
     */
    void delete(Long id);

    /**
     * 获得所有启用的规格
     * @return
     */
    List<SpecificationVO> getAllSpecification();
}
