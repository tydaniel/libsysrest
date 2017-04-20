/*
Navicat MySQL Data Transfer

Source Server         : wamp-mysql
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : libdb

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-04-20 17:33:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(150) NOT NULL COMMENT '书名',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `publishing` varchar(50) NOT NULL COMMENT '出版社',
  `class` varchar(40) NOT NULL COMMENT '图书分类',
  `ISBN` varchar(20) NOT NULL COMMENT '图书ISBN编号',
  `total` tinyint(2) NOT NULL DEFAULT '5' COMMENT '库存量',
  `borrowed` tinyint(2) NOT NULL DEFAULT '0' COMMENT '已借数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='图书';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '极简欧洲史', '宇宙', '世界图书出版社', '历史', '123-N111', '5', '1');
INSERT INTO `book` VALUES ('2', '麦哲伦航海纪 ', '苏惠玲', '希望出版社', '历史', '123-N112', '10', '2');
INSERT INTO `book` VALUES ('3', '未来简史', '尤瓦尔', '中信出版社', '历史', '123-N113', '8', '8');
INSERT INTO `book` VALUES ('4', 'TensorFlow实战', '黄文坚', '电子工业出版社', '计算机', '224-N211', '3', '1');
INSERT INTO `book` VALUES ('5', '盈利的艺术', '亚德里安', '电子工业出版社', '计算机', '224-N213', '5', '1');

-- ----------------------------
-- Table structure for `borrowinfo`
-- ----------------------------
DROP TABLE IF EXISTS `borrowinfo`;
CREATE TABLE `borrowinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userid` int(11) NOT NULL COMMENT '借阅用户ID',
  `bookid` int(11) NOT NULL COMMENT '借阅图书ID',
  `borrowdate` datetime NOT NULL COMMENT '借阅时间',
  `returndate` datetime NOT NULL COMMENT '归还时间',
  `returnflag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '归还状态标志',
  `expireflag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '过期状态标志',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `borrowinfo_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `borrowinfo_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='借阅信息明细';

-- ----------------------------
-- Records of borrowinfo
-- ----------------------------
INSERT INTO `borrowinfo` VALUES ('1', '1', '1', '2017-04-06 10:27:55', '2017-05-06 23:59:59', '0', '0');
INSERT INTO `borrowinfo` VALUES ('2', '1', '2', '2017-04-06 10:27:55', '2017-05-06 23:59:59', '0', '0');
INSERT INTO `borrowinfo` VALUES ('3', '1', '5', '2017-04-06 10:27:55', '2017-05-06 23:59:59', '0', '0');
INSERT INTO `borrowinfo` VALUES ('4', '2', '3', '2017-03-06 10:27:55', '2017-04-06 23:59:59', '1', '0');
INSERT INTO `borrowinfo` VALUES ('5', '2', '4', '2017-04-06 10:27:55', '2017-05-06 23:59:59', '0', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `address` varchar(200) NOT NULL COMMENT '住址',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `maxborrow` tinyint(2) NOT NULL DEFAULT '5' COMMENT '最大允许借书量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='读者信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'pxj', '123456', '潘小熊', '大紫竹花园1000号\'', '13512154372', '5');
INSERT INTO `user` VALUES ('2', 'wang', '123456', '王小毛', '大张江科技园2000号', '13512345879', '5');
INSERT INTO `user` VALUES ('3', 'lee', '123456', '李二郎', '大漕河高新园区3000号', '13512112237', '5');
INSERT INTO `user` VALUES ('6', 'test11', '123456', '更新test', '最新的testing 1000号\'', '13512154372', '5');
