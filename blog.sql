/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-06-16 12:15:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `logip` varchar(30) DEFAULT NULL,
  `logtime` varchar(30) DEFAULT NULL,
  `logtype` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `loginhost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO `log_login` VALUES ('1', '0', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-02 16:04:32', '-5', '用户名或密码错误', 'localhost:8080');
INSERT INTO `log_login` VALUES ('2', '0', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-02 16:10:18', '-5', '用户名或密码错误', 'localhost:8080');
INSERT INTO `log_login` VALUES ('3', '0', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-02 16:10:22', '-5', '用户名或密码错误', 'localhost:8080');
INSERT INTO `log_login` VALUES ('4', '0', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-02 16:10:45', '-5', '用户名或密码错误', 'localhost:8080');
INSERT INTO `log_login` VALUES ('5', '10000', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-02 16:10:57', '1', '登录成功', 'localhost:8080');
INSERT INTO `log_login` VALUES ('6', '0', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-15 12:01:15', '-5', '用户名或密码错误', 'localhost:8080');
INSERT INTO `log_login` VALUES ('7', '10000', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-15 12:01:31', '1', '登录成功', 'localhost:8080');
INSERT INTO `log_login` VALUES ('8', '10000', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-16 11:43:16', '1', '登录成功', 'localhost:8080');
INSERT INTO `log_login` VALUES ('9', '0', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-16 12:00:02', '-5', '用户名或密码错误', 'localhost:8080');
INSERT INTO `log_login` VALUES ('10', '10000', 'admin_admin', null, '0:0:0:0:0:0:0:1', '2019-06-16 12:01:10', '1', '登录成功', 'localhost:8080');

-- ----------------------------
-- Table structure for rbac_resources
-- ----------------------------
DROP TABLE IF EXISTS `rbac_resources`;
CREATE TABLE `rbac_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resname` varchar(50) DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL COMMENT 'menu.title',
  `value` varchar(200) DEFAULT '',
  `path` varchar(200) DEFAULT '',
  `type` int(11) DEFAULT NULL COMMENT '1=url,2=view',
  `ico` varchar(50) DEFAULT NULL,
  `flow` int(11) DEFAULT NULL COMMENT '上级菜单',
  `flowtree` varchar(200) DEFAULT NULL,
  `ipcheck` tinyint(1) DEFAULT '1' COMMENT '是否做ip验证',
  `rolecheck` tinyint(1) DEFAULT '1' COMMENT '是否在角色验证',
  `logincheck` tinyint(1) DEFAULT '1' COMMENT '是否做登录验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_resources
-- ----------------------------
INSERT INTO `rbac_resources` VALUES ('1', '权限管理', 'rbac', 'rbac', '', '3', 'fa-anchor', '0', '1', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('2', '账户管理', 'background', 'background', '', '3', 'fa-users', '0', '2', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('5', '日志管理', 'log', 'log', '', '3', 'fa-file-text', '0', '5', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('6', '监控管理', 'listener', 'listener', '', '3', 'fa-chrome', '0', '6', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('7', '首页', 'index', 'index', '/proxybill/index', '1', '', '0', '7', '0', '0', '1');
INSERT INTO `rbac_resources` VALUES ('8', '资源管理', 'rbac.resources', 'resources', '/background/rbac/resources', '4', 'fa-circle-o', '1', '1,8', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('9', '角色管理', 'rbac.role', 'role', '/background/rbac/role', '4', 'fa-circle-o', '1', '1,9', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('12', '系统用户管理', 'background.sys_user', 'sys_user', '/background/user/sys/list', '4', 'fa-circle-o', '2', '2,12', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('16', '登录', 'index', 'login', '/proxybill/login', '1', null, '0', '16', '0', '0', '0');
INSERT INTO `rbac_resources` VALUES ('17', '资源绑定', 'rbac.role', 'fkset', '/background/rbac/role/fkset', '5', null, '9', '1,9,17', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('18', '资源增改', 'rbac.resources', 'edit', '/background/rbac/resources/edit', '5', null, '8', '1,8,18', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('19', '角色增改', 'rbac.role', 'edit', '/background/rbac/role/edit', '5', null, '9', '1,9,19', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('30', 'googleKey生成', 'index.profile', 'googleKey', '/proxybill/googleKey', '5', '', '0', '30', '0', '0', '1');
INSERT INTO `rbac_resources` VALUES ('31', 'googleKey绑定', 'index.profile', 'setGoogleKey', '/proxybill/setGoogleKey', '5', '', '0', '31', '0', '0', '1');
INSERT INTO `rbac_resources` VALUES ('45', '修改用户', 'background.sys_user', 'edit', '/background/user/edit', '5', '', '12', '2,12,45', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('51', '权限重载', 'rbac.role', 'reinit', '/background/rbac/role/reinit', '1', null, '9', '1,9,51', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('56', '注销用户', 'background.sys_user', 'del', '', '5', '', '12', '2,12,56', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('61', '个人中心', 'index.profile', 'profile', '/proxybill/profile', '1', '', '0', '61', '0', '0', '1');
INSERT INTO `rbac_resources` VALUES ('67', '主账号配置', 'background.sys_user', 'primuid', '', '2', '', '12', '2,12,67', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('80', '注销用户管理', 'background.sys_unuse', 'unuse', '/background/user/sys/unuse', '4', 'fa-circle-o', '2', '2,80', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('81', 'DruidStat', 'background.druid', 'druid', '/druid', '4', 'fa-tachometer', '6', '6,81', '1', '1', '1');
INSERT INTO `rbac_resources` VALUES ('82', '登录日志', 'log.loglogin', 'loglogin', '/background/log/login', '4', 'fa-circle-o', '5', '5,82', '1', '1', '1');

-- ----------------------------
-- Table structure for rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) DEFAULT '',
  `family` varchar(200) DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
INSERT INTO `rbac_role` VALUES ('1001', '超级管理员', '1001', '1001', '1', null);
INSERT INTO `rbac_role` VALUES ('1002', '财务组长', '1001,1002,1008,1002', '1001', '1', '财务');
INSERT INTO `rbac_role` VALUES ('1003', '客服组长', '1001,1003,1008,1003', '1001', '1', '客服');
INSERT INTO `rbac_role` VALUES ('1004', '财务', '1001,1008,1002,1004', '1002', '1', '财务');
INSERT INTO `rbac_role` VALUES ('1005', '客服', '1001,1008,1003,1005', '1003', '1', '客服');
INSERT INTO `rbac_role` VALUES ('1006', '一星客户', '1001,1002,1004,1006,1006', '1005', '0', '客户');
INSERT INTO `rbac_role` VALUES ('1007', '二星客户', '1001,1002,1004,1007,1007', '1005', '0', '客户');
INSERT INTO `rbac_role` VALUES ('1008', '人事组长', '1001,1002,1008', '1001', '1', '财务');
INSERT INTO `rbac_role` VALUES ('1013', '运维', '1001,1002,1008,1013,1023,1013', '1023', '1', '技术');
INSERT INTO `rbac_role` VALUES ('1016', '大数据组长', '1001,1002,1008,1016,1016', '1001', '1', '技术');
INSERT INTO `rbac_role` VALUES ('1017', '大数据', '1001,1002,1008,1016,1017,1017', '1016', '1', '技术');
INSERT INTO `rbac_role` VALUES ('1020', '广告管理', '1001,1002,1008,1020,1020', '1001', '1', '广告管理');
INSERT INTO `rbac_role` VALUES ('1022', '测试', '1001,1002,1008,1022,1024,1022', '1024', '1', '测试');
INSERT INTO `rbac_role` VALUES ('1023', '运维组长', '1001,1002,1023,1023', '1001', '1', '技术');
INSERT INTO `rbac_role` VALUES ('1024', '测试组长', '1001,1002,1008,1024,1024', '1001', '1', '技术');

-- ----------------------------
-- Table structure for rbac_rr_fk
-- ----------------------------
DROP TABLE IF EXISTS `rbac_rr_fk`;
CREATE TABLE `rbac_rr_fk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  `resources` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_rr_fk
-- ----------------------------
INSERT INTO `rbac_rr_fk` VALUES ('1', '1001', '1');
INSERT INTO `rbac_rr_fk` VALUES ('2', '1001', '8');
INSERT INTO `rbac_rr_fk` VALUES ('3', '1001', '9');
INSERT INTO `rbac_rr_fk` VALUES ('4', '1001', '2');
INSERT INTO `rbac_rr_fk` VALUES ('7', '1001', '12');
INSERT INTO `rbac_rr_fk` VALUES ('13', '1001', '5');
INSERT INTO `rbac_rr_fk` VALUES ('15', '1002', '2');
INSERT INTO `rbac_rr_fk` VALUES ('18', '1002', '12');
INSERT INTO `rbac_rr_fk` VALUES ('24', '1002', '5');
INSERT INTO `rbac_rr_fk` VALUES ('26', '1004', '2');
INSERT INTO `rbac_rr_fk` VALUES ('35', '1001', '16');
INSERT INTO `rbac_rr_fk` VALUES ('36', '1001', '17');
INSERT INTO `rbac_rr_fk` VALUES ('37', '1001', '18');
INSERT INTO `rbac_rr_fk` VALUES ('38', '1001', '19');
INSERT INTO `rbac_rr_fk` VALUES ('40', '1001', '45');
INSERT INTO `rbac_rr_fk` VALUES ('65', '1001', '7');
INSERT INTO `rbac_rr_fk` VALUES ('66', '1001', '30');
INSERT INTO `rbac_rr_fk` VALUES ('67', '1001', '31');
INSERT INTO `rbac_rr_fk` VALUES ('69', '1002', '45');
INSERT INTO `rbac_rr_fk` VALUES ('91', '1002', '7');
INSERT INTO `rbac_rr_fk` VALUES ('92', '1002', '16');
INSERT INTO `rbac_rr_fk` VALUES ('93', '1002', '30');
INSERT INTO `rbac_rr_fk` VALUES ('94', '1002', '31');
INSERT INTO `rbac_rr_fk` VALUES ('97', '1003', '2');
INSERT INTO `rbac_rr_fk` VALUES ('98', '1003', '12');
INSERT INTO `rbac_rr_fk` VALUES ('99', '1003', '45');
INSERT INTO `rbac_rr_fk` VALUES ('108', '1003', '5');
INSERT INTO `rbac_rr_fk` VALUES ('113', '1003', '7');
INSERT INTO `rbac_rr_fk` VALUES ('114', '1003', '16');
INSERT INTO `rbac_rr_fk` VALUES ('115', '1003', '30');
INSERT INTO `rbac_rr_fk` VALUES ('116', '1003', '31');
INSERT INTO `rbac_rr_fk` VALUES ('135', '1004', '7');
INSERT INTO `rbac_rr_fk` VALUES ('136', '1004', '16');
INSERT INTO `rbac_rr_fk` VALUES ('137', '1004', '30');
INSERT INTO `rbac_rr_fk` VALUES ('138', '1004', '31');
INSERT INTO `rbac_rr_fk` VALUES ('148', '1005', '7');
INSERT INTO `rbac_rr_fk` VALUES ('149', '1005', '16');
INSERT INTO `rbac_rr_fk` VALUES ('150', '1005', '30');
INSERT INTO `rbac_rr_fk` VALUES ('151', '1005', '31');
INSERT INTO `rbac_rr_fk` VALUES ('156', '1007', '7');
INSERT INTO `rbac_rr_fk` VALUES ('157', '1007', '16');
INSERT INTO `rbac_rr_fk` VALUES ('158', '1007', '30');
INSERT INTO `rbac_rr_fk` VALUES ('159', '1007', '31');
INSERT INTO `rbac_rr_fk` VALUES ('160', '1001', '51');
INSERT INTO `rbac_rr_fk` VALUES ('173', '1001', '56');
INSERT INTO `rbac_rr_fk` VALUES ('174', '1002', '56');
INSERT INTO `rbac_rr_fk` VALUES ('175', '1003', '56');
INSERT INTO `rbac_rr_fk` VALUES ('190', '1001', '61');
INSERT INTO `rbac_rr_fk` VALUES ('200', '1007', '61');
INSERT INTO `rbac_rr_fk` VALUES ('201', '1005', '61');
INSERT INTO `rbac_rr_fk` VALUES ('202', '1002', '61');
INSERT INTO `rbac_rr_fk` VALUES ('203', '1003', '61');
INSERT INTO `rbac_rr_fk` VALUES ('204', '1004', '61');
INSERT INTO `rbac_rr_fk` VALUES ('209', '1001', '67');
INSERT INTO `rbac_rr_fk` VALUES ('210', '1002', '67');
INSERT INTO `rbac_rr_fk` VALUES ('255', '1008', '7');
INSERT INTO `rbac_rr_fk` VALUES ('256', '1008', '16');
INSERT INTO `rbac_rr_fk` VALUES ('257', '1008', '30');
INSERT INTO `rbac_rr_fk` VALUES ('258', '1008', '31');
INSERT INTO `rbac_rr_fk` VALUES ('259', '1008', '61');
INSERT INTO `rbac_rr_fk` VALUES ('267', '1009', '7');
INSERT INTO `rbac_rr_fk` VALUES ('268', '1009', '16');
INSERT INTO `rbac_rr_fk` VALUES ('269', '1009', '30');
INSERT INTO `rbac_rr_fk` VALUES ('270', '1009', '31');
INSERT INTO `rbac_rr_fk` VALUES ('271', '1009', '61');
INSERT INTO `rbac_rr_fk` VALUES ('278', '1010', '7');
INSERT INTO `rbac_rr_fk` VALUES ('279', '1010', '16');
INSERT INTO `rbac_rr_fk` VALUES ('280', '1010', '30');
INSERT INTO `rbac_rr_fk` VALUES ('281', '1010', '31');
INSERT INTO `rbac_rr_fk` VALUES ('282', '1010', '61');
INSERT INTO `rbac_rr_fk` VALUES ('289', '1011', '7');
INSERT INTO `rbac_rr_fk` VALUES ('290', '1011', '16');
INSERT INTO `rbac_rr_fk` VALUES ('291', '1011', '30');
INSERT INTO `rbac_rr_fk` VALUES ('292', '1011', '31');
INSERT INTO `rbac_rr_fk` VALUES ('293', '1011', '61');
INSERT INTO `rbac_rr_fk` VALUES ('300', '1012', '7');
INSERT INTO `rbac_rr_fk` VALUES ('301', '1012', '16');
INSERT INTO `rbac_rr_fk` VALUES ('302', '1012', '30');
INSERT INTO `rbac_rr_fk` VALUES ('303', '1012', '31');
INSERT INTO `rbac_rr_fk` VALUES ('304', '1012', '61');
INSERT INTO `rbac_rr_fk` VALUES ('311', '1013', '7');
INSERT INTO `rbac_rr_fk` VALUES ('312', '1013', '16');
INSERT INTO `rbac_rr_fk` VALUES ('313', '1013', '30');
INSERT INTO `rbac_rr_fk` VALUES ('314', '1013', '31');
INSERT INTO `rbac_rr_fk` VALUES ('315', '1013', '61');
INSERT INTO `rbac_rr_fk` VALUES ('322', '1014', '7');
INSERT INTO `rbac_rr_fk` VALUES ('323', '1014', '16');
INSERT INTO `rbac_rr_fk` VALUES ('324', '1014', '30');
INSERT INTO `rbac_rr_fk` VALUES ('325', '1014', '31');
INSERT INTO `rbac_rr_fk` VALUES ('326', '1014', '61');
INSERT INTO `rbac_rr_fk` VALUES ('333', '1015', '7');
INSERT INTO `rbac_rr_fk` VALUES ('334', '1015', '16');
INSERT INTO `rbac_rr_fk` VALUES ('335', '1015', '30');
INSERT INTO `rbac_rr_fk` VALUES ('336', '1015', '31');
INSERT INTO `rbac_rr_fk` VALUES ('337', '1015', '61');
INSERT INTO `rbac_rr_fk` VALUES ('344', '1016', '7');
INSERT INTO `rbac_rr_fk` VALUES ('345', '1016', '16');
INSERT INTO `rbac_rr_fk` VALUES ('346', '1016', '30');
INSERT INTO `rbac_rr_fk` VALUES ('347', '1016', '31');
INSERT INTO `rbac_rr_fk` VALUES ('348', '1016', '61');
INSERT INTO `rbac_rr_fk` VALUES ('355', '1017', '7');
INSERT INTO `rbac_rr_fk` VALUES ('356', '1017', '16');
INSERT INTO `rbac_rr_fk` VALUES ('357', '1017', '30');
INSERT INTO `rbac_rr_fk` VALUES ('358', '1017', '31');
INSERT INTO `rbac_rr_fk` VALUES ('359', '1017', '61');
INSERT INTO `rbac_rr_fk` VALUES ('366', '1009', '2');
INSERT INTO `rbac_rr_fk` VALUES ('367', '1009', '12');
INSERT INTO `rbac_rr_fk` VALUES ('368', '1009', '45');
INSERT INTO `rbac_rr_fk` VALUES ('369', '1009', '56');
INSERT INTO `rbac_rr_fk` VALUES ('370', '1011', '2');
INSERT INTO `rbac_rr_fk` VALUES ('371', '1011', '12');
INSERT INTO `rbac_rr_fk` VALUES ('372', '1011', '45');
INSERT INTO `rbac_rr_fk` VALUES ('373', '1011', '56');
INSERT INTO `rbac_rr_fk` VALUES ('374', '1014', '2');
INSERT INTO `rbac_rr_fk` VALUES ('375', '1014', '12');
INSERT INTO `rbac_rr_fk` VALUES ('376', '1014', '45');
INSERT INTO `rbac_rr_fk` VALUES ('377', '1014', '56');
INSERT INTO `rbac_rr_fk` VALUES ('378', '1016', '2');
INSERT INTO `rbac_rr_fk` VALUES ('379', '1016', '12');
INSERT INTO `rbac_rr_fk` VALUES ('380', '1016', '45');
INSERT INTO `rbac_rr_fk` VALUES ('381', '1016', '56');
INSERT INTO `rbac_rr_fk` VALUES ('382', '1017', '2');
INSERT INTO `rbac_rr_fk` VALUES ('383', '1018', '2');
INSERT INTO `rbac_rr_fk` VALUES ('384', '1018', '12');
INSERT INTO `rbac_rr_fk` VALUES ('385', '1018', '16');
INSERT INTO `rbac_rr_fk` VALUES ('386', '1018', '30');
INSERT INTO `rbac_rr_fk` VALUES ('387', '1018', '31');
INSERT INTO `rbac_rr_fk` VALUES ('388', '1018', '45');
INSERT INTO `rbac_rr_fk` VALUES ('389', '1018', '56');
INSERT INTO `rbac_rr_fk` VALUES ('390', '1018', '61');
INSERT INTO `rbac_rr_fk` VALUES ('397', '1019', '7');
INSERT INTO `rbac_rr_fk` VALUES ('398', '1019', '16');
INSERT INTO `rbac_rr_fk` VALUES ('399', '1019', '30');
INSERT INTO `rbac_rr_fk` VALUES ('400', '1019', '31');
INSERT INTO `rbac_rr_fk` VALUES ('401', '1019', '61');
INSERT INTO `rbac_rr_fk` VALUES ('408', '1008', '2');
INSERT INTO `rbac_rr_fk` VALUES ('409', '1008', '12');
INSERT INTO `rbac_rr_fk` VALUES ('410', '1008', '45');
INSERT INTO `rbac_rr_fk` VALUES ('411', '1008', '56');
INSERT INTO `rbac_rr_fk` VALUES ('414', '1020', '7');
INSERT INTO `rbac_rr_fk` VALUES ('415', '1020', '16');
INSERT INTO `rbac_rr_fk` VALUES ('416', '1020', '30');
INSERT INTO `rbac_rr_fk` VALUES ('417', '1020', '31');
INSERT INTO `rbac_rr_fk` VALUES ('418', '1020', '61');
INSERT INTO `rbac_rr_fk` VALUES ('433', '1021', '7');
INSERT INTO `rbac_rr_fk` VALUES ('434', '1021', '16');
INSERT INTO `rbac_rr_fk` VALUES ('435', '1021', '30');
INSERT INTO `rbac_rr_fk` VALUES ('436', '1021', '31');
INSERT INTO `rbac_rr_fk` VALUES ('437', '1021', '61');
INSERT INTO `rbac_rr_fk` VALUES ('438', '1001', '80');
INSERT INTO `rbac_rr_fk` VALUES ('439', '1022', '7');
INSERT INTO `rbac_rr_fk` VALUES ('440', '1022', '16');
INSERT INTO `rbac_rr_fk` VALUES ('441', '1022', '30');
INSERT INTO `rbac_rr_fk` VALUES ('442', '1022', '31');
INSERT INTO `rbac_rr_fk` VALUES ('443', '1022', '61');
INSERT INTO `rbac_rr_fk` VALUES ('452', '1009', '80');
INSERT INTO `rbac_rr_fk` VALUES ('453', '1011', '80');
INSERT INTO `rbac_rr_fk` VALUES ('454', '1014', '80');
INSERT INTO `rbac_rr_fk` VALUES ('455', '1016', '80');
INSERT INTO `rbac_rr_fk` VALUES ('457', '1001', '81');
INSERT INTO `rbac_rr_fk` VALUES ('459', '1023', '12');
INSERT INTO `rbac_rr_fk` VALUES ('460', '1023', '45');
INSERT INTO `rbac_rr_fk` VALUES ('461', '1023', '56');
INSERT INTO `rbac_rr_fk` VALUES ('462', '1023', '80');
INSERT INTO `rbac_rr_fk` VALUES ('463', '1023', '7');
INSERT INTO `rbac_rr_fk` VALUES ('464', '1023', '16');
INSERT INTO `rbac_rr_fk` VALUES ('465', '1023', '30');
INSERT INTO `rbac_rr_fk` VALUES ('466', '1023', '31');
INSERT INTO `rbac_rr_fk` VALUES ('467', '1023', '61');
INSERT INTO `rbac_rr_fk` VALUES ('474', '1024', '2');
INSERT INTO `rbac_rr_fk` VALUES ('475', '1024', '12');
INSERT INTO `rbac_rr_fk` VALUES ('476', '1024', '45');
INSERT INTO `rbac_rr_fk` VALUES ('477', '1024', '56');
INSERT INTO `rbac_rr_fk` VALUES ('478', '1024', '80');
INSERT INTO `rbac_rr_fk` VALUES ('479', '1024', '7');
INSERT INTO `rbac_rr_fk` VALUES ('480', '1024', '16');
INSERT INTO `rbac_rr_fk` VALUES ('481', '1024', '30');
INSERT INTO `rbac_rr_fk` VALUES ('482', '1024', '31');
INSERT INTO `rbac_rr_fk` VALUES ('483', '1024', '61');
INSERT INTO `rbac_rr_fk` VALUES ('490', '1023', '2');
INSERT INTO `rbac_rr_fk` VALUES ('491', '1001', '82');
INSERT INTO `rbac_rr_fk` VALUES ('492', '1001', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `info` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '0 删除,1可用,2禁用',
  `googleKey` varchar(30) DEFAULT '' COMMENT 'google身份验证器密匙',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username_uneq` (`username`),
  UNIQUE KEY `nickname_uneq` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=10166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000', 'admin_admin', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '超管', '1001', '', '1', null);
INSERT INTO `user` VALUES ('10002', 'admin_0020', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户1', '1005', '', '1', null);
INSERT INTO `user` VALUES ('10003', 'admin_test', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户2', '1007', 'jofSe22', '0', '47RAQJJ5Z5XAYXU2');
INSERT INTO `user` VALUES ('10004', 'admin_0023', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户3', '1003', '', '1', null);
INSERT INTO `user` VALUES ('10024', 'admin_0049', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户4', '1004', '', '1', null);
INSERT INTO `user` VALUES ('10026', 'admin_0032', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户5', '1002', '', '1', null);
INSERT INTO `user` VALUES ('10128', 'admin_0061', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户6', '1004', null, '0', null);
INSERT INTO `user` VALUES ('10129', 'admin_0011', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户7', '1005', '', '0', null);
INSERT INTO `user` VALUES ('10130', 'admin_0016', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户8', '1008', null, '1', null);
INSERT INTO `user` VALUES ('10131', 'admin_0071', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户9', '1005', null, '0', null);
INSERT INTO `user` VALUES ('10132', 'admin_666', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户10', '1017', null, '1', null);
INSERT INTO `user` VALUES ('10143', 'admin_0029', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户11', '1017', null, '0', 'HGN2F4X3EEAB5QRJ');
INSERT INTO `user` VALUES ('10144', 'admin_0027', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户12', '1020', null, '1', '');
INSERT INTO `user` VALUES ('10148', 'admin_xiaodong', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户13', '1016', null, '1', '');
INSERT INTO `user` VALUES ('10150', 'big_xiaopang', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户14', '1017', '', '0', null);
INSERT INTO `user` VALUES ('10151', 'big_kuaizi', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户15', '1017', '', '0', null);
INSERT INTO `user` VALUES ('10154', 'admin_xiaozhu', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户16', '1023', '', '1', null);
INSERT INTO `user` VALUES ('10155', 'admin_xiaoxia', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户17', '1022', '', '1', null);
INSERT INTO `user` VALUES ('10156', 'admin_xiaoyou', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户18', '1013', null, '1', null);
INSERT INTO `user` VALUES ('10157', 'admin_ailen', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户19', '1013', '', '1', null);
INSERT INTO `user` VALUES ('10160', 'admin_0021', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户20', '1004', null, '0', null);
INSERT INTO `user` VALUES ('10161', 'admin_0009', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户21', '1004', null, '0', null);
INSERT INTO `user` VALUES ('10162', 'admin_mike', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户22', '1013', null, '1', null);
INSERT INTO `user` VALUES ('10164', '15057011110', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户23', '1007', '', '1', 'SJT6ADGNZM6JMGVZ');
INSERT INTO `user` VALUES ('10165', 'admin_qiaozhi', '*2570EA3FFED12D632308A17009DB321E69CCB6E4', '用户24', '1013', null, '1', null);
