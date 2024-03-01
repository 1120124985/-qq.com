/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : text

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 01/03/2024 14:37:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动标题',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `organizer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举办单位',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动截止时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态:0-活动未开始（默认），1-活动进行中，2-活动已结束',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_activity
-- ----------------------------

-- ----------------------------
-- Table structure for tb_building
-- ----------------------------
DROP TABLE IF EXISTS `tb_building`;
CREATE TABLE `tb_building`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '楼栋ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栋数名称',
  `total_households` int NULL DEFAULT NULL COMMENT '总户数',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '楼栋表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_building
-- ----------------------------
INSERT INTO `tb_building` VALUES (1, '万福小区', 1, 'F1', 70, '福气来来', '2023-11-16 19:56:48', '2023-11-17 19:56:51');
INSERT INTO `tb_building` VALUES (2, '金诚小区', 2, 'F2', 40, '紫气东来', '2023-11-16 20:02:32', '2023-11-17 20:08:40');
INSERT INTO `tb_building` VALUES (4, '万泉湾', 31, 'F1', 70, '未住满', '2023-11-16 20:27:44', NULL);

-- ----------------------------
-- Table structure for tb_car
-- ----------------------------
DROP TABLE IF EXISTS `tb_car`;
CREATE TABLE `tb_car`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆ID',
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆照片',
  `owner_id` int NULL DEFAULT NULL COMMENT '所属成员（业主）',
  `color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆颜色',
  `car_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_car
-- ----------------------------

-- ----------------------------
-- Table structure for tb_charge_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_charge_detail`;
CREATE TABLE `tb_charge_detail`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收费明细ID',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `charge_item_id` int NULL DEFAULT NULL COMMENT '收费项目ID',
  `charge_item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费项目名称',
  `contractor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '承办人名称',
  `telephone` int NULL DEFAULT NULL COMMENT '承办人联系电话',
  `pay_money` int NULL DEFAULT NULL COMMENT '应收金额(￥)，单位分',
  `actual_money` int NULL DEFAULT NULL COMMENT '实收金额(￥)，单位分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '缴费时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态：0-生效中（默认），1-已过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费名细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_charge_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tb_charge_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_charge_item`;
CREATE TABLE `tb_charge_item`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收费项目ID',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `money` int NULL DEFAULT NULL COMMENT '项目收费金额（年），单位分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费项目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_charge_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_community
-- ----------------------------
DROP TABLE IF EXISTS `tb_community`;
CREATE TABLE `tb_community`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '小区id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小区编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小区名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐落地址',
  `area` double NULL DEFAULT NULL COMMENT '占地面积（m2）',
  `total_buildings` int NULL DEFAULT NULL COMMENT '总栋数',
  `total_households` int NULL DEFAULT NULL COMMENT '总户数',
  `greening_rate` int NULL DEFAULT NULL COMMENT '绿化率（%）',
  `thumbnail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `developer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发商名称',
  `estate_company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物业公司名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态:0-启用（默认），1-不启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_community
-- ----------------------------
INSERT INTO `tb_community` VALUES (1, 'G1001', '万福小区', '成都市', 10010, 11, 300, 37, '/fileupload/s2.jpg', '成都市地产有限公司', '金斗物业', '2023-10-29 00:00:00', '2023-11-29 00:00:00', '0');
INSERT INTO `tb_community` VALUES (2, 'G1002', '金诚小区', '眉山市', 11000, 10, 300, 31, '/fileupload/s2.jpg', '眉山市地产有限公司', '程思物业', '2023-10-26 23:37:39', '2023-11-22 00:00:00', '1');
INSERT INTO `tb_community` VALUES (30, 'G1003', '景宏园', '武汉市', 13020, 12, 200, 40, '/fileupload/s3.jpg', '万福地产', '程思物业', NULL, NULL, '0');
INSERT INTO `tb_community` VALUES (31, 'G1004', '万泉湾', '香港', 12000, 9, 340, 20, '/fileupload/s3.jpg', '红星地产', '金斗物业', NULL, NULL, '1');
INSERT INTO `tb_community` VALUES (35, 'G1006', '物权', '抽到', 123, 12, 500, 70, '/fileupload/a999097d-4257-45e1-8a25-39909e3ddcca.jpg', '大晚上d', '撒旦', '2023-11-16 00:49:54', NULL, '1');
INSERT INTO `tb_community` VALUES (36, 'G1006', '王国', '单纯', 1000, 60, 300, 70, '/fileupload/91913b7f-9d10-45f0-927c-564d2977bce4.png', '大师赛', '阿斯顿', '2024-02-18 14:15:42', NULL, '1');

-- ----------------------------
-- Table structure for tb_complaint
-- ----------------------------
DROP TABLE IF EXISTS `tb_complaint`;
CREATE TABLE `tb_complaint`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '投诉ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `owner_id` int NULL DEFAULT NULL COMMENT '投诉人员（业主）ID',
  `owner_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉人员（业主）名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉具体描述',
  `reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉事由',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态：0-未受理，1-已受理（默认），2-已处理完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device
-- ----------------------------
DROP TABLE IF EXISTS `tb_device`;
CREATE TABLE `tb_device`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `brand` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备品牌',
  `unit_price` int NULL DEFAULT NULL COMMENT '购买单价(￥)，单位分',
  `num` int NULL DEFAULT NULL COMMENT '购买数量',
  `expected_useful_life` int NULL DEFAULT NULL COMMENT '预计使用年限(年)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `purchase_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '购买日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_device
