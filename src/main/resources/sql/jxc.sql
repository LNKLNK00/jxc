/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jxc

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-05 15:01:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_no` varchar(20) NOT NULL COMMENT '订单编号',
  `price` float(5,2) NOT NULL COMMENT '订单总价',
  `profit` float(5,2) NOT NULL COMMENT '订单总收益',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `user_name` varchar(10) NOT NULL COMMENT '操作人',
  `user_id` tinyint(2) NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_id` int(8) NOT NULL COMMENT '订单ID',
  `product_id` int(8) NOT NULL COMMENT '产品ID',
  `num` tinyint(3) NOT NULL COMMENT '购买数量',
  `rate` float(2,2) NOT NULL DEFAULT '0.00' COMMENT '折扣利率',
  `price` float(5,2) NOT NULL COMMENT '售价',
  `bid` float(5,2) NOT NULL COMMENT '进价',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `names` varchar(50) NOT NULL COMMENT '产品名称',
  `norms` varchar(20) NOT NULL COMMENT '规格',
  `unit` char(1) NOT NULL COMMENT '单位',
  `bid` float(5,2) NOT NULL COMMENT '进价',
  `price` float(5,2) NOT NULL COMMENT '定价',
  `num` tinyint(3) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `factory` varchar(30) DEFAULT NULL COMMENT '生产厂家',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1：上架， 0：下架)',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '感冒药', '25g*12袋/盒', '盒', '30.00', '60.00', '0', '湖南兽药厂', '1', '2017-04-04 22:04:15', '2017-04-04 22:04:11');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `product_id` int(8) NOT NULL COMMENT '产品ID',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `num` tinyint(3) NOT NULL COMMENT '进货数量',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '进货时间',
  `user_name` varchar(10) NOT NULL COMMENT '操作人',
  `user_id` tinyint(2) NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` tinyint(2) NOT NULL COMMENT '序号',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `role_id` tinyint(2) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin506444', '1');
INSERT INTO `user` VALUES ('2', '店员', 'lzsyd158', '2');
