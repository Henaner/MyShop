/*检查并创建数据库*/
drop database if exists dustshop;
create database dustshop;
use myshop;
/*创建用户并赋权*/
create user 'dustshop'@'localhost' identified by 'DustShop';
grant all on dustshop.* to 'dustshop'@'localhost';
/*创建网站所需要的表*/
drop table if exists comment;

drop table if exists description;

drop table if exists goods;

drop table if exists image;

drop table if exists orders;

drop table if exists user;

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           int not null comment '评论id',
   user_id              int comment '用户id',
   goods_id             varchar(13) comment '商品id（日期+随机生成5位数）',
   order_id             varchar(16) comment '订单id',
   post_date            datetime comment '评论时间',
   is_ok                varchar(1) comment '(是否为好评：0为好评，1为中评，2为差评   为了展示目的)',
   content              text comment '评论的内容',
   primary key (comment_id)
);

/*==============================================================*/
/* Table: description                                           */
/*==============================================================*/
create table description
(
   desc_id              int not null comment '评论id',
   user_id              int comment '用户id',
   goods_id             varchar(13) comment '商品id',
   img_id               int comment '图片id',
   post_date            datetime comment '操作时间',
   primary key (desc_id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   goods_id             varchar(13) not null comment '商品id（日期+随机生成5位数）',
   goods_name           varchar(255) comment '商品名称（可以类似淘宝那种很混乱的名称）',
   stock                int comment '库存量',
   origin_place         varchar(255) comment '原产地',
   operator_id          int comment '上架操作员id(user表中的user_id)',
   bracket_time         date comment '上架时间',
   img_id               int comment '商品图片id',
   desc_id              int comment '商品描述id',
   comment_id           int comment '商品品论id',
   primary key (goods_id)
);

/*==============================================================*/
/* Table: image                                                 */
/*==============================================================*/
create table image
(
   img_id               int not null comment '图片id',
   user_id              int comment '用户id',
   img_title            varchar(255) comment '图片的原始名称',
   img_new_title        varchar(255) comment '生成的新名称',
   img_path             varchar(255) comment '存放图片的路径',
   type                 varchar(10) comment '图片的类型',
   post_date            datetime comment '上传的时间',
   goods_id             varchar(13) comment '对应的商品id',
   primary key (img_id)
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   order_id             varchar(16 ) not null comment '订单id(生成的方式：日期+userId+随机三位数)',
   user_id              int comment '用户id(引用user表中的id字段)',
   goods_id             int comment '商品id(引用goods表中的id字段)',
   price                float comment '对应商品的单价',
   count                int comment '对应商品的数量',
   post_date            datetime comment '订单生成时间',
   amount               double comment '订单的总金额',
   primary key (order_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null comment '用户id' auto_increment,
   user_name            varchar(30) comment '用户名',
   user_pass            varchar(30) comment '用户密码',
   user_gender          varchar(1) comment '用户性别',
   birthday             date comment '用户出生日期',
   address              varchar(255) comment '地址',
   telphone             varchar(13) comment '联系电话',
   email                varchar(255) comment '电子邮箱',
   type                 varchar(1) comment '用户类型（0：代表普通用户，1：操作员）',
   status               varchar(1) comment '用户状态（0：代表禁用，1：代表正常）',
   is_operator          varchar(1) comment '是否为操作员（0：不是，1：是）',
   opt_status           varchar(1) comment '操作员的状态（0：代表不能管理后台，1：代表可以管理后台）',
   is_admin             varchar(1) comment '是否是超级管理员（Y：代表是，N代表不是）',
   primary key (user_id)
);

alter table comment add constraint FK_comment_goods_id foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_order_id foreign key (order_id)
      references orders (order_id) on delete restrict on update restrict;

alter table comment add constraint FK_comment_user_id foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table description add constraint FK_description_goods_id foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table description add constraint FK_description_image_id foreign key (img_id)
      references image (img_id) on delete restrict on update restrict;

alter table description add constraint FK_description_user_id foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table goods add constraint FK_goods_comment_id foreign key (comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table goods add constraint FK_goods_description_id foreign key (desc_id)
      references description (desc_id) on delete restrict on update restrict;

alter table goods add constraint FK_goods_image_id foreign key (img_id)
      references image (img_id) on delete restrict on update restrict;

alter table image add constraint FK_image_goods_id foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table image add constraint FK_image_user_id foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table orders add constraint FK_order_goods_id foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table orders add constraint FK_order_user_id foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;
drop table if exists slider_img;

/*==============================================================*/
/* Table: slider_img                                            */
/*==============================================================*/
create table slider_img
(
   img_id               int not null comment '滚播图片的id' auto increment,
   img_title            varchar(255) comment '滚播图片的展示标题',
   img_type             varchar(255) comment '滚播图片的类型',
   img_path             varchar(255) comment '滚播图片的存储路径',
   goods_id             varchar(255) comment '滚播图片绑定的商品id',
   display_count        int comment '滚播图片设置的数量',
   post_date            date comment '滚播图片设置的日期',
   user_id              int comment '设置滚播图片的用户id',
   primary key (img_id)
);
alter table slider_img add constraint FK_slider_goods_key foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table slider_img add constraint FK_slider_user_key foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

