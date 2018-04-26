/*
Navicat MySQL Data Transfer

Source Server         : localdb
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : staffbehavior

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-26 22:41:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `company_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `company_name` varchar(20) NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_address` varchar(50) DEFAULT '' COMMENT '公司地址',
  `company_phone` varchar(11) DEFAULT '' COMMENT '公司电话',
  `create_time` varchar(15) NOT NULL DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '中科云尚', '东莞东城', '11012112100', '2018-03-21');

-- ----------------------------
-- Table structure for `t_depart`
-- ----------------------------
DROP TABLE IF EXISTS `t_depart`;
CREATE TABLE `t_depart` (
  `depart_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `company_id` int(5) unsigned zerofill NOT NULL DEFAULT '00000' COMMENT '公司编号',
  `depart_name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `staff_num` int(125) NOT NULL DEFAULT '0' COMMENT '部门员工数量',
  `create_time` varchar(20) NOT NULL DEFAULT '' COMMENT '部门创建时间',
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES ('1', '00001', '研发二部', '10', '2018-04-21');

-- ----------------------------
-- Table structure for `t_factor`
-- ----------------------------
DROP TABLE IF EXISTS `t_factor`;
CREATE TABLE `t_factor` (
  `factor_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '影响行为因素编号',
  `factor_name` varchar(20) NOT NULL DEFAULT '' COMMENT '影响行为因素名称',
  `company_id` int(10) NOT NULL COMMENT '公司编号',
  `depart_id` int(10) NOT NULL COMMENT '部门编号',
  `create_time` varchar(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`factor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_factor
-- ----------------------------

-- ----------------------------
-- Table structure for `t_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `job_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `job_name` varchar(10) NOT NULL DEFAULT '' COMMENT '职位名称',
  `depart_id` int(5) NOT NULL DEFAULT '0' COMMENT '部门编号',
  `create_time` varchar(20) NOT NULL DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', '见习软件开发人员', '1', '2018-04-21');

-- ----------------------------
-- Table structure for `t_staff`
-- ----------------------------
DROP TABLE IF EXISTS `t_staff`;
CREATE TABLE `t_staff` (
  `staff_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `post_id` int(5) NOT NULL COMMENT '部门id',
  `company_id` int(5) NOT NULL COMMENT '公司编号',
  `staff_name` varchar(10) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `job_id` int(5) NOT NULL DEFAULT '0' COMMENT '员工职位d',
  `work_year` int(3) DEFAULT '0' COMMENT '员工工龄',
  `enter_time` varchar(20) NOT NULL DEFAULT '' COMMENT '入职时间',
  `password` varchar(15) NOT NULL DEFAULT '' COMMENT '员工登陆系统密码',
  `account` varchar(15) NOT NULL DEFAULT '' COMMENT '系统登陆账号',
  `gender` varchar(3) NOT NULL DEFAULT '' COMMENT '性别',
  `salary` varchar(6) NOT NULL DEFAULT '' COMMENT '薪资',
  `age` int(3) NOT NULL DEFAULT '0' COMMENT '年龄',
  `education` varchar(5) DEFAULT NULL COMMENT '学历',
  `graduate_school` varchar(10) DEFAULT '' COMMENT '毕业院校',
  `married` varchar(2) NOT NULL DEFAULT '' COMMENT '婚姻',
  `birthday` varchar(12) DEFAULT '' COMMENT '出生日期',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_staff
-- ----------------------------
INSERT INTO `t_staff` VALUES ('1', '1', '1', 'admin', '1', '0', '2018-04-21', 'admin', 'admin', '', '', '0', null, '', '', '');

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `sys_user_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '系统用户编号',
  `account` varchar(15) NOT NULL DEFAULT '' COMMENT '系统用户账号',
  `password` varchar(15) NOT NULL DEFAULT '' COMMENT '系统用户密码',
  `company_id` int(5) NOT NULL DEFAULT '0' COMMENT '公司id',
  `job_id` int(5) NOT NULL DEFAULT '0' COMMENT '职位编号',
  `create_time` varchar(10) DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'admin', 'admin1', '1', '1', '2018-04-21');
