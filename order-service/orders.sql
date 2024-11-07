DROP DATABASE IF EXISTS `csm-order`;
create database `csm-order` character set utf8mb4 collate utf8mb4_general_ci;
use `csm-order`;


DROP TABLE IF EXISTS `orders`;
create table orders
(
    id               bigint auto_increment comment '订单ID'
        primary key,
    user_id          bigint                                   not null comment '用户ID',
    order_number     varchar(50)                              not null comment '订单编号',
    total_amount     decimal(10, 2)                           not null comment '订单总金额',
    status           tinyint        default 1                 not null comment '订单状态：1-待支付, 2-已支付, 3-已发货, 4-已完成, 5-已取消',
    payment_status   tinyint        default 0                 not null comment '支付状态：0-未支付, 1-已支付',
    payment_method   tinyint                                  null comment '支付方式：1-支付宝, 2-微信, 3-信用卡',
    shipping_address varchar(255)                             not null comment '收货地址',
    shipping_cost    decimal(10, 2) default 0.00              null comment '运费',
    item_count       int            default 0                 not null comment '商品总数',
    discount_amount  decimal(10, 2) default 0.00              null comment '优惠金额',
    created_at       timestamp      default CURRENT_TIMESTAMP null comment '订单创建时间',
    updated_at       timestamp      default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '订单更新时间',
    paid_at          timestamp                                null comment '支付时间',
    shipped_at       timestamp                                null comment '发货时间',
    completed_at     timestamp                                null comment '订单完成时间',
    canceled_at      timestamp                                null comment '订单取消时间',
    remark           varchar(255)                             null comment '订单备注',
    constraint order_number
        unique (order_number)
)
    comment '订单表' engine = InnoDB
                     charset = utf8mb4;

INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (3, 9, '1726755333884', 0.00, 4, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 6, 0.00, '2024-09-23 21:36:34', '2024-10-03 23:22:17', null, '2024-10-03 23:21:58', '2024-10-03 23:22:17', '2024-09-23 21:39:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (4, 9, '1726755697328', 0.00, 5, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 2, 0.00, '2024-09-23 20:24:37', '2024-10-03 01:09:25', null, null, null, '2024-10-03 01:09:25', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (5, 9, '1726757016752', 0.00, 4, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 1, 0.00, '2024-09-23 20:25:37', '2024-10-03 14:17:03', null, '2024-10-03 01:09:19', '2024-10-03 14:17:03', '2024-09-23 20:37:24', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (6, 9, '1726757423382', 0.00, 5, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 1, 0.00, '2024-09-19 22:50:23', '2024-10-03 01:00:27', null, null, null, '2024-10-03 01:00:27', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (7, 9, '1726761685174', 0.00, 4, 0, 1, '王五 13700137000
广东省 广州市 天河区 ZZ路ZZ号', 0.00, 3, 0.00, '2024-09-20 00:01:25', '2024-10-03 23:22:22', null, '2024-10-03 23:22:01', '2024-10-03 23:22:22', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (8, 9, '1726830065852', 2640.00, 4, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 6, 0.00, '2024-09-20 19:01:06', '2024-10-03 23:22:20', null, '2024-10-03 23:21:59', '2024-10-03 23:22:20', '2024-09-22 22:30:33', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (9, 9, '1726830141658', 120.00, 5, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 1, 0.00, '2024-09-20 19:02:22', '2024-09-22 14:26:15', null, null, null, null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (10, 9, '1726830164717', 120.00, 5, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 1, 0.00, '2024-09-20 19:02:45', null, null, null, null, '2024-09-22 22:30:33', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (11, 9, '1726844500693', 840.00, 4, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 2, 0.00, '2024-09-20 23:01:41', '2024-10-03 23:22:19', null, '2024-10-03 00:54:31', '2024-10-03 23:22:19', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (12, 9, '1726844517562', 840.00, 5, 0, 1, '李四 13900139000
上海市 上海市 浦东新区 YY路YY号', 0.00, 3, 0.00, '2024-09-20 23:01:58', null, null, null, null, '2024-09-22 22:30:33', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (13, 9, '1726981487606', 2400.00, 4, 0, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 6, 0.00, '2024-09-22 13:04:48', '2024-10-03 14:19:15', null, null, '2024-10-03 14:19:15', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (14, 9, '1727110189996', 600.00, 4, 0, 1, '李四 13380801732
山西省 阳泉市 郊区 二狗村', 0.00, 3, 0.00, '2024-09-24 00:49:50', '2024-09-27 16:41:42', null, null, null, '2024-09-24 12:11:01', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (15, 9, '1727110339041', 600.00, 5, 0, 3, '王五 13360601423
福建省 三明市 宁化县 高德镇', 0.00, 2, 0.00, '2024-09-24 00:52:19', null, null, null, null, '2024-09-24 12:11:01', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (16, 9, '1727184375037', 240.00, 4, 0, 2, '李四 13380801732
山西省 阳泉市 郊区 二狗村', 0.00, 1, 0.00, '2024-09-24 21:26:15', '2024-09-27 16:41:42', null, null, null, '2024-09-24 21:42:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (17, 9, '1727184383603', 240.00, 5, 0, 1, '李四 13380801732
山西省 阳泉市 郊区 二狗村', 0.00, 1, 0.00, '2024-09-24 21:26:24', null, null, null, null, '2024-09-24 21:42:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (18, 9, '1727185331134', 17400.00, 4, 0, 1, '王五 13360601423
福建省 三明市 宁化县 高德镇', 0.00, 1, 0.00, '2024-09-24 21:42:11', '2024-09-27 16:41:42', null, null, null, '2024-09-24 21:58:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (19, 9, '1727194327585', 240.00, 5, 0, 2, '李四 13380801732
山西省 阳泉市 郊区 二狗村', 0.00, 1, 0.00, '2024-09-25 00:12:08', null, null, null, null, '2024-09-25 00:12:37', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (20, 9, '1727194372601', 21600.00, 4, 0, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-09-25 00:12:53', '2024-09-27 16:41:42', null, null, null, '2024-09-25 00:28:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (21, 9, '1727269877575', 10.00, 5, 0, 2, '张三 13380809123
河北省 秦皇岛市 抚宁区 夏天镇', 0.00, 1, 0.00, '2024-09-25 21:11:18', null, null, null, null, '2024-09-25 21:27:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (22, 9, '1727427908596', 520.00, 5, 0, 2, '李四 13380801732
山西省 阳泉市 郊区 二狗村', 0.00, 2, 0.00, '2024-09-27 17:05:09', null, null, null, null, '2024-09-27 17:21:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (23, 9, '1727434507749', 39000.00, 5, 0, 2, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 2, 0.00, '2024-09-27 18:55:08', null, null, null, null, '2024-09-27 19:11:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (24, 9, '1727756269845', 6315.00, 5, 0, 2, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 3, 0.00, '2024-10-01 12:17:50', null, null, null, null, '2024-10-01 12:33:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (25, 9, '1727760127663', 720.00, 5, 0, 1, '王五 13360601423
福建省 莆田市 涵江区 高德镇', 0.00, 1, 0.00, '2024-10-01 13:22:08', null, null, null, null, '2024-10-01 13:38:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (26, 9, '1727925529685', 120.00, 5, 0, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-10-03 11:18:50', null, null, null, null, '2024-10-03 11:34:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (27, 9, '1727929339871', 5000.00, 5, 0, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-10-03 12:22:20', null, null, null, null, '2024-10-03 12:38:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (28, 9, '1727930323606', 720.00, 4, 1, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-10-03 13:10:44', '2024-10-03 23:22:15', '2024-10-03 13:15:47', '2024-10-03 23:21:56', '2024-10-03 23:22:15', '2024-10-03 13:01:00', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (29, 9, '1727932703446', 1000.00, 4, 1, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-10-03 13:18:23', '2024-10-03 14:04:57', '2024-10-03 13:20:48', '2024-10-03 13:21:23', '2024-10-03 14:04:57', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (30, 9, '1727936485756', 2000.00, 5, 0, 2, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-10-03 14:21:26', '2024-10-03 14:26:26', null, null, null, '2024-10-03 14:26:26', '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (31, 9, '1727968849117', 137.00, 4, 1, 2, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 2, 0.00, '2024-10-03 23:20:49', '2024-10-03 23:22:13', '2024-10-03 23:20:51', '2024-10-03 23:21:54', '2024-10-03 23:22:13', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (32, 9, '1727968865580', 21748.00, 4, 1, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 4, 0.00, '2024-10-03 23:21:06', '2024-10-03 23:22:11', '2024-10-03 23:21:07', '2024-10-03 23:21:52', '2024-10-03 23:22:11', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (33, 9, '1728108425212', 25.00, 4, 1, 2, '李四 13380801732
山西省 阳泉市 郊区 二狗村', 0.00, 1, 0.00, '2024-10-05 14:07:05', '2024-10-05 14:10:56', '2024-10-05 14:07:08', '2024-10-05 14:10:37', '2024-10-05 14:10:56', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (34, 9, '1728108573547', 10427.00, 4, 1, 2, '林奇 13434237889
西藏自治区 昌都市 类乌齐县 大围村11号', 0.00, 2, 0.00, '2024-10-05 14:09:34', '2024-10-05 14:10:53', '2024-10-05 14:09:46', '2024-10-05 14:10:34', '2024-10-05 14:10:53', null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (35, 9, '1728108703717', 1900.00, 2, 1, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 2, 0.00, '2024-10-05 14:11:44', '2024-10-05 14:11:49', '2024-10-05 14:11:49', null, null, null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (36, 9, '1728108728269', 3000.00, 2, 1, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 1, 0.00, '2024-10-05 14:12:08', '2024-10-05 14:12:09', '2024-10-05 14:12:09', null, null, null, '');
INSERT INTO orders (id, user_id, order_number, total_amount, status, payment_status, payment_method, shipping_address, shipping_cost, item_count, discount_amount, created_at, updated_at, paid_at, shipped_at, completed_at, canceled_at, remark) VALUES (37, 9, '1728108761256', 1080.00, 3, 1, 1, '赵六 13360601432
广东省 广州市 番禺区 小谷围100号', 0.00, 2, 0.00, '2024-10-05 14:12:41', '2024-10-05 14:13:00', '2024-10-05 14:12:42', '2024-10-05 14:13:00', null, null, '');


DROP TABLE IF EXISTS `order_items`;
create table order_items
(
    id                bigint auto_increment comment '订单商品记录ID'
        primary key,
    order_id          bigint                              not null comment '订单ID，关联到订单表',
    product_id        bigint unsigned                     not null comment '商品ID，关联到商品表',
    product_name      varchar(255)                        not null comment '商品名称，冗余字段',
    quantity          int                                 not null comment '购买数量',
    product_price     decimal(10, 2)                      not null comment '商品单价',
    product_image_url varchar(255)                        null comment '商品图片地址',
    specifications    varchar(255)                        null comment '商品规格，JSON格式',
    created_at        timestamp default CURRENT_TIMESTAMP null comment '记录创建时间',
    constraint order_items_ibfk_1
        foreign key (order_id) references orders (id)
            on delete cascade
)
    comment '订单商品表' engine = InnoDB
                         charset = utf8mb4;

create index order_id
    on order_items (order_id);

create index product_id
    on order_items (product_id);

INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (1, 3, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"蓝色","尺寸":"S","材质":"棉"}', '2024-09-19 22:15:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (3, 3, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"M","材质":"棉"}', '2024-09-19 22:15:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (4, 3, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XL","材质":"棉"}', '2024-09-19 22:15:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (5, 3, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XL","材质":"羊毛"}', '2024-09-19 22:15:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (6, 3, 1, '红酒 A', 6, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"黄色","尺寸":"XL","材质":"羊毛"}', '2024-09-19 22:15:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (7, 3, 1, '红酒 A', 4, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"黄色","尺寸":"S","材质":"羊毛"}', '2024-09-19 22:15:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (8, 4, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"绿色","尺寸":"M","材质":"棉"}', '2024-09-19 22:21:37');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (9, 4, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"绿色","尺寸":"M","材质":"羊毛"}', '2024-09-19 22:21:37');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (10, 5, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-19 22:43:37');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (11, 6, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-19 22:50:23');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (12, 7, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-20 00:01:25');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (13, 7, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"涤纶"}', '2024-09-20 00:01:25');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (14, 7, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"丝绸"}', '2024-09-20 00:01:25');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (15, 8, 1, '红酒 A', 5, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XL","材质":"棉"}', '2024-09-20 19:01:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (16, 8, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XL","材质":"涤纶"}', '2024-09-20 19:01:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (17, 8, 1, '红酒 A', 5, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XL","材质":"牛仔"}', '2024-09-20 19:01:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (18, 8, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"黄色","尺寸":"XL","材质":"牛仔"}', '2024-09-20 19:01:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (19, 8, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"L","材质":"棉"}', '2024-09-20 19:01:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (20, 8, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-20 19:01:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (21, 9, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-20 19:02:22');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (22, 10, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-20 19:02:45');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (23, 11, 1, '红酒 A', 4, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-20 23:01:41');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (24, 11, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"黄色","尺寸":"XL","材质":"棉"}', '2024-09-20 23:01:41');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (25, 12, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"M","材质":"棉"}', '2024-09-20 23:01:58');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (26, 12, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"M","材质":"羊毛"}', '2024-09-20 23:01:58');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (27, 12, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XL","材质":"羊毛"}', '2024-09-20 23:01:58');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (28, 13, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"L","材质":"涤纶"}', '2024-09-22 13:04:48');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (29, 13, 1, '红酒 A', 4, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"XXL","材质":"涤纶"}', '2024-09-22 13:04:48');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (30, 13, 1, '红酒 A', 5, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"紫色","尺寸":"XXL","材质":"涤纶"}', '2024-09-22 13:04:48');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (31, 13, 1, '红酒 A', 4, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"紫色","尺寸":"XXL","材质":"丝绸"}', '2024-09-22 13:04:48');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (33, 13, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"蓝色","尺寸":"XXL","材质":"棉"}', '2024-09-22 13:04:48');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (34, 13, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"蓝色","尺寸":"XXL","材质":"牛仔"}', '2024-09-22 13:04:48');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (48, 14, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-24 00:49:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (49, 14, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"涤纶"}', '2024-09-24 00:49:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (50, 14, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"丝绸"}', '2024-09-24 00:49:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (52, 15, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"涤纶"}', '2024-09-24 00:52:19');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (53, 15, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"丝绸"}', '2024-09-24 00:52:19');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (61, 17, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"丝绸"}', '2024-09-24 21:26:24');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (62, 16, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-24 21:26:15');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (63, 19, 1, '红酒 A', 2, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"涤纶"}', '2024-09-25 00:12:08');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (65, 18, 91, '笔记本电脑 F', 3, 5800.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-09-24 21:42:11');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (66, 20, 237, '笔记本电脑 H', 3, 7200.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-09-25 00:12:53');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (69, 21, 4, '果汁 A', 1, 10.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-25 21:11:18');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (80, 22, 1, '红酒 A', 3, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-09-27 17:05:09');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (81, 25, 1, '红酒 A', 6, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"涤纶"}', '2024-10-01 13:22:08');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (82, 28, 1, '红酒 A', 6, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"丝绸"}', '2024-10-03 12:38:44');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (83, 24, 97, '啤酒 F', 1, 15.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-01 12:17:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (84, 24, 79, '笔记本电脑 E', 1, 6000.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-01 12:17:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (85, 23, 91, '笔记本电脑 F', 3, 5800.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-09-27 18:55:08');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (86, 23, 237, '笔记本电脑 H', 3, 7200.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-09-27 18:55:08');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (87, 24, 16, '红酒 B', 2, 150.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-01 12:17:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (88, 22, 2, '白酒 A', 2, 80.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","容量":"16GB"}', '2024-09-27 17:05:09');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (89, 26, 1, '红酒 A', 1, 120.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","尺寸":"S","材质":"棉"}', '2024-10-03 11:18:50');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (90, 27, 10, '空调 A', 2, 2500.00, 'http://localhost:8080/product/default_product.png', '{"尺寸":"S","容量":"16GB","重量":"0.5kg"}', '2024-10-03 12:22:20');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (91, 29, 408, 'qq糖', 2, 500.00, 'https://cstery-sky.oss-cn-beijing.aliyuncs.com/product/2806eb50-2c9e-4259-b8fd-f4ef72c0b637.png', '{"材质":"棉","容量":"128GB","电池容量":"1000mAh","重量":"0.5kg"}', '2024-10-03 13:18:23');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (92, 32, 237, '笔记本电脑 H', 3, 7200.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-03 23:21:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (93, 30, 408, 'qq糖', 4, 500.00, 'https://cstery-sky.oss-cn-beijing.aliyuncs.com/product/2806eb50-2c9e-4259-b8fd-f4ef72c0b637.png', '{"材质":"棉","容量":"128GB","电池容量":"1000mAh","重量":"0.5kg"}', '2024-10-03 14:21:26');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (94, 32, 6, '薯片 A', 2, 5.00, 'http://localhost:8080/product/default_product.png', '{"颜色":"红色","材质":"棉","电池容量":"2000mAh"}', '2024-10-03 23:21:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (95, 32, 76, '薯片 E', 2, 6.50, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-03 23:21:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (96, 31, 234, '薯片 G', 2, 8.50, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-03 23:20:49');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (97, 31, 101, '巧克力 F', 4, 30.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-03 23:20:49');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (98, 32, 77, '巧克力 E', 5, 25.00, 'http://localhost:8080/product/default_product.png', '{}', '2024-10-03 23:21:06');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (106, 33, 6, '薯片 A', 5, 5.00, 'http://localhost:8080/product/shupian/1.png', '{}', '2024-10-05 14:07:05');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (107, 34, 253, '智能手机 J', 2, 5200.00, 'http://localhost:8080/product/shouji/8.png', '{"电池容量":"1000mAh","处理器":"i3","内存":"8GB","防水等级":"IPX3"}', '2024-10-05 14:09:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (108, 34, 20, '牛奶 B', 3, 9.00, 'http://localhost:8080/product/niunai/2.png', '{}', '2024-10-05 14:09:34');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (109, 36, 12, '智能手机 A', 1, 3000.00, 'http://localhost:8080/product/shouji/1.png', '{"电池容量":"1000mAh","处理器":"i3","内存":"4GB","防水等级":"IPX5"}', '2024-10-05 14:12:08');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (110, 35, 35, '智能手表 A', 2, 800.00, 'http://localhost:8080/product/shoubiao/1.png', '{}', '2024-10-05 14:11:44');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (111, 35, 13, '男装 A', 2, 150.00, 'http://localhost:8080/product/fuzhuang/1.png', '{}', '2024-10-05 14:11:44');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (112, 37, 29, '女装 B', 2, 220.00, 'http://localhost:8080/product/fuzhuang/5.png', '{}', '2024-10-05 14:12:41');
INSERT INTO order_items (id, order_id, product_id, product_name, quantity, product_price, product_image_url, specifications, created_at) VALUES (113, 37, 63, '耳机 B', 2, 320.00, 'http://localhost:8080/product/erji/2.png', '{"音质":"低音加强","颜色分类":"黑色"}', '2024-10-05 14:12:41');


DROP TABLE IF EXISTS `cart`;
create table cart
(
    id             bigint auto_increment comment '购物车记录ID'
        primary key,
    user_id        bigint                              not null comment '用户ID',
    product_id     bigint                              not null comment '商品ID',
    quantity       int       default 1                 not null comment '商品数量',
    created_at     timestamp default CURRENT_TIMESTAMP null comment '添加到购物车的时间',
    updated_at     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    specifications text                                null comment '商品规格，JSON 格式'
)
    comment '购物车表';

create index product_id
    on cart (product_id);

create index user_id
    on cart (user_id);

INSERT INTO cart (id, user_id, product_id, quantity, created_at, updated_at, specifications) VALUES (118, 9, 78, 1, '2024-10-05 17:03:03', '2024-10-05 17:03:03', '{"电池容量":"1000mAh","处理器":"i7","内存":"4GB","防水等级":"IPX3"}');
INSERT INTO cart (id, user_id, product_id, quantity, created_at, updated_at, specifications) VALUES (119, 9, 4, 2, '2024-11-03 18:10:50', '2024-11-03 18:10:50', '{"颜色":"红色","尺寸":"S","材质":"棉"}');
INSERT INTO cart (id, user_id, product_id, quantity, created_at, updated_at, specifications) VALUES (117, 9, 237, 2, '2024-10-05 16:43:58', '2024-10-05 16:43:58', '{"硬盘":"256GB","处理器":"i7","屏幕尺寸":"15英寸","显卡":"GTX 1650","内存":"4GB"}');
INSERT INTO cart (id, user_id, product_id, quantity, created_at, updated_at, specifications) VALUES (115, 9, 405, 2, '2024-10-05 14:12:35', '2024-10-05 14:12:35', '{"音质":"低音加强","颜色分类":"黑色"}');
INSERT INTO cart (id, user_id, product_id, quantity, created_at, updated_at, specifications) VALUES (116, 9, 91, 1, '2024-10-05 16:43:51', '2024-10-05 16:43:51', '{"硬盘":"256GB","处理器":"i3","屏幕尺寸":"13英寸","显卡":"RTX 2060","内存":"4GB"}');
INSERT INTO cart (id, user_id, product_id, quantity, created_at, updated_at, specifications) VALUES (114, 9, 373, 2, '2024-10-05 14:12:32', '2024-10-05 14:12:32', '{"音质":"低音加强","颜色分类":"黑色"}');
