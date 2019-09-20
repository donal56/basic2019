/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : requisicion

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 20/09/2019 14:35:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('JEFE', 8, 1566510212);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  INDEX `fk_auth_item_group_code`(`group_code`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//controller', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//crud', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//extension', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//form', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//model', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//module', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/asset/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/asset/compress', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/asset/template', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush-all', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush-schema', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/create', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/delete', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/index', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/update', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/view', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/index', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/view', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/load', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/unload', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/action', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/*', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/*', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/download', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/hello/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/hello/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/help/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/help/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/message/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/message/config', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/message/extract', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/down', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/history', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/mark', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/new', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/redo', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/to', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/up', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/*', 3, NULL, NULL, NULL, 1565623698, 1565623698, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/create', 3, NULL, NULL, NULL, 1565623700, 1565623700, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/delete', 3, NULL, NULL, NULL, 1565623698, 1565623698, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/index', 3, NULL, NULL, NULL, 1565623700, 1565623700, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/update', 3, NULL, NULL, NULL, 1565623699, 1565623699, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/view', 3, NULL, NULL, NULL, 1565623700, 1565623700, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/*', 3, NULL, NULL, NULL, 1565623696, 1565623696, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/create', 3, NULL, NULL, NULL, 1565623697, 1565623697, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/delete', 3, NULL, NULL, NULL, 1565623696, 1565623696, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/index', 3, NULL, NULL, NULL, 1565623698, 1565623698, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/update', 3, NULL, NULL, NULL, 1565623697, 1565623697, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/view', 3, NULL, NULL, NULL, 1565623697, 1565623697, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/*', 3, NULL, NULL, NULL, 1565623693, 1565623693, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/create', 3, NULL, NULL, NULL, 1565623695, 1565623695, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/delete', 3, NULL, NULL, NULL, 1565623694, 1565623694, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/index', 3, NULL, NULL, NULL, 1565623696, 1565623696, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/update', 3, NULL, NULL, NULL, 1565623694, 1565623694, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/view', 3, NULL, NULL, NULL, 1565623695, 1565623695, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/*', 3, NULL, NULL, NULL, 1565623691, 1565623691, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/create', 3, NULL, NULL, NULL, 1565623692, 1565623692, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/delete', 3, NULL, NULL, NULL, 1565623691, 1565623691, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/index', 3, NULL, NULL, NULL, 1565623693, 1565623693, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/update', 3, NULL, NULL, NULL, 1565623691, 1565623691, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/view', 3, NULL, NULL, NULL, 1565623693, 1565623693, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/*', 3, NULL, NULL, NULL, 1565623687, 1565623687, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/create', 3, NULL, NULL, NULL, 1565623689, 1565623689, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/delete', 3, NULL, NULL, NULL, 1565623689, 1565623689, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/index', 3, NULL, NULL, NULL, 1565623690, 1565623690, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/report', 3, NULL, NULL, NULL, 1565623688, 1565623688, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/update', 3, NULL, NULL, NULL, 1565623689, 1565623689, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/view', 3, NULL, NULL, NULL, 1565623690, 1565623690, NULL);
INSERT INTO `auth_item` VALUES ('/site/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/about', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/captcha', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/contact', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/dash', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/error', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/index', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/login', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/logout', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/*', 3, NULL, NULL, NULL, 1565623684, 1565623684, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/contador', 3, NULL, NULL, NULL, 1565623685, 1565623685, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/create', 3, NULL, NULL, NULL, 1565623686, 1565623686, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/delete', 3, NULL, NULL, NULL, 1565623685, 1565623685, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/index', 3, NULL, NULL, NULL, 1565623687, 1565623687, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/submenu', 3, NULL, NULL, NULL, 1565623684, 1565623684, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/update', 3, NULL, NULL, NULL, 1565623685, 1565623685, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/view', 3, NULL, NULL, NULL, 1565623686, 1565623686, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/*', 3, NULL, NULL, NULL, 1565623682, 1565623682, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/create', 3, NULL, NULL, NULL, 1565623683, 1565623683, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/delete', 3, NULL, NULL, NULL, 1565623682, 1565623682, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/index', 3, NULL, NULL, NULL, 1565623683, 1565623683, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/update', 3, NULL, NULL, NULL, 1565623682, 1565623682, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/view', 3, NULL, NULL, NULL, 1565623683, 1565623683, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/captcha', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email-receive', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-registration-email', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/login', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/logout', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery-receive', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/registration', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/refresh-routes', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-permissions', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-routes', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-permissions', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-roles', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('Admin', 1, 'Admin', NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('assignRolesToUsers', 2, 'Assign roles to users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('bindUserToIp', 2, 'Bind user to IP', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('changeOwnPassword', 2, 'Change own password', NULL, NULL, 1426062189, 1426062189, 'userCommonPermissions');
INSERT INTO `auth_item` VALUES ('changeUserPassword', 2, 'Change user password', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('commonPermission', 2, 'Common permission', NULL, NULL, 1426062188, 1426062188, NULL);
INSERT INTO `auth_item` VALUES ('createUsers', 2, 'Create users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('deleteUsers', 2, 'Delete users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('editUserEmail', 2, 'Edit user email', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('editUsers', 2, 'Edit users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('JEFE', 1, 'JEFE', NULL, NULL, 1566510051, 1566510051, NULL);
INSERT INTO `auth_item` VALUES ('JEFE DEP', 2, 'JEFE DE DEPARTAMENTO', NULL, NULL, 1566510140, 1566510140, 'JEFES');
INSERT INTO `auth_item` VALUES ('otro', 1, 'otro', NULL, NULL, 1510364638, 1510364638, NULL);
INSERT INTO `auth_item` VALUES ('Usuario General', 2, 'Usuario General', NULL, NULL, 1510367259, 1510367259, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewRegistrationIp', 2, 'View registration IP', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserEmail', 2, 'View user email', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserRoles', 2, 'View user roles', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUsers', 2, 'View users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewVisitLog', 2, 'View visit log', NULL, NULL, 1426062189, 1426062189, 'userManagement');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '//index');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/dashboard/*');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/*');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/delete');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/update');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/sws-dashboard/*');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/sws-dashboard/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/sws-dashboard/submenu');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/view');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('otro', 'Usuario General');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');

-- ----------------------------
-- Table structure for auth_item_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group`  (
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('JEFES', 'JEFES', 1566510105, 1566510105);
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'User common permission', 1426062189, 1426062189);
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User management', 1426062189, 1426062189);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for req_configuracion
-- ----------------------------
DROP TABLE IF EXISTS `req_configuracion`;
CREATE TABLE `req_configuracion`  (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_instituto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `con_logo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `con_revision` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`con_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of req_configuracion
-- ----------------------------
INSERT INTO `req_configuracion` VALUES (1, 'VILLAHERMOSA', 'img\\requisiciones\\logo.jpg', '1');

-- ----------------------------
-- Table structure for req_detalle
-- ----------------------------
DROP TABLE IF EXISTS `req_detalle`;
CREATE TABLE `req_detalle`  (
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `det_fkrequisicion` int(11) NOT NULL,
  `det_clave` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `det_partida` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `det_cantidad` decimal(11, 2) DEFAULT NULL,
  `det_unidad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `det_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `det_costo` decimal(11, 2) DEFAULT NULL,
  PRIMARY KEY (`det_id`) USING BTREE,
  INDEX `fk_Producto_requisicion_req1_idx`(`det_fkrequisicion`) USING BTREE,
  CONSTRAINT `fk_Producto_requisicion_req1` FOREIGN KEY (`det_fkrequisicion`) REFERENCES `req_requisicion` (`req_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of req_detalle
-- ----------------------------
INSERT INTO `req_detalle` VALUES (9, 5, '1', '1', 1.00, '1', '1', 1.00);
INSERT INTO `req_detalle` VALUES (10, 6, '1', '1', 1.00, '1', '1', 1.00);
INSERT INTO `req_detalle` VALUES (21, 9, '11 M00 PIA 2 5 3 2530', '21401', 1.00, 'PZA', 'TONER CANON 1025N', 1550.00);
INSERT INTO `req_detalle` VALUES (35, 17, '2  5 3  2530 5 E010  1 14 127 7 3 1 7.1 20 31401', '31401', 1.00, 'SERVICIO', 'SERVICIO DE INTERNET DEL MES DE AGOSTO', 33742.98);
INSERT INTO `req_detalle` VALUES (37, 19, '2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 31401', '31401', 1.00, 'SERVICIO', 'SERVICIO TELEFONICO DEL MES DE AGOSTO', 6984.06);
INSERT INTO `req_detalle` VALUES (39, 21, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 21401', '21401', 1.00, 'PZA', 'KIT FUSOR PARA IMPRESORA MARCA HP MODELO LASERJET 5550 Q3984-\r\n67901/Q3984A', 14400.00);
INSERT INTO `req_detalle` VALUES (41, 23, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 31603', '31603', 1.00, 'SERVICIO', 'SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE AGOSTO', 45351.36);
INSERT INTO `req_detalle` VALUES (54, 26, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 5 2 1 5.3 24 35102', '35102 ', 1.00, 'SERVICIO', 'Instalación de canalización y colocación de tubería subterránea y en edificios, para telecomunicaciones. La instalación subterránea incluye tritubo de polietileno de alta densidad (PEAD/HDPE), de 3x40 mm de diámetro y 3 mm de espesor, formado por tres tubos iguales, unidos entre sí por medio de una membrana y dispuestos paralelamente en un mismo plano, ejecutada en zanja, ubicaciones: desde edificio laboratorio de investigación II a parte central de área de económico administrativo, desde industrial a jardín de parte lateral, de ciencias de la tierra a ingeniería petrolera, desde edificio de centro de cómputo al edificio de informática, para la instalación de red inalámbrica. Incluye Tuberia conduit delgada, registros de concreto de 1 x 1 con orificios para instalación de tubería, Cajas de Registros tipo condulet. Incluye cableado UTP cat 6 multipar para alcance de 10 gigabits. La ubicación de tubería conduit delgada incluye cableado UTP cat 6 MULTIPAR en los edificios de : Edificio de Centro de Cómputo, Edificio posgrado, centro de información, dirección, Edificio J, Edificio H, Edificio M, Edificio E, Edificio EAULA, Edificio Extraescolares, Edificio Petrolera, Edificio Industrial, Edificio Gimnasio Auditorio. Edificio Z, Edificio Incubadora, Edificio Cafetería, Segundo pago\r\n', 814665.40);
INSERT INTO `req_detalle` VALUES (58, 27, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 5 2 1 5.3 24 35102', '24801', 22.00, 'PZA', 'Suministro de platabandas a base de tablarocas de 13 mm. de espesor de 10cm. de altura hasta 0.90cm. de ancho  color blanco, incluye instalación', 76999.96);
INSERT INTO `req_detalle` VALUES (59, 27, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 5 2 1 5.3 24 35102', '24801', 21.00, 'PZA', 'Suministro de plafón falso. modulado en placas de 0.61 cms. x 0.61 cms. incluye instalación', 50063.94);
INSERT INTO `req_detalle` VALUES (60, 27, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 5 2 1 5.3 24 35102', '24801', 5.00, 'PZA', 'suministro de ventana de aluminio de 1.20Mtrs x 1.40Mtrs en color blanco que incluye vidrio, marcos de aluminio, pegamento e instalación', 35686.10);
INSERT INTO `req_detalle` VALUES (71, 28, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 24601', '24601', 45.00, 'PZA', 'canaleta 13x7 mm 2 mtrs de largo', 70868.28);
INSERT INTO `req_detalle` VALUES (72, 28, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 24601', '24601', 5.00, 'PZA', 'Bobina de cable de 205 metros Cat5e blindado negro, evita descargar', 32058.98);
INSERT INTO `req_detalle` VALUES (73, 28, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 24601', '24601', 2.00, 'PZA', 'Herramienta Quita forros en cables ', 8856.23);
INSERT INTO `req_detalle` VALUES (74, 28, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 24601', '24601', 25.00, 'PZA', 'Conectores RJ45 para cable UTP categoría 6', 41668.65);
INSERT INTO `req_detalle` VALUES (75, 28, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 24601', '24601', 3.00, 'PZA', 'Pinzas para plegar cables CAT5/CAT6 con cavidades para RJ11, RJ12 y RJ45', 31867.85);

-- ----------------------------
-- Table structure for req_personal
-- ----------------------------
DROP TABLE IF EXISTS `req_personal`;
CREATE TABLE `req_personal`  (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `per_paterno` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `per_materno` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `per_fkuser` int(11) NOT NULL,
  PRIMARY KEY (`per_id`) USING BTREE,
  INDEX `fk_req_personal_user1_idx`(`per_fkuser`) USING BTREE,
  CONSTRAINT `fk_req_personal_user1` FOREIGN KEY (`per_fkuser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of req_personal
-- ----------------------------
INSERT INTO `req_personal` VALUES (5, 'MTC. JOSE MANUEL', 'GOMEZ', 'ZEA', 1);
INSERT INTO `req_personal` VALUES (6, 'ISC. LAURA ELENA', 'SUAREZ', 'VIDAL', 6);
INSERT INTO `req_personal` VALUES (7, 'M.A. ANGEL FRANCISCO', 'VELASCO', 'MUÑOZ', 7);
INSERT INTO `req_personal` VALUES (8, 'M.A.P.P EDUARDO ENOCH', 'GALINDO', 'SANCHEZ', 9);
INSERT INTO `req_personal` VALUES (9, 'M.I. RAUL', 'RAMIREZ', 'QUIROZ', 10);
INSERT INTO `req_personal` VALUES (10, 'M.C. BRISSA ROXANA', 'DE LEON ', 'DE LOS SANTOS', 11);

-- ----------------------------
-- Table structure for req_requisicion
-- ----------------------------
DROP TABLE IF EXISTS `req_requisicion`;
CREATE TABLE `req_requisicion`  (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_fecha` date DEFAULT NULL,
  `req_folio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `req_fkper_solicitante` int(11) NOT NULL,
  `req_fechasolicitante` date DEFAULT NULL,
  `req_esoperativo` tinyint(4) DEFAULT NULL,
  `req_justificacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `req_fkper_subdirector` int(11) NOT NULL,
  `req_fkper_planeacion` int(11) NOT NULL,
  `req_fkper_director` int(11) NOT NULL,
  `req_fkconfiguracion` int(11) NOT NULL,
  PRIMARY KEY (`req_id`) USING BTREE,
  INDEX `req_fkper_solicitante`(`req_fkper_solicitante`) USING BTREE,
  INDEX `req_fkper_subdirector`(`req_fkper_subdirector`) USING BTREE,
  INDEX `req_fkper_planeacion`(`req_fkper_planeacion`) USING BTREE,
  INDEX `req_fkper_director`(`req_fkper_director`) USING BTREE,
  INDEX `req_fkconfiguracion`(`req_fkconfiguracion`) USING BTREE,
  CONSTRAINT `req_requisicion_ibfk_1` FOREIGN KEY (`req_fkper_solicitante`) REFERENCES `req_personal` (`per_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_2` FOREIGN KEY (`req_fkper_subdirector`) REFERENCES `req_personal` (`per_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_3` FOREIGN KEY (`req_fkper_planeacion`) REFERENCES `req_personal` (`per_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_4` FOREIGN KEY (`req_fkper_director`) REFERENCES `req_personal` (`per_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_5` FOREIGN KEY (`req_fkconfiguracion`) REFERENCES `req_configuracion` (`con_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of req_requisicion
-- ----------------------------
INSERT INTO `req_requisicion` VALUES (5, '2019-08-13', '1', 8, '2019-08-13', 0, '1', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (6, '2019-08-13', '1', 8, '2019-08-13', 0, '1', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (9, '2019-08-13', '', 5, '2019-08-13', 0, 'NECESARIO PARA IMPRESIÓN DE OFICIOS DE LA IMPRESORA DE DIRECCIÓN CANON 1025N Y ATENDIENDO EL PROYECTO 7 ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO TE TI\'CS', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (17, '2019-08-15', '', 5, '2019-08-15', 0, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE TI´CS.', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (19, '2019-08-15', '', 5, '2019-08-15', 0, 'NECESARIO PARA CUBRIR EL SERVICIO TELEFÓNICO DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE TI´CS.', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (21, '2019-08-16', '', 5, '2019-08-16', 1, 'NECESARIO PARA IMPRESIÓN DE DOCUMENTOS DEL DEPARTAMENTO DE CIIE Y ATENDIENDO EL PROYECTO 7 DISEÑO ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE LAS TICS.', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (23, '2019-08-19', '', 5, '2019-08-19', 0, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, PRODUCCIÓN Y ACTUALIZACIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS ACTIVIDADES DE LOS DOCENTES EN EL USO DE TI´CS.                                                                                                                                                                                            ', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (26, '2019-08-22', '', 5, '2019-08-22', 1, 'NECESARIO PARA EL CORRECTO FUNCIONAMIENTO DE LA RED DE DATOS E INTERNET PARA EL USO DE LOS ESTUDIANTES, MAESTROS Y PERSONAL DEL ADMINISTRATIVO PARA LA REALIZACIÓN DE ACTIVIDADES ACADÉMICAS Y ADMINISTRATIVAS Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS\r\n', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (27, '2019-08-23', '', 5, '2019-08-23', 1, 'NECESARIO PARA REMODELACIÓN DE AULAS DE POSGRADO Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS\r\n', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (28, '2019-08-23', '', 5, '2019-08-23', 1, 'NECESARIO PARA LA ADECUACIÓN DE RED DE AULAS DE POSGRADO Y ATENDIENDO EL PROYECTO 7 DISEÑO ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.3 PROMOVER EN LAS ACADEMIAS LA UTILIZACIÓN DE LOS RECURSOS DIGITALES ACADÉMICOS Y MOOCS.', 8, 6, 7, 1);

-- ----------------------------
-- Table structure for sws_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `sws_dashboard`;
CREATE TABLE `sws_dashboard`  (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `fkgrupo` int(11) DEFAULT NULL,
  `orden` int(9) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clase` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sws_dashboard_ibfk_1`(`fkgrupo`) USING BTREE,
  CONSTRAINT `sws_dashboard_ibfk_1` FOREIGN KEY (`fkgrupo`) REFERENCES `sws_dashboardgrupos` (`gpo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sws_dashboard
-- ----------------------------
INSERT INTO `sws_dashboard` VALUES (68, 1, 5, 'Dashboard', '/sws-dashboard/index', 'dashboard', '4', 'Todos');
INSERT INTO `sws_dashboard` VALUES (69, 1, 2, 'Catálogos', '/sws-dashboard/submenu/?gpo=1&prv=0', 'reqConfiguracion', '1', 'Admin');
INSERT INTO `sws_dashboard` VALUES (70, 1, 3, 'Configuración', '/req-configuracion', 'reqConfiguracion', '4', 'Admin');
INSERT INTO `sws_dashboard` VALUES (72, 1, 6, 'Personal', '/req-personal', 'reqPersonal', '4', 'Admin');
INSERT INTO `sws_dashboard` VALUES (73, 1, 1, 'Requisición', '/req-requisicion', 'reqRequisicion', '2', 'Admin');

-- ----------------------------
-- Table structure for sws_dashboardgrupos
-- ----------------------------
DROP TABLE IF EXISTS `sws_dashboardgrupos`;
CREATE TABLE `sws_dashboardgrupos`  (
  `gpo_id` int(11) NOT NULL AUTO_INCREMENT,
  `gpo_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gpo_orden` int(11) NOT NULL,
  `gpo_activo` int(1) DEFAULT 1,
  `gpo_color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`gpo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sws_dashboardgrupos
-- ----------------------------
INSERT INTO `sws_dashboardgrupos` VALUES (1, 'Menú principal', 1, 1, '#93c47d');
INSERT INTO `sws_dashboardgrupos` VALUES (2, 'Sistemas para docentes', 2, 1, '#D7BDE2');
INSERT INTO `sws_dashboardgrupos` VALUES (3, 'Sistemas para estudiantes', 3, 1, '#4a86e8');
INSERT INTO `sws_dashboardgrupos` VALUES (4, 'TecNM', 4, 1, '#A9CCE3');
INSERT INTO `sws_dashboardgrupos` VALUES (5, 'Catálogos', 5, 1, '#ffffff');
INSERT INTO `sws_dashboardgrupos` VALUES (6, 'Administración', 6, 1, '#00ffff');
INSERT INTO `sws_dashboardgrupos` VALUES (7, 'Ajustes', 7, 1, '#A9DFBF');
INSERT INTO `sws_dashboardgrupos` VALUES (100, 'Otros', 100, 1, '#A9DFBF');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (6, 'Laura_elena', 'gUvNpFu5mJnxTQ24IhIVizU_4phffgs1', '$2y$13$U3iZQY64LQMS8ODkfzsC6ePYrNvfp7EQLXgme1qk.h0DuQmrAia86', NULL, 1, 0, 1565723246, 1565723246, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (7, 'Angel_Francisco', '_-iCkmZy7TdhYrq6bnwP4bO7XBUq-PHZ', '$2y$13$ESf6Xn7fQlG868kMC1Zp9OGeX57G5ReXbn2cc8ryOsvuhFqk56EVq', NULL, 1, 0, 1565723305, 1565723305, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (8, 'Jose_Manuel', '-_hKX-SMW54-YwL8A9Vvpt7qzEAFnuQk', '$2y$13$liFyA6qluDIs9Uos1FcpuO49.eOZOP0etS/13E6bUMqH4P3lT0PLW', NULL, 1, 0, 1565723344, 1565723344, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (9, 'Raul_01', 'THlZOEhwbo3itLkQoFIkFUxkIdvJ4Dq-', '$2y$13$a9iRB0qjCoCvRAK6zZeV4e476PsPol00s1BeEPMUWVUn08Ap3F7kW', NULL, 1, 0, 1565724577, 1565724577, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (10, 'Eduardo_Enoch', 'g3Oehu_EbxlSFYeWDpJNLFuo5KdEDOv3', '$2y$13$CaSd7iFm4JyHopt2WpWnb.z6MYdGztArJDdaWJU9pHH1Jpaug45dG', NULL, 1, 0, 1565793883, 1565793883, '10.18.206.89', '', '', 1);
INSERT INTO `user` VALUES (11, 'Brissa_rox', '2YiOq5ULksvsoZRF7Y4CKDcCyUEEUzii', '$2y$13$dQKGDtE8.r2X/Z.6tZ1LzOBJFrdL35VaD24oJHMP9q0Jaja5cyZxm', NULL, 1, 0, 1565794986, 1565794986, '192.168.4.214', '', '', 0);

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '5cae8867448fc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1, 1554942055, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '5ce6c3773874d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', 1, 1558627191, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '5ce6e11ae8ecf', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', 1, 1558634778, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '5d4498c5865c1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564776645, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (5, '5d45bd445c2fb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564851524, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (6, '5d45e15f61432', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564860767, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (7, '5d460468c9a06', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564869736, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (8, '5d4607093c5a1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564870409, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (9, '5d46f19fa574e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564930463, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (10, '5d471f6f04c26', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564942191, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (11, '5d4747f99e9ec', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564952569, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (12, '5d47660d5a87f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564960269, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (13, '5d479535bafe6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1564972341, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (14, '5d47eba95e663', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1564994473, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (15, '5d47ebbe1988a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1, 1564994494, 'Edge', 'Windows');
INSERT INTO `user_visit_log` VALUES (16, '5d48679f7a313', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565026207, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (17, '5d486d75eb7d5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565027701, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (18, '5d48aa5c08cf1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565043292, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (19, '5d48b02a0ced8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565044778, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (20, '5d49086e06616', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565067374, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (21, '5d49146bb3ffc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565070443, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (22, '5d49249a90b17', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565074586, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (23, '5d49269258328', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565075090, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (24, '5d492720cbc74', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565075232, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (25, '5d498e4e24b27', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565101646, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (26, '5d49901890e69', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565102104, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (27, '5d4999f327d60', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565104627, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (28, '5d49a0c88215e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565106376, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (29, '5d49a824e9361', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565108260, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (30, '5d49b455971dc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565111381, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (31, '5d49c1c61bae5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565114822, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (32, '5d49c26467016', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565114980, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (33, '5d49c53077b10', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565115696, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (34, '5d49c5cdc76a1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565115853, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (35, '5d49c663e5112', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116003, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (36, '5d49c672b959c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116018, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (37, '5d49c69265846', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116050, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (38, '5d49c6a32a7c4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116067, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (39, '5d49c6e47270d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116132, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (40, '5d49c6f20bfa2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116146, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (41, '5d49c73f62ab6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116223, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (42, '5d49c7400e3a8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116224, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (43, '5d49c7bd6f025', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116349, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (44, '5d49c81b02b0b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116443, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (45, '5d49c9635fca0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116771, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (46, '5d49c97709ed2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116791, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (47, '5d49c9cb8e2ce', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116875, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (48, '5d49c9c9f2fd4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565116873, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (49, '5d4a5df3d21d4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565154803, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (50, '5d4ae277adfa1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565188727, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (51, '5d4aec1d5e5be', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, 1565191197, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (52, '5d4aec58cf514', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565191256, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (53, '5d4b02628a8b4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565196898, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (54, '5d4b02963ac5a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565196950, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (55, '5d4b057bd6260', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565197691, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (56, '5d4b14e122cfa', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', NULL, 1565201633, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (57, '5d4b1ba3d0c83', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565203363, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (58, '5d4c38005d4e2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565276160, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (59, '5d4c380689d88', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565276166, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (60, '5d4c637cc77c6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565287292, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (61, '5d4c671518c8b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565288213, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (62, '5d4c6898ec1cf', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', NULL, 1565288600, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (63, '5d4cbfcbd7be0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565310923, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (64, '5d4d30b08af8a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565339824, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (65, '5d4d55001e14d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565349120, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (66, '5d4d81a87df95', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565360552, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (67, '5d4d86cd26090', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565361869, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (68, '5d4d8b213cba6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565362977, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (69, '5d4d93adcce67', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565365165, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (70, '5d4d9ea8c0e66', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565367976, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (71, '5d4da09a98522', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565368474, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (72, '5d4da3ce13882', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565369294, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (73, '5d4da77ee7646', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565370238, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (74, '5d4fbae759eac', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565506279, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (75, '5d4fbe3d9210b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565507133, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (76, '5d4fc3f0371af', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565508592, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (77, '5d4fc7ccceae9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565509580, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (78, '5d50640e6348b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565549582, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (79, '5d510427f02b1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565590568, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (80, '5d51807c3b493', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565622396, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (81, '5d5187d209e7e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565624274, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (82, '5d51897d6a040', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565624701, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (83, '5d5189bac039b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565624762, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (84, '5d518a5899c1c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565624920, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (85, '5d518a9277153', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565624978, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (86, '5d518c547dcbd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565625428, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (87, '5d518ca5628cc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565625509, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (88, '5d51905080b4f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565626448, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (89, '5d51906c9a121', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565626476, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (90, '5d5193dbb4514', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565627355, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (91, '5d5194177eac0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565627415, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (92, '5d51965534ac1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565627989, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (93, '5d51968f615bc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565628047, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (94, '5d5196f4c9d4a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565628148, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (95, '5d519b1d2492e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565629213, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (96, '5d519b679c36f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565629287, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (97, '5d51a802e4dbe', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565632514, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (98, '5d51ab4d037fb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565633357, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (99, '5d51ac5ccfe0c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565633628, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (100, '5d51ad4643338', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565633862, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (101, '5d51ad6e196a4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565633902, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (102, '5d51af001726f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565634304, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (103, '5d51f5431a346', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565652291, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (104, '5d51f7f6141d1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565652982, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (105, '5d51f83fe5368', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565653055, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (106, '5d51ff7c2a60c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565654908, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (107, '5d5200000513f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565655040, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (108, '5d52003f125b7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565655103, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (109, '5d52022dcfb43', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565655597, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (110, '5d520f2fcfd89', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565658927, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (111, '5d52d244a1ba5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565708868, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (112, '5d52d26ed6ee2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565708910, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (113, '5d52d2977b78d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565708951, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (114, '5d52d2efb028c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565709039, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (115, '5d52dc3781158', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565711415, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (116, '5d52dcb931ef8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565711545, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (117, '5d52dd2ae4fbd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565711658, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (118, '5d52ddff66a10', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565711871, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (119, '5d52e36de309a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565713262, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (120, '5d52eff0421a8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565716464, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (121, '5d52f0f58dc71', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565716725, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (122, '5d52f13712446', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565716791, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (123, '5d52f37da5650', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', NULL, 1565717373, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (124, '5d52fc595f04b', '192.168.4.202', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565719641, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (125, '5d52ff45a0920', '192.168.4.205', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565720389, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (126, '5d53002b0b79f', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565720619, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (127, '5d530196f3138', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565720982, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (128, '5d5302ee252fe', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565721326, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (129, '5d530a8da1ca9', '10.18.206.143', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565723277, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (130, '5d531f0b1cc47', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565728523, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (131, '5d534759e0e64', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565738841, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (132, '5d541d8bdbb01', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565793675, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (133, '5d541fe52af96', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565794277, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (134, '5d54255b3bdca', '10.18.192.21', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1565795675, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (135, '5d5427dbc0c11', '192.168.4.202', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565796315, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (136, '5d54312cc90fc', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565798700, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (137, '5d543a5bdd1ae', '10.18.206.192', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565801051, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (138, '5d5440d764ddf', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565802711, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (139, '5d5442c374740', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565803203, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (140, '5d54435e4b243', '192.168.4.205', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565803358, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (141, '5d544bff25fc6', '10.18.206.143', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565805567, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (142, '5d5451732ba89', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565806963, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (143, '5d545766b741b', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565808486, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (144, '5d545acd4f966', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565809357, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (145, '5d545c2f7214f', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565809711, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (146, '5d548e7939170', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565822585, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (147, '5d5497e325831', '201.175.172.55', 'es', 'Mozilla/5.0 (Linux; Android 9; EML-L09) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36', 1, 1565824995, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (148, '5d554e9150192', '187.187.195.133', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565871761, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (149, '5d5577cfda759', '192.168.4.214', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565882319, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (150, '5d55845b12ab8', '192.168.14.27', 'es', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565885531, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (151, '5d55871e5fe86', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565886238, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (152, '5d558be3d9871', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1, 1565887459, 'Edge', 'Windows');
INSERT INTO `user_visit_log` VALUES (153, '5d55932752db5', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565889319, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (154, '5d55a447068d0', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565893703, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (155, '5d55a8f81123b', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565894904, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (156, '5d55ac195c09a', '10.18.206.143', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565895705, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (157, '5d55bc9e70dd4', '192.168.14.46', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565899934, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (158, '5d560768094bd', '187.187.195.133', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565919080, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (159, '5d56c68f8872e', '10.18.192.21', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1565968015, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (160, '5d56c69416b9b', '10.18.206.143', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565968020, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (161, '5d56db3122137', '192.168.4.200', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565973297, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (162, '5d56f8cf82460', '10.18.204.187', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565980879, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (163, '5d5733341077f', '187.187.195.133', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565995828, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (164, '5d573ae8463f5', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565997800, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (165, '5d57650d99ed5', '187.187.195.133', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.18362', 1, 1566008589, 'Edge', 'Windows');
INSERT INTO `user_visit_log` VALUES (166, '5d58724fed099', '187.187.194.179', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566077519, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (167, '5d58d33594c81', '187.187.194.179', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566102325, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (168, '5d5acc2f46bdc', '192.168.14.46', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566231599, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (169, '5d5ad05cb4625', '192.168.14.46', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566232668, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (170, '5d5ad40874632', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566233608, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (171, '5d5adc3cb8b63', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566235708, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (172, '5d5b051267cc6', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566246162, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (173, '5d5b082d87b27', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566246957, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (174, '5d5b0980a8128', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1, 1566247296, 'Edge', 'Windows');
INSERT INTO `user_visit_log` VALUES (175, '5d5b0cb382401', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1, 1566248115, 'Edge', 'Windows');
INSERT INTO `user_visit_log` VALUES (176, '5d5b30e8dbb06', '192.168.4.24', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566257384, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (177, '5d5b340f521fb', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566258191, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (178, '5d5c531b9acb4', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566331675, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (179, '5d5c62c9dec9f', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566335689, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (180, '5d5c73ee9186f', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566340078, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (181, '5d5c7c996fd12', '10.18.204.187', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566342297, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (182, '5d5c7cf7bd2f5', '10.18.206.89', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566342391, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (183, '5d5db26b6838f', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566421611, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (184, '5d5eb2a78e288', '200.68.137.157', 'es', 'Mozilla/5.0 (Linux; Android 8.1.0; Moto G (5) Plus) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36', 1, 1566487207, 'Chrome', 'Android');
INSERT INTO `user_visit_log` VALUES (185, '5d5ec9b066a67', '200.68.136.190', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566493104, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (186, '5d5ef44a6e24b', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566504010, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (187, '5d5f0bc44e748', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566510020, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (188, '5d5f0c98b7118', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 8, 1566510232, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (189, '5d5f0d0a9f5ef', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566510346, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (190, '5d5f0f5d910e8', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 8, 1566510941, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (191, '5d5f0fbec15b6', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566511038, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (192, '5d5f10fb17a01', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566511355, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (193, '5d5f14c6869fb', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566512326, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (194, '5d5f14ffe4db0', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566512383, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (195, '5d5f15132ba6a', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566512403, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (196, '5d5f1cc93a380', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 8, 1566514377, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (197, '5d5f1cfeb8917', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566514430, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (198, '5d5f1d910ad6d', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 8, 1566514577, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (199, '5d5f1dab84596', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566514603, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (200, '5d5f1ddcb94e8', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 8, 1566514652, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (201, '5d5f1e008d9c2', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566514688, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (202, '5d5f1e4d5e8fd', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 8, 1566514765, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (203, '5d5f1e8752353', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566514823, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (204, '5d5f380abaa12', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566521354, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (205, '5d5f3cf0d8cb1', '192.168.4.205', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566522608, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (206, '5d5f430442dc7', '187.187.192.29', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566524164, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (207, '5d5f4e775fb8d', '192.168.4.205', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566527095, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (208, '5d600a420c65b', '192.168.4.203', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566575170, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (209, '5d6038ec832d8', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566587116, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (210, '5d605a50bc347', '10.18.204.187', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566595664, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (211, '5d6073479c3fd', '10.18.204.187', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566602055, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (212, '5d607601822eb', '10.18.205.228', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566602753, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (213, '5d6076476b39c', '10.18.200.213', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566602823, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (214, '5d6077be9e294', '10.18.204.187', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566603198, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (215, '5d60c731d0809', '187.187.192.29', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1566623537, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (216, '5d64415ab736f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566851418, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (217, '5d658928c8563', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566935336, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (218, '5d698994a4c6d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567197588, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (219, '5d6d9eae8512f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567465134, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (220, '5d7557e27c31d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567971298, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (221, '5d76a5b0277cb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1568056752, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (222, '5d795a075de22', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1568233991, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (223, '5d8408f31d2a7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.137 Safari/537.36 Vivaldi/2.7.1628.33', 1, 1568934131, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;
