-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 25 2010 г., 11:22
-- Версия сервера: 5.1.41
-- Версия PHP: 5.3.2-1ubuntu4.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `sibposad_dj`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `auth_group`
--


-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Структура таблицы `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=124 ;

--
-- Дамп данных таблицы `auth_message`
--


-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=91 ;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add site', 8, 'add_site'),
(23, 'Can change site', 8, 'change_site'),
(24, 'Can delete site', 8, 'delete_site'),
(25, 'Can add placeholder', 9, 'add_placeholder'),
(26, 'Can change placeholder', 9, 'change_placeholder'),
(27, 'Can delete placeholder', 9, 'delete_placeholder'),
(28, 'Can add page', 10, 'add_page'),
(29, 'Can change page', 10, 'change_page'),
(30, 'Can delete page', 10, 'delete_page'),
(31, 'Can add PageModerator', 11, 'add_pagemoderator'),
(32, 'Can change PageModerator', 11, 'change_pagemoderator'),
(33, 'Can delete PageModerator', 11, 'delete_pagemoderator'),
(34, 'Can add Page moderator state', 12, 'add_pagemoderatorstate'),
(35, 'Can change Page moderator state', 12, 'change_pagemoderatorstate'),
(36, 'Can delete Page moderator state', 12, 'delete_pagemoderatorstate'),
(37, 'Can add Page global permission', 13, 'add_globalpagepermission'),
(38, 'Can change Page global permission', 13, 'change_globalpagepermission'),
(39, 'Can delete Page global permission', 13, 'delete_globalpagepermission'),
(40, 'Can add Page permission', 14, 'add_pagepermission'),
(41, 'Can change Page permission', 14, 'change_pagepermission'),
(42, 'Can delete Page permission', 14, 'delete_pagepermission'),
(43, 'Can add User (page)', 15, 'add_pageuser'),
(44, 'Can change User (page)', 15, 'change_pageuser'),
(45, 'Can delete User (page)', 15, 'delete_pageuser'),
(46, 'Can add User group (page)', 16, 'add_pageusergroup'),
(47, 'Can change User group (page)', 16, 'change_pageusergroup'),
(48, 'Can delete User group (page)', 16, 'delete_pageusergroup'),
(49, 'Can add cms plugin', 17, 'add_cmsplugin'),
(50, 'Can change cms plugin', 17, 'change_cmsplugin'),
(51, 'Can delete cms plugin', 17, 'delete_cmsplugin'),
(52, 'Can add title', 18, 'add_title'),
(53, 'Can change title', 18, 'change_title'),
(54, 'Can delete title', 18, 'delete_title'),
(55, 'Can add text', 19, 'add_text'),
(56, 'Can change text', 19, 'change_text'),
(57, 'Can delete text', 19, 'delete_text'),
(58, 'Can add picture', 20, 'add_picture'),
(59, 'Can change picture', 20, 'change_picture'),
(60, 'Can delete picture', 20, 'delete_picture'),
(61, 'Can add link', 21, 'add_link'),
(62, 'Can change link', 21, 'change_link'),
(63, 'Can delete link', 21, 'delete_link'),
(64, 'Can add file', 22, 'add_file'),
(65, 'Can change file', 22, 'change_file'),
(66, 'Can delete file', 22, 'delete_file'),
(67, 'Can add video', 23, 'add_video'),
(68, 'Can change video', 23, 'change_video'),
(69, 'Can delete video', 23, 'delete_video'),
(70, 'Can add News', 24, 'add_news'),
(71, 'Can change News', 24, 'change_news'),
(72, 'Can delete News', 24, 'delete_news'),
(73, 'Can add latest news plugin', 25, 'add_latestnewsplugin'),
(74, 'Can change latest news plugin', 25, 'change_latestnewsplugin'),
(75, 'Can delete latest news plugin', 25, 'delete_latestnewsplugin'),
(76, 'Can add Gallery', 26, 'add_gallery'),
(77, 'Can change Gallery', 26, 'change_gallery'),
(78, 'Can delete Gallery', 26, 'delete_gallery'),
(79, 'Can add Picture', 27, 'add_picture'),
(80, 'Can change Picture', 27, 'change_picture'),
(81, 'Can delete Picture', 27, 'delete_picture'),
(82, 'Can add gallery plugin', 28, 'add_galleryplugin'),
(83, 'Can change gallery plugin', 28, 'change_galleryplugin'),
(84, 'Can delete gallery plugin', 28, 'delete_galleryplugin'),
(85, 'Can add Мнение', 29, 'add_opinion'),
(86, 'Can change Мнение', 29, 'change_opinion'),
(87, 'Can delete Мнение', 29, 'delete_opinion'),
(88, 'Can add Элемент списка', 30, 'add_roster'),
(89, 'Can change Элемент списка', 30, 'change_roster'),
(90, 'Can delete Элемент списка', 30, 'delete_roster');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'husky', '', '', 'wolf@fxsoft.ru', 'sha1$7e6de$eefd82d461fe9a751a5bb73ff807ee4a4a112b4e', 1, 1, 1, '2010-12-20 22:38:04', '2010-12-08 01:43:19');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_file`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_file` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_file`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_galleryplugin`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_galleryplugin` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_galleryplugin_34838cc3` (`gallery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_galleryplugin`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_latestnewsplugin`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_latestnewsplugin` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `limit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_latestnewsplugin`
--

INSERT INTO `cmsplugin_latestnewsplugin` (`cmsplugin_ptr_id`, `limit`) VALUES
(16, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_link`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_link` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `mailto` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_link_37c07cc5` (`page_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_link`
--

INSERT INTO `cmsplugin_link` (`cmsplugin_ptr_id`, `name`, `url`, `page_link_id`, `mailto`) VALUES
(25, 'Услуги', '', 4, ''),
(26, 'Услуги малое строительство', '', 6, ''),
(27, 'Теже услуги на самом деле ', '', 6, ''),
(28, 'Услуги малое строительство', '', 6, '');

-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_picture`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_picture` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longdesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `float` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_picture_37c07cc5` (`page_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_picture`
--

INSERT INTO `cmsplugin_picture` (`cmsplugin_ptr_id`, `image`, `url`, `page_link_id`, `alt`, `longdesc`, `float`) VALUES
(14, 'cms_page_media/3/map.png', '', NULL, '', '', 'right'),
(5, 'cms_page_media/1/map_1.png', '', NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_text`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_text` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `cmsplugin_ptr_id` (`cmsplugin_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_text`
--

INSERT INTO `cmsplugin_text` (`cmsplugin_ptr_id`, `body`) VALUES
(7, 'Общество с ограниченной ответственностью Специализированное Строительное Управление \r\n«Сибирский Посад» зарегистрировано в качестве строительной фирмы в городе Барнауле 28 марта 2000 года \r\n(лицензия ГС 6-22-02-27-0—2224067358-002906-2 от 06.06.2005). Мы выполняем весь комплекс строительных \r\nработ от проектирования до сдачи объекта «под ключ».'),
(6, '<p>656000, Россия, Алтайский край,\r\nг. Барнаул, ул. \r\nМало-Тобольская 20.</p><h2><strong><br />Тел/факс:</strong> (3852) 240-631; 637-131<br />&#160;</h2> \r\n\r\n<p><strong>E-mail:</strong> sib-posad@inbox.ru</p>'),
(8, 'В нашем офисе мы предложим Вам выбрать наиболее понравившийся и удобный \r\nдля Вас проект. Вам будет представлена подробная информация о выполнении\r\n проектно-строительных работ и технологи строительства.'),
(9, '<p>Благоустройство территорий</p> Перспективным направлением работы наше  Строительное Управление считает работы по благоустройству территорий.'),
(10, '<p>Отделка и ремонт фасадов</p>&#160;Наши специалисты имеют большой опыт по отделке новых и ремонту старых фасадов любой \r\nсложности с применением как самых современных, так и проверенных временем и климатом Сибири отделочных материалов. '),
(11, '<p>Высотные работы</p>&#160;Специализацией одного из участков является выполнение высотных работ на отметках более \r\n100 метров, таких как ремонт дымовых труб, антикоррозийная защита металлоконструкций'),
(12, '<p> <strong>Общество с ограниченной ответственностью Специализированное Строительное Управление \r\n«Сибирский Посад» зарегистрировано в качестве строительной фирмы в городе Барнауле 28 марта 2000 года \r\n(лицензия ГС 6-22-02-27-0—2224067358-002906-2 от 06.06.2005). </strong></p><p>\r\n\r\nМы выполняем весь комплекс строительных работ от проектирования до сдачи объекта «под ключ».\r\n </p><p><br />Специализацией одного из участков является выполнение высотных работ на отметках более \r\n100 метров, таких как ремонт дымовых труб, антикоррозийная защита металлоконструкций. </p><p><br />Наши специалисты имеют большой опыт по отделке новых и ремонту старых фасадов любой \r\nсложности с применением как самых современных, так и проверенных временем и климатом Сибири отделочных материалов. </p><p><br />Перспективным направлением работы наше  Строительное Управление считает работы по благоустройству территорий.\r\n\r\n</p><h2>&#160;Основными видами деятельности «Сибирского Посада» являются: \r\n&#160;&#160; </h2><h3><br />Новое строительство <br />&#160;</h3>\r\n<ul><li>	Функции заказчика-застройщика;</li><li>	Функции генподрядчика;</li><li>  	Общестроительный работы;</li><li>	Дома под ключ;</li><li>	Благоустройство;</li><li>	Монтаж, антикоррозийная защита металлоконструкций </li><li>	Наружные и внутренние сети;</li><li>	Монтаж отопления;</li><li>	Монтаж вентиляций;</li><li>	Промышленный альпинизм;</li><li>	Пусконаладочные работы;</li></ul><h3>\r\n&#160; <br />&#160;Все виды ремонта\r\n<br />&#160;</h3><ul><li>  	Фасад;</li><li>	Кровля;</li><li>	Наружные и внутренние сети;</li><li>	Отделка помещений;</li></ul><h3>\r\n\r\n&#160;&#160; <br />Проектирование<br />&#160;</h3><ul><li>	Частное домостроение;</li><li>	Туристические базы;</li><li>	Спортивные, торговые комплексы;</li></ul><h3>\r\n&#160; <br />&#160;Ландшафтная архитектура<br />&#160;</h3><p>В нашем офисе мы предложим Вам выбрать наиболее понравившийся и \r\nудобный для Вас проект. Вам будет представлена подробная информация о \r\nвыполнении проектно-строительных работ и технологи строительства. \r\n \r\n </p>'),
(13, '<p>656000, Россия, Алтайский край,\r\n<br />г. Барнаул, ул. \r\nМало-Тобольская 20.<br /><strong>Тел/факс:</strong> (3852) 240-631; 637-131<br /><strong>E-mail:</strong> sib-posad@inbox.ru</p><p><img src="../../../images/plugins/image.png" alt="Изображение - map.png" title="Изображение - map.png" id="plugin_obj_14" /></p> \r\n\r\n'),
(15, '<p>текст первой новости целиком </p>'),
(17, 'Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость Первая новость '),
(18, 'Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость Второая новость <br />'),
(19, 'третья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новостьтретья новость'),
(21, 'ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" ООО "Второй отзыв" <br />'),
(22, 'Вчера наткнулся на статью Rama Vadakattu <a href="http://blog.dpeepul.com/2009/08/31/top-10-tips-to-a-new-django-developer/">Top 10 tips to a new django developer</a>\r\n о том что должны знать программисты новички на Django. Мой опыт не так \r\nвелик в Django, но что бы собрать подобные знания и выработать навыки \r\nпонадобился прочтение не одной умной статьи. Не со всеми советами я \r\nсогласен, но каждый программист Django должен знать описанные моменты. \r\nСоветую прочитать оригинал, ну а "ленивым" полезно будет дочитать до \r\nконца.Вчера наткнулся на статью Rama Vadakattu <a href="http://blog.dpeepul.com/2009/08/31/top-10-tips-to-a-new-django-developer/">Top 10 tips to a new django developer</a>\r\n о том что должны знать программисты новички на Django. Мой опыт не так \r\nвелик в Django, но что бы собрать подобные знания и выработать навыки \r\nпонадобился прочтение не одной умной статьи. Не со всеми советами я \r\nсогласен, но каждый программист Django должен знать описанные моменты. \r\nСоветую прочитать оригинал, ну а "ленивым" полезно будет дочитать до \r\nконца.Вчера наткнулся на статью Rama Vadakattu <a href="http://blog.dpeepul.com/2009/08/31/top-10-tips-to-a-new-django-developer/">Top 10 tips to a new django developer</a>\r\n о том что должны знать программисты новички на Django. Мой опыт не так \r\nвелик в Django, но что бы собрать подобные знания и выработать навыки \r\nпонадобился прочтение не одной умной статьи. Не со всеми советами я \r\nсогласен, но каждый программист Django должен знать описанные моменты. \r\nСоветую прочитать оригинал, ну а "ленивым" полезно будет дочитать до \r\nконца.Вчера наткнулся на статью Rama Vadakattu <a href="http://blog.dpeepul.com/2009/08/31/top-10-tips-to-a-new-django-developer/">Top 10 tips to a new django developer</a>\r\n о том что должны знать программисты новички на Django. Мой опыт не так \r\nвелик в Django, но что бы собрать подобные знания и выработать навыки \r\nпонадобился прочтение не одной умной статьи. Не со всеми советами я \r\nсогласен, но каждый программист Django должен знать описанные моменты. \r\nСоветую прочитать оригинал, ну а "ленивым" полезно будет дочитать до \r\nконца.Вчера наткнулся на статью Rama Vadakattu <a href="http://blog.dpeepul.com/2009/08/31/top-10-tips-to-a-new-django-developer/">Top 10 tips to a new django developer</a>\r\n о том что должны знать программисты новички на Django. Мой опыт не так \r\nвелик в Django, но что бы собрать подобные знания и выработать навыки \r\nпонадобился прочтение не одной умной статьи. Не со всеми советами я \r\nсогласен, но каждый программист Django должен знать описанные моменты. \r\nСоветую прочитать оригинал, ну а "ленивым" полезно будет дочитать до \r\nконца.Вчера наткнулся на статью Rama Vadakattu <a href="http://blog.dpeepul.com/2009/08/31/top-10-tips-to-a-new-django-developer/">Top 10 tips to a new django developer</a>\r\n о том что должны знать программисты новички на Django. Мой опыт не так \r\nвелик в Django, но что бы собрать подобные знания и выработать навыки \r\nпонадобился прочтение не одной умной статьи. Не со всеми советами я \r\nсогласен, но каждый программист Django должен знать описанные моменты. \r\nСоветую прочитать оригинал, ну а "ленивым" полезно будет дочитать до \r\nконца.'),
(23, '<p>Наши услуги</p><p>Добрый день. Хотелось бы поделиться с Вами очень интересным вариантом ненормального прграммирования — составлением нормальных алгоритмов Маркова. Этот вариант программирования может служить великолепным умственным отдыхом от привычних языков и сред программирования.<br />Студенты, которых я имею возможность учить, кричат криком, что это сложно, но только до первого собственными руками сделанного рабочего алгоритма, потом это перетекает в очень интересные алгоритмические задачки.<br />Собственно, к теме этого поста: наша задача написать нормальный алгоритм Маркова для деления двух целых чисел с точностью 4 знака после запятой(для задания чисел пользуемся унарной системой исчисления). Например, вход: |/||||, выход: 0.25.<br />При этом у нас есть только одна операция — замена одной подстроки в исходной строке на другую. Кому интересно что это такое и как это работает — добро пожаловать под кат.</p><p><img src="/media/cms/images/plugins/link.png" alt="Ссылка - Услуги малое строительство" title="Ссылка - Услуги малое строительство" id="plugin_obj_28" /></p>'),
(24, '<p><img src="/media/cms/images/plugins/link.png" alt="Ссылка - Услуги" title="Ссылка - Услуги" id="plugin_obj_25" /></p><p>11111111Добрый день. Хотелось бы поделиться с Вами очень интересным вариантом ненормального прграммирования — составлением нормальных алгоритмов Маркова. Этот вариант программирования может служить великолепным умственным отдыхом от привычних языков и сред программирования.</p><p>Студенты, которых я имею возможность учить, кричат криком, что это сложно, но только до первого собственными руками сделанного рабочего алгоритма, потом это перетекает в очень интересные алгоритмические задачки.Собственно, к теме этого поста: наша задача написать нормальный алгоритм Маркова для деления двух целых чисел с точностью 4 знака после запятой(для задания чисел пользуемся унарной системой исчисления). Например, вход: |/||||, выход: 0.25.При этом у нас есть только одна операция — замена одной подстроки в исходной строке на другую. Кому интересно что это такое и как это работает — добро пожаловать под кат.</p><p><img src="/media/cms/images/plugins/link.png" alt="Ссылка - Услуги малое строительство" title="Ссылка - Услуги малое строительство" id="plugin_obj_26" /></p><p><img src="/media/cms/images/plugins/link.png" alt="Ссылка - Теже услуги на самом деле " title="Ссылка - Теже услуги на самом деле " id="plugin_obj_27" /></p>'),
(29, 'Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 Коксовая батарея 3 <br />');

-- --------------------------------------------------------

--
-- Структура таблицы `cmsplugin_video`
--

CREATE TABLE IF NOT EXISTS `cmsplugin_video` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `movie` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movie_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `height` smallint(5) unsigned NOT NULL,
  `auto_play` tinyint(1) NOT NULL,
  `auto_hide` tinyint(1) NOT NULL,
  `fullscreen` tinyint(1) NOT NULL,
  `loop` tinyint(1) NOT NULL,
  `bgcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `textcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `seekbarcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `seekbarbgcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `loadingbarcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `buttonoutcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `buttonovercolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `buttonhighlightcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cmsplugin_video`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_cmsplugin`
--

CREATE TABLE IF NOT EXISTS `cms_cmsplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `publisher_state` smallint(6) NOT NULL,
  `placeholder_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_cmsplugin_16d2d3fa` (`publisher_is_draft`),
  KEY `cms_cmsplugin_5ffeb0a6` (`publisher_state`),
  KEY `cms_cmsplugin_3e35d7b0` (`placeholder_id`),
  KEY `cms_cmsplugin_63f17a16` (`parent_id`),
  KEY `cms_cmsplugin_75853655` (`language`),
  KEY `cms_cmsplugin_52f8f330` (`plugin_type`),
  KEY `cms_cmsplugin_2a8f42e8` (`level`),
  KEY `cms_cmsplugin_42b06ff6` (`lft`),
  KEY `cms_cmsplugin_6eabc1a6` (`rght`),
  KEY `cms_cmsplugin_102f80d8` (`tree_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `cms_cmsplugin`
--

INSERT INTO `cms_cmsplugin` (`id`, `publisher_is_draft`, `publisher_public_id`, `publisher_state`, `placeholder_id`, `parent_id`, `position`, `language`, `plugin_type`, `creation_date`, `level`, `lft`, `rght`, `tree_id`) VALUES
(8, 1, NULL, 1, 5, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 23:39:33', 0, 1, 2, 5),
(7, 1, NULL, 1, 1, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 23:30:02', 0, 1, 2, 4),
(6, 1, NULL, 1, 6, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 11:21:34', 0, 1, 2, 3),
(5, 1, NULL, 1, 7, NULL, 0, 'ru', 'PicturePlugin', '2010-12-09 23:21:19', 0, 1, 2, 2),
(9, 1, NULL, 1, 4, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 23:41:02', 0, 1, 2, 6),
(10, 1, NULL, 1, 3, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 23:43:11', 0, 1, 2, 7),
(11, 1, NULL, 1, 2, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 11:44:30', 0, 1, 2, 8),
(12, 1, NULL, 1, 15, NULL, 0, 'ru', 'TextPlugin', '2010-12-09 11:52:34', 0, 1, 2, 9),
(13, 1, NULL, 1, 16, NULL, 0, 'ru', 'TextPlugin', '2010-12-10 12:06:40', 0, 1, 4, 10),
(14, 1, NULL, 1, 16, 13, NULL, 'ru', 'PicturePlugin', '2010-12-11 00:07:50', 1, 2, 3, 10),
(15, 1, NULL, 1, 19, NULL, NULL, 'ru', 'TextPlugin', '2010-12-11 16:31:51', 0, 1, 2, 11),
(16, 1, NULL, 1, 23, NULL, 0, 'ru', 'CMSLatestNewsPlugin', '2010-12-11 17:11:51', 0, 1, 2, 12),
(17, 1, NULL, 1, 25, NULL, NULL, 'ru', 'TextPlugin', '2010-12-13 21:50:45', 0, 1, 2, 13),
(18, 1, NULL, 1, 27, NULL, NULL, 'ru', 'TextPlugin', '2010-12-13 21:51:56', 0, 1, 2, 14),
(19, 1, NULL, 1, 29, NULL, 0, 'ru', 'TextPlugin', '2010-12-13 23:09:00', 0, 1, 2, 15),
(21, 1, NULL, 1, 33, NULL, NULL, 'ru', 'TextPlugin', '2010-12-18 14:11:21', 0, 1, 2, 17),
(22, 1, NULL, 1, 35, NULL, NULL, 'ru', 'TextPlugin', '2010-12-18 19:08:19', 0, 1, 2, 18),
(23, 1, NULL, 1, 17, NULL, 0, 'ru', 'TextPlugin', '2010-12-19 22:55:39', 0, 1, 4, 19),
(24, 1, NULL, 1, 36, NULL, 0, 'ru', 'TextPlugin', '2010-12-19 23:44:44', 0, 1, 8, 20),
(25, 1, NULL, 1, 36, 24, NULL, 'ru', 'LinkPlugin', '2010-12-20 01:16:00', 1, 2, 3, 20),
(26, 1, NULL, 1, 36, 24, NULL, 'ru', 'LinkPlugin', '2010-12-20 01:17:48', 1, 4, 5, 20),
(27, 1, NULL, 1, 36, 24, NULL, 'ru', 'LinkPlugin', '2010-12-20 01:19:49', 1, 6, 7, 20),
(28, 1, NULL, 1, 17, 23, NULL, 'ru', 'LinkPlugin', '2010-12-20 01:21:11', 1, 2, 3, 19),
(29, 1, NULL, 1, 46, NULL, NULL, 'ru', 'TextPlugin', '2010-12-21 03:43:47', 0, 1, 2, 21);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_globalpagepermission`
--

CREATE TABLE IF NOT EXISTS `cms_globalpagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_moderate` tinyint(1) NOT NULL,
  `can_recover_page` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_globalpagepermission_403f60f` (`user_id`),
  KEY `cms_globalpagepermission_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `cms_globalpagepermission`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_globalpagepermission_sites`
--

CREATE TABLE IF NOT EXISTS `cms_globalpagepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalpagepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `globalpagepermission_id` (`globalpagepermission_id`,`site_id`),
  KEY `cms_globalpagepermission_sites_a21423f` (`globalpagepermission_id`),
  KEY `cms_globalpagepermission_sites_6223029` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `cms_globalpagepermission_sites`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_page`
--

CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `publisher_state` smallint(6) NOT NULL,
  `created_by` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `changed_by` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `publication_date` datetime DEFAULT NULL,
  `publication_end_date` datetime DEFAULT NULL,
  `in_navigation` tinyint(1) NOT NULL,
  `soft_root` tinyint(1) NOT NULL,
  `reverse_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `navigation_extenders` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `template` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `moderator_state` smallint(6) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `menu_login_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_page_16d2d3fa` (`publisher_is_draft`),
  KEY `cms_page_5ffeb0a6` (`publisher_state`),
  KEY `cms_page_63f17a16` (`parent_id`),
  KEY `cms_page_1199bb9e` (`publication_date`),
  KEY `cms_page_5dde019c` (`publication_end_date`),
  KEY `cms_page_3c0ea264` (`in_navigation`),
  KEY `cms_page_455d889d` (`soft_root`),
  KEY `cms_page_b56116b` (`reverse_id`),
  KEY `cms_page_267392ec` (`navigation_extenders`),
  KEY `cms_page_6223029` (`site_id`),
  KEY `cms_page_2a8f42e8` (`level`),
  KEY `cms_page_42b06ff6` (`lft`),
  KEY `cms_page_6eabc1a6` (`rght`),
  KEY `cms_page_102f80d8` (`tree_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `cms_page`
--

INSERT INTO `cms_page` (`id`, `publisher_is_draft`, `publisher_public_id`, `publisher_state`, `created_by`, `changed_by`, `parent_id`, `creation_date`, `publication_date`, `publication_end_date`, `in_navigation`, `soft_root`, `reverse_id`, `navigation_extenders`, `published`, `template`, `site_id`, `moderator_state`, `level`, `lft`, `rght`, `tree_id`, `login_required`, `menu_login_required`) VALUES
(1, 1, NULL, 1, 'husky', 'husky', NULL, '2010-12-08 01:45:11', '2010-12-09 21:01:38', NULL, 0, 0, NULL, '', 1, 'main.html', 1, 0, 0, 1, 12, 1, 0, 0),
(2, 1, NULL, 1, 'husky', 'husky', 1, '2010-12-09 23:48:11', '2010-12-09 23:49:23', NULL, 1, 0, NULL, '', 1, 'index.html', 1, 1, 1, 2, 3, 1, 0, 0),
(3, 1, NULL, 1, 'husky', 'husky', 1, '2010-12-11 00:04:07', '2010-12-11 00:04:14', NULL, 1, 0, NULL, '', 1, 'index.html', 1, 1, 1, 4, 5, 1, 0, 0),
(4, 1, NULL, 1, 'husky', 'husky', 1, '2010-12-10 12:20:04', '2010-12-10 12:20:10', NULL, 1, 0, NULL, '', 1, 'index.html', 1, 1, 1, 6, 9, 1, 0, 0),
(5, 1, NULL, 1, 'husky', 'husky', 1, '2010-12-11 17:11:33', '2010-12-11 17:13:06', NULL, 1, 0, 'last-news', '', 1, 'news.html', 1, 0, 1, 10, 11, 1, 0, 0),
(6, 1, NULL, 1, 'husky', 'husky', 4, '2010-12-19 23:44:28', '2010-12-19 23:44:56', NULL, 0, 0, NULL, '', 1, 'INHERIT', 1, 0, 2, 7, 8, 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pagemoderator`
--

CREATE TABLE IF NOT EXISTS `cms_pagemoderator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `moderate_page` tinyint(1) NOT NULL,
  `moderate_children` tinyint(1) NOT NULL,
  `moderate_descendants` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagemoderator_32d04bc7` (`page_id`),
  KEY `cms_pagemoderator_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `cms_pagemoderator`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_pagemoderatorstate`
--

CREATE TABLE IF NOT EXISTS `cms_pagemoderatorstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `action` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagemoderatorstate_32d04bc7` (`page_id`),
  KEY `cms_pagemoderatorstate_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `cms_pagemoderatorstate`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_pagepermission`
--

CREATE TABLE IF NOT EXISTS `cms_pagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_moderate` tinyint(1) NOT NULL,
  `grant_on` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagepermission_403f60f` (`user_id`),
  KEY `cms_pagepermission_425ae3c4` (`group_id`),
  KEY `cms_pagepermission_32d04bc7` (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `cms_pagepermission`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_pageuser`
--

CREATE TABLE IF NOT EXISTS `cms_pageuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `cms_pageuser_4a21cf42` (`created_by_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cms_pageuser`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_pageusergroup`
--

CREATE TABLE IF NOT EXISTS `cms_pageusergroup` (
  `group_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  KEY `cms_pageusergroup_4a21cf42` (`created_by_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `cms_pageusergroup`
--


-- --------------------------------------------------------

--
-- Структура таблицы `cms_page_placeholders`
--

CREATE TABLE IF NOT EXISTS `cms_page_placeholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `placeholder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_id` (`page_id`,`placeholder_id`),
  KEY `cms_page_placeholders_32d04bc7` (`page_id`),
  KEY `cms_page_placeholders_3e35d7b0` (`placeholder_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `cms_page_placeholders`
--

INSERT INTO `cms_page_placeholders` (`id`, `page_id`, `placeholder_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 3, 16),
(17, 4, 17),
(18, 5, 23),
(19, 6, 36);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_placeholder`
--

CREATE TABLE IF NOT EXISTS `cms_placeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `default_width` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_placeholder_400badfd` (`slot`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

--
-- Дамп данных таблицы `cms_placeholder`
--

INSERT INTO `cms_placeholder` (`id`, `slot`, `default_width`) VALUES
(1, '''about''', NULL),
(2, '''cube1''', NULL),
(3, '''cube2''', NULL),
(4, '''cube3''', NULL),
(5, '''cube4''', NULL),
(6, '''foot''', NULL),
(7, '''foot-img''', NULL),
(8, '''about''', NULL),
(9, '''cube1''', NULL),
(10, '''cube2''', NULL),
(11, '''cube3''', NULL),
(12, '''cube4''', NULL),
(13, '''foot''', NULL),
(14, '''foot-img''', NULL),
(15, '''content''', NULL),
(16, '''content''', NULL),
(17, '''content''', NULL),
(18, 'content', NULL),
(19, 'content', NULL),
(20, 'content', NULL),
(21, 'content', NULL),
(22, 'content', NULL),
(23, '''content''', NULL),
(24, 'content', NULL),
(25, 'content', NULL),
(26, 'content', NULL),
(27, 'content', NULL),
(28, 'content', NULL),
(29, 'content', NULL),
(30, 'content', NULL),
(31, 'content', NULL),
(32, 'content', NULL),
(33, 'content', NULL),
(34, 'content', NULL),
(35, 'content', NULL),
(36, '''content''', NULL),
(37, 'content', NULL),
(38, 'content', NULL),
(39, 'content', NULL),
(40, 'content', NULL),
(41, 'content', NULL),
(42, 'content', NULL),
(43, 'content', NULL),
(44, 'content', NULL),
(45, 'content', NULL),
(46, 'content', NULL),
(47, 'content', NULL),
(48, 'content', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_title`
--

CREATE TABLE IF NOT EXISTS `cms_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `publisher_state` smallint(6) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_url_overwrite` tinyint(1) NOT NULL,
  `application_urls` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_is_draft` (`publisher_is_draft`,`language`,`page_id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_title_16d2d3fa` (`publisher_is_draft`),
  KEY `cms_title_5ffeb0a6` (`publisher_state`),
  KEY `cms_title_75853655` (`language`),
  KEY `cms_title_56ae2a2a` (`slug`),
  KEY `cms_title_6a8a34e2` (`path`),
  KEY `cms_title_3d964e2e` (`has_url_overwrite`),
  KEY `cms_title_23b1fc68` (`application_urls`),
  KEY `cms_title_32d04bc7` (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `cms_title`
--

INSERT INTO `cms_title` (`id`, `publisher_is_draft`, `publisher_public_id`, `publisher_state`, `language`, `title`, `menu_title`, `slug`, `path`, `has_url_overwrite`, `application_urls`, `redirect`, `meta_description`, `meta_keywords`, `page_title`, `page_id`, `creation_date`) VALUES
(1, 1, NULL, 1, 'ru', 'Главная', '', 'glavnaya', 'glavnaya', 0, '', '', '', '', 'ООО «Сибирский Посад»', 1, '2010-12-08 01:45:11'),
(2, 1, NULL, 1, 'ru', 'О компании', '', 'about', 'glavnaya/about', 0, '', '', '', '', '', 2, '2010-12-09 23:48:11'),
(3, 1, NULL, 1, 'ru', 'Контакты', '', 'contacts', 'glavnaya/contacts', 0, '', '', '', '', 'ООО «Сибирский Посад» Контакты', 3, '2010-12-11 00:04:07'),
(4, 1, NULL, 1, 'ru', 'Услуги', NULL, 'service', 'glavnaya/service', 0, NULL, NULL, NULL, NULL, NULL, 4, '2010-12-10 12:20:04'),
(5, 1, NULL, 1, 'ru', 'Новости', '', 'last-news', 'glavnaya/last-news', 0, '', '', '', '', '', 5, '2010-12-11 17:11:33'),
(6, 1, NULL, 1, 'ru', 'uslugi1', '', 'uslugi1', 'glavnaya/service/uslugi1', 0, '', '', '', '', '', 6, '2010-12-19 23:44:28');

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=86 ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2010-12-08 01:45:11', 1, 10, '1', 'Главная', 1, ''),
(2, '2010-12-09 11:28:34', 1, 10, '1', 'Главная', 2, 'Изменен page_title и moderator_state.'),
(3, '2010-12-09 23:48:11', 1, 10, '2', 'О компании', 1, ''),
(4, '2010-12-09 23:48:39', 1, 10, '2', 'О компании', 2, 'Изменен template и moderator_state.'),
(5, '2010-12-11 00:04:07', 1, 10, '3', 'Контакты', 1, ''),
(6, '2010-12-10 12:16:54', 1, 10, '3', 'Контакты', 2, 'Изменен page_title и moderator_state.'),
(7, '2010-12-10 12:20:04', 1, 10, '4', 'Услуги', 1, ''),
(8, '2010-12-11 15:53:34', 1, 24, '1', 'Первая новость', 1, ''),
(9, '2010-12-11 16:31:08', 1, 24, '1', 'Первая новость', 2, 'Изменен content и is_published.'),
(10, '2010-12-11 16:32:08', 1, 24, '1', 'Первая новость', 2, 'Изменен content.'),
(11, '2010-12-11 16:36:39', 1, 24, '2', 'Второая новость ', 1, ''),
(12, '2010-12-11 17:11:33', 1, 10, '5', 'Новости', 1, ''),
(13, '2010-12-11 17:34:56', 1, 10, '5', 'Новости', 2, 'Изменен slug и moderator_state.'),
(14, '2010-12-11 17:36:11', 1, 10, '5', 'Новости', 2, 'Изменен moderator_state.'),
(15, '2010-12-11 17:36:57', 1, 10, '5', 'Новости', 2, 'Изменен moderator_state.'),
(16, '2010-12-11 17:49:11', 1, 10, '5', 'Новости', 2, 'Изменен moderator_state.'),
(17, '2010-12-11 18:10:33', 1, 24, '1', 'Первая новость', 2, 'Изменен excerpt и content.'),
(18, '2010-12-11 18:11:04', 1, 24, '1', 'Первая новость', 2, 'Изменен content.'),
(19, '2010-12-13 21:50:26', 1, 24, '1', 'Первая новость', 1, ''),
(20, '2010-12-13 21:50:36', 1, 24, '1', 'Первая новость', 2, 'Изменен content и is_published.'),
(21, '2010-12-13 21:51:03', 1, 24, '1', 'Первая новость', 2, 'Изменен content.'),
(22, '2010-12-13 21:51:34', 1, 24, '2', 'Второая новость ', 1, ''),
(23, '2010-12-13 21:52:12', 1, 24, '2', 'Второая новость ', 2, 'Изменен content.'),
(24, '2010-12-13 21:52:19', 1, 24, '2', 'Второая новость ', 2, 'Изменен content.'),
(25, '2010-12-13 23:08:39', 1, 24, '3', 'третья новость', 1, ''),
(26, '2010-12-13 23:08:47', 1, 24, '3', 'третья новость', 2, 'Изменен content и is_published.'),
(27, '2010-12-13 23:09:17', 1, 24, '3', 'третья новость', 2, 'Изменен content.'),
(28, '2010-12-13 23:36:13', 1, 26, '1', 'Для новости', 1, ''),
(29, '2010-12-13 23:37:12', 1, 27, '1', 'logo1', 1, ''),
(30, '2010-12-13 23:37:28', 1, 27, '2', 'logo2', 1, ''),
(31, '2010-12-14 00:12:10', 1, 27, '3', 'pos1', 1, ''),
(32, '2010-12-14 00:14:29', 1, 27, '4', 'Для новости', 1, ''),
(33, '2010-12-14 00:14:41', 1, 27, '5', 'Для новости', 1, ''),
(34, '2010-12-14 00:14:59', 1, 27, '6', 'Для новости', 1, ''),
(35, '2010-12-14 00:34:12', 1, 27, '3', 'pos1', 3, ''),
(36, '2010-12-14 01:56:14', 1, 24, '1', 'Первая новость Первая новостьПервая новость', 2, 'Изменен title и content.'),
(37, '2010-12-14 01:56:40', 1, 24, '2', 'Второая новость  новость  новость  новость  новость  новость  новость  новость  новость  новость  новость  новость  новость ', 2, 'Изменен title и content.'),
(38, '2010-12-18 03:17:52', 1, 29, '1', 'Первое мнение', 1, ''),
(39, '2010-12-18 03:43:41', 1, 10, '5', 'Новости', 2, 'Изменен template и moderator_state.'),
(40, '2010-12-18 14:11:13', 1, 29, '2', 'ООО "Второй отзыв"', 1, ''),
(41, '2010-12-18 14:12:10', 1, 29, '2', 'ООО "Второй отзыв"', 2, 'Изменен content и pub_date.'),
(42, '2010-12-18 19:07:57', 1, 29, '3', 'ООО Три', 1, ''),
(43, '2010-12-18 19:08:10', 1, 29, '3', 'ООО Три', 2, 'Изменен content и is_published.'),
(44, '2010-12-19 23:44:28', 1, 10, '6', 'uslugi1', 1, ''),
(45, '2010-12-19 23:44:56', 1, 10, '6', 'uslugi1', 2, 'Изменен published и moderator_state.'),
(46, '2010-12-20 23:03:14', 1, 30, '1', 'Коксовая батарея 1', 1, ''),
(47, '2010-12-20 23:08:59', 1, 30, '2', 'Коксовая батарея 2 ', 1, ''),
(48, '2010-12-20 23:12:23', 1, 30, '2', 'Коксовая батарея 2 ', 2, 'Изменен content и is_published.'),
(49, '2010-12-21 01:45:40', 1, 30, '1', 'Коксовая батарея 1', 3, ''),
(50, '2010-12-21 01:45:40', 1, 30, '2', 'Коксовая батарея 2 ', 3, ''),
(51, '2010-12-21 01:46:12', 1, 30, '3', 'Коксовая батарея 1 ', 1, ''),
(52, '2010-12-21 01:46:59', 1, 30, '4', 'Коксовая батарея 2', 1, ''),
(53, '2010-12-21 01:47:35', 1, 30, '5', 'Коксовая батарея 3 ', 1, ''),
(54, '2010-12-21 02:28:05', 1, 30, '6', 'Коксовая батарея 4 ', 1, ''),
(55, '2010-12-21 23:35:42', 1, 27, '7', 'Для новости', 1, ''),
(56, '2010-12-22 01:45:45', 1, 10, '5', 'Новости', 2, 'Изменен reverse_id и moderator_state.'),
(57, '2010-12-25 17:54:22', 1, 27, '8', 'Для новости', 1, ''),
(58, '2010-12-25 17:57:21', 1, 27, '9', 'Для новости', 1, ''),
(59, '2010-12-25 18:05:29', 1, 27, '9', 'Для новости', 3, ''),
(60, '2010-12-25 18:05:29', 1, 27, '8', 'Для новости', 3, ''),
(61, '2010-12-25 18:05:45', 1, 27, '10', 'Для новости', 1, ''),
(62, '2010-12-25 18:26:03', 1, 27, '13', 'Для новости', 1, ''),
(63, '2010-12-25 18:26:20', 1, 27, '13', 'Для новости', 3, ''),
(64, '2010-12-25 18:26:20', 1, 27, '12', 'Для новости', 3, ''),
(65, '2010-12-25 18:26:20', 1, 27, '11', 'Для новости', 3, ''),
(66, '2010-12-25 18:26:46', 1, 27, '14', 'Для новости', 1, ''),
(67, '2010-12-25 18:37:40', 1, 27, '14', 'Для новости', 3, ''),
(68, '2010-12-25 18:37:40', 1, 27, '10', 'Для новости', 3, ''),
(69, '2010-12-25 18:37:40', 1, 27, '7', 'Для новости', 3, ''),
(70, '2010-12-25 18:37:40', 1, 27, '6', 'Для новости', 3, ''),
(71, '2010-12-25 18:37:40', 1, 27, '5', 'Для новости', 3, ''),
(72, '2010-12-25 18:37:40', 1, 27, '4', 'Для новости', 3, ''),
(73, '2010-12-25 18:37:40', 1, 27, '2', 'logo2', 3, ''),
(74, '2010-12-25 18:37:52', 1, 27, '1', 'logo1', 3, ''),
(75, '2010-12-25 18:38:09', 1, 26, '1', 'Для новости', 3, ''),
(76, '2010-12-25 18:39:24', 1, 24, '1', 'Первая новость Первая новостьПервая новость', 3, ''),
(77, '2010-12-25 18:39:24', 1, 24, '2', 'Второая новость  новость  новость  новость  новость  новость  новость  новость  новость  новость  новость  новость  новость ', 3, ''),
(78, '2010-12-25 18:39:24', 1, 24, '3', 'третья новость', 3, ''),
(79, '2010-12-25 18:39:47', 1, 30, '3', 'Коксовая батарея 1 ', 3, ''),
(80, '2010-12-25 18:39:47', 1, 30, '4', 'Коксовая батарея 2', 3, ''),
(81, '2010-12-25 18:39:47', 1, 30, '5', 'Коксовая батарея 3 ', 3, ''),
(82, '2010-12-25 18:39:47', 1, 30, '6', 'Коксовая батарея 4 ', 3, ''),
(83, '2010-12-25 18:40:05', 1, 29, '3', 'ООО Три', 3, ''),
(84, '2010-12-25 18:40:05', 1, 29, '1', 'Первое мнение', 3, ''),
(85, '2010-12-25 18:40:05', 1, 29, '2', 'ООО "Второй отзыв"', 3, '');

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'site', 'sites', 'site'),
(9, 'placeholder', 'cms', 'placeholder'),
(10, 'page', 'cms', 'page'),
(11, 'PageModerator', 'cms', 'pagemoderator'),
(12, 'Page moderator state', 'cms', 'pagemoderatorstate'),
(13, 'Page global permission', 'cms', 'globalpagepermission'),
(14, 'Page permission', 'cms', 'pagepermission'),
(15, 'User (page)', 'cms', 'pageuser'),
(16, 'User group (page)', 'cms', 'pageusergroup'),
(17, 'cms plugin', 'cms', 'cmsplugin'),
(18, 'title', 'cms', 'title'),
(19, 'text', 'text', 'text'),
(20, 'picture', 'picture', 'picture'),
(21, 'link', 'link', 'link'),
(22, 'file', 'file', 'file'),
(23, 'video', 'video', 'video'),
(24, 'News', 'news', 'news'),
(25, 'latest news plugin', 'news', 'latestnewsplugin'),
(26, 'Gallery', 'gallery', 'gallery'),
(27, 'Picture', 'gallery', 'picture'),
(28, 'gallery plugin', 'gallery', 'galleryplugin'),
(29, 'Мнение', 'opinion', 'opinion'),
(30, 'Элемент списка', 'roster', 'roster');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b1a8eee81ad62a590214de88da4777ef', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:06'),
('c831ca1305b6d093e621db83d25a32b3', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxA1UpZGphbmdv\nLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEB\ndS5lMWZkNzhkN2UzYTQ0OTBhMTgwOGZlNzMzOTgxYTFhMA==\n', '2010-12-24 12:20:04'),
('db73f7b11b20d7a2ce5974f18e173e94', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5jNzg1MWRkMWVlZjYyNWJhOGQw\nZTNmNDVhN2YzYjUxMw==\n', '2010-12-25 15:36:52'),
('2060f43aa6ec623e2ce3fbe9cb868463', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxA1UpZGphbmdv\nLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEB\ndS5lMWZkNzhkN2UzYTQ0OTBhMTgwOGZlNzMzOTgxYTFhMA==\n', '2010-12-25 17:11:35'),
('f780d16f30ba052b113db8eb26299576', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2010-12-25 17:13:01'),
('9bdb7823b70cbe518a9be50e1ea40d44', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2010-12-25 17:14:23'),
('79ad2498a34bc78536d32abf95a06138', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5jNzg1MWRkMWVlZjYyNWJhOGQw\nZTNmNDVhN2YzYjUxMw==\n', '2010-12-25 17:18:57'),
('2db76db95566c86a75b12021cedb1c2f', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2010-12-25 17:40:02'),
('d9ff762d6adcbeca4a0cdbe8e7e801ed', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2010-12-25 17:49:12'),
('6c51846a49d19e8ad28ff16750cbbdbf', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2010-12-27 21:46:53'),
('fce40ffbc6aed5265ca98013d2dcc9e4', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('11420389b24177fc5938a884e626a588', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('c1a1d76069999517a23262b069cbc55d', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('a04ca19a5c0e64557371bf050ba8bba3', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('09a45e8c114b4e55c9c7865b05dafc3b', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('c12fcab080e1dd7b3d79364ceeeaadf5', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('ebb24115b00afc3a52b9731bda25005c', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2010-12-27 23:42:10'),
('6d64abf6594c8ffb3c266873f3259d2a', 'gAJ9cQEuNWYxZDRlNWYyY2ZmZTM1NTcwMWFlYWQwMDk0NGE0MTY=\n', '2011-01-03 21:08:22'),
('d4d914c8587e595f5f6fce7fa9e20fa7', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2011-01-03 20:53:28'),
('4efbbec82d5975e9c6d81a26be900888', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVRJfYXV0aF91c2VyX2JhY2tlbmRxA1UpZGphbmdv\nLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEB\ndS5lMWZkNzhkN2UzYTQ0OTBhMTgwOGZlNzMzOTgxYTFhMA==\n', '2011-01-03 21:13:03'),
('4aaa92d9b0b44c934d6a6384f5af9d91', 'gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZXECigEBVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRoX3Vz\nZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEF\ndS5jOTM0NTgzZmI5ZGUyMWE4MmQ4NjNjYzRlMGM2Y2UzMw==\n', '2011-01-05 01:45:46');

-- --------------------------------------------------------

--
-- Структура таблицы `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_gallery`
--

CREATE TABLE IF NOT EXISTS `gallery_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `gallery_gallery`
--


-- --------------------------------------------------------

--
-- Структура таблицы `gallery_picture`
--

CREATE TABLE IF NOT EXISTS `gallery_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_picture_34838cc3` (`gallery_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `gallery_picture`
--


-- --------------------------------------------------------

--
-- Структура таблицы `news_news`
--

CREATE TABLE IF NOT EXISTS `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `pub_date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_news_56ae2a2a` (`slug`),
  KEY `news_news_cc8ff3c` (`content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `news_news`
--


-- --------------------------------------------------------

--
-- Структура таблицы `opinion_opinion`
--

CREATE TABLE IF NOT EXISTS `opinion_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `pub_date` datetime NOT NULL,
  `create` datetime NOT NULL,
  `update` datetime NOT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opinion_opinion_56ae2a2a` (`slug`),
  KEY `opinion_opinion_cc8ff3c` (`content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `opinion_opinion`
--


-- --------------------------------------------------------

--
-- Структура таблицы `roster_roster`
--

CREATE TABLE IF NOT EXISTS `roster_roster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `teg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `create` datetime NOT NULL,
  `update` datetime NOT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roster_roster_cc8ff3c` (`content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `roster_roster`
--

