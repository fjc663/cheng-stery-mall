DROP DATABASE IF EXISTS `csm-category`;
create database `csm-category` character set utf8mb4 collate utf8mb4_general_ci;
use `csm-category`;


DROP TABLE IF EXISTS `category`;
create table category
(
    id          bigint unsigned auto_increment comment '分类ID'
        primary key,
    name        varchar(100)                                                      not null comment '分类名称',
    description text                                                              null comment '分类描述',
    image_url   varchar(255) default 'http://localhost:8080/category_default.png' null comment '图片地址',
    status      tinyint(1)   default 1                                            null comment '分类状态（1=有效，0=禁用）',
    sort_order  int          default 0                                            null comment '分类排序',
    parent_id   bigint unsigned                                                   null comment '父分类ID（若无父分类则为NULL）',
    created_at  timestamp    default CURRENT_TIMESTAMP                            null comment '创建时间',
    updated_at  timestamp    default CURRENT_TIMESTAMP                            null on update CURRENT_TIMESTAMP comment '更新时间',
    created_by  bigint unsigned                                                   not null comment '创建用户ID',
    updated_by  bigint unsigned                                                   not null comment '更新用户ID',
    constraint name
        unique (name),
    constraint fk_parent_category
        foreign key (parent_id) references category (id)
)
    comment '分类表' engine = InnoDB
                     charset = utf8mb4;

INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (1, '酒水', '各类酒水饮品', 'http://localhost:8080/category/wine.png', 1, 1, null, '2024-10-04 18:37:56', null, 9, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (2, '红酒', '红酒及相关产品', 'http://localhost:8080/category_jiu.png', 1, 2, 1, '2024-09-28 14:32:40', null, 9, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (3, '白酒', '各类白酒', 'http://localhost:8080/category_jiu.png', 1, 3, 1, '2024-09-28 14:32:27', null, 9, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (4, '啤酒', '各种品牌啤酒', 'http://localhost:8080/category_jiu.png', 1, 4, 1, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (5, '饮料', '碳酸饮料，果汁等', 'http://localhost:8080/category/drink.png', 1, 5, null, '2024-09-16 13:16:20', '2024-09-16 16:45:58', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (6, '汽水', '碳酸类饮料', 'http://localhost:8080/category_jiu.png', 1, 6, 5, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (7, '果汁', '鲜榨果汁和瓶装果汁', 'http://localhost:8080/category_jiu.png', 1, 7, 5, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (8, '乳制品', '牛奶、酸奶、奶酪等', 'http://localhost:8080/category/mike.png', 1, 8, null, '2024-09-16 13:16:20', '2024-09-16 16:53:38', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (9, '零食', '各类零食小吃', 'http://localhost:8080/category/snack.png', 1, 9, null, '2024-09-16 13:16:20', '2024-09-16 16:53:38', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (10, '薯片', '薯片类小吃', 'http://localhost:8080/category_jiu.png', 1, 10, 9, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (11, '饼干', '各种饼干', 'http://localhost:8080/category_jiu.png', 1, 11, 9, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (12, '巧克力', '各类巧克力及甜品', 'http://localhost:8080/category_jiu.png', 1, 12, 9, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (13, '坚果', '坚果类小吃', 'http://localhost:8080/category_jiu.png', 1, 13, 9, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (14, '家电', '各种家用电器', 'http://localhost:8080/category/householdAppliances.png', 1, 14, null, '2024-09-16 13:16:20', '2024-09-16 16:54:02', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (15, '冰箱', '家用冰箱', 'http://localhost:8080/category_jiu.png', 1, 15, 14, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (16, '洗衣机', '各种品牌洗衣机', 'http://localhost:8080/category_jiu.png', 1, 16, 14, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (17, '空调', '空调及相关产品', 'http://localhost:8080/category_jiu.png', 1, 17, 14, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (18, '厨房电器', '厨房用小家电', 'http://localhost:8080/category_jiu.png', 1, 18, 14, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (19, '电脑', '台式机、笔记本、配件等', 'http://localhost:8080/category/computer.png', 1, 19, null, '2024-09-16 13:16:20', '2024-09-16 16:54:34', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (20, '笔记本电脑', '各类笔记本电脑', 'http://localhost:8080/category_jiu.png', 1, 20, 19, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (21, '键盘鼠标', '各种键盘鼠标', 'http://localhost:8080/category_jiu.png', 1, 21, 19, '2024-10-04 19:42:14', null, 9, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (22, '耳机', '各类品牌耳机', 'http://localhost:8080/category_jiu.png', 1, 22, 19, '2024-10-04 19:41:34', null, 9, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (23, '手机', '各类手机及配件', 'http://localhost:8080/category/phone.png', 1, 23, null, '2024-09-16 13:16:20', '2024-09-16 16:54:34', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (24, '智能手机', '智能手机及相关配件', 'http://localhost:8080/category_jiu.png', 1, 24, 23, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (25, '手表', '各种手表等', 'http://localhost:8080/category_jiu.png', 1, 25, 23, '2024-10-04 20:14:13', null, 9, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (26, '手机配件', '手机壳、保护膜等', 'http://localhost:8080/category_jiu.png', 1, 26, 23, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (27, '服装', '男装、女装、童装等', 'http://localhost:8080/category/cloth.png', 1, 27, null, '2024-09-16 13:16:20', '2024-09-16 16:54:52', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (28, '男装', '各类男装', 'http://localhost:8080/category_jiu.png', 1, 28, 27, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (29, '女装', '各类女装', 'http://localhost:8080/category_jiu.png', 1, 29, 27, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (30, '童装', '儿童服装及相关配件', 'http://localhost:8080/category_jiu.png', 1, 30, 27, '2024-09-16 13:16:20', '2024-09-16 13:16:20', 1, 1);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (38, '牛奶', '各类纯牛奶', '', 1, 9, 8, '2024-10-04 19:58:02', '2024-10-04 19:58:02', 9, 9);
INSERT INTO category (id, name, description, image_url, status, sort_order, parent_id, created_at, updated_at, created_by, updated_by) VALUES (39, '显示器', '各种显示器', '', 1, 22, 19, '2024-10-04 21:04:31', null, 9, 9);
