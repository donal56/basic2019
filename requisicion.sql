/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : requisicion

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 23/09/2019 16:37:41
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
-- Table structure for req_area
-- ----------------------------
DROP TABLE IF EXISTS `req_area`;
CREATE TABLE `req_area`  (
  `are_id` int(11) NOT NULL AUTO_INCREMENT,
  `are_nivel` int(1) DEFAULT NULL,
  `are_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `are_fkper_responsable` int(11) NOT NULL,
  `are_fkper_superior` int(11) NOT NULL,
  PRIMARY KEY (`are_id`) USING BTREE,
  INDEX `fk_req_area_req_personal_idx`(`are_fkper_responsable`) USING BTREE,
  INDEX `are_fkper_superior`(`are_fkper_superior`) USING BTREE,
  CONSTRAINT `fk_req_departamento_req_personal1` FOREIGN KEY (`are_fkper_responsable`) REFERENCES `req_personal` (`per_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_area_ibfk_1` FOREIGN KEY (`are_fkper_superior`) REFERENCES `req_personal` (`per_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of req_area
-- ----------------------------
INSERT INTO `req_area` VALUES (5, 2, 'DIRECCIÓN', 7, 7);
INSERT INTO `req_area` VALUES (6, 1, 'SUBDIRECCIÓN DE PLANEACIÓN Y VINCULACIÓN', 9, 7);
INSERT INTO `req_area` VALUES (7, 0, 'DEPTO. DE PLAN., PROG. Y PRESUPUESTACIÓN', 6, 8);
INSERT INTO `req_area` VALUES (8, 0, 'DEPARTAMENTO DE CENTRO DE COMPUTO', 5, 8);
INSERT INTO `req_area` VALUES (9, 1, ' SUBDIRECCIÓN DE SERVICIOS ADMINISTRATIVOS', 8, 7);
INSERT INTO `req_area` VALUES (10, 1, 'SUBDIRECCIÓN ACADEMICA', 10, 7);

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
  `per_titulo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
INSERT INTO `req_personal` VALUES (5, 'MTC.', 'JOSE MANUEL', 'GOMEZ', 'ZEA', 1);
INSERT INTO `req_personal` VALUES (6, 'ISC.', 'LAURA ELENA', 'SUAREZ', 'VIDAL', 6);
INSERT INTO `req_personal` VALUES (7, 'M.A.', 'ANGEL FRANCISCO', 'VELASCO', 'MUÑOZ', 7);
INSERT INTO `req_personal` VALUES (8, 'M.A.P.P', 'EDUARDO ENOCH', 'GALINDO', 'SANCHEZ', 9);
INSERT INTO `req_personal` VALUES (9, 'M.I.', 'RAUL', 'RAMIREZ', 'QUIROZ', 10);
INSERT INTO `req_personal` VALUES (10, 'M.C.', 'BRISSA ROXANA', 'DE LEON ', 'DE LOS SANTOS', 11);

-- ----------------------------
-- Table structure for req_requisicion
-- ----------------------------
DROP TABLE IF EXISTS `req_requisicion`;
CREATE TABLE `req_requisicion`  (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_fecha` date DEFAULT NULL,
  `req_fechasolicitante` date DEFAULT NULL,
  `req_fechaactualizado` date DEFAULT NULL,
  `req_folio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `req_fkper_solicitante` int(11) NOT NULL,
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
INSERT INTO `req_requisicion` VALUES (5, '2019-08-13', '2019-08-13', '2019-09-23', '1', 8, 0, '1', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (6, '2019-08-13', '2019-08-13', NULL, '1', 8, 0, '1', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (9, '2019-08-13', '2019-08-13', NULL, '', 5, 0, 'NECESARIO PARA IMPRESIÓN DE OFICIOS DE LA IMPRESORA DE DIRECCIÓN CANON 1025N Y ATENDIENDO EL PROYECTO 7 ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO TE TI\'CS', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (17, '2019-08-15', '2019-08-15', NULL, '', 5, 0, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE TI´CS.', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (19, '2019-08-15', '2019-08-15', NULL, '', 5, 0, 'NECESARIO PARA CUBRIR EL SERVICIO TELEFÓNICO DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE TI´CS.', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (21, '2019-08-16', '2019-08-16', NULL, '', 5, 1, 'NECESARIO PARA IMPRESIÓN DE DOCUMENTOS DEL DEPARTAMENTO DE CIIE Y ATENDIENDO EL PROYECTO 7 DISEÑO ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE LAS TICS.', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (23, '2019-08-19', '2019-08-19', NULL, '', 5, 0, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, PRODUCCIÓN Y ACTUALIZACIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS ACTIVIDADES DE LOS DOCENTES EN EL USO DE TI´CS.                                                                                                                                                                                            ', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (26, '2019-08-22', '2019-08-22', NULL, '', 5, 1, 'NECESARIO PARA EL CORRECTO FUNCIONAMIENTO DE LA RED DE DATOS E INTERNET PARA EL USO DE LOS ESTUDIANTES, MAESTROS Y PERSONAL DEL ADMINISTRATIVO PARA LA REALIZACIÓN DE ACTIVIDADES ACADÉMICAS Y ADMINISTRATIVAS Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS\r\n', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (27, '2019-08-23', '2019-08-23', NULL, '', 5, 1, 'NECESARIO PARA REMODELACIÓN DE AULAS DE POSGRADO Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS\r\n', 8, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (28, '2019-08-23', '2019-08-23', NULL, '', 5, 1, 'NECESARIO PARA LA ADECUACIÓN DE RED DE AULAS DE POSGRADO Y ATENDIENDO EL PROYECTO 7 DISEÑO ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.3 PROMOVER EN LAS ACADEMIAS LA UTILIZACIÓN DE LOS RECURSOS DIGITALES ACADÉMICOS Y MOOCS.', 8, 6, 7, 1);

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
INSERT INTO `user_visit_log` VALUES (1, '5d89263b2987e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569269307, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '5d89345c5220d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569272924, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '5d893ac96f018', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1569274569, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;
