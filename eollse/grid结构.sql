/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : grid

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 15/11/2018 17:48:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `accountId` int(11) NOT NULL AUTO_INCREMENT,
  `houseId` int(11) NULL DEFAULT NULL,
  `accountHolder` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accountSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memberCount` int(11) NULL DEFAULT NULL,
  `editAccountName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editAccountDate` datetime(0) NULL DEFAULT NULL,
  `accountAudit` int(11) NULL DEFAULT 1,
  `holderTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `holderCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_lag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accountId`) USING BTREE,
  INDEX `FK_Relationship_44`(`houseId`) USING BTREE,
  CONSTRAINT `FK_Relationship_44` FOREIGN KEY (`houseId`) REFERENCES `house` (`houseId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16768 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '户口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaCode` bigint(20) NOT NULL,
  `areaParentCode` bigint(20) NOT NULL,
  `areaName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaLevel` int(11) NOT NULL,
  `introduce` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`areaId`) USING BTREE,
  INDEX `AK_areaCode`(`areaCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for area_code
-- ----------------------------
DROP TABLE IF EXISTS `area_code`;
CREATE TABLE `area_code`  (
  `areaCodeId` int(11) NOT NULL AUTO_INCREMENT,
  `areaCodeNum` bigint(20) NOT NULL,
  `areaCodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`areaCodeId`) USING BTREE,
  UNIQUE INDEX `areaCodeNum`(`areaCodeNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `gridStaffId` int(11) NOT NULL,
  `recordDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `start_site` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `end_site` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attendance_pic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`) USING BTREE,
  INDEX `attendance_staff_id`(`gridStaffId`) USING BTREE,
  CONSTRAINT `attendance_staff_id` FOREIGN KEY (`gridStaffId`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 428 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bigdataform
-- ----------------------------
DROP TABLE IF EXISTS `bigdataform`;
CREATE TABLE `bigdataform`  (
  `bdfId` int(11) NOT NULL AUTO_INCREMENT,
  `bdfLegendName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bdfName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdfValue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bdfId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bigdatapo
-- ----------------------------
DROP TABLE IF EXISTS `bigdatapo`;
CREATE TABLE `bigdatapo`  (
  `bigDataId` int(11) NOT NULL AUTO_INCREMENT,
  `bigDataName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdValue` int(200) NULL DEFAULT NULL,
  `bdPosition` int(11) NULL DEFAULT 0,
  `bdLegend` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdAxis` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popId` int(11) NULL DEFAULT NULL,
  `politicsId` int(11) NULL DEFAULT NULL,
  `popAttrId` int(11) NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bigDataId`) USING BTREE,
  INDEX `popId`(`popId`) USING BTREE,
  INDEX `politicsId`(`politicsId`) USING BTREE,
  INDEX `popAttrId`(`popAttrId`) USING BTREE,
  INDEX `companyId`(`companyId`) USING BTREE,
  CONSTRAINT `bigdatapo_ibfk_1` FOREIGN KEY (`popId`) REFERENCES `population` (`popId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatapo_ibfk_2` FOREIGN KEY (`politicsId`) REFERENCES `politics` (`politicsId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatapo_ibfk_3` FOREIGN KEY (`popAttrId`) REFERENCES `popattr` (`popAttrId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatapo_ibfk_4` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bigdatatotalpo
-- ----------------------------
DROP TABLE IF EXISTS `bigdatatotalpo`;
CREATE TABLE `bigdatatotalpo`  (
  `bigDataId` int(11) NOT NULL AUTO_INCREMENT,
  `bigDataName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdValue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdPosition` int(11) NULL DEFAULT NULL,
  `bdLegend` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdAxis` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bdData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popId` int(11) NULL DEFAULT NULL,
  `politicsId` int(11) NULL DEFAULT NULL,
  `popAttrId` int(11) NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT NULL,
  `bdAreaId` int(11) NULL DEFAULT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bigDataId`) USING BTREE,
  INDEX `popId`(`popId`) USING BTREE,
  INDEX `politicsId`(`politicsId`) USING BTREE,
  INDEX `popAttrId`(`popAttrId`) USING BTREE,
  INDEX `companyId`(`companyId`) USING BTREE,
  INDEX `bdAreaId`(`bdAreaId`) USING BTREE,
  CONSTRAINT `bigdatatotalpo_ibfk_1` FOREIGN KEY (`popId`) REFERENCES `population` (`popId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatatotalpo_ibfk_2` FOREIGN KEY (`politicsId`) REFERENCES `politics` (`politicsId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatatotalpo_ibfk_3` FOREIGN KEY (`popAttrId`) REFERENCES `popattr` (`popAttrId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatatotalpo_ibfk_4` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bigdatatotalpo_ibfk_5` FOREIGN KEY (`bdAreaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for block
-- ----------------------------
DROP TABLE IF EXISTS `block`;
CREATE TABLE `block`  (
  `blockId` int(11) NOT NULL AUTO_INCREMENT,
  `courtId` int(11) NULL DEFAULT NULL,
  `gridStaffId` int(11) NULL DEFAULT NULL,
  `gridId` int(11) NULL DEFAULT NULL,
  `blockName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unitCount` int(11) NOT NULL,
  `editBlockName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editBlockDate` datetime(0) NOT NULL,
  `blockAudit` int(11) NOT NULL DEFAULT 1,
  `blockAdmintor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blockAdmintorTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `houseCount` int(11) NULL DEFAULT NULL,
  `unitFloorCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`blockId`) USING BTREE,
  INDEX `FK_Reference_48`(`gridStaffId`) USING BTREE,
  INDEX `FK_Reference_50`(`gridId`) USING BTREE,
  INDEX `FK_Relationship_11`(`courtId`) USING BTREE,
  CONSTRAINT `FK_Reference_48` FOREIGN KEY (`gridStaffId`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_50` FOREIGN KEY (`gridId`) REFERENCES `grid` (`gridId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`courtId`) REFERENCES `court` (`courtId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '楼栋表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `blogId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NOT NULL,
  `gridId` int(11) NOT NULL,
  `gridStaffId` int(11) NOT NULL,
  `blogName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blogType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blogContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editBlogDate` datetime(0) NULL DEFAULT NULL,
  `blogPic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`blogId`) USING BTREE,
  INDEX `fk_area_areaId`(`areaId`) USING BTREE,
  INDEX `fk_grid_gridId`(`gridId`) USING BTREE,
  INDEX `fk_grid_staff_gridStaffId`(`gridStaffId`) USING BTREE,
  CONSTRAINT `fk_area_areaId` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_grid_gridId` FOREIGN KEY (`gridId`) REFERENCES `grid` (`gridId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_grid_staff_gridStaffId` FOREIGN KEY (`gridStaffId`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 382 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `tradeId` int(11) NULL DEFAULT NULL,
  `scaleId` int(11) NULL DEFAULT NULL,
  `areaId` int(11) NULL DEFAULT NULL,
  `natureId` int(11) NULL DEFAULT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyIntro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companySite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creditCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerOffice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyAudit` int(11) NOT NULL DEFAULT 1,
  `editComName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editComDate` datetime(0) NOT NULL,
  `companyPic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `partyOrganization` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyStatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siteTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `appUser` int(11) NULL DEFAULT NULL,
  `partyNumber` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`companyId`) USING BTREE,
  INDEX `FK_Relationship_35`(`natureId`) USING BTREE,
  INDEX `FK_Relationship_36`(`tradeId`) USING BTREE,
  INDEX `FK_Relationship_37`(`scaleId`) USING BTREE,
  INDEX `FK_Relationship_40`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Relationship_35` FOREIGN KEY (`natureId`) REFERENCES `company_nature` (`natureId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_36` FOREIGN KEY (`tradeId`) REFERENCES `company_trade` (`tradeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_37` FOREIGN KEY (`scaleId`) REFERENCES `company_scale` (`scaleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_40` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_copy
-- ----------------------------
DROP TABLE IF EXISTS `company_copy`;
CREATE TABLE `company_copy`  (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `tradeId` int(11) NULL DEFAULT NULL,
  `scaleId` int(11) NULL DEFAULT NULL,
  `areaId` int(11) NULL DEFAULT NULL,
  `natureId` int(11) NULL DEFAULT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyIntro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companySite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creditCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerOffice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyAudit` int(11) NOT NULL DEFAULT 1,
  `editComName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editComDate` datetime(0) NOT NULL,
  `companyPic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `partyOrganization` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyStatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siteTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`companyId`) USING BTREE,
  INDEX `FK_Relationship_35`(`natureId`) USING BTREE,
  INDEX `FK_Relationship_36`(`tradeId`) USING BTREE,
  INDEX `FK_Relationship_37`(`scaleId`) USING BTREE,
  INDEX `FK_Relationship_40`(`areaId`) USING BTREE,
  CONSTRAINT `company_copy_ibfk_1` FOREIGN KEY (`natureId`) REFERENCES `company_nature` (`natureId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `company_copy_ibfk_2` FOREIGN KEY (`tradeId`) REFERENCES `company_trade` (`tradeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `company_copy_ibfk_3` FOREIGN KEY (`scaleId`) REFERENCES `company_scale` (`scaleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `company_copy_ibfk_4` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_nature
-- ----------------------------
DROP TABLE IF EXISTS `company_nature`;
CREATE TABLE `company_nature`  (
  `natureId` int(11) NOT NULL AUTO_INCREMENT,
  `natureName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`natureId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业性质' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_scale
-- ----------------------------
DROP TABLE IF EXISTS `company_scale`;
CREATE TABLE `company_scale`  (
  `scaleId` int(11) NOT NULL AUTO_INCREMENT,
  `scaleName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`scaleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业规模表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company_trade
-- ----------------------------
DROP TABLE IF EXISTS `company_trade`;
CREATE TABLE `company_trade`  (
  `tradeId` int(11) NOT NULL AUTO_INCREMENT,
  `tradePerId` int(11) NULL DEFAULT NULL,
  `tradeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tradeId`) USING BTREE,
  INDEX `FK_Reference_45`(`tradePerId`) USING BTREE,
  CONSTRAINT `FK_Reference_45` FOREIGN KEY (`tradePerId`) REFERENCES `company_trade` (`tradeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业所处行业类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for court
-- ----------------------------
DROP TABLE IF EXISTS `court`;
CREATE TABLE `court`  (
  `courtId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NULL DEFAULT NULL,
  `courtName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `propertyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courtSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courtArea` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blockCount` int(11) NULL DEFAULT NULL,
  `editCourtName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editCourtDate` datetime(0) NOT NULL,
  `courtAudit` int(11) NOT NULL DEFAULT 1,
  `courtPic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`courtId`) USING BTREE,
  INDEX `areaId`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Reference_49` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for culture_level
-- ----------------------------
DROP TABLE IF EXISTS `culture_level`;
CREATE TABLE `culture_level`  (
  `levelId` int(11) NOT NULL AUTO_INCREMENT,
  `levelName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`levelId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文化水平表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NULL DEFAULT NULL,
  `gridId` int(11) NULL DEFAULT NULL,
  `gridStaffId` int(11) NULL DEFAULT NULL,
  `eventLevelId` int(11) NULL DEFAULT NULL,
  `sourceTypeId` int(11) NULL DEFAULT NULL,
  `eventTitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `editEventDate` datetime(0) NULL DEFAULT NULL,
  `isImportant` int(11) NULL DEFAULT 0,
  `eventTypeId` int(11) NULL DEFAULT NULL,
  `eventPic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isFinished` int(11) NULL DEFAULT 0,
  `eventScore` int(11) NULL DEFAULT NULL COMMENT '事件评分',
  `turnReason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转办原因，不转办为空',
  `from` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转办人的来源',
  `companyId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `jmEvaluate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wgbEvaluate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zxzrEvaluate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endDate` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventPic2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventContent2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `updateTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`) USING BTREE,
  INDEX `fk_area_event`(`areaId`) USING BTREE,
  INDEX `fk_grid_event`(`gridId`) USING BTREE,
  INDEX `fk_grid_staff_event`(`gridStaffId`) USING BTREE,
  INDEX `fk_event_level`(`eventLevelId`) USING BTREE,
  INDEX `fk_event_source_type`(`sourceTypeId`) USING BTREE,
  INDEX `fk_event_type`(`eventTypeId`) USING BTREE,
  INDEX `fk_company_event`(`companyId`) USING BTREE,
  INDEX `fk_user_event`(`userId`) USING BTREE,
  CONSTRAINT `fk_area_event` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_company_event` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_event_level` FOREIGN KEY (`eventLevelId`) REFERENCES `event_level` (`eventLevelId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_event_source_type` FOREIGN KEY (`sourceTypeId`) REFERENCES `event_source_type` (`sourceTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_event_type` FOREIGN KEY (`eventTypeId`) REFERENCES `event_type` (`eventTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_grid_event` FOREIGN KEY (`gridId`) REFERENCES `grid` (`gridId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_grid_staff_event` FOREIGN KEY (`gridStaffId`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_event` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_level
-- ----------------------------
DROP TABLE IF EXISTS `event_level`;
CREATE TABLE `event_level`  (
  `eventLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `eventLevelName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eventLevelId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_log
-- ----------------------------
DROP TABLE IF EXISTS `event_log`;
CREATE TABLE `event_log`  (
  `eventLogId` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `eventLogContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editEventLogName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editEventLogDate` datetime(0) NULL DEFAULT NULL,
  `solveStatusId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`eventLogId`) USING BTREE,
  INDEX `fk_event_eventId`(`eventId`) USING BTREE,
  INDEX `event_logId_solveId`(`solveStatusId`) USING BTREE,
  CONSTRAINT `event_logId_solveId` FOREIGN KEY (`solveStatusId`) REFERENCES `event_solve_status` (`solveStatusId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_event_eventId` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_number
-- ----------------------------
DROP TABLE IF EXISTS `event_number`;
CREATE TABLE `event_number`  (
  `eventId` int(11) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_solve_status
-- ----------------------------
DROP TABLE IF EXISTS `event_solve_status`;
CREATE TABLE `event_solve_status`  (
  `solveStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `solveStatusName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`solveStatusId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_source_type
-- ----------------------------
DROP TABLE IF EXISTS `event_source_type`;
CREATE TABLE `event_source_type`  (
  `sourceTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `sourceTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sourceTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_type
-- ----------------------------
DROP TABLE IF EXISTS `event_type`;
CREATE TABLE `event_type`  (
  `eventTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `eventTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eventTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for facilities
-- ----------------------------
DROP TABLE IF EXISTS `facilities`;
CREATE TABLE `facilities`  (
  `facilitiesId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NULL DEFAULT NULL,
  `facilitiesTypeId` int(11) NULL DEFAULT NULL,
  `facilitiesName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `facilitiesSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `facilitiesPic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `facilitiesAudit` int(11) NOT NULL DEFAULT 1,
  `editFacName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editFacDate` datetime(0) NOT NULL,
  PRIMARY KEY (`facilitiesId`) USING BTREE,
  INDEX `FK_Relationship_32`(`facilitiesTypeId`) USING BTREE,
  INDEX `FK_Relationship_39`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Relationship_32` FOREIGN KEY (`facilitiesTypeId`) REFERENCES `facilities_type` (`facilitiesTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_39` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公共设施表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for facilities_type
-- ----------------------------
DROP TABLE IF EXISTS `facilities_type`;
CREATE TABLE `facilities_type`  (
  `facilitiesTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `facilitiesTypePerId` int(11) NULL DEFAULT NULL,
  `facilitiesTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`facilitiesTypeId`) USING BTREE,
  INDEX `FK_Relationship_33`(`facilitiesTypePerId`) USING BTREE,
  CONSTRAINT `FK_Relationship_33` FOREIGN KEY (`facilitiesTypePerId`) REFERENCES `facilities_type` (`facilitiesTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公共设施类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow`  (
  `flowId` int(11) NOT NULL AUTO_INCREMENT,
  `popId` int(11) NULL DEFAULT NULL,
  `flowTypeId` int(11) NULL DEFAULT NULL,
  `flowCause` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flowTime` date NULL DEFAULT NULL,
  `inflowSite` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `outflowSite` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`flowId`) USING BTREE,
  INDEX `FK_Relationship_21`(`flowTypeId`) USING BTREE,
  INDEX `FK_Relationship_31`(`popId`) USING BTREE,
  CONSTRAINT `FK_Relationship_21` FOREIGN KEY (`flowTypeId`) REFERENCES `flow_type` (`flowTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_31` FOREIGN KEY (`popId`) REFERENCES `population` (`popId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人口流动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_type
-- ----------------------------
DROP TABLE IF EXISTS `flow_type`;
CREATE TABLE `flow_type`  (
  `flowTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `flowTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`flowTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人口流动类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grid
-- ----------------------------
DROP TABLE IF EXISTS `grid`;
CREATE TABLE `grid`  (
  `gridId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NULL DEFAULT NULL,
  `gridName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridScope` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editGridName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editGridDate` datetime(0) NOT NULL,
  `gridAudit` int(11) NOT NULL DEFAULT 1,
  `gridStaffCount` int(11) NULL DEFAULT NULL,
  `gridAdmitor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridStaffId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`gridId`) USING BTREE,
  INDEX `FK_Relationship_7`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网格分布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grid_post
-- ----------------------------
DROP TABLE IF EXISTS `grid_post`;
CREATE TABLE `grid_post`  (
  `gridPostId` int(11) NOT NULL AUTO_INCREMENT,
  `gridPostName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gridPostId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网格员职务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grid_staff
-- ----------------------------
DROP TABLE IF EXISTS `grid_staff`;
CREATE TABLE `grid_staff`  (
  `gridStaffId` int(11) NOT NULL AUTO_INCREMENT,
  `gridId` int(11) NULL DEFAULT NULL,
  `gridPostId` int(11) NULL DEFAULT NULL,
  `gridStaffName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridStaffSex` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridStaffAge` int(11) NULL DEFAULT NULL,
  `gridStaffCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridStaffTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridStaffIcon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gridStaffScope` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editStaffName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editStaffDate` datetime(0) NOT NULL,
  `gridStaffAudit` int(11) NOT NULL DEFAULT 1,
  `appUser` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`gridStaffId`) USING BTREE,
  INDEX `FK_Relationship_8`(`gridId`) USING BTREE,
  INDEX `FK_Relationship_9`(`gridPostId`) USING BTREE,
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`gridId`) REFERENCES `grid` (`gridId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`gridPostId`) REFERENCES `grid_post` (`gridPostId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 243 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网格员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for holder_relation
-- ----------------------------
DROP TABLE IF EXISTS `holder_relation`;
CREATE TABLE `holder_relation`  (
  `relationId` int(11) NOT NULL AUTO_INCREMENT,
  `relationName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`relationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '户口关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `houseId` int(11) NOT NULL AUTO_INCREMENT,
  `statusId` int(11) NULL DEFAULT NULL,
  `typeId` int(11) NULL DEFAULT NULL,
  `houseNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `houseArea` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `houseSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editHouseName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editHouseDate` datetime(0) NULL DEFAULT NULL,
  `houseAudit` int(11) NULL DEFAULT 1,
  `houseHolder` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitId` int(11) NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_lag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`houseId`) USING BTREE,
  INDEX `FK_Relationship_15`(`statusId`) USING BTREE,
  INDEX `FK_Relationship_16`(`typeId`) USING BTREE,
  INDEX `FK_Unit_unitId`(`unitId`) USING BTREE,
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`statusId`) REFERENCES `house_status` (`statusId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`typeId`) REFERENCES `house_type` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Unit_unitId` FOREIGN KEY (`unitId`) REFERENCES `unit` (`unitId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16768 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房屋信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for house_status
-- ----------------------------
DROP TABLE IF EXISTS `house_status`;
CREATE TABLE `house_status`  (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`statusId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房屋状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for house_type
-- ----------------------------
DROP TABLE IF EXISTS `house_type`;
CREATE TABLE `house_type`  (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '户型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon`  (
  `iconId` double NOT NULL,
  `iconName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconType` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`iconId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `infoId` int(11) NOT NULL AUTO_INCREMENT,
  `infoTypeId` int(11) NOT NULL,
  `areaId` int(11) NOT NULL,
  `infoTitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `infoEditor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `infoEditDate` datetime(0) NOT NULL,
  `infoContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`infoId`) USING BTREE,
  INDEX `fk_type`(`infoTypeId`) USING BTREE,
  INDEX `fk_area`(`areaId`) USING BTREE,
  CONSTRAINT `fk_area` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_type` FOREIGN KEY (`infoTypeId`) REFERENCES `info_type` (`infoTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for info_type
-- ----------------------------
DROP TABLE IF EXISTS `info_type`;
CREATE TABLE `info_type`  (
  `infoTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `infoTypeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`infoTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for key_people
-- ----------------------------
DROP TABLE IF EXISTS `key_people`;
CREATE TABLE `key_people`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gridId` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nation_id` int(11) NULL DEFAULT NULL,
  `pop_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop_native` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_get` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for latitude
-- ----------------------------
DROP TABLE IF EXISTS `latitude`;
CREATE TABLE `latitude`  (
  `gridStaffId` int(11) NULL DEFAULT NULL,
  `editDate` datetime(0) NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for leaves
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves`  (
  `leaves_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaves_area_id` int(11) NULL DEFAULT NULL,
  `leaves_grid_id` int(11) NULL DEFAULT NULL,
  `leaves_gridStaff_id` int(11) NULL DEFAULT NULL,
  `leaves_type_id` int(11) NULL DEFAULT NULL,
  `leaves_auditor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaves_begin_time` datetime(0) NOT NULL,
  `leaves_end_time` datetime(0) NOT NULL,
  `leaves_reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `leavesStatus` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`leaves_id`) USING BTREE,
  INDEX `fk_leaves_type_id`(`leaves_type_id`) USING BTREE,
  INDEX `fk_leaves_area_id`(`leaves_area_id`) USING BTREE,
  INDEX `fk_leaves_grid_id`(`leaves_grid_id`) USING BTREE,
  INDEX `fk_leaves_gridStaff_id`(`leaves_gridStaff_id`) USING BTREE,
  CONSTRAINT `fk_leaves_area_id` FOREIGN KEY (`leaves_area_id`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_leaves_gridStaff_id` FOREIGN KEY (`leaves_gridStaff_id`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_leaves_grid_id` FOREIGN KEY (`leaves_grid_id`) REFERENCES `grid` (`gridId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_leaves_type_id` FOREIGN KEY (`leaves_type_id`) REFERENCES `leaves_type` (`leaves_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for leaves_type
-- ----------------------------
DROP TABLE IF EXISTS `leaves_type`;
CREATE TABLE `leaves_type`  (
  `leaves_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaves_type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`leaves_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `logIP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `useClass` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `useMethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logLevel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logMsg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`logId`) USING BTREE,
  INDEX `user_userId`(`userId`) USING BTREE,
  CONSTRAINT `user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21742 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marriage_status
-- ----------------------------
DROP TABLE IF EXISTS `marriage_status`;
CREATE TABLE `marriage_status`  (
  `marriageId` int(11) NOT NULL AUTO_INCREMENT,
  `marriageName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`marriageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '婚姻状况表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `parentMenuId` int(11) NULL DEFAULT NULL,
  `menuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menuUri` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menuIcon` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortId` int(11) NULL DEFAULT NULL,
  `audit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`menuId`) USING BTREE,
  INDEX `FK_Relationship_2`(`parentMenuId`) USING BTREE,
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`parentMenuId`) REFERENCES `menu` (`menuId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu_per
-- ----------------------------
DROP TABLE IF EXISTS `menu_per`;
CREATE TABLE `menu_per`  (
  `menuId` int(11) NOT NULL DEFAULT 0,
  `perId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`menuId`, `perId`) USING BTREE,
  INDEX `fk_perId`(`perId`) USING BTREE,
  CONSTRAINT `fk_menuId` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_perId` FOREIGN KEY (`perId`) REFERENCES `permission` (`perId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mission
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission`  (
  `missionId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NOT NULL,
  `missionTypeId` int(11) NOT NULL,
  `missionLevelId` int(11) NOT NULL,
  `missionTitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `missionContent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `missionPic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `demandTime` datetime(0) NULL DEFAULT NULL,
  `afTime` datetime(0) NULL DEFAULT NULL,
  `publishMan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`missionId`) USING BTREE,
  INDEX `mission_area`(`areaId`) USING BTREE,
  INDEX `mission_missionType`(`missionTypeId`) USING BTREE,
  INDEX `messioni_mission_level`(`missionLevelId`) USING BTREE,
  CONSTRAINT `messioni_mission_level` FOREIGN KEY (`missionLevelId`) REFERENCES `mission_level` (`missionLevelId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mission_area` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mission_missionType` FOREIGN KEY (`missionTypeId`) REFERENCES `mission_type` (`missionTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mission_copy
-- ----------------------------
DROP TABLE IF EXISTS `mission_copy`;
CREATE TABLE `mission_copy`  (
  `missionId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NOT NULL,
  `missionTypeId` int(11) NOT NULL,
  `missionLevelId` int(11) NOT NULL,
  `missionTitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `missionContent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `missionPic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `demandTime` datetime(0) NULL DEFAULT NULL,
  `afTime` datetime(0) NULL DEFAULT NULL,
  `publishMan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`missionId`) USING BTREE,
  INDEX `mission_area`(`areaId`) USING BTREE,
  INDEX `mission_missionType`(`missionTypeId`) USING BTREE,
  INDEX `messioni_mission_level`(`missionLevelId`) USING BTREE,
  CONSTRAINT `mission_copy_ibfk_1` FOREIGN KEY (`missionLevelId`) REFERENCES `mission_level` (`missionLevelId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mission_copy_ibfk_2` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mission_copy_ibfk_3` FOREIGN KEY (`missionTypeId`) REFERENCES `mission_type` (`missionTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mission_level
-- ----------------------------
DROP TABLE IF EXISTS `mission_level`;
CREATE TABLE `mission_level`  (
  `missionLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `missionLevelName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`missionLevelId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mission_type
-- ----------------------------
DROP TABLE IF EXISTS `mission_type`;
CREATE TABLE `mission_type`  (
  `missionTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `missionTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`missionTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mission_user
-- ----------------------------
DROP TABLE IF EXISTS `mission_user`;
CREATE TABLE `mission_user`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `missionId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `isFinished` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `evaluate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `missionContent2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `missionPic2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `missioin_user`(`missionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for party_member
-- ----------------------------
DROP TABLE IF EXISTS `party_member`;
CREATE TABLE `party_member`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `areaName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nation` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `joinDtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addUName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateUName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleteStatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spare1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spare2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spare3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `perId` int(11) NOT NULL AUTO_INCREMENT,
  `perName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`perId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for politics
-- ----------------------------
DROP TABLE IF EXISTS `politics`;
CREATE TABLE `politics`  (
  `politicsId` int(11) NOT NULL AUTO_INCREMENT,
  `politicsName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`politicsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '政治面貌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pop_attr
-- ----------------------------
DROP TABLE IF EXISTS `pop_attr`;
CREATE TABLE `pop_attr`  (
  `popId` int(11) NOT NULL,
  `popAttrId` int(11) NOT NULL,
  PRIMARY KEY (`popId`, `popAttrId`) USING BTREE,
  INDEX `FK_Relationship_18`(`popAttrId`) USING BTREE,
  CONSTRAINT `FK_Relationship_17` FOREIGN KEY (`popId`) REFERENCES `population` (`popId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_18` FOREIGN KEY (`popAttrId`) REFERENCES `popattr` (`popAttrId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pop_nation
-- ----------------------------
DROP TABLE IF EXISTS `pop_nation`;
CREATE TABLE `pop_nation`  (
  `nationId` int(11) NOT NULL AUTO_INCREMENT,
  `nationName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`nationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '民族表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for popattr
-- ----------------------------
DROP TABLE IF EXISTS `popattr`;
CREATE TABLE `popattr`  (
  `popAttrId` int(11) NOT NULL AUTO_INCREMENT,
  `popAttrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tj_flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`popAttrId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人口基本属性类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for population
-- ----------------------------
DROP TABLE IF EXISTS `population`;
CREATE TABLE `population`  (
  `popId` int(11) NOT NULL AUTO_INCREMENT,
  `marriageId` int(11) NULL DEFAULT NULL,
  `relationId` int(11) NULL DEFAULT NULL,
  `areaId` int(11) NULL DEFAULT NULL,
  `courtId` int(11) NULL DEFAULT NULL,
  `natureId` int(11) NULL DEFAULT NULL,
  `partyAreaId` int(11) NULL DEFAULT NULL,
  `levelId` int(11) NULL DEFAULT NULL,
  `nationId` int(11) NULL DEFAULT NULL,
  `accountId` int(11) NULL DEFAULT NULL,
  `politicsId` int(11) NULL DEFAULT NULL,
  `gridId` int(11) NULL DEFAULT NULL,
  `gridStaffId` int(11) NULL DEFAULT NULL,
  `popName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popSex` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popBirthday` date NULL DEFAULT NULL,
  `popAge` int(11) NULL DEFAULT NULL,
  `popNative` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popJob` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popIcon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popPic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popNativeSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popNowSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popCompany` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popJobSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popCar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popHobby` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `popInsured` int(11) NULL DEFAULT 0,
  `householder` int(11) NULL DEFAULT 0,
  `isFlow` int(11) NOT NULL DEFAULT 0,
  `editPopName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editPopDate` datetime(0) NULL DEFAULT NULL,
  `popAudit` int(11) NULL DEFAULT 1,
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `entryType` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_lag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`popId`, `isFlow`) USING BTREE,
  INDEX `FK_Reference_46`(`gridId`) USING BTREE,
  INDEX `FK_Reference_47`(`gridStaffId`) USING BTREE,
  INDEX `FK_Relationship_22`(`marriageId`) USING BTREE,
  INDEX `FK_Relationship_23`(`nationId`) USING BTREE,
  INDEX `FK_Relationship_24`(`relationId`) USING BTREE,
  INDEX `FK_Relationship_26`(`politicsId`) USING BTREE,
  INDEX `FK_Relationship_27`(`levelId`) USING BTREE,
  INDEX `FK_Relationship_28`(`accountId`) USING BTREE,
  INDEX `FK_Relationship_29`(`areaId`) USING BTREE,
  INDEX `courtId`(`courtId`) USING BTREE,
  INDEX `natureId`(`natureId`) USING BTREE,
  INDEX `population_ibfk_3`(`partyAreaId`) USING BTREE,
  CONSTRAINT `FK_Reference_46` FOREIGN KEY (`gridId`) REFERENCES `grid` (`gridId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_47` FOREIGN KEY (`gridStaffId`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`marriageId`) REFERENCES `marriage_status` (`marriageId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`nationId`) REFERENCES `pop_nation` (`nationId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_24` FOREIGN KEY (`relationId`) REFERENCES `holder_relation` (`relationId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_26` FOREIGN KEY (`politicsId`) REFERENCES `politics` (`politicsId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_27` FOREIGN KEY (`levelId`) REFERENCES `culture_level` (`levelId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_28` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_29` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `population_ibfk_1` FOREIGN KEY (`courtId`) REFERENCES `court` (`courtId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `population_ibfk_2` FOREIGN KEY (`natureId`) REFERENCES `company_nature` (`natureId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `population_ibfk_3` FOREIGN KEY (`partyAreaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 63174 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for road
-- ----------------------------
DROP TABLE IF EXISTS `road`;
CREATE TABLE `road`  (
  `roadId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NULL DEFAULT NULL,
  `roadGradeId` int(11) NULL DEFAULT NULL,
  `roadName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roadLength` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roadWidth` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `laneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `singleLane` int(11) NOT NULL,
  `roadPic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roadAudit` int(11) NOT NULL DEFAULT 1,
  `editRoadName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editRoadDate` datetime(0) NOT NULL,
  PRIMARY KEY (`roadId`) USING BTREE,
  INDEX `FK_Relationship_34`(`roadGradeId`) USING BTREE,
  INDEX `FK_Relationship_38`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Relationship_34` FOREIGN KEY (`roadGradeId`) REFERENCES `road_grade` (`roadGradeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_38` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '道路表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for road_grade
-- ----------------------------
DROP TABLE IF EXISTS `road_grade`;
CREATE TABLE `road_grade`  (
  `roadGradeId` int(11) NOT NULL AUTO_INCREMENT,
  `roadGradeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`roadGradeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '道路等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleMemo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editRoleName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editRoleDate` datetime(0) NOT NULL,
  `role_enable` int(11) NULL DEFAULT 1,
  `roleLevel` int(11) NOT NULL,
  `userCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_per
-- ----------------------------
DROP TABLE IF EXISTS `role_per`;
CREATE TABLE `role_per`  (
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `perId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`, `menuId`, `perId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `menuId`(`menuId`) USING BTREE,
  INDEX `perId`(`perId`) USING BTREE,
  CONSTRAINT `FK_Reference_51` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_52` FOREIGN KEY (`perId`) REFERENCES `permission` (`perId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_46` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smalldataform
-- ----------------------------
DROP TABLE IF EXISTS `smalldataform`;
CREATE TABLE `smalldataform`  (
  `sdfId` int(11) NOT NULL AUTO_INCREMENT,
  `sdfLegendName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sdfName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdfValue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sdfId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `storeId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NULL DEFAULT NULL,
  `storeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `storeScope` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeArea` int(11) NULL DEFAULT NULL,
  `storeSite` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linlkMan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storePic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeAudit` int(11) NOT NULL DEFAULT 1,
  `editStoreName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editStoreDate` datetime(0) NOT NULL,
  PRIMARY KEY (`storeId`) USING BTREE,
  INDEX `FK_Relationship_41`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Relationship_41` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商铺信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级目录',
  `status` int(11) NULL DEFAULT NULL COMMENT '默认值为0（禁用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_pid_id`(`pid`) USING BTREE,
  CONSTRAINT `fk_menu_pid_id` FOREIGN KEY (`pid`) REFERENCES `tb_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 519 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `tb_rolemenu`;
CREATE TABLE `tb_rolemenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleld` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `menuld` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for turn
-- ----------------------------
DROP TABLE IF EXISTS `turn`;
CREATE TABLE `turn`  (
  `turnId` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NULL DEFAULT NULL,
  `turnPeople` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acquisitionPeople` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `turnDate` datetime(0) NULL DEFAULT NULL,
  `endPeople` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`turnId`) USING BTREE,
  INDEX `relation_event`(`eventId`) USING BTREE,
  CONSTRAINT `relation_event` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `unitId` int(11) NOT NULL AUTO_INCREMENT,
  `blockId` int(11) NULL DEFAULT NULL,
  `unitName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floorCount` int(11) NOT NULL,
  PRIMARY KEY (`unitId`) USING BTREE,
  INDEX `FK_Relationship_12`(`blockId`) USING BTREE,
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`blockId`) REFERENCES `block` (`blockId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 534 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '楼栋单元表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headIcon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobileTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `officeTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editUserName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editUserDate` datetime(0) NOT NULL,
  `user_enable` int(11) NOT NULL DEFAULT 1,
  `user_last_login` datetime(0) NULL DEFAULT NULL,
  `user_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `FK_Relationship_45`(`roleId`) USING BTREE,
  INDEX `FK_Relationship_6`(`areaId`) USING BTREE,
  CONSTRAINT `FK_Relationship_45` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_company
-- ----------------------------
DROP TABLE IF EXISTS `user_company`;
CREATE TABLE `user_company`  (
  `userId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_staff
-- ----------------------------
DROP TABLE IF EXISTS `user_staff`;
CREATE TABLE `user_staff`  (
  `userId` int(11) NOT NULL,
  `gridStaffId` int(11) NOT NULL,
  INDEX `user_staff_userId`(`userId`) USING BTREE,
  INDEX `user_staff_gridStaffId`(`gridStaffId`) USING BTREE,
  CONSTRAINT `user_staff_gridStaffId` FOREIGN KEY (`gridStaffId`) REFERENCES `grid_staff` (`gridStaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_staff_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_appeal
-- ----------------------------
DROP TABLE IF EXISTS `w_appeal`;
CREATE TABLE `w_appeal`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `areaId` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `opinion_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交类型',
  `genre_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类型(1级,2级,3级)',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类容',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件图片',
  `typeId` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型',
  `tel` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `process_state` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件状态',
  `re_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复类容',
  `re_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复图片',
  `re_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复时间',
  `re_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复用户',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交地址',
  `score` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分',
  `score_msg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spare2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spare3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_interview
-- ----------------------------
DROP TABLE IF EXISTS `w_interview`;
CREATE TABLE `w_interview`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gridStaffId` int(11) NULL DEFAULT NULL,
  `titlePic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interviewPic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resultPic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_people_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_people_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `relation_grid_staff`(`gridStaffId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for queryUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `queryUser`;
delimiter ;;
CREATE PROCEDURE `queryUser`(IN `user_name`varchar(20))
BEGIN
	if `user_name` is null or `user_name` ='' THEN
	select * from user;
	ELSE
	select * from user where userName like `user_name` ;
	end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for queryUserAndCountUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `queryUserAndCountUser`;
delimiter ;;
CREATE PROCEDURE `queryUserAndCountUser`(IN `user_name` varchar(20),OUT `user_count` int)
BEGIN
	if user_name is null or user_name='' then 
	select * from user;
	ELSE
	select * from user where userName like user_name;
	end if;
	select FOUND_ROWS() INTO user_count;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
