/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jxc

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-19 17:59:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_no` varchar(20) NOT NULL COMMENT '订单编号',
  `price` float(7,2) NOT NULL COMMENT '订单总价',
  `profit` float(7,2) NOT NULL COMMENT '订单总收益',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `user_name` varchar(10) NOT NULL COMMENT '操作人',
  `user_id` tinyint(2) NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('2', 'NO1492417723368', '143.00', '74.00', '2017-03-03 16:28:43', 'admin', '1');
INSERT INTO `order_info` VALUES ('3', 'NO1492418273313', '752.00', '194.00', '2017-04-07 16:37:53', 'admin', '1');
INSERT INTO `order_info` VALUES ('4', 'NO1492425016400', '341.40', '140.40', '2017-04-17 18:30:16', 'admin', '1');
INSERT INTO `order_info` VALUES ('5', 'NO1492504548469', '912.00', '264.00', '2017-04-18 16:35:48', 'admin', '1');
INSERT INTO `order_info` VALUES ('6', 'NO1492594353417', '236.00', '125.00', '2017-04-19 17:32:33', 'admin', '1');
INSERT INTO `order_info` VALUES ('7', 'NO1492594376570', '1290.00', '730.00', '2017-04-19 17:32:56', 'admin', '1');
INSERT INTO `order_info` VALUES ('8', 'NO1492594448308', '485.00', '308.00', '2017-04-19 17:34:08', 'admin', '1');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_id` int(8) NOT NULL COMMENT '订单ID',
  `product_id` int(8) NOT NULL COMMENT '产品ID',
  `num` int(6) NOT NULL COMMENT '购买数量',
  `rate` float(3,2) NOT NULL DEFAULT '0.00' COMMENT '折扣利率',
  `price` float(7,2) NOT NULL COMMENT '售价',
  `bid` float(7,2) NOT NULL COMMENT '进价',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '2', '2', '3', '1.00', '5.00', '1.00');
INSERT INTO `order_product` VALUES ('2', '2', '1', '2', '1.00', '60.00', '30.00');
INSERT INTO `order_product` VALUES ('3', '2', '5', '2', '1.00', '4.00', '3.00');
INSERT INTO `order_product` VALUES ('4', '3', '11', '2', '1.00', '76.00', '54.00');
INSERT INTO `order_product` VALUES ('5', '3', '10', '7', '1.00', '66.00', '54.00');
INSERT INTO `order_product` VALUES ('6', '3', '4', '6', '1.00', '23.00', '12.00');
INSERT INTO `order_product` VALUES ('7', '4', '4', '5', '1.00', '23.00', '12.00');
INSERT INTO `order_product` VALUES ('8', '4', '11', '2', '1.00', '76.00', '54.00');
INSERT INTO `order_product` VALUES ('9', '4', '3', '3', '1.00', '19.80', '10.00');
INSERT INTO `order_product` VALUES ('10', '4', '2', '3', '1.00', '5.00', '1.00');
INSERT INTO `order_product` VALUES ('11', '5', '11', '12', '1.00', '76.00', '54.00');
INSERT INTO `order_product` VALUES ('12', '6', '4', '3', '1.00', '23.00', '12.00');
INSERT INTO `order_product` VALUES ('13', '6', '5', '2', '1.00', '4.00', '3.00');
INSERT INTO `order_product` VALUES ('14', '6', '6', '3', '1.00', '53.00', '23.00');
INSERT INTO `order_product` VALUES ('15', '7', '11', '3', '1.00', '76.00', '54.00');
INSERT INTO `order_product` VALUES ('16', '7', '10', '2', '1.00', '66.00', '54.00');
INSERT INTO `order_product` VALUES ('17', '7', '9', '2', '1.00', '432.00', '123.00');
INSERT INTO `order_product` VALUES ('18', '7', '8', '1', '1.00', '66.00', '44.00');
INSERT INTO `order_product` VALUES ('19', '8', '7', '3', '1.00', '111.00', '23.00');
INSERT INTO `order_product` VALUES ('20', '8', '11', '2', '1.00', '76.00', '54.00');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `names` varchar(50) NOT NULL COMMENT '产品名称',
  `norms` varchar(20) NOT NULL COMMENT '规格',
  `unit` char(6) NOT NULL COMMENT '单位',
  `bid` float(7,2) NOT NULL COMMENT '进价',
  `price` float(7,2) NOT NULL COMMENT '定价',
  `num` int(6) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `factory` varchar(30) DEFAULT NULL COMMENT '生产厂家',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1：上架， 0：下架)',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '感冒药', '25g*12袋/盒', '盒', '30.00', '60.00', '21', '湖南兽药厂', '1', '2017-04-17 16:28:43', '2017-04-17 16:28:43');
