CREATE DATABASE cstery_mall_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE cstery_mall_db;

CREATE TABLE `user` (
                        `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '用户唯一标识',
                        `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
                        `email` VARCHAR(100) NOT NULL UNIQUE COMMENT '邮箱',
                        `phone` VARCHAR(20) NOT NULL UNIQUE COMMENT '手机号',
                        `password` VARCHAR(255) NOT NULL COMMENT '密码',
                        `salt` VARCHAR(50) DEFAULT NULL COMMENT '密码加密的盐值',
                        `status` TINYINT DEFAULT 1 COMMENT '用户状态（1=正常，0=禁用）',
                        `role` VARCHAR(20) DEFAULT 'USER' COMMENT '用户角色',
                        `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
                        `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
                        `last_login` TIMESTAMP DEFAULT NULL COMMENT '最后登录时间',
                        `avatar_url` VARCHAR(255) DEFAULT NULL COMMENT '用户头像URL',
                        `gender` TINYINT DEFAULT NULL COMMENT '性别（0=未知，1=男，2=女）',
                        `birthdate` DATE DEFAULT NULL COMMENT '生日',
                        `address` VARCHAR(255) DEFAULT NULL COMMENT '默认收货地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE `user_third_party` (
                                    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '第三方登录唯一标识',
                                    `user_id` BIGINT UNSIGNED NOT NULL COMMENT '关联的用户ID',
                                    `provider` VARCHAR(50) NOT NULL COMMENT '第三方平台名称（如微信，谷歌，Facebook等）',
                                    `provider_user_id` VARCHAR(255) NOT NULL COMMENT '第三方平台的用户ID',
                                    `access_token` VARCHAR(255) DEFAULT NULL COMMENT '第三方平台的访问令牌',
                                    `refresh_token` VARCHAR(255) DEFAULT NULL COMMENT '第三方平台的刷新令牌',
                                    `expires_in` BIGINT DEFAULT NULL COMMENT '令牌过期时间',
                                    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '绑定时间',
                                    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
                                    UNIQUE KEY `uq_user_provider` (`provider`, `provider_user_id`),
                                    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方登录表';

CREATE TABLE category (
                          id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '分类ID',
                          name VARCHAR(100) NOT NULL UNIQUE COMMENT '分类名称',
                          description TEXT COMMENT '分类描述',
                          image_url VARCHAR(255) DEFAULT 'http://localhost:8080/category_default.png' COMMENT '图片地址',
                          status TINYINT(1) DEFAULT 1 COMMENT '分类状态（1=有效，0=禁用）',
                          sort_order INT DEFAULT 0 COMMENT '分类排序',
                          parent_id BIGINT UNSIGNED DEFAULT NULL COMMENT '父分类ID（若无父分类则为NULL）',
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          created_by BIGINT UNSIGNED NOT NULL COMMENT '创建用户ID',
                          updated_by BIGINT UNSIGNED NOT NULL COMMENT '更新用户ID',
                          CONSTRAINT fk_parent_category FOREIGN KEY (parent_id) REFERENCES category(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

INSERT INTO category (name, description, image_url, status, sort_order, parent_id, created_by, updated_by)
VALUES
    ('酒水', '各类酒水饮品', 'http://localhost:8080/wine.png', 1, 1, NULL, 1, 1),
    ('红酒', '红酒及相关产品', 'http://localhost:8080/wine.png', 1, 2, 1, 1, 1),
    ('白酒', '各类白酒', 'http://localhost:8080/wine.png', 1, 3, 1, 1, 1),
    ('啤酒', '各种品牌啤酒', 'http://localhost:8080/wine.png', 1, 4, 1, 1, 1),
    ('饮料', '碳酸饮料，果汁等', 'http://localhost:8080/wine.png', 1, 5, NULL, 1, 1),
    ('汽水', '碳酸类饮料', 'http://localhost:8080/wine.png', 1, 6, 5, 1, 1),
    ('果汁', '鲜榨果汁和瓶装果汁', 'http://localhost:8080/wine.png', 1, 7, 5, 1, 1),
    ('乳制品', '牛奶、酸奶、奶酪等', 'http://localhost:8080/wine.png', 1, 8, NULL, 1, 1),
    ('零食', '各类零食小吃', 'http://localhost:8080/wine.png', 1, 9, NULL, 1, 1),
    ('薯片', '薯片类小吃', 'http://localhost:8080/wine.png', 1, 10, 9, 1, 1),
    ('饼干', '各种饼干', 'http://localhost:8080/wine.png', 1, 11, 9, 1, 1),
    ('巧克力', '各类巧克力及甜品', 'http://localhost:8080/wine.png', 1, 12, 9, 1, 1),
    ('坚果', '坚果类小吃', 'http://localhost:8080/wine.png', 1, 13, 9, 1, 1),
    ('家电', '各种家用电器', 'http://localhost:8080/wine.png', 1, 14, NULL, 1, 1),
    ('冰箱', '家用冰箱', 'http://localhost:8080/wine.png', 1, 15, 14, 1, 1),
    ('洗衣机', '各种品牌洗衣机', 'http://localhost:8080/wine.png', 1, 16, 14, 1, 1),
    ('空调', '空调及相关产品', 'http://localhost:8080/wine.png', 1, 17, 14, 1, 1),
    ('厨房电器', '厨房用小家电', 'http://localhost:8080/wine.png', 1, 18, 14, 1, 1),
    ('电脑', '台式机、笔记本、配件等', 'http://localhost:8080/wine.png', 1, 19, NULL, 1, 1),
    ('笔记本电脑', '各类笔记本电脑', 'http://localhost:8080/wine.png', 1, 20, 19, 1, 1),
    ('台式机', '品牌台式电脑', 'http://localhost:8080/wine.png', 1, 21, 19, 1, 1),
    ('平板电脑', '各类品牌平板电脑', 'http://localhost:8080/wine.png', 1, 22, 19, 1, 1),
    ('手机', '各类手机及配件', 'http://localhost:8080/wine.png', 1, 23, NULL, 1, 1),
    ('智能手机', '智能手机及相关配件', 'http://localhost:8080/wine.png', 1, 24, 23, 1, 1),
    ('功能手机', '老年机、功能机等', 'http://localhost:8080/wine.png', 1, 25, 23, 1, 1),
    ('手机配件', '手机壳、保护膜等', 'http://localhost:8080/wine.png', 1, 26, 23, 1, 1),
    ('服装', '男装、女装、童装等', 'http://localhost:8080/wine.png', 1, 27, NULL, 1, 1),
    ('男装', '各类男装', 'http://localhost:8080/wine.png', 1, 28, 27, 1, 1),
    ('女装', '各类女装', 'http://localhost:8080/wine.png', 1, 29, 27, 1, 1),
    ('童装', '儿童服装及相关配件', 'http://localhost:8080/wine.png', 1, 30, 27, 1, 1);

