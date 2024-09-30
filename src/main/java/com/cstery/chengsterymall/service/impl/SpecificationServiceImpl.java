package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.constant.MessageConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.SpecificationDTO;
import com.cstery.chengsterymall.domain.dto.SpecificationPageQueryDTO;
import com.cstery.chengsterymall.domain.po.ProductSpecifications;
import com.cstery.chengsterymall.domain.po.Specifications;
import com.cstery.chengsterymall.domain.vo.SpecificationVO;
import com.cstery.chengsterymall.exceptions.ProductException;
import com.cstery.chengsterymall.mapper.SpecificationsMapper;
import com.cstery.chengsterymall.result.PageResult;
import com.cstery.chengsterymall.service.SpecificationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class SpecificationServiceImpl extends ServiceImpl<SpecificationsMapper, Specifications> implements SpecificationService {

    /**
     * 规格分页查询
     * @param specificationPageQueryDTO
     * @return
     */
    @Override
    public PageResult pageQuery(SpecificationPageQueryDTO specificationPageQueryDTO) {
        // 设置分页的页码和每页条数
        IPage<Specifications> iPage = new Page<>(specificationPageQueryDTO.getPage(), specificationPageQueryDTO.getPageSize());

        // 添加搜索条件
        LambdaQueryWrapper<Specifications> specificationsLambdaQueryWrapper = new LambdaQueryWrapper<>();

        if (specificationPageQueryDTO.getName() != null) {
            specificationsLambdaQueryWrapper.like(Specifications::getName, specificationPageQueryDTO.getName());
        }

        if (specificationPageQueryDTO.getStatus() != null) {
            specificationsLambdaQueryWrapper.eq(Specifications::getStatus, specificationPageQueryDTO.getStatus());
        }

        // 分页查询
        IPage<Specifications> page = page(iPage, specificationsLambdaQueryWrapper);

        // 设置返回结果
        PageResult pageResult = new PageResult();
        pageResult.setTotal(page.getTotal());
        pageResult.setRecords(BeanUtil.copyToList(page.getRecords(), SpecificationVO.class));

        return pageResult;
    }

    /**
     * 添加规格
     * @param specificationDTO
     */
    @Override
    @Transactional
    public void add(SpecificationDTO specificationDTO) {
        // 复制为PO对象
        Specifications specifications = BeanUtil.copyProperties(specificationDTO, Specifications.class);

        // 设置其他信息
        specifications.setCreatedAt(LocalDateTime.now());
        specifications.setUpdatedAt(LocalDateTime.now());
        specifications.setCreatedBy(BaseContext.getCurrentId());
        specifications.setUpdatedBy(BaseContext.getCurrentId());

        // 插入
        save(specifications);
    }

    /**
     * 修改规格
     * @param specificationDTO
     */
    @Override
    @Transactional
    public void edit(SpecificationDTO specificationDTO) {
        // 复制为PO对象
        Specifications specifications = BeanUtil.copyProperties(specificationDTO, Specifications.class);

        // 设置更新信息
        specifications.setUpdatedAt(LocalDateTime.now());
        specifications.setUpdatedBy(BaseContext.getCurrentId());

        // 插入
        updateById(specifications);
    }

    /**
     * 删除规格
     * @param id
     */
    @Override
    @Transactional
    public void delete(Long id) {
        // 根据规格ID查询规格商品表
        List<ProductSpecifications> productSpecificationsList = Db.lambdaQuery(ProductSpecifications.class)
                .eq(ProductSpecifications::getSpecificationId, id).list();

        // 关联了商品，不能删除
        if (productSpecificationsList != null && !productSpecificationsList.isEmpty()) {
            throw new ProductException(MessageConstant.SPECRELATEDPRODUCT);
        }

        // 删除
        removeById(id);
    }
}
