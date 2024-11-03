package com.cstery;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ChengsteryMallApplicationTests {

    /*@Autowired
    private ProductService productService;*/

    @Test
    void contextLoads() {

        // 用于批量插入规格测试数据
        /*LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<Product>().like(Product::getName, "手机");
        List<Product> productList = productService.list(productLambdaQueryWrapper);
        List<Long> ids = productList.stream().map(Product::getId).toList();

        for (Long id : ids) {
            ProductDTO productDTO = ProductDTO
                    .builder()
                    .id(id)
                    .specIds(List.of(5L, 9L, 15L, 27L))
                    .build();

            productService.edit(productDTO);
        }*/

    }

}
