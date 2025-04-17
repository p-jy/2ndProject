DROP DATABASE IF EXISTS `activelife`;

CREATE DATABASE `activelife`;

USE `activelife`;

DROP TABLE IF EXISTS `SHARE_RECORD`;

CREATE TABLE `SHARE_RECORD` (
	`SR_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`SR_RC_NUM`	INT	 NULL,
	`SR_GR_NUM`	INT	 NULL
);

DROP TABLE IF EXISTS `GROUP`;

CREATE TABLE `GROUP` (
	`GR_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`GR_PUBLIC`	ENUM("Y", "N") NOT	NULL,
	`GR_CODE`	CHAR(6) UNIQUE	NULL,
	`GR_PW`	CHAR(4)	NULL,
	`GR_NAME`	VARCHAR(20) NOT	NULL,
	`GR_INTRODUCTION`	LONGTEXT	NULL,
	`GR_START_DATE`	DATE NULL,
	`GR_PERIOD`	INT	NULL,
	`GR_PERSONNEL`	INT NOT	NULL,
	`GR_PARTICIPANT`	INT DEFAULT 0 NOT	NULL,
	`GR_DEL`	ENUM("Y", "N")  DEFAULT "N" NOT	NULL,
	`GR_ME_ID`	VARCHAR(15)	NOT NULL
);

DROP TABLE IF EXISTS `INGREDIENT`;

CREATE TABLE `INGREDIENT` (
	`IN_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`IN_CAL`	INT NOT	NULL,
	`IN_CARBO`	INT NOT	NULL,
	`IN_PROTEIN`	INT NOT	NULL,
	`IN_PROVINCE`	INT NOT	NULL
);

DROP TABLE IF EXISTS `DIET_PIC`;

CREATE TABLE `DIET_PIC` (
	`DP_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`DP_ORI_NAME`	VARCHAR(255)	NULL,
	`DP_NAME`	VARCHAR(255)	NULL,
	`DP_DI_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `INBODY`;

CREATE TABLE `INBODY` (
	`IB_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`IB_DATE`	DATE NOT	NULL,
	`IB_WEIGHT`	DOUBLE NOT	NULL,
	`IB_SMM`	DOUBLE	NULL,
	`IB_BFM`	DOUBLE	NULL,
	`IB_BEDTIME`	CHAR(5)	NULL,
	`IB_BED_DATE`	ENUM("어제", "오늘")	NULL,
	`IB_WAKETIME`	CHAR(5)	NULL,
	`IB_MEMO`	LONGTEXT	NULL,
	`IB_ME_ID`	VARCHAR(15)	NOT NULL
);

DROP TABLE IF EXISTS `OPTION`;

