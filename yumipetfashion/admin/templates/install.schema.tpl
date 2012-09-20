-- phpMyAdmin SQL Dump
-- version 2.6.3-pl1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2007 at 04:00 PM
-- Server version: 5.0.32
-- PHP Version: 4.4.4-8+etch4
--
-- Database: `storesuite`
--

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%accountingref`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%accountingref` (
  `accountingrefid` int(10) unsigned NOT NULL auto_increment,
  `accountingrefmoduleid` varchar(100) NOT NULL default '',
  `accountingrefexternalid` varchar(100) NOT NULL DEFAULT '',
  `accountingrefnodeid` int(10) unsigned NOT NULL DEFAULT 0,
  `accountingreftype` varchar(20) NOT NULL DEFAULT '',
  `accountingrefvalue` TEXT,
  PRIMARY KEY  (`accountingrefid`),
  KEY `i_accountingref_accountingrefmoduleid` (`accountingrefmoduleid`),
  KEY `i_accountingref_accountingrefexternalid` (`accountingrefexternalid`),
  KEY `i_accountingref_accountingrefnodeid` (`accountingrefnodeid`),
  KEY `i_accountingref_accountingreftype` (`accountingreftype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%administrator_log`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%administrator_log` (
  `logid` int(11) NOT NULL auto_increment,
  `loguserid` int(11) NOT NULL default '0',
  `logip` varchar(30) NOT NULL default '',
  `logdate` int(11) NOT NULL default '0',
  `logtodo` varchar(100) NOT NULL default '',
  `logdata` text,
  PRIMARY KEY  (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%banners`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%banners` (
  `bannerid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `content` longtext,
  `page` enum('home_page','category_page','brand_page','search_page') NOT NULL default 'home_page',
  `catorbrandid` int(11) NOT NULL default '0',
  `location` enum('top','bottom') NOT NULL default 'top',
  `datecreated` int(11) NOT NULL default '0',
  `datetype` enum('always','custom') NOT NULL default 'always',
  `datefrom` int(11) NOT NULL default '0',
  `dateto` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`bannerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%brands`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%brands` (
  `brandid` int(11) NOT NULL auto_increment,
  `brandname` varchar(255) NOT NULL default '',
  `brandpagetitle` varchar(250) NOT NULL default '',
  `brandmetakeywords` text,
  `brandmetadesc` text,
  `brandimagefile` varchar(255) NOT NULL default '',
  `brandsearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`brandid`),
  UNIQUE KEY `u_brands_brandname` (`brandname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%brand_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%brand_search` (
  `brandsearchid` int(11) NOT NULL auto_increment,
  `brandid` int(11) NOT NULL default '0',
  `brandname` varchar(250) NOT NULL default '',
  `brandpagetitle` varchar(250) NOT NULL default '',
  `brandsearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`brandsearchid`),
  KEY `i_brand_search_brandid` (`brandid`),
  FULLTEXT KEY `brandname` (`brandname`,`brandpagetitle`,`brandsearchkeywords`),
  FULLTEXT KEY `brandname2` (`brandname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%brand_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%brand_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `brandid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%categories`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%categories` (
  `categoryid` int(11) NOT NULL auto_increment,
  `catparentid` int(11) default '0',
  `catname` varchar(50) NOT NULL default '',
  `catdesc` text NOT NULL,
  `catviews` int(11) NOT NULL default	 '0',
  `catsort` int(11) NOT NULL default '0',
  `catpagetitle` varchar(250) NOT NULL default '',
  `catmetakeywords` text,
  `catmetadesc` text,
  `catlayoutfile` varchar(50) NOT NULL default '',
  `catparentlist` text,
  `catimagefile` varchar(255) NOT NULL default '',
  `catvisible` TINYINT NOT NULL DEFAULT 1,
  `catsearchkeywords` varchar(255) NOT NULL default '',
  `cat_enable_optimizer` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `catnsetleft` int(11) unsigned NOT NULL default '0',
  `catnsetright` int(11) unsigned NOT NULL default '0',
  `cataltcategoriescache` text,
  PRIMARY KEY  (`categoryid`),
  KEY `i_categoryid_catnsetleft_catnsetright` (`categoryid`,`catnsetleft`,`catnsetright`),
  KEY `i_catnsetleft` (`catnsetleft`),
  KEY `i_catparentid_catsort_catname` (`catparentid`,`catsort`,`catname`),
  KEY `i_catvisible_catsort_catname` (`catvisible`,`catsort`,`catname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%category_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%category_search` (
  `categorysearchid` int(11) NOT NULL auto_increment,
  `categoryid` int(11) NOT NULL default '0',
  `catname` varchar(250) NOT NULL default '',
  `catdesc` text NOT NULL,
  `catsearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`categorysearchid`),
  KEY `i_category_search_categoryid` (`categoryid`),
  FULLTEXT KEY `catname` (`catname`,`catdesc`,`catsearchkeywords`),
  FULLTEXT KEY `catname2` (`catname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%category_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%category_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `categoryid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%categoryassociations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%categoryassociations` (
  `associationid` int(11) NOT NULL auto_increment,
  `productid` int(11) default '0',
  `categoryid` int(11) default '0',
  PRIMARY KEY  (`associationid`),
  KEY `i_categoryassociations_prodcat` (`productid`, `categoryid`),
  KEY `i_categoryassociations_catprod` (`categoryid`, `productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%config`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%config` (
  `database_version` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%country_regions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%country_regions` (
  `couregid` int(11) NOT NULL auto_increment,
  `couregname` varchar(255) NOT NULL default '',
  `couregiso2` char(2) NOT NULL default '',
  `couregiso3` char(3) NOT NULL default '',
  PRIMARY KEY  (`couregid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Data for table `%%PREFIX%%countries`
--

TRUNCATE `%%PREFIX%%country_regions`;

INSERT INTO `%%PREFIX%%country_regions` (`couregid`, `couregname`, `couregiso2`, `couregiso3`) VALUES (1, 'European Union', 'EU', 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%countries`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%countries` (
  `countryid` int(11) NOT NULL auto_increment,
  `countrycouregid` int(11),
  `countryname` varchar(255) NOT NULL default '',
  `countryiso2` char(2) NOT NULL default '',
  `countryiso3` char(3) NOT NULL default '',
  PRIMARY KEY  (`countryid`),
  KEY `i_regions_countrycouregid` (`countrycouregid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Data for table `%%PREFIX%%countries`
--

TRUNCATE `%%PREFIX%%countries`;

INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (1, NULL, 'Afghanistan', 'AF', 'AFG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (2, NULL, 'Albania', 'AL', 'ALB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (3, NULL, 'Algeria', 'DZ', 'DZA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (4, NULL, 'American Samoa', 'AS', 'ASM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (5, NULL, 'Andorra', 'AD', 'AND');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (6, NULL, 'Angola', 'AO', 'AGO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (7, NULL, 'Anguilla', 'AI', 'AIA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (8, NULL, 'Antarctica', 'AQ', '\r');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (9, NULL, 'Antigua and Barbuda', 'AG', 'ATG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (10, NULL, 'Argentina', 'AR', 'ARG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (11, NULL, 'Armenia', 'AM', 'ARM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (12, NULL, 'Aruba', 'AW', 'ABW');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (13, NULL, 'Australia', 'AU', 'AUS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (14, 1, 'Austria', 'AT', 'AUT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (15, NULL, 'Azerbaijan', 'AZ', 'AZE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (16, NULL, 'Bahamas', 'BS', 'BHS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (17, NULL, 'Bahrain', 'BH', 'BHR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (18, NULL, 'Bangladesh', 'BD', 'BGD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (19, NULL, 'Barbados', 'BB', 'BRB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (20, NULL, 'Belarus', 'BY', 'BLR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (21, 1, 'Belgium', 'BE', 'BEL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (22, NULL, 'Belize', 'BZ', 'BLZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (23, NULL, 'Benin', 'BJ', 'BEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (24, NULL, 'Bermuda', 'BM', 'BMU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (25, NULL, 'Bhutan', 'BT', 'BTN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (26, NULL, 'Bolivia', 'BO', 'BOL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (27, NULL, 'Bosnia and Herzegovina', 'BA', 'BIH');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (28, NULL, 'Botswana', 'BW', 'BWA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (29, NULL, 'Bouvet Island', 'BV', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (30, NULL, 'Brazil', 'BR', 'BRA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (31, NULL, 'British Indian Ocean Territory', 'IO', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (32, NULL, 'Brunei Darussalam', 'BN', 'BRN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (33, 1, 'Bulgaria', 'BG', 'BGR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (34, NULL, 'Burkina Faso', 'BF', 'BFA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (35, NULL, 'Burundi', 'BI', 'BDI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (36, NULL, 'Cambodia', 'KH', 'KHM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (37, NULL, 'Cameroon', 'CM', 'CMR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (38, NULL, 'Canada', 'CA', 'CAN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (39, NULL, 'Cape Verde', 'CV', 'CPV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (40, NULL, 'Cayman Islands', 'KY', 'CYM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (41, NULL, 'Central African Republic', 'CF', 'CAF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (42, NULL, 'Chad', 'TD', 'TCD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (43, NULL, 'Chile', 'CL', 'CHL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (44, NULL, 'China', 'CN', 'CHN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (45, NULL, 'Christmas Island', 'CX', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (46, NULL, 'Cocos (Keeling) Islands', 'CC', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (47, NULL, 'Colombia', 'CO', 'COL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (48, NULL, 'Comoros', 'KM', 'COM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (49, NULL, 'Congo', 'CG', 'COG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (50, NULL, 'Congo, the Democratic Republic of the', 'CD', 'COD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (51, NULL, 'Cook Islands', 'CK', 'COK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (52, NULL, 'Costa Rica', 'CR', 'CRI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (54, NULL, 'Croatia', 'HR', 'HRV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (55, NULL, 'Cuba', 'CU', 'CUB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (56, NULL, 'Cyprus', 'CY', 'CYP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (57, NULL, 'Czech Republic', 'CZ', 'CZE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (58, NULL, 'Denmark', 'DK', 'DNK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (59, NULL, 'Djibouti', 'DJ', 'DJI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (60, NULL, 'Dominica', 'DM', 'DMA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (61, NULL, 'Dominican Republic', 'DO', 'DOM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (62, NULL, 'Ecuador', 'EC', 'ECU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (63, NULL, 'Egypt', 'EG', 'EGY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (64, NULL, 'El Salvador', 'SV', 'SLV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (65, NULL, 'Equatorial Guinea', 'GQ', 'GNQ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (66, NULL, 'Eritrea', 'ER', 'ERI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (67, NULL, 'Estonia', 'EE', 'EST');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (68, NULL, 'Ethiopia', 'ET', 'ETH');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (69, NULL, 'Falkland Islands (Malvinas)', 'FK', 'FLK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (70, NULL, 'Faroe Islands', 'FO', 'FRO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (71, NULL, 'Fiji', 'FJ', 'FJI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (72, 1, 'Finland', 'FI', 'FIN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (73, 1, 'France', 'FR', 'FRA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (74, NULL, 'French Guiana', 'GF', 'GUF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (75, NULL, 'French Polynesia', 'PF', 'PYF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (76, NULL, 'French Southern Territories', 'TF', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (77, NULL, 'Gabon', 'GA', 'GAB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (78, NULL, 'Gambia', 'GM', 'GMB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (79, NULL, 'Georgia', 'GE', 'GEO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (80, 1, 'Germany', 'DE', 'DEU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (81, NULL, 'Ghana', 'GH', 'GHA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (82, NULL, 'Gibraltar', 'GI', 'GIB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (83, 1, 'Greece', 'GR', 'GRC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (84, NULL, 'Greenland', 'GL', 'GRL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (85, NULL, 'Grenada', 'GD', 'GRD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (86, NULL, 'Guadeloupe', 'GP', 'GLP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (87, NULL, 'Guam', 'GU', 'GUM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (88, NULL, 'Guatemala', 'GT', 'GTM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (89, NULL, 'Guinea', 'GN', 'GIN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (90, NULL, 'Guinea-Bissau', 'GW', 'GNB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (91, NULL, 'Guyana', 'GY', 'GUY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (92, NULL, 'Haiti', 'HT', 'HTI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (93, NULL, 'Heard Island and Mcdonald Islands', 'HM', '\r');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (94, NULL, 'Holy See (Vatican City State)', 'VA', 'VAT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (95, NULL, 'Honduras', 'HN', 'HND');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (96, NULL, 'Hong Kong', 'HK', 'HKG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (97, NULL, 'Hungary', 'HU', 'HUN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (98, NULL, 'Iceland', 'IS', 'ISL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (99, NULL, 'India', 'IN', 'IND');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (100, NULL, 'Indonesia', 'ID', 'IDN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (101, NULL, 'Iran, Islamic Republic of', 'IR', 'IRN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (102, NULL, 'Iraq', 'IQ', 'IRQ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (103, 1, 'Ireland', 'IE', 'IRL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (104, NULL, 'Israel', 'IL', 'ISR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (105, 1, 'Italy', 'IT', 'ITA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (106, NULL, 'Jamaica', 'JM', 'JAM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (107, NULL, 'Japan', 'JP', 'JPN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (108, NULL, 'Jordan', 'JO', 'JOR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (109, NULL, 'Kazakhstan', 'KZ', 'KAZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (110, NULL, 'Kenya', 'KE', 'KEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (111, NULL, 'Kiribati', 'KI', 'KIR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (113, NULL, 'Korea, Republic of', 'KR', 'KOR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (114, NULL, 'Kuwait', 'KW', 'KWT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (115, NULL, 'Kyrgyzstan', 'KG', 'KGZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (117, NULL, 'Latvia', 'LV', 'LVA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (118, NULL, 'Lebanon', 'LB', 'LBN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (119, NULL, 'Lesotho', 'LS', 'LSO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (120, NULL, 'Liberia', 'LR', 'LBR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (121, NULL, 'Libyan Arab Jamahiriya', 'LY', 'LBY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (122, NULL, 'Liechtenstein', 'LI', 'LIE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (123, NULL, 'Lithuania', 'LT', 'LTU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (124, 1, 'Luxembourg', 'LU', 'LUX');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (125, NULL, 'Macao', 'MO', 'MAC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (126, NULL, 'Macedonia, the Former Yugoslav Republic of', 'MK', 'MKD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (127, NULL, 'Madagascar', 'MG', 'MDG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (128, NULL, 'Malawi', 'MW', 'MWI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (129, NULL, 'Malaysia', 'MY', 'MYS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (130, NULL, 'Maldives', 'MV', 'MDV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (131, NULL, 'Mali', 'ML', 'MLI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (132, NULL, 'Malta', 'MT', 'MLT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (133, NULL, 'Marshall Islands', 'MH', 'MHL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (134, NULL, 'Martinique', 'MQ', 'MTQ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (135, NULL, 'Mauritania', 'MR', 'MRT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (136, NULL, 'Mauritius', 'MU', 'MUS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (137, NULL, 'Mayotte', 'YT', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (138, NULL, 'Mexico', 'MX', 'MEX');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (139, NULL, 'Micronesia, Federated States of', 'FM', 'FSM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (140, NULL, 'Moldova, Republic of', 'MD', 'MDA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (141, NULL, 'Monaco', 'MC', 'MCO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (142, NULL, 'Mongolia', 'MN', 'MNG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (143, NULL, 'Montserrat', 'MS', 'MSR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (144, NULL, 'Morocco', 'MA', 'MAR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (145, NULL, 'Mozambique', 'MZ', 'MOZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (146, NULL, 'Myanmar', 'MM', 'MMR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (147, NULL, 'Namibia', 'NA', 'NAM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (148, NULL, 'Nauru', 'NR', 'NRU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (149, NULL, 'Nepal', 'NP', 'NPL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (150, 1, 'Netherlands', 'NL', 'NLD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (151, NULL, 'Netherlands Antilles', 'AN', 'ANT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (152, NULL, 'New Caledonia', 'NC', 'NCL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (153, NULL, 'New Zealand', 'NZ', 'NZL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (154, NULL, 'Nicaragua', 'NI', 'NIC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (155, NULL, 'Niger', 'NE', 'NER');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (156, NULL, 'Nigeria', 'NG', 'NGA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (157, NULL, 'Niue', 'NU', 'NIU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (158, NULL, 'Norfolk Island', 'NF', 'NFK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (159, NULL, 'Northern Mariana Islands', 'MP', 'MNP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (160, NULL, 'Norway', 'NO', 'NOR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (161, NULL, 'Oman', 'OM', 'OMN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (162, NULL, 'Pakistan', 'PK', 'PAK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (163, NULL, 'Palau', 'PW', 'PLW');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (164, NULL, 'Palestinian Territory, Occupied', 'PS', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (165, NULL, 'Panama', 'PA', 'PAN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (166, NULL, 'Papua New Guinea', 'PG', 'PNG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (167, NULL, 'Paraguay', 'PY', 'PRY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (168, NULL, 'Peru', 'PE', 'PER');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (169, NULL, 'Philippines', 'PH', 'PHL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (170, NULL, 'Pitcairn', 'PN', 'PCN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (171, NULL, 'Poland', 'PL', 'POL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (172, 1, 'Portugal', 'PT', 'PRT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (173, NULL, 'Puerto Rico', 'PR', 'PRI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (174, NULL, 'Qatar', 'QA', 'QAT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (175, NULL, 'Reunion', 'RE', 'REU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (176, NULL, 'Romania', 'RO', 'ROM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (177, NULL, 'Russian Federation', 'RU', 'RUS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (178, NULL, 'Rwanda', 'RW', 'RWA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (179, NULL, 'Saint Helena', 'SH', 'SHN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (180, NULL, 'Saint Kitts and Nevis', 'KN', 'KNA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (181, NULL, 'Saint Lucia', 'LC', 'LCA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (182, NULL, 'Saint Pierre and Miquelon', 'PM', 'SPM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (183, NULL, 'Saint Vincent and the Grenadines', 'VC', 'VCT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (184, NULL, 'Samoa', 'WS', 'WSM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (185, NULL, 'San Marino', 'SM', 'SMR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (186, NULL, 'Sao Tome and Principe', 'ST', 'STP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (187, NULL, 'Saudi Arabia', 'SA', 'SAU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (188, NULL, 'Senegal', 'SN', 'SEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (189, NULL, 'Serbia', 'RS', 'SRB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (190, NULL, 'Seychelles', 'SC', 'SYC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (191, NULL, 'Sierra Leone', 'SL', 'SLE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (192, NULL, 'Singapore', 'SG', 'SGP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (193, NULL, 'Slovakia', 'SK', 'SVK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (194, NULL, 'Slovenia', 'SI', 'SVN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (195, NULL, 'Solomon Islands', 'SB', 'SLB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (196, NULL, 'Somalia', 'SO', 'SOM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (197, NULL, 'South Africa', 'ZA', 'ZAF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (198, NULL, 'South Georgia and the South Sandwich Islands', 'GS', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (199, 1, 'Spain', 'ES', 'ESP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (200, NULL, 'Sri Lanka', 'LK', 'LKA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (201, NULL, 'Sudan', 'SD', 'SDN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (202, NULL, 'Suriname', 'SR', 'SUR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (203, NULL, 'Svalbard and Jan Mayen', 'SJ', 'SJM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (204, NULL, 'Swaziland', 'SZ', 'SWZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (205, NULL, 'Sweden', 'SE', 'SWE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (206, NULL, 'Switzerland', 'CH', 'CHE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (207, NULL, 'Syrian Arab Republic', 'SY', 'SYR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (208, NULL, 'Taiwan', 'TW', 'TWN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (209, NULL, 'Tajikistan', 'TJ', 'TJK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (210, NULL, 'Tanzania, United Republic of', 'TZ', 'TZA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (211, NULL, 'Thailand', 'TH', 'THA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (212, NULL, 'Timor-Leste', 'TL', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (213, NULL, 'Togo', 'TG', 'TGO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (214, NULL, 'Tokelau', 'TK', 'TKL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (215, NULL, 'Tonga', 'TO', 'TON');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (216, NULL, 'Trinidad and Tobago', 'TT', 'TTO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (217, NULL, 'Tunisia', 'TN', 'TUN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (218, NULL, 'Turkey', 'TR', 'TUR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (219, NULL, 'Turkmenistan', 'TM', 'TKM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (220, NULL, 'Turks and Caicos Islands', 'TC', 'TCA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (221, NULL, 'Tuvalu', 'TV', 'TUV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (222, NULL, 'Uganda', 'UG', 'UGA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (223, NULL, 'Ukraine', 'UA', 'UKR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (224, NULL, 'United Arab Emirates', 'AE', 'ARE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (225, NULL, 'United Kingdom', 'GB', 'GBR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (226, NULL, 'United States', 'US', 'USA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (227, NULL, 'United States Minor Outlying Islands', 'UM', '\r');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (228, NULL, 'Uruguay', 'UY', 'URY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (229, NULL, 'Uzbekistan', 'UZ', 'UZB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (230, NULL, 'Vanuatu', 'VU', 'VUT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (231, NULL, 'Venezuela', 'VE', 'VEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (232, NULL, 'Viet Nam', 'VN', 'VNM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (233, NULL, 'Virgin Islands, British', 'VG', 'VGB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (234, NULL, 'Virgin Islands, U.S.', 'VI', 'VIR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (235, NULL, 'Wallis and Futuna', 'WF', 'WLF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (236, NULL, 'Western Sahara', 'EH', 'ESH');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (237, NULL, 'Yemen', 'YE', 'YEM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (238, NULL, 'Zambia', 'ZM', 'ZMB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (239, NULL, 'Zimbabwe', 'ZW', 'ZWE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (240, NULL, 'Isle of Man', 'IM', 'IMN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (241, NULL, 'Jersey', 'JE', 'JEY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (242, NULL, 'Guernsey', 'GG', 'GGY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (243, NULL, 'Lao People\'s Democratic Republic', 'LA', 'LAO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (244, NULL, 'Korea, Democratic People\'s Republic of', 'KP', 'PRK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (245, NULL, 'Montenegro', 'ME', 'MNE');

--
-- Table structure for table `%%PREFIX%%country_states`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%country_states` (
  `stateid` int(11) NOT NULL auto_increment,
  `statename` varchar(255) NOT NULL default '',
  `statecountry` int(11) NOT NULL default '0',
  `stateabbrv` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`stateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Data for table `%%PREFIX%%country_states`
--

TRUNCATE `%%PREFIX%%country_states`;

INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Acre', 30, 'AC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Alagoas', 30, 'AL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Amapa', 30, 'AP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Amazonas', 30, 'AM');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bahia', 30, 'BA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ceara', 30, 'CE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Distrito Federal', 30, 'DF');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Espirito Santo', 30, 'ES');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Goias', 30, 'GO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Maranhao', 30, 'MA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mato Grosso', 30, 'MT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mato Grosso do Sul', 30, 'MS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Minas Gerais', 30, 'MG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Para', 30, 'PA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Paraiba', 30, 'PB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Parana', 30, 'PR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Pernambuco', 30, 'PE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Piaui', 30, 'PI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rio de Janeiro', 30, 'RJ');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rio Grande do Norte', 30, 'RN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rio Grande do Sul', 30, 'RS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rondonia', 30, 'RO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Roraima', 30, 'RR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Santa Catarina', 30, 'SC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sao Paulo', 30, 'SP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sergipe', 30, 'SE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tocantins', 30, 'TO');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%coupons`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%coupons` (
  `couponid` int(11) NOT NULL auto_increment,
  `couponname` varchar(100) NOT NULL default '',
  `coupontype` tinyint(4) NOT NULL default '0',
  `couponamount` decimal(20,4) NOT NULL default '0',
  `couponminpurchase` int(11) NOT NULL default '0',
  `couponexpires` int(11) NOT NULL default '0',
  `couponenabled` tinyint(4) NOT NULL default '0',
  `couponcode` varchar(50) NOT NULL default '',
  `couponappliesto` enum('categories','products') NOT NULL default 'products',
  `couponnumuses` int(11) NOT NULL default '0',
  `couponmaxuses` int(11) NOT NULL default '0',
  PRIMARY KEY  (`couponid`),
  UNIQUE KEY `u_coupons_couponcode` (`couponcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%coupon_values`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%coupon_values` (
  `couponid` int(11) NOT NULL,
  `valueid` int(11) NOT NULL,
  PRIMARY KEY  (`couponid`,`valueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%currencies`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%currencies` (
 `currencyid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `currencycountryid` INT(11) UNSIGNED DEFAULT NULL,
 `currencycouregid` INT(11) UNSIGNED DEFAULT NULL,
 `currencycode` CHAR(3) NOT NULL DEFAULT '',
 `currencyconvertercode` VARCHAR(255) DEFAULT NULL,
 `currencyname` varchar(255) NOT NULL DEFAULT '',
 `currencyexchangerate` DECIMAL(20,10) NOT NULL DEFAULT 0,
 `currencystring` VARCHAR(20) NOT NULL DEFAULT '',
 `currencystringposition` CHAR(5) NOT NULL DEFAULT '',
 `currencydecimalstring` CHAR(1) NOT NULL DEFAULT '',
 `currencythousandstring` CHAR(1) NOT NULL DEFAULT '',
 `currencydecimalplace` SMALLINT UNSIGNED NOT NULL DEFAULT 2,
 `currencylastupdated` INT(11) NOT NULL DEFAULT 0,
 `currencyisdefault` SMALLINT(1) NOT NULL DEFAULT 0,
 `currencystatus` SMALLINT(1) NOT NULL DEFAULT 0,
 PRIMARY KEY (`currencyid`),
 UNIQUE KEY `u_currencies_currencycode_currencycountryid_currencycouregid` (`currencycode`,`currencycountryid`, `currencycouregid`),
 KEY `i_countries_currencycountryid`(`currencycountryid`),
 KEY `i_countries_currencycouregid`(`currencycouregid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%custom_searches`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%custom_searches` (
  `searchid` int(11) NOT NULL auto_increment,
  `searchtype` enum('orders','products','customers', 'returns', 'giftcertificates', 'shipments') NOT NULL default 'orders',
  `searchname` varchar(255) NOT NULL default '',
  `searchvars` longtext,
  PRIMARY KEY  (`searchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `%%PREFIX%%custom_searches` (`searchtype`, `searchname`, `searchvars`) VALUES ('orders', 'Incomplete Orders', 'viewName=Incomplete+Orders&orderStatus=0'), ('orders', 'Orders from eBay', 'viewName=Orders from eBay&ebayOrderId=-1'), ('orders', 'Pre-Orders', 'viewName=Pre-Orders&preorders[]=1');


-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%customer_credits`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_credits` (
  `custcreditid` int(10) NOT NULL auto_increment,
  `customerid` int(10) NOT NULL default '0',
  `creditamount` decimal(20,4) NOT NULL default '0',
  `credittype` enum('return','gift','adjustment') NOT NULL,
  `creditdate` int(10) NOT NULL default '0',
  `creditrefid` int(10) NOT NULL default '0',
  `credituserid` int(10) NOT NULL default '0',
  `creditreason` varchar(200) NOT NULL default '0',
  PRIMARY KEY  (`custcreditid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%customers`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customers` (
  `customerid` int(11) NOT NULL auto_increment,
  `salt` varchar(16) NOT NULL default '',
  `custpassword` varchar(50) NOT NULL default '',
  `custconcompany` varchar(255) NOT NULL default '',
  `custconfirstname` varchar(100) NOT NULL default '',
  `custconlastname` varchar(100) NOT NULL default '',
  `custconemail` varchar(250) NOT NULL default '',
  `custconphone` varchar(50) NOT NULL default '',
  `customertoken` varchar(250) NOT NULL default '',
  `customerpasswordresettoken` varchar(32) NOT NULL default '',
  `customerpasswordresetemail` varchar(255) NOT NULL default '',
  `custdatejoined` int(11) NOT NULL default '0',
  `custlastmodified` int(11) NOT NULL default '0',
  `custimportpassword` varchar(100) NOT NULL default '',
  `custstorecredit` decimal(20,4) NOT NULL default '0',
  `custregipaddress` varchar(30) NOT NULL default '',
  `custgroupid` int(11) NOT NULL default '0',
  `custnotes` TEXT,
  `custformsessionid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`customerid`),
  KEY `i_customers_customertoken` (`customertoken`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%forms`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%forms` (
  `formid` int(10) unsigned NOT NULL auto_increment,
  `formname` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`formid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


INSERT INTO `%%PREFIX%%forms` VALUES (1,'Account Details');
INSERT INTO `%%PREFIX%%forms` VALUES (2,'Billing Details');
INSERT INTO `%%PREFIX%%forms` VALUES (3,'Shipping Details');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%formfields`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%formfields` (
  `formfieldid` int(10) unsigned NOT NULL auto_increment,
  `formfieldformid` int(10) unsigned NOT NULL default '0',
  `formfieldtype` varchar(50) NOT NULL default '',
  `formfieldlabel` varchar(255) NOT NULL default '',
  `formfielddefaultval` varchar(255) NOT NULL default '',
  `formfieldextrainfo` text,
  `formfieldisrequired` tinyint(1) NOT NULL default '0',
  `formfieldisimmutable` tinyint(1) default '0',
  `formfieldprivateid` varchar(255) NOT NULL default '',
  `formfieldlastmodified` int (10) unsigned NOT NULL default '0',
  `formfieldsort` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`formfieldid`),
  KEY `i_formfields_formfieldformid` (`formfieldformid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,1,'singleline','E-mail','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'EmailAddress',UNIX_TIMESTAMP(),10);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,1,'password','Senha','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Password',UNIX_TIMESTAMP(),20);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,1,'password','Confirmar Senha','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'ConfirmPassword',UNIX_TIMESTAMP(),30);

INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Nome','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:3:\"250\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'FirstName',UNIX_TIMESTAMP(),10);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Sobrenome','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:3:\"250\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'LastName',UNIX_TIMESTAMP(),20);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','CPF','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"15\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Cpf',UNIX_TIMESTAMP(),23);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Data de Nascimento','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"10\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'DataNascimento',UNIX_TIMESTAMP(),25);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Empresa','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:3:\"250\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',0,1,'CompanyName',UNIX_TIMESTAMP(),30);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Telefone','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"20\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Phone',UNIX_TIMESTAMP(),40);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Cep','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"10\";s:5:\"class\";s:25:\"Textbox Field130 buscaCep\";s:5:\"style\";s:0:\"\";}',1,1,'Zip',UNIX_TIMESTAMP(),50);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Endere�o','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'AddressLine1',UNIX_TIMESTAMP(),60);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','N�mero','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"10\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Numero',UNIX_TIMESTAMP(),70);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Complemento','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"70\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Complemento',UNIX_TIMESTAMP(),80);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Bairro','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"70\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Bairro',UNIX_TIMESTAMP(),90);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Cidade','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"95\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'City',UNIX_TIMESTAMP(),100);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleselect','Pa�s','','a:4:{s:5:\"class\";s:8:\"Field160\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:16:\"Choose a Country\";s:7:\"options\";a:0:{}}',1,1,'Country',UNIX_TIMESTAMP(),110);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'selectortext','Estado','','a:6:{s:5:\"class\";s:8:\"Field160\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:14:\"Choose a State\";s:7:\"options\";a:0:{}s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}',1,1,'State',UNIX_TIMESTAMP(),120);

INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Nome','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:3:\"250\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'FirstName',UNIX_TIMESTAMP(),10);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Sobrenome','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:3:\"250\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'LastName',UNIX_TIMESTAMP(),20);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','CPF','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"15\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Cpf',UNIX_TIMESTAMP(),23);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Data de Nascimento','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"10\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'DataNascimento',UNIX_TIMESTAMP(),25);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Empresa','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:3:\"250\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',0,1,'CompanyName',UNIX_TIMESTAMP(),30);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Telefone','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"20\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Phone',UNIX_TIMESTAMP(),40);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Cep','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"10\";s:5:\"class\";s:25:\"Textbox Field130 buscaCep\";s:5:\"style\";s:0:\"\";}',1,1,'Zip',UNIX_TIMESTAMP(),50);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Endere�o','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field230\";s:5:\"style\";s:0:\"\";}',1,1,'AddressLine1',UNIX_TIMESTAMP(),60);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','N�mero','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"10\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Numero',UNIX_TIMESTAMP(),70);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Complemento','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"70\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Complemento',UNIX_TIMESTAMP(),80);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Bairro','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"70\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'Bairro',UNIX_TIMESTAMP(),90);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Cidade','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:2:\"95\";s:5:\"class\";s:16:\"Textbox Field130\";s:5:\"style\";s:0:\"\";}',1,1,'City',UNIX_TIMESTAMP(),100);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleselect','Pa�s','','a:4:{s:5:\"class\";s:8:\"Field160\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:16:\"Choose a Country\";s:7:\"options\";a:0:{}}',1,1,'Country',UNIX_TIMESTAMP(),110);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'selectortext','Estado','','a:6:{s:5:\"class\";s:8:\"Field160\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:14:\"Choose a State\";s:7:\"options\";a:0:{}s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}',1,1,'State',UNIX_TIMESTAMP(),120);

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%formsessions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%formsessions` (
  `formsessionid` int(10) unsigned NOT NULL auto_increment,
  `formsessiondate` int (10) unsigned NOT NULL default '0',
  `formsessionformidx` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`formsessionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%formfieldsessions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%formfieldsessions` (
  `formfieldsessioniformsessionid` int(10) unsigned NOT NULL default '0',
  `formfieldfieldid` int(10) unsigned NOT NULL default '0',
  `formfieldformid` int(10) unsigned NOT NULL default '0',
  `formfieldfieldtype` varchar(50) NOT NULL default '',
  `formfieldfieldlabel` varchar(255) NOT NULL default '',
  `formfieldfieldvalue` TEXT,
  PRIMARY KEY  (`formfieldsessioniformsessionid`, `formfieldfieldid`),
  KEY `i_formfieldsessions_formfieldsessioniformsessionid` (`formfieldsessioniformsessionid`),
  KEY `i_formfieldsessions_formfieldfieldid` (`formfieldfieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%gift_certificate_history`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%gift_certificate_history` (
  `historyid` int(10) NOT NULL auto_increment,
  `histgiftcertid` int(10) NOT NULL default '0',
  `historderid` int(10) NOT NULL default '0',
  `histcustomerid` int(10) NOT NULL default '0',
  `histbalanceused` decimal(20,4) NOT NULL default '0.0000',
  `histbalanceremaining` decimal(20,4) NOT NULL default '0.0000',
  `historddate` int(10) NOT NULL default '0',
  PRIMARY KEY  (`historyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%gift_certificates`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%gift_certificates` (
  `giftcertid` int(10) NOT NULL auto_increment,
  `giftcertcode` varchar(20) NOT NULL default '',
  `giftcertto` varchar(100) NOT NULL default '',
  `giftcerttoemail` varchar(100) NOT NULL default '',
  `giftcertfrom` varchar(100) NOT NULL default '',
  `giftcertfromemail` varchar(100) NOT NULL default '',
  `giftcertcustid` int(10) NOT NULL default '0',
  `giftcertamount` decimal(20,4) NOT NULL default '0',
  `giftcertbalance` decimal(20,4) NOT NULL default '0',
  `giftcertstatus` int(1) NOT NULL default '0',
  `giftcerttemplate` varchar(50) NOT NULL default '',
  `giftcertmessage` varchar(250) NOT NULL default '',
  `giftcertpurchasedate` int(10) NOT NULL default '0',
  `giftcertexpirydate` int(10) NOT NULL default '0',
  `giftcertorderid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`giftcertid`),
  UNIQUE KEY `u_gift_certificates` (`giftcertcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%module_vars`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%module_vars` (
  `variableid` int(11) NOT NULL auto_increment,
  `modulename` varchar(100) NOT NULL default '',
  `variablename` varchar(100) NOT NULL default '',
  `variableval` text,
  PRIMARY KEY  (`variableid`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


-- Default settings for comment system

INSERT INTO `%%PREFIX%%module_vars` (`modulename`, `variablename`, `variableval`) VALUES ('comments_builtincomments', 'is_setup', '1');
INSERT INTO `%%PREFIX%%module_vars` (`modulename`, `variablename`, `variableval`) VALUES ('comments_builtincomments', 'commenttypes', '1');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%news`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%news` (
  `newsid` int(11) NOT NULL auto_increment,
  `newstitle` varchar(250) NOT NULL default '',
  `newscontent` longtext,
  `newsdate` int(11) NOT NULL default '0',
  `newsvisible` tinyint(4) NOT NULL default '0',
  `newssearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`newsid`),
  KEY `i_news_date_vis` (`newsdate`, `newsvisible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%news_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%news_search` (
  `newssearchid` int(11) NOT NULL auto_increment,
  `newsid` int(11) NOT NULL default '0',
  `newstitle` varchar(255) NOT NULL default '',
  `newscontent` longtext NOT NULL,
  `newssearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`newssearchid`),
  KEY `i_news_search_newsid` (`newsid`),
  FULLTEXT KEY `newstitle` (`newstitle`,`newscontent`,`newssearchkeywords`),
  FULLTEXT KEY `newstitle2` (`newstitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%news_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%news_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `newsid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_coupons`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_coupons` (
  `ordcoupid` int(11) NOT NULL auto_increment,
  `ordcouporderid` int(11) NOT NULL default '0',
  `ordcoupprodid` int(11) NOT NULL default '0',
  `ordcouponid` int(11) NOT NULL default '0',
  `ordcouponcode` varchar(50) NOT NULL default '',
  `ordcouponamount` varchar(50) NOT NULL default '',
  `ordcoupontype` tinyint(4) NOT NULL default '0',
  `applied_discount` decimal(20, 4) NOT NULL default '0',
  PRIMARY KEY  (`ordcoupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_downloads`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_downloads` (
  `orddownid` int(11) NOT NULL auto_increment,
  `orderid` int(11) NOT NULL default '0',
  `downloadid` int(11) NOT NULL default '0',
  `numdownloads` int(11) NOT NULL default '0',
  `downloadexpires` int unsigned NOT NULL default '0',
  `maxdownloads` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`orddownid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_messages`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_messages` (
  `messageid` int(11) NOT NULL auto_increment,
  `messagefrom` enum('customer','admin') NOT NULL default 'customer',
  `subject` varchar(255) NOT NULL default '',
  `message` longtext,
  `datestamp` int(11) NOT NULL default '0',
  `messageorderid` int(11) NOT NULL default '0',
  `messagestatus` enum('read','unread') NOT NULL default 'read',
  `staffuserid` int(11) NOT NULL default '0',
  `isflagged` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`messageid`),
  KEY `i_order_mesages_messageorderid` (`messageorderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_products`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_products` (
  `orderprodid` int(11) NOT NULL auto_increment,
  `ordprodsku` varchar(250) NOT NULL default '',
  `ordprodname` varchar(250) NOT NULL default '',
  `ordprodtype` enum('physical','digital','giftcertificate') NOT NULL default 'physical',
  `base_price` decimal(20, 4) NOT NULL default '0',
  `price_ex_tax` decimal(20,4) NOT NULL default '0',
  `price_inc_tax` decimal(20,4) NOT NULL default '0',
  `price_tax` decimal(20,4) NOT NULL default '0',
  `base_total` decimal(20, 4) NOT NULL default '0',
  `total_ex_tax` decimal(20,4) NOT NULL default '0',
  `total_inc_tax` decimal(20,4) NOT NULL default '0',
  `total_tax` decimal(20,4) NOT NULL default '0',
  `ordprodweight` double NOT NULL default '0',
  `ordprodqty` smallint(6) NOT NULL default '0',
  `orderorderid` int(11) NOT NULL default '0',
  `ordprodid` int(11) NOT NULL default '0',
  `base_cost_price` decimal(20, 4) NOT NULL default '0',
  `cost_price_inc_tax` decimal(20,4) NOT NULL default '0',
  `cost_price_ex_tax` decimal(20,4) NOT NULL default '0',
  `cost_price_tax` decimal(20,4) NOT NULL default '0',
  `ordprodrefunded` int(10) NOT NULL default '0',
  `ordprodrefundamount` decimal(20,4) NOT NULL default '0',
  `ordprodreturnid` int(10) NOT NULL default '0',
  `ordprodoptions` text,
  `ordprodvariationid` int(11) NOT NULL default '0',
  `ordprodwrapid` int unsigned NOT NULL default '0',
  `ordprodwrapname` varchar(100) NOT NULL default '',
  `base_wrapping_cost` decimal(20, 4) NOT NULL default '0.00',
  `wrapping_cost_ex_tax` decimal(20, 4) NOT NULL default '0.00',
  `wrapping_cost_inc_tax` decimal(20, 4) NOT NULL default '0.00',
  `wrapping_cost_tax` decimal(20, 4) NOT NULL default '0.00',
  `ordprodwrapmessage` text NULL,
  `ordprodqtyshipped` int unsigned NOT NULL default '0',
  `ordprodeventname` VARCHAR(255),
  `ordprodeventdate` INT(9),
  `ordprodfixedshippingcost` decimal(20,4) NOT NULL default '0',
  `order_address_id` int unsigned NOT NULL default '0',
  `ebay_item_id` varchar(19) NOT NULL default '',
  `applied_discounts` text,
  PRIMARY KEY  (`orderprodid`),
  KEY `i_order_products_orderid_prodid` (`orderorderid`, `ordprodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_status`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_status` (
  `statusid` int(11) NOT NULL auto_increment,
  `statusdesc` varchar(100) NOT NULL default '',
  `statusorder` int(11) NOT NULL default 0,
  PRIMARY KEY  (`statusid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


--
-- Data for table `%%PREFIX%%order_status`
--

TRUNCATE `%%PREFIX%%order_status`;
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (1, 'Pendente', 1);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (2, 'Enviado', 8);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (3, 'Parcialmente Enviado', 6);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (4, 'Reembolsado', 11);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (5, 'Cancelado', 9);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (6, 'Recusado', 10);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (7, 'Aguardando Pagamento', 2);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (8, 'Aguardando Captura', 5);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (9, 'Aguardando Envio', 4);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (10, 'Finalizado', 7);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (11, 'Aguardando Cumprimento', 3);

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%orders`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%orders` (
  `orderid` int(11) NOT NULL auto_increment,
  `ordtoken` varchar(32) NOT NULL default '0',
  `ordcustid` int(11) NOT NULL default '0',
  `orddate` int(11) NOT NULL default '0',
  `ordlastmodified` int(11) NOT NULL default '0',
  `ebay_order_id` varchar(19) NOT NULL default '0',
  `subtotal_ex_tax` decimal(20,4) NOT NULL default '0',
  `subtotal_inc_tax` decimal(20,4) NOT NULL default '0',
  `subtotal_tax` decimal(20,4) NOT NULL default '0',
  `total_tax` decimal(20,4) NOT NULL default '0',
  `base_shipping_cost` decimal(20,4) NOT NULL default '0',
  `shipping_cost_ex_tax` decimal(20,4) NOT NULL default '0',
  `shipping_cost_inc_tax` decimal(20,4) NOT NULL default '0',
  `shipping_cost_tax` decimal(20,4) NOT NULL default '0',
  `shipping_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
  `base_handling_cost` decimal(20,4) NOT NULL default '0',
  `handling_cost_ex_tax` decimal(20,4) NOT NULL default '0',
  `handling_cost_inc_tax` decimal(20,4) NOT NULL default '0',
  `handling_cost_tax` decimal(20,4) NOT NULL default '0',
  `handling_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
  `base_wrapping_cost` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_inc_tax` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_ex_tax` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_tax` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
  `total_ex_tax` decimal(20,4) NOT NULL default '0',
  `total_inc_tax` decimal(20,4) NOT NULL default '0',
  `ordstatus` smallint(6) NOT NULL default '0',
  `ordtotalqty` int unsigned NOT NULL default '0',
  `ordtotalshipped` int unsigned NOT NULL default '0',
  `orderpaymentmethod` varchar(100) NOT NULL default '',
  `orderpaymentmodule` varchar(100) NOT NULL default '',
  `ordpayproviderid` varchar(255) DEFAULT NULL,
  `ordpaymentstatus` varchar(100) NOT NULL DEFAULT '',
  `ordrefundedamount` decimal(20, 4) NOT NULL DEFAULT 0,
  `ordbillfirstname` varchar(255) NOT NULL default '',
  `ordbilllastname` varchar(255) NOT NULL default '',
  `ordbillcompany` varchar(100) NOT NULL default '',
  `ordbillstreet1` varchar(255) NOT NULL default '',
  `ordbillstreet2` varchar(255) NOT NULL default '',
  `ordbillsuburb` varchar(100) NOT NULL default '',
  `ordbillstate` varchar(50) NOT NULL default '',
  `ordbillzip` varchar(20) NOT NULL default '',
  `ordbillcountry` varchar(50) NOT NULL default '',
  `ordbillcountrycode` varchar(2) NOT NULL default '',
  `ordbillcountryid` int(11) NOT NULL default '0',
  `ordbillstateid` int(11) NOT NULL default '0',
  `ordbillphone` varchar(50) NOT NULL default '',
  `ordbillemail` varchar(250) NOT NULL default '',
  `ordisdigital` tinyint(4) NOT NULL default '0',
  `orddateshipped` int(11) NOT NULL default '0',
  `ordstorecreditamount` decimal(20,4) NOT NULL default '0',
  `ordgiftcertificateamount` decimal(20,4) NOT NULL default '0',
  `ordinventoryupdated` int(1) NOT NULL default '0',
  `ordonlygiftcerts` tinyint(4) NOT NULL default '0',
  `extrainfo` text,
  `ordipaddress` varchar(30) NOT NULL default '',
  `ordgeoipcountry` varchar(50) NOT NULL default '',
  `ordgeoipcountrycode` varchar(2) NOT NULL default '',
  `ordcurrencyid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `orddefaultcurrencyid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `ordcurrencyexchangerate` DECIMAL(20,10) NOT NULL DEFAULT '0',
  `ordnotes` TEXT,
  `ordcustmessage` TEXT,
  `ordvendorid` int unsigned NOT NULL default '0',
  `ordformsessionid` int(11) NOT NULL default '0',
  `orddiscountamount` decimal(20, 4) NOT NULL default '0',
  `shipping_address_count` int unsigned NOT NULL default '1',
  `coupon_discount` decimal(20, 4) NOT NULL default '0',
  `billing_adress_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`orderid`),
  KEY `i_orders_ordcustid` (`ordcustid`),
  KEY `i_orders_orderid_ordstatus` (`orderid`,`ordstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%pages`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%pages` (
  `pageid` int(11) NOT NULL auto_increment,
  `pagetitle` varchar(250) NOT NULL default '',
  `pagemetatitle` varchar(250) NOT NULL default '',
  `pagelink` varchar(250) NOT NULL default '',
  `pagefeed` varchar(250) NOT NULL default '',
  `pageemail` varchar(250) NOT NULL default '',
  `pagecontent` longtext,
  `pagestatus` tinyint(4) NOT NULL default '0',
  `pageparentid` int(11) NOT NULL default '0',
  `pagesort` int(11) NOT NULL default '0',
  `pagekeywords` text,
  `pagedesc` text,
  `pagetype` tinyint(4) NOT NULL default '0',
  `pagecontactfields` varchar(100) NOT NULL,
  `pagemetakeywords` varchar(250) NOT NULL default '',
  `pagemetadesc` varchar(250) NOT NULL default '',
  `pageishomepage` tinyint(4) NOT NULL default '0',
  `pagelayoutfile` varchar(50) NOT NULL default '',
  `pageparentlist` text,
  `pagecustomersonly` tinyint(1) NOT NULL default '0',
  `pagevendorid` int unsigned NOT NULL default '0',
  `page_enable_optimizer` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `pagensetleft` int(11) unsigned NOT NULL default '0',
  `pagensetright` int(11) unsigned NOT NULL default '0',
  `pagesearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pageid`),
  KEY `i_pageid_pagensetleft_pagensetright` (`pageid`,`pagensetleft`,`pagensetright`),
  KEY `i_pagensetleft` (`pagensetleft`),
  KEY `i_pageparentid_pagesort_pagetitle` (`pageparentid`,`pagesort`,`pagetitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%page_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%page_search` (
  `pagesearchid` int(11) NOT NULL auto_increment,
  `pageid` int(11) NOT NULL default '0',
  `pagetitle` varchar(255) NOT NULL default '',
  `pagecontent` longtext NOT NULL,
  `pagedesc` text NOT NULL,
  `pagesearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pagesearchid`),
  KEY `i_page_search_pageid` (`pageid`),
  FULLTEXT KEY `pagetitle` (`pagetitle`,`pagecontent`,`pagedesc`,`pagesearchkeywords`),
  FULLTEXT KEY `pagetitle2` (`pagetitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%page_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%page_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `pageid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%permissions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%permissions` (
  `pk_permid` int(11) NOT NULL auto_increment,
  `permuserid` int(11) NOT NULL default '0',
  `permpermissionid` mediumint(6) NOT NULL default '0',
  PRIMARY KEY  (`pk_permid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_customfields`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_customfields` (
  `fieldid` int(11) NOT NULL auto_increment,
  `fieldprodid` int(11) NOT NULL default '0',
  `fieldname` varchar(250) NOT NULL default '',
  `fieldvalue` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_downloads`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_downloads` (
  `downloadid` int(11) NOT NULL auto_increment,
  `prodhash` varchar(32) NOT NULL default '',
  `productid` int(11) NOT NULL default '0',
  `downfile` varchar(200) NOT NULL default '',
  `downdateadded` int(11) NOT NULL default '0',
  `downmaxdownloads` int(11) NOT NULL default '0',
  `downexpiresafter` int(11) NOT NULL default '0',
  `downfilesize` int(11) NOT NULL default '0',
  `downname` varchar(200) NOT NULL default '',
  `downdescription` text,
  PRIMARY KEY  (`downloadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_images`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_images` (
  `imageid` int(11) NOT NULL auto_increment,
  `imageprodid` int(11) NOT NULL default '0',
  `imageprodhash` varchar(32) NOT NULL default '',
  `imagefile` varchar(255) NOT NULL default '',
  `imageisthumb` tinyint(4) NOT NULL default '0',
  `imagesort` int(11) NOT NULL default '0',
  `imagefiletiny` varchar(255) default '',
  `imagefilethumb` varchar(255) default '',
  `imagefilestd` varchar(255) default '',
  `imagefilezoom` varchar(255) default '',
  `imagedesc` longtext,
  `imagedateadded` int(11) default '0',
  `imagefiletinysize` varchar(11) default '',
  `imagefilethumbsize` varchar(11) default '',
  `imagefilestdsize` varchar(11) default '',
  `imagefilezoomsize` varchar(11) default '',
  PRIMARY KEY  (`imageid`),
  KEY `i_product_images_imageprodid` (`imageprodid`, `imageisthumb`),
  KEY `i_product_images_imageprodid_imagesort_imageprodhash` (`imageprodid`,`imagesort`,`imageprodhash`),
  KEY `i_product_images_imageid_imageprodid_imageprodhash` (`imageid`,`imageprodid`,`imageprodhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_related_byviews`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_related_byviews` (
  `prodida` int(10) unsigned NOT NULL,
  `prodidb` int(10) unsigned NOT NULL,
  `relevance` int(10) unsigned NOT NULL,
  `lastview` int(10) unsigned NOT NULL,
  PRIMARY KEY (`prodida`,`prodidb`),
  KEY `i_prodida_relevance` (`prodida`,`relevance`),
  KEY `i_prodidb` (`prodidb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_search` (
  `productsearchid` int(11) NOT NULL auto_increment,
  `productid` int(11) NOT NULL default '0',
  `prodname` varchar(250) NOT NULL default '',
  `prodcode` varchar(250) NOT NULL default '',
  `proddesc` longtext,
  `prodsearchkeywords` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`productsearchid`),
  KEY `i_product_search_productid` (`productid`),
  KEY `i_product_search_prodcode` (`prodcode`),
  FULLTEXT KEY `prodname` (`prodname`,`prodcode`,`proddesc`,`prodsearchkeywords`),
  FULLTEXT KEY `prodname2` (`prodname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_variation_combinations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_variation_combinations` (
  `combinationid` int(11) NOT NULL auto_increment,
  `vcproductid` int(11) NOT NULL default '0',
  `vcproducthash` varchar(32) NOT NULL default '',
  `vcvariationid` int(11) NOT NULL default '0',
  `vcenabled` tinyint(4) NOT NULL default '1',
  `vcoptionids` varchar(100) NOT NULL default '',
  `vcsku` varchar(50) NOT NULL default '',
  `vcpricediff` enum('','add','subtract','fixed') NOT NULL default '',
  `vcprice` decimal(20,4) NOT NULL default '0',
  `vcweightdiff` enum('','add','subtract','fixed') NOT NULL default '',
  `vcweight` decimal(20,4) NOT NULL default '0',
  `vcimage` varchar(100) NOT NULL default '',
  `vcimagezoom` varchar(100) NOT NULL default '',
  `vcimagestd` varchar(100) NOT NULL default '',
  `vcimagethumb` varchar(100) NOT NULL default '',
  `vcstock` int(11) NOT NULL default '0',
  `vclowstock` int(11) NOT NULL default '0',
  `vclastmodified` int(10) NOT NULL default '0',
  PRIMARY KEY  (`combinationid`),
  KEY `i_product_variation_combinations_vcvariationid` (`vcvariationid`),
  KEY `i_product_variation_combinations_vcproductid` (`vcproductid`),
  KEY `i_product_variation_combinations_vcproducthash` (`vcproducthash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_variation_options`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_variation_options` (
  `voptionid` int(11) NOT NULL auto_increment,
  `vovariationid` int(11) NOT NULL default '0',
  `voname` varchar(255) NOT NULL default '',
  `vovalue` text,
  `vooptionsort` int(11) NOT NULL default '0',
  `vovaluesort` int(11) NOT NULL default '0',
  PRIMARY KEY  (`voptionid`),
  KEY `i_product_variation_options_vovariationid` (`vovariationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_variations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_variations` (
  `variationid` int(11) NOT NULL auto_increment,
  `vname` varchar(100) NOT NULL default '',
  `vnumoptions` int(11) NOT NULL default '0',
  `vvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`variationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_views`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_views` (
  `session` char(32) NOT NULL,
  `product` int(10) unsigned NOT NULL,
  `lastview` int(10) unsigned NOT NULL,
  PRIMARY KEY (`session`,`product`),
  KEY `i_session_lastview` (`session`,`lastview`),
  KEY `i_product` (`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `productid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%picniktokens`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%picniktokens` (
  `picniktokenid` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) NOT NULL,
  `imagetype` tinyint(3) unsigned NOT NULL,
  `imageid` varchar(255) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `sessionid` char(26) NOT NULL,
  PRIMARY KEY (`picniktokenid`),
  KEY `i_sessionid_imagetype_imageid` (`sessionid`,`imagetype`,`imageid`),
  KEY `i_picniktokenid_hash` (`picniktokenid`,`hash`),
  KEY `i_created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%products`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%products` (
  `productid` int(11) NOT NULL auto_increment,
  `prodname` varchar(250) NOT NULL default '',
  `prodtype` smallint(6) NOT NULL default '0',
  `prodcode` varchar(250) NOT NULL default '',
  `prodfile` varchar(250) NOT NULL default '',
  `proddesc` longtext,
  `prodsearchkeywords` varchar(250) NOT NULL default '',
  `prodavailability` varchar(250) NOT NULL default '',
  `prodprice` decimal(20,4) NOT NULL default '0',
  `prodcostprice` decimal(20,4) NOT NULL default '0',
  `prodretailprice` decimal(20,4) NOT NULL default '0',
  `prodsaleprice` decimal(20,4) NOT NULL default '0',
  `prodcalculatedprice` decimal(20,4) NOT NULL default '0',
  `prodsortorder` int(11) NOT NULL default '0',
  `prodvisible` tinyint(4) NOT NULL default '0',
  `prodfeatured` tinyint(4) NOT NULL default '0',
  `prodvendorfeatured` tinyint(1) NOT NULL default '0',
  `prodrelatedproducts` varchar(250) NOT NULL default '',
  `prodcurrentinv` int(11) NOT NULL default '0',
  `prodlowinv` int(11) NOT NULL default '0',
  `prodoptionsrequired` tinyint(4) NOT NULL default '0',
  `prodwarranty` text,
  `prodweight` decimal(20,4) NOT NULL default '0',
  `prodwidth` decimal(20,4) NOT NULL default '0',
  `prodheight` decimal(20,4) NOT NULL default '0',
  `proddepth` decimal(20,4) NOT NULL default '0',
  `prodfixedshippingcost` decimal(20,4) NOT NULL default '0',
  `prodfreeshipping` tinyint(4) NOT NULL default '0',
  `prodinvtrack` tinyint(4) NOT NULL default '0',
  `prodratingtotal` int(11) NOT NULL default '0',
  `prodnumratings` int(11) NOT NULL default '0',
  `prodnumsold` int(11) NOT NULL default '0',
  `proddateadded` int(11) NOT NULL default '0',
  `prodbrandid` int(11) NOT NULL default '0',
  `prodnumviews` int(11) NOT NULL default '0',
  `prodpagetitle` varchar(250) NOT NULL default '',
  `prodmetakeywords` text,
  `prodmetadesc` text,
  `prodlayoutfile` varchar(50) NOT NULL default '',
  `prodvariationid` int(11) NOT NULL default '0',
  `prodallowpurchases` int(1) NOT NULL default '1',
  `prodhideprice` int(1) NOT NULL default '0',
  `prodcallforpricinglabel` varchar(200) NOT NULL default '',
  `prodcatids` text NOT NULL,
  `prodlastmodified` int unsigned NOT NULL default '0',
  `prodvendorid` int unsigned NOT NULL default '0',
  `prodhastags` int(1) NOT NULL default '0',
  `prodwrapoptions` text NULL,
  `prodconfigfields` varchar(255) NOT NULL default '',
  `prodeventdaterequired` tinyint(4),
  `prodeventdatefieldname` varchar(255),
  `prodeventdatelimited` tinyint(4),
  `prodeventdatelimitedtype` tinyint(4),
  `prodeventdatelimitedstartdate` int(9),
  `prodeventdatelimitedenddate` int(9),
  `prodmyobasset` VARCHAR(20) NOT NULL default '',
  `prodmyobincome` VARCHAR(20) NOT NULL default '',
  `prodmyobexpense` VARCHAR(20) NOT NULL default '',
  `prodpeachtreegl` VARCHAR(20) NOT NULL default '',
  `prodcondition` enum('New','Used','Refurbished') NOT NULL default 'New',
  `prodshowcondition` tinyint(1) unsigned NOT NULL default '0',
  `product_enable_optimizer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prodpreorder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prodreleasedate` int(11) NOT NULL DEFAULT '0',
  `prodreleasedateremove` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prodpreordermessage` varchar(250) NOT NULL default '',
  `prodminqty` int(10) UNSIGNED NOT NULL default '0',
  `prodmaxqty` int(10) UNSIGNED NOT NULL default '0',
  `tax_class_id` int unsigned NOT NULL default '0',
  `opengraph_type` varchar(15) NOT NULL default 'product',
  `opengraph_title` varchar(250) NOT NULL default '',
  `opengraph_use_product_name` tinyint(1) unsigned NOT NULL default '1',
  `opengraph_description` text,
  `opengraph_use_meta_description` tinyint(1) unsigned NOT NULL default '1',
  `opengraph_use_image` tinyint(1) unsigned NOT NULL default '1',
  `upc` VARCHAR(32) default '',
  `disable_google_checkout` int(1) NOT NULL default '0',
  PRIMARY KEY  (`productid`),
  KEY `i_products_brand_vis` (`prodbrandid`, `prodvisible`),
  UNIQUE KEY `u_products_prodname` (`prodname`),
  KEY `i_products_prodnumsold` (`prodnumsold`),
  KEY `i_products_feature_vis` (`prodfeatured`, `prodvisible`),
  KEY `i_products_rating_vis` (`prodvisible`, `prodratingtotal`),
  KEY `i_products_added_vis` (`prodvisible`, `proddateadded`),
  KEY `i_products_hideprice_vis` (`prodhideprice`, `prodvisible`),
  KEY `i_products_sortorder_vis` (`prodvisible`, `prodsortorder`, `prodname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%returns`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%returns` (
  `returnid` int(10) NOT NULL auto_increment,
  `retorderid` int(10) NOT NULL default '0',
  `retcustomerid` int(10) NOT NULL default '0',
  `retprodid` int(10) NOT NULL default '0',
  `retprodvariationid` INT( 11 ) NOT NULL default '0',
  `retprodoptions` text,
  `retprodname` varchar(200) NOT NULL default '',
  `retprodcost` decimal(20,4) NOT NULL default '0',
  `retprodqty` int(1) NOT NULL default '1',
  `retstatus` int(1) NOT NULL default '0',
  `retreason` varchar(200) NOT NULL default '',
  `retaction` varchar(200) NOT NULL default '',
  `retdaterequested` int(10) NOT NULL default '0',
  `retcomment` text,
  `retuserid` int(10) NOT NULL default '0',
  `retreceivedcredit` int(1) NOT NULL default '0',
  `retordprodid` int(10) NOT NULL default '0',
  `retstaffnotes` text,
  `retvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`returnid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%reviews`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%reviews` (
  `reviewid` int(11) NOT NULL auto_increment,
  `revproductid` int(11) NOT NULL default '0',
  `revfromname` varchar(100) NOT NULL default '',
  `revdate` int(11) NOT NULL default '0',
  `revrating` smallint(6) NOT NULL default '0',
  `revtext` text,
  `revtitle` varchar(250) NOT NULL default '',
  `revstatus` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`reviewid`),
  KEY `i_reviews_revproductid` (`revproductid`),
  FULLTEXT KEY `ft_reviews_text_title_from` (`revtext`,`revtitle`,`revfromname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%search_corrections`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%search_corrections` (
  `correctionid` int(11) NOT NULL auto_increment,
  `correctiontype` enum('correction','recommendation') NOT NULL default 'correction',
  `correction` varchar(250) NOT NULL default '',
  `numresults` int(11) NOT NULL default '0',
  `oldsearchtext` varchar(250) NOT NULL default '',
  `oldnumresults` int(11) NOT NULL default '0',
  `correctdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`correctionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%searches`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%searches` (
  `searchid` int(11) NOT NULL auto_increment,
  `searchtext` text,
  `numsearches` int(11) NOT NULL default '0',
  PRIMARY KEY  (`searchid`),
  FULLTEXT KEY `searchtext` (`searchtext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%searches_extended`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%searches_extended` (
  `searchid` int(11) NOT NULL auto_increment,
  `searchtext` text,
  `numresults` int(11) NOT NULL default '0',
  `searchdate` int(11) NOT NULL default '0',
  `clickthru` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`searchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%sessions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%sessions` (
  `sessionhash` varchar(32) NOT NULL default '',
  `sessdata` longtext,
  `sesslastupdated` int(10) NOT NULL default '0',
  UNIQUE KEY  (`sessionhash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%shipping_addresses`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_addresses` (
  `shipid` int(11) NOT NULL auto_increment,
  `shipcustomerid` int(11) NOT NULL default '0',
  `shipfirstname` varchar(255) NOT NULL default '',
  `shiplastname` varchar(255) NOT NULL default '',
  `shipcompany` varchar(255) NOT NULL default '',
  `shipaddress1` text,
  `shipaddress2` text,
  `shipcity` varchar(100) NOT NULL default '',
  `shipstate` varchar(100) NOT NULL default '',
  `shipzip` varchar(30) NOT NULL default '',
  `shipcountry` varchar(100) NOT NULL default '',
  `shipphone` varchar(50) NOT NULL default '',
  `shipstateid` int(11) NOT NULL default '0',
  `shipcountryid` int(11) NOT NULL default '0',
  `shipdestination` enum('residential','commercial') NOT NULL default 'residential',
  `shiplastused` int(11) NOT NULL default '0',
  `shipformsessionid` int(11) NOT NULL default '0',
  `shipdatanascimento` varchar(10) NOT NULL default '',
  `shipnumero` varchar(10) NOT NULL default '',
  `shipcomplemento` varchar(70) NOT NULL default '',
  `shipbairro` varchar(70) NOT NULL default '',
  `shipcpf` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`shipid`),
  KEY `i_shipping_addresses_shipcustomerid` (`shipcustomerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%subscribers`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%subscribers` (
  `subscriberid` int(11) NOT NULL auto_increment,
  `subemail` varchar(250) NOT NULL default '',
  `subfirstname` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`subscriberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%system_log`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%system_log` (
  `logid` int(11) NOT NULL auto_increment,
  `logtype` enum('general','php','sql','shipping','payment','notification','emailintegration','ebay', 'shoppingcomparison') default NULL,
  `logmodule` varchar(100) NOT NULL default '',
  `logseverity` int(1) NOT NULL default '4',
  `logsummary` varchar(250) NOT NULL  default '',
  `logmsg` longtext,
  `logdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%tasks`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%tasks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `queue` varchar(128) NOT NULL,
  `class` varchar(255) NOT NULL default '',
  `data` text,
  `time` int(10) unsigned NOT NULL default '0',
  `reservation` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `queue_reservation_time` (`queue`,`reservation`,`time`),
  KEY `reservation_time` (`reservation`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%task_status`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%task_status` (
  `id` int(10) unsigned NOT NULL,
  `queue` varchar(128) NOT NULL,
  `class` varchar(255) NOT NULL default '',
  `data` text,
  `begin` int(10) unsigned NOT NULL default '0',
  `success` tinyint(1) NOT NULL default '0',
  `message` text,
  `end` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `time` (`begin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%unique_visitors`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%unique_visitors` (
  `uniqueid` int(11) NOT NULL auto_increment,
  `datestamp` int(11) NOT NULL default '0',
  `numuniques` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%users`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%users` (
  `pk_userid` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '',
  `userpass` varchar(50) NOT NULL default '',
  `userfirstname` varchar(50) NOT NULL default '',
  `userlastname` varchar(50) NOT NULL default '',
  `userstatus` tinyint(1) NOT NULL default '0',
  `useremail` varchar(250) NOT NULL default '',
  `token` varchar(50) NOT NULL default '',
  `usertoken` varchar(50) NOT NULL default '',
  `userapi` tinyint(4) NOT NULL default '0',
  `uservendorid` int unsigned NOT NULL default '0',
  `userrole` varchar(20) NOT NULL default 'custom',
  `salt` varchar(16) NOT NULL default '',
  `updated` int(11) NOT NULL default '0',
  `last_login` int(11) NOT NULL default '0',
  `attempt_counter` smallint(2) NOT NULL default '0',
  `attempt_lockout` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pk_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%user_password_histories`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%user_password_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `salt` varchar(16) NOT NULL default '',
  `password` varchar(50) NOT NULL default '',
  `updated` int(11) NOT NULL default '0',
  PRIMARY KEY (`id`),
  INDEX (`user_id`, `updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%user_password_reset_tokens`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%user_password_reset_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL default '',
  `expiry` int(11) NOT NULL default '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY  (`token`),
  INDEX (`user_id`, `expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%wishlists`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%wishlists` (
 `wishlistid` int(11) NOT NULL auto_increment,
  `customerid` int(11) NOT NULL,
  `wishlistname` varchar(255) NOT NULL,
  `ispublic` tinyint(4) NOT NULL,
  `wishlisttoken` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`wishlistid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


--
-- Table structure for table `%%PREFIX%%wishlist_items`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%wishlist_items` (
  `wishlistitemid` int(11) NOT NULL auto_increment,
  `wishlistid` int(11) NOT NULL,
  `productid` int(11) NOT NULL default '0',
  `variationid` int(11) NULL,
  PRIMARY KEY  (`wishlistitemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


DELETE FROM `%%PREFIX%%users` WHERE username='admin';
INSERT INTO `%%PREFIX%%users`(pk_userid, username, userpass, userstatus, token, usertoken, userapi, useremail,userrole) values(0, 'admin', '', '1', '%%TOKEN%%', '', '0', '%%EMAIL%%','admin');

--
-- Create the default returns & shipping page
--

INSERT INTO `%%PREFIX%%pages` (`pagetitle`, `pagelink`, `pagefeed`, `pageemail`, `pagecontent`, `pagestatus`, `pageparentid`, `pagesort`, `pagekeywords`, `pagedesc`, `pagetype`, `pagecontactfields`, `pagemetakeywords`, `pagemetadesc`, `pageishomepage`, `pagelayoutfile`, `pageparentlist`) VALUES ('RSS Syndication','', '', '', '%%Syndicate%%',1, 0, 3, '', '', 0, '', '', '', 0, '', 0);

INSERT INTO `%%PREFIX%%pages` (`pageid`, `pagetitle`, `pagelink`, `pagefeed`, `pageemail`, `pagecontent`, `pagestatus`, `pageparentid`, `pagesort`, `pagekeywords`, `pagedesc`, `pagetype`, `pagecontactfields`, `pagemetakeywords`, `pagemetadesc`, `pageishomepage`, `pagelayoutfile`, `pageparentlist`) VALUES (0, 'Shipping & Returns', 'http://', 'http://', '', '<em>To edit this page simply login to the control panel, click the <strong style="font-weight: 400">Website Content</strong> tab and choose the </em> <strong style="font-weight: 400"><em>View Web Pages option. Click Edit next to the Shipping & Returns page and you can change this text. A sample returns policy is shown below which you can edit as needed.</em><em style="font-style: normal"><br/><br/></em></strong><em style="font-style: normal"><strong>Returns Policy</strong></em><strong style="font-weight: 400"></em></em><em style="font-style: normal"><br/><br/></em>You may return most new, unopened items within 30 days of delivery for a full refund. We''ll also pay the return shipping costs if the return is a result of our error (you received an incorrect or defective item, etc.).<br/><br/>You should expect to receive your refund within four weeks of giving your package to the return shipper, however, in many cases you will receive a refund more quickly. This time period includes the transit time for us to receive your return from the shipper (5 to 10 business days), the time it takes us to process your return once we receive it (3 to 5 business days), and the time it takes your bank to process our refund request (5 to 10 business days).<br/><br/>If you need to return an item, simply login to your account, view the order using the "Complete Orders" link under the My Account menu and click the Return Item(s) button. We''ll notify you via e-mail of your refund once we''ve received and processed the returned item.<br/><br/></strong><strong>Shipping</em></em></em></strong><strong style="font-weight: 400"><em style="font-style: normal"><br/><br/></em>We can ship to virtually any address in the world. Note that there are restrictions on some products, and some products cannot be shipped to international destinations.<br/><br/>When you place an order, we will estimate shipping and delivery dates for you based on the availability of your items and the shipping options you choose. Depending on the shipping provider you choose, shipping date estimates may appear on the shipping quotes page.<br/><br/>Please also note that the shipping rates for many items we sell are weight-based. The weight of any such item can be found on its detail page. To reflect the policies of the shipping companies we use, all weights will be rounded up to the next full pound.<br/>', 1, 0, 2, '', '', 0, '', '', '', 0, 'page.html', '0');



INSERT INTO `%%PREFIX%%page_search` (`pagesearchid`, `pageid`, `pagetitle`, `pagecontent`, `pagedesc`, `pagesearchkeywords`) VALUES (1,1,'RSS Syndication','%%Syndicate%%','','');

INSERT INTO `%%PREFIX%%page_search` (`pagesearchid`, `pageid`, `pagetitle`, `pagecontent`, `pagedesc`, `pagesearchkeywords`) VALUES (2,2,'Shipping & Returns','<em>To edit this page simply login to the control panel, click the <strong style=\"font-weight: 400\">Website Content</strong> tab and choose the </em> <strong style=\"font-weight: 400\"><em>View Web Pages option. Click Edit next to the Shipping & Returns page and you can change this text. A sample returns policy is shown below which you can edit as needed.</em><em style=\"font-style: normal\"><br/><br/></em></strong><em style=\"font-style: normal\"><strong>Returns Policy</strong></em><strong style=\"font-weight: 400\"></em></em><em style=\"font-style: normal\"><br/><br/></em>You may return most new, unopened items within 30 days of delivery for a full refund. We\'ll also pay the return shipping costs if the return is a result of our error (you received an incorrect or defective item, etc.).<br/><br/>You should expect to receive your refund within four weeks of giving your package to the return shipper, however, in many cases you will receive a refund more quickly. This time period includes the transit time for us to receive your return from the shipper (5 to 10 business days), the time it takes us to process your return once we receive it (3 to 5 business days), and the time it takes your bank to process our refund request (5 to 10 business days).<br/><br/>If you need to return an item, simply login to your account, view the order using the \"Complete Orders\" link under the My Account menu and click the Return Item(s) button. We\'ll notify you via e-mail of your refund once we\'ve received and processed the returned item.<br/><br/></strong><strong>Shipping</em></em></em></strong><strong style=\"font-weight: 400\"><em style=\"font-style: normal\"><br/><br/></em>We can ship to virtually any address in the world. Note that there are restrictions on some products, and some products cannot be shipped to international destinations.<br/><br/>When you place an order, we will estimate shipping and delivery dates for you based on the availability of your items and the shipping options you choose. Depending on the shipping provider you choose, shipping date estimates may appear on the shipping quotes page.<br/><br/>Please also note that the shipping rates for many items we sell are weight-based. The weight of any such item can be found on its detail page. To reflect the policies of the shipping companies we use, all weights will be rounded up to the next full pound.<br/>','','');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%customer_groups`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_groups` (
  `customergroupid` int(11) NOT NULL auto_increment,
  `groupname` varchar(255) NOT NULL,
  `discount` decimal(10,4) NOT NULL,
  `discountmethod` VARCHAR( 100 ) NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  `categoryaccesstype` enum('none','all','specific') NOT NULL,
  PRIMARY KEY  (`customergroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_group_categories` (
	`customergroupid` int(11) NOT NULL,
	`categoryid` int(11) NOT NULL,
	PRIMARY KEY  (`customergroupid`,`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS %%PREFIX%%transactions (
	id int unsigned not null auto_increment PRIMARY KEY,
	orderid int unsigned default NULL,
	transactionid varchar(160) default NULL,
	providerid varchar(160),
	amount DECIMAL(20, 4) NOT NULL,
	message text not null,
	status int unsigned default 0,
	transactiondate int not null,
	extrainfo text,
	KEY `i_order_transation` (orderid, transactionid),
	KEY `i_transaction_provider` (transactionid, providerid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


--
-- Table structure for table `%%PREFIX%%customer_group_discounts`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_group_discounts` (
  `groupdiscountid` INT NOT NULL AUTO_INCREMENT ,
  `customergroupid` INT NOT NULL ,
  `discounttype` ENUM( 'CATEGORY', 'PRODUCT' ) NOT NULL ,
  `catorprodid` INT NOT NULL ,
  `discountpercent` DECIMAL( 10, 4 ) NOT NULL ,
  `appliesto` ENUM( 'CATEGORY_ONLY', 'CATEGORY_AND_SUBCATS', 'NOT_APPLICABLE' ) NOT NULL ,
  `discountmethod` VARCHAR(100) NOT NULL ,
PRIMARY KEY ( `groupdiscountid` )
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_methods` (
  `methodid` int(10) unsigned NOT NULL auto_increment,
  `zoneid` int(10) unsigned NOT NULL default '0',
  `methodname` varchar(150) NOT NULL default '',
  `methodmodule` varchar(100) NOT NULL default '',
  `methodhandlingfee` decimal(20,4) NOT NULL default '0.0000',
  `methodenabled` int(1) NOT NULL default '1',
  `methodvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`methodid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_vars` (
  `variableid` int(11) NOT NULL auto_increment,
  `methodid` int(10) unsigned NOT NULL default '0',
  `zoneid` int(10) unsigned NOT NULL default '0',
  `modulename` varchar(100) NOT NULL default '',
  `variablename` varchar(100) NOT NULL default '',
  `variableval` text,
  `varvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`variableid`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_zones` (
  `zoneid` int(10) unsigned NOT NULL auto_increment,
  `zonename` varchar(100) NOT NULL default '',
  `zonetype` enum('country','state','zip') default 'country',
  `zonefreeshipping` int(1) NOT NULL default '0',
  `zonefreeshippingtotal` decimal(20,4) NOT NULL default '0.0000',
  `zonehandlingtype` enum('none','global','module') default 'none',
  `zonehandlingfee` decimal(20,4) NOT NULL default '0.0000',
  `zonehandlingseparate` int(1) NOT NULL default '1',
  `zoneenabled` int(1) NOT NULL default '1',
  `zonevendorid` int unsigned NOT NULL default '0',
  `zonedefault` int(1) NOT NULL default '0',
  PRIMARY KEY  (`zoneid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_zone_locations` (
  `locationid` int(10) unsigned NOT NULL auto_increment,
  `zoneid` int(10) unsigned NOT NULL default '0',
  `locationtype` enum('country','state','zip') default 'country',
  `locationvalueid` int(10) unsigned NOT NULL default '0',
  `locationvalue` varchar(100) NOT NULL default '0',
  `locationcountryid` int(10) unsigned NOT NULL default '0',
  `locationvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`locationid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `%%PREFIX%%vendors` (
	`vendorid` int unsigned NOT NULL auto_increment,
	`vendorname` varchar(200) NOT NULL default '',
	`vendorfriendlyname` varchar(100) NOT NULL default '',
	`vendorphone` varchar(50) NOT NULL default '',
	`vendorbio` text NOT NULL,
	`vendoraddress` varchar(200) NOT NULL default '',
	`vendorcity` varchar(100) NOT NULL default '',
	`vendorcountry` varchar(100) NOT NULL default '',
	`vendorstate` varchar(100) NOT NULL default '',
	`vendorzip` varchar(20) NOT NULL default '',
	`vendornumsales` int unsigned NOT NULL default '0',
	`vendororderemail` varchar(200) NOT NULL default '',
	`vendorshipping` int(1) NOT NULL default '0',
	`vendoremail` varchar(200) NOT NULL default '',
	`vendoraccesscats` text NULL,
	`vendorlogo` varchar(200) NOT NULL default '',
	`vendorphoto` varchar(200) NOT NULL default '',
	`vendorprofitmargin` decimal(20,4) NOT NULL default '0.00',
	PRIMARY KEY(vendorid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS %%PREFIX%%product_tags(
	 tagid INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	 tagname VARCHAR( 100 ) NOT NULL DEFAULT  '',
	 tagfriendlyname VARCHAR( 100 ) NOT NULL DEFAULT  '',
	 tagcount INT UNSIGNED NOT NULL DEFAULT  '0',
	 PRIMARY KEY ( tagid )
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS %%PREFIX%%product_tagassociations(
	 tagassocid INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	 tagid INT UNSIGNED NOT NULL DEFAULT  '0',
	 productid INT UNSIGNED NOT NULL DEFAULT  '0',
	 PRIMARY KEY ( tagassocid )
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS %%PREFIX%%gift_wrapping (
	wrapid int unsigned NOT NULL auto_increment,
	wrapname varchar(100) NOT NULL default '',
	wrapprice decimal(20, 4) NOT NULL default '0.00',
	wrapvisible int(1) NOT NULL default '0',
	wrapallowcomments int(1) NOT NULL default '0',
	wrappreview varchar(100) NOT NULL default '',
	PRIMARY KEY(wrapid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS [|PREFIX|]shipments (
	shipmentid int unsigned NOT NULL auto_increment,
	shipcustid int unsigned NOT NULL default '0',
	shipvendorid int unsigned NOT NULL default '0',
	shipdate int(11) NOT NULL default '0',
	shiptrackno varchar(50) NOT NULL default '',
	shipping_module varchar(100) NOT NULL default '',
	shipmethod varchar(100) NOT NULL default '',
	shiporderid int unsigned NOT NULL default '0',
	shiporderdate int(11) NOT NULL default '0',
	shipcomments TEXT NULL,
	shipbillfirstname varchar(255) NOT NULL default '',
	shipbilllastname varchar(255) NOT NULL default '',
	shipbillcompany varchar(100) NOT NULL default '',
	shipbillstreet1 varchar(255) NOT NULL default '',
	shipbillstreet2 varchar(255) NOT NULL default '',
	shipbillsuburb varchar(100) NOT NULL default '',
	shipbillstate varchar(50) NOT NULL default '',
	shipbillzip varchar(20) NOT NULL default '',
	shipbillcountry varchar(50) NOT NULL default '',
	shipbillcountrycode varchar(2) NOT NULL default '',
	shipbillcountryid int(11) NOT NULL default '0',
	shipbillstateid int(11) NOT NULL default '0',
	shipbillphone varchar(50) NOT NULL default '',
	shipbillemail varchar(250) NOT NULL default '',
	shipshipfirstname varchar(100) NOT NULL default '',
	shipshiplastname varchar(100) NOT NULL default '',
	shipshipcompany varchar(100) NOT NULL default '',
	shipshipstreet1 varchar(255) NOT NULL default '',
	shipshipstreet2 varchar(255) NOT NULL default '',
	shipshipsuburb varchar(100) NOT NULL default '',
	shipshipstate varchar(50) NOT NULL default '',
	shipshipzip varchar(20) NOT NULL default '',
	shipshipcountry varchar(50) NOT NULL default '',
	shipshipcountrycode varchar(2) NOT NULL default '',
	shipshipcountryid int(11) NOT NULL default '0',
	shipshipstateid int(11) NOT NULL default '0',
	shipshipphone varchar(50) NOT NULL default '',
	shipshipemail varchar(250) NOT NULL default '',
	PRIMARY KEY(shipmentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS [|PREFIX|]shipment_items (
	itemid int unsigned NOT NULL auto_increment,
	shipid int unsigned NOT NULL default '0',
	itemprodid int unsigned NOT NULL default '0',
	itemordprodid int unsigned NOT NULL default '0',
	itemprodsku varchar(250) NOT NULL default '',
	itemprodname varchar(250) NOT NULL default '',
	itemqty int unsigned NOT NULL default '0',
	itemprodoptions text NULL,
	itemprodvariationid int unsigned NOT NULL default '0',
	itemprodeventname VARCHAR(255),
	itemprodeventdate INT(9),
	PRIMARY KEY(itemid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS [|PREFIX|]vendor_payments (
	paymentid int unsigned NOT NULL auto_increment,
	paymentfrom int(11) NOT NULL default '0',
	paymentto int(11) NOT NULL default '0',
	paymentvendorid int unsigned NOT NULL default '0',
	paymentamount decimal(20, 4) NOT NULL default '0.0000',
	paymentforwardbalance decimal(20, 4) NOT NULL default '0.0000',
	paymentdate int(11) NOT NULL default '0',
	paymentdeducted int(1) NOT NULL default '0',
	paymentmethod varchar(100) NOT NULL default '',
	paymentcomments text NULL,
	PRIMARY KEY(paymentid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_discounts`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_discounts` (
 `discountid` INT NOT NULL auto_increment,
 `discountprodid` INT NOT NULL default '0',
 `discountquantitymin` INT NOT NULL default '0',
 `discountquantitymax` INT NOT NULL default '0',
 `discounttype` ENUM('price', 'percent', 'fixed') NOT NULL default 'price',
 `discountamount` DECIMAL(20,4) NOT NULL default '0',
 PRIMARY KEY (`discountid`),
 INDEX `i_product_discounts_discountprodid` (`discountprodid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_comparisons`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_comparisons` (
  `product_id` int(11) NOT NULL,
  `comparison_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`product_id`, `comparison_id`),
  KEY `i_product_comparisons_comparison_id` (`comparison_id`),
  KEY `i_product_comparisons_product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `%%PREFIX%%shopping_comparison_taxonomies`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shopping_comparison_taxonomies` (
	`id` varchar(255) NOT NULL,
	`filename` varchar(255) NOT NULL,
	`last_updated` int(11) NOT NULL,
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `%%PREFIX%%shopping_comparison_categories`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shopping_comparison_categories` (
	`id` int(11) NOT NULL,
	`shopping_comparison_id` varchar(255) NOT NULL,
	`parent_id` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`path` varchar(255) NOT NULL,
	`num_children` int(11) NOT NULL default '0',
	PRIMARY KEY  (`shopping_comparison_id`, `id`),
	KEY `i_shopping_comparison_categories_path` (`path`),
	KEY `i_shopping_comparison_categories_comparison_id` (`shopping_comparison_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `%%PREFIX%%shopping_comparison_category_associations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shopping_comparison_category_associations` (
	`category_id` int(11) NOT NULL,
	`shopping_comparison_id` varchar(255) NOT NULL,
	`shopping_comparison_category_id` int(11) NOT NULL,
	PRIMARY KEY  (`category_id`, `shopping_comparison_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_configurable_fields` (
  `productfieldid` int(11) NOT NULL auto_increment,
  `fieldprodid` int(11) NOT NULL default '0',
  `fieldname` varchar(255) NOT NULL default '',
  `fieldtype` varchar(255) NOT NULL default '',
  `fieldfiletype` varchar(255) NOT NULL default '',
  `fieldfilesize` int(11) NOT NULL default '0',
  `fieldselectoptions` text NOT NULL,
  `fieldrequired` tinyint(4) NOT NULL default '0',
  `fieldsortorder` int(11) NOT NULL default '1',
  PRIMARY KEY  (`productfieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_configurable_fields` (
  `orderfieldid` int(11) NOT NULL auto_increment,
  `fieldid` int(11) NOT NULL default '0',
  `orderid` int(11) NOT NULL default '0',
  `ordprodid` int(11) NOT NULL default '0',
  `productid` int(11) NOT NULL default '0',
  `textcontents` text NULL,
  `filename` varchar(255) NOT NULL default '',
  `filetype` varchar(255) NOT NULL default '',
  `originalfilename` varchar(255) NOT NULL default '',
  `fieldname` varchar(255) NOT NULL default '',
  `fieldtype` varchar(255) NOT NULL default '',
  `fieldselectoptions` text NOT NULL,
  PRIMARY KEY  (`orderfieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%export_templates` (
	`exporttemplateid` int(11) unsigned NOT NULL auto_increment,
	`exporttemplatename` varchar(100) NOT NULL,
	`myobassetaccount` varchar(20) NOT NULL,
	`myobincomeaccount` varchar(20) NOT NULL,
	`myobexpenseaccount` varchar(20) NOT NULL,
	`peachtreereceivableaccount` varchar(20) NOT NULL,
	`peachtreeglaccount` varchar(20) NOT NULL,
	`modifyforpeachtree` tinyint(1) unsigned NOT NULL,
	`dateformat` varchar(15) NOT NULL,
	`priceformat` varchar(15) NOT NULL,
	`boolformat` varchar(15) NOT NULL,
	`blankforfalse` tinyint(1) unsigned NOT NULL,
	`striphtml` tinyint(1) unsigned NOT NULL,
	`vendorid` int(11) unsigned NOT NULL,
	`usedtypes` varchar(63) NOT NULL,
	`builtin` tinyint(1) unsigned NOT NULL,
	PRIMARY KEY  (`exporttemplateid`),
	KEY `exporttemplatename` (`exporttemplatename`),
	KEY `vendorid` (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%export_template_fields` (
	`exporttemplatefieldid` smallint(5) unsigned NOT NULL auto_increment,
	`exporttemplateid` smallint(5) unsigned NOT NULL,
	`fieldid` varchar(31) NOT NULL,
	`fieldtype` varchar(31) NOT NULL,
	`fieldname` varchar(63) NOT NULL,
	`includeinexport` tinyint(1) unsigned NOT NULL,
	`sortorder` tinyint(3) unsigned NOT NULL,
	PRIMARY KEY  (`exporttemplatefieldid`),
	KEY `exporttemplateid` (`exporttemplateid`,`fieldtype`,`includeinexport`,`sortorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%export_method_settings` (
	`exportmethodid` int(11) unsigned NOT NULL auto_increment,
	`methodname` varchar(15) NOT NULL,
	`exporttemplateid` int(11) unsigned NOT NULL,
	`variablename` varchar(31) NOT NULL,
	`variablevalue` varchar(31) NOT NULL,
	PRIMARY KEY  (`exportmethodid`),
	KEY `methodname` (`methodname`,`exporttemplateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%discounts` (
	`discountid` int(11) NOT NULL auto_increment,
	`discountname` varchar(100) NOT NULL,
	`discountruletype` varchar(100) NOT NULL,
	`discountmaxuses` int(11) NOT NULL default '0',
	`discountcurrentuses` int(11) NOT NULL default '0',
	`discountexpiry` int(11) NOT NULL default '0',
	`discountenabled` tinyint(4) NOT NULL default '0',
	`sortorder` int(9) NOT NULL,
	`halts` int(1) NOT NULL,
	`configdata` text NOT NULL,
	PRIMARY KEY  (`discountid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_videos` (
	`video_id` VARCHAR( 25 ) NOT NULL ,
	`video_product_id` INT( 11 ) UNSIGNED NOT NULL ,
	`video_sort_order` INT( 11 ) UNSIGNED NOT NULL ,
	`video_title` VARCHAR( 255 ) NOT NULL ,
	`video_description` TEXT NOT NULL ,
	`video_length` VARCHAR( 10 ) NOT NULL,
	PRIMARY KEY ( `video_id` , `video_product_id` ),
	KEY ( `video_product_id` , `video_sort_order` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%email_provider_list_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_provider_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `provider_field_id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `size` varchar(32) NOT NULL DEFAULT '',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `settings` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email_provider_list_id_provider_field_id` (`email_provider_list_id`,`provider_field_id`),
  KEY `idx_email_provider_list_id_name` (`email_provider_list_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%email_provider_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(64) NOT NULL DEFAULT '',
  `provider_list_id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `last_field_update` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_provider_provider_list_id` (`provider`,`provider_list_id`),
  KEY `idx_provider_name` (`provider`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%email_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(64) NOT NULL DEFAULT '',
  `event` varchar(64) NOT NULL DEFAULT '',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_list_id` varchar(64) NOT NULL DEFAULT '',
  `field_map` text NOT NULL,
  `event_criteria` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- Default template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES (1, 'Default', '', '', '', '', '', 0, 'dmy-slash', 'number', 'yn', 0, 1, 0, 'customers,orders,products,salestax,redirects', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'BlankLine', '0');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'SubItems', 'combine');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'LineEnding', 'Windows');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerID', 'customers', 'Customer ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerName', 'customers', 'Customer Name', 0, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerFirstName', 'customers', 'First Name', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerLastName', 'customers', 'Last Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerCompany', 'customers', 'Company', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerEmail', 'customers', 'Email', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerPhone', 'customers', 'Phone', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerNotes', 'customers', 'Notes', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerCredit', 'customers', 'Store Credit', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerGroup', 'customers', 'Customer Group', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerDateJoined', 'customers', 'Date Joined', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerAddresses', 'customers', 'Addresses', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressName', 'customers', 'Address Name', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressFirstName', 'customers', 'Address First Name', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressLastName', 'customers', 'Address Last Name', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressCompany', 'customers', 'Address Company', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressLine1', 'customers', 'Address Line 1', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressLine2', 'customers', 'Address Line 2', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressSuburb', 'customers', 'City', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressState', 'customers', 'State/Province', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressStateAbbrv', 'customers', 'State', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressPostcode', 'customers', 'Zip', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressCountry', 'customers', 'Country', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressBuilding', 'customers', 'Building Type', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressPhone', 'customers', 'Address Phone', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressFormFields', 'customers', 'Address Form Fields', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerFormFields', 'customers', 'Form Fields', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderID', 'orders', 'Order ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderStatus', 'orders', 'Order Status', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderDate', 'orders', 'Order Date', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderSubtotalInc', 'orders', 'Subtotal (inc tax)', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderSubtotalEx', 'orders', 'Subtotal (ex tax)', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTaxtotal', 'orders', 'Tax Total', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTaxRate', 'orders', 'Tax Rate', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTaxName', 'orders', 'Tax Name', 1, 11 );
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderShipCostInc', 'orders', 'Shipping Cost (inc tax)', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderShipCostEx', 'orders', 'Shipping Cost (ex tax)', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderHandlingCostInc', 'orders', 'Handling Cost (inc tax)', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderHandlingCostEx', 'orders', 'Handling Cost (ex tax)', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalAmountInc', 'orders', 'Order Total (inc tax)', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalAmountEx', 'orders', 'Order Total (ex tax)', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerID', 'orders', 'Customer ID', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerName', 'orders', 'Customer Name', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerEmail', 'orders', 'Customer Email', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerPhone', 'orders', 'Customer Phone', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderShipMethod', 'orders', 'Ship Method', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderPayMethod', 'orders', 'Payment Method', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalQty', 'orders', 'Total Quantity', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalShipped', 'orders', 'Total Shipped', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderDateShipped', 'orders', 'Date Shipped', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCurrency', 'orders', 'Order Currency Code', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderExchangeRate', 'orders', 'Exchange Rate', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderNotes', 'orders', 'Order Notes', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustMessage', 'orders', 'Customer Message', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billName', 'orders', 'Billing Name', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billFirstName', 'orders', 'Billing First Name', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billLastName', 'orders', 'Billing Last Name', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billCompany', 'orders', 'Billing Company', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billStreet1', 'orders', 'Billing Street 1', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billStreet2', 'orders', 'Billing Street 2', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billSuburb', 'orders', 'Billing Suburb', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billState', 'orders', 'Billing State', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billStateAbbrv', 'orders', 'Billing State', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billZip', 'orders', 'Billing Zip', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billCountry', 'orders', 'Billing Country', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billSSC', 'orders', 'Billing Suburb + State + Zip', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billPhone', 'orders', 'Billing Phone', 1, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billEmail', 'orders', 'Billing Email', 1, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billFormFields', 'orders', 'Billing Form Fields', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipName', 'orders', 'Shipping Name', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipFirstName', 'orders', 'Shipping First Name', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipLastName', 'orders', 'Shipping Last Name', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipCompany', 'orders', 'Shipping Company', 1, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipStreet1', 'orders', 'Shipping Street 1', 1, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipStreet2', 'orders', 'Shipping Street 2', 1, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipSuburb', 'orders', 'Shipping Suburb', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipState', 'orders', 'Shipping State', 0, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipStateAbbrv', 'orders', 'Shipping State', 1, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipZip', 'orders', 'Shipping Zip', 1, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipCountry', 'orders', 'Shipping Country', 1, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipSSC', 'orders', 'Shipping Suburb + State + Zip', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipPhone', 'orders', 'Shipping Phone', 1, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipEmail', 'orders', 'Shipping Email', 1, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipFormFields', 'orders', 'Shipping Form Fields', 1, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdDetails', 'orders', 'Product Details', 1, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdID', 'orders', 'Product ID', 1, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdQty', 'orders', 'Product Qty', 1, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdSKU', 'orders', 'Product SKU', 1, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdName', 'orders', 'Product Name', 1, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdWeight', 'orders', 'Product Weight', 1, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdVariationDetails', 'orders', 'Product Variation Details', 1, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdPrice', 'orders', 'Product Unit Price', 1, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdIndex', 'orders', 'Product Index', 0, 65);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdTotalPrice', 'orders', 'Product Total Price', 1, 66);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderGLAccount', 'orders', 'Peachtree General Ledger Account', 0, 67);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderPTTaxType', 'orders', 'Peachtree Tax Type', 0, 68);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProductCount', 'orders', '# Unique Products in Order', 0, 69);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderWeight', 'orders', 'Combined Product Weight', 1, 70);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTodaysDate', 'orders', 'Todays Date', 0, 71);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderAccountsReceivable', 'orders', 'Peachtree Accounts Receivable Account', 0, 72);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productID', 'products', 'Product ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productType', 'products', 'Product Type', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCode', 'products', 'Code', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productName', 'products', 'Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productBrand', 'products', 'Brand', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productBrandName', 'products', 'Brand + Name', 0, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productDesc', 'products', 'Description', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productTaxable', 'products', 'Taxable Product', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCostPrice', 'products', 'Cost Price', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productRetailPrice', 'products', 'Retail Price', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productSalePrice', 'products', 'Sale Price', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCalculatedPrice', 'products', 'Calculated Price', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productShippingPrice', 'products', 'Fixed Shipping Price', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productFreeShipping', 'products', 'Free Shipping', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productWarranty', 'products', 'Warranty', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productWeight', 'products', 'Weight', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productWidth', 'products', 'Width', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productHeight', 'products', 'Height', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productDepth', 'products', 'Depth', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productPurchasable', 'products', 'Allow Purchases', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVisible', 'products', 'Product Visible', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productNotVisible', 'products', 'Product Not Visible', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productAvailability', 'products', 'Product Availability', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productInventoried', 'products', 'Product Inventoried', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productStockLevel', 'products', 'Stock Level', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productLowStockLevel', 'products', 'Low Stock Level', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productDateAdded', 'products', 'Date Added', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productLastModified', 'products', 'Date Modified', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategories', 'products', 'Category Details', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategoryID', 'products', 'Category ID', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategoryName', 'products', 'Category Name', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategoryPath', 'products', 'Category Path', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productImages', 'products', 'Images', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productImageFile', 'products', 'Image File Name', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productImageURL', 'products', 'Image URL', 1, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productPageTitle', 'products', 'Page Title', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMetaKeywords', 'products', 'META Keywords', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMetaDesc', 'products', 'META Description', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVariations', 'products', 'Product Variations', 1, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarDetails', 'products', 'Variation Details', 1, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarSKU', 'products', 'SKU', 1, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarPrice', 'products', 'Price', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarWeight', 'products', 'Weight', 1, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarStockLevel', 'products', 'Stock Level', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarLowStockLevel', 'products', 'Low Stock Level', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMYOBAsset', 'products', 'MYOB Asset Acct', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMYOBIncome', 'products', 'MYOB Income Acct', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMYOBExpense', 'products', 'MYOB Expense Acct', 0, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCondition', 'products', 'Product Condition', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxDate', 'salestax', 'Period', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxTaxName', 'salestax', 'Tax', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxTaxRate', 'salestax', 'Rate', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxNumOrders', 'salestax', 'Number of Orders', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxTaxAmount', 'salestax', 'Tax Amount', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderOrderId', 'abandonorder', 'Order Id', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderCustomerName', 'abandonorder', 'Customer Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderCustomerEmail', 'abandonorder', 'Customer Email', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderCustomerPhone', 'abandonorder', 'Customer Phone', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderDate', 'abandonorder', 'Date', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderTotalOrderAmount', 'abandonorder', 'Total Order Amount', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectPath', 'redirects', 'Old Path', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectOldURL', 'redirects', 'Old URL', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectNewURL', 'redirects', 'New URL', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectAssocType', 'redirects', 'Associated Type', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectAssocId', 'redirects', 'Associated ID', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectNewURLOrAssocType', 'redirects', 'New URL or Associated Type', 0, 5);

-- MYOB template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES (2, 'MYOB', '', '', '', '', '', 0, 'dmy-slash', 'number', 'yn', 1, 1, 0, 'customers,orders,products', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'BlankLine', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'SubItems', 'rows');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'LineEnding', 'Windows');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerID', 'customers', 'Card ID', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerName', 'customers', 'Customer Name', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerFirstName', 'customers', 'First Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerLastName', 'customers', 'Co./Last Name', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerCompany', 'customers', 'Company', 0, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerEmail', 'customers', 'Email', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerPhone', 'customers', 'Phone', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerNotes', 'customers', 'Notes', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerCredit', 'customers', 'Store Credit', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerGroup', 'customers', 'Customer Group', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerDateJoined', 'customers', 'Date Joined', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerAddresses', 'customers', 'Addresses', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressName', 'customers', 'Address Contact Name', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressFirstName', 'customers', 'Address First Name', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressLastName', 'customers', 'Address Last Name', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressCompany', 'customers', 'Address Company', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressLine1', 'customers', 'Address Line 1', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressLine2', 'customers', 'Address Line 2', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressSuburb', 'customers', 'Address City', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressState', 'customers', 'Address State', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressStateAbbrv', 'customers', 'State Abbreviation', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressPostcode', 'customers', 'Address Postcode', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressCountry', 'customers', 'Address Country', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressBuilding', 'customers', 'Building Type', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressPhone', 'customers', 'Address Phone 1', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressFormFields', 'customers', 'Address Form Fields', 0, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerFormFields', 'customers', 'Form Fields', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderID', 'orders', 'Invoice #', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderStatus', 'orders', 'Order Status', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderDate', 'orders', 'Date', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderSubtotalInc', 'orders', 'Total', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTaxtotal', 'orders', 'Tax Amount', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTaxRate', 'orders', 'Tax Rate', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTaxName', 'orders', 'Tax Code', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderShipCostInc', 'orders', 'Inc-Tax Freight Amount', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderHandlingCostInc', 'orders', 'Handling Cost', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTotalAmountInc', 'orders', 'Inc-Tax Total', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderCustomerID', 'orders', 'Card ID', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderShipMethod', 'orders', 'Ship Via', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderPayMethod', 'orders', 'Payment Method', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTotalQty', 'orders', 'Total Quantity', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTotalShipped', 'orders', 'Total Shipped', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderDateShipped', 'orders', 'Shipping Date', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderCurrency', 'orders', 'Currency Code', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderExchangeRate', 'orders', 'Exchange Rate', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderNotes', 'orders', 'Comment', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderCustMessage', 'orders', 'Payment Notes', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billName', 'orders', '', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billFirstName', 'orders', 'First Name', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billLastName', 'orders', 'Co./Last Name', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billCompany', 'orders', 'Billing Company', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billStreet1', 'orders', 'Address Line 1', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billStreet2', 'orders', 'Address Line 2', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billSuburb', 'orders', 'Billing Suburb', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billState', 'orders', 'Billing State', 0, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billStateAbbrv', 'orders', 'Billing State Abbreviation', 0, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billZip', 'orders', 'Billing Zip', 0, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billCountry', 'orders', 'Billing Country', 0, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billSSC', 'orders', '', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billPhone', 'orders', 'Billing Phone', 0, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billEmail', 'orders', 'Billing Email', 0, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billFormFields', 'orders', 'Billing Form Fields', 0, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipName', 'orders', 'Shipping Name', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipFirstName', 'orders', 'First Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipLastName', 'orders', 'Co./Last Name', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipCompany', 'orders', 'Shipping Company', 0, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipStreet1', 'orders', 'Address Line 1', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipStreet2', 'orders', 'Address Line 2', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipSuburb', 'orders', 'Address Line 3', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipState', 'orders', 'Shipping State', 0, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipStateAbbrv', 'orders', 'Shipping State Abbreviation', 0, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipZip', 'orders', 'Shipping Zip', 0, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipCountry', 'orders', 'Address Line 4', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipSSC', 'orders', 'Address Line 3', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipPhone', 'orders', 'Shipping Phone', 0, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipEmail', 'orders', 'Shipping Email', 0, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipFormFields', 'orders', 'Shipping Form Fields', 0, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdDetails', 'orders', 'Product Details', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdID', 'orders', 'Item Number', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdQty', 'orders', 'Quantity', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdSKU', 'orders', 'Product SKU', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdName', 'orders', 'Description', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdPrice', 'orders', 'Inc-Tax Price', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdIndex', 'orders', 'Product Index', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdTotalPrice', 'orders', 'Product Total Price', 0, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderGLAccount', 'orders', 'G/L Account', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderPTTaxType', 'orders', 'Peachtree Tax Type', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProductCount', 'orders', '# Unique Products in Order', 0, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTodaysDate', 'orders', 'Todays Date', 0, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderAccountsReceivable', 'orders', 'Peachtree Accounts Receivable Account', 0, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productID', 'products', 'Item Number', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productType', 'products', 'Product Type', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCode', 'products', 'Code', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productName', 'products', 'Item Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productBrand', 'products', 'Brand', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productBrandName', 'products', '', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productDesc', 'products', 'Description', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productTaxable', 'products', 'Taxable Product', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCostPrice', 'products', 'Standard Cost', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productRetailPrice', 'products', 'Retail Price', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productSalePrice', 'products', 'Sale Price', 0, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCalculatedPrice', 'products', 'Selling Price', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productShippingPrice', 'products', 'Fixed Shipping Price', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productFreeShipping', 'products', 'Free Shipping', 0, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productWarranty', 'products', 'Warranty', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productWeight', 'products', 'Weight', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productWidth', 'products', 'Width', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productHeight', 'products', 'Height', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productDepth', 'products', 'Depth', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productPurchasable', 'products', 'Sell', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVisible', 'products', 'Product Visible', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productNotVisible', 'products', 'Inactive Item', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productAvailability', 'products', 'Product Availability', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productInventoried', 'products', 'Inventory', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productStockLevel', 'products', 'Stock Level', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productLowStockLevel', 'products', 'Minimum Level', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productDateAdded', 'products', 'Date Added', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productLastModified', 'products', 'Date Modified', 0, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategories', 'products', 'Category Details', 0, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategoryID', 'products', 'Category ID', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategoryName', 'products', 'Category Name', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategoryPath', 'products', 'Category Path', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productPageTitle', 'products', 'Page Title', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMetaKeywords', 'products', 'META Keywords', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMetaDesc', 'products', 'META Description', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVariations', 'products', 'Product Variations', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarDetails', 'products', 'Variation Details', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarSKU', 'products', 'SKU', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarPrice', 'products', 'Price', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarWeight', 'products', 'Weight', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarStockLevel', 'products', 'Stock Level', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarLowStockLevel', 'products', 'Low Stock Level', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMYOBAsset', 'products', 'Asset Acct', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMYOBIncome', 'products', 'Income Acct', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMYOBExpense', 'products', 'Expense/COS Acct', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCondition', 'products', 'Product Condition', 0, 45);

-- Peachtree template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES (3, 'Peachtree Accounting', '', '', '', '', '', 1, 'dmy-slash', 'number', 'truefalse', 0, 1, 0, 'customers,orders,products,abandonorder', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'SubItems', 'rows');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'LineEnding', 'Windows');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'BlankLine', '0');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerID', 'customers', 'Customer ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerName', 'customers', 'Customer Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerFirstName', 'customers', 'First Name', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerLastName', 'customers', 'Last Name', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerCompany', 'customers', 'Company', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerEmail', 'customers', 'Customer E-mail', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerPhone', 'customers', 'Telephone 1', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerNotes', 'customers', 'Notes', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerCredit', 'customers', 'Customer Balance', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerGroup', 'customers', 'Customer Group', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerDateJoined', 'customers', 'Customer Since Date', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerAddresses', 'customers', 'Addresses', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressName', 'customers', 'Ship to Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressFirstName', 'customers', 'Address First Name', 0, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressLastName', 'customers', 'Address Last Name', 0, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressCompany', 'customers', 'Address Company', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressLine1', 'customers', 'Ship to Address Line 1', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressLine2', 'customers', 'Ship to Address Line 2', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressSuburb', 'customers', 'Ship to City', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressState', 'customers', 'Ship to State', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressStateAbbrv', 'customers', 'Ship to State', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressPostcode', 'customers', 'Ship to Zipcode', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressCountry', 'customers', 'Ship to Country', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressBuilding', 'customers', 'Building Type', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressPhone', 'customers', 'Address Phone', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressFormFields', 'customers', 'Address Form Fields', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerFormFields', 'customers', 'Form Fields', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderID', 'orders', 'Invoice/CM #', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderStatus', 'orders', 'Order Status', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderDate', 'orders', 'Date', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderSubtotalInc', 'orders', 'Subtotal', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTaxtotal', 'orders', 'Tax Total', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTaxRate', 'orders', 'Tax Rate', 0, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTaxName', 'orders', 'Sales Tax Agency', 0, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderShipCostInc', 'orders', 'Shipping Cost', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderHandlingCostInc', 'orders', 'Handling Cost', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTotalAmountInc', 'orders', 'Order Total', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderCustomerID', 'orders', 'Customer ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderShipMethod', 'orders', 'Ship Via', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderPayMethod', 'orders', 'Payment Method', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTotalQty', 'orders', 'Total Quantity', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTotalShipped', 'orders', 'Total Shipped', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderDateShipped', 'orders', 'Ship Date', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderCurrency', 'orders', 'Order Currency Code', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderExchangeRate', 'orders', 'Exchange Rate', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderNotes', 'orders', 'Internal Note', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderCustMessage', 'orders', 'Invoice Note', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billName', 'orders', 'Billing Name', 0, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billFirstName', 'orders', 'Billing First Name', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billLastName', 'orders', 'Billing Last Name', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billCompany', 'orders', 'Billing Company', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billStreet1', 'orders', 'Billing Street 1', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billStreet2', 'orders', 'Billing Street 2', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billSuburb', 'orders', 'Billing Suburb', 0, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billState', 'orders', 'Billing State', 0, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billStateAbbrv', 'orders', 'Billing State Abbreviation', 0, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billZip', 'orders', 'Billing Zip', 0, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billCountry', 'orders', 'Billing Country', 0, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billSSC', 'orders', 'Billing Suburb + State + Zip', 0, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billPhone', 'orders', 'Billing Phone', 0, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billEmail', 'orders', 'Billing Email', 0, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billFormFields', 'orders', 'Billing Form Fields', 0, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipName', 'orders', 'Ship to Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipFirstName', 'orders', '', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipLastName', 'orders', 'Shipping Last Name', 0, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipCompany', 'orders', 'Shipping Company', 0, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipStreet1', 'orders', 'Ship to Address-Line One', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipStreet2', 'orders', 'Ship to Address-Line Two', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipSuburb', 'orders', 'Ship to City', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipState', 'orders', 'Ship to State', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipStateAbbrv', 'orders', 'Shipping State Abbreviation', 0, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipZip', 'orders', 'Ship to Zipcode', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipCountry', 'orders', 'Ship to Country', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipSSC', 'orders', 'Shipping Suburb + State + Zip', 0, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipPhone', 'orders', 'Shipping Phone', 0, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipEmail', 'orders', 'Shipping Email', 0, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipFormFields', 'orders', 'Billing Form Fields', 0, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdDetails', 'orders', 'Product Details', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdID', 'orders', 'Item ID', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdQty', 'orders', 'Quantity', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdSKU', 'orders', 'UPC/SKU', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdName', 'orders', 'Description', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdPrice', 'orders', 'Unit Price', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdIndex', 'orders', 'Invoice/CM Distribution', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdTotalPrice', 'orders', 'Amount', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderGLAccount', 'orders', 'G/L Account', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderPTTaxType', 'orders', 'Tax Type', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProductCount', 'orders', 'Number of Distributions', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTodaysDate', 'orders', 'Date Due', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderAccountsReceivable', 'orders', 'Accounts Receivable Account', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productID', 'products', 'Item ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productType', 'products', 'Item Type', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCode', 'products', 'UPC/SKU', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productName', 'products', 'Item Description', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productBrand', 'products', 'Brand', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productBrandName', 'products', 'Brand + Name', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productDesc', 'products', 'Description for Sales ', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productTaxable', 'products', 'Is Taxable', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCostPrice', 'products', 'Last Unit Cost', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productRetailPrice', 'products', 'Retail Price', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productSalePrice', 'products', 'Sales Price 1', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCalculatedPrice', 'products', 'Sales Price 1', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productShippingPrice', 'products', 'Fixed Shipping Price', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productFreeShipping', 'products', 'Free Shipping', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productWarranty', 'products', 'Warranty', 0, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productWeight', 'products', 'Weight', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productWidth', 'products', 'Width', 0, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productHeight', 'products', 'Height', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productDepth', 'products', 'Depth', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productPurchasable', 'products', 'Allow Purchases', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVisible', 'products', 'Product Visible', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productNotVisible', 'products', 'Inactive', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productAvailability', 'products', 'Product Availability', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productInventoried', 'products', 'Product Inventoried', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productStockLevel', 'products', 'Quantity on Hand', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productLowStockLevel', 'products', 'Minimum Stock', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productDateAdded', 'products', 'Date Added', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productLastModified', 'products', 'Effective Date ', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategories', 'products', 'Category Details', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategoryID', 'products', 'Category ID', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategoryName', 'products', 'Category Name', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategoryPath', 'products', 'Category Path', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productPageTitle', 'products', 'Page Title', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMetaKeywords', 'products', 'META Keywords', 0, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMetaDesc', 'products', 'META Description', 0, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVariations', 'products', 'Product Variations', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarDetails', 'products', 'Variation Details', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarSKU', 'products', 'SKU', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarPrice', 'products', 'Price', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarWeight', 'products', 'Weight', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarStockLevel', 'products', 'Stock Level', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarLowStockLevel', 'products', 'Low Stock Level', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMYOBAsset', 'products', 'MYOB Asset Acct', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMYOBIncome', 'products', 'MYOB Income Acct', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMYOBExpense', 'products', 'MYOB Expense Acct', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCondition', 'products', 'Product Condition', 0, 45);

-- Bulk Edit template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES(4, 'Bulk Edit', '', '', '', '', '', 0, 'mdy-slash', 'number', 'yn', 0, 0, 0, 'customers,products', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'BlankLine', '0');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'SubItems', 'expand');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'LineEnding', 'Windows');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderOrderId', 'abandonorder', 'Order ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderCustomerName', 'abandonorder', 'Customer Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderCustomerEmail', 'abandonorder', 'Customer Email', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderCustomerPhone', 'abandonorder', 'Customer Phone', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderDate', 'abandonorder', 'Date', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderTotalOrderAmount', 'abandonorder', 'Total Order Amount', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerID', 'customers', 'Customer ID', 0, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerName', 'customers', 'Customer Name', 0, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerDateJoined', 'customers', 'Date Joined', 0, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressName', 'customers', 'Address Name', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressStateAbbrv', 'customers', 'Address State Abbreviation', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressBuilding', 'customers', 'Building Type', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerEmail', 'customers', 'Email Address', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerFirstName', 'customers', 'First Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerLastName', 'customers', 'Last Name', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerCompany', 'customers', 'Company', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerPhone', 'customers', 'Phone', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerNotes', 'customers', 'Notes', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerCredit', 'customers', 'Store Credit', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerGroup', 'customers', 'Customer Group', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerAddresses', 'customers', 'Addresses', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressID', 'customers', 'Address ID', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressFirstName', 'customers', 'Address First Name', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressLastName', 'customers', 'Address Last Name', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressCompany', 'customers', 'Address Company', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressLine1', 'customers', 'Address Line 1', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressLine2', 'customers', 'Address Line 2', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressSuburb', 'customers', 'Address City', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressState', 'customers', 'Address State', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressPostcode', 'customers', 'Address Zip', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressCountry', 'customers', 'Address Country', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressPhone', 'customers', 'Address Phone', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressFormFields', 'customers', 'Address Form Fields', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerFormFields', 'customers', 'Form Fields', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderID', 'orders', 'Order ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderStatus', 'orders', 'Order Status', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderDate', 'orders', 'Order Date', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderSubtotal', 'orders', 'Subtotal', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTaxtotal', 'orders', 'Tax Total', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTaxRate', 'orders', 'Tax Rate', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTaxName', 'orders', 'Tax Name', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderShipCost', 'orders', 'Shipping Cost', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderHandlingCost', 'orders', 'Handling Cost', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTotalAmount', 'orders', 'Order Total', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerID', 'orders', 'Customer ID', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerName', 'orders', 'Customer Name', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerEmail', 'orders', 'Customer Email', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerPhone', 'orders', 'Customer Phone', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderShipMethod', 'orders', 'Ship Method', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderPayMethod', 'orders', 'Payment Method', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTotalQty', 'orders', 'Total Quantity', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTotalShipped', 'orders', 'Total Shipped', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderDateShipped', 'orders', 'Date Shipped', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCurrency', 'orders', 'Order Currency Code', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderExchangeRate', 'orders', 'Exchange Rate', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderNotes', 'orders', 'Order Notes', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustMessage', 'orders', 'Customer Message', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billName', 'orders', 'Billing Name', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billFirstName', 'orders', 'Billing First Name', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billLastName', 'orders', 'Billing Last Name', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billCompany', 'orders', 'Billing Company', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billStreet1', 'orders', 'Billing Street 1', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billStreet2', 'orders', 'Billing Street 2', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billSuburb', 'orders', 'Billing Suburb', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billState', 'orders', 'Billing State', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billStateAbbrv', 'orders', 'Billing State Abbreviation', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billZip', 'orders', 'Billing Zip', 1, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billCountry', 'orders', 'Billing Country', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billSSC', 'orders', 'Billing Suburb + State + Zip', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billPhone', 'orders', 'Billing Phone', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billEmail', 'orders', 'Billing Email', 1, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billFormFields', 'orders', 'Billing Form Fields', 1, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipName', 'orders', 'Shipping Name', 1, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipFirstName', 'orders', 'Shipping First Name', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipLastName', 'orders', 'Shipping Last Name', 1, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipCompany', 'orders', 'Shipping Company', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipStreet1', 'orders', 'Shipping Street 1', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipStreet2', 'orders', 'Shipping Street 2', 1, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipSuburb', 'orders', 'Shipping Suburb', 1, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipState', 'orders', 'Shipping State', 1, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipStateAbbrv', 'orders', 'Shipping State Abbreviation', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipZip', 'orders', 'Shipping Zip', 1, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipCountry', 'orders', 'Shipping Country', 1, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipSSC', 'orders', 'Shipping Suburb + State + Zip', 1, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipPhone', 'orders', 'Shipping Phone', 1, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipEmail', 'orders', 'Shipping Email', 1, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipFormFields', 'orders', 'Shipping Form Fields', 1, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdDetails', 'orders', 'Product Details', 1, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdID', 'orders', 'Product ID', 1, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdQty', 'orders', 'Product Qty', 1, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdSKU', 'orders', 'Product SKU', 1, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdName', 'orders', 'Product Name', 1, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdVariationDetails', 'orders', 'Product Variation Details', 1, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdPrice', 'orders', 'Product Unit Price', 1, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdIndex', 'orders', 'Product Index', 1, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdWeight', 'orders', 'Product Weight', 1, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdTotalPrice', 'orders', 'Product Total Price', 1, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderGLAccount', 'orders', 'Peachtree General Ledger Account', 1, 65);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderPTTaxType', 'orders', 'Peachtree Tax Type', 1, 66);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProductCount', 'orders', '# Unique Products in Order', 1, 67);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCombinedWeight', 'orders', 'Combined Product Weight', 1, 68);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTodaysDate', 'orders', 'Todays Date', 1, 69);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderAccountsReceivable', 'orders', 'Peachtree Accounts Receivable Account', 1, 70);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productID', 'products', 'Product ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productBrandName', 'products', 'Brand + Name', 0, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCalculatedPrice', 'products', 'Calculated Price', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productNotVisible', 'products', 'Product Not Visible', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productInventoried', 'products', 'Product Inventoried', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productDateAdded', 'products', 'Date Added', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productLastModified', 'products', 'Date Modified', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFilePath', 'products', 'Product File Path', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileTotalDownloads', 'products', 'Product File Total Downloads', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategories', 'products', 'Category Details', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryID', 'products', 'Category ID', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryName', 'products', 'Category Name', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryPath', 'products', 'Category Path', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageFile', 'products', 'Product Image File', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageURL', 'products', 'Product Image URL', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVariations', 'products', 'Product Variations', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarDetails', 'products', 'Variation Details', 0, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarSKU', 'products', 'SKU', 0, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarPrice', 'products', 'Price', 0, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarWeight', 'products', 'Weight', 0, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarStockLevel', 'products', 'Stock Level', 0, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarLowStockLevel', 'products', 'Low Stock Level', 0, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productName', 'products', 'Product Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productType', 'products', 'Product Type', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCode', 'products', 'Product Code/SKU', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productBrand', 'products', 'Brand Name', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productDesc', 'products', 'Product Description', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productPrice', 'products', 'Price', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCostPrice', 'products', 'Cost Price', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productRetailPrice', 'products', 'Retail Price', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productSalePrice', 'products', 'Sale Price', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productTaxable', 'products', 'Taxable Product?', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productShippingPrice', 'products', 'Fixed Shipping Cost', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFreeShipping', 'products', 'Free Shipping', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productWarranty', 'products', 'Product Warranty', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productWeight', 'products', 'Product Weight', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productWidth', 'products', 'Product Width', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productHeight', 'products', 'Product Height', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productDepth', 'products', 'Product Depth', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productPurchasable', 'products', 'Allow Purchases?', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVisible', 'products', 'Product Visible?', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productAvailability', 'products', 'Product Availability', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productStockLevel', 'products', 'Current Stock Level', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productLowStockLevel', 'products', 'Low Stock Level', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryString', 'products', 'Category', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFiles', 'products', 'Product Files', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileFileName', 'products', 'Product File', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileDescription', 'products', 'Product File Description', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileMaxDownloads', 'products', 'Product File Max Downloads', 1, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileDisabledAfter', 'products', 'Product File Expires After', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImages', 'products', 'Product Images', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageID', 'products', 'Product Image ID', 1, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImagePath', 'products', 'Product Image File', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageDescription', 'products', 'Product Image Description', 1, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageIsThumbnail', 'products', 'Product Image Is Thumbnail', 1, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageIndex', 'products', 'Product Image Sort', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productSearchKeywords', 'products', 'Search Keywords', 1, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productPageTitle', 'products', 'Page Title', 1, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMetaKeywords', 'products', 'Meta Keywords', 1, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMetaDesc', 'products', 'Meta Description', 1, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMYOBAsset', 'products', 'MYOB Asset Acct', 1, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMYOBIncome', 'products', 'MYOB Income Acct', 1, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMYOBExpense', 'products', 'MYOB Expense Acct', 1, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCondition', 'products', 'Product Condition', 1, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productShowCondition', 'products', 'Show Product Condition?', 1, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateRequired', 'products', 'Event Date Required?', 1, 65);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateName', 'products', 'Event Date Name', 1, 66);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateLimited', 'products', 'Event Date Is Limited?', 1, 67);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateStartDate', 'products', 'Event Date Start Date', 1, 68);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateEndDate', 'products', 'Event Date End Date', 1, 69);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productSortOrder', 'products', 'Sort Order', 1, 70);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productUPC', 'products', 'Product UPC', 1, 71);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxDate', 'salestax', 'Period', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxTaxName', 'salestax', 'Tax', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxTaxRate', 'salestax', 'Rate', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxNumOrders', 'salestax', 'Number of Orders', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxTaxAmount', 'salestax', 'Tax Amount', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectPath', 'redirects', 'Old Path', 0, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectOldURL', 'redirects', 'Old URL', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectNewURL', 'redirects', 'New URL', 0, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectAssocType', 'redirects', 'Associated Type', 0, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectAssocId', 'redirects', 'Associated ID', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectNewURLOrAssocType', 'redirects', 'New URL', 1, 4);

CREATE TABLE IF NOT EXISTS `%%PREFIX%%optimizer_config` (
  `optimizer_id` int(11) NOT NULL auto_increment ,
  `optimizer_type` varchar(255) NOT NULL,
  `optimizer_item_id` int(11) NOT NULL,
  `optimizer_config_date` int(11) NOT NULL,
  `optimizer_conversion_page` varchar(255) NOT NULL,
  `optimizer_conversion_url` varchar(255) NOT NULL,
  `optimizer_control_script` text NOT NULL,
  `optimizer_tracking_script` text NOT NULL,
  `optimizer_conversion_script` text NOT NULL,
  PRIMARY KEY  (`optimizer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `%%PREFIX%%shipping_methods` VALUES (1, 1, 'Flat Rate Per Order', 'shipping_flatrate', 0.0000, 1, 0);
INSERT INTO `%%PREFIX%%shipping_vars` VALUES (1, 1, 1, 'shipping_flatrate', 'is_setup', '1', 0);
INSERT INTO `%%PREFIX%%shipping_vars` VALUES (2, 1, 1, 'shipping_flatrate', 'shippingcost', '20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%redirects`
--
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `%%PREFIX%%redirects` (
  `redirectid` INT( 11 ) NOT NULL AUTO_INCREMENT ,
  `redirectpath` VARCHAR( 255 ) NOT NULL ,
  `redirectassocid` INT( 11 ) NOT NULL ,
  `redirectassoctype` SMALLINT( 1 ) NOT NULL ,
  `redirectmanual` VARCHAR( 255 ) NOT NULL,
  PRIMARY KEY  (`redirectid`),
  KEY `redirectpath` (`redirectpath`)
) ENGINE = MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%keystore` (
  `key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_listing_template` (
 `id` int(11) unsigned NOT NULL auto_increment,
 `name` varchar(250) default NULL,
 `enabled` tinyint(1) unsigned default NULL,
 `user_id` int(11) unsigned default NULL,
 `site_id` int(5) unsigned default NULL,
 `is_private` tinyint(1) unsigned default NULL,
 `quantities` smallint(4) unsigned default NULL,
 `lot_size` mediumint(6) unsigned default NULL,
 `listing_type` varchar(50) default NULL,
 `is_default` tinyint(1) unsigned default '0',
 `listing_duration` varchar(10) default NULL,
 `primary_category_options` text NOT NULL,
 `primary_category_id` varchar(11) default NULL,
 `secondary_category_id` varchar(11) default NULL,
 `secondary_category_name` varchar(30) default NULL,
 `store_category1_id` varchar(11) default NULL,
 `store_category1_name` varchar(30) default NULL,
 `store_category2_id` varchar(11) default NULL,
 `store_category2_name` varchar(30) default NULL,
 `accept_best_offer` tinyint(1) unsigned default '0',
 `payment_method` text,
 `paypal_email` varchar(250) default NULL,
 `payment_instruction` varchar(900) default NULL,
 `item_country` varchar(3) default NULL,
 `item_zip` varchar(20) default NULL,
 `item_city` varchar(100) default NULL,
 `use_prod_image` tinyint(1) unsigned default NULL,
 `accept_return` tinyint(1) unsigned default '0',
 `return_offer_as` varchar(100) default NULL,
 `return_period` varchar(10) default NULL,
 `return_cost_by` varchar(100) default NULL,
 `return_policy_description` text,
 `use_domestic_shipping` tinyint(1) unsigned NOT NULL,
 `use_international_shipping` tinyint(1) unsigned default NULL,
 `handling_time` tinyint(2) unsigned NOT NULL,
 `use_salestax` tinyint(1) unsigned default NULL,
 `sales_tax_states` varchar(3) default NULL,
 `salestax_percent` decimal(7,4) default NULL,
 `salestax_inc_shipping` tinyint(1) unsigned default NULL,
 `counter_style` varchar(100) default NULL,
 `gallery_opt` varchar(100) default NULL,
 `featured_gallery_duration` varchar(9) NOT NULL,
 `listing_opt` text,
 `date_added` int(11) unsigned default NULL,
 `secondary_category_options` text NOT NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%ebay_shipping`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_shipping` (
 `id` int(11) NOT NULL auto_increment,
 `ebay_listing_template_id` int(11) default NULL,
 `area` enum('Domestic','International') default NULL,
 `cost_type` enum('Flat','Calculated','Freight') default NULL,
 `offer_pickup` tinyint(1) default NULL,
 `pickup_cost` decimal(20,2) default NULL,
 `is_free_shipping` tinyint(1) default NULL,
 `handling_cost` decimal(20,2) default NULL,
 `package_type` varchar(100) default NULL,
 `get_it_fast` tinyint(1) default NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%ebay_shipping_serv`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_shipping_serv` (
 `id` int(11) NOT NULL auto_increment,
 `ebay_shipping_id` int(11) default NULL,
 `name` varchar(100) default NULL,
 `cost` decimal(20,2) default NULL,
 `additional_cost` decimal(20,2) default NULL,
 `ship_to_locations` text NOT NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `ebay_item_id` varchar(19) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL,
  `start_time` varchar(28) NOT NULL,
  `end_time` varchar(28) NOT NULL,
  `datetime_listed` int(11) DEFAULT NULL,
  `listing_type` varchar(50) DEFAULT NULL,
  `listing_status` varchar(50) DEFAULT NULL,
  `current_price_currency` varchar(3) DEFAULT NULL,
  `current_price` decimal(20,4) DEFAULT NULL,
  `buyitnow_price_currency` varchar(3) DEFAULT NULL,
  `buyitnow_price` decimal(20,4) DEFAULT NULL,
  `site_id` int(5) DEFAULT NULL,
  `ebay_item_link` varchar(255) DEFAULT NULL,
  `quantity_remaining` int(5) DEFAULT NULL,
  `bid_count` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_item_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` double(20,4) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_listing_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebay_listing_template_id` int(11) DEFAULT NULL,
  `selected_type` enum('CustomPrice','ProductPrice','PriceExtra','None') DEFAULT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `price_type` enum('Starting','Reserve','Buy') DEFAULT NULL,
  `calculate_operator` varchar(20) DEFAULT NULL,
  `calculate_option` varchar(50) DEFAULT NULL,
  `calculate_price` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `category_id` varchar(11) NOT NULL,
  `parent_id` varchar(11) NOT NULL,
  `ebay_site_id` varchar(4) NOT NULL,
  `is_leaf` tinyint(1) unsigned NOT NULL,
  `lot_size_enabled` tinyint(1) unsigned NOT NULL,
  `best_offer_enabled` tinyint(1) unsigned NOT NULL,
  `reserve_price_allowed` tinyint(1) unsigned NOT NULL,
  `minimum_reserve_price` double(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id_2` (`category_id`,`ebay_site_id`),
  KEY `parent_id` (`parent_id`),
  KEY `ebay_site_id` (`ebay_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS  `[|PREFIX|]tax_zones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` enum('country','state','zip') DEFAULT 'country',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE [|PREFIX|]tax_zones;
INSERT INTO [|PREFIX|]tax_zones (`name`, `default`) VALUES ('Default Zone', 1);

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
TRUNCATE [|PREFIX|]tax_classes;
INSERT INTO [|PREFIX|]tax_classes (`id`, `name`) VALUES (1, 'Non-Taxable Products');
INSERT INTO [|PREFIX|]tax_classes (`id`, `name`) VALUES (2, 'Shipping');
INSERT INTO [|PREFIX|]tax_classes (`id`, `name`) VALUES (3, 'Gift Wrapping');

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_zone_locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) unsigned NOT NULL,
  `type` enum('country','state','zip') NOT NULL DEFAULT 'country',
  `value_id` int(11) unsigned DEFAULT '0',
  `value` varchar(200) DEFAULT '',
  `country_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_zone_customer_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) unsigned NOT NULL,
  `customer_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default_rate` decimal(20, 4) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_rate_class_rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(11) unsigned NOT NULL,
  `tax_class_id` int(11) unsigned NOT NULL,
  `rate` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]order_taxes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) signed NOT NULL,
  `order_address_id` int unsigned NOT NULL,
  `tax_rate_id` int(11) unsigned NOT NULL,
  `tax_class_id` int(11) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  `rate` decimal(20,4) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT '0',
  `priority_amount` decimal(20, 4) NOT NULL default '0',
  `line_amount` decimal(20, 4) NOT NULL default '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]product_tax_pricing` (
  `price_reference` decimal(20, 4) NOT NULL DEFAULT '0',
  `calculated_price` decimal(20, 4) NOT NULL DEFAULT '0',
  `tax_zone_id` int(11) unsigned NOT NULL default '0',
  `tax_class_id` int(11) unsigned NOT NULL default '0',
  UNIQUE KEY (`price_reference`, `tax_zone_id`, `tax_class_id`),
  KEY (`tax_zone_id`),
  KEY (`tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]order_addresses` (
	`id` int unsigned not null auto_increment,
	`order_id` int unsigned not null,
	`first_name` varchar(255) not null default '',
	`last_name` varchar(255) not null default '',
	`company` varchar(100) not null default '',
	`address_1` varchar(255) not null default '',
	`address_2` varchar(255) not null default '',
	`city` varchar(50) not null default '',
	`zip` varchar(20) not null default '',
	`country` varchar(50) not null default '',
	`country_iso2` varchar(2) not null default '',
	`country_id` int unsigned not null default '0',
	`state` varchar(100) not null default '',
	`state_id` int unsigned not null default '0',
	`email` varchar(250) not null default '',
	`phone` varchar(250) not null default '',
	`form_session_id` int unsigned NOT NULL default '0',
	`total_items` int unsigned NOT NULL default '0',
	`shipping_adress_id` int unsigned NOT NULL default '0', 
	PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]order_shipping` (
	`id` int unsigned not null auto_increment,
	`order_address_id` int unsigned not null,
	`order_id` int unsigned not null,
	`base_cost` decimal(20, 4) not null default '0',
	`cost_ex_tax` decimal(20, 4) not null default '0',
	`cost_inc_tax` decimal(20, 4) not null default '0',
	`tax` decimal(20, 4) not null default '0',
	`method` varchar(250) not null default '',
	`module` varchar(100) not null default '',
	`tax_class_id` int unsigned not null default '0',
	`base_handling_cost` decimal(20,4) NOT NULL default '0',
	`handling_cost_ex_tax` decimal(20,4) NOT NULL default '0',
	`handling_cost_inc_tax` decimal(20,4) NOT NULL default '0',
	`handling_cost_tax` decimal(20,4) NOT NULL default '0',
	`handling_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
	`shipping_zone_id` int unsigned not null default '0',
	`shipping_zone_name` varchar(250) not null default '',
	`total_shipped` int unsigned not null default '0',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
