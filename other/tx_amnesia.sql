/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯MySqL
 Source Server Type    : MySQL
 Source Server Version : 50565
 Source Host           : 106.54.142.48:9865
 Source Schema         : tx_amnesia

 Target Server Type    : MySQL
 Target Server Version : 50565
 File Encoding         : 65001

 Date: 12/11/2020 19:59:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sy_label
-- ----------------------------
DROP TABLE IF EXISTS `sy_label`;
CREATE TABLE `sy_label`  (
  `label_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `user_id` int(6) NOT NULL COMMENT '用户id',
  `label_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `label_sort` tinyint(3) NOT NULL DEFAULT 0 COMMENT '标签排序',
  `label_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否启用（1，启用，0停用）',
  `label_default` tinyint(3) NOT NULL DEFAULT 0 COMMENT '默认标签（1，默认）',
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sy_task
-- ----------------------------
DROP TABLE IF EXISTS `sy_task`;
CREATE TABLE `sy_task`  (
  `task_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_id` int(6) NOT NULL COMMENT '用户id',
  `label_id` int(6) NULL DEFAULT NULL COMMENT '标签id',
  `task_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务标题',
  `task_desc` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `task_sort` int(5) NOT NULL COMMENT '任务排序',
  `task_sts` tinyint(1) NOT NULL COMMENT '任务状态（0 未完成，1完成）',
  `task_type` tinyint(1) NOT NULL COMMENT '任务类型（0 今日任务，总任务）',
  `task_del` tinyint(1) NOT NULL COMMENT '是否删除（0 没有删除，1 已经删除）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sy_user
-- ----------------------------
DROP TABLE IF EXISTS `sy_user`;
CREATE TABLE `sy_user`  (
  `user_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `wx_open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信openId',
  `user_status` tinyint(3) NOT NULL COMMENT '用户状态:1启用0停用',
  `is_authorize` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否授权1已授权0未授权',
  `gender` tinyint(3) NOT NULL DEFAULT 0 COMMENT '用户性别 0 未知、1 男性，2 女性',
  `user_remarks` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `help_read` int(1) NULL DEFAULT NULL COMMENT '是否阅读使用帮助',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
