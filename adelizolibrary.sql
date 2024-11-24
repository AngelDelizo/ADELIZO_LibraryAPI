/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - adelizolibrary
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`adelizolibrary` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `adelizolibrary`;

/*Table structure for table `authors` */

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `authorid` int(9) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  PRIMARY KEY (`authorid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `authors` */

insert  into `authors`(`authorid`,`name`) values 
(1, 'Jonaxx'),
(2, 'Maxinejiji'),
(3, 'Queen Elly'),
(4, 'HaveYouSeenThisGirl'),
(5, 'Bianca Bernardino'),
(6, 'Blue Maiden'),
(7, 'Chixnita'),
(8, 'Rhuby2'),
(9, 'VirtualKardz'),
(10, 'YhanaMori'),
(11, 'Majoidang'),
(12, 'AteJemz'),
(13, 'CeCeLib'),
(14, 'iDangs'),
(15, 'SGwanP'),
(16, 'Mimiyuuuhh'),
(17, 'Mitchii'),
(18, 'ColorMySky'),
(19, 'OwwSic'),
(20, 'Aisetsu'),
(21, 'Zyrabell'),
(22, 'Kirahino'),
(23, 'Zylemine'),
(24, 'Xyla_Erza'),
(25, 'AlienOnMars'),
(26, 'Anna Todd'), -- International author (USA), famous for the *After* series
(27, 'Beth Reekles'), -- International author (UK), known for *The Kissing Booth*
(28, 'Tijan'), -- International author (USA), popular for her young adult and new adult novels
(29, 'Jessica Sorensen'), -- International author (USA), writer of *The Secret of Ella and Micha*
(30, 'Cora Carmack'), -- International author (USA), known for *Losing It*
(31, 'Katie McGarry'), -- International author (USA), *Pushing the Limits* series
(32, 'Sophie Jackson'), -- International author (UK), *A Pound of Flesh*
(33, 'Ali Novak'), -- International author (USA), *My Life with the Walter Boys*
(34, 'Estelle Maskame'), -- International author (Scotland), *Did I Mention I Love You?*
(35, 'L.J. Shen'), -- International author (USA), known for romance novels
(36, 'Jillian Dodd'), -- International author (USA), *The Keatyn Chronicles*
(37, 'Nash Summers'), -- International author (USA), writer of LGBTQ+ fiction
(38, 'Abbi Glines'), -- International author (USA), *The Rosemary Beach* series
(39, 'Penelope Douglas'), -- International author (USA), *Bully* and other romance novels
(40, 'E.L. Todd'), -- International author (USA), romance and new adult novels
(41, 'Pepper Winters'), -- International author (New Zealand), dark romance
(42, 'Rebecca Donovan'), -- International author (USA), *The Breathing* series
(43, 'Lauren Palphreyman'), -- International author (UK), *Cupid's Match*
(44, 'Lola St. Vil'), -- International author (USA), *Guardians* series
(45, 'Jordan Lynde'), -- International author (USA), known for young adult romance
(46, 'Jo Watson'), -- International author (South Africa), *Burning Moon*
(47, 'Nicole French'), -- International author (USA), *Legally Yours*
(48, 'Kristen Ashley'), -- International author (USA), *The Rock Chick* series
(49, 'Brittany Cavallaro'), -- International author (USA), *Charlotte Holmes*
(50, 'Lizzy Ford');
/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookid` int(9) NOT NULL AUTO_INCREMENT,
  `title` char(255) NOT NULL,
  `authorid` int(9) NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `authorid` (`authorid`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `authors` (`authorid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `books` */

insert  into `books`(`bookid`,`title`,`authorid`) values 
(1, 'Heartless', 1),
(2, 'He’s Into Her', 2),
(3, 'Ayla: The Fields of Arcellius', 3),
(4, 'She’s Dating the Gangster', 5),
(5, 'Diary ng Panget', 4),
(6, 'My Possessive Billionaire', 7),
(7, 'After', 26),
(8, 'The Kissing Booth', 27),
(9, 'Losing It', 30),
(10, 'Pushing the Limits', 31),
(11, 'A Pound of Flesh', 32),
(12, 'My Life with the Walter Boys', 33),
(13, 'Did I Mention I Love You?', 34),
(14, 'Bully', 39),
(15, 'The Keatyn Chronicles', 36),
(16, 'The Secret of Ella and Micha', 29),
(17, 'The Breathing Series', 42),
(18, 'Cupid’s Match', 43),
(19, 'Guardians', 44),
(20, 'Burning Moon', 46);

/*Table structure for table `book_authors` */

DROP TABLE IF EXISTS `book_authors`;

CREATE TABLE `book_authors` (
  `collectionid` int(9) NOT NULL AUTO_INCREMENT,
  `bookid` int(9) NOT NULL,
  `authorid` int(9) NOT NULL,
  PRIMARY KEY (`collectionid`),
  KEY `authorid` (`authorid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `authors` (`authorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `book_authors` */

insert  into `book_authors`(`collectionid`,`bookid`,`authorid`) values 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 5),
(5, 5, 4),
(6, 6, 7),
(7, 7, 26),
(8, 8, 27),
(9, 9, 30),
(10, 10, 31),
(11, 11, 32),
(12, 12, 33),
(13, 13, 34),
(14, 14, 39),
(15, 15, 36),
(16, 16, 29),
(17, 17, 42),
(18, 18, 43),
(19, 19, 44),
(20, 20, 46);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(9) NOT NULL AUTO_INCREMENT,
  `username` char(255) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