CREATE TABLE `OPTION` (
	`OP_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`OP_TABLE`	VARCHAR(7) NOT	NULL,
	`OP_TABLE_NUM`	INT NOT	NULL,
	`OP_SC_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `RULE`;

CREATE TABLE `RULE` (
	`RL_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`RL_RULE`	VARCHAR(20)	NULL,
	`RL_GR_NUM`	INT NULL
);

DROP TABLE IF EXISTS `PLAN`;

CREATE TABLE `PLAN` (
	`PL_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`PL_TITLE`	VARCHAR(20) NOT	NULL,
	`PL_PERIOD`	INT NOT	NULL,
	`PL_ME_ID`	VARCHAR(15)	NOT NULL,
	`PL_MC_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `DAY`;

CREATE TABLE `DAY` (
	`DY_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`DY_DAY`	ENUM("월", "화", "수", "목", "금", "토", "일") NOT	NULL,
	`DY_PL_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `GROUP_GOAL`;

CREATE TABLE `GROUP_GOAL` (
	`GG_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`GG_GR_NUM`	INT	 NULL,
	`GG_GL_NUM`	INT	 NULL
);

DROP TABLE IF EXISTS `GOAL`;

CREATE TABLE `GOAL` (
	`GL_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL
);

DROP TABLE IF EXISTS `DIET`;

CREATE TABLE `DIET` (
	`DI_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`DI_NAME`	VARCHAR(20) NOT	NULL,
	`DI_DATE`	DATE NOT	NULL,
	`DI_AMPM`	ENUM("오전", "오후") NOT	NULL,
	`DI_TIME`	CHAR(5) NOT	NULL,
	`DI_SCORE`	CHAR(1) NOT	NULL,
	`DI_MEMO`	LONGTEXT	NULL,
	`DI_ME_ID`	VARCHAR(15)	NOT NULL
);

DROP TABLE IF EXISTS `INBODY_PIC`;

CREATE TABLE `INBODY_PIC` (
	`IP_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`IP_ORI_NAME`	VARCHAR(255) NOT	NULL,
	`IP_NAME`	VARCHAR(255) NOT	NULL,
	`IP_IB_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `FOOD`;

CREATE TABLE `FOOD` (
	`FO_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`FO_TYPE`	ENUM("Y", "N") DEFAULT "Y" NOT	NULL,
	`FO_NAME`	VARCHAR(20) NOT	NULL,
	`FO_AMOUNT`	INT DEFAULT 0 NOT	NULL,
	`FO_UNIT`	ENUM("g", "ml") DEFAULT "g" NOT	NULL,
	`FO_IN_NUM`	INT	NOT NULL,
	`FO_DI_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `MEMBER`;

CREATE TABLE `MEMBER` (
	`ME_ID`	VARCHAR(15) PRIMARY KEY	NOT NULL,
	`ME_NAME`	VARCHAR(15) UNIQUE	NULL,
	`ME_PW`	VARCHAR(255)	NULL,
	`ME_PHONE`	VARCHAR(13) UNIQUE	NULL,
	`ME_COOKIE`	VARCHAR(255)	NULL,
	`ME_LIMIT`	DATETIME	NULL,
	`ME_DEL`	ENUM("Y","N") DEFAULT "N" NOT	NULL
);

DROP TABLE IF EXISTS `RECORD`;

CREATE TABLE `RECORD` (
	`RC_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`RC_MC_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `WORKOUT_PIC`;

CREATE TABLE `WORKOUT_PIC` (
	`WP_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`WP_ORI_NAME`	VARCHAR(255) NOT	NULL,
	`WP_NAME`	VARCHAR(255) NOT	NULL,
	`WP_WO_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `GROUP_MEMBER`;

CREATE TABLE `GROUP_MEMBER` (
	`GM_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`GM_ME_ID`	VARCHAR(15)	 NULL,
	`GM_GR_NUM`	INT	 NULL
);

DROP TABLE IF EXISTS `MESSAGE`;

CREATE TABLE `MESSAGE` (
	`MS_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`MS_CONTENT`	LONGTEXT NOT	NULL,
	`MS_TIME`	DATETIME DEFAULT CURRENT_TIMESTAMP NOT	NULL,
	`MS_GM_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `WORKOUT`;

CREATE TABLE `WORKOUT` (
	`WO_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`WO_TITLE`	VARCHAR(20) NOT	NULL,
	`WO_DATE`	DATE NOT	NULL,
	`WO_AMPM`	ENUM("오전", "오후") NOT	NULL,
	`WO_TIME`	CHAR(5) NOT	NULL,
	`WO_MINUTE`	INT NOT	NULL,
	`WO_TEXT`	LONGTEXT NOT	NULL,
	`WO_ME_ID`	VARCHAR(15)	NOT NULL
);

DROP TABLE IF EXISTS `SUB_CATE`;

CREATE TABLE `SUB_CATE` (
	`SC_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`SC_TYPE`	VARCHAR(3) NOT	NULL,
	`SC_NAME`	VARCHAR(8) NOT	NULL,
	`SC_MC_NUM`	INT	NOT NULL
);

DROP TABLE IF EXISTS `MAJOR_CATE`;

CREATE TABLE `MAJOR_CATE` (
	`MC_NUM`	INT PRIMARY KEY AUTO_INCREMENT	NOT NULL,
	`MC_NAME`	CHAR(2) UNIQUE NOT	NULL
);

ALTER TABLE `SHARE_RECORD` ADD CONSTRAINT `FK_RECORD_TO_SHARE_RECORD_1` FOREIGN KEY (
	`SR_RC_NUM`
)
REFERENCES `RECORD` (
	`RC_NUM`
);

ALTER TABLE `SHARE_RECORD` ADD CONSTRAINT `FK_GROUP_TO_SHARE_RECORD_1` FOREIGN KEY (
	`SR_GR_NUM`
)
REFERENCES `GROUP` (
	`GR_NUM`
);

ALTER TABLE `GROUP` ADD CONSTRAINT `FK_MEMBER_TO_GROUP_1` FOREIGN KEY (
	`GR_ME_ID`
)
REFERENCES `MEMBER` (
	`ME_ID`
);

ALTER TABLE `DIET_PIC` ADD CONSTRAINT `FK_DIET_TO_DIET_PIC_1` FOREIGN KEY (
	`DP_DI_NUM`
)
REFERENCES `DIET` (
	`DI_NUM`
);

ALTER TABLE `INBODY` ADD CONSTRAINT `FK_MEMBER_TO_INBODY_1` FOREIGN KEY (
	`IB_ME_ID`
)
REFERENCES `MEMBER` (
	`ME_ID`
);

ALTER TABLE `OPTION` ADD CONSTRAINT `FK_SUB_CATE_TO_OPTION_1` FOREIGN KEY (
	`OP_SC_NUM`
)
REFERENCES `SUB_CATE` (
	`SC_NUM`
);

ALTER TABLE `RULE` ADD CONSTRAINT `FK_GROUP_TO_RULE_1` FOREIGN KEY (
	`RL_GR_NUM`
)
REFERENCES `GROUP` (
	`GR_NUM`
);

ALTER TABLE `PLAN` ADD CONSTRAINT `FK_MEMBER_TO_PLAN_1` FOREIGN KEY (
	`PL_ME_ID`
)
REFERENCES `MEMBER` (
	`ME_ID`
);

ALTER TABLE `PLAN` ADD CONSTRAINT `FK_MAJOR_CATE_TO_PLAN_1` FOREIGN KEY (
	`PL_MC_NUM`
)
REFERENCES `MAJOR_CATE` (
	`MC_NUM`
);

ALTER TABLE `DAY` ADD CONSTRAINT `FK_PLAN_TO_DAY_1` FOREIGN KEY (
	`DY_PL_NUM`
)
REFERENCES `PLAN` (
	`PL_NUM`
);

ALTER TABLE `GROUP_GOAL` ADD CONSTRAINT `FK_GROUP_TO_GROUP_GOAL_1` FOREIGN KEY (
	`GG_GR_NUM`
)
REFERENCES `GROUP` (
	`GR_NUM`
);

ALTER TABLE `GROUP_GOAL` ADD CONSTRAINT `FK_GOAL_TO_GROUP_GOAL_1` FOREIGN KEY (
	`GG_GL_NUM`
)
REFERENCES `GOAL` (
	`GL_NUM`
);

ALTER TABLE `DIET` ADD CONSTRAINT `FK_MEMBER_TO_DIET_1` FOREIGN KEY (
	`DI_ME_ID`
)
REFERENCES `MEMBER` (
	`ME_ID`
);

ALTER TABLE `INBODY_PIC` ADD CONSTRAINT `FK_INBODY_TO_INBODY_PIC_1` FOREIGN KEY (
	`IP_IB_NUM`
)
REFERENCES `INBODY` (
	`IB_NUM`
);

ALTER TABLE `FOOD` ADD CONSTRAINT `FK_INGREDIENT_TO_FOOD_1` FOREIGN KEY (
	`FO_IN_NUM`
)
REFERENCES `INGREDIENT` (
	`IN_NUM`
);

ALTER TABLE `FOOD` ADD CONSTRAINT `FK_DIET_TO_FOOD_1` FOREIGN KEY (
	`FO_DI_NUM`
)
REFERENCES `DIET` (
	`DI_NUM`
);

ALTER TABLE `RECORD` ADD CONSTRAINT `FK_MAJOR_CATE_TO_RECORD_1` FOREIGN KEY (
	`RC_MC_NUM`
)
REFERENCES `MAJOR_CATE` (
	`MC_NUM`
);

ALTER TABLE `WORKOUT_PIC` ADD CONSTRAINT `FK_WORKOUT_TO_WORKOUT_PIC_1` FOREIGN KEY (
	`WP_WO_NUM`
)
REFERENCES `WORKOUT` (
	`WO_NUM`
);

ALTER TABLE `GROUP_MEMBER` ADD CONSTRAINT `FK_MEMBER_TO_GROUP_MEMBER_1` FOREIGN KEY (
	`GM_ME_ID`
)
REFERENCES `MEMBER` (
	`ME_ID`
);

ALTER TABLE `GROUP_MEMBER` ADD CONSTRAINT `FK_GROUP_TO_GROUP_MEMBER_1` FOREIGN KEY (
	`GM_GR_NUM`
)
REFERENCES `GROUP` (
	`GR_NUM`
);

ALTER TABLE `MESSAGE` ADD CONSTRAINT `FK_GROUP_MEMBER_TO_MESSAGE_1` FOREIGN KEY (
	`MS_GM_NUM`
)
REFERENCES `GROUP_MEMBER` (
	`GM_NUM`
);

ALTER TABLE `WORKOUT` ADD CONSTRAINT `FK_MEMBER_TO_WORKOUT_1` FOREIGN KEY (
	`WO_ME_ID`
)
REFERENCES `MEMBER` (
	`ME_ID`
);

ALTER TABLE `SUB_CATE` ADD CONSTRAINT `FK_MAJOR_CATE_TO_SUB_CATE_1` FOREIGN KEY (
	`SC_MC_NUM`
)
REFERENCES `MAJOR_CATE` (
	`MC_NUM`
);