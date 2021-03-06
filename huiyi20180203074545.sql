-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: huiyi
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户管理',
  `aname` varchar(20) NOT NULL COMMENT '管理员名',
  `apassword` varchar(32) NOT NULL COMMENT '密码',
  `is_use` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '管理员是否可用,1:启用,0:禁用',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'root','b9be11166d72e9e3ae7fd407165e4bd2',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `aid` smallint(4) unsigned NOT NULL COMMENT '管理员Id',
  `rid` smallint(4) unsigned NOT NULL COMMENT '角色Id',
  KEY `aid` (`aid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员角色联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `bid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `bname` varchar(50) NOT NULL COMMENT '企业名',
  `pcode` varchar(32) NOT NULL COMMENT '企业授权码',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='企业信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (16,'姹熻タ鐞嗗伐澶у','DP3SVHNC9M4DB1PY8WR9Y9WCGDRILIIZ'),(17,'娓呭崕澶у','K0THBJ1ZFHGL2Z3MSD10CAETAUHJTSMK');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meet_create`
--

DROP TABLE IF EXISTS `meet_create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meet_create` (
  `mid` varchar(15) NOT NULL COMMENT '会议ID',
  `uid` varchar(15) NOT NULL COMMENT '用户ID',
  `mtitle` varchar(50) NOT NULL COMMENT '会议标题',
  `mcontent` tinytext COMMENT '会议内容',
  `maddress` varchar(150) NOT NULL COMMENT '会议地点',
  `mstartime` int(10) unsigned NOT NULL COMMENT '会议开始时间',
  `mendtime` int(10) unsigned NOT NULL COMMENT '会议结束时间',
  `wlanmac` varchar(17) NOT NULL COMMENT '注册手机连接的无线路由器',
  `bluetoothmac` varchar(17) NOT NULL COMMENT '注册手机连接的蓝牙',
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会议创建表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet_create`
--

LOCK TABLES `meet_create` WRITE;
/*!40000 ALTER TABLE `meet_create` DISABLE KEYS */;
/*!40000 ALTER TABLE `meet_create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `pid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `pname` varchar(30) NOT NULL COMMENT '权限名',
  `mname` varchar(20) NOT NULL COMMENT '模块名',
  `cname` varchar(20) NOT NULL COMMENT '控制器名',
  `aname` varchar(20) NOT NULL COMMENT '动作名',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级权限名',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege_role`
--

DROP TABLE IF EXISTS `privilege_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege_role` (
  `rid` smallint(4) unsigned NOT NULL COMMENT '角色Id',
  `pid` smallint(5) unsigned NOT NULL COMMENT '权限ID',
  KEY `rid` (`rid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege_role`
--

LOCK TABLES `privilege_role` WRITE;
/*!40000 ALTER TABLE `privilege_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilege_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色Id',
  `rname` varchar(30) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` varchar(15) NOT NULL COMMENT '用户ID',
  `uname` varchar(20) NOT NULL COMMENT '用户中文名',
  `uphoto` varchar(150) NOT NULL COMMENT '用户头像',
  `uphone` int(11) unsigned DEFAULT NULL COMMENT '用户电话',
  `pid` varchar(150) DEFAULT NULL COMMENT '指纹ID',
  `user_type` tinyint(2) unsigned NOT NULL COMMENT '用户类型',
  `pwd` varchar(32) NOT NULL,
  `bid` int(11) unsigned NOT NULL COMMENT '公司ID',
  PRIMARY KEY (`uid`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('15570126331','鏈变笘楣�','',NULL,NULL,1,'39511a12edcfc9982e3c08b84358763e',16),('15070324860','鏉庨鏉�','',NULL,'WE812DF400000000000000000000000000000000000000000000000000000000',1,'2e028b726acb9b691ace56dc42488573',16);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sign`
--

DROP TABLE IF EXISTS `user_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sign` (
  `uid` varchar(15) NOT NULL COMMENT '用户ID',
  `mid` varchar(15) NOT NULL COMMENT '会议ID',
  `isfingerprint` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否用指纹签到1:是0:不是',
  `rssi` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '无线信号值',
  `signtime` int(10) unsigned NOT NULL COMMENT '用户签到时间',
  `issign` tinyint(2) unsigned NOT NULL COMMENT '用户是否签到',
  KEY `uid` (`uid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户签到表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sign`
--

LOCK TABLES `user_sign` WRITE;
/*!40000 ALTER TABLE `user_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sign` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-03  7:45:47
