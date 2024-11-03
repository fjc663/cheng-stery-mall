package com.cstery.controller.admin;

import com.cstery.dto.SpecificationDTO;
import com.cstery.dto.SpecificationPageQueryDTO;
import com.cstery.result.PageResult;
import com.cstery.result.Result;
import com.cstery.service.SpecificationService;
import com.cstery.vo.SpecificationVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin/spec")
@RequiredArgsConstructor
@Api(tags = "管理端规格选项相关接口")
public class AdminSpecificationController {

    private final SpecificationService specificationService;

    /**
     * 规格分页查询
     * @param specificationPageQueryDTO
     * @return
     */
    @GetMapping("/page")
    @ApiOperation("规格分页查询")
    public Result<PageResult> pageQuery(SpecificationPageQueryDTO specificationPageQueryDTO) {
        PageResult pageResult = specificationService.pageQuery(specificationPageQueryDTO);
        return Result.success(pageResult);
    }

    /**
     * 添加规格
     * @param specificationDTO
     * @return
     */
    @PostMapping
    @ApiOperation("添加规格")
    public Result add(@RequestBody SpecificationDTO specificationDTO) {
        specificationService.add(specificationDTO);
        return Result.success();
    }

    /**
     * 修改规格
     * @param specificationDTO
     * @return
     */
    @PutMapping
    @ApiOperation("修改规格")
    public Result edit(@RequestBody SpecificationDTO specificationDTO) {
        specificationService.edit(specificationDTO);
        return Result.success();
    }

    /**
     * 删除规格
     * @param id
     * @return
     */
    @DeleteMapping
    @ApiOperation("删除规格")
    public Result add(@RequestParam @ApiParam("规格id") Long id) {
        specificationService.delete(id);
        return Result.success();
    }

    /**
     * 获得所有启用的规格
     * @return
     */
    @GetMapping
    @ApiOperation("获得所有启用的规格")
    public Result<List<SpecificationVO>> getAllSpecification() {
        List<SpecificationVO> specificationVOList = specificationService.getAllSpecification();
        return Result.success(specificationVOList);
    }
}
