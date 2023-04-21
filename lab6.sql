SELECT cities.name, regions.name
FROM cities, regions
WHERE cities.region = regions.uuid and population > 350000

SELECT cities.name, regions.name
FROM cities, regions
WHERE cities.region = regions.uuid and regions.name = "Nord"

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` tinyint(255) unsigned NOT NULL AUTO_INCREMENT,
  `st_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` tinyint(255) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `next` tinyint(255) unsigned NOT NULL,
  `prev` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `transition`;
CREATE TABLE `transition` (
  `station_id` tinyint(255) unsigned NOT NULL,
  `transition_to_id` tinyint(255) unsigned NOT NULL,
  KEY `station_id` (`station_id`),
  CONSTRAINT `transition_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;