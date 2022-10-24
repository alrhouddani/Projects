DROP DATABASE IF EXISTS `simple`;
CREATE DATABASE `simple`; 


USE `simple`;
CREATE TABLE `simple-table` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
   PRIMARY KEY (`id`)
  );

INSERT INTO `name` VALUES (1,'name1');
INSERT INTO `name` VALUES (2,'name2');
