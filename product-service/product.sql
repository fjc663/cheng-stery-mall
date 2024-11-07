DROP DATABASE IF EXISTS `csm-product`;
create database `csm-product` character set utf8mb4 collate utf8mb4_general_ci;
use `csm-product`;


DROP TABLE IF EXISTS `product`;
create table product
(
    id          bigint unsigned auto_increment comment '商品ID'
        primary key,
    name        varchar(255)                             not null comment '商品名称',
    description text                                     null comment '商品描述',
    price       decimal(10, 2) default 0.00              not null comment '商品价格',
    stock       int unsigned   default 0                 not null comment '商品库存',
    category_id bigint unsigned                          not null comment '分类ID',
    status      tinyint(1)     default 1                 not null comment '商品状态（1=上架，0=下架）',
    sales       int unsigned   default 0                 not null comment '商品销量',
    image_url   varchar(255)                             null comment '商品图片地址',
    created_at  timestamp      default CURRENT_TIMESTAMP null comment '创建时间',
    updated_at  timestamp      default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    created_by  bigint unsigned                          not null comment '创建用户ID',
    updated_by  bigint unsigned                          not null comment '更新用户ID',
    constraint name
        unique (name),
    constraint fk_category
        foreign key (category_id) references `csm-category`.category (id)
)
    comment '商品表' engine = InnoDB
                     charset = utf8mb4;

INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (1, '红酒 A', '优质红酒，进口自法国.优质红酒，进口自法国.优质红酒，进口自法国.优质红酒，进口自法国.优质红酒，进口自法国', 120.00, 100, 2, 1, 131, 'http://localhost:8080/product/jiu/1.png', '2024-09-17 10:20:30', '2024-10-04 21:53:38', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (2, '白酒 A', '白酒，国产名牌', 80.00, 200, 3, 1, 30, 'http://localhost:8080/product/jiu/2.png', '2024-09-17 10:20:30', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (3, '啤酒 A', '进口啤酒，口感清爽', 12.00, 500, 4, 1, 300, 'http://localhost:8080/product/jiu/3.png', '2024-09-17 10:20:30', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (4, '果汁 A', '新鲜果汁，健康无添加', 10.00, 400, 7, 1, 100, 'http://localhost:8080/product/guozhi/1.png', '2024-09-17 10:20:30', '2024-10-04 20:10:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (5, '牛奶 A', '纯天然牛奶，营养丰富', 8.00, 600, 38, 1, 250, 'http://localhost:8080/product/niunai/1.png', '2024-09-17 10:20:30', '2024-10-04 21:10:19', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (6, '薯片 A', '脆脆的薯片，口感丰富', 5.00, 993, 10, 1, 707, 'http://localhost:8080/product/shupian/1.png', '2024-09-17 10:20:30', '2024-10-05 14:10:56', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (7, '巧克力 A', '进口巧克力，甜美可口', 15.00, 300, 12, 1, 150, 'http://localhost:8080/product/qiaokeli/1.png', '2024-09-17 10:20:30', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (8, '冰箱 A', '双开门冰箱，制冷效果好', 3000.00, 50, 15, 1, 20, 'http://localhost:8080/product/bingxiang/1.png', '2024-09-17 10:20:30', '2024-10-04 21:57:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (9, '洗衣机 A', '全自动洗衣机，省水省电', 2000.00, 60, 16, 1, 25, 'http://localhost:8080/product/xiyiji/1.png', '2024-09-17 10:20:30', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (10, '空调 A', '大功率空调，制冷快速', 2500.00, 40, 17, 1, 18, 'http://localhost:8080/product/kongtiao/1.png', '2024-09-17 10:20:30', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (11, '笔记本电脑 A', '轻薄型笔记本，性能强劲', 5000.00, 100, 20, 1, 60, 'http://localhost:8080/product/diannao/1.png', '2024-09-17 10:20:30', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (12, '智能手机 A', '新款智能手机，流畅运行', 3000.00, 199, 24, 1, 120, 'http://localhost:8080/product/shouji/1.png', '2024-09-17 10:20:30', '2024-10-05 14:12:08', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (13, '男装 A', '男士休闲服饰，舒适时尚', 150.00, 298, 28, 1, 180, 'http://localhost:8080/product/fuzhuang/1.png', '2024-09-17 10:20:30', '2024-10-05 14:11:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (14, '女装 A', '女士时尚服饰，优雅大方', 180.00, 250, 29, 1, 140, 'http://localhost:8080/product/fuzhuang/2.png', '2024-09-17 10:20:30', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (15, '童装 A', '儿童服装，柔软舒适', 80.00, 400, 30, 1, 230, 'http://localhost:8080/product/fuzhuang/3.png', '2024-09-17 10:20:30', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (16, '红酒 B', '高档红酒，浓郁香醇', 150.00, 80, 2, 1, 40, 'http://localhost:8080/product/jiu/4.png', '2024-09-17 10:20:30', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (17, '白酒 B', '名牌白酒，口感醇厚', 90.00, 180, 3, 1, 25, 'http://localhost:8080/product/jiu/5.png', '2024-09-17 10:20:30', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (18, '啤酒 B', '本地啤酒，畅爽体验', 10.00, 600, 4, 1, 350, 'http://localhost:8080/product/jiu/6.png', '2024-09-17 10:20:30', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (19, '果汁 B', '有机果汁，健康选择', 12.00, 350, 7, 1, 90, 'http://localhost:8080/product/guozhi/2.png', '2024-09-17 10:20:30', '2024-10-04 20:10:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (20, '牛奶 B', '鲜奶，奶味浓郁', 9.00, 547, 38, 1, 223, 'http://localhost:8080/product/niunai/2.png', '2024-09-17 10:20:30', '2024-10-05 14:10:53', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (21, '薯片 B', '口味多样，咸甜适中', 6.00, 900, 10, 1, 600, 'http://localhost:8080/product/shupian/2.png', '2024-09-17 10:20:30', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (22, '巧克力 B', '高档巧克力，入口即化', 18.00, 280, 12, 1, 140, 'http://localhost:8080/product/qiaokeli/2.png', '2024-09-17 10:20:30', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (23, '冰箱 B', '大容量冰箱，耐用可靠', 3200.00, 55, 15, 1, 22, 'http://localhost:8080/product/bingxiang/2.png', '2024-09-17 10:20:30', '2024-10-04 21:57:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (24, '洗衣机 B', '滚筒洗衣机，性能稳定', 2200.00, 70, 16, 1, 28, 'http://localhost:8080/product/xiyiji/2.png', '2024-09-17 10:20:30', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (25, '空调 B', '小型空调，节能高效', 2300.00, 45, 17, 1, 16, 'http://localhost:8080/product/kongtiao/2.png', '2024-09-17 10:20:30', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (26, '笔记本电脑 B', '高性能笔记本，游戏办公两不误', 5500.00, 90, 20, 1, 50, 'http://localhost:8080/product/diannao/2.png', '2024-09-17 10:20:30', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (27, '智能手机 B', '旗舰款智能手机，超长续航', 3500.00, 180, 24, 1, 110, 'http://localhost:8080/product/shouji/2.png', '2024-09-17 10:20:30', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (28, '男装 B', '男士正装，商务场合必备', 200.00, 280, 28, 1, 170, 'http://localhost:8080/product/fuzhuang/4.png', '2024-09-17 10:20:30', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (29, '女装 B', '女士连衣裙，优雅迷人', 220.00, 228, 29, 1, 130, 'http://localhost:8080/product/fuzhuang/5.png', '2024-09-17 10:20:30', '2024-10-05 14:12:41', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (30, '童装 B', '儿童外套，时尚耐穿', 100.00, 370, 30, 1, 210, 'http://localhost:8080/product/fuzhuang/6.png', '2024-09-17 10:20:30', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (31, '电视 A', '高清电视，支持4K显示', 3200.00, 100, 18, 1, 60, 'http://localhost:8080/product/dianshi/1.png', '2024-09-17 10:22:21', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (32, '冰箱 C', '智能冰箱，支持WiFi连接', 3800.00, 45, 15, 1, 22, 'http://localhost:8080/product/bingxiang/3.png', '2024-09-17 10:22:21', '2024-10-04 21:57:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (33, '洗衣机 C', '滚筒式洗衣机，高效节能', 2600.00, 65, 16, 1, 27, 'http://localhost:8080/product/xiyiji/3.png', '2024-09-17 10:22:21', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (34, '空调 C', '大功率空调，适合大空间', 2800.00, 30, 17, 1, 25, 'http://localhost:8080/product/kongtiao/3.png', '2024-09-17 10:22:21', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (35, '智能手表 A', '多功能智能手表，支持心率监测', 800.00, 148, 25, 1, 100, 'http://localhost:8080/product/shoubiao/1.png', '2024-09-17 10:22:21', '2024-10-05 14:11:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (36, '耳机 A', '无线耳机，音质清晰', 300.00, 400, 22, 1, 250, 'http://localhost:8080/product/erji/1.png', '2024-09-17 10:22:21', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (37, '键盘 A', '机械键盘，打字体验极佳', 500.00, 200, 21, 1, 150, 'http://localhost:8080/product/jianpanshubiao/1.png', '2024-09-17 10:22:21', '2024-10-04 19:49:51', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (38, '鼠标 A', '游戏鼠标，反应灵敏', 200.00, 350, 21, 1, 180, 'http://localhost:8080/product/jianpanshubiao/6.png', '2024-09-17 10:22:21', '2024-10-04 19:50:23', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (39, '显示器 A', '27寸曲面显示器，护眼模式', 1800.00, 100, 39, 1, 80, 'http://localhost:8080/product/xianshiqi/1.png', '2024-09-17 10:22:21', '2024-10-04 21:47:32', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (40, '家用空调 A', '变频空调，制冷快', 3200.00, 80, 17, 1, 35, 'http://localhost:8080/product/kongtiao/4.png', '2024-09-17 10:22:21', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (41, '红酒 C', '高档红酒，醇香四溢', 140.00, 60, 2, 1, 38, 'http://localhost:8080/product/jiu/7.png', '2024-09-17 10:22:21', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (42, '白酒 C', '国产白酒，纯粮酿造', 85.00, 150, 3, 1, 20, 'http://localhost:8080/product/jiu/8.png', '2024-09-17 10:22:21', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (43, '啤酒 C', '进口啤酒，纯正口感', 11.00, 550, 4, 1, 280, 'http://localhost:8080/product/jiu/9.png', '2024-09-17 10:22:21', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (44, '果汁 C', '新鲜果汁，低糖低卡', 9.00, 300, 7, 1, 95, 'http://localhost:8080/product/guozhi/3.png', '2024-09-17 10:22:21', '2024-10-04 20:10:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (45, '牛奶 C', '有机牛奶，健康之选', 7.50, 500, 38, 1, 230, 'http://localhost:8080/product/niunai/3.png', '2024-09-17 10:22:21', '2024-10-04 21:10:18', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (46, '薯片 C', '薯片，咸香酥脆', 5.50, 950, 10, 1, 610, 'http://localhost:8080/product/shupian/3.png', '2024-09-17 10:22:21', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (47, '巧克力 C', '手工巧克力，香浓甜美', 16.00, 270, 12, 1, 135, 'http://localhost:8080/product/qiaokeli/3.png', '2024-09-17 10:22:21', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (48, '笔记本电脑 C', '商务笔记本，续航超强', 4800.00, 110, 20, 1, 72, 'http://localhost:8080/product/diannao/3.png', '2024-09-17 10:22:21', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (49, '智能手机 C', '旗舰款智能手机，超大屏幕', 3400.00, 190, 24, 1, 108, 'http://localhost:8080/product/shouji/3.png', '2024-09-17 10:22:21', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (50, '男装 C', '男士商务西装，剪裁合身', 220.00, 270, 28, 1, 160, 'http://localhost:8080/product/fuzhuang/7.png', '2024-09-17 10:22:21', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (51, '女装 C', '女士夏季连衣裙，清爽透气', 170.00, 230, 29, 1, 120, 'http://localhost:8080/product/fuzhuang/8.png', '2024-09-17 10:22:21', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (52, '童装 C', '儿童T恤，夏季新款', 90.00, 350, 30, 1, 220, 'http://localhost:8080/product/fuzhuang/9.png', '2024-09-17 10:22:21', '2024-10-04 19:26:25', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (53, '红酒 D', '进口红酒，浓郁果香', 160.00, 55, 2, 1, 42, 'http://localhost:8080/product/jiu/10.png', '2024-09-17 10:22:21', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (54, '白酒 D', '高端白酒，陈酿十年', 95.00, 140, 3, 1, 28, 'http://localhost:8080/product/jiu/1.png', '2024-09-17 10:22:21', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (55, '啤酒 D', '清爽型啤酒，夏季必备', 12.50, 510, 4, 1, 300, 'http://localhost:8080/product/jiu/2.png', '2024-09-17 10:22:21', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (56, '果汁 D', '混合果汁，富含维生素', 11.00, 320, 7, 1, 85, 'http://localhost:8080/product/guozhi/4.png', '2024-09-17 10:22:21', '2024-10-04 20:10:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (57, '牛奶 D', '脱脂牛奶，低脂肪', 9.00, 490, 38, 1, 210, 'http://localhost:8080/product/niunai/4.png', '2024-09-17 10:22:21', '2024-10-04 21:10:19', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (58, '薯片 D', '多口味薯片，畅享美味', 6.00, 910, 10, 1, 590, 'http://localhost:8080/product/shupian/4.png', '2024-09-17 10:22:21', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (59, '巧克力 D', '浓郁巧克力，融化于口', 20.00, 260, 12, 1, 128, 'http://localhost:8080/product/qiaokeli/4.png', '2024-09-17 10:22:21', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (60, '冰箱 D', '大容量双开门冰箱，节能环保', 3400.00, 50, 15, 1, 24, 'http://localhost:8080/product/bingxiang/4.png', '2024-09-17 10:22:21', '2024-10-04 21:57:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (61, '洗衣机 D', '智能洗衣机，自动烘干', 2700.00, 70, 16, 1, 32, 'http://localhost:8080/product/xiyiji/4.png', '2024-09-17 10:22:21', '2024-10-04 19:54:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (62, '智能手表 B', '时尚智能手表，全天候健康监测', 850.00, 140, 25, 1, 120, 'http://localhost:8080/product/shoubiao/2.png', '2024-09-17 10:41:34', '2024-10-04 20:18:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (63, '耳机 B', '降噪无线耳机，高清音质', 320.00, 378, 22, 1, 180, 'http://localhost:8080/product/erji/2.png', '2024-09-17 10:41:34', '2024-10-05 14:12:41', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (64, '键盘 B', '背光机械键盘，适合游戏玩家', 520.00, 190, 21, 1, 150, 'http://localhost:8080/product/jianpanshubiao/2.png', '2024-09-17 10:41:34', '2024-10-04 19:49:51', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (65, '鼠标 B', '专业游戏鼠标，超快速响应', 210.00, 340, 21, 1, 160, 'http://localhost:8080/product/jianpanshubiao/7.png', '2024-09-17 10:41:34', '2024-10-04 19:50:23', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (66, '显示器 B', '32寸4K高清显示器，支持HDR', 2500.00, 80, 39, 1, 85, 'http://localhost:8080/product/xianshiqi/2.png', '2024-09-17 10:41:34', '2024-10-04 21:47:32', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (67, '电视 B', '55寸智能电视，超高清画质', 4000.00, 90, 18, 1, 50, 'http://localhost:8080/product/dianshi/2.png', '2024-09-17 10:41:34', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (68, '冰箱 E', '三门冰箱，大容量节能', 3000.00, 55, 15, 1, 22, 'http://localhost:8080/product/bingxiang/5.png', '2024-09-17 10:41:34', '2024-10-04 21:57:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (69, '洗衣机 E', '滚筒式洗衣机，带烘干功能', 2800.00, 65, 16, 1, 25, 'http://localhost:8080/product/xiyiji/5.png', '2024-09-17 10:41:34', '2024-10-04 19:54:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (70, '空调 E', '中央空调，强劲制冷', 4500.00, 40, 17, 1, 18, 'http://localhost:8080/product/kongtiao/5.png', '2024-09-17 10:41:34', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (71, '红酒 E', '高档红酒，口感醇厚', 180.00, 60, 2, 1, 40, 'http://localhost:8080/product/jiu/3.png', '2024-09-17 10:41:34', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (72, '白酒 E', '年份白酒，口感纯正', 130.00, 140, 3, 1, 33, 'http://localhost:8080/product/jiu/4.png', '2024-09-17 10:41:34', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (73, '啤酒 E', '进口啤酒，浓香顺滑', 20.00, 600, 4, 1, 450, 'http://localhost:8080/product/jiu/5.png', '2024-09-17 10:41:34', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (74, '果汁 E', '有机果汁，无添加', 15.00, 300, 7, 1, 140, 'http://localhost:8080/product/guozhi/5.png', '2024-09-17 10:41:34', '2024-10-04 20:10:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (75, '牛奶 E', '高钙牛奶，适合各年龄段', 9.50, 500, 38, 1, 300, 'http://localhost:8080/product/niunai/5.png', '2024-09-17 10:41:34', '2024-10-04 21:10:19', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (76, '薯片 E', '经典薯片，多种口味可选', 6.50, 898, 10, 1, 752, 'http://localhost:8080/product/shupian/5.png', '2024-09-17 10:41:34', '2024-10-04 20:12:06', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (77, '巧克力 E', '黑巧克力，口感浓郁', 25.00, 265, 12, 1, 165, 'http://localhost:8080/product/qiaokeli/5.png', '2024-09-17 10:41:34', '2024-10-04 20:09:39', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (78, '智能手机 E', '最新款智能手机，全面屏设计', 3900.00, 170, 24, 1, 120, 'http://localhost:8080/product/shouji/4.png', '2024-09-17 10:41:34', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (79, '笔记本电脑 E', '高端笔记本，适合设计和编程', 6000.00, 95, 20, 1, 80, 'http://localhost:8080/product/diannao/4.png', '2024-09-17 10:41:34', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (80, '电视 C', '75寸智能电视，支持8K显示', 8500.00, 50, 18, 1, 30, 'http://localhost:8080/product/dianshi/3.png', '2024-09-17 10:41:34', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (81, '耳机 C', '蓝牙耳机，降噪效果出色', 350.00, 350, 22, 1, 200, 'http://localhost:8080/product/erji/3.png', '2024-09-17 10:41:34', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (82, '洗衣机 F', '洗烘一体机，支持APP远程控制', 3200.00, 55, 16, 1, 35, 'http://localhost:8080/product/xiyiji/6.png', '2024-09-17 10:41:34', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (83, '空调 F', '壁挂式空调，支持智能调节', 2900.00, 45, 17, 1, 22, 'http://localhost:8080/product/kongtiao/6.png', '2024-09-17 10:41:34', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (84, '电视 D', '60寸电视，4K超高清', 3700.00, 85, 18, 1, 60, 'http://localhost:8080/product/dianshi/4.png', '2024-09-17 10:41:34', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (85, '冰箱 F', '双开门冰箱，低耗能', 3100.00, 60, 15, 1, 50, 'http://localhost:8080/product/bingxiang/6.png', '2024-09-17 10:41:34', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (86, '耳机 D', '有线耳机，音质清晰', 120.00, 480, 22, 1, 260, 'http://localhost:8080/product/erji/4.png', '2024-09-17 10:41:34', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (87, '键盘 C', '防水机械键盘，耐用性强', 450.00, 190, 21, 1, 100, 'http://localhost:8080/product/jianpanshubiao/3.png', '2024-09-17 10:41:34', '2024-10-04 19:49:51', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (88, '鼠标 C', '轻便无线鼠标，电池耐用', 150.00, 370, 21, 1, 150, 'http://localhost:8080/product/jianpanshubiao/8.png', '2024-09-17 10:41:34', '2024-10-04 19:50:23', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (89, '显示器 C', '24寸全高清显示器，适合办公', 1500.00, 120, 39, 1, 65, 'http://localhost:8080/product/xianshiqi/3.png', '2024-09-17 10:41:34', '2024-10-04 21:47:32', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (90, '智能手机 F', '曲面屏智能手机，支持5G', 4100.00, 130, 24, 1, 110, 'http://localhost:8080/product/shouji/5.png', '2024-09-17 10:41:34', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (91, '笔记本电脑 F', '轻薄笔记本，支持触屏操作', 5800.00, 85, 20, 1, 95, 'http://localhost:8080/product/diannao/5.png', '2024-09-17 10:41:34', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (92, '冰箱 G', '智能冰箱，支持语音控制', 4000.00, 70, 15, 1, 40, 'http://localhost:8080/product/bingxiang/7.png', '2024-09-17 10:41:34', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (93, '洗衣机 G', '全自动洗衣机，智能节水', 2900.00, 50, 16, 1, 45, 'http://localhost:8080/product/xiyiji/7.png', '2024-09-17 10:41:34', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (94, '空调 G', '节能型空调，快速制冷', 3200.00, 60, 17, 1, 20, 'http://localhost:8080/product/kongtiao/7.png', '2024-09-17 10:41:34', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (95, '红酒 F', '经典红酒，适合宴会和礼品', 250.00, 70, 2, 1, 48, 'http://localhost:8080/product/jiu/6.png', '2024-09-17 10:41:34', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (96, '白酒 F', '老字号白酒，纯正口感', 150.00, 180, 3, 1, 28, 'http://localhost:8080/product/jiu/7.png', '2024-09-17 10:41:34', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (97, '啤酒 F', '瓶装啤酒，清爽口感', 15.00, 600, 4, 1, 420, 'http://localhost:8080/product/jiu/8.png', '2024-09-17 10:41:34', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (98, '果汁 F', '纯果汁，无添加糖', 12.00, 280, 7, 1, 115, 'http://localhost:8080/product/guozhi/6.png', '2024-09-17 10:41:34', '2024-10-04 20:10:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (99, '牛奶 F', '儿童牛奶，富含钙和维生素', 10.50, 460, 38, 1, 280, 'http://localhost:8080/product/niunai/6.png', '2024-09-17 10:41:34', '2024-10-04 21:10:19', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (100, '薯片 F', '低脂薯片，适合健身人士', 7.50, 780, 10, 1, 620, 'http://localhost:8080/product/shupian/6.png', '2024-09-17 10:41:34', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (101, '巧克力 F', '果仁巧克力，口感丰富', 30.00, 246, 12, 1, 139, 'http://localhost:8080/product/qiaokeli/6.png', '2024-09-17 10:41:34', '2024-10-04 20:09:39', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (102, '智能手表 G', '新款运动手表，防水防尘', 1100.00, 130, 25, 1, 110, 'http://localhost:8080/product/shoubiao/3.png', '2024-09-17 10:41:34', '2024-10-04 20:18:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (103, '笔记本电脑 G', '商务笔记本，性能稳定', 6200.00, 75, 20, 1, 85, 'http://localhost:8080/product/diannao/6.png', '2024-09-17 10:41:34', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (104, '电视 F', '85寸电视，支持8K播放', 9200.00, 40, 18, 1, 35, 'http://localhost:8080/product/dianshi/5.png', '2024-09-17 10:41:34', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (105, '耳机 F', '高保真耳机，带麦克风', 500.00, 310, 22, 1, 180, 'http://localhost:8080/product/erji/5.png', '2024-09-17 10:41:34', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (106, '显示器 D', '28寸显示器，支持HDR10', 1800.00, 90, 39, 1, 75, 'http://localhost:8080/product/xianshiqi/4.png', '2024-09-17 10:41:34', '2024-10-04 21:47:33', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (221, '智能手表 H', '高端智能手表，全天候心率监测', 1400.00, 90, 25, 1, 95, 'http://localhost:8080/product/shoubiao/4.png', '2024-09-17 10:47:43', '2024-10-04 20:18:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (222, '耳机 G', '降噪耳机，适合长时间佩戴', 360.00, 280, 22, 1, 190, 'http://localhost:8080/product/erji/6.png', '2024-09-17 10:47:43', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (223, '键盘 F', '超薄机械键盘，极致手感', 650.00, 170, 21, 1, 160, 'http://localhost:8080/product/jianpanshubiao/4.png', '2024-09-17 10:47:43', '2024-10-04 19:49:51', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (224, '鼠标 F', '无线办公鼠标，适合各类场景', 180.00, 320, 21, 1, 140, 'http://localhost:8080/product/jianpanshubiao/9.png', '2024-09-17 10:47:43', '2024-10-04 19:50:23', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (225, '显示器 E', '27寸显示器，4K分辨率，广色域', 2000.00, 100, 39, 1, 90, 'http://localhost:8080/product/xianshiqi/5.png', '2024-09-17 10:47:43', '2024-10-04 21:47:33', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (226, '冰箱 L', '四门冰箱，风冷无霜', 3800.00, 65, 15, 1, 35, 'http://localhost:8080/product/bingxiang/8.png', '2024-09-17 10:47:43', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (227, '洗衣机 H', '带烘干功能的全自动洗衣机', 3000.00, 45, 16, 1, 40, 'http://localhost:8080/product/xiyiji/8.png', '2024-09-17 10:47:43', '2024-10-04 19:54:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (228, '空调 H', '1.5匹壁挂空调，静音省电', 2400.00, 50, 17, 1, 25, 'http://localhost:8080/product/kongtiao/8.png', '2024-09-17 10:47:43', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (229, '红酒 I', '法国红酒，口感饱满', 260.00, 55, 2, 1, 50, 'http://localhost:8080/product/jiu/9.png', '2024-09-17 10:47:43', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (230, '白酒 G', '高度白酒，传统工艺酿造', 180.00, 120, 3, 1, 40, 'http://localhost:8080/product/jiu/10.png', '2024-09-17 10:47:43', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (231, '啤酒 G', '德式啤酒，香气浓郁', 28.00, 680, 4, 1, 480, 'http://localhost:8080/product/jiu/1.png', '2024-09-17 10:47:43', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (232, '果汁 G', '纯果汁，健康无糖', 18.50, 320, 7, 1, 150, 'http://localhost:8080/product/guozhi/7.png', '2024-09-17 10:47:43', '2024-10-04 20:10:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (233, '牛奶 G', '草饲牛奶，营养丰富', 12.50, 520, 38, 1, 310, 'http://localhost:8080/product/niunai/7.png', '2024-09-17 10:47:43', '2024-10-04 21:10:18', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (234, '薯片 G', '烤制薯片，低油健康', 8.50, 738, 10, 1, 672, 'http://localhost:8080/product/shupian/7.png', '2024-09-17 10:47:43', '2024-10-04 20:12:06', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (235, '巧克力 G', '白巧克力，丝滑口感', 32.00, 240, 12, 1, 130, 'http://localhost:8080/product/qiaokeli/7.png', '2024-09-17 10:47:43', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (236, '智能手机 H', '全面屏智能手机，超长续航', 4800.00, 150, 24, 1, 135, 'http://localhost:8080/product/shouji/6.png', '2024-09-17 10:47:43', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (237, '笔记本电脑 H', '超高性能笔记本，适合商务办公', 7200.00, 67, 20, 1, 88, 'http://localhost:8080/product/diannao/7.png', '2024-09-17 10:47:43', '2024-10-04 21:58:45', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (238, '电视 G', '65寸OLED电视，画质细腻', 8800.00, 55, 18, 1, 40, 'http://localhost:8080/product/dianshi/6.png', '2024-09-17 10:47:43', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (239, '冰箱 H', '大容量双开门冰箱，变频节能', 4200.00, 60, 15, 1, 45, 'http://localhost:8080/product/bingxiang/9.png', '2024-09-17 10:47:43', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (240, '耳机 H', '蓝牙耳机，带充电盒', 390.00, 290, 22, 1, 210, 'http://localhost:8080/product/erji/7.png', '2024-09-17 10:47:43', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (241, '洗衣机 I', '节能型滚筒洗衣机', 2700.00, 50, 16, 1, 30, 'http://localhost:8080/product/xiyiji/9.png', '2024-09-17 10:47:43', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (242, '空调 I', '立式空调，支持远程控制', 3600.00, 35, 17, 1, 15, 'http://localhost:8080/product/kongtiao/9.png', '2024-09-17 10:47:43', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (243, '智能手机 I', '大屏手机，强劲性能', 5400.00, 110, 24, 1, 125, 'http://localhost:8080/product/shouji/7.png', '2024-09-17 10:47:43', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (244, '笔记本电脑 I', '工作站笔记本，支持多屏', 8200.00, 50, 20, 1, 60, 'http://localhost:8080/product/diannao/8.png', '2024-09-17 10:47:43', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (245, '耳机 I', '耳挂式运动耳机', 250.00, 400, 22, 1, 220, 'http://localhost:8080/product/erji/8.png', '2024-09-17 10:47:43', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (246, '红酒 H', '年份红酒，口感复杂', 320.00, 50, 2, 1, 45, 'http://localhost:8080/product/jiu/2.png', '2024-09-17 10:47:43', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (247, '白酒 H', '老酒，深厚香味', 240.00, 100, 3, 1, 50, 'http://localhost:8080/product/jiu/3.png', '2024-09-17 10:47:43', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (248, '啤酒 H', '瓶装精酿啤酒', 38.00, 560, 4, 1, 420, 'http://localhost:8080/product/jiu/4.png', '2024-09-17 10:47:43', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (249, '果汁 H', '冷榨果汁，保留营养', 20.00, 240, 7, 1, 135, 'http://localhost:8080/product/guozhi/8.png', '2024-09-17 10:47:43', '2024-10-04 20:10:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (250, '牛奶 H', '全脂牛奶，富含维生素D', 14.00, 480, 38, 1, 290, 'http://localhost:8080/product/niunai/8.png', '2024-09-17 10:47:43', '2024-10-04 21:10:18', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (251, '薯片 H', '脆烤薯片，低卡路里', 10.00, 720, 10, 1, 640, 'http://localhost:8080/product/shupian/8.png', '2024-09-17 10:47:43', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (252, '巧克力 H', '夹心巧克力，丰富口感', 38.00, 220, 12, 1, 140, 'http://localhost:8080/product/qiaokeli/8.png', '2024-09-17 10:47:43', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (253, '智能手机 J', '旗舰智能手机，快速充电', 5200.00, 118, 24, 1, 132, 'http://localhost:8080/product/shouji/8.png', '2024-09-17 10:47:43', '2024-10-05 14:10:53', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (254, '笔记本电脑 J', '轻薄笔记本，超高分辨率屏幕', 6800.00, 65, 20, 1, 90, 'http://localhost:8080/product/diannao/9.png', '2024-09-17 10:47:43', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (255, '耳机 J', '高保真音乐耳机', 430.00, 270, 22, 1, 180, 'http://localhost:8080/product/erji/9.png', '2024-09-17 10:47:43', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (256, '显示器 F', '34寸超宽屏显示器，游戏玩家首选', 3000.00, 85, 39, 1, 70, 'http://localhost:8080/product/xianshiqi/6.png', '2024-09-17 10:47:43', '2024-10-04 21:47:33', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (257, '冰箱 I', '风冷冰箱，节能省电', 4500.00, 55, 15, 1, 50, 'http://localhost:8080/product/bingxiang/10.png', '2024-09-17 10:47:43', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (258, '洗衣机 J', '变频洗衣机，带智能调节功能', 3400.00, 40, 16, 1, 35, 'http://localhost:8080/product/xiyiji/10.png', '2024-09-17 10:47:43', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (370, '洗衣机 Z', '变频洗衣机，带智能调节功能', 3400.00, 40, 16, 1, 35, 'http://localhost:8080/product/xiyiji/1.png', '2024-09-17 10:53:41', '2024-10-04 21:31:13', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (371, '空调 J', '智能空调，支持自动清洁', 3500.00, 50, 17, 1, 20, 'http://localhost:8080/product/kongtiao/10.png', '2024-09-17 10:53:41', '2024-10-04 21:31:27', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (372, '智能手表 I', '高精度智能手表，支持多种运动模式', 1550.00, 85, 25, 1, 80, 'http://localhost:8080/product/shoubiao/5.png', '2024-09-17 10:53:41', '2024-10-04 21:31:42', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (373, '耳机 K', '无线耳机，舒适贴合', 420.00, 300, 22, 1, 190, 'http://localhost:8080/product/erji/10.png', '2024-09-17 10:53:41', '2024-10-04 21:59:44', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (374, '键盘 G', '多功能机械键盘，支持宏定义', 700.00, 160, 21, 1, 170, 'http://localhost:8080/product/jianpanshubiao/5.png', '2024-09-17 10:53:41', '2024-10-04 19:49:51', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (375, '鼠标 G', '高精度游戏鼠标，适合竞技游戏', 230.00, 300, 21, 1, 190, 'http://localhost:8080/product/jianpanshubiao/10.png', '2024-09-17 10:53:41', '2024-10-04 19:50:23', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (376, '显示器 G', '32寸曲面显示器，适合游戏玩家', 2800.00, 70, 39, 1, 55, 'http://localhost:8080/product/xianshiqi/7.png', '2024-09-17 10:53:41', '2024-10-04 21:47:33', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (377, '冰箱 J', '多门智能冰箱，支持联网功能', 4200.00, 60, 15, 1, 40, 'http://localhost:8080/product/bingxiang/1.png', '2024-09-17 10:53:41', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (378, '洗衣机 K', '全自动洗衣机，支持智能控制', 3100.00, 50, 16, 1, 38, 'http://localhost:8080/product/xiyiji/2.png', '2024-09-17 10:53:41', '2024-10-04 19:54:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (379, '空调 K', '冷暖空调，节能高效', 3400.00, 55, 17, 1, 25, 'http://localhost:8080/product/kongtiao/1.png', '2024-09-17 10:53:41', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (380, '红酒 Z', '葡萄酒，口感柔顺', 290.00, 65, 2, 1, 42, 'http://localhost:8080/product/jiu/5.png', '2024-09-17 10:53:41', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (381, '白酒 I', '白酒，口感浓烈', 200.00, 140, 3, 1, 35, 'http://localhost:8080/product/jiu/6.png', '2024-09-17 10:53:41', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (382, '啤酒 I', '纯麦啤酒，泡沫丰富', 22.00, 620, 4, 1, 500, 'http://localhost:8080/product/jiu/7.png', '2024-09-17 10:53:41', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (383, '果汁 I', '浓缩果汁，纯天然', 17.00, 290, 7, 1, 145, 'http://localhost:8080/product/guozhi/9.png', '2024-09-17 10:53:41', '2024-10-04 20:10:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (384, '牛奶 I', '无糖牛奶，适合减肥人士', 11.50, 540, 38, 1, 300, 'http://localhost:8080/product/niunai/9.png', '2024-09-17 10:53:41', '2024-10-04 21:10:19', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (385, '薯片 I', '健康薯片，低盐少油', 9.00, 760, 10, 1, 690, 'http://localhost:8080/product/shupian/9.png', '2024-09-17 10:53:41', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (386, '巧克力 I', '黑巧克力，适合成人', 35.00, 270, 12, 1, 140, 'http://localhost:8080/product/qiaokeli/9.png', '2024-09-17 10:53:41', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (387, '智能手机 Z', '高性能智能手机，适合游戏', 5000.00, 140, 24, 1, 130, 'http://localhost:8080/product/shouji/9.png', '2024-09-17 10:53:41', '2024-10-04 22:00:50', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (388, '笔记本电脑 K', '轻薄笔记本，适合移动办公', 6500.00, 85, 20, 1, 95, 'http://localhost:8080/product/diannao/10.png', '2024-09-17 10:53:41', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (389, '电视 H', '85寸智能电视，超高清画质', 9500.00, 45, 18, 1, 50, 'http://localhost:8080/product/dianshi/7.png', '2024-09-17 10:53:41', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (390, '耳机 L', '运动蓝牙耳机，防水设计', 370.00, 300, 22, 1, 200, 'http://localhost:8080/product/erji/1.png', '2024-09-17 10:53:41', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (391, '显示器 H', '27寸高刷新率显示器，适合电竞', 2500.00, 75, 39, 1, 80, 'http://localhost:8080/product/xianshiqi/8.png', '2024-09-17 10:53:41', '2024-10-04 21:47:33', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (392, '冰箱 K', '双开门冰箱，智能调节温度', 4300.00, 55, 15, 1, 48, 'http://localhost:8080/product/bingxiang/2.png', '2024-09-17 10:53:41', '2024-10-04 21:57:37', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (393, '洗衣机 L', '滚筒洗衣机，静音节能', 2900.00, 40, 16, 1, 42, 'http://localhost:8080/product/xiyiji/3.png', '2024-09-17 10:53:41', '2024-10-04 19:54:15', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (394, '空调 L', '智能冷暖空调，支持语音控制', 3700.00, 45, 17, 1, 30, 'http://localhost:8080/product/kongtiao/2.png', '2024-09-17 10:53:41', '2024-10-04 19:19:17', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (395, '红酒 J', '年份红酒，适合收藏', 340.00, 60, 2, 1, 55, 'http://localhost:8080/product/jiu/8.png', '2024-09-17 10:53:41', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (396, '白酒 J', '传统白酒，浓烈醇香', 220.00, 130, 3, 1, 48, 'http://localhost:8080/product/jiu/9.png', '2024-09-17 10:53:41', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (397, '啤酒 J', '清爽啤酒，适合聚会', 25.00, 640, 4, 1, 510, 'http://localhost:8080/product/jiu/10.png', '2024-09-17 10:53:41', '2024-10-04 21:53:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (398, '果汁 J', '新鲜果汁，保留原汁原味', 19.00, 300, 7, 1, 150, 'http://localhost:8080/product/guozhi/10.png', '2024-09-17 10:53:41', '2024-10-04 20:10:36', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (399, '牛奶 J', '高蛋白牛奶，增强体力', 13.00, 500, 38, 1, 320, 'http://localhost:8080/product/niunai/10.png', '2024-09-17 10:53:41', '2024-10-04 21:10:18', 1, 9);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (400, '薯片 J', '原味薯片，口感酥脆', 11.00, 780, 10, 1, 710, 'http://localhost:8080/product/shupian/10.png', '2024-09-17 10:53:41', '2024-10-04 20:12:06', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (401, '巧克力 J', '牛奶巧克力，甜蜜口感', 36.00, 260, 12, 1, 150, 'http://localhost:8080/product/qiaokeli/10.png', '2024-09-17 10:53:41', '2024-10-04 20:09:39', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (402, '智能手表 J', '运动智能手表，支持多种运动模式', 1600.00, 75, 25, 1, 70, 'http://localhost:8080/product/shoubiao/6.png', '2024-09-17 10:53:41', '2024-10-04 20:18:14', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (403, '笔记本电脑 L', '高效能笔记本，适合编程使用', 7000.00, 60, 20, 1, 70, 'http://localhost:8080/product/diannao/1.png', '2024-09-17 10:53:41', '2024-10-04 21:58:45', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (404, '电视 I', '70寸智能电视，4K画质', 7800.00, 50, 18, 1, 55, 'http://localhost:8080/product/dianshi/8.png', '2024-09-17 10:53:41', '2024-10-04 19:55:10', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (405, '耳机 M', '耳机，舒适佩戴', 440.00, 320, 22, 1, 220, 'http://localhost:8080/product/erji/2.png', '2024-09-17 10:53:41', '2024-10-04 21:59:44', 1, 1);
INSERT INTO product (id, name, description, price, stock, category_id, status, sales, image_url, created_at, updated_at, created_by, updated_by) VALUES (406, '显示器 I', '34寸超宽显示器，适合设计', 3200.00, 65, 39, 1, 65, 'http://localhost:8080/product/xianshiqi/9.png', '2024-09-17 10:53:41', '2024-10-04 21:47:33', 1, 9);


DROP TABLE IF EXISTS `featured_product`;
create table featured_product
(
    id            bigint auto_increment comment '主键ID'
        primary key,
    product_id    bigint unsigned                     not null comment '商品ID，关联到商品表',
    type          tinyint                             not null comment '类型: 1-轮播图商品, 2-热门商品, 3-新品商品',
    display_order int       default 0                 null comment '显示顺序，数值越大越优先显示',
    created_at    timestamp default CURRENT_TIMESTAMP null comment '记录创建时间',
    updated_at    timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '记录更新时间',
    constraint featured_product_ibfk_1
        foreign key (product_id) references product (id)
            on delete cascade
)
    comment '轮播图、热门、新品商品表' engine = InnoDB
                                     charset = utf8mb4;

create index product_id
    on featured_product (product_id);

INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (1, 1, 1, 10, '2024-09-25 19:01:39', '2024-09-25 19:01:39');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (2, 2, 2, 5, '2024-09-25 19:01:39', '2024-09-25 19:01:39');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (3, 3, 3, 7, '2024-09-25 19:01:39', '2024-09-25 19:01:39');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (4, 4, 1, 15, '2024-09-25 19:01:39', '2024-09-25 19:01:39');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (5, 5, 2, 3, '2024-09-25 19:01:39', '2024-09-25 19:01:39');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (6, 6, 3, 8, '2024-09-25 19:01:39', '2024-09-25 19:01:39');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (7, 7, 1, 11, '2024-09-25 19:03:19', '2024-09-25 19:03:19');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (8, 8, 2, 5, '2024-09-25 19:03:19', '2024-09-25 19:03:19');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (9, 9, 3, 7, '2024-09-25 19:03:19', '2024-09-25 19:03:19');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (11, 11, 2, 12, '2024-09-25 19:03:19', '2024-09-25 19:03:19');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (12, 12, 3, 22, '2024-09-25 19:03:19', '2024-09-25 19:03:19');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (18, 374, 1, 0, '2024-10-05 10:35:50', '2024-10-05 10:35:50');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (19, 376, 1, 0, '2024-10-05 10:35:54', '2024-10-05 10:35:54');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (20, 370, 1, 0, '2024-10-05 12:56:11', '2024-10-05 12:56:11');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (21, 391, 1, 0, '2024-10-05 14:05:27', '2024-10-05 14:05:27');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (22, 406, 1, 0, '2024-10-05 14:05:28', '2024-10-05 14:05:28');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (23, 256, 1, 0, '2024-10-05 14:05:29', '2024-10-05 14:05:29');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (24, 39, 1, 0, '2024-10-05 14:05:32', '2024-10-05 14:05:32');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (25, 243, 1, 0, '2024-10-05 14:05:37', '2024-10-05 14:05:37');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (28, 253, 2, 0, '2024-10-05 14:05:49', '2024-10-05 14:05:49');
INSERT INTO featured_product (id, product_id, type, display_order, created_at, updated_at) VALUES (29, 78, 2, 0, '2024-10-05 14:05:51', '2024-10-05 14:05:51');


DROP TABLE IF EXISTS `product_favorites`;
create table product_favorites
(
    id         bigint auto_increment comment '收藏ID'
        primary key,
    user_id    bigint unsigned                     not null comment '用户ID, 关联用户表',
    product_id bigint unsigned                     not null comment '商品ID, 关联商品表',
    created_at timestamp default CURRENT_TIMESTAMP null comment '收藏时间',
    updated_at timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    constraint unique_user_product
        unique (user_id, product_id) comment '防止重复收藏',
    constraint product_favorites_ibfk_1
        foreign key (user_id) references `csm-user`.user (id)
            on delete cascade,
    constraint product_favorites_ibfk_2
        foreign key (product_id) references product (id)
            on delete cascade
)
    comment '商品收藏表' engine = InnoDB
                         charset = utf8mb4;

create index product_id
    on product_favorites (product_id);

INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (4, 9, 68, '2024-09-26 00:41:33', '2024-09-26 00:41:33');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (5, 9, 104, '2024-09-26 00:41:37', '2024-09-26 00:41:37');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (8, 9, 96, '2024-09-26 16:13:03', '2024-09-26 16:13:03');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (12, 9, 16, '2024-09-26 16:43:22', '2024-09-26 16:43:22');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (30, 9, 97, '2024-09-27 16:39:52', '2024-09-27 16:39:52');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (31, 9, 79, '2024-09-27 16:40:30', '2024-09-27 16:40:30');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (33, 9, 1, '2024-09-29 23:38:41', '2024-09-29 23:38:41');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (36, 9, 10, '2024-10-01 13:22:21', '2024-10-01 13:22:21');
INSERT INTO product_favorites (id, user_id, product_id, created_at, updated_at) VALUES (37, 9, 376, '2024-10-04 21:33:09', '2024-10-04 21:33:09');


DROP TABLE IF EXISTS `product_specifications`;
create table product_specifications
(
    id               bigint auto_increment comment '商品规格关联ID'
        primary key,
    product_id       bigint                              not null comment '关联的商品ID',
    specification_id bigint                              not null comment '关联的规格ID',
    created_at       timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    created_by       bigint                              null comment '创建用户ID',
    updated_at       timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    updated_by       bigint                              null comment '最后更新用户ID'
)
    comment '商品与规格选项关联表';

create index product_id
    on product_specifications (product_id);

create index specification_id
    on product_specifications (specification_id);

INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (128, 43, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (127, 42, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (120, 1, 4, '2024-10-04 21:53:38', null, '2024-10-04 21:53:38', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (126, 41, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (125, 18, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (121, 2, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (124, 17, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (123, 16, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (122, 3, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (10, 4, 1, '2024-09-17 21:01:44', 4, '2024-09-17 21:01:44', 4);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (11, 4, 2, '2024-09-17 21:01:44', 4, '2024-09-17 21:01:44', 4);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (12, 4, 3, '2024-09-17 21:01:44', 4, '2024-09-17 21:01:44', 4);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (13, 5, 2, '2024-09-17 21:01:44', 5, '2024-09-17 21:01:44', 5);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (14, 5, 4, '2024-09-17 21:01:44', 5, '2024-09-17 21:01:44', 5);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (15, 5, 6, '2024-09-17 21:01:44', 5, '2024-09-17 21:01:44', 5);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (19, 7, 2, '2024-09-17 21:01:44', 7, '2024-09-17 21:01:44', 7);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (20, 7, 4, '2024-09-17 21:01:44', 7, '2024-09-17 21:01:44', 7);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (21, 7, 6, '2024-09-17 21:01:44', 7, '2024-09-17 21:01:44', 7);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (152, 23, 7, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (151, 8, 24, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (150, 8, 7, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (25, 9, 1, '2024-09-17 21:01:44', 9, '2024-09-17 21:01:44', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (26, 9, 3, '2024-09-17 21:01:44', 9, '2024-09-17 21:01:44', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (27, 9, 5, '2024-09-17 21:01:44', 9, '2024-09-17 21:01:44', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (28, 10, 2, '2024-09-17 21:01:44', 10, '2024-09-17 21:01:44', 10);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (29, 10, 4, '2024-09-17 21:01:44', 10, '2024-09-17 21:01:44', 10);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (30, 10, 6, '2024-09-17 21:01:44', 10, '2024-09-17 21:01:44', 10);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (53, 409, 6, '2024-10-02 16:23:09', 9, '2024-10-02 16:23:09', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (52, 409, 4, '2024-10-02 16:23:09', 9, '2024-10-02 16:23:09', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (86, 39, 11, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (51, 408, 7, '2024-10-02 16:22:20', 9, '2024-10-02 16:22:20', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (50, 408, 4, '2024-10-02 16:22:20', 9, '2024-10-02 16:22:20', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (49, 408, 3, '2024-10-02 16:22:20', 9, '2024-10-02 16:22:20', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (110, 376, 11, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (113, 391, 10, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (112, 391, 1, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (117, 406, 10, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (116, 406, 1, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (105, 256, 10, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (104, 256, 1, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (101, 225, 10, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (100, 225, 1, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (89, 66, 10, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (88, 66, 1, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (93, 89, 10, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (92, 89, 1, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (97, 106, 10, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (96, 106, 1, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (85, 39, 10, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (84, 39, 1, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (72, 370, 7, '2024-10-04 21:31:13', 9, '2024-10-04 21:31:13', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (73, 370, 24, '2024-10-04 21:31:13', 9, '2024-10-04 21:31:13', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (74, 371, 7, '2024-10-04 21:31:27', 9, '2024-10-04 21:31:27', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (75, 372, 16, '2024-10-04 21:31:42', 9, '2024-10-04 21:31:42', 9);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (247, 373, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (109, 376, 10, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (108, 376, 1, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (87, 39, 13, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (90, 66, 11, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (91, 66, 13, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (94, 89, 11, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (95, 89, 13, '2024-10-04 21:47:32', null, '2024-10-04 21:47:32', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (98, 106, 11, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (99, 106, 13, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (102, 225, 11, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (103, 225, 13, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (106, 256, 11, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (107, 256, 13, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (111, 376, 13, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (114, 391, 11, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (115, 391, 13, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (118, 406, 11, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (119, 406, 13, '2024-10-04 21:47:33', null, '2024-10-04 21:47:33', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (129, 53, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (130, 54, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (131, 55, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (132, 71, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (133, 72, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (134, 73, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (135, 95, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (136, 96, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (137, 97, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (138, 229, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (139, 230, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (140, 231, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (141, 246, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (142, 247, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (143, 248, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (144, 380, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (145, 381, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (146, 382, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (147, 395, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (148, 396, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (149, 397, 4, '2024-10-04 21:53:39', null, '2024-10-04 21:53:39', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (153, 23, 24, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (154, 32, 7, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (155, 32, 24, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (156, 60, 7, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (157, 60, 24, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (158, 68, 7, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (159, 68, 24, '2024-10-04 21:57:36', null, '2024-10-04 21:57:36', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (160, 85, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (161, 85, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (162, 92, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (163, 92, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (164, 226, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (165, 226, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (166, 239, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (167, 239, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (168, 257, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (169, 257, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (170, 377, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (171, 377, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (172, 392, 7, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (173, 392, 24, '2024-10-04 21:57:37', null, '2024-10-04 21:57:37', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (174, 11, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (175, 11, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (176, 11, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (177, 11, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (178, 11, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (179, 26, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (180, 26, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (181, 26, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (182, 26, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (183, 26, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (184, 48, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (185, 48, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (186, 48, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (187, 48, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (188, 48, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (189, 79, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (190, 79, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (191, 79, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (192, 79, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (193, 79, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (194, 91, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (195, 91, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (196, 91, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (197, 91, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (198, 91, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (199, 103, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (200, 103, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (201, 103, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (202, 103, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (203, 103, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (204, 237, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (205, 237, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (206, 237, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (207, 237, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (208, 237, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (209, 244, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (210, 244, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (211, 244, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (212, 244, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (213, 244, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (214, 254, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (215, 254, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (216, 254, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (217, 254, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (218, 254, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (219, 388, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (220, 388, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (221, 388, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (222, 388, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (223, 388, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (224, 403, 8, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (225, 403, 10, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (226, 403, 9, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (227, 403, 14, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (228, 403, 15, '2024-10-04 21:58:45', null, '2024-10-04 21:58:45', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (229, 36, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (230, 36, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (231, 63, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (232, 63, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (233, 81, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (234, 81, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (235, 86, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (236, 86, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (237, 105, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (238, 105, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (239, 222, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (240, 222, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (241, 240, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (242, 240, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (243, 245, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (244, 245, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (245, 255, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (246, 255, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (248, 373, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (249, 390, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (250, 390, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (251, 405, 20, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (252, 405, 21, '2024-10-04 21:59:44', null, '2024-10-04 21:59:44', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (253, 12, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (254, 12, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (255, 12, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (256, 12, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (257, 27, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (258, 27, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (259, 27, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (260, 27, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (261, 49, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (262, 49, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (263, 49, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (264, 49, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (265, 78, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (266, 78, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (267, 78, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (268, 78, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (269, 90, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (270, 90, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (271, 90, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (272, 90, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (273, 236, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (274, 236, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (275, 236, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (276, 236, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (277, 243, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (278, 243, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (279, 243, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (280, 243, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (281, 253, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (282, 253, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (283, 253, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (284, 253, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (285, 387, 5, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (286, 387, 9, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (287, 387, 15, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);
INSERT INTO product_specifications (id, product_id, specification_id, created_at, created_by, updated_at, updated_by) VALUES (288, 387, 27, '2024-10-04 22:00:50', null, '2024-10-04 22:00:50', null);


DROP TABLE IF EXISTS `specifications`;
create table specifications
(
    id                    bigint auto_increment comment '规格ID'
        primary key,
    name                  varchar(100)                        not null comment '规格名称',
    description           varchar(255)                        null comment '规格描述',
    status                tinyint   default 1                 null comment '规格状态，1表示启用，0表示禁用',
    specification_options varchar(255)                        not null comment '规格选项，用逗号隔开',
    created_at            timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    created_by            bigint                              null comment '创建用户的ID',
    updated_at            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    updated_by            bigint                              null comment '最后更新用户的ID'
)
    comment '规格表，存储商品的规格信息';

INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (1, '颜色', '可选颜色', 1, '红色,蓝色,绿色,黄色,紫色', '2024-09-17 20:55:06', 1, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (2, '尺寸', '可选尺寸', 1, 'S,M,L,XL,XXL', '2024-09-17 20:55:06', 1, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (3, '材质', '可选材质', 1, '棉,涤纶,羊毛,丝绸,牛仔', '2024-09-17 20:55:06', 1, '2024-09-30 22:00:45', 9);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (4, '容量', '容量规格', 1, '100ml,200ml,400ml,1L', '2024-09-17 20:55:06', 2, '2024-10-04 21:56:06', 9);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (5, '电池容量', '电池的容量', 1, '1000mAh,2000mAh,3000mAh,4000mAh', '2024-09-17 20:55:06', 2, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (6, '重量', '产品重量', 1, '0.5kg,1kg,1.5kg,2kg', '2024-09-17 20:55:06', 3, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (7, '功率', '电器功率', 1, '100W,200W,300W,500W,1000W', '2024-09-17 20:55:06', 2, '2024-10-03 01:15:51', 9);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (8, '硬盘', '硬盘容量', 1, '256GB,512GB,1TB,2TB', '2024-09-17 20:55:06', 4, '2024-09-30 22:17:01', 9);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (9, '处理器', '可选处理器型号', 1, 'i3,i5,i7,Ryzen 5,Ryzen 7', '2024-09-17 20:55:06', 5, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (10, '屏幕尺寸', '屏幕的尺寸', 1, '13英寸,14英寸,15英寸,17英寸', '2024-09-17 20:55:06', 3, '2024-09-30 23:29:22', 9);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (11, '分辨率', '屏幕分辨率', 1, '1080p,2K,4K', '2024-09-17 20:55:06', 5, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (12, '接口类型', '设备接口类型', 1, 'USB-A,USB-C,HDMI,VGA,雷电3', '2024-09-17 20:55:06', 4, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (13, '刷新率', '屏幕刷新率', 1, '60Hz,90Hz,120Hz,144Hz', '2024-09-17 20:55:06', 5, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (14, '显卡', '显卡型号', 1, 'GTX 1650,RTX 2060,RTX 3070,RTX 3080', '2024-09-17 20:55:06', 6, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (15, '内存', '内存容量', 1, '4GB,8GB,16GB,32GB', '2024-09-17 20:55:06', 5, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (16, '手表表带', '手表表带类型', 1, '皮革,金属,硅胶,尼龙', '2024-09-17 20:55:06', 3, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (17, '鞋码', '鞋子尺码', 1, '35,36,37,38,39,40,41,42,43,44', '2024-09-17 20:55:06', 1, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (18, '风格', '服饰风格', 1, '休闲,商务,运动,时尚,复古', '2024-09-17 20:55:06', 3, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (19, '香型', '香水香型', 1, '花香型,果香型,木质香,麝香', '2024-09-17 20:55:06', 1, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (20, '音质', '耳机音质类型', 1, '低音加强,均衡,高音清晰', '2024-09-17 20:55:06', 2, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (21, '颜色分类', '常见颜色分类', 1, '黑色,白色,灰色,棕色,蓝色', '2024-09-17 20:55:06', 1, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (22, '灯光模式', 'RGB 灯光模式', 1, '单色,呼吸灯,彩虹灯效', '2024-09-17 20:55:06', 2, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (23, '材质分类', '材料类型', 1, '塑料,金属,玻璃,陶瓷', '2024-09-17 20:55:06', 3, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (24, '电压', '电压规格', 1, '110V,220V,380V', '2024-09-17 20:55:06', 5, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (25, '频率响应', '音频设备频率响应范围', 1, '20Hz-20kHz,50Hz-18kHz,10Hz-40kHz', '2024-09-17 20:55:06', 4, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (26, '接口数量', '可用接口数量', 1, '2个,4个,6个,8个', '2024-09-17 20:55:06', 4, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (27, '防水等级', '防水等级', 1, 'IPX3,IPX5,IPX7,IP68', '2024-09-17 20:55:06', 6, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (28, '时区', '时区选择', 1, 'GMT+0,GMT+1,GMT+8,GMT-5', '2024-09-17 20:55:06', 5, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (29, '温度范围', '工作温度范围', 1, '-20°C-50°C,0°C-100°C', '2024-09-17 20:55:06', 3, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (30, '速度', '传输速度', 1, '10Mbps,100Mbps,1Gbps,10Gbps', '2024-09-17 20:55:06', 4, '2024-09-17 20:55:06', null);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (33, '种类', '描述种类', 0, '动物,老鼠,鸟', '2024-09-30 23:28:01', 9, '2024-09-30 23:28:01', 9);
INSERT INTO specifications (id, name, description, status, specification_options, created_at, created_by, updated_at, updated_by) VALUES (32, '非常的生产', 'DVD尺寸VS', 0, 'v但是v但是v,vfdsv,jop', '2024-09-30 22:17:40', 9, '2024-09-30 23:24:28', 9);
