-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `file_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `files_projects`;
CREATE TABLE `files_projects` (
  `id` tinyint(255) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` tinyint(4) NOT NULL,
  `project_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `files_projects_ibfk_1` FOREIGN KEY (`id`) REFERENCES `branches` (`id`),
  CONSTRAINT `files_projects_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `files_projects_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `task_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` tinyint(3) unsigned NOT NULL,
  `author_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tasks_files`;
CREATE TABLE `tasks_files` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `task_id` tinyint(3) unsigned NOT NULL,
  `file_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `tasks_files_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `tasks_files_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users_project`;
CREATE TABLE `users_project` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(3) unsigned NOT NULL,
  `project_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `users_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users_tasks`;
CREATE TABLE `users_tasks` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(3) unsigned NOT NULL,
  `task_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `users_tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2023-05-19 06:43:04