DROP DATABASE IF EXISTS `csm-user`;
create database `csm-user` character set utf8mb4 collate utf8mb4_general_ci;
use `csm-user`;


DROP TABLE IF EXISTS `user`;
create table user
(
    id         bigint unsigned auto_increment comment '用户唯一标识'
        primary key,
    username   varchar(50)                           not null comment '用户名',
    email      varchar(100)                          not null comment '邮箱',
    phone      varchar(20)                           null comment '手机号',
    password   varchar(255)                          not null comment '密码',
    salt       varchar(50)                           null comment '密码加密的盐值',
    status     tinyint     default 1                 null comment '用户状态（1=正常，0=禁用）',
    role       varchar(20) default 'USER'            null comment '用户角色',
    created_at timestamp   default CURRENT_TIMESTAMP null comment '注册时间',
    updated_at timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    last_login timestamp                             null comment '最后登录时间',
    avatar_url varchar(255)                          null comment '用户头像URL',
    gender     tinyint                               null comment '性别（0=未知，1=男，2=女）',
    birthdate  date                                  null comment '生日',
    address    varchar(255)                          null comment '默认收货地址',
    constraint email
        unique (email),
    constraint phone
        unique (phone),
    constraint username
        unique (username)
)
    comment '用户表' engine = InnoDB
                     charset = utf8mb4;

INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (3, 'cstery', 'fjc2977023857@outlook.com', null, '56cd6541e34ea1697ca69c0e33d27dfc', 'qOTh7PgZ7C6KLTKA+YLr3A==', 1, 'ADMIN', '2024-09-15 11:30:23', '2024-11-03 20:01:48', '2024-11-03 20:01:49', null, null, null, null);
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (4, 'lwy123', 'lwy333@qq.com', null, 'e5987403d130fb7174b846d5c57ac488', 'ct1hBDj8T154tQW5r8Sf3A==', 1, 'USER', '2024-09-15 13:39:59', '2024-11-03 20:01:48', '2024-11-03 20:01:49', null, null, null, null);
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (7, 'qwdq', 'dasd@qq.com', null, 'acccb27533f1531ab1ec42252224dd92', 'XVy/EVgEEFxMiCoDi8JxDg==', 1, 'USER', '2024-09-15 14:27:28', '2024-11-03 20:01:48', '2024-11-03 20:01:49', null, null, null, null);
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (8, 'jinggna', 'fjidf@qq.com', null, '911e6140803ff3de4db3d4e89cfaf32f', 'qOeRLgJ/l0hckDmRkMcb7A==', 1, 'USER', '2024-09-15 14:30:27', '2024-11-03 20:01:48', '2024-11-03 20:01:49', null, null, null, null);
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (9, 'fjc663', 'fjc115125@outlook.com', '13380801988', 'b0642315a65cf5fad5b2b8014e12f2c9', 'qXg73APHHdPTeOyz69BsEw==', 1, 'SUPER', '2024-09-15 16:19:42', '2024-11-03 20:01:48', '2024-11-03 20:01:49', 'https://cstery-sky.oss-cn-beijing.aliyuncs.com/avatar/0b5ab5e6-49c5-4e6d-bc0e-d52b80a349ec.png', 1, '2000-08-26', '广东省 广州市 白云区 某某23号');
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (10, 'lxqian123', 'fjncds@qq.com', null, '1c64b6f46208072015455d9caa7565fa', 'P2J1CT0Qyh5wIKeEAnn8Iw==', 1, 'USER', '2024-09-15 16:33:34', '2024-11-03 20:01:48', '2024-11-03 20:01:49', null, null, null, null);
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (19, 'liuergou123', 'lety@outlook.com', null, '876550e9b3199c2e4fa1145bdd902bf8', 'U3tCBhU0Aa+YMcVpMv1g/w==', 1, 'USER', '2024-09-16 12:45:16', '2024-11-03 20:01:48', '2024-11-03 20:01:49', 'http://localhost:8080/defaultAvatar.png', null, null, null);
INSERT INTO user (id, username, email, phone, password, salt, status, role, created_at, updated_at, last_login, avatar_url, gender, birthdate, address) VALUES (20, 'fjccc789', 'fjv789@qq.com', null, 'b8e3e13592e9323464468baeb6318291', 'qThu1O2QFjWcac7oEkuarg==', 1, 'USER', '2024-09-24 22:37:10', '2024-11-03 20:01:48', '2024-11-03 20:01:49', 'http://localhost:8080/defaultAvatar.png', null, null, null);


DROP TABLE IF EXISTS `address`;
create table address
(
    id               bigint auto_increment comment '地址ID'
        primary key,
    user_id          bigint unsigned                      not null comment '用户ID，关联到用户表',
    receiver_name    varchar(50)                          not null comment '收货人姓名',
    receiver_phone   varchar(20)                          not null comment '收货人联系电话',
    province         varchar(50)                          not null comment '省份',
    city             varchar(50)                          not null comment '城市',
    district         varchar(50)                          not null comment '区/县',
    detailed_address varchar(255)                         not null comment '详细地址',
    is_default       tinyint(1) default 0                 null comment '是否为默认地址，1表示默认',
    created_at       timestamp  default CURRENT_TIMESTAMP null comment '记录创建时间',
    updated_at       timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '记录更新时间',
    constraint address_ibfk_1
        foreign key (user_id) references user (id)
            on delete cascade
)
    comment '用户地址表' engine = InnoDB
                         charset = utf8mb4;

create index user_id
    on address (user_id);

INSERT INTO address (id, user_id, receiver_name, receiver_phone, province, city, district, detailed_address, is_default, created_at, updated_at) VALUES (4, 9, '张三', '13380809123', '河北省', '邯郸市', '峰峰矿区', '夏天镇', 0, '2024-09-21 13:36:53', '2024-10-01 13:22:14');
INSERT INTO address (id, user_id, receiver_name, receiver_phone, province, city, district, detailed_address, is_default, created_at, updated_at) VALUES (6, 9, '王五', '13360601423', '福建省', '莆田市', '涵江区', '高德镇', 0, '2024-09-21 13:39:27', '2024-10-01 13:21:44');
INSERT INTO address (id, user_id, receiver_name, receiver_phone, province, city, district, detailed_address, is_default, created_at, updated_at) VALUES (8, 9, '李四', '13380801732', '山西省', '阳泉市', '郊区', '二狗村', 1, '2024-09-21 14:01:07', '2024-11-03 18:42:41');
INSERT INTO address (id, user_id, receiver_name, receiver_phone, province, city, district, detailed_address, is_default, created_at, updated_at) VALUES (9, 9, '赵六', '13360601432', '广东省', '广州市', '番禺区', '小谷围100号', 0, '2024-09-22 09:54:09', '2024-11-03 18:42:40');
INSERT INTO address (id, user_id, receiver_name, receiver_phone, province, city, district, detailed_address, is_default, created_at, updated_at) VALUES (10, 9, '林奇', '13434237889', '西藏自治区', '昌都市', '类乌齐县', '大围村11号', 0, '2024-09-22 10:19:55', '2024-09-22 10:22:59');
