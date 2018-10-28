-- scheme.sql
drop database if exists awesome;

create database awesome;

use awesome;


-- 创建用户
create user 'www-data'@'localhost' identified by 'www-data';
-- 权限fzhi
grant select, insert, update, delete,create on awesome.* to 'www-data'@'localhost' identified by 'www-data';
--立即启用修改
flush  privileges ;
-- table users
drop table if exists `users`;
create table `users`
(
    `id` varchar(50) not null comment '主键id',
    `email` varchar(50) not null comment '邮箱',
    `passwd` varchar(50) not null comment '密码',
    `admin` bool not null default 0 comment '是否是管理员',
    `name` varchar(50) not null comment '用户名',
    `image` varchar(500) not null default '' comment '头像图片链接',
    `created_at` real not null comment '创建时间',
    unique key `idx_email` (`email`),
    key `idx_created_at` (`created_at`),
    primary key(`id`)
) engine = innodb default charset = utf8 comment '用户表';

-- table blogs 
drop table if exists `blogs`;
create table `blogs` (
    `id` varchar(50) not null comment '主键id',
    `user_id` varchar(50) not null default 0 comment '用户id',
    `user_name` varchar(50) not null default '' comment '用户名称',
    `user_image` varchar(500) not null default '' comment '用户图片',
    `summary` varchar(200) not null default '' comment '博客摘要',
    `content` mediumtext not null comment '博客内容',
    `created_at` real not null comment '创建时间',
    key `idx_created_at` (`created_at`),
    primary key(`id`)
)engine = innodb default charset=utf8 comment '博客内容表';

-- comment 
drop table if exists `comments`;
create table `comments`
(
    `id` varchar(50) not null comment '主键id',
    `blog_id` varchar(50) not null comment '博客id',
    `user_id` varchar(50) not null comment '用户的id',
    `user_name` varchar(50) not null comment '用户名',
    `user_image` varchar(50) not null comment '头像图片',
    `content` text not null comment '评论内容',
    `created_at` real not null comment '创建时间',
    key `idx_created_at` (`created_at`),
    primary key (`id`)
)engine = innodb default charset = utf8 comment '博客评论表';

-- sql 导入数据库命令
-- mysql -uroot -proot < data.sql
