/*
Navicat MySQL Data Transfer

Source Server         : Windows
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : petclinic

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2022-11-27 23:56:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for owners
-- ----------------------------
DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of owners
-- ----------------------------
INSERT INTO `owners` VALUES ('1', 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '9055544433');
INSERT INTO `owners` VALUES ('2', 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749');
INSERT INTO `owners` VALUES ('3', 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763');
INSERT INTO `owners` VALUES ('4', 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198');
INSERT INTO `owners` VALUES ('5', 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765');
INSERT INTO `owners` VALUES ('6', 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654');
INSERT INTO `owners` VALUES ('7', 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387');
INSERT INTO `owners` VALUES ('8', 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683');
INSERT INTO `owners` VALUES ('9', 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435');
INSERT INTO `owners` VALUES ('10', 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487');
INSERT INTO `owners` VALUES ('30', 'arno', 'jack', '4', '5', '222222222222');

-- ----------------------------
-- Table structure for pets
-- ----------------------------
DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `type_id` int unsigned NOT NULL,
  `owner_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `owner_id` (`owner_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pets
-- ----------------------------
INSERT INTO `pets` VALUES ('1', 'Leo', '2000-09-07', '1', '1');
INSERT INTO `pets` VALUES ('2', 'Basil', '2002-08-06', '6', '2');
INSERT INTO `pets` VALUES ('3', 'Rosy', '2001-04-17', '2', '3');
INSERT INTO `pets` VALUES ('4', 'Jewel', '2000-03-07', '2', '3');
INSERT INTO `pets` VALUES ('5', 'Iggy', '2000-11-30', '3', '4');
INSERT INTO `pets` VALUES ('6', 'George', '2000-01-20', '4', '5');
INSERT INTO `pets` VALUES ('7', 'Samantha', '1995-09-04', '1', '6');
INSERT INTO `pets` VALUES ('8', 'Max', '1995-09-04', '1', '6');
INSERT INTO `pets` VALUES ('9', 'Lucky', '1999-08-06', '5', '7');
INSERT INTO `pets` VALUES ('10', 'Mulligan', '1997-02-24', '2', '8');
INSERT INTO `pets` VALUES ('11', 'Freddy', '2000-03-09', '5', '9');
INSERT INTO `pets` VALUES ('12', 'Lucky', '2000-06-24', '2', '10');
INSERT INTO `pets` VALUES ('13', 'Sly', '2002-06-08', '1', '10');

-- ----------------------------
-- Table structure for specialties
-- ----------------------------
DROP TABLE IF EXISTS `specialties`;
CREATE TABLE `specialties` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of specialties
-- ----------------------------
INSERT INTO `specialties` VALUES ('3', 'dentistry');
INSERT INTO `specialties` VALUES ('1', 'radiology');
INSERT INTO `specialties` VALUES ('2', 'surgery');

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES ('5', 'bird');
INSERT INTO `types` VALUES ('1', 'cat');
INSERT INTO `types` VALUES ('2', 'dog');
INSERT INTO `types` VALUES ('6', 'hamster');
INSERT INTO `types` VALUES ('3', 'lizard');
INSERT INTO `types` VALUES ('4', 'snake');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '9055544433', 'George');
INSERT INTO `user` VALUES ('2', '6085551749', 'Betty');
INSERT INTO `user` VALUES ('3', '6085558763', 'Eduardo');
INSERT INTO `user` VALUES ('4', '6085553198', 'Harold');
INSERT INTO `user` VALUES ('5', '6085552765', 'Peter');
INSERT INTO `user` VALUES ('6', '6085552654', 'Jean');
INSERT INTO `user` VALUES ('7', '6085555387', 'Jeff');
INSERT INTO `user` VALUES ('8', '6085557683', 'Maria');
INSERT INTO `user` VALUES ('9', '6085559435', 'David');
INSERT INTO `user` VALUES ('10', '6085555487', 'Carlos');
INSERT INTO `user` VALUES ('11', 'admin', 'admin');

-- ----------------------------
-- Table structure for vets
-- ----------------------------
DROP TABLE IF EXISTS `vets`;
CREATE TABLE `vets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vets
-- ----------------------------
INSERT INTO `vets` VALUES ('1', 'James', 'Carter');
INSERT INTO `vets` VALUES ('2', 'Helen', 'Leary');
INSERT INTO `vets` VALUES ('3', 'Linda', 'Douglas');
INSERT INTO `vets` VALUES ('4', 'Rafael', 'Ortega');
INSERT INTO `vets` VALUES ('5', 'Henry', 'Stevens');
INSERT INTO `vets` VALUES ('6', 'Sharon', 'Jenkins');

-- ----------------------------
-- Table structure for vet_specialties
-- ----------------------------
DROP TABLE IF EXISTS `vet_specialties`;
CREATE TABLE `vet_specialties` (
  `vet_id` int unsigned NOT NULL,
  `specialty_id` int unsigned NOT NULL,
  UNIQUE KEY `vet_id` (`vet_id`,`specialty_id`),
  KEY `specialty_id` (`specialty_id`),
  CONSTRAINT `vet_specialties_ibfk_1` FOREIGN KEY (`vet_id`) REFERENCES `vets` (`id`),
  CONSTRAINT `vet_specialties_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of vet_specialties
-- ----------------------------
INSERT INTO `vet_specialties` VALUES ('2', '1');
INSERT INTO `vet_specialties` VALUES ('5', '1');
INSERT INTO `vet_specialties` VALUES ('3', '2');
INSERT INTO `vet_specialties` VALUES ('4', '2');
INSERT INTO `vet_specialties` VALUES ('3', '3');

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pet_id` int unsigned NOT NULL,
  `visit_date` date DEFAULT NULL,
  `description` varchar(8192) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of visits
-- ----------------------------
INSERT INTO `visits` VALUES ('1', '7', '2010-03-04', 'rabies shot');
INSERT INTO `visits` VALUES ('2', '8', '2011-03-04', 'rabies shot');
INSERT INTO `visits` VALUES ('3', '8', '2009-06-04', 'neutered');
INSERT INTO `visits` VALUES ('4', '7', '2008-09-04', 'spayed');
