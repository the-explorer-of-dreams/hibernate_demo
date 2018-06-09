-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.32-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 mydb 的数据库结构
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;

-- 导出  表 mydb.address_2110 结构
CREATE TABLE IF NOT EXISTS `address_2110` (
  `addressId` int(11) NOT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.address_2110 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `address_2110` DISABLE KEYS */;
INSERT INTO `address_2110` (`addressId`, `addressLine1`, `city`, `state`, `country`) VALUES
	(1, '1688, RenMin Road', 'Haikou', 'Hainan', 'China');
/*!40000 ALTER TABLE `address_2110` ENABLE KEYS */;

-- 导出  表 mydb.ans100 结构
CREATE TABLE IF NOT EXISTS `ans100` (
  `qid` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  KEY `FKe91okfiu2ylscbr4irv60aq62` (`qid`),
  CONSTRAINT `FKe91okfiu2ylscbr4irv60aq62` FOREIGN KEY (`qid`) REFERENCES `q100` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.ans100 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `ans100` DISABLE KEYS */;
INSERT INTO `ans100` (`qid`, `answer`) VALUES
	(1, 'java is a programming language'),
	(1, 'java is a platform'),
	(1, 'java is a JVM.'),
	(2, 'Servlet is an Interface'),
	(2, 'Servlet is an API');
/*!40000 ALTER TABLE `ans100` ENABLE KEYS */;

-- 导出  表 mydb.answer_m2m 结构
CREATE TABLE IF NOT EXISTS `answer_m2m` (
  `questionid` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`questionid`,`answer`),
  KEY `FKkwn39v22curkbevluik274npg` (`userid`),
  CONSTRAINT `FK7cy207rewp4u6fbkjekvuyo5` FOREIGN KEY (`questionid`) REFERENCES `question_m2m` (`id`),
  CONSTRAINT `FKkwn39v22curkbevluik274npg` FOREIGN KEY (`userid`) REFERENCES `user_m2m` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.answer_m2m 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `answer_m2m` DISABLE KEYS */;
INSERT INTO `answer_m2m` (`questionid`, `answer`, `userid`) VALUES
	(1, 'java is a programming language', 1),
	(1, 'java is a platform', 2),
	(2, 'servlet technology is a server side programming', 3),
	(2, 'Servlet is an Interface', 4);
/*!40000 ALTER TABLE `answer_m2m` ENABLE KEYS */;

-- 导出  表 mydb.classes 结构
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.classes 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;

-- 导出  表 mydb.contemp122 结构
CREATE TABLE IF NOT EXISTS `contemp122` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pay_per_hour` float DEFAULT NULL,
  `contract_duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.contemp122 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `contemp122` DISABLE KEYS */;
INSERT INTO `contemp122` (`id`, `name`, `pay_per_hour`, `contract_duration`) VALUES
	(3, 'Hippo su', 1000, '15 hours');
/*!40000 ALTER TABLE `contemp122` ENABLE KEYS */;

-- 导出  表 mydb.contemp123 结构
CREATE TABLE IF NOT EXISTS `contemp123` (
  `contract_id` int(11) NOT NULL,
  `pay_per_hour` float DEFAULT NULL,
  `contract_duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  CONSTRAINT `FK53vmg86dre19ngd11wl8xrbx9` FOREIGN KEY (`contract_id`) REFERENCES `emp123` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.contemp123 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `contemp123` DISABLE KEYS */;
INSERT INTO `contemp123` (`contract_id`, `pay_per_hour`, `contract_duration`) VALUES
	(3, 1000, '15 hours'),
	(6, 1000, '15 hours'),
	(9, 1000, '15 hours');
/*!40000 ALTER TABLE `contemp123` ENABLE KEYS */;

-- 导出  表 mydb.course 结构
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.course 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- 导出  表 mydb.course_student 结构
CREATE TABLE IF NOT EXISTS `course_student` (
  `c_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  KEY `FKfs002jd3jstb4lh420id8nrwv` (`c_id`),
  KEY `FKmuyfjj2rpydkbfeyrp1xcmgbo` (`s_id`),
  CONSTRAINT `FKfs002jd3jstb4lh420id8nrwv` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FKmuyfjj2rpydkbfeyrp1xcmgbo` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.course_student 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;

-- 导出  表 mydb.emp121 结构
CREATE TABLE IF NOT EXISTS `emp121` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `pay_per_hour` float DEFAULT NULL,
  `contract_duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.emp121 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `emp121` DISABLE KEYS */;
INSERT INTO `emp121` (`id`, `type`, `name`, `salary`, `bonus`, `pay_per_hour`, `contract_duration`) VALUES
	(1, 'emp', 'Yiibai', NULL, NULL, NULL, NULL),
	(2, 'reg_emp', 'Max su', 50000, 5, NULL, NULL),
	(3, 'con_emp', 'Hippo su', NULL, NULL, 1000, '15 hours');
/*!40000 ALTER TABLE `emp121` ENABLE KEYS */;

-- 导出  表 mydb.emp122 结构
CREATE TABLE IF NOT EXISTS `emp122` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.emp122 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `emp122` DISABLE KEYS */;
INSERT INTO `emp122` (`id`, `name`) VALUES
	(1, 'Yiibai');
/*!40000 ALTER TABLE `emp122` ENABLE KEYS */;

-- 导出  表 mydb.emp123 结构
CREATE TABLE IF NOT EXISTS `emp123` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.emp123 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `emp123` DISABLE KEYS */;
INSERT INTO `emp123` (`id`, `name`) VALUES
	(1, 'Yiibai'),
	(2, 'Max su'),
	(3, 'Hippo su'),
	(4, 'Yiibai'),
	(5, 'Max su'),
	(6, 'Hippo su'),
	(7, 'Yiibai'),
	(8, 'Max su'),
	(9, 'Hippo su');
/*!40000 ALTER TABLE `emp123` ENABLE KEYS */;

-- 导出  表 mydb.emp_2110 结构
CREATE TABLE IF NOT EXISTS `emp_2110` (
  `employeeId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  PRIMARY KEY (`employeeId`),
  UNIQUE KEY `UK_o59xt2yukiefdxhv7bx8u0o3a` (`address`),
  CONSTRAINT `FKplaygd7gpfedy290hg81wi1ba` FOREIGN KEY (`address`) REFERENCES `address_2110` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.emp_2110 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `emp_2110` DISABLE KEYS */;
INSERT INTO `emp_2110` (`employeeId`, `name`, `email`, `address`) VALUES
	(1, 'Max Su', 'maxsu@gmail.com', 1);
/*!40000 ALTER TABLE `emp_2110` ENABLE KEYS */;

-- 导出  表 mydb.emp_cpmap 结构
CREATE TABLE IF NOT EXISTS `emp_cpmap` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.emp_cpmap 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `emp_cpmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_cpmap` ENABLE KEYS */;

-- 导出  表 mydb.one_to_one_foreign_student 结构
CREATE TABLE IF NOT EXISTS `one_to_one_foreign_student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.one_to_one_foreign_student 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `one_to_one_foreign_student` DISABLE KEYS */;
INSERT INTO `one_to_one_foreign_student` (`id`, `name`, `class_id`) VALUES
	(1, 'william', 1);
/*!40000 ALTER TABLE `one_to_one_foreign_student` ENABLE KEYS */;

-- 导出  表 mydb.one_to_one_foreign_study_code 结构
CREATE TABLE IF NOT EXISTS `one_to_one_foreign_study_code` (
  `id` int(11) NOT NULL,
  `identify_code` varchar(50) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  KEY `FKawh0txugiibwx50boaiouotei` (`student_id`),
  CONSTRAINT `FKawh0txugiibwx50boaiouotei` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.one_to_one_foreign_study_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `one_to_one_foreign_study_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `one_to_one_foreign_study_code` ENABLE KEYS */;

-- 导出  表 mydb.one_to_one_primary_student 结构
CREATE TABLE IF NOT EXISTS `one_to_one_primary_student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.one_to_one_primary_student 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `one_to_one_primary_student` DISABLE KEYS */;
INSERT INTO `one_to_one_primary_student` (`id`, `name`, `class_id`) VALUES
	(1, 'william', 1);
/*!40000 ALTER TABLE `one_to_one_primary_student` ENABLE KEYS */;

-- 导出  表 mydb.one_to_one_primary_study_code 结构
CREATE TABLE IF NOT EXISTS `one_to_one_primary_study_code` (
  `id` int(11) NOT NULL,
  `identify_code` varchar(50) DEFAULT NULL,
  KEY `FKgbnkhyu46gk8erwj8j1sip54c` (`id`),
  CONSTRAINT `FKgbnkhyu46gk8erwj8j1sip54c` FOREIGN KEY (`id`) REFERENCES `one_to_one_primary_student` (`id`),
  CONSTRAINT `FKlu7ydj3xt8muqcg72rogrmpis` FOREIGN KEY (`id`) REFERENCES `one_to_one_primary_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.one_to_one_primary_study_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `one_to_one_primary_study_code` DISABLE KEYS */;
INSERT INTO `one_to_one_primary_study_code` (`id`, `identify_code`) VALUES
	(1, '20180001');
/*!40000 ALTER TABLE `one_to_one_primary_study_code` ENABLE KEYS */;

-- 导出  表 mydb.q100 结构
CREATE TABLE IF NOT EXISTS `q100` (
  `id` int(11) NOT NULL,
  `qname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.q100 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `q100` DISABLE KEYS */;
INSERT INTO `q100` (`id`, `qname`) VALUES
	(1, 'Java 是什么?'),
	(2, 'Hibernate 是什么?');
/*!40000 ALTER TABLE `q100` ENABLE KEYS */;

-- 导出  表 mydb.question_m2m 结构
CREATE TABLE IF NOT EXISTS `question_m2m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.question_m2m 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `question_m2m` DISABLE KEYS */;
INSERT INTO `question_m2m` (`id`, `name`) VALUES
	(1, 'Java是什么?'),
	(2, 'Servlet是什么?');
/*!40000 ALTER TABLE `question_m2m` ENABLE KEYS */;

-- 导出  表 mydb.regemp122 结构
CREATE TABLE IF NOT EXISTS `regemp122` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.regemp122 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `regemp122` DISABLE KEYS */;
INSERT INTO `regemp122` (`id`, `name`, `salary`, `bonus`) VALUES
	(2, 'Max su', 50000, 5);
/*!40000 ALTER TABLE `regemp122` ENABLE KEYS */;

-- 导出  表 mydb.regemp123 结构
CREATE TABLE IF NOT EXISTS `regemp123` (
  `regular_id` int(11) NOT NULL,
  `salary` float DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  PRIMARY KEY (`regular_id`),
  CONSTRAINT `FKn7kwhqm9kv8sfmm08dsxx1v4d` FOREIGN KEY (`regular_id`) REFERENCES `emp123` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.regemp123 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `regemp123` DISABLE KEYS */;
INSERT INTO `regemp123` (`regular_id`, `salary`, `bonus`) VALUES
	(2, 50000, 5),
	(5, 50000, 5),
	(8, 50000, 5);
/*!40000 ALTER TABLE `regemp123` ENABLE KEYS */;

-- 导出  表 mydb.student 结构
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnsl7w2nw6o6eq53hqlxfcijpm` (`class_id`),
  CONSTRAINT `FKnsl7w2nw6o6eq53hqlxfcijpm` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.student 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 导出  表 mydb.user_m2m 结构
CREATE TABLE IF NOT EXISTS `user_m2m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.user_m2m 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `user_m2m` DISABLE KEYS */;
INSERT INTO `user_m2m` (`id`, `username`, `email`, `country`) VALUES
	(1, '张小哥', 'user2@gmail.com', 'usa'),
	(2, '王达叔', 'user1@gmail.com', 'China'),
	(3, 'John Milton', 'john.su@gmail.com', 'usa'),
	(4, 'Ashok Kumar', 'as-top@gmail.com', 'China');
/*!40000 ALTER TABLE `user_m2m` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
