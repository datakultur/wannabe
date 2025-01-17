-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wannabe
-- ------------------------------------------------------
-- Server version	5.1.66-0+squeeze1

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
-- Table structure for table `wb4_accreditation_accesses`
--

DROP TABLE IF EXISTS `wb4_accreditation_accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_accreditation_accesses` (
  `accreditation_id` int(10) NOT NULL,
  `accreditation_group_id` int(10) NOT NULL,
  PRIMARY KEY (`accreditation_id`,`accreditation_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_accreditation_group_members`
--

DROP TABLE IF EXISTS `wb4_accreditation_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_accreditation_group_members` (
  `accreditation_group_id` int(10) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`accreditation_group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_accreditation_groups`
--

DROP TABLE IF EXISTS `wb4_accreditation_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_accreditation_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`event_id`),
  UNIQUE KEY `event_id` (`event_id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_accreditations`
--

DROP TABLE IF EXISTS `wb4_accreditations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_accreditations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `company_name` varchar(128) NOT NULL,
  `realname` varchar(128) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `phonenumber` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `numpersons` tinyint(4) NOT NULL,
  `arrivaldate` date NOT NULL DEFAULT '0000-00-00',
  `departuredate` date NOT NULL DEFAULT '0000-00-00',
  `actual_arrival` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actual_departure` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pictures` tinyint(1) DEFAULT NULL,
  `film` tinyint(1) DEFAULT NULL,
  `tour` tinyint(1) DEFAULT NULL,
  `smsalert` tinyint(1) DEFAULT NULL,
  `extended_info` text,
  `internal_comment` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `badge_id` int(11) DEFAULT NULL,
  `accepted` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_aclobjects`
--

DROP TABLE IF EXISTS `wb4_aclobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_aclobjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for aclobjects

INSERT INTO `wb4_aclobjects` (`id`, `path`) VALUES
(340, '/dev/*');

--
-- Table structure for table `wb4_aclobjects_crews`
--

DROP TABLE IF EXISTS `wb4_aclobjects_crews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_aclobjects_crews` (
  `crew_id` int(10) unsigned NOT NULL,
  `aclobject_id` int(10) unsigned NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `write` tinyint(1) DEFAULT '0',
  `manage` tinyint(1) DEFAULT '0',
  `superuser` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_aclobjects_roles`
--

DROP TABLE IF EXISTS `wb4_aclobjects_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_aclobjects_roles` (
  `role` int(10) NOT NULL,
  `aclobject_id` int(10) unsigned NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `write` tinyint(1) DEFAULT '0',
  `manage` tinyint(1) DEFAULT '0',
  `superuser` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for aclobjects_roles

INSERT INTO `wb4_aclobjects_roles` (`role`, `aclobject_id`, `read`, `write`, `manage`, `superuser`) VALUES
(-1, 340, 1, 1, 0, 0);

--
-- Table structure for table `wb4_aclobjects_users`
--

DROP TABLE IF EXISTS `wb4_aclobjects_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_aclobjects_users` (
  `user_id` int(10) unsigned NOT NULL,
  `aclobject_id` int(10) unsigned NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `write` tinyint(1) DEFAULT '0',
  `manage` tinyint(1) DEFAULT '0',
  `superuser` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for aclobjects_users

INSERT INTO `wb4_aclobjects_users` (`user_id`, `aclobject_id`, `read`, `write`, `manage`, `superuser`) VALUES
(1, 340, 1, 1, 1, 1);

--
-- Table structure for table `wb4_api_applications`
--

DROP TABLE IF EXISTS `wb4_api_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_api_applications` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `creator_id` int(11) unsigned NOT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_api_keys`
--

DROP TABLE IF EXISTS `wb4_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_api_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apikey` varchar(32) DEFAULT NULL,
  `revoked` tinyint(1) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_application_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_api_sessions`
--

DROP TABLE IF EXISTS `wb4_api_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_api_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionkey` varchar(32) NOT NULL,
  `infinite` tinyint(1) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_available_fields`
--

DROP TABLE IF EXISTS `wb4_application_available_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_available_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `application_fieldtype_id` int(11) DEFAULT NULL,
  `application_page_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `crew_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crewapplication_fieldtype_id` (`application_fieldtype_id`),
  KEY `crewapplication_page_id` (`application_page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_choices`
--

DROP TABLE IF EXISTS `wb4_application_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_choices` (
  `application_document_id` int(11) DEFAULT NULL,
  `crew_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `revision` int(11) DEFAULT '0',
  `draft` tinyint(4) DEFAULT '1',
  `handled` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accepted` tinyint(4) DEFAULT '0' COMMENT 'Contains 1 if the choice is accepted',
  `denied` tinyint(4) DEFAULT '0' COMMENT 'Contains 1 if the choice is denied.',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `waiting` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `crewapplication_document_id` (`application_document_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10986 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_documents`
--

DROP TABLE IF EXISTS `wb4_application_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `orderedchoices` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `draft` tinyint(4) DEFAULT '1',
  `handled` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enableprivacy` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4687 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_field_types`
--

DROP TABLE IF EXISTS `wb4_application_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_field_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_fields`
--

DROP TABLE IF EXISTS `wb4_application_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_document_id` int(11) DEFAULT NULL,
  `application_availablefield_id` int(11) DEFAULT NULL,
  `value` blob,
  `revision` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `draft` tinyint(4) DEFAULT '1',
  `crew_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `crewapplication_availablefield_id` (`application_availablefield_id`),
  KEY `crewapplication_document_id` (`application_document_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_pages`
--

DROP TABLE IF EXISTS `wb4_application_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `position` int(11) DEFAULT '0',
  `type` enum('custom','crewchoice','crewwhy','crewfield','crewquestion') DEFAULT NULL,
  `crew_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_settings`
--

DROP TABLE IF EXISTS `wb4_application_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choices` int(11) unsigned DEFAULT '3',
  `privacy` int(11) unsigned DEFAULT '0',
  `priority` int(11) unsigned DEFAULT '0',
  `crewquestion` int(11) unsigned DEFAULT '0',
  `event_id` int(10) unsigned NOT NULL,
  `deniedtext` text,
  `donestring` text,
  `mailsubject` text,
  `mailstring` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_application_tags`
--

DROP TABLE IF EXISTS `wb4_application_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_application_tags` (
  `application_document_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `tag` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_document_id`,`user_id`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_carplates`
--

DROP TABLE IF EXISTS `wb4_carplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_carplates` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `carplate` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_cleanup_dates`
--

DROP TABLE IF EXISTS `wb4_cleanup_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_cleanup_dates` (
  `cid` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `event` mediumint(5) unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `event` (`event`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_cleanup_positions`
--

DROP TABLE IF EXISTS `wb4_cleanup_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_cleanup_positions` (
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL,
  `user` int(11) unsigned NOT NULL,
  `ok` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`,`user`)
) ENGINE=MyISAM AUTO_INCREMENT=1128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_countries`
--

DROP TABLE IF EXISTS `wb4_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_countries` (
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(60) DEFAULT NULL,
  `priority` smallint(6) DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for countries 

INSERT INTO `wb4_countries` (`code`, `name`, `priority`) VALUES
('AF', 'Afghanistan', 0),
('AL', 'Albania', 0),
('DZ', 'Algeria', 0),
('AS', 'American Samoa', 0),
('AD', 'Andorra', 0),
('AO', 'Angola', 0),
('AI', 'Anguilla', 0),
('AG', 'Antigua and Barbuda', 0),
('AR', 'Argentina', 0),
('AM', 'Armenia', 0),
('AW', 'Aruba', 0),
('AU', 'Australia', 0),
('AT', 'Austria', 0),
('AZ', 'Azerbaijan', 0),
('BS', 'Bahamas', 0),
('BH', 'Bahrain', 0),
('BD', 'Bangladesh', 0),
('BB', 'Barbados', 0),
('BY', 'Belarus', 0),
('BE', 'Belgium', 0),
('BZ', 'Belize', 0),
('BJ', 'Benin', 0),
('BM', 'Bermuda', 0),
('BT', 'Bhutan', 0),
('BO', 'Bolivia', 0),
('BA', 'Bosnia and Herzegovina', 0),
('BW', 'Botswana', 0),
('BR', 'Brazil', 0),
('VG', 'British Virgin Islands', 0),
('BN', 'Brunei Darussalam', 0),
('BG', 'Bulgaria', 0),
('BF', 'Burkina Faso', 0),
('BI', 'Burundi', 0),
('KH', 'Cambodia', 0),
('CM', 'Cameroon', 0),
('CA', 'Canada', 0),
('CV', 'Cape Verde', 0),
('KY', 'Cayman Islands', 0),
('CF', 'Central African Republic', 0),
('TD', 'Chad', 0),
('CL', 'Chile', 0),
('CN', 'China', 0),
('CO', 'Colombia', 0),
('KM', 'Comoros', 0),
('CK', 'Cook Islands', 0),
('CR', 'Costa Rica', 0),
('CI', 'Cote d''Ivoire', 0),
('HR', 'Croatia', 0),
('CU', 'Cuba', 0),
('CY', 'Cyprus', 0),
('CZ', 'Czech Republic', 0),
('CG', 'Democratic Republic of the Congo', 0),
('DK', 'Denmark', 1),
('DJ', 'Djibouti', 0),
('DM', 'Dominica', 0),
('DO', 'Dominican Republic', 0),
('TP', 'East Timor', 0),
('EC', 'Ecuador', 0),
('EG', 'Egypt', 0),
('SV', 'El Salvador', 0),
('GQ', 'Equatorial Guinea', 0),
('ER', 'Eritrea', 0),
('EE', 'Estonia', 0),
('ET', 'Ethiopia', 0),
('EU', 'Europe', 0),
('FO', 'Faeroe Islands', 0),
('FK', 'Falkland Islands (Malvinas)', 0),
('FJ', 'Fiji', 0),
('FI', 'Finland', 1),
('FR', 'France', 0),
('GF', 'French Guiana', 0),
('PF', 'French Polynesia', 0),
('GA', 'Gabon', 0),
('GM', 'Gambia', 0),
('GE', 'Georgia', 0),
('DE', 'Germany', 1),
('GH', 'Ghana', 0),
('GI', 'Gibraltar', 0),
('GR', 'Greece', 0),
('GL', 'Greenland', 0),
('GD', 'Grenada', 0),
('GP', 'Guadeloupe', 0),
('GU', 'Guam', 0),
('GT', 'Guatemala', 0),
('GN', 'Guinea', 0),
('GW', 'Guinea-Bissau', 0),
('GY', 'Guyana', 0),
('HT', 'Haiti', 0),
('VA', 'Holy See', 0),
('HN', 'Honduras', 0),
('HK', 'Hong Kong', 0),
('HU', 'Hungary', 0),
('IS', 'Iceland', 0),
('IN', 'India', 0),
('ID', 'Indonesia', 0),
('IR', 'Iran', 0),
('IQ', 'Iraq', 0),
('IE', 'Ireland', 0),
('IL', 'Israel', 0),
('IT', 'Italy', 0),
('JM', 'Jamaica', 0),
('JP', 'Japan', 0),
('JO', 'Jordan', 0),
('KZ', 'Kazakhstan', 0),
('KE', 'Kenya', 0),
('KI', 'Kiribati', 0),
('KW', 'Kuwait', 0),
('KG', 'Kyrgyzstan', 0),
('LA', 'Lao People''s Democratic Republic', 0),
('LV', 'Latvia', 0),
('LB', 'Lebanon', 0),
('LS', 'Lesotho', 0),
('LR', 'Liberia', 0),
('LY', 'Libyan Arab Jamahiriya', 0),
('LI', 'Liechtenstein', 0),
('LT', 'Lithuania', 0),
('LU', 'Luxembourg', 0),
('MO', 'Macao Special Administrative Region of China', 0),
('MG', 'Madagascar', 0),
('MW', 'Malawi', 0),
('MY', 'Malaysia', 0),
('MV', 'Maldives', 0),
('ML', 'Mali', 0),
('MT', 'Malta', 0),
('MH', 'Marshall Islands', 0),
('MQ', 'Martinique', 0),
('MR', 'Mauritania', 0),
('MU', 'Mauritius', 0),
('MX', 'Mexico', 0),
('FM', 'Micronesia Federated States of,', 0),
('MC', 'Monaco', 0),
('MN', 'Mongolia', 0),
('MS', 'Montserrat', 0),
('MA', 'Morocco', 0),
('MZ', 'Mozambique', 0),
('MM', 'Myanmar', 0),
('NA', 'Namibia', 0),
('NR', 'Nauru', 0),
('NP', 'Nepal', 0),
('NL', 'Netherlands', 0),
('AN', 'Netherlands Antilles', 0),
('NC', 'New Caledonia', 0),
('NZ', 'New Zealand', 0),
('NI', 'Nicaragua', 0),
('NE', 'Niger', 0),
('NG', 'Nigeria', 0),
('NU', 'Niue', 0),
('NF', 'Norfolk Island', 0),
('KP', 'North Korea', 0),
('MP', 'Northern Mariana Islands', 0),
('NO', 'Norway', 2),
('OM', 'Oman', 0),
('PK', 'Pakistan', 0),
('PW', 'Palau', 0),
('PS', 'Palestinian Territory, Occupied', 0),
('PA', 'Panama', 0),
('PG', 'Papua New Guinea', 0),
('PY', 'Paraguay', 0),
('PE', 'Peru', 0),
('PH', 'Philippines', 0),
('PN', 'Pitcairn', 0),
('PL', 'Poland', 0),
('PT', 'Portugal', 0),
('PR', 'Puerto Rico', 0),
('QA', 'Qatar', 0),
('RE', 'Réunion', 0),
('MD', 'Republic of Moldova', 0),
('RO', 'Romania', 0),
('RU', 'Russia', 0),
('RW', 'Rwanda', 0),
('SH', 'Saint Helena', 0),
('KN', 'Saint Kitts and Nevis', 0),
('LC', 'Saint Lucia', 0),
('PM', 'Saint Pierre and Miquelon', 0),
('VC', 'Saint Vincent and the Grenadines', 0),
('WS', 'Samoa', 0),
('SM', 'San Marino', 0),
('ST', 'Sao Tome and Principe', 0),
('SA', 'Saudi Arabia', 0),
('SN', 'Senegal', 0),
('CS', 'Serbia and Montenegro', 0),
('SC', 'Seychelles', 0),
('SL', 'Sierra Leone', 0),
('SG', 'Singapore', 0),
('SK', 'Slovakia', 0),
('SI', 'Slovenia', 0),
('SB', 'Solomon Islands', 0),
('SO', 'Somalia', 0),
('ZA', 'South Africa', 0),
('KR', 'South Korea', 0),
('ES', 'Spain', 0),
('LK', 'Sri Lanka', 0),
('SD', 'Sudan', 0),
('SR', 'Suriname', 0),
('SJ', 'Svalbard and Jan Mayen Islands', 0),
('SZ', 'Swaziland', 0),
('SE', 'Sweden', 1),
('CH', 'Switzerland', 0),
('SY', 'Syrian Arab Republic', 0),
('TW', 'Taiwan', 0),
('TJ', 'Tajikistan', 0),
('TH', 'Thailand', 0),
('MK', 'The former Yugoslav Republic of Macedonia', 0),
('TG', 'Togo', 0),
('TK', 'Tokelau', 0),
('TO', 'Tonga', 0),
('TT', 'Trinidad and Tobago', 0),
('TN', 'Tunisia', 0),
('TR', 'Turkey', 0),
('TM', 'Turkmenistan', 0),
('TC', 'Turks and Caicos Islands', 0),
('TV', 'Tuvalu', 0),
('UG', 'Uganda', 0),
('UA', 'Ukraine', 0),
('AE', 'United Arab Emirates', 0),
('GB', 'United Kingdom', 0),
('TZ', 'United Republic of Tanzania', 0),
('US', 'United States', 0),
('VI', 'United States Virgin Islands', 0),
('UY', 'Uruguay', 0),
('UZ', 'Uzbekistan', 0),
('VU', 'Vanuatu', 0),
('VE', 'Venezuela', 0),
('VN', 'Viet Nam', 0),
('WF', 'Wallis and Futuna Islands', 0),
('EH', 'Western Sahara', 0),
('YE', 'Yemen', 0),
('YU', 'Yugoslavia', 0),
('ZM', 'Zambia', 0),
('ZW', 'Zimbabwe', 0);

--
-- Table structure for table `wb4_crew_effects_items`
--

DROP TABLE IF EXISTS `wb4_crew_effects_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_crew_effects_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `sizes` varchar(128) NOT NULL,
  `price` int(10) NOT NULL,
  `amount_free` int(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `allow_change` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_crew_effects_orders`
--

DROP TABLE IF EXISTS `wb4_crew_effects_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_crew_effects_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `item_size` varchar(50) NOT NULL,
  `item_amount` int(10) unsigned NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `givenextra` tinyint(1) NOT NULL,
  `givenfree` tinyint(1) NOT NULL,
  `paid_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1466 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_crews`
--

DROP TABLE IF EXISTS `wb4_crews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_crews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crew_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `canapply` tinyint(1) DEFAULT '0',
  `event_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text,
  PRIMARY KEY (`id`),
  KEY `crew_id` (`crew_id`)
) ENGINE=MyISAM AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for crews

INSERT INTO `wb4_crews` (`id`, `crew_id`, `name`, `hidden`, `canapply`, `event_id`, `created`, `updated`, `deleted`, `content`) VALUES
(261, 0, 'Dev', 0, 0, 18, '2013-01-29 01:18:27', '2013-01-29 12:58:52', '0000-00-00 00:00:00', ''),
(262, 0, 'A', 0, 0, 18, '2013-02-12 13:28:26', '2013-02-12 13:28:26', '0000-00-00 00:00:00', ''),
(263, 0, 'B', 0, 0, 18, '2013-02-12 13:28:30', '2013-02-12 13:28:30', '0000-00-00 00:00:00', ''),
(264, 0, 'C', 0, 0, 18, '2013-02-12 13:28:34', '2013-02-12 13:28:34', '0000-00-00 00:00:00', ''),
(265, 0, 'D', 0, 0, 18, '2013-02-12 13:28:37', '2013-02-12 13:28:37', '0000-00-00 00:00:00', ''),
(266, 0, 'E', 0, 0, 18, '2013-02-12 13:28:41', '2013-02-12 13:28:41', '0000-00-00 00:00:00', ''),
(267, 0, 'F', 0, 0, 18, '2013-02-12 13:28:44', '2013-02-12 13:28:44', '0000-00-00 00:00:00', ''),
(268, 0, 'G', 0, 0, 18, '2013-02-12 13:28:47', '2013-02-12 13:28:47', '0000-00-00 00:00:00', ''),
(269, 0, 'H', 0, 0, 18, '2013-02-12 13:28:51', '2013-02-12 13:28:51', '0000-00-00 00:00:00', ''),
(270, 0, 'I', 0, 0, 18, '2013-02-12 13:28:55', '2013-02-12 13:28:55', '0000-00-00 00:00:00', ''),
(271, 0, 'J', 0, 0, 18, '2013-02-12 13:53:06', '2013-02-12 13:53:06', '0000-00-00 00:00:00', ''),
(272, 0, 'K', 0, 0, 18, '2013-02-12 13:53:10', '2013-02-12 13:53:10', '0000-00-00 00:00:00', ''),
(273, 0, 'L', 0, 0, 18, '2013-02-12 13:53:13', '2013-02-12 13:53:13', '0000-00-00 00:00:00', ''),
(274, 0, 'M', 0, 0, 18, '2013-02-12 13:53:16', '2013-02-12 13:53:16', '0000-00-00 00:00:00', ''),
(275, 0, 'N', 0, 0, 18, '2013-02-12 13:53:20', '2013-02-12 13:53:20', '0000-00-00 00:00:00', ''),
(276, 0, 'O', 0, 0, 18, '2013-02-12 13:53:24', '2013-02-12 13:53:24', '0000-00-00 00:00:00', ''),
(277, 0, 'P', 0, 0, 18, '2013-02-12 13:53:27', '2013-02-12 13:53:27', '0000-00-00 00:00:00', ''),
(278, 0, 'Q', 0, 0, 18, '2013-02-12 13:53:30', '2013-02-12 13:53:30', '0000-00-00 00:00:00', ''),
(279, 0, 'R', 0, 0, 18, '2013-02-12 13:53:34', '2013-02-12 13:53:34', '0000-00-00 00:00:00', ''),
(280, 0, 'S', 0, 0, 18, '2013-02-12 13:53:37', '2013-02-12 13:53:37', '0000-00-00 00:00:00', ''),
(281, 0, 'T', 0, 0, 18, '2013-02-12 13:53:40', '2013-02-12 13:53:40', '0000-00-00 00:00:00', ''),
(282, 0, 'U', 0, 0, 18, '2013-02-12 13:53:43', '2013-02-12 13:53:43', '0000-00-00 00:00:00', ''),
(283, 0, 'V', 0, 0, 18, '2013-02-12 13:54:00', '2013-02-12 13:54:00', '0000-00-00 00:00:00', ''),
(284, 0, 'W', 0, 0, 18, '2013-02-12 13:54:04', '2013-02-12 13:54:04', '0000-00-00 00:00:00', ''),
(285, 0, 'X', 0, 0, 18, '2013-02-12 13:54:07', '2013-02-12 13:54:07', '0000-00-00 00:00:00', ''),
(286, 0, 'Y', 0, 0, 18, '2013-02-12 13:54:10', '2013-02-12 13:54:10', '0000-00-00 00:00:00', ''),
(287, 0, 'Z', 0, 0, 18, '2013-02-12 13:54:14', '2013-02-12 13:54:14', '0000-00-00 00:00:00', '');

--
-- Table structure for table `wb4_crews_users`
--

DROP TABLE IF EXISTS `wb4_crews_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_crews_users` (
  `user_id` int(10) unsigned NOT NULL,
  `crew_id` int(10) unsigned NOT NULL,
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `leader` tinyint(2) DEFAULT '0',
  `title` varchar(32) DEFAULT NULL,
  `assigned` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`crew_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_daypass`
--

DROP TABLE IF EXISTS `wb4_daypass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_daypass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_dispatch_cases`
--

DROP TABLE IF EXISTS `wb4_dispatch_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_dispatch_cases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(10) unsigned NOT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `seat` varchar(32) DEFAULT NULL,
  `row` varchar(32) NOT NULL,
  `switch` varchar(32) NOT NULL,
  `priority` int(10) unsigned DEFAULT '3',
  `delegated_user_id` int(10) unsigned DEFAULT NULL,
  `delegatedtime` datetime DEFAULT NULL,
  `isresolved` tinyint(1) DEFAULT '0',
  `resolved_user_id` int(10) unsigned DEFAULT NULL,
  `resolvedtime` datetime DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_dispatch_problems`
--

DROP TABLE IF EXISTS `wb4_dispatch_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_dispatch_problems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_enroll_greetings`
--

DROP TABLE IF EXISTS `wb4_enroll_greetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_enroll_greetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crew_id` int(10) unsigned NOT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_enroll_mailfields`
--

DROP TABLE IF EXISTS `wb4_enroll_mailfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_enroll_mailfields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enroll_mail_id` int(11) unsigned NOT NULL,
  `name` varchar(10000) NOT NULL,
  `name_as_header` int(11) unsigned NOT NULL DEFAULT '1',
  `content` varchar(10000) DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_enroll_mails`
--

DROP TABLE IF EXISTS `wb4_enroll_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_enroll_mails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enroll_setting_id` int(11) unsigned NOT NULL,
  `subject` varchar(10000) NOT NULL,
  `type` enum('accepted','denied','pending','waiting') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_enroll_settings`
--

DROP TABLE IF EXISTS `wb4_enroll_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_enroll_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `enrollactive` int(11) unsigned NOT NULL DEFAULT '0',
  `greetingactive` int(11) unsigned NOT NULL DEFAULT '0',
  `enrollaccept` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_events`
--

DROP TABLE IF EXISTS `wb4_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locationname` varchar(128) NOT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `urlmode` enum('path','domain') DEFAULT 'path',
  `email` varchar(32) NOT NULL DEFAULT 'wannabe@gathering.org',
  `hide` tinyint(1) DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0',
  `can_apply_for_crew` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for events

INSERT INTO `wb4_events` (`id`, `name`, `reference`, `created`, `modified`, `deleted`, `locationname`, `latitude`, `longitude`, `start`, `end`, `urlmode`, `email`, `hide`, `disable`, `can_apply_for_crew`) VALUES
(18, 'Development', 'dev', '2013-01-28 00:00:00', '2013-01-28 00:00:00', '0000-00-00 00:00:00', 'Roy', '23.3', '45.45', '2013-08-13 00:00:00', '2013-08-15 00:00:00', 'path', 'wannabe@gathering.org', 0, 0, 0);

--
-- Table structure for table `wb4_events_menuitems`
--

DROP TABLE IF EXISTS `wb4_events_menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_events_menuitems` (
  `menuitem_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`menuitem_id`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_front_news`
--

DROP TABLE IF EXISTS `wb4_front_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_front_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT 'News',
  `title` varchar(100) DEFAULT 'Wannabe',
  `content` mediumtext,
  `active` tinyint(1) DEFAULT '1',
  `left_box` tinyint(1) DEFAULT '0',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for front_news

INSERT INTO `wb4_front_news` (`id`, `name`, `title`, `content`, `active`, `left_box`, `updated`, `created`, `deleted`) VALUES
(1, 'Hva er wannabe', '¿Hvø ær Wünnåbø?', 'Wannabe er en arrangementsdatabase bereget for frivillige arrangementer.<br /> Vil du bruke wannabe til ditt arrangement? Send inn en <a href="mailto:wannabe@gathering.org">forespørsel</a>.', 1, 1, '2011-10-01 22:07:09', '2011-09-22 01:03:17', '0000-00-00 00:00:00'),
(2, 'Wannabe til iOS', 'Wannabe til iOS', 'Last news wannabe-applikasjonen fra iTunes. <a href="http://www.existemi.no/">Finn ut mer</a>.', 1, 0, '2011-09-21 23:05:02', '2011-09-22 01:05:02', '0000-00-00 00:00:00'),
(3, 'Which', 'Which crew?', 'Read through the <a href="/tg13/Crew/Description">descriptions</a> to see which crew will fit you best!', 1, 0, '2012-10-28 16:14:11', '2011-10-07 10:56:03', '0000-00-00 00:00:00'),
(4, 'Apply', 'Apply for crew!', 'As <a href="http://www.gathering.org/">TG13</a> draws nearer we are yet again in need of <em>you</em> to apply now so that, together, we can make this years event the best one ever!', 1, 1, '2012-10-28 16:13:42', '2011-10-07 20:48:38', '0000-00-00 00:00:00'),
(5, 'Hvilket crew?', 'Hvilket crew?', 'Se gjennom <a href="/tg13/Crew/Description">beskrivelsene</a> for å finne ut hvilket crew du ønsker å bidra i.', 1, 0, '2012-10-28 16:13:08', '2011-10-07 21:57:00', '0000-00-00 00:00:00'),
(6, 'Søk crew!', 'Søk crew!', '<a href="http://www.gathering.org">TG13</a> nærmer seg med stormskritt, og vi trenger at nettopp du legger inn din søknad, slik at du kan gjøre årets arrangement til det største noen sinne!', 1, 1, '2012-10-28 16:12:14', '2011-10-07 22:00:06', '0000-00-00 00:00:00'),
(7, 'Test', 'Test', 'Tester vi ser du', 0, 0, '2012-03-14 21:09:18', '2011-11-27 05:15:15', '0000-00-00 00:00:00'),
(8, 'ijajeogij', 'aoijeoigj', 'Norsk', 0, 0, '2012-03-14 21:16:25', '2012-03-14 22:16:25', '0000-00-00 00:00:00');

--
-- Table structure for table `wb4_geocodes`
--

DROP TABLE IF EXISTS `wb4_geocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_geocodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(128) DEFAULT '',
  `longitude` varchar(128) DEFAULT '0',
  `latitude` varchar(128) DEFAULT '0',
  `cached` datetime DEFAULT '0000-00-00 00:00:00',
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=385 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for geocodes

INSERT INTO `wb4_geocodes` (`id`, `address`, `longitude`, `latitude`, `cached`, `invalid`) VALUES
(320, 'Bedringens vei 1 1920 SØRUMSAND', '11.239805899999965', '59.9850923', '2013-02-22 10:34:18', 0);

--
-- Table structure for table `wb4_i18n`
--

DROP TABLE IF EXISTS `wb4_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_i18n` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `locale` varchar(6) NOT NULL,
  `model` varchar(255) NOT NULL,
  `foreign_key` int(10) NOT NULL,
  `field` varchar(255) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `locale` (`locale`),
  KEY `model` (`model`),
  KEY `row_id` (`foreign_key`),
  KEY `field` (`field`)
) ENGINE=MyISAM AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for i18n

INSERT INTO `wb4_i18n` (`id`, `locale`, `model`, `foreign_key`, `field`, `content`) VALUES
(2, 'eng', 'FrontNews', 3, 'content', 'Read through the <a href="/tg13/Crew/Description">descriptions</a> to see which crew will fit you best!'),
(1, 'eng', 'FrontNews', 3, 'title', 'Which crew?'),
(3, 'eng', 'FrontNews', 4, 'title', 'Apply for crew!'),
(4, 'eng', 'FrontNews', 4, 'content', 'As <a href="http://www.gathering.org/">TG13</a> draws nearer we are yet again in need of <em>you</em> to apply now so that, together, we can make this years event the best one ever!'),
(5, 'nob', 'FrontNews', 5, 'title', 'Hvilket crew?'),
(6, 'nob', 'FrontNews', 5, 'content', 'Se gjennom <a href="/tg13/Crew/Description">beskrivelsene</a> for å finne ut hvilket crew du ønsker å bidra i.'),
(7, 'nob', 'FrontNews', 6, 'title', 'Søk crew!'),
(8, 'nob', 'FrontNews', 6, 'content', '<a href="http://www.gathering.org">TG13</a> nærmer seg med stormskritt, og vi trenger at nettopp du legger inn din søknad, slik at du kan gjøre årets arrangement til det største noen sinne!'),
(9, 'nob', 'Menuitem', 1, 'name', 'Vis profil'),
(10, 'nob', 'Menuitem', 2, 'name', 'Ditt'),
(11, 'nob', 'Menuitem', 3, 'name', 'Oppmøte'),
(12, 'nob', 'Menuitem', 4, 'name', 'Logg ut'),
(13, 'nob', 'Menuitem', 7, 'name', 'Søknader'),
(14, 'nob', 'Menuitem', 8, 'name', 'Crew'),
(15, 'nob', 'Menuitem', 9, 'name', 'IRC-nøkler'),
(16, 'nob', 'Menuitem', 10, 'name', 'Profilbildekontroll'),
(17, 'nob', 'Menuitem', 13, 'name', 'Cola-tavler'),
(18, 'nob', 'Menuitem', 14, 'name', 'Brukerstøtte'),
(19, 'nob', 'Menuitem', 15, 'name', 'Hittegods'),
(20, 'nob', 'Menuitem', 17, 'name', 'Adgangskort'),
(21, 'nob', 'Menuitem', 18, 'name', 'Oppmøte'),
(22, 'nob', 'Menuitem', 20, 'name', 'Administrasjon'),
(23, 'nob', 'Menuitem', 23, 'name', 'Rediger profil'),
(24, 'nob', 'Menuitem', 24, 'name', 'Bil en annen bruker'),
(25, 'nob', 'Menuitem', 33, 'name', 'Arrangement'),
(26, 'nob', 'Menuitem', 35, 'name', 'Behandle'),
(27, 'nob', 'Menuitem', 36, 'name', 'Brukerinformasjon'),
(28, 'nob', 'Menuitem', 50, 'name', 'Bilskilter'),
(29, 'nob', 'Menuitem', 53, 'name', 'Logistikk'),
(30, 'nob', 'Menuitem', 60, 'name', 'Søknadsspørsmål'),
(31, 'nob', 'Menuitem', 61, 'name', 'Velkomsthilsner'),
(32, 'nob', 'Menuitem', 67, 'name', 'Medisinske behov'),
(33, 'nob', 'Menuitem', 68, 'name', 'Ernæringsbehov'),
(34, 'nob', 'Menuitem', 71, 'name', 'Statistikk'),
(35, 'nob', 'Menuitem', 72, 'name', 'Presseakkreditering'),
(36, 'nob', 'Menuitem', 77, 'name', 'SMS'),
(37, 'nob', 'Menuitem', 85, 'name', 'Meny'),
(38, 'nob', 'Menuitem', 87, 'name', 'Beskrivelser'),
(39, 'nob', 'Menuitem', 88, 'name', 'Søknader'),
(40, 'nob', 'Menuitem', 89, 'name', 'Opptak'),
(41, 'nob', 'Menuitem', 90, 'name', 'Tilgangskontroll'),
(42, 'nob', 'Menuitem', 94, 'name', 'Innsjekking'),
(43, 'nob', 'Menuitem', 97, 'name', 'Scene-tavler'),
(44, 'nob', 'Menuitem', 96, 'name', 'E-postlister'),
(45, 'nob', 'Menuitem', 98, 'name', 'Ryddetider'),
(46, 'nob', 'Menuitem', 102, 'name', 'Sovekart'),
(47, 'eng', 'Menuitem', 1, 'name', 'View profile'),
(48, 'eng', 'Menuitem', 2, 'name', 'Your'),
(49, 'eng', 'Menuitem', 4, 'name', 'Sign out'),
(50, 'eng', 'Menuitem', 7, 'name', 'Applications'),
(51, 'eng', 'Menuitem', 8, 'name', 'Crew'),
(52, 'eng', 'Menuitem', 9, 'name', 'IRC keys'),
(53, 'eng', 'Menuitem', 10, 'name', 'Profile picture control'),
(54, 'eng', 'Menuitem', 13, 'name', 'Score board'),
(55, 'eng', 'Menuitem', 14, 'name', 'Dispatch'),
(56, 'eng', 'Menuitem', 15, 'name', 'Lost and found'),
(57, 'eng', 'Menuitem', 17, 'name', 'Access card'),
(58, 'eng', 'Menuitem', 18, 'name', 'Attendance'),
(59, 'eng', 'Menuitem', 20, 'name', 'Administration'),
(60, 'eng', 'Menuitem', 23, 'name', 'Edit profile'),
(61, 'eng', 'Menuitem', 24, 'name', 'Become another user'),
(62, 'eng', 'Menuitem', 33, 'name', 'Event'),
(63, 'eng', 'Menuitem', 35, 'name', 'Manage'),
(64, 'eng', 'Menuitem', 36, 'name', 'User information'),
(65, 'eng', 'Menuitem', 50, 'name', 'Car plates'),
(66, 'eng', 'Menuitem', 53, 'name', 'Logistics'),
(67, 'eng', 'Menuitem', 60, 'name', 'Application questions'),
(68, 'eng', 'Menuitem', 61, 'name', 'Greetings'),
(69, 'eng', 'Menuitem', 67, 'name', 'Medical needs'),
(70, 'eng', 'Menuitem', 68, 'name', 'Nutritional needs'),
(71, 'eng', 'Menuitem', 71, 'name', 'Statistics'),
(72, 'eng', 'Menuitem', 72, 'name', 'Press accreditation'),
(73, 'eng', 'Menuitem', 77, 'name', 'SMS'),
(74, 'eng', 'Menuitem', 85, 'name', 'Menu'),
(75, 'eng', 'Menuitem', 87, 'name', 'Descriptions'),
(76, 'eng', 'Menuitem', 88, 'name', 'Application'),
(77, 'eng', 'Menuitem', 89, 'name', 'Enrollment'),
(78, 'eng', 'Menuitem', 90, 'name', 'Access control'),
(79, 'eng', 'Menuitem', 94, 'name', 'Check in'),
(80, 'eng', 'Menuitem', 97, 'name', 'Stage board'),
(81, 'eng', 'Menuitem', 96, 'name', 'Mailingslists'),
(82, 'eng', 'Menuitem', 98, 'name', 'Cleanup'),
(83, 'eng', 'Menuitem', 102, 'name', 'Sleep map'),
(84, 'nob', 'Menuitem', 104, 'name', 'Ditt crew'),
(85, 'nob', 'Menuitem', 105, 'name', 'Liste'),
(86, 'nob', 'Menuitem', 106, 'name', 'nick'),
(87, 'nob', 'Menuitem', 107, 'name', 'Moduler'),
(88, 'nob', 'Menuitem', 108, 'name', 'Klær'),
(89, 'eng', 'Menuitem', 104, 'name', 'Your crew'),
(90, 'eng', 'Menuitem', 105, 'name', 'List'),
(91, 'eng', 'Menuitem', 106, 'name', 'nick'),
(92, 'eng', 'Menuitem', 107, 'name', 'Modules'),
(93, 'eng', 'Menuitem', 108, 'name', 'Clothing'),
(94, 'nob', 'Menuitem', 109, 'name', 'Endre arrangement'),
(95, 'eng', 'Menuitem', 109, 'name', 'Change event'),
(96, 'eng', 'Phonetype', 1, 'name', 'Mobile'),
(97, 'eng', 'Phonetype', 2, 'name', 'Home'),
(98, 'eng', 'Phonetype', 3, 'name', 'Work'),
(99, 'nob', 'Phonetype', 1, 'name', 'Mobil'),
(100, 'nob', 'Phonetype', 2, 'name', 'Hjem'),
(101, 'nob', 'Phonetype', 3, 'name', 'Arbeid'),
(102, 'nob', 'FrontNews', 7, 'title', 'Test'),
(103, 'nob', 'FrontNews', 7, 'content', 'Tester vi ser du'),
(104, 'nob', 'Menuitem', 110, 'name', 'Crew'),
(105, 'eng', 'Menuitem', 110, 'name', 'Crew'),
(106, 'eng', 'MenuItem', 111, 'name', 'News'),
(107, 'nob', 'MenuItem', 111, 'name', 'Nyheter'),
(108, 'nob', 'Menuitem', 113, 'name', 'E-postlister'),
(109, 'eng', 'Menuitem', 113, 'name', 'Mailing lists'),
(110, 'eng', 'Menuitem', 114, 'name', 'Privacy'),
(111, 'nob', 'Menuitem', 114, 'name', 'Personvern'),
(112, 'eng', 'Menuitem', 115, 'name', 'Needs'),
(113, 'nob', 'Menuitem', 115, 'name', 'Behov'),
(143, 'eng', 'Task', 3, 'message', 'Please fill in any needs you might have'),
(142, 'nob', 'Task', 3, 'message', 'Vennligst fyll inn eventuelle behov du har'),
(140, 'eng', 'PictureRule', 7, 'rule_text', 'The picture must be at least 320x427 pixels in size.'),
(139, 'nob', 'PictureRule', 7, 'denied_text', 'Ditt bilde er ikke stort nok. Last opp et bilde som er større enn 320x427 piksler størrelse.'),
(138, 'nob', 'PictureRule', 7, 'rule_text', 'Bildet må være over 320x427 piksler størrelse.'),
(156, 'nob', 'Task', 2, 'message', 'Vennligst oppgi din størrelse'),
(154, 'nob', 'Task', 4, 'glenn', 'aegaeg'),
(155, 'eng', 'Task', 4, 'glenn', '134134'),
(144, 'nob', 'FrontNews', 8, 'title', 'aoijeoigj'),
(145, 'nob', 'FrontNews', 8, 'content', 'Norsk'),
(141, 'eng', 'PictureRule', 7, 'denied_text', 'Your picture was too small. Upload a picture which is at least 320x427 pixels in size.'),
(126, 'nob', 'Menuitem', 116, 'name', 'Creweffekter'),
(127, 'eng', 'Menuitem', 116, 'name', 'Crew effects'),
(128, 'nob', 'Menuitem', 117, 'name', 'Creweffekter'),
(129, 'eng', 'Menuitem', 117, 'name', 'Crew effects'),
(130, 'eng', 'Menuitem', 118, 'name', 'Crew effects'),
(131, 'nob', 'Menuitem', 118, 'name', 'Creweffekter'),
(132, 'nob', 'Menuitem', 119, 'name', 'Bilderegler'),
(133, 'eng', 'Menuitem', 119, 'name', 'Picture rules'),
(134, 'eng', 'Menuitem', 120, 'name', 'Tasks'),
(135, 'nob', 'Menuitem', 120, 'name', 'Oppgaver'),
(157, 'eng', 'Task', 2, 'message', 'Please fill in your size'),
(158, 'nob', 'Menuitem', 121, 'name', 'Oppmøte'),
(159, 'eng', 'Menuitem', 121, 'name', 'Showup time'),
(160, 'nob', 'Task', 4, 'message', 'Vennligst sett din oppmøtetid'),
(161, 'eng', 'Task', 4, 'message', 'Please set your showup time'),
(162, 'eng', 'Menuitem', 122, 'name', 'Accreditation'),
(163, 'nob', 'Menuitem', 122, 'name', 'Akkreditering'),
(164, 'nob', 'Task', 5, 'message', 'Din oppmøtetid har blitt avslått, vennglist sett en ny'),
(165, 'eng', 'Task', 5, 'message', 'You showup time has been denied, please provide a new'),
(166, 'nob', 'Menuitem', 123, 'name', 'Mattider'),
(167, 'nob', 'Menuitem', 124, 'name', 'Mattider'),
(168, 'eng', 'Menuitem', 124, 'name', 'Meal times'),
(169, 'eng', 'Menuitem', 123, 'name', 'Meal times'),
(170, 'nob', 'PictureRule', 10, 'rule_text', 'Profilbildet trykkes på ditt personlige ID-kort. Kortet fungerer som en identifikasjon og gir deg adgang til arrangementet. Bildet må derfor best mulig identifisere deg, og tilfredsstille spesifikke krav til kvalitet og utforming. Dersom bildet ikke fyller disse kravene, blir du bedt om å laste opp et nytt bilde.'),
(171, 'nob', 'PictureRule', 10, 'denied_text', 'Profilbildet ditt tilfredstiller ikke kravene for å identifisere deg godt nok.'),
(172, 'eng', 'PictureRule', 10, 'rule_text', 'The profile picture will be printed on your personal ID card. The card serves as an identification and gives you access to the event. The image must identify you, and satisfy the specific requirements for quality and layout. If your image does not meet these requirements, you will be prompted to upload a new image.'),
(173, 'eng', 'PictureRule', 10, 'denied_text', 'Your profile photo does not meet the requirements to identify you well enough.'),
(174, 'nob', 'PictureRule', 11, 'rule_text', 'Bildet skal tas rett forfra og vise hele ansiktet. Ikke halfprofil.'),
(175, 'nob', 'PictureRule', 11, 'denied_text', 'Bildet skal tas rett forfra og vise hele ansiktet. Ikke halvprofil!'),
(176, 'eng', 'PictureRule', 11, 'rule_text', 'The picture must be taken directly from the front and show the whole face. Not half profile!'),
(177, 'eng', 'PictureRule', 11, 'denied_text', 'The picture must be taken directly from the front and show the whole face. Not half profile!'),
(178, 'nob', 'PictureRule', 12, 'rule_text', 'Bakgrunnen skal være lys eller nøytral'),
(179, 'nob', 'PictureRule', 12, 'denied_text', 'Bakgrunnen i profilbildene må være lys eller nøytral. Vennligst last opp et bilde som tilfredstiller dette kravet'),
(180, 'eng', 'PictureRule', 12, 'rule_text', 'The background must be light or neutral'),
(181, 'eng', 'PictureRule', 12, 'denied_text', 'The background in profile pictures must be light or neutral. Please upload a photo that meets this requirement'),
(182, 'nob', 'PictureRule', 13, 'rule_text', 'Øynene skal være åpne, synlige og ikke dekkes av hår'),
(183, 'nob', 'PictureRule', 13, 'denied_text', 'Ditt bilde møter ikke kravene om synlighet av øyne. De skal ikke være dekket av hår og må ikke være lukket'),
(184, 'eng', 'PictureRule', 13, 'rule_text', 'The eyes must be open, visible and not covered by hair'),
(185, 'eng', 'PictureRule', 13, 'denied_text', 'Your image does not meet the requirements for visibility of the eyes. They should not be covered by hair, and they must not be closed'),
(186, 'nob', 'PictureRule', 14, 'rule_text', 'Detaljer i ansiktet må vises tydelig'),
(187, 'nob', 'PictureRule', 14, 'denied_text', 'Ditt bilde møter ikke kravene for bildegodkjenning. Alle detaljer i ansiktet må vises tydelig'),
(188, 'eng', 'PictureRule', 14, 'rule_text', 'Details of the face must be clearly displayed'),
(189, 'eng', 'PictureRule', 14, 'denied_text', 'Your image does not meet the requirements for picture approval. Details of the face must be clearly displayed'),
(190, 'nob', 'PictureRule', 15, 'rule_text', 'Briller er tillatt. Unngå at innfatningen skjuler noe av øynene eller reflekterer lys'),
(191, 'nob', 'PictureRule', 15, 'denied_text', 'Ditt bilde møter ikke kravene for bildegodkjenning. Vi tillater naturligvis bilder med briller, men unngå bilder der innfatningen skjuler noe av øynene eller reflekterer lys'),
(192, 'eng', 'PictureRule', 15, 'rule_text', 'Glasses are permitted. Please avoid frame that hides some of your eyes or reflect light'),
(193, 'eng', 'PictureRule', 15, 'denied_text', 'Your image does not meet the requirements for profile approval. We do allow pictures with glasses, but please avoid pictures where the frame hides some of your eyes or reflect light'),
(194, 'nob', 'PictureRule', 16, 'rule_text', 'Brilleglass skal ikke være farget (solbriller er ikke tillatt)'),
(195, 'nob', 'PictureRule', 16, 'denied_text', 'Ditt bilde møter ikke kravene for bildegodkjenning. Vi tillater naturligvis bilder med briller, men unngå brilleglass som er farget (solbriller er ikke tillatt)'),
(196, 'eng', 'PictureRule', 16, 'rule_text', 'Glasses should not be colored (sunglasses are not allowed)'),
(197, 'eng', 'PictureRule', 16, 'denied_text', 'Your image does not meet the requirements for picture approval. We do allow pictures with glasses, but avoid lenses that are colored (sunglasses are not allowed)'),
(198, 'nob', 'PictureRule', 17, 'rule_text', 'Hodeplagg er ikke tillatt'),
(199, 'nob', 'PictureRule', 17, 'denied_text', 'Ditt bilde møter ikke kravene for bildegodkjenning. Hodeplagg er ikke tillatt (caps, hatt, hårbøyle med kaninører og lignende)'),
(200, 'eng', 'PictureRule', 17, 'rule_text', 'Headgear is not permitted'),
(201, 'eng', 'PictureRule', 17, 'denied_text', 'Your image does not meet the requirements for picture approval. Headgear is not allowed (cap, hat, headband with rabbit ears, etc.)'),
(202, 'nob', 'PictureRule', 18, 'rule_text', '… men hodeplagg med religiøse og/eller særskilte årsaker er ok, dersom du bruker tilsvarende hodeplagg under arrangementet'),
(203, 'nob', 'PictureRule', 18, 'denied_text', 'Ditt bilde møter ikke kravene for bildegodkjenning. Hodeplagg er ikke tillatt (caps, hatt, hårbøyle med kaninører og lignende)'),
(204, 'eng', 'PictureRule', 18, 'rule_text', '... but headgear with religious and/or specific causes are ok, if you are using similar headgear during the event'),
(205, 'eng', 'PictureRule', 18, 'denied_text', 'Your image does not meet the requirements for picture approval. Headgear is not allowed (cap, hat, headband with rabbit ears, etc.)'),
(206, 'nob', 'PictureRule', 19, 'rule_text', 'Bildet må ha et størrelsesforhold på 3:4 (0.75:1), bruk beskjæringsfunksjonen for å oppnå dette.'),
(207, 'nob', 'PictureRule', 19, 'denied_text', 'Ditt bilde har feil størrelsesforhold. Last opp nytt bilde og benytt deg av beskjæringsfunksjonen i Wannabe for å oppnå dette.'),
(208, 'eng', 'PictureRule', 19, 'rule_text', 'The picture must has an aspect ratio of 3:4 (0.75:1). Use the crop function to achieve this.'),
(209, 'eng', 'PictureRule', 19, 'denied_text', 'Your picture has the wrong aspect ratio. Upload a new picture and use the crop function in Wannabe to achieve correct aspect ratio.'),
(210, 'nob', 'PictureRule', 20, 'rule_text', 'Bildet skal være av ditt ansikt, ikke hele overkroppen'),
(211, 'nob', 'PictureRule', 20, 'denied_text', 'Ansiktet ditt er for lite, og vil synes dårlig på ID-kortene, last opp et bilde hvor kun ditt ansikt er i fokus.'),
(212, 'eng', 'PictureRule', 20, 'rule_text', 'The picture should be of you face, not your whole upper body.'),
(213, 'eng', 'PictureRule', 20, 'denied_text', 'Your face is too small and will be poorly visible on the ID cards. Please upload a new picture.'),
(214, 'nob', 'Menuitem', 125, 'name', 'Bilskilt'),
(215, 'nob', 'Menuitem', 126, 'name', 'Bilskilter'),
(216, 'eng', 'Menuitem', 126, 'name', 'Car plates'),
(217, 'eng', 'Menuitem', 125, 'name', 'Car plate'),
(218, 'eng', 'Menuitem', 127, 'name', 'Slideshow'),
(219, 'nob', 'Menuitem', 127, 'name', 'Lysbildefremvisning'),
(220, 'nob', 'Menuitem', 128, 'name', 'SMS'),
(221, 'eng', 'Menuitem', 128, 'name', 'SMS'),
(222, 'eng', 'Menuitem', 129, 'name', 'Cleanup'),
(223, 'nob', 'Menuitem', 129, 'name', 'Rydding'),
(224, 'eng', 'Menuitem', 130, 'name', 'Lost and found'),
(225, 'nob', 'Menuitem', 130, 'name', 'Tapt og funnet'),
(226, 'eng', 'Menuitem', 131, 'name', 'Keycard'),
(227, 'nob', 'Menuitem', 131, 'name', 'Nokkelkort'),
(230, 'nob', 'Task', 6, 'message', 'Vennligst velg din mattid'),
(231, 'eng', 'Task', 6, 'message', 'Please choose you meal time'),
(232, 'nob', 'Menuitem', 133, 'name', 'Sovekart'),
(233, 'eng', 'Menuitem', 133, 'name', 'Sleeping places'),
(234, 'nob', 'Menuitem', 134, 'name', 'KANDU-Medlemskap'),
(235, 'eng', 'Menuitem', 134, 'name', 'KANDU Membership'),
(236, 'nob', 'Task', 7, 'message', 'a'),
(237, 'eng', 'Task', 7, 'message', 'b'),
(238, 'nob', 'Task', 8, 'message', 'Vennligst oppgi din størrelse'),
(239, 'eng', 'Task', 8, 'message', 'Please fill in your size'),
(240, 'nob', 'Task', 9, 'message', 'Vennligst fyll inn eventuelle behov du har'),
(241, 'eng', 'Task', 9, 'message', 'Please fill in any needs you might have'),
(242, 'nob', 'Task', 10, 'message', 'Vennligst sett din oppmøtetid'),
(243, 'eng', 'Task', 10, 'message', 'Please set your showup time'),
(244, 'nob', 'Task', 11, 'message', 'Vennligst velg din mattid'),
(245, 'eng', 'Task', 11, 'message', 'Please choose you meal time'),
(246, 'nob', 'Task', 12, 'message', 'Velg ditt medlemskap'),
(247, 'eng', 'Task', 12, 'message', 'Choose your membership'),
(254, 'nob', 'Term', 2, 'title', 'Rettigheter'),
(253, 'eng', 'Menuitem', 135, 'name', 'Terms'),
(252, 'nob', 'Menuitem', 135, 'name', 'Rettigheter'),
(255, 'nob', 'Term', 2, 'content', 'Som frivillig crew-medlem vet jeg at det stilles krav til meg og mitt arbeid.\r\n\r\nArrangøren av The Gathering, KANDU, får fritt benytte seg av alt arbeid som utføres for The Gathering, som f.eks. systemutvikling, grafikk, konsept, med mer.\r\n\r\nKANDU beholder bruksrett til alt som er utviklet og produsert også etter at crew-medlemmet avslutter sitt engasjement i organisasjonen. Materiellet kan i tillegg videreutvikles av The Gathering.\r\n\r\nCrew-medlemmet som produserte og/eller utviklet materiellet beholder allikevel rettigheten til å videreutvikle og/eller selge materiellet etter at engasjementet i organisasjonen er avsluttet.\r\n\r\nKANDU kan ikke videreselge materiellet, men står fritt til å bruke det så lenge dette ikke er i et kommersielt øyemed.'),
(256, 'eng', 'Term', 2, 'title', 'Terms'),
(257, 'eng', 'Term', 2, 'content', 'As a volunteering crew member, I acknowledge that requirements are set for myself and my efforts.\r\n\r\nThe organizer of The Gathering, KANDU, may freely use any and all work produced for The Gathering, for example developed systems, graphics, concepts and more.\r\n\r\nKANDU retains the right to use everything developed and produced by the crew member also after the member ends involvement in the organization. The product may also be further developed by The Gathering.\r\n\r\nThe crew member who produced and/or developed the product will nevertheless retain the right to further develop and/or sell the product after the involvement in the organization is ended.\r\n\r\nKANDU may not resell the product, but shall be free to use it as long as it is not used in a commercial context.');

--
-- Table structure for table `wb4_improtocols`
--

DROP TABLE IF EXISTS `wb4_improtocols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_improtocols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for improtocols

INSERT INTO `wb4_improtocols` (`id`, `name`) VALUES
(1, 'MSN'),
(2, 'ICQ'),
(3, 'AIM'),
(4, 'AOL'),
(5, 'Skype'),
(6, 'GTalk');

--
-- Table structure for table `wb4_irc_channel_key_crews`
--

DROP TABLE IF EXISTS `wb4_irc_channel_key_crews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_irc_channel_key_crews` (
  `irc_channel_key_id` int(10) NOT NULL,
  `crew_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`irc_channel_key_id`,`crew_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for irc_key_crews

INSERT INTO `wb4_irc_channel_key_crews` (`irc_channel_key_id`, `crew_id`) VALUES
(16, 261);

--
-- Table structure for table `wb4_irc_channel_keys`
--

DROP TABLE IF EXISTS `wb4_irc_channel_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_irc_channel_keys` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channelname` varchar(32) NOT NULL,
  `channelkey` varchar(64) NOT NULL,
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`event_id`),
  UNIQUE KEY `event_id` (`event_id`,`channelname`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for irc_keys

INSERT INTO `wb4_irc_channel_keys` (`id`, `event_id`, `channelname`, `channelkey`, `updated`) VALUES
(16, 18, '#irc', 'kaffe', '2013-02-17 05:02:47');

--
-- Table structure for table `wb4_kandu_memberships`
--

DROP TABLE IF EXISTS `wb4_kandu_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_kandu_memberships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `choice` int(1) NOT NULL DEFAULT '0',
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_keycard_cards`
--

DROP TABLE IF EXISTS `wb4_keycard_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_keycard_cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `card_number` int(11) unsigned NOT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  `handed_out` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_keycard_handouts`
--

DROP TABLE IF EXISTS `wb4_keycard_handouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_keycard_handouts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `card_id` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `seat` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `deposit_desc` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=339 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_bulks`
--

DROP TABLE IF EXISTS `wb4_logistic_bulks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_bulks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` int(10) unsigned DEFAULT '0',
  `amountleft` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logistic_supplier_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_items`
--

DROP TABLE IF EXISTS `wb4_logistic_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `comment` text,
  `logistic_supplier_id` int(10) unsigned DEFAULT NULL,
  `serialnumber` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `logistic_bulk_id` int(10) unsigned DEFAULT '0',
  `event_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=486 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_items_logistic_tags`
--

DROP TABLE IF EXISTS `wb4_logistic_items_logistic_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_items_logistic_tags` (
  `logistic_item_id` int(10) unsigned NOT NULL,
  `logistic_tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`logistic_item_id`,`logistic_tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_locations`
--

DROP TABLE IF EXISTS `wb4_logistic_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postcode` varchar(16) DEFAULT NULL,
  `longitude` varchar(16) DEFAULT '0',
  `latitude` varchar(16) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_statuses`
--

DROP TABLE IF EXISTS `wb4_logistic_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `canonicalname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_storages`
--

DROP TABLE IF EXISTS `wb4_logistic_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_storages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logistic_location_id` int(10) unsigned NOT NULL,
  `comment` text,
  `deleted` tinyint(1) DEFAULT '0',
  `event_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_suppliers`
--

DROP TABLE IF EXISTS `wb4_logistic_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `contact` varchar(25) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postcode` varchar(16) DEFAULT NULL,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_tags`
--

DROP TABLE IF EXISTS `wb4_logistic_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` text,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_logistic_transactions`
--

DROP TABLE IF EXISTS `wb4_logistic_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_logistic_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logistic_item_id` int(10) unsigned DEFAULT NULL,
  `logistic_bulk_id` int(10) unsigned DEFAULT '0',
  `logistic_status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `received_user_id` int(10) unsigned NOT NULL,
  `doneby_id` int(10) unsigned NOT NULL,
  `donedate` datetime DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `comment` text,
  `logistic_storage_id` int(10) unsigned DEFAULT '0',
  `storage_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_logistic_transactions_user_id` (`user_id`),
  KEY `idx_logistic_transactions_logistic_item_id` (`logistic_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1980 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_lost_and_founds`
--

DROP TABLE IF EXISTS `wb4_lost_and_founds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_lost_and_founds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `found_where` text NOT NULL,
  `found_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reported_by` varchar(255) NOT NULL,
  `reported_by_contact` text,
  `delivered_to` varchar(255) DEFAULT NULL,
  `delivered_to_contact` text,
  `resolved` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `resolved_by` int(10) unsigned DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `wb4_mailinglistaddresses`
--

DROP TABLE IF EXISTS `wb4_mailinglistaddresses`;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistaddresses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wb4_mailinglistaddresses` (
  `address` varchar(128),
  `username` varchar(50),
  `mailinglist` varchar(64),
  `event_id` int(11) unsigned,
  `event_reference` varchar(200),
  `realname` varchar(128)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `wb4_mailinglistaddresses_notopts`
--

DROP TABLE IF EXISTS `wb4_mailinglistaddresses_notopts`;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistaddresses_notopts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wb4_mailinglistaddresses_notopts` (
  `address` varchar(128),
  `username` varchar(50),
  `mailinglist` varchar(64),
  `mailinglist_id` int(11) unsigned,
  `event_id` int(11) unsigned,
  `event_reference` varchar(200),
  `realname` varchar(128),
  `optional` tinyint(4)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `wb4_mailinglistmoderators`
--

DROP TABLE IF EXISTS `wb4_mailinglistmoderators`;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistmoderators`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wb4_mailinglistmoderators` (
  `email` varchar(128),
  `mailinglist` varchar(64),
  `moderatorpassword` varchar(32)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wb4_mailinglistrule_teams`
--

DROP TABLE IF EXISTS `wb4_mailinglistrule_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_mailinglistrule_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailinglist_id` int(10) unsigned NOT NULL,
  `action` enum('add','remove') DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailinglist_id` (`mailinglist_id`),
  KEY `team_id` (`team_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_mailinglistrule_users`
--

DROP TABLE IF EXISTS `wb4_mailinglistrule_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_mailinglistrule_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailinglist_id` int(10) unsigned NOT NULL,
  `action` enum('add','remove') DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailinglist_id` (`mailinglist_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_mailinglistrules`
--

DROP TABLE IF EXISTS `wb4_mailinglistrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_mailinglistrules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailinglist_id` int(10) unsigned NOT NULL,
  `action` enum('add','remove') DEFAULT NULL,
  `crew_id` int(10) unsigned NOT NULL,
  `leader` int(11) DEFAULT '-1',
  `enable_moderator` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mailinglist_id` (`mailinglist_id`),
  KEY `crew_id` (`crew_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1360 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_mailinglists`
--

DROP TABLE IF EXISTS `wb4_mailinglists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_mailinglists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `address` varchar(64) NOT NULL,
  `synced` datetime DEFAULT NULL,
  `moderatorpassword` varchar(32) NOT NULL DEFAULT '',
  `crew_id` int(10) unsigned NOT NULL COMMENT 'contains the crew_id which have manage rights to this mailinglists',
  `optional` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `crew_id` (`crew_id`),
  KEY `address` (`address`)
) ENGINE=MyISAM AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `wb4_mailinglistsecurityhacks`
--

DROP TABLE IF EXISTS `wb4_mailinglistsecurityhacks`;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistsecurityhacks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `wb4_mailinglistsecurityhacks` (
  `address` varchar(128),
  `mailinglist` varchar(36),
  `event_id` varchar(1),
  `event_reference` varchar(4),
  `realname` varchar(128)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wb4_mailman_passwords`
--

DROP TABLE IF EXISTS `wb4_mailman_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_mailman_passwords` (
  `mailinglist` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mailinglist`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_mealtimes`
--

DROP TABLE IF EXISTS `wb4_mealtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_mealtimes` (
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `mealtime` int(10) DEFAULT '0',
  PRIMARY KEY (`user_id`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_menuitems`
--

DROP TABLE IF EXISTS `wb4_menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_menuitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `event_id` int(10) unsigned DEFAULT '0',
  `requireevent` tinyint(1) DEFAULT '1',
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for menuitems

INSERT INTO `wb4_menuitems` (`id`, `parent_id`, `event_id`, `requireevent`, `name`, `path`, `position`, `hidden`) VALUES
(1, 106, 0, 1, 'Din side', '/Profile', 1, 0),
(2, 8, 0, 1, 'Ditt crew', '/Crew/View', 1, 0),
(109, 106, 0, 0, 'Change event', '/Event/change', 98, 0),
(4, 106, 0, 0, 'Logg ut', '/User/Logout', 99, 0),
(7, 35, 0, 1, 'Crewopptak', '/Enroll', 1, 0),
(8, 0, 0, 1, 'Crew', '/Crew', 1, 0),
(9, 35, 0, 1, 'IRC-nøkler', '/IrcChannelKeyAdmin', 5, 0),
(10, 35, 0, 1, 'Bildesensur', '/PictureApprove', 8, 0),
(13, 107, 0, 1, 'Cola-tavler', '/Scoreboard', 8, 1),
(14, 107, 0, 1, 'Dispatch', '/Dispatch', 1, 1),
(15, 107, 0, 1, 'Tapt og Funnet', '/LostFound', 2, 1),
(17, 107, 0, 1, 'Nøkkelkort', '/Keycard', 4, 1),
(18, 35, 0, 1, 'Oppmøtetider', '/ShowupTimes/moderate', 4, 0),
(20, 0, 0, 1, 'Administrasjon', '/Admin', 4, 0),
(23, 106, 0, 1, 'Rediger profil', '/Profile/Edit', 2, 0),
(24, 20, 0, 1, 'Bli en annen bruker', '/Admin/Sudo', 7, 1),
(33, 20, 0, 1, 'Arrangement', '/EventAdmin', 1, 0),
(35, 0, 0, 1, 'Crewadministrasjon', '/Crew/Edit', 2, 0),
(36, 106, 0, 1, 'Brukerinfo', '/UserPref', 3, 1),
(50, 35, 0, 1, 'Carplates', '/Carplates', 12, 1),
(53, 107, 0, 1, 'Logistikk', '/Logistic', 3, 0),
(60, 35, 0, 1, 'Spørsmål i søknad', '/ApplicationManager/Question', 2, 0),
(61, 35, 0, 1, 'Velkomsthilsen', '/ApplicationManager/Greeting', 3, 0),
(105, 8, 0, 1, 'Liste', '/Crew', 2, 0),
(106, 0, 0, 0, 'nick', '/Profile', 5, 0),
(107, 0, 0, 1, 'Moduler', '/', 3, 0),
(108, 35, 0, 1, 'Clothing', '/Clothing', 11, 1),
(67, 35, 0, 1, 'Medisinske behov', '/NeedsAdmin/medical', 6, 0),
(68, 35, 0, 1, 'Matallergier', '/NeedsAdmin/nutritional', 7, 0),
(71, 8, 0, 1, 'Statistikk', '/Crew/Statistics', 3, 1),
(72, 107, 0, 1, 'Presse', '/Press', 5, 1),
(77, 107, 0, 1, 'SMS', '/Sms', 6, 1),
(85, 20, 0, 1, 'Endre menyen', '/Admin/Menu', 2, 1),
(87, 8, 0, 1, 'Crewbeskrivelser', '/Crew/Description', 4, 0),
(88, 20, 0, 1, 'Crewapplication', '/ApplicationAdmin', 5, 0),
(89, 20, 0, 1, 'Enroll', '/EnrollAdmin', 6, 0),
(90, 20, 0, 1, 'ACL', '/Access', 3, 0),
(94, 20, 0, 1, 'Checkin', '/Checkin', 8, 1),
(97, 107, 0, 1, 'Slideshow', '/Sceneboard', 7, 1),
(96, 20, 0, 1, 'Epostlister', '/MailinglistAdmin', 4, 0),
(98, 35, 0, 1, 'Ryddeliste', '/Cleanup', 10, 1),
(102, 107, 0, 1, 'Sovekart', '/Sleeping', 9, 1),
(104, 35, 0, 1, 'Ditt Crew', '/Crew/Edit', 0, 0),
(110, 20, 0, 1, 'CrewAdmin', '/CrewAdmin', 9, 0),
(111, 20, 0, 1, 'FrontNewsManager', '/FrontNewsManager', 10, 0),
(113, 106, 0, 1, 'mailinglsit', '/MailingList', 3, 0),
(114, 106, 0, 1, 'privacy', '/Privacy', 4, 0),
(115, 106, 0, 1, 'needs', '/Needs/', 5, 0),
(116, 106, 0, 1, 'Creweffectsorder', '/CrewEffectsOrder', 6, 0),
(117, 20, 0, 1, 'Creweffectsitems', '/CrewEffectsItems', 11, 0),
(118, 35, 0, 1, 'Creweffectsoverview', '/CrewEffectsOrder/overview', 13, 0),
(119, 35, 0, 1, 'picture rules', '/PictureRule', 9, 0),
(120, 20, 0, 1, 'tasks', '/TaskAdmin', 12, 0),
(121, 106, 0, 1, 'showup', '/ShowupTimes', 7, 0),
(122, 107, 0, 1, 'accreditation', '/Accreditation', 10, 0),
(123, 35, 0, 1, 'Mealtime', '/Mealtime/view', 14, 0),
(124, 106, 0, 1, 'Mealtime', '/Mealtime', 14, 0),
(125, 106, 0, 1, 'carplate', '/Carplate', 8, 0),
(126, 35, 0, 1, 'carplate', '/CarplateAdmin', 12, 0),
(127, 107, 0, 1, 'slideshow', '/Slideshow', 11, 0),
(128, 107, 0, 1, 'smsmessage', '/SmsMessage', 12, 0),
(129, 8, 0, 1, 'Cleanup', '/Crew/Cleanup', 5, 0),
(130, 107, 0, 1, 'Lost and found', '/LostAndFound', 5, 0),
(131, 107, 0, 1, 'Keycard handout', '/KeycardHandout', 13, 0),
(132, 107, 0, 1, 'Keycard cards', '/KeycardCard', 12, 0),
(133, 107, 0, 1, 'sleepingmap', '/SleepingPlaces', 63, 0),
(134, 106, 0, 1, 'Kandu Membership', '/KanduMembership', 5, 0),
(135, 20, 0, 1, 'terms', '/TermAdmin', 13, 0);

--
-- Table structure for table `wb4_message_senders`
--

DROP TABLE IF EXISTS `wb4_message_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_message_senders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_messages`
--

DROP TABLE IF EXISTS `wb4_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `crew_id` int(10) unsigned DEFAULT NULL,
  `team_id` int(10) unsigned DEFAULT NULL,
  `message_sender_id` int(10) unsigned NOT NULL,
  `sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_needs`
--

DROP TABLE IF EXISTS `wb4_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_needs` (
  `user_id` int(10) NOT NULL,
  `medicalneeds` text,
  `nutritionalneeds` text,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_phonetypes`
--

DROP TABLE IF EXISTS `wb4_phonetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_phonetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for phonetypes

INSERT INTO `wb4_phonetypes` (`id`, `name`) VALUES
(1, 'Mobil'),
(2, 'Hjem'),
(3, 'Arbeid');

--
-- Table structure for table `wb4_picture_approval_statuses`
--

DROP TABLE IF EXISTS `wb4_picture_approval_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_picture_approval_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `picture_approval_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `fetched` datetime DEFAULT '0000-00-00 00:00:00',
  `printed` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_picture_approvals`
--

DROP TABLE IF EXISTS `wb4_picture_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_picture_approvals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `picture_rule_id` int(10) unsigned DEFAULT '0',
  `custom_denied_reason` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1999 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for picture_approvals

INSERT INTO `wb4_picture_approvals` (`id`, `updated`, `user_id`, `approved`, `picture_rule_id`, `custom_denied_reason`) VALUES
(1794, '2013-01-29 00:42:45', 6389, 0, 0, NULL),
(1795, '2013-01-29 00:48:00', 6390, 0, 0, NULL),
(1796, '2013-01-29 00:58:32', 1, 0, 0, NULL),
(1797, '2013-02-17 04:43:33', 6391, 0, 0, NULL),
(1798, '2013-02-22 10:42:31', 1918, 0, 0, NULL);

--
-- Table structure for table `wb4_picture_rules`
--

DROP TABLE IF EXISTS `wb4_picture_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_picture_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_text` text,
  `denied_text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_secure_files`
--

DROP TABLE IF EXISTS `wb4_secure_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_secure_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `expires` datetime DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) DEFAULT NULL,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_showup_times`
--

DROP TABLE IF EXISTS `wb4_showup_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_showup_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `hour` varchar(50) DEFAULT NULL,
  `comment` text,
  `approved` int(1) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=723 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_sleeping_places`
--

DROP TABLE IF EXISTS `wb4_sleeping_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_sleeping_places` (
  `section` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_slideshows`
--

DROP TABLE IF EXISTS `wb4_slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_slideshows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_slideshows_slides`
--

DROP TABLE IF EXISTS `wb4_slideshows_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_slideshows_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `bg_url` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `show_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_sms_budgets`
--

DROP TABLE IF EXISTS `wb4_sms_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_sms_budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_sent` int(11) DEFAULT NULL,
  `sms_limit` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_sms_messages`
--

DROP TABLE IF EXISTS `wb4_sms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_sms_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `message` text CHARACTER SET latin1,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4384 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_tasks`
--

DROP TABLE IF EXISTS `wb4_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `message` text,
  `redirect` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `event_id` int(10) unsigned NOT NULL,
  `allow_sub` tinyint(1) DEFAULT '0',
  `model` varchar(255) DEFAULT '',
  `condition` text,
  `complete_with_model` tinyint(1) DEFAULT NULL,
  `skip_button` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for tasks

INSERT INTO `wb4_tasks` (`id`, `name`, `message`, `redirect`, `enabled`, `event_id`, `allow_sub`, `model`, `condition`, `complete_with_model`, `skip_button`) VALUES
(1, '', NULL, '', 0, 16, 0, '', '', 1, 0),
(2, 'Creweffekter', 'Please fill in your size', '/CrewEffectsOrder', 1, 16, 0, 'CrewEffectsOrder', 'App::import(''Model'',''CrewEffectsOrder'');\r\n$model = new CrewEffectsOrder();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(3, 'Needs', 'Please fill in any needs you might have', '/Needs', 1, 16, 0, 'Needs', '', 1, 1),
(4, 'Oppmøte', 'Please set your showup time', '/ShowupTimes', 1, 16, 0, 'ShowupTime', 'App::import(''Model'',''ShowupTime'');\r\n$model = new ShowupTime();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(5, 'Oppmøte avslått', 'You showup time has been denied, please provide a new', '/ShowupTimes', 0, 16, 0, 'ShowupTime', 'App::import(''Model'',''ShowupTime'');\r\n$model = new ShowupTime();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));\r\nif(empty($result)) {\r\n  $result = true;\r\n} else if(!empty($result) && $result[''ShowupTime''][''approved''] == 1) {\r\n  $result = null;\r\n}', 1, 0),
(6, 'Mattid', 'Please choose you meal time', '/Mealtime', 1, 16, 0, 'Mealtime', 'App::import(''Model'',''Mealtime'');\r\n$model = new Mealtime();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(7, 'KANDU-medlemskap', 'b', '/KanduMembership', 0, 16, 1, 'KanduMembership', 'App::import(''Model'',''KanduMembership'');\r\n$model = new KanduMembership();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(8, 'Creweffekter', 'Please fill in your size', '/CrewEffectsOrder', 0, 17, 0, 'CrewEffectsOrder', 'App::import(''Model'',''CrewEffectsOrder'');\r\n$model = new CrewEffectsOrder();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(9, 'Needs', 'Please fill in any needs you might have', '/Needs', 0, 17, 0, 'Needs', '', 1, 1),
(10, 'Oppmøte avslått', 'Please set your showup time', '/ShowupTimes', 0, 17, 0, 'ShowupTime', 'App::import(''Model'',''ShowupTime'');\r\n$model = new ShowupTime();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(11, 'Mattid', 'Please choose you meal time', '/Mealtime', 0, 17, 0, 'Mealtime', 'App::import(''Model'',''Mealtime'');\r\n$model = new Mealtime();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0),
(12, 'KANDU-medlemskap', 'Choose your membership', '/KanduMembership', 0, 17, 1, 'KanduMembership', 'App::import(''Model'',''KanduMembership'');\r\n$model = new KanduMembership();\r\n$result = $model->find(''first'', array(\r\n  ''conditions'' => array(\r\n    ''event_id'' => WB::$event->id,\r\n    ''user_id'' => WB::$user[''User''][''id'']\r\n  )\r\n));', 0, 0);

--
-- Table structure for table `wb4_teams`
--

DROP TABLE IF EXISTS `wb4_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crew_id` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=861 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for teams

INSERT INTO `wb4_teams` (`id`, `crew_id`, `name`, `locked`) VALUES
(0, 0, 'NO', 0);

--
-- Table structure for table `wb4_terms`
--

DROP TABLE IF EXISTS `wb4_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text,
  `version` varchar(50) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for terms

INSERT INTO `wb4_terms` (`id`, `event_id`, `title`, `content`, `version`, `updated`, `active`) VALUES
(2, 17, 'Terms', 'As a volunteering crew member, I acknowledge that requirements are set for myself and my efforts.\r\n\r\nThe organizer of The Gathering, KANDU, may freely use any and all work produced for The Gathering, for example developed systems, graphics, concepts and more.\r\n\r\nKANDU retains the right to use everything developed and produced by the crew member also after the member ends involvement in the organization. The product may also be further developed by The Gathering.\r\n\r\nThe crew member who produced and/or developed the product will nevertheless retain the right to further develop and/or sell the product after the involvement in the organization is ended.\r\n\r\nKANDU may not resell the product, but shall be free to use it as long as it is not used in a commercial context.', '1.1', '2012-12-01 21:29:58', 1);

--
-- Table structure for table `wb4_user_mailprefs`
--

DROP TABLE IF EXISTS `wb4_user_mailprefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_user_mailprefs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `mailinglist_id` int(10) unsigned NOT NULL,
  `subscribe` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5415 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_user_privacies`
--

DROP TABLE IF EXISTS `wb4_user_privacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_user_privacies` (
  `user_id` int(10) unsigned NOT NULL,
  `address` tinyint(1) DEFAULT '0',
  `email` tinyint(1) DEFAULT '0',
  `phone` tinyint(1) DEFAULT '0',
  `birth` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_user_profile_hashes`
--

DROP TABLE IF EXISTS `wb4_user_profile_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_user_profile_hashes` (
  `user_id` int(10) unsigned NOT NULL,
  `hash` varchar(25) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_user_tasks`
--

DROP TABLE IF EXISTS `wb4_user_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_user_tasks` (
  `user_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `event_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `task_id` (`task_id`,`user_id`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_user_terms`
--

DROP TABLE IF EXISTS `wb4_user_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_user_terms` (
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `accepted` datetime DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `user_id` (`user_id`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_userhistories`
--

DROP TABLE IF EXISTS `wb4_userhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_userhistories` (
  `user_id` int(10) unsigned NOT NULL,
  `eventname` varchar(64) NOT NULL DEFAULT '',
  `crewname` varchar(64) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`eventname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_userims`
--

DROP TABLE IF EXISTS `wb4_userims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_userims` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `improtocol_id` int(10) unsigned NOT NULL,
  `address` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9670 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_userphones`
--

DROP TABLE IF EXISTS `wb4_userphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_userphones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `number` varchar(32) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `phonetype_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10614 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_users`
--

DROP TABLE IF EXISTS `wb4_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `realname` varchar(128) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `postcode` varchar(16) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `countrycode` varchar(8) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sexe` enum('undefined','male','female') DEFAULT 'undefined',
  `verified` datetime NOT NULL,
  `verificationcode` varchar(128) DEFAULT NULL,
  `nickname` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `resetpasswordcode` varchar(48) DEFAULT NULL,
  `longitude` varchar(16) DEFAULT '0',
  `latitude` varchar(16) DEFAULT '0',
  `lastactive` datetime DEFAULT NULL,
  `language` varchar(8) DEFAULT '',
  `registered` text,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6473 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Data for users 

INSERT INTO `wb4_users` (`id`, `username`, `password`, `realname`, `address`, `postcode`, `town`, `countrycode`, `email`, `birth`, `created`, `updated`, `deleted`, `sexe`, `verified`, `verificationcode`, `nickname`, `image`, `resetpasswordcode`, `longitude`, `latitude`, `lastactive`, `language`, `registered`) VALUES
(1, 'dev', '00b540c76dafa6dd46e4fab60826c3d7', 'Dev root', 'Bedringens vei 1', '1920', 'SØRUMSAND', 'NO', 'root@localhost', '1985-01-01 00:00:00', '2013-01-29 00:45:03', '2013-01-29 01:17:57', '0000-00-00 00:00:00', 'male', '2013-01-29 00:58:32', '8fb9e87edb1d1f65f88d75f9128b7e0b', 'root', NULL, NULL, '0', '0', NULL, 'eng', 'done');

--
-- Table structure for table `wb4_vote_campaigns`
--

DROP TABLE IF EXISTS `wb4_vote_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_vote_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `starts` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime NOT NULL,
  `description` text,
  `passphrase` varchar(25) DEFAULT NULL,
  `short_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_vote_options`
--

DROP TABLE IF EXISTS `wb4_vote_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_vote_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime NOT NULL,
  `description` text NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_vote_votes`
--

DROP TABLE IF EXISTS `wb4_vote_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_vote_votes` (
  `campaign_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`campaign_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_wardrobe_card_borrowers`
--

DROP TABLE IF EXISTS `wb4_wardrobe_card_borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_wardrobe_card_borrowers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `seat` varchar(255) DEFAULT NULL,
  `row` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `wardrobe_card_id` int(10) unsigned NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `deposit_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_wardrobe_cards`
--

DROP TABLE IF EXISTS `wb4_wardrobe_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_wardrobe_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `card` varchar(255) DEFAULT NULL,
  `wardrobe` varchar(255) DEFAULT NULL,
  `in_use` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_wikipages`
--

DROP TABLE IF EXISTS `wb4_wikipages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_wikipages` (
  `title` varchar(255) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`title`,`revision`),
  KEY `wikipages_ix` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wb4_wikirelations`
--

DROP TABLE IF EXISTS `wb4_wikirelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb4_wikirelations` (
  `wikipage_title` varchar(255) NOT NULL,
  `table` varchar(16) NOT NULL,
  `table_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `wb4_mailinglistaddresses`
--

/*!50001 DROP TABLE IF EXISTS `wb4_mailinglistaddresses`*/;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistaddresses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wannabe`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wb4_mailinglistaddresses` AS (select distinct `u`.`email` AS `address`,`u`.`username` AS `username`,`m`.`address` AS `mailinglist`,`m`.`event_id` AS `event_id`,`e`.`reference` AS `event_reference`,`u`.`realname` AS `realname` from ((((`wb4_users` `u` join `wb4_crews_users` `uc`) join `wb4_mailinglistrules` `mr`) join `wb4_mailinglists` `m`) join `wb4_events` `e`) where ((`u`.`id` = `uc`.`user_id`) and (`mr`.`crew_id` = `uc`.`crew_id`) and (`mr`.`action` = 'add') and (`uc`.`leader` >= `mr`.`leader`) and (`m`.`id` = `mr`.`mailinglist_id`) and (`e`.`id` = `m`.`event_id`) and (((`m`.`optional` = 1) and ((select `ui`.`subscribe` from `wb4_user_mailprefs` `ui` where ((`ui`.`user_id` = `u`.`id`) and (`ui`.`event_id` = `e`.`id`) and (`ui`.`mailinglist_id` = `m`.`id`)) limit 1) = 1)) or (`m`.`optional` <> 1)))) union (select distinct `u`.`email` AS `address`,`u`.`username` AS `username`,`m`.`address` AS `mailinglist`,`m`.`event_id` AS `event_id`,`e`.`reference` AS `event_reference`,`u`.`realname` AS `realname` from ((((`wb4_users` `u` join `wb4_crews_users` `uc`) join `wb4_mailinglistrule_teams` `mr`) join `wb4_mailinglists` `m`) join `wb4_events` `e`) where ((`u`.`id` = `uc`.`user_id`) and (`mr`.`team_id` = `uc`.`team_id`) and (`mr`.`action` = 'add') and (`m`.`id` = `mr`.`mailinglist_id`) and (`e`.`id` = `m`.`event_id`) and (((`m`.`optional` = 1) and ((select `ui`.`subscribe` from `wb4_user_mailprefs` `ui` where ((`ui`.`user_id` = `u`.`id`) and (`ui`.`event_id` = `e`.`id`) and (`ui`.`mailinglist_id` = `m`.`id`) and (`ui`.`subscribe` = 1)) limit 1) = 1)) or (`m`.`optional` <> 1)))) union (select distinct `u`.`email` AS `address`,`u`.`username` AS `username`,`m`.`address` AS `mailinglist`,`m`.`event_id` AS `event_id`,`e`.`reference` AS `event_reference`,`u`.`realname` AS `realname` from ((((`wb4_users` `u` join `wb4_crews_users` `uc`) join `wb4_mailinglistrule_users` `mr`) join `wb4_mailinglists` `m`) join `wb4_events` `e`) where ((`u`.`id` = `uc`.`user_id`) and (`mr`.`user_id` = `uc`.`user_id`) and (`mr`.`action` = 'add') and (`m`.`id` = `mr`.`mailinglist_id`) and (`e`.`id` = `m`.`event_id`) and (((`m`.`optional` = 1) and ((select `ui`.`subscribe` from `wb4_user_mailprefs` `ui` where ((`ui`.`user_id` = `u`.`id`) and (`ui`.`event_id` = `e`.`id`) and (`ui`.`mailinglist_id` = `m`.`id`) and (`ui`.`subscribe` = 1)) limit 1) = 1)) or (`m`.`optional` <> 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wb4_mailinglistaddresses_notopts`
--

/*!50001 DROP TABLE IF EXISTS `wb4_mailinglistaddresses_notopts`*/;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistaddresses_notopts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wannabe`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wb4_mailinglistaddresses_notopts` AS (select distinct `u`.`email` AS `address`,`u`.`username` AS `username`,`m`.`address` AS `mailinglist`,`m`.`id` AS `mailinglist_id`,`m`.`event_id` AS `event_id`,`e`.`reference` AS `event_reference`,`u`.`realname` AS `realname`,`m`.`optional` AS `optional` from ((((`wb4_users` `u` join `wb4_crews_users` `uc`) join `wb4_mailinglistrules` `mr`) join `wb4_mailinglists` `m`) join `wb4_events` `e`) where ((`u`.`id` = `uc`.`user_id`) and (`mr`.`crew_id` = `uc`.`crew_id`) and (`mr`.`action` = 'add') and (`uc`.`leader` >= `mr`.`leader`) and (`m`.`id` = `mr`.`mailinglist_id`) and (`e`.`id` = `m`.`event_id`))) union (select distinct `u`.`email` AS `address`,`u`.`username` AS `username`,`m`.`address` AS `mailinglist`,`m`.`id` AS `mailinglist_id`,`m`.`event_id` AS `event_id`,`e`.`reference` AS `event_reference`,`u`.`realname` AS `realname`,`m`.`optional` AS `optional` from ((((`wb4_users` `u` join `wb4_crews_users` `uc`) join `wb4_mailinglistrule_teams` `mr`) join `wb4_mailinglists` `m`) join `wb4_events` `e`) where ((`u`.`id` = `uc`.`user_id`) and (`mr`.`team_id` = `uc`.`team_id`) and (`mr`.`action` = 'add') and (`m`.`id` = `mr`.`mailinglist_id`) and (`e`.`id` = `m`.`event_id`))) union (select distinct `u`.`email` AS `address`,`u`.`username` AS `username`,`m`.`address` AS `mailinglist`,`m`.`id` AS `mailinglist_id`,`m`.`event_id` AS `event_id`,`e`.`reference` AS `event_reference`,`u`.`realname` AS `realname`,`m`.`optional` AS `optional` from ((((`wb4_users` `u` join `wb4_crews_users` `uc`) join `wb4_mailinglistrule_users` `mr`) join `wb4_mailinglists` `m`) join `wb4_events` `e`) where ((`u`.`id` = `uc`.`user_id`) and (`mr`.`user_id` = `uc`.`user_id`) and (`mr`.`action` = 'add') and (`m`.`id` = `mr`.`mailinglist_id`) and (`e`.`id` = `m`.`event_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wb4_mailinglistmoderators`
--

/*!50001 DROP TABLE IF EXISTS `wb4_mailinglistmoderators`*/;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistmoderators`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wannabe`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wb4_mailinglistmoderators` AS (select distinct `u`.`email` AS `email`,`m`.`address` AS `mailinglist`,`m`.`moderatorpassword` AS `moderatorpassword` from ((((`wb4_mailinglists` `m` join `wb4_users` `u`) join `wb4_crews_users` `uc`) join `wb4_crews` `c`) join `wb4_mailinglistrules` `mrule`) where ((`uc`.`user_id` = `u`.`id`) and (`m`.`id` = `mrule`.`mailinglist_id`) and (`uc`.`crew_id` = `mrule`.`crew_id`) and (((`c`.`id` = `uc`.`crew_id`) and ((`c`.`id` = `m`.`crew_id`) or (`mrule`.`enable_moderator` = 1))) or (`uc`.`crew_id` = (select `c2`.`id` from `wb4_crews` `c2` where (`c2`.`id` = `c`.`crew_id`)))) and (`uc`.`leader` > 2) and ((`m`.`crew_id` > 0) or (`mrule`.`enable_moderator` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wb4_mailinglistsecurityhacks`
--

/*!50001 DROP TABLE IF EXISTS `wb4_mailinglistsecurityhacks`*/;
/*!50001 DROP VIEW IF EXISTS `wb4_mailinglistsecurityhacks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wannabe`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wb4_mailinglistsecurityhacks` AS select `u`.`email` AS `address`,(case `uc`.`team_id` when 465 then 'tg11sec-security-dag@gathering.org' when 466 then 'tg11sec-security-kveld@gathering.org' when 467 then 'tg11sec-security-natt@gathering.org' when 468 then 'tg11sec-security-flexi@gathering.org' else NULL end) AS `mailinglist`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where (`uc`.`team_id` in (465,466,467,468)) union select `u`.`email` AS `address`,(case `uc`.`team_id` when 458 then 'tg11sec-medic-dag@gathering.org' when 459 then 'tg11sec-medic-kveld@gathering.org' when 460 then 'tg11sec-medic-natt@gathering.org' when 461 then 'tg11sec-medic-flexi@gathering.org' else NULL end) AS `mailinglist`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where (`uc`.`team_id` in (458,459,460,461)) union select `u`.`email` AS `address`,(case `uc`.`team_id` when 465 then 'tg11sec-dag@gathering.org' when 466 then 'tg11sec-kveld@gathering.org' when 467 then 'tg11sec-natt@gathering.org' when 468 then 'tg11sec-flexi@gathering.org' else NULL end) AS `mailinglist`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where (`uc`.`team_id` in (465,466,467,468)) union select `u`.`email` AS `address`,(case `uc`.`team_id` when 458 then 'tg11sec-dag@gathering.org' when 459 then 'tg11sec-kveld@gathering.org' when 460 then 'tg11sec-natt@gathering.org' when 461 then 'tg11sec-flexi@gathering.org' else NULL end) AS `mailinglist`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where (`uc`.`team_id` in (458,459,460,461)) union select `u`.`email` AS `address`,'tg11sec-dag@gathering.org' AS `tg11sec-dag@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 458) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-kveld@gathering.org' AS `tg11sec-kveld@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 459) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-natt@gathering.org' AS `tg11sec-natt@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 460) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-flexi@gathering.org' AS `tg11sec-felxi@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 468) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-security-dag@gathering.org' AS `tg11sec-security-dag@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 458)) union select `u`.`email` AS `address`,'tg11sec-security-kveld@gathering.org' AS `tg11sec-security-kveld@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 459)) union select `u`.`email` AS `address`,'tg11sec-security-natt@gathering.org' AS `tg11sec-security-natt@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 460)) union select `u`.`email` AS `address`,'tg11sec-security-flexi@gathering.org' AS `tg11sec-security-flexi@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 461)) union select `u`.`email` AS `address`,'tg11sec-medic-dag@gathering.org' AS `tg11sec-medic-dag@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 458) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-medic-kveld@gathering.org' AS `tg11sec-medic-kveld@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 459) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-medic-natt@gathering.org' AS `tg11sec-medic-natt@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 460) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) union select `u`.`email` AS `address`,'tg11sec-medic-flexi@gathering.org' AS `tg11sec-medic-flexi@gathering.org`,'4' AS `event_id`,'tg11' AS `event_reference`,`u`.`realname` AS `realname` from (`wb4_users` `u` join `wb4_crews_users` `uc` on((`uc`.`user_id` = `u`.`id`))) where ((`uc`.`crew_id` = 165) or (`uc`.`team_id` = 461) or ((`uc`.`leader` > 2) and (`uc`.`crew_id` = 181))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-25 14:58:22
