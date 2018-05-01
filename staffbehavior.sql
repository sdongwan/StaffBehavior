/*
Navicat MySQL Data Transfer

Source Server         : localdb
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : staffbehavior

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-05-01 22:42:01
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
  `create_time` varchar(20) NOT NULL DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '修改日期',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '中科云尚', '东莞东城', '11012112100', '2018-03-21', '', '');

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
  `update_time` varchar(20) DEFAULT '' COMMENT '修改日期',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES ('1', '00001', '研发二部', '10', '2018-04-21', '', '');
INSERT INTO `t_depart` VALUES ('9', '00001', '测试小组', '0', '2018-05-01', '18-05-01', 'gdfg');
INSERT INTO `t_depart` VALUES ('10', '00001', '市场', '0', '2018-05-01', '', '');
INSERT INTO `t_depart` VALUES ('11', '00001', '测试', '0', '2018-05-01', '2018-05-01', '随风倒十分');
INSERT INTO `t_depart` VALUES ('12', '00001', '测试', '0', '2018-05-01', '2018-05-01', '地方大师傅');
INSERT INTO `t_depart` VALUES ('13', '00001', '13', '1', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('14', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('15', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('16', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('17', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('18', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('19', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('20', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('21', '00001', '14', '14', '2018-05-01', '', '0');
INSERT INTO `t_depart` VALUES ('22', '00001', '14', '14', '2018-05-01', '', '0');

-- ----------------------------
-- Table structure for `t_factor`
-- ----------------------------
DROP TABLE IF EXISTS `t_factor`;
CREATE TABLE `t_factor` (
  `factor_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '影响行为因素编号',
  `factor_name` varchar(20) NOT NULL DEFAULT '' COMMENT '影响行为因素名称',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(20) DEFAULT '' COMMENT '修改日期',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`factor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_factor
-- ----------------------------
INSERT INTO `t_factor` VALUES ('1', '环境氛围', '2018-04-30', '', '');

-- ----------------------------
-- Table structure for `t_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `job_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `job_name` varchar(10) NOT NULL DEFAULT '' COMMENT '职位名称',
  `depart_id` int(5) NOT NULL DEFAULT '0' COMMENT '部门编号',
  `create_time` varchar(20) NOT NULL DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '修改日期',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', '见习软件开发人员', '1', '2018-04-21', '', '');

-- ----------------------------
-- Table structure for `t_research`
-- ----------------------------
DROP TABLE IF EXISTS `t_research`;
CREATE TABLE `t_research` (
  `research_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '调查问卷题目编号',
  `question` varchar(255) NOT NULL DEFAULT '' COMMENT '调查问卷问题',
  `create_time` varchar(20) NOT NULL DEFAULT '',
  `update_time` varchar(20) NOT NULL DEFAULT '',
  `factor_id` int(5) NOT NULL DEFAULT '0' COMMENT '因素编号',
  `valid_flag` int(1) NOT NULL DEFAULT '0' COMMENT '问卷调查问题有效性（0：无效 ；1：有限）',
  PRIMARY KEY (`research_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_research
-- ----------------------------
INSERT INTO `t_research` VALUES ('1', '你觉得什么样的环境适合工作？', '2018-02-29', '2018-02-29', '1', '1');

-- ----------------------------
-- Table structure for `t_staff`
-- ----------------------------
DROP TABLE IF EXISTS `t_staff`;
CREATE TABLE `t_staff` (
  `staff_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `depart_id` int(5) NOT NULL COMMENT '部门id',
  `company_id` int(5) NOT NULL COMMENT '公司编号',
  `staff_name` varchar(10) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `job_id` int(5) NOT NULL DEFAULT '0' COMMENT '员工职位d',
  `work_year` int(3) DEFAULT '0' COMMENT '员工工龄',
  `enter_time` varchar(20) NOT NULL DEFAULT '' COMMENT '入职时间',
  `password` varchar(15) NOT NULL DEFAULT '' COMMENT '员工登陆系统密码',
  `account` varchar(15) NOT NULL DEFAULT '' COMMENT '系统登陆账号',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0:男；1：女)',
  `salary` varchar(6) NOT NULL DEFAULT '' COMMENT '薪资',
  `education` varchar(5) DEFAULT NULL COMMENT '学历',
  `graduate_school` varchar(10) DEFAULT '' COMMENT '毕业院校',
  `married` int(1) NOT NULL DEFAULT '0' COMMENT '婚姻（0：未婚  1：已婚）',
  `birthday` varchar(20) DEFAULT '' COMMENT '出生日期',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` varchar(20) DEFAULT '' COMMENT '创建日期',
  `update_time` varchar(20) DEFAULT '' COMMENT '修改日期',
  `hometown` varchar(10) DEFAULT '' COMMENT '籍贯',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_staff
-- ----------------------------
INSERT INTO `t_staff` VALUES ('1', '9', '1', 'admin1', '1', '0', '2018-04-21', 'admin', 'admin', '1', '2500', '初中', '五邑大学', '1', '2018-05-01', '无', '2018-05-01', '2018-05-01', '安徽');
INSERT INTO `t_staff` VALUES ('2', '0', '0', 'fdsfdsf', '0', '0', '2018-05-01', 'fdsf', 'fdsf', '0', '300', '', 'fdsf', '1', '2018-05-01', 'fdsfsdf', '2018-05-01', '2018-05-d', 'fdsf');
INSERT INTO `t_staff` VALUES ('3', '0', '0', 'fsdfdsf', '0', '0', '2018-05-01', 'fdsf', 'fdsf', '0', 'fdsf', '', 'fdsf', '1', '2018-05-08', '', '2018-05-01', '', 'fsdfds');
INSERT INTO `t_staff` VALUES ('4', '0', '0', 'erew', '0', '0', '2018-05-01', 'fdsf', 'fsdf', '1', '300', '', 'fdsfds', '1', '2018-05-01', 'fdsfds', '2018-05-01', '2018-05-d', 'fdsfsd');
INSERT INTO `t_staff` VALUES ('7', '0', '0', 'fdsfds', '1', '0', '2018-05-01', 'fdsf', 'fdsf', '0', 'fdsf', '', 'fdsf', '1', '2018-05-01', 'fdsfsd', '2018-05-01', '', 'fdsf');
INSERT INTO `t_staff` VALUES ('8', '0', '0', 'gd', '0', '0', '2018-05-01', 'gfdg', 'gfdgg', '0', '500', '', '', '0', '2018-05-01', '', '2018-05-01', '', 'gdfg');
INSERT INTO `t_staff` VALUES ('9', '0', '0', 'fdsfsd', '1', '0', '2018-05-01', 'fdsf', 'fdsf', '0', '500', '', '', '0', '2018-05-01', '', '2018-05-01', '', 'fdsf');
INSERT INTO `t_staff` VALUES ('10', '1', '0', 'fdsfsd', '1', '0', '2018-05-01', 'fdsf', 'fdsf', '0', 'fdsf', '', '', '1', '2018-05-01', '', '2018-05-01', '', '');

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
  `create_time` varchar(20) DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT '' COMMENT '修改日期',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'admin', 'admin1', '1', '1', '2018-04-21', '');
