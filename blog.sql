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
INSERT INTO `rbac_rr_fk` VALUES ('35', '1001', '16');
INSERT INTO `rbac_rr_fk` VALUES ('36', '1001', '17');
INSERT INTO `rbac_rr_fk` VALUES ('37', '1001', '18');
INSERT INTO `rbac_rr_fk` VALUES ('38', '1001', '19');
INSERT INTO `rbac_rr_fk` VALUES ('40', '1001', '45');
INSERT INTO `rbac_rr_fk` VALUES ('65', '1001', '7');
INSERT INTO `rbac_rr_fk` VALUES ('66', '1001', '30');
INSERT INTO `rbac_rr_fk` VALUES ('67', '1001', '31');
INSERT INTO `rbac_rr_fk` VALUES ('160', '1001', '51');
INSERT INTO `rbac_rr_fk` VALUES ('173', '1001', '56');
INSERT INTO `rbac_rr_fk` VALUES ('190', '1001', '61');
INSERT INTO `rbac_rr_fk` VALUES ('209', '1001', '67');
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
