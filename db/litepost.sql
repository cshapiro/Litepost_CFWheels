/*
MySQL Data Transfer
Source Host: localhost
Source Database: litepost
Target Host: localhost
Target Database: litepost
Date: 2/20/2010 11:17:58 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bookmarks
-- ----------------------------
DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `bookmarkID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`bookmarkID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `entryID` int(11) NOT NULL,
  `comment` text NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `comments_entryID_ix` (`entryID`),
  CONSTRAINT `comments_entryD_pk` FOREIGN KEY (`entryID`) REFERENCES `entries` (`entryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for entries
-- ----------------------------
DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`entryID`),
  KEY `entries_userID_fk` (`userID`),
  KEY `entries_categoryID_ix` (`categoryID`),
  CONSTRAINT `entries_userID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `users_login_IX` (`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bookmarks` VALUES ('1', 'CFWheels', 'http://www.cfwheels.org');
INSERT INTO `categories` VALUES ('1', 'CFWheels');
INSERT INTO `categories` VALUES ('2', 'ColdFusion');
INSERT INTO `categories` VALUES ('3', 'Everything Else');
INSERT INTO `comments` VALUES ('1', '1', 'Great Framework. I can see where it will make my development much faster! ', 'Cat Shap', 'cathyshapiro@gmail.com', 'http://flashprodesign.com', '2010-02-19 14:02:25');
INSERT INTO `comments` VALUES ('2', '1', 'Another comment', 'Cat Shap', 'c@c.com', 'cc.com', '2010-02-19 14:27:44');
INSERT INTO `comments` VALUES ('3', '2', 'bla bla bla', 'bla', 'bla', 'bla', '2010-02-19 21:23:32');
INSERT INTO `comments` VALUES ('4', '1', 'my comment', 'My Name', 'name@name.com', null, '2010-02-19 22:37:46');
INSERT INTO `comments` VALUES ('5', '2', 'Another comment', 'Cathy', 'caty@cc.com', null, '2010-02-19 22:48:35');
INSERT INTO `entries` VALUES ('1', '2', '1', 'CoC in CFWheels', 'I guess the hardest part of the assignment was not being able to redo the database.\r\n\r\nThe whole point of the Convention over Configuration idea is that some things are supposed to be standard, like the way you name items in your database.\r\n\r\nHowever, CFWheels proves to be very flexible.\r\nI found a good workaround for the fields that were named incorrectly. \r\n\r\nIn the config/settings.cfm file, I told Wheels where to look for the createdAt and updatedAt fields:\r\n\r\n<cfset set(timeStampOnCreateProperty = \"dateCreated\")>\r\n<cfset set(timeStampOnUpdateProperty = \"dateLastUpdated\")>\r\n\r\nThen, because Wheels expects your foreign key to always be named \"id\", I had to use the foreignKey attribute of the belongsTo tab in the models.\r\n\r\nExample in my entries model:\r\n\r\n<cffunction name=\"init\">\r\n		<cfset belongsTo(name=\"user\", foreignKey=\"userid\")>\r\n		<cfset belongsTo(name=\"category\", foreignKey=\"categoryid\")>\r\n		<cfset hasMany(\"comments\")>		\r\n	</cffunction> \r\n\r\n', '2010-02-19 13:17:54', '2010-02-19 15:43:09');
INSERT INTO `entries` VALUES ('2', '1', '3', 'Testing Two', 'this is a test', '2010-02-19 14:32:08', null);
INSERT INTO `users` VALUES ('1', 'Chris', 'Scott', 'chris.scott.one@gmail.com', 'chris', 'asstro', 'admin');
INSERT INTO `users` VALUES ('2', 'Cathy', 'Shapiro', 'cathy@flashprodesign.com', 'admin', 'admin', 'admin');