-- ----------------------------

-- ----------------------------
-- Table structure for tb_estate_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_estate_manager`;
CREATE TABLE `tb_estate_manager`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '物业管理人员ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名:登录时使用的名称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实名称',
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `telephone` int NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role_id` int NULL DEFAULT 0 COMMENT '角色ID：0-普通用户（默认0），1-管理员用户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物业管理人员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_estate_manager
-- ----------------------------

-- ----------------------------
-- Table structure for tb_house
-- ----------------------------
DROP TABLE IF EXISTS `tb_house`;
CREATE TABLE `tb_house`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '房屋ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `building_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属栋数名称',
  `building_id` int NULL DEFAULT NULL COMMENT '所属栋数ID',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房产编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房产名称',
  `owner_id` int NULL DEFAULT NULL COMMENT '户主（业主）ID',
  `owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户主（业主）名称',
  `telephone` int NULL DEFAULT NULL COMMENT '联系方式',
  `room_num` int NULL DEFAULT NULL COMMENT '房间数',
  `unit` int NULL DEFAULT NULL COMMENT '单元',
  `floor` int NULL DEFAULT NULL COMMENT '楼层',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `live_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入住时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房屋表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_house
-- ----------------------------

-- ----------------------------
-- Table structure for tb_letter
-- ----------------------------
DROP TABLE IF EXISTS `tb_letter`;
CREATE TABLE `tb_letter`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '信件ID',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `owner_id` int NULL DEFAULT NULL COMMENT '信件发送者（业主）ID',
  `owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信件发送者（业主）名称',
  `origin` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '信件来源：0-信箱（默认），1-邮件，2-微信，3-公众号，4-app,5-pc',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信件标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信箱内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态:0-未读（默认），1-已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_letter
-- ----------------------------

-- ----------------------------
-- Table structure for tb_owner
-- ----------------------------
DROP TABLE IF EXISTS `tb_owner`;
CREATE TABLE `tb_owner`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '业主ID',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区',
  `house_id` int NULL DEFAULT NULL COMMENT '所属房产',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成员名称',
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成员照片',
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `telephone` int NULL DEFAULT NULL COMMENT '联系方式',
  `profession` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '性别:0-男（默认），1-女',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '类型:0-房主（默认），1-租客',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无' COMMENT '备注（默认无）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `birthday` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出生日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_owner
-- ----------------------------

-- ----------------------------
-- Table structure for tb_parking
-- ----------------------------
DROP TABLE IF EXISTS `tb_parking`;
CREATE TABLE `tb_parking`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车位ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车位图片',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车位编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车位名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_parking
-- ----------------------------

-- ----------------------------
-- Table structure for tb_parking_use
-- ----------------------------
DROP TABLE IF EXISTS `tb_parking_use`;
CREATE TABLE `tb_parking_use`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车位使用ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车位编号',
  `car_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码',
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆牌照（照片）',
  `owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆所有人（业主）名称',
  `owner_id` int NULL DEFAULT NULL COMMENT '车辆所有人（业主）ID',
  `telephone` int NULL DEFAULT NULL COMMENT '联系方式',
  `use_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '使用性质：0-购买(默认)，1-月租，2-年租',
  `total_fee` int NULL DEFAULT NULL COMMENT '总费用(￥)，以分为单位',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '（使用）开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '（使用）结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车位使用表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_parking_use
-- ----------------------------

-- ----------------------------
-- Table structure for tb_pet
-- ----------------------------
DROP TABLE IF EXISTS `tb_pet`;
CREATE TABLE `tb_pet`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物照片',
  `owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属成员（业主）名称',
  `owner_id` int NULL DEFAULT NULL COMMENT '所属成员（业主）ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物名称',
  `color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物颜色',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `adopt_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收养时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '宠物表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_pet
-- ----------------------------

-- ----------------------------
-- Table structure for tb_repair
-- ----------------------------
DROP TABLE IF EXISTS `tb_repair`;
CREATE TABLE `tb_repair`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '维修ID',
  `community_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属小区名称',
  `community_id` int NULL DEFAULT NULL COMMENT '所属小区ID',
  `building_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属楼栋名称',
  `building_id` int NULL DEFAULT NULL COMMENT '所属楼栋ID',
  `owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修人员（业主）名称',
  `owner_id` int NULL DEFAULT NULL COMMENT '报修人员（业主）ID',
  `device_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `device_id` int NULL DEFAULT NULL COMMENT '设备编号ID',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态：0-待受理，1-已受理，2-修理完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '维修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_repair
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', '123');
INSERT INTO `tb_user` VALUES (2, 'wang', '123');
INSERT INTO `tb_user` VALUES (3, 'zhang', '12');

SET FOREIGN_KEY_CHECKS = 1;