INSERT INTO `product` VALUES ('2', '巨龙动保先乐10%阿莫西林可溶粉', '100克/袋', '袋', '1.00', '5.00', '237', '中国大陆', '1', '2017-04-19 17:32:02', '2017-04-19 17:32:02');
INSERT INTO `product` VALUES ('3', '华畜鸡用鸡球虫散', '500g/袋', '袋', '10.00', '19.80', '25', '中国大陆', '1', '2017-04-19 17:23:38', '2017-04-19 17:23:38');
INSERT INTO `product` VALUES ('4', 'aa', 'aa', 'a', '12.00', '23.00', '64', 'aa', '1', '2017-04-19 17:32:33', '2017-04-19 17:32:33');
INSERT INTO `product` VALUES ('5', 'bb', 'bb', 'b', '3.00', '4.00', '53', 'b', '1', '2017-04-19 17:32:33', '2017-04-19 17:32:33');
INSERT INTO `product` VALUES ('6', 'cccc', 'ccc', 'c', '23.00', '53.00', '101', 'c', '1', '2017-04-19 17:32:33', '2017-04-19 17:32:33');
INSERT INTO `product` VALUES ('7', 'dddd', 'dd', 'd', '23.00', '111.00', '52', 'd', '1', '2017-04-19 17:34:08', '2017-04-19 17:34:08');
INSERT INTO `product` VALUES ('8', 'eeeee', 'eee', 'e', '44.00', '66.00', '21', 'eeee', '1', '2017-04-19 17:32:56', '2017-04-19 17:32:56');
INSERT INTO `product` VALUES ('9', 'ffff', 'ff', 'f', '123.00', '432.00', '27', 'ffffffff', '1', '2017-04-19 17:32:56', '2017-04-19 17:32:56');
INSERT INTO `product` VALUES ('10', 'gggg', 'gg', 'g', '54.00', '66.00', '37', 'fff', '1', '2017-04-19 17:32:56', '2017-04-19 17:32:56');
INSERT INTO `product` VALUES ('11', 'hhhh', 'hhh', 'h', '54.00', '76.00', '45', 'hhh', '1', '2017-04-19 17:34:08', '2017-04-19 17:34:08');
INSERT INTO `product` VALUES ('12', '猪饲料', '50kg/袋', '袋', '200.00', '400.00', '40', '双胞胎', '1', '2017-04-19 17:09:18', '2017-04-19 17:09:18');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `product_id` int(8) NOT NULL COMMENT '产品ID',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `num` int(6) NOT NULL COMMENT '进货数量',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '进货时间',
  `user_name` varchar(10) NOT NULL COMMENT '操作人',
  `user_id` tinyint(2) NOT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', '2', '巨龙动保先乐10%阿莫西林可溶粉兽药猪药禽药', '10', '2017-04-12 15:38:09', 'admin', '1');
INSERT INTO `stock` VALUES ('2', '1', '感冒药', '23', '2017-04-12 15:39:26', 'admin', '1');
INSERT INTO `stock` VALUES ('3', '3', '华畜鸡用鸡球虫散中药预防治疗血便禽药鸡药止血止痢驱球虫病兽药', '5', '2017-04-14 12:23:35', 'admin', '1');
INSERT INTO `stock` VALUES ('4', '4', 'aa', '23', '2017-04-14 12:27:54', 'admin', '1');
INSERT INTO `stock` VALUES ('5', '5', 'bb', '3', '2017-04-14 12:27:58', 'admin', '1');
INSERT INTO `stock` VALUES ('6', '6', 'cccc', '4', '2017-04-14 12:28:01', 'admin', '1');
INSERT INTO `stock` VALUES ('7', '7', 'dddd', '55', '2017-04-14 12:28:08', 'admin', '1');
INSERT INTO `stock` VALUES ('8', '9', 'ffff', '6', '2017-04-14 12:28:12', 'admin', '1');
INSERT INTO `stock` VALUES ('9', '8', 'eeeee', '22', '2017-04-14 12:28:17', 'admin', '1');
INSERT INTO `stock` VALUES ('10', '10', 'gggg', '46', '2017-04-14 12:28:25', 'admin', '1');
INSERT INTO `stock` VALUES ('11', '11', 'hhhh', '66', '2017-04-14 12:29:26', 'admin', '1');
INSERT INTO `stock` VALUES ('12', '12', '猪饲料', '40', '2017-04-19 17:09:18', 'admin', '1');
INSERT INTO `stock` VALUES ('13', '3', '华畜鸡用鸡球虫散', '23', '2017-04-19 17:23:38', 'admin', '1');
INSERT INTO `stock` VALUES ('14', '4', 'aa', '55', '2017-04-19 17:23:47', 'admin', '1');
INSERT INTO `stock` VALUES ('15', '9', 'ffff', '23', '2017-04-19 17:23:50', 'admin', '1');
INSERT INTO `stock` VALUES ('16', '5', 'bb', '54', '2017-04-19 17:23:54', 'admin', '1');
INSERT INTO `stock` VALUES ('17', '6', 'cccc', '100', '2017-04-19 17:27:14', 'admin', '1');
INSERT INTO `stock` VALUES ('18', '2', '巨龙动保先乐10%阿莫西林可溶粉', '233', '2017-04-19 17:32:02', 'admin', '1');

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
