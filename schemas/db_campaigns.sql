-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mobidea-com_campaigns
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `campaign_exclusive_publishers`
--

DROP TABLE IF EXISTS `campaign_exclusive_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_exclusive_publishers` (
  `id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`publisher_id`),
  KEY `scid` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=276662 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_exclusive_publishers`
--

LOCK TABLES `campaign_exclusive_publishers` WRITE;
/*!40000 ALTER TABLE `campaign_exclusive_publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_exclusive_publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_exclusive_smartlinks`
--

DROP TABLE IF EXISTS `campaign_exclusive_smartlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_exclusive_smartlinks` (
  `id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `smartlink_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idwebsite` (`smartlink_id`),
  KEY `idcampaign` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_exclusive_smartlinks`
--

LOCK TABLES `campaign_exclusive_smartlinks` WRITE;
/*!40000 ALTER TABLE `campaign_exclusive_smartlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_exclusive_smartlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_payouts`
--

DROP TABLE IF EXISTS `campaign_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_payouts` (
  `id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `campaign_url_id` int(10) unsigned NOT NULL,
  `currency_id` tinyint(3) NOT NULL,
  `start_date` datetime NOT NULL,
  `payout` decimal(10,2) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcampaign` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=896887 DEFAULT CHARSET=latin1 COMMENT='The `type` column is not used anymore...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_payouts`
--

LOCK TABLES `campaign_payouts` WRITE;
/*!40000 ALTER TABLE `campaign_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_segments_expanded`
--

DROP TABLE IF EXISTS `campaign_segments_expanded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_segments_expanded` (
  `id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `advertiser_id` smallint(3) unsigned NOT NULL,
  `vertical_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `country_id` smallint(5) unsigned NOT NULL,
  `operator_id` int(10) unsigned DEFAULT NULL,
  `os_id` smallint(5) unsigned NOT NULL,
  `browser_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_campaign` (`campaign_id`),
  KEY `id_campaign` (`campaign_id`,`country_id`,`operator_id`,`os_id`),
  KEY `id_country_id_operator_id_os_id_vertical_type_id_browser_status` (`country_id`,`operator_id`,`os_id`,`vertical_type_id`,`browser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_segments_expanded`
--

LOCK TABLES `campaign_segments_expanded` WRITE;
/*!40000 ALTER TABLE `campaign_segments_expanded` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_segments_expanded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_segments_grouped`
--

DROP TABLE IF EXISTS `campaign_segments_grouped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_segments_grouped` (
  `id` int(10) unsigned NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `advertiser_id` smallint(3) unsigned NOT NULL,
  `vertical_type_id` int(11) NOT NULL DEFAULT '0',
  `country_id` int(10) NOT NULL,
  `operator_id` varchar(15) DEFAULT NULL,
  `os_id` varchar(15) NOT NULL,
  `browser_id` varchar(15) NOT NULL,
  `exclude` tinyint(1) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_campaign` (`campaign_id`),
  KEY `idx_id_application` (`offer_id`),
  KEY `idx_id_country` (`country_id`),
  KEY `idx_id_operator` (`operator_id`),
  KEY `idx_id_os` (`os_id`),
  KEY `idx_exclude` (`exclude`),
  KEY `id_campaign` (`campaign_id`,`country_id`,`operator_id`,`os_id`,`exclude`),
  KEY `id_country` (`country_id`,`operator_id`,`os_id`,`exclude`),
  KEY `idx_id_vertical_type` (`vertical_type_id`),
  KEY `idx_id_group` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_segments_grouped`
--

LOCK TABLES `campaign_segments_grouped` WRITE;
/*!40000 ALTER TABLE `campaign_segments_grouped` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_segments_grouped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_url_exclusive_publishers`
--

DROP TABLE IF EXISTS `campaign_url_exclusive_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_url_exclusive_publishers` (
  `id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `campaign_url_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`publisher_id`),
  KEY `scid` (`campaign_url_id`)
) ENGINE=MyISAM AUTO_INCREMENT=276662 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_url_exclusive_publishers`
--

LOCK TABLES `campaign_url_exclusive_publishers` WRITE;
/*!40000 ALTER TABLE `campaign_url_exclusive_publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_url_exclusive_publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_urls`
--

DROP TABLE IF EXISTS `campaign_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_urls` (
  `id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `url` mediumtext NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `exclusive` mediumtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_capaign_redirect_url` (`campaign_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=62343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_urls`
--

LOCK TABLES `campaign_urls` WRITE;
/*!40000 ALTER TABLE `campaign_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `advertiser_id` smallint(3) unsigned NOT NULL,
  `hardware_id` varchar(255) NOT NULL,
  `status` int(1) unsigned NOT NULL,
  `from_network` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `main_vertical` tinyint(1) unsigned NOT NULL,
  `verticals` varchar(255) NOT NULL DEFAULT '',
  `categorization` varchar(255) NOT NULL,
  `exclusive` tinyint(3) unsigned NOT NULL,
  `exclusive_type` tinyint(3) unsigned NOT NULL COMMENT '1 - whitelist, 0 - blacklist; whitelist: the choosen affiliates are able to see; blacklist - the affiliates are not able to see the campaign',
  `exclusive_affiliate_type` varchar(255) NOT NULL,
  `daily_cap` mediumint(8) unsigned DEFAULT NULL,
  `monthly_cap` mediumint(8) unsigned DEFAULT NULL,
  `daily_budget` varchar(45) DEFAULT NULL,
  `monthly_budget` varchar(45) DEFAULT NULL,
  `enabled_hours` varchar(64) NOT NULL,
  `excluded_segments` tinyint(1) NOT NULL DEFAULT '0',
  `geoedge_frequency` tinyint(3) unsigned NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `original_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `idx_idapp` (`offer_id`),
  KEY `cds_singletransactions_campaigns_status_idapplication_id_index` (`status`,`offer_id`,`id`),
  KEY `status_2` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=33670 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_applies`
--

DROP TABLE IF EXISTS `offer_applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_applies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL COMMENT 'status 1 pending, 2 approved, 3 rejected',
  `is_previous_approved` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `traffic_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Whats your traffic source for this offer?',
  `has_own_materials` tinyint(1) NOT NULL COMMENT 'Will you use your own pre-sell page, texts and banner?',
  `reason` text CHARACTER SET latin1 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `id_user` (`publisher_id`),
  KEY `id_application` (`offer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_applies`
--

LOCK TABLES `offer_applies` WRITE;
/*!40000 ALTER TABLE `offer_applies` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_apply_notes`
--

DROP TABLE IF EXISTS `offer_apply_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_apply_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `note` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_apply_notes`
--

LOCK TABLES `offer_apply_notes` WRITE;
/*!40000 ALTER TABLE `offer_apply_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_apply_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_categories`
--

DROP TABLE IF EXISTS `offer_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `vertical_type_id` int(11) NOT NULL DEFAULT '0',
  `is_adult` tinyint(1) NOT NULL DEFAULT '0',
  `is_public_display` tinyint(1) NOT NULL DEFAULT '0',
  `is_public_index` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `tenant_id` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idverticaltype_idx` (`vertical_type_id`),
  KEY `idx_public_display` (`is_public_display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_categories`
--

LOCK TABLES `offer_categories` WRITE;
/*!40000 ALTER TABLE `offer_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_exclusive_publishers`
--

DROP TABLE IF EXISTS `offer_exclusive_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_exclusive_publishers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`publisher_id`),
  KEY `application_id` (`offer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_exclusive_publishers`
--

LOCK TABLES `offer_exclusive_publishers` WRITE;
/*!40000 ALTER TABLE `offer_exclusive_publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_exclusive_publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_preview_urls`
--

DROP TABLE IF EXISTS `offer_preview_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_preview_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `url` tinytext NOT NULL COMMENT 'url to fall back when app campaign segment doesn t match',
  `os_id` int(3) unsigned NOT NULL DEFAULT '1' COMMENT 'operating system',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idapplication` (`offer_id`),
  KEY `os` (`os_id`),
  KEY `idapplication_2` (`offer_id`,`os_id`),
  KEY `idx_select` (`offer_id`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30765 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_preview_urls`
--

LOCK TABLES `offer_preview_urls` WRITE;
/*!40000 ALTER TABLE `offer_preview_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_preview_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` tinyint(1) NOT NULL,
  `offer_category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` tinyint(4) NOT NULL,
  `developer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `screenshot` tinyint(1) DEFAULT NULL,
  `screenshot_files` text,
  `approval_required` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `allowed_traffic` varchar(128) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - disabled, 1 - enabled',
  `date_added` date NOT NULL,
  `change_date` int(11) NOT NULL,
  `is_top_offer` tinyint(4) NOT NULL,
  `exclusive` tinyint(1) unsigned NOT NULL,
  `exclusive_type` tinyint(3) unsigned NOT NULL COMMENT '1 - whitelist, 0 - blacklist; whitelist: the choosen affiliates are able to see; blacklist - the affiliates are not able to see the campaign',
  `exclusive_affiliate_type` varchar(255) NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  `original_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cds_applications_id_status_index` (`id`,`status`),
  KEY `fk_offers_offer_categories_idx` (`offer_category_id`),
  KEY `cds_applications_id_flag_exclusive_flag_exclusive_type_index` (`id`,`exclusive`,`exclusive_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_offers`
--

DROP TABLE IF EXISTS `publisher_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL COMMENT 'status 1 pending, 2 approved, 3 rejected',
  `safety_fallback` tinyint(1) NOT NULL DEFAULT '1',
  `postbacks` text COLLATE utf8_unicode_ci,
  `daily_cap` mediumint(8) unsigned DEFAULT NULL,
  `monthly_cap` mediumint(8) unsigned DEFAULT NULL,
  `payout` decimal(10,2) DEFAULT NULL,
  `currency_id` tinyint(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `id_user` (`publisher_id`),
  KEY `id_application` (`offer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_offers`
--

LOCK TABLES `publisher_offers` WRITE;
/*!40000 ALTER TABLE `publisher_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertical_types`
--

DROP TABLE IF EXISTS `vertical_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vertical_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `name_it` varchar(50) NOT NULL,
  `name_es` varchar(50) NOT NULL,
  `name_de` varchar(50) NOT NULL,
  `name_nl` varchar(50) NOT NULL,
  `name_pt_PT` varchar(50) NOT NULL,
  `name_pt_BR` varchar(50) NOT NULL,
  `name_ru_RU` varchar(50) NOT NULL,
  `name_zh_CN` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `domains` text NOT NULL,
  `idparent` smallint(5) unsigned NOT NULL,
  `path` varchar(130) NOT NULL,
  `only_admin` tinyint(4) unsigned NOT NULL,
  `is_mainstream` tinyint(3) NOT NULL DEFAULT '0',
  `test_percentage` tinyint(3) unsigned NOT NULL,
  `minimum_sales` mediumint(8) unsigned NOT NULL COMMENT 'Minimum sales for best mode',
  `ignore_operators` tinyint(3) unsigned NOT NULL COMMENT 'Ignore operators in best mode',
  `default_app_icon` varchar(50) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `opportunities_interval` tinyint(2) unsigned DEFAULT '7',
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `smartlinks` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `whitelabels` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `id_campaign` text COMMENT 'The default campaigns for VT (comma separated IDs list)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertical_types`
--

LOCK TABLES `vertical_types` WRITE;
/*!40000 ALTER TABLE `vertical_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertical_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-29 10:25:10
