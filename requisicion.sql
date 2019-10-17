/*
 Navicat Premium Data Transfer

 Source Server         : MariaDB_localhost
 Source Server Type    : MariaDB
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : requisicion

 Target Server Type    : MariaDB
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 17/10/2019 14:52:43
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Admin', 8, 1569528706);
INSERT INTO `auth_assignment` VALUES ('JEFE', 8, 1569528710);
INSERT INTO `auth_assignment` VALUES ('JEFE', 11, 1571090042);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `auth_item` VALUES ('JEFE', 1, 'JEFE', NULL, NULL, 1569440102, 1569440333, NULL);
INSERT INTO `auth_item` VALUES ('JEFE DEP', 2, 'JEFE DE DEPARTAMENTO', NULL, NULL, 1569440050, 1569440244, 'JEFES');
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('JEFE', 'JEFE DEP');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '//index');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/dashboard/*');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/update');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/sws-dashboard/*');
INSERT INTO `auth_item_child` VALUES ('JEFE DEP', '/sws-dashboard/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/*');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/delete');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/sws-dashboard/submenu');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/view');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('JEFES', 'JEFES', 1569440011, 1569440198);
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for req_configuracion
-- ----------------------------
DROP TABLE IF EXISTS `req_configuracion`;
CREATE TABLE `req_configuracion`  (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_instituto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `con_logo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `con_revision` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`con_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

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
  `det_clave` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `det_partida` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `det_cantidad` decimal(11, 2) DEFAULT NULL,
  `det_unidad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `det_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `det_costo` decimal(11, 2) DEFAULT NULL,
  PRIMARY KEY (`det_id`) USING BTREE,
  INDEX `fk_Producto_requisicion_req1_idx`(`det_fkrequisicion`) USING BTREE,
  CONSTRAINT `fk_Producto_requisicion_req1` FOREIGN KEY (`det_fkrequisicion`) REFERENCES `req_requisicion` (`req_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of req_detalle
-- ----------------------------
INSERT INTO `req_detalle` VALUES (21, 9, '11 M00 PIA 2 5 3 2530', '21401', 1.00, 'PZA', 'TONER CANON 1025N', 1550.00);
INSERT INTO `req_detalle` VALUES (35, 17, '2  5 3  2530 5 E010  1 14 127 7 3 1 7.1 20 31401', '31401', 1.00, 'SERVICIO', 'SERVICIO DE INTERNET DEL MES DE AGOSTO', 33742.98);
INSERT INTO `req_detalle` VALUES (37, 19, '2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 31401', '31401', 1.00, 'SERVICIO', 'SERVICIO TELEFONICO DEL MES DE AGOSTO', 6984.06);
INSERT INTO `req_detalle` VALUES (39, 21, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 21401', '21401', 1.00, 'PZA', 'KIT FUSOR PARA IMPRESORA MARCA HP MODELO LASERJET 5550 Q3984-\r\n67901/Q3984A', 14400.00);
INSERT INTO `req_detalle` VALUES (41, 23, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 7 3 1 7.1 20 31603', '31603', 1.00, 'SERVICIO', 'SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE AGOSTO', 45351.36);
INSERT INTO `req_detalle` VALUES (54, 26, '11 M00 PIA 2 5 3 2530 5 E010 1 14 127 5 2 1 5.3 24 35102', '35102 ', 1.00, 'SERVICIO', 'Instalación de canalización y colocación de tubería subterránea y en edificios, para telecomunicaciones. La instalación subterránea incluye tritubo de polietileno de alta densidad (PEAD/HDPE), de 3x40 mm de diámetro y 3 mm de espesor, formado por tres tubos iguales, unidos entre sí por medio de una membrana y dispuestos paralelamente en un mismo plano, ejecutada en zanja, ubicaciones: desde edificio laboratorio de investigación II a parte central de área de económico administrativo, desde industrial a jardín de parte lateral, de ciencias de la tierra a ingeniería petrolera, desde edificio de centro de cómputo al edificio de informática, para la instalación de red inalámbrica. Incluye Tuberia conduit delgada, registros de concreto de 1 x 1 con orificios para instalación de tubería, Cajas de Registros tipo condulet. Incluye cableado UTP cat 6 multipar para alcance de 10 gigabits. La ubicación de tubería conduit delgada incluye cableado UTP cat 6 MULTIPAR en los edificios de : Edificio de Centro de Cómputo, Edificio posgrado, centro de información, dirección, Edificio J, Edificio H, Edificio M, Edificio E, Edificio EAULA, Edificio Extraescolares, Edificio Petrolera, Edificio Industrial, Edificio Gimnasio Auditorio. Edificio Z, Edificio Incubadora, Edificio Cafetería, Segundo pago\r\n', 814665.40);
INSERT INTO `req_detalle` VALUES (80, 27, '9-4-2-9.2-20-24801', '24801', 22.00, 'PZA', 'Suministro de platabandas a base de tablarocas de 13 mm. de espesor de 10cm. de altura hasta 0.90cm. de ancho  color blanco, incluye instalación.', 76999.96);
INSERT INTO `req_detalle` VALUES (81, 27, '9-4-2-9.2-20-24801', '24801', 21.00, 'PZA', 'Suministro de plafón falso. modulado en placas de 0.61 cms. x 0.61 cms. incluye instalación.', 50063.94);
INSERT INTO `req_detalle` VALUES (82, 27, '9-4-2-9.2-20-24801', '24801', 5.00, 'PZA', 'suministro de ventana de aluminio de 1.20Mtrs x 1.40Mtrs en color blanco que incluye vidrio, marcos de aluminio, pegamento e instalación.', 35686.10);
INSERT INTO `req_detalle` VALUES (83, 28, '5 2 1 5.3 20 24601', '24601', 45.00, 'PZA', 'canaleta 13x7 mm 2 mtrs de largo', 70868.28);
INSERT INTO `req_detalle` VALUES (84, 28, '5 2 1 5.3 20 24601', '24601', 5.00, 'PZA', 'Bobina de cable de 205 metros Cat5e blindado negro, evita descargar', 32058.98);
INSERT INTO `req_detalle` VALUES (85, 28, '5 2 1 5.3 20 24601', '24601', 2.00, 'PZA', 'Herramienta Quita forros en cables ', 8856.23);
INSERT INTO `req_detalle` VALUES (86, 28, '7 3 1 7.2 20 24601', '24601', 25.00, 'PZA', 'Conectores RJ45 para cable UTP categoría 6', 41668.65);
INSERT INTO `req_detalle` VALUES (87, 28, '7 3 1 7.2 20 24601', '24601', 3.00, 'PZA', 'Pinzas para plegar cables CAT5/CAT6 con cavidades para RJ11, RJ12 y RJ45', 31867.85);
INSERT INTO `req_detalle` VALUES (114, 30, '5-2-1-5.2-2-33304', '33304', 1.00, 'SERVICIO', 'Instalación y Configuración de sistemas DNS BIND interno con servidor Linux CentOS 7, para la resolución de nombres de dominio, incluye Configurar seguridad, bloqueo de puertos, SElinux, Integración a la DMZ, Asignación de seguridad en IP.', 76583.85);
INSERT INTO `req_detalle` VALUES (115, 30, '5-2-1-5.2-2-33304', '33304', 1.00, 'SERV', 'Instalación y Configuración de sistemas DNS BIND externo seguridad, bloqueo de puertos, SElinux, Integración a la DMZ, Asignación de seguridad en IP.', 76583.85);
INSERT INTO `req_detalle` VALUES (116, 30, '5-2-1-5.2-2-33304', '33304', 1.00, 'SERV', 'Creación e implementación del sistema de gestión y vinculación SIGEVI, incluye instalación del sistema operativo Centos7 y servidor web NGINX ', 153167.72);
INSERT INTO `req_detalle` VALUES (120, 31, '5-2-1-5.1-2- 31603', '31603', 1.00, 'SERV', 'SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE SEPTIEMBRE', 45351.36);
INSERT INTO `req_detalle` VALUES (122, 32, '5-2-1-5.1-2- 31401', '31401', 1.00, 'SERVICIO', 'SERVICIO DE TELEFONO DEL MES DE SEPTIEMBRE\r\n', 7081.37);
INSERT INTO `req_detalle` VALUES (124, 33, '5-2-1-5.1-2- 31603', '31603', 1.00, 'SERVICIO', 'SERVICIO DE INTERNET DE 50 MEGAS DEL MES DE SEPTIEMBRE', 33742.98);
INSERT INTO `req_detalle` VALUES (127, 35, '5-2--1-5.3-2-35301', '35301', 1.00, 'SERVICIO', 'MANO DE OBRA DE LA IMPRESORA IR2525 DEL DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN (INCLUYE REFACCIONES). ', 10950.40);
INSERT INTO `req_detalle` VALUES (130, 34, '5-2--1-5.3-2-35301', '35301', 1.00, 'SERVICIO', 'MANO DE OBRA DE LA IMPRESORA IR2525 DEL DEPARTAMENTO SISTEMAS Y COMPUTACIÓN', 4036.80);
INSERT INTO `req_detalle` VALUES (131, 36, '5-2--1-5.3-2-35301', '35301', 1.00, 'SERVICIO', 'MANO DE OBRA DE LA IMPRESORA IR2525 DEL DEPARTAMENTO DE GESTIÓN TECNOLÓGICA Y VINCULACIÓN', 10950.40);

-- ----------------------------
-- Table structure for req_requisicion
-- ----------------------------
DROP TABLE IF EXISTS `req_requisicion`;
CREATE TABLE `req_requisicion`  (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_fecha` date DEFAULT NULL,
  `req_fechasolicitante` date DEFAULT NULL,
  `req_fechaactualizado` date DEFAULT NULL,
  `req_folio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `req_tipo` tinyint(1) DEFAULT NULL COMMENT '0: Bien 1:Servicio',
  `req_fkuse_solicitante` int(11) NOT NULL,
  `req_esoperativo` tinyint(4) DEFAULT NULL,
  `req_justificacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `req_fkuse_subdirector` int(11) DEFAULT NULL,
  `req_fkuse_planeacion` int(11) DEFAULT NULL,
  `req_fkuse_director` int(11) DEFAULT NULL,
  `req_fkconfiguracion` int(11) NOT NULL,
  PRIMARY KEY (`req_id`) USING BTREE,
  INDEX `req_fkper_solicitante`(`req_fkuse_solicitante`) USING BTREE,
  INDEX `req_fkper_subdirector`(`req_fkuse_subdirector`) USING BTREE,
  INDEX `req_fkper_planeacion`(`req_fkuse_planeacion`) USING BTREE,
  INDEX `req_fkper_director`(`req_fkuse_director`) USING BTREE,
  INDEX `req_fkconfiguracion`(`req_fkconfiguracion`) USING BTREE,
  CONSTRAINT `req_requisicion_ibfk_5` FOREIGN KEY (`req_fkconfiguracion`) REFERENCES `req_configuracion` (`con_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_6` FOREIGN KEY (`req_fkuse_solicitante`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_7` FOREIGN KEY (`req_fkuse_subdirector`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_8` FOREIGN KEY (`req_fkuse_planeacion`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `req_requisicion_ibfk_9` FOREIGN KEY (`req_fkuse_director`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of req_requisicion
-- ----------------------------
INSERT INTO `req_requisicion` VALUES (9, '2019-08-13', '2019-08-13', NULL, '', NULL, 11, 0, 'NECESARIO PARA IMPRESIÓN DE OFICIOS DE LA IMPRESORA DE DIRECCIÓN CANON 1025N Y ATENDIENDO EL PROYECTO 7 ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO TE TI\'CS', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (17, '2019-08-15', '2019-08-15', NULL, '', NULL, 11, 0, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE TI´CS.', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (19, '2019-08-15', '2019-08-15', NULL, '', NULL, 11, 0, 'NECESARIO PARA CUBRIR EL SERVICIO TELEFÓNICO DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE TI´CS.', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (21, '2019-08-16', '2019-08-16', NULL, '', NULL, 11, 1, 'NECESARIO PARA IMPRESIÓN DE DOCUMENTOS DEL DEPARTAMENTO DE CIIE Y ATENDIENDO EL PROYECTO 7 DISEÑO ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS HABILIDADES DE LOS DOCENTES EN EL USO DE LAS TICS.', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (23, '2019-08-19', '2019-08-19', NULL, '', NULL, 11, 0, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE AGOSTO Y ATENDIENDO EL PROYECTO 7 DISEÑO, PRODUCCIÓN Y ACTUALIZACIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.1 FORTALECER LAS ACTIVIDADES DE LOS DOCENTES EN EL USO DE TI´CS.                                                                                                                                                                                            ', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (26, '2019-08-22', '2019-08-22', NULL, '', NULL, 11, 1, 'NECESARIO PARA EL CORRECTO FUNCIONAMIENTO DE LA RED DE DATOS E INTERNET PARA EL USO DE LOS ESTUDIANTES, MAESTROS Y PERSONAL DEL ADMINISTRATIVO PARA LA REALIZACIÓN DE ACTIVIDADES ACADÉMICAS Y ADMINISTRATIVAS Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS\r\n', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (27, '2019-08-23', '2019-08-23', NULL, '', NULL, 11, 1, 'NECESARIO PARA REMODELACIÓN DE AULAS DE POSGRADO Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS\r\n', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (28, '2019-08-23', '2019-08-23', NULL, '', NULL, 11, 1, 'NECESARIO PARA LA ADECUACIÓN DE RED DE AULAS DE POSGRADO Y ATENDIENDO EL PROYECTO 7 DISEÑO ACTUALIZACIÓN Y PRODUCCIÓN DE MATERIAL EDUCATIVO Y RECURSOS DIGITALES ACCIÓN 7.3 PROMOVER EN LAS ACADEMIAS LA UTILIZACIÓN DE LOS RECURSOS DIGITALES ACADÉMICOS Y MOOCS.', 9, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (30, '2019-09-22', '2019-09-22', NULL, 'ACA-001-19', NULL, 11, 1, 'NECESARIO PARA ASEGURAR QUE LOS USUARIOS PUEDAN ACCEDER A INTERNET Y A EL SISTEMA DE INFORMACIÓN DE SERVICIO SOCIAL DEL INSTITUTO Y ATENDIENDO EL PROYECTO 5  PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.1 ACREDITACIÓN DELAS CARRERAS DE ING. INDUSTRIAL E ING. EN SISTEMAS COMPUTACIONALES, ACREDITACIÓN DE LAS CARRERAS DE ING. CIVIL E ING. BIOQUÍMICA, INICIAR TRAMITES DE ACREDITACIÓN DE LAS CARRERAS DE ING. QUÍMICA Y AMBIENTAL, INICIAR PROCESO DE ACREDITACIÓN DE LAS CARRERAS DE GESTIÓN EMPRESARIAL Y LICENCIATURA EN ADMINISTRACIÓN.\r\n\r\n ', 11, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (31, '2019-09-23', '2019-09-23', NULL, 'ACA-004-19', NULL, 11, 1, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DE 200 MEGAS DEL MES DE SEPTIEMBRE Y ATENDIENDO EL PROYECTO 5  PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.1 REACREDITACION DELAS CARRERAS DE ING. INDUSTRIAL E ING. EN SISTEMAS COMPUTACIONALES, ACREDITACIÓN DE LAS CARRERAS DE ING. CIVIL E ING. BIOQUÍMICA, INICIAR TRAMITES DE ACREDITACIÓN DE LAS CARRERAS DE ING. QUÍMICA Y AMBIENTAL, INICIAR PROCESO DE ACREDITACIÓN DE LAS CARRERAS DE GESTIÓN EMPRESARIAL Y LICENCIATURA EN ADMINISTRACIÓN.', 11, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (32, '2019-09-23', '2019-09-23', NULL, 'ACA-002-19', NULL, 11, 1, 'NECESARIO PARA CUBRIR EL SERVICIO DE TELÉFONO DEL MES DE SEPTIEMBRE Y ATENDIENDO EL PROYECTO 5  PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.1 ACREDITACIÓN DELAS CARRERAS DE ING. INDUSTRIAL E ING. EN SISTEMAS COMPUTACIONALES, ACREDITACIÓN DE LAS CARRERAS DE ING. CIVIL E ING. BIOQUÍMICA, INICIAR TRAMITES DE ACREDITACIÓN DE LAS CARRERAS DE ING. QUÍMICA Y AMBIENTAL, INICIAR PROCESO DE ACREDITACIÓN DE LAS CARRERAS DE GESTIÓN EMPRESARIAL Y LICENCIATURA EN ADMINISTRACIÓN.\r\n\r\n', 11, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (33, '2019-09-25', '2019-09-25', NULL, 'ACA-003-19', 0, 11, 1, 'NECESARIO PARA CUBRIR EL SERVICIO DE INTERNET DE 50 MEGAS DEL MES DE SEPTIEMBRE Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.1 ACREDITACIÓN DELAS CARRERAS DE ING. INDUSTRIAL E ING. EN SISTEMAS COMPUTACIONALES, ACREDITACIÓN DE LAS CARRERAS DE ING. CIVIL E ING. BIOQUÍMICA, INICIAR TRAMITES DE ACREDITACIÓN DE LAS CARRERAS DE ING. QUÍMICA Y AMBIENTAL, INICIAR PROCESO DE ACREDITACIÓN DE LAS CARRERAS DE GESTIÓN EMPRESARIAL Y LICENCIATURA EN ADMINISTRACIÓN.', 11, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (34, '2019-10-09', '2019-10-09', NULL, 'ACA-005-19', NULL, 11, 0, 'NECESARIO PARA EL BUEN FUNCIONAMIENTO DE LA IMPRESORA DEL DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN Y ATENDIENDO EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURA DE ÁREAS ACADÉMICAS Y LABORATORIOS.', 11, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (35, '2019-10-09', '2019-10-09', NULL, 'ACA-006-19', NULL, 11, 0, 'NECESARIO PARA EL BUEN FUNCIONAMIENTO DE LA IMPRESORA DE GESTIÓN TECNOLOGICA Y VINCULACIÓN Y ATENDIENDO EL PROYECTO 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURAS Y ÁREAS ACADÉMICAS Y LABORATORIOS.\r\n', 11, 6, 7, 1);
INSERT INTO `req_requisicion` VALUES (36, '2019-10-09', '2019-10-09', NULL, 'ACA-006-19', NULL, 11, 0, 'NECESARIO PARA EL BUEN FUNCIONAMIENTO DE LA IMPRESORA DE GESTIÓN TECNOLÓGICA Y VINCULACIÓN Y ATENDIENDO  EL PROYECTO 5 PROYECTO DE EVALUACIÓN Y ACREDITACIÓN DE LOS PLANES Y PROGRAMAS DE LICENCIATURA ACCIÓN 5.3 ADECUACIÓN Y MANTENIMIENTO DE INFRAESTRUCTURAS Y ÁREAS ACADÉMICAS Y LABORATORIOS.\r\n', 11, 6, 7, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sws_dashboard
-- ----------------------------
INSERT INTO `sws_dashboard` VALUES (68, 1, 5, 'Dashboard', '/sws-dashboard/index', 'dashboard', '4', 'Todos');
INSERT INTO `sws_dashboard` VALUES (69, 1, 2, 'Catálogos', '/sws-dashboard/submenu/?gpo=1&prv=0', 'reqConfiguracion', '2', 'Admin');
INSERT INTO `sws_dashboard` VALUES (70, 1, 3, 'Configuración', '/req-configuracion', 'reqConfiguracion', '4', 'Admin');
INSERT INTO `sws_dashboard` VALUES (73, 1, 1, 'Requisición', '/req-requisicion', 'reqRequisicion', '2', 'Admin');

-- ----------------------------
-- Table structure for sws_dashboardgrupos
-- ----------------------------
DROP TABLE IF EXISTS `sws_dashboardgrupos`;
CREATE TABLE `sws_dashboardgrupos`  (
  `gpo_id` int(11) NOT NULL AUTO_INCREMENT,
  `gpo_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gpo_orden` int(11) NOT NULL,
  `gpo_activo` int(1) DEFAULT 1,
  `gpo_color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`gpo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sws_dashboardgrupos
-- ----------------------------
INSERT INTO `sws_dashboardgrupos` VALUES (1, 'Menú principal', 1, 1, '#ffffff');
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
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
INSERT INTO `user` VALUES (1, 'superadmin', 'GOZM7603089M8', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (6, 'Laura_elena', 'SUVL791027BY1', 'gUvNpFu5mJnxTQ24IhIVizU_4phffgs1', '$2y$13$U3iZQY64LQMS8ODkfzsC6ePYrNvfp7EQLXgme1qk.h0DuQmrAia86', NULL, 1, 0, 1565723246, 1565723246, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (7, 'Angel_Francisco', 'VEMA511001AFG', '_-iCkmZy7TdhYrq6bnwP4bO7XBUq-PHZ', '$2y$13$ESf6Xn7fQlG868kMC1Zp9OGeX57G5ReXbn2cc8ryOsvuhFqk56EVq', NULL, 1, 0, 1565723305, 1565723305, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (8, 'Jose_Manuel', 'GOZM7603089M8', '-_hKX-SMW54-YwL8A9Vvpt7qzEAFnuQk', '$2y$13$ExMpuyp9syH5muk2HRYOP.vLiyLRxfEEYeNk0Xebt0WK1vmm3C19y', NULL, 1, 1, 1565723344, 1570578215, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (9, 'Raul_01', 'RAQR691123KK9', 'THlZOEhwbo3itLkQoFIkFUxkIdvJ4Dq-', '$2y$13$a9iRB0qjCoCvRAK6zZeV4e476PsPol00s1BeEPMUWVUn08Ap3F7kW', NULL, 1, 0, 1565724577, 1565724577, '192.168.4.214', '', '', 0);
INSERT INTO `user` VALUES (10, 'Eduardo_Enoch', 'GASE810510BB0', 'g3Oehu_EbxlSFYeWDpJNLFuo5KdEDOv3', '$2y$13$CaSd7iFm4JyHopt2WpWnb.z6MYdGztArJDdaWJU9pHH1Jpaug45dG', NULL, 1, 0, 1565793883, 1565793883, '10.18.206.89', '', '', 1);
INSERT INTO `user` VALUES (11, 'Brissa_rox', 'LESB8004071C2', '2YiOq5ULksvsoZRF7Y4CKDcCyUEEUzii', '$2y$13$yxxNe48VuzomZmsZyen3CuxxfrXutxWUb7h5MAOwGOnME2XNxPHK.', NULL, 1, 0, 1565794986, 1571088621, '192.168.4.214', '', '', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 294 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (278, '5d9d1f078afc2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1570578183, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (279, '5d9d1f42c65f3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1570578242, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (280, '5d9d1f5d3a48b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1570578269, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (281, '5d9e3df14c5e1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1570651633, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (282, '5d9e3e09d0aed', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1570651657, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (283, '5d9f933b2ac96', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1570739003, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (284, '5d9fc26cac2b5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1570751084, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (285, '5da4da7e517a0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1571084926, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (286, '5da4e8ff784f3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 11, 1571088639, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (287, '5da4e912be2dc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 11, 1571088658, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (288, '5da4ee69084d6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1571090025, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (289, '5da4ee82b1abf', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 11, 1571090050, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (290, '5da4ee960b3ad', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1, 1571090070, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (291, '5da4eeab85298', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 11, 1571090091, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (292, '5da4ef24ee22f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 8, 1571090212, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (293, '5da4ef4c607d7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 11, 1571090252, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;
