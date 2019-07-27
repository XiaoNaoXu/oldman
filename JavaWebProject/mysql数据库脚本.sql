-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_oldMan` (
  `oldManId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���˱��',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `age` int(11) NOT NULL COMMENT '����',
  `manPhoto` varchar(60)  NOT NULL COMMENT '������Ƭ',
  `manDesc` varchar(5000)  NULL COMMENT '���˽���',
  `userObj` varchar(30)  NOT NULL COMMENT '�Ǽ��û�',
  `addTime` varchar(20)  NULL COMMENT '�Ǽ�ʱ��',
  PRIMARY KEY (`oldManId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_roomType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `typeName` varchar(20)  NOT NULL COMMENT '������������',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_room` (
  `roomNo` varchar(20)  NOT NULL COMMENT 'roomNo',
  `roomTypeObj` int(11) NOT NULL COMMENT '��������',
  `roomName` varchar(20)  NOT NULL COMMENT '��������',
  `mainPhoto` varchar(60)  NOT NULL COMMENT '������ͼ',
  `price` float NOT NULL COMMENT '����۸�',
  `roomDesc` varchar(5000)  NULL COMMENT '��������',
  `roomState` varchar(20)  NOT NULL COMMENT '����״̬',
  PRIMARY KEY (`roomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_roomOrder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������',
  `roomObj` varchar(20)  NOT NULL COMMENT '��ס����',
  `oldManObj` int(11) NOT NULL COMMENT '��ס����',
  `liveDate` varchar(20)  NULL COMMENT '��ס����',
  `monthNum` int(11) NOT NULL COMMENT '��סʱ��',
  `orderMoney` float NOT NULL COMMENT '�����ܽ��',
  `orderState` varchar(20)  NOT NULL COMMENT '����״̬',
  `orderDesc` varchar(5000)  NULL COMMENT '����������ϸ',
  `orderTime` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_nurse` (
  `nurseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼id',
  `nurseType` varchar(20)  NOT NULL COMMENT '��Ϣ���',
  `title` varchar(80)  NOT NULL COMMENT '��Ϣ����',
  `content` varchar(5000)  NOT NULL COMMENT '��Ϣ����',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`nurseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_reception` (
  `receptionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�Ӵ���¼id',
  `receptType` varchar(20)  NOT NULL COMMENT '�Ӵ����',
  `title` varchar(20)  NOT NULL COMMENT '�Ӵ�����',
  `content` varchar(5000)  NULL COMMENT '�Ӵ�����',
  `receptDate` varchar(20)  NULL COMMENT '�Ӵ�����',
  PRIMARY KEY (`receptionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_department` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���ű��',
  `departName` varchar(20)  NOT NULL COMMENT '��������',
  `bornDate` varchar(20)  NULL COMMENT '��������',
  `mainPerson` varchar(20)  NOT NULL COMMENT '������',
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_employee` (
  `employeeNo` varchar(30)  NOT NULL COMMENT 'employeeNo',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `departmentObj` int(11) NOT NULL COMMENT '���ڲ���',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `employeePhoto` varchar(60)  NOT NULL COMMENT 'Ա����Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  PRIMARY KEY (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_salary` (
  `salaryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `employeeObj` varchar(30)  NOT NULL COMMENT 'Ա��',
  `year` int(11) NOT NULL COMMENT '�������',
  `month` int(11) NOT NULL COMMENT '�����·�',
  `salaryMoney` float NOT NULL COMMENT '���ʽ��',
  `giveDate` varchar(20)  NULL COMMENT '��������',
  `salaryMemo` varchar(500)  NULL COMMENT '���ʱ�ע',
  PRIMARY KEY (`salaryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_oldMan ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_room ADD CONSTRAINT FOREIGN KEY (roomTypeObj) REFERENCES t_roomType(typeId);
ALTER TABLE t_roomOrder ADD CONSTRAINT FOREIGN KEY (roomObj) REFERENCES t_room(roomNo);
ALTER TABLE t_roomOrder ADD CONSTRAINT FOREIGN KEY (oldManObj) REFERENCES t_oldMan(oldManId);
ALTER TABLE t_employee ADD CONSTRAINT FOREIGN KEY (departmentObj) REFERENCES t_department(departmentId);
ALTER TABLE t_salary ADD CONSTRAINT FOREIGN KEY (employeeObj) REFERENCES t_employee(employeeNo);


