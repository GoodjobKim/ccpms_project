CREATE DATABASE CCPMS;
USE CCPMS;

CREATE TABLE `ADMIN`(
	ADMIN_ID	VARCHAR(20) PRIMARY KEY,
    PASSWD		VARCHAR(100),
    JOIN_DT		TIMESTAMP
);

INSERT INTO `ADMIN` VALUES('ccpmsadmin', 'Sh@d0w', NOW());

CREATE TABLE MEMBER(
	MEMBER_ID	VARCHAR(20) PRIMARY KEY,
    PASSWD		VARCHAR(200),
	MEMBER_NM	VARCHAR(10),
	SEX			CHAR(1),
    DATE_BIRTH	CHAR(10),
    HP			VARCHAR(50),
    SMSSTS_YN	CHAR(1),
    EMAIL		VARCHAR(50),
    EMAILSTS_YN	CHAR(1),
    ZIPCODE		VARCHAR(10),
    ROAD_ADDRESS	VARCHAR(500),
    JIBUN_ADDRESS	VARCHAR(500),
    NAMUJI_ADDRESS	VARCHAR(500),
    POINT		INT,
    JOIN_DT		TIMESTAMP
);

CREATE TABLE GOODS(
	GOODS_CD		INT PRIMARY KEY,
    GOODS_NM		VARCHAR(100),
    ACTOR			VARCHAR(200),
    LOCATION		VARCHAR(100),
    SORT			VARCHAR(50),
    PART			VARCHAR(100),
    PUBLISHED_DT	TIMESTAMP,
    PUBLISHED_TIME	VARCHAR(200),
    SHOWTIME		VARCHAR(200),
    GRADE			VARCHAR(50),
    PRICE			INT,
    START_DT		TIMESTAMP,
    END_DT			TIMESTAMP,
    POINT			INT,
    SHOW_INTRO		VARCHAR(3000),
    ACTOR_INFO		VARCHAR(3000),
    CONTENTS_ORDER	VARCHAR(3000),
    GOODS_FILE_NAME	VARCHAR(300),
    ENROLL_DT		TIMESTAMP,
    DISCOUNT_RATE	INT,
    STOCK			INT,
    DELIVERY_INFO	VARCHAR(100),
    DELIVARY_PRICE	INT,
    GENRE			VARCHAR(50)
);