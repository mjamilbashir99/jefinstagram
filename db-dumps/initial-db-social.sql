/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.31-MariaDB : Database - social
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_index` (`post_id`),
  KEY `comments_user_id_index` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `comments` */

LOCK TABLES `comments` WRITE;

insert  into `comments`(`id`,`post_id`,`user_id`,`comments`,`status`,`created_at`,`updated_at`) values (1,5,14,'Hey? How are you?',1,'2018-06-11 16:10:22','2018-06-11 16:10:22'),(2,6,14,'Nice',1,'2018-06-11 16:38:34','2018-06-11 16:38:34'),(3,7,14,'Hey',1,'2018-06-11 17:11:47','2018-06-11 17:11:47'),(4,6,14,'Nice',1,'2018-06-11 17:41:06','2018-06-11 17:41:06'),(5,6,14,'Hello',1,'2018-06-11 17:41:37','2018-06-11 17:41:37'),(6,5,14,'I am fucking fine',1,'2018-06-11 17:41:48','2018-06-11 17:41:48'),(7,5,14,'sdfsdgif',1,'2018-06-11 17:41:57','2018-06-11 17:41:57'),(8,9,15,'Love you',1,'2018-06-12 15:03:53','2018-06-12 15:03:53'),(9,9,14,'Hello',1,'2018-06-12 15:40:43','2018-06-12 15:40:43'),(10,9,14,'sdfsdfbsd',1,'2018-06-12 16:37:14','2018-06-12 16:37:14'),(11,9,15,'Love you babe',1,'2018-06-12 16:43:00','2018-06-12 16:43:00'),(12,8,14,'Hello',1,'2018-06-12 16:43:24','2018-06-12 16:43:24');

UNLOCK TABLES;

/*Table structure for table `following` */

DROP TABLE IF EXISTS `following`;

CREATE TABLE `following` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `following_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `following_user_id_index` (`user_id`),
  CONSTRAINT `following_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `following` */

LOCK TABLES `following` WRITE;

insert  into `following`(`id`,`user_id`,`following_id`,`status`,`created_at`,`updated_at`) values (1,14,15,1,NULL,NULL),(2,15,14,1,NULL,NULL),(3,16,14,1,NULL,NULL),(4,16,15,1,NULL,NULL),(5,14,16,1,NULL,NULL),(6,15,16,1,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `likes` */

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `liker_id` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `likes` */

LOCK TABLES `likes` WRITE;

insert  into `likes`(`id`,`post_id`,`liker_id`,`flag`,`created_at`,`updated_at`) values (1,6,14,1,'2018-06-11 16:16:19','2018-06-11 16:16:19'),(2,5,14,1,'2018-06-11 16:16:22','2018-06-11 16:16:22'),(3,7,14,1,'2018-06-11 16:36:02','2018-06-11 16:36:02'),(4,7,15,1,'2018-06-11 16:36:15','2018-06-11 16:36:15'),(5,6,15,1,'2018-06-11 16:36:19','2018-06-11 16:36:19'),(6,5,15,1,'2018-06-11 16:36:22','2018-06-11 16:36:22'),(7,9,14,1,'2018-06-12 15:01:52','2018-06-12 16:07:10');

UNLOCK TABLES;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_06_03_025346_create_verify_table',1),(4,'2018_06_04_164248_create_user_profile_picture_table',2),(5,'2018_06_05_145541_create_post_table',3),(6,'2018_06_05_145851_create_post_images_table',3),(7,'2018_06_06_162718_create_following_table',4),(10,'2018_06_07_162015_create_liks_table',5),(11,'2018_06_08_061824_create_comments_table',6);

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

LOCK TABLES `password_resets` WRITE;

UNLOCK TABLES;

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post` */

LOCK TABLES `post` WRITE;

