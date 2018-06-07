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

-- 导出  表 mydb.department 结构
CREATE TABLE IF NOT EXISTS `department` (
  `DEPT_ID` int(11) NOT NULL,
  `DEPT_NAME` varchar(255) NOT NULL,
  `DEPT_NO` varchar(20) NOT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`),
  UNIQUE KEY `DEPT_NO` (`DEPT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.department 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`DEPT_ID`, `DEPT_NAME`, `DEPT_NO`, `LOCATION`) VALUES
	(10, 'ACCOUNTING', 'D10', 'NEW YORK'),
	(20, 'RESEARCH', 'D20', 'DALLAS'),
	(30, 'SALES', 'D30', 'CHICAGO'),
	(40, 'OPERATIONS', 'D40', 'BOSTON');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- 导出  表 mydb.employee 结构
CREATE TABLE IF NOT EXISTS `employee` (
  `EMP_ID` bigint(20) NOT NULL,
  `EMP_NAME` varchar(50) NOT NULL,
  `EMP_NO` varchar(20) NOT NULL,
  `HIRE_DATE` date NOT NULL,
  `IMAGE` longblob,
  `JOB` varchar(30) NOT NULL,
  `SALARY` float NOT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `MNG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`),
  UNIQUE KEY `EMP_NO` (`EMP_NO`),
  KEY `FK75C8D6AE269A3C9` (`DEPT_ID`),
  KEY `FK75C8D6AE6106A42` (`EMP_ID`),
  KEY `FK75C8D6AE13C12F64` (`MNG_ID`),
  CONSTRAINT `FK75C8D6AE13C12F64` FOREIGN KEY (`MNG_ID`) REFERENCES `employee` (`EMP_ID`),
  CONSTRAINT `FK75C8D6AE269A3C9` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`DEPT_ID`),
  CONSTRAINT `FK75C8D6AE6106A42` FOREIGN KEY (`EMP_ID`) REFERENCES `employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.employee 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`EMP_ID`, `EMP_NAME`, `EMP_NO`, `HIRE_DATE`, `IMAGE`, `JOB`, `SALARY`, `DEPT_ID`, `MNG_ID`) VALUES
	(7369, 'SMITH', 'E7369', '1980-12-17', NULL, 'CLERK', 800, 20, 7902),
	(7499, 'ALLEN', 'E7499', '1981-02-20', NULL, 'SALESMAN', 1600, 30, 7698),
	(7521, 'WARD', 'E7521', '1981-02-22', NULL, 'SALESMAN', 1250, 30, 7698),
	(7566, 'JONES', 'E7566', '1981-04-02', NULL, 'MANAGER', 2975, 20, 7839),
	(7654, 'MARTIN', 'E7654', '1981-09-28', NULL, 'SALESMAN', 1250, 30, 7698),
	(7698, 'BLAKE', 'E7698', '1981-05-01', NULL, 'MANAGER', 2850, 30, 7839),
	(7782, 'CLARK', 'E7782', '1981-06-09', NULL, 'MANAGER', 2450, 30, 7839),
	(7788, 'SCOTT', 'E7788', '1987-04-19', NULL, 'ANALYST', 3000, 20, 7566),
	(7839, 'KING', 'E7839', '1981-11-17', NULL, 'PRESIDENT', 5000, 10, NULL),
	(7844, 'TURNER', 'E7844', '1981-09-08', NULL, 'SALESMAN', 1500, 30, 7698),
	(7876, 'ADAMS', 'E7876', '1987-05-23', NULL, 'CLERK', 1100, 20, 7698),
	(7900, 'ADAMS', 'E7900', '1981-12-03', NULL, 'CLERK', 950, 30, 7698),
	(7902, 'FORD', 'E7902', '1981-12-03', NULL, 'ANALYST', 3000, 20, 7566),
	(7934, 'MILLER', 'E7934', '1982-01-23', NULL, 'CLERK', 1300, 10, 7698);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- 导出  表 mydb.idcard 结构
CREATE TABLE IF NOT EXISTS `idcard` (
  `id` varchar(255) NOT NULL,
  `cardNum` varchar(333) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.idcard 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `idcard` DISABLE KEYS */;
INSERT INTO `idcard` (`id`, `cardNum`) VALUES
	('4028b88163d9a97f0163d9a983280000', '111111111');
/*!40000 ALTER TABLE `idcard` ENABLE KEYS */;

-- 导出  表 mydb.person 结构
CREATE TABLE IF NOT EXISTS `person` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK9w0sw9mmegr3k2fq8xg0q0t1q` FOREIGN KEY (`id`) REFERENCES `idcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.person 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `name`) VALUES
	('4028b88163d9a97f0163d9a983280000', '张三');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- 导出  表 mydb.salary_grade 结构
CREATE TABLE IF NOT EXISTS `salary_grade` (
  `GRADE` int(11) NOT NULL,
  `HIGH_SALARY` float NOT NULL,
  `LOW_SALARY` float NOT NULL,
  PRIMARY KEY (`GRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.salary_grade 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `salary_grade` DISABLE KEYS */;
INSERT INTO `salary_grade` (`GRADE`, `HIGH_SALARY`, `LOW_SALARY`) VALUES
	(1, 9999, 3001);
/*!40000 ALTER TABLE `salary_grade` ENABLE KEYS */;

-- 导出  表 mydb.timekeeper 结构
CREATE TABLE IF NOT EXISTS `timekeeper` (
  `Timekeeper_Id` varchar(36) NOT NULL,
  `Date_Time` datetime NOT NULL,
  `In_Out` char(1) NOT NULL,
  `EMP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Timekeeper_Id`),
  KEY `FK744D9BFF6106A42` (`EMP_ID`),
  CONSTRAINT `FK744D9BFF6106A42` FOREIGN KEY (`EMP_ID`) REFERENCES `employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.timekeeper 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `timekeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `timekeeper` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