insert  into `post`(`id`,`user_id`,`description`,`images`,`created_at`,`updated_at`) values (5,15,'Hey, How are you all','no image','2018-06-11 16:06:30','2018-06-11 16:06:30'),(6,14,'','Akash5b1e9f37a8277.jpg','2018-06-11 16:11:35','2018-06-11 16:11:35'),(7,14,'','Akash5b1ea4dfd1c67.jpg','2018-06-11 16:35:43','2018-06-11 16:35:43'),(8,15,'','AJ5b1fdf31a7a9f.jpg','2018-06-12 14:56:49','2018-06-12 14:56:49'),(9,16,'','Jol5b1fe00f32fda.jpg','2018-06-12 15:00:31','2018-06-12 15:00:31'),(10,14,'','Akash5b1fe23dd9a08.jpg','2018-06-12 15:09:49','2018-06-12 15:09:49');

UNLOCK TABLES;

/*Table structure for table `user_profile_picture` */

DROP TABLE IF EXISTS `user_profile_picture`;

CREATE TABLE `user_profile_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_profile_picture_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_profile_picture` */

LOCK TABLES `user_profile_picture` WRITE;

insert  into `user_profile_picture`(`id`,`user_id`,`image`,`created_at`,`updated_at`) values (1,14,'people.png','2018-06-11 03:59:11',NULL),(2,15,'people.png','2018-06-11 04:03:08',NULL),(3,14,'Akash5b1e9f37a8277.jpg','2018-06-11 16:11:35','2018-06-11 16:11:35'),(4,14,'Akash5b1ea4dfd1c67.jpg','2018-06-11 16:35:43','2018-06-11 16:35:43'),(5,15,'AJ5b1fdf31a7a9f.jpg','2018-06-12 14:56:49','2018-06-12 14:56:49'),(6,16,'people.png','2018-06-12 02:59:26',NULL),(7,16,'Jol5b1fe00f32fda.jpg','2018-06-12 15:00:31','2018-06-12 15:00:31'),(8,14,'Akash5b1fe23dd9a08.jpg','2018-06-12 15:09:49','2018-06-12 15:09:49');

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`firstname`,`lastname`,`email`,`password`,`flag`,`remember_token`,`created_at`,`updated_at`) values (14,'Akash','Ahammad','akashajaj09@gmail.com','$2y$10$O9LQQBvqFMeKJSdLgL4Sn.ZmaBIcyPol1EVsmsx4AEl8oa.z9UUFS',1,'T0bvRhdy4A2TX2zJYkuFGmNN4Clt6JHosmtbckZlQHfpV6zYenuFDa682jRq','2018-06-11 15:59:06','2018-06-11 15:59:06'),(15,'AJ','Akash','info@sbit.com.bd','$2y$10$MlQxdPXPq/D486tzMXWEv.PUi1nNWKIG0Q8NgZsgXLrvFtt/OXxV.',1,'Q6MFPZofS4YiC8EE2QiNF8aOpnKPODJAKkLq9Tt8SzXVf5lSRtluCFzuci4w','2018-06-11 16:03:04','2018-06-11 16:03:04'),(16,'Jol','Pori','jolpori@gmail.com','$2y$10$3Us.IFwrB9oyd5q8HS7OfO9TJ.vDrarGGy8yzUKCMjZMu81dm2pFa',1,'oclBdpvGaDlXaWwTr7LyUE6Oe8rYMXkieqNNsBIOvBOt3AfJhlQmqpgUelVO','2018-06-12 14:59:21','2018-06-12 14:59:21');

UNLOCK TABLES;

/*Table structure for table `verify` */

DROP TABLE IF EXISTS `verify`;

CREATE TABLE `verify` (
  `user_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `verify_user_id_unique` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `verify` */

LOCK TABLES `verify` WRITE;

insert  into `verify`(`user_id`,`code`,`link`,`created_at`,`updated_at`) values (14,9052,'null',NULL,NULL),(15,9162,'null',NULL,NULL),(16,6173,'null',NULL,NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
