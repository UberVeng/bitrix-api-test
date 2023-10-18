-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 18 2023 г., 12:33
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sitemanager`
--
CREATE DATABASE IF NOT EXISTS `sitemanager` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci;
USE `sitemanager`;

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE `b_admin_notify` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8mb3_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_admin_notify`
--

INSERT INTO `b_admin_notify` (`ID`, `MODULE_ID`, `TAG`, `MESSAGE`, `ENABLE_CLOSE`, `PUBLIC_SECTION`, `NOTIFY_TYPE`) VALUES
(1, 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>', 'Y', 'N', 'M');

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE `b_admin_notify_lang` (
  `ID` int NOT NULL,
  `NOTIFY_ID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE `b_agent` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8mb3_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `USER_ID` int DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2023-10-18 12:29:15', '2023-10-18 12:30:15', NULL, 60, 'N', NULL, 'N', 0),
(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(14, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(15, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(16, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2023-10-18 10:33:33', '2023-10-18 12:33:33', NULL, 7200, 'N', NULL, 'N', 0),
(18, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(19, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(20, 'landing', 100, 'Bitrix\\Landing\\Agent::clearTempFiles();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(23, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(24, 'messageservice', 100, '\\Bitrix\\MessageService\\IncomingMessage::cleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(25, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(26, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(27, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(28, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(29, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(30, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(31, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();', 'Y', '2023-10-18 10:33:33', '2023-10-19 10:33:33', NULL, 86400, 'N', NULL, 'N', 0),
(32, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Immune::load();', 'Y', '2023-10-18 10:33:34', '2023-10-19 10:33:34', NULL, 86400, 'N', NULL, 'N', 0),
(33, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();', 'Y', '2023-10-18 10:33:34', '2023-10-19 10:33:34', NULL, 86400, 'N', NULL, 'N', 0),
(34, 'rest', 100, '\\Bitrix\\Rest\\Helper::recoveryAgents();', 'Y', '2023-10-17 09:37:13', '2023-10-24 09:37:13', NULL, 604800, 'N', NULL, 'N', 0),
(35, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2023-10-18 10:33:34', '2023-10-19 10:33:34', NULL, 86400, 'N', NULL, 'N', 0),
(36, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2023-10-18 10:33:34', '2023-10-19 10:33:34', NULL, 86400, 'N', NULL, 'N', 0),
(37, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2023-10-18 12:16:55', '2023-10-18 12:46:55', NULL, 1800, 'N', NULL, 'N', 0),
(38, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(39, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(40, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2023-10-18 10:33:34', '2023-10-19 10:33:34', NULL, 86400, 'N', NULL, 'N', 0),
(41, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2023-10-18 11:46:51', '2023-10-18 12:46:51', NULL, 3600, 'N', NULL, 'N', 0),
(42, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', '2023-10-18 10:33:34', '2023-10-19 03:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(43, 'ui', 100, '\\Bitrix\\UI\\FileUploader\\TempFileAgent::clearOldRecords();', 'Y', '2023-10-18 12:16:55', '2023-10-18 12:46:55', NULL, 1800, 'N', NULL, 'N', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE `b_app_password` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_buttons`
--

CREATE TABLE `b_b24connector_buttons` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_button_site`
--

CREATE TABLE `b_b24connector_button_site` (
  `ID` int NOT NULL,
  `BUTTON_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_bitrixcloud_option`
--

CREATE TABLE `b_bitrixcloud_option` (
  `ID` int NOT NULL,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_bitrixcloud_option`
--

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1697524674'),
(4, 'monitoring_expire_time', 0, '0', '1697616465');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog`
--

CREATE TABLE `b_blog` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int DEFAULT NULL,
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GROUP_ID` int NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog`
--

INSERT INTO `b_blog` (`ID`, `NAME`, `DESCRIPTION`, `DATE_CREATE`, `DATE_UPDATE`, `ACTIVE`, `OWNER_ID`, `SOCNET_GROUP_ID`, `URL`, `REAL_URL`, `GROUP_ID`, `ENABLE_COMMENTS`, `ENABLE_IMG_VERIF`, `ENABLE_RSS`, `LAST_POST_ID`, `LAST_POST_DATE`, `AUTO_GROUPS`, `EMAIL_NOTIFY`, `ALLOW_HTML`, `SEARCH_INDEX`, `USE_SOCNET`, `EDITOR_USE_FONT`, `EDITOR_USE_LINK`, `EDITOR_USE_IMAGE`, `EDITOR_USE_VIDEO`, `EDITOR_USE_FORMAT`) VALUES
(1, 'Блог пользователя', '', '2023-10-17 09:37:49', '2023-10-17 09:37:50', 'Y', 1, NULL, 'admin-blog-s1', NULL, 1, 'Y', 'Y', 'Y', 5, '2023-10-17 09:37:50', NULL, 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N'),
(2, 'Блог для комментариев к фотографиям (s1)', '', '2023-10-17 09:37:49', '2023-10-17 09:37:49', 'Y', 1, NULL, 'util-photo-blog-s1', NULL, 2, 'Y', 'Y', 'Y', NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_category`
--

CREATE TABLE `b_blog_category` (
  `ID` int NOT NULL,
  `BLOG_ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_category`
--

INSERT INTO `b_blog_category` (`ID`, `BLOG_ID`, `NAME`) VALUES
(9, 1, 'Бергамо'),
(10, 1, 'Велопробеги'),
(6, 1, 'Испания'),
(8, 1, 'Италия'),
(7, 1, 'Каникулы'),
(4, 1, 'Парк Камней'),
(1, 1, 'Путешествия'),
(2, 1, 'Таиланд'),
(3, 1, 'Фото'),
(5, 1, 'Храм истины');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_comment`
--

CREATE TABLE `b_blog_comment` (
  `ID` int NOT NULL,
  `BLOG_ID` int NOT NULL,
  `POST_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `AUTHOR_ID` int DEFAULT NULL,
  `ICON_ID` int DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SHARE_DEST` text COLLATE utf8mb3_unicode_ci,
  `PATH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_comment`
--

INSERT INTO `b_blog_comment` (`ID`, `BLOG_ID`, `POST_ID`, `PARENT_ID`, `AUTHOR_ID`, `ICON_ID`, `AUTHOR_NAME`, `AUTHOR_EMAIL`, `AUTHOR_IP`, `AUTHOR_IP1`, `DATE_CREATE`, `TITLE`, `POST_TEXT`, `PUBLISH_STATUS`, `HAS_PROPS`, `SHARE_DEST`, `PATH`) VALUES
(1, 1, 3, NULL, NULL, NULL, 'Антон', NULL, '192.168.0.108', NULL, '2023-10-17 09:37:49', NULL, 'Отличная машина, у меня такая же', 'P', NULL, NULL, NULL),
(2, 1, 3, 1, 1, NULL, NULL, NULL, '192.168.0.108', NULL, '2023-10-17 09:37:49', NULL, 'Поздравляю', 'P', NULL, NULL, NULL),
(3, 1, 3, 1, NULL, NULL, 'Роберт', NULL, '192.168.0.108', NULL, '2023-10-17 09:37:49', NULL, 'Симпатичная девушка на фотографии :)', 'P', NULL, NULL, NULL),
(4, 1, 3, 3, 1, NULL, NULL, NULL, '192.168.0.108', NULL, '2023-10-17 09:37:49', NULL, 'Спасибо ;)', 'P', NULL, NULL, NULL),
(5, 1, 4, NULL, NULL, NULL, 'Антон', NULL, '192.168.0.108', NULL, '2023-10-17 09:37:49', NULL, 'Отличный город, был в нем не раз', 'P', NULL, NULL, NULL),
(6, 1, 4, 5, NULL, NULL, 'Евгений', NULL, '192.168.0.108', NULL, '2023-10-17 09:37:49', NULL, 'Во сколько обошлась поездка?', 'P', NULL, NULL, NULL),
(7, 1, 4, 6, 1, NULL, NULL, NULL, '192.168.0.108', NULL, '2023-10-17 09:37:50', NULL, '2000 евро с человека', 'P', NULL, NULL, NULL),
(8, 1, 5, NULL, NULL, NULL, 'Анна', NULL, '192.168.0.108', NULL, '2023-10-17 09:37:50', NULL, 'Суперский отдых! Молодцы!', 'P', NULL, NULL, NULL),
(9, 1, 5, 8, NULL, NULL, 'Евгений', NULL, '192.168.0.108', NULL, '2023-10-17 09:37:50', NULL, 'А по какому маршруту вы ездили?', 'P', NULL, NULL, NULL),
(10, 1, 5, 9, 1, NULL, NULL, NULL, '192.168.0.108', NULL, '2023-10-17 09:37:50', NULL, 'Калининград - Зеленоградск. По старой трассе.', 'P', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_group`
--

CREATE TABLE `b_blog_group` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_group`
--

INSERT INTO `b_blog_group` (`ID`, `NAME`, `SITE_ID`) VALUES
(1, 'Основная группа (s1)', 's1'),
(2, 'Служебная группа (s1)', 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_image`
--

CREATE TABLE `b_blog_image` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL DEFAULT '0',
  `BLOG_ID` int NOT NULL DEFAULT '0',
  `POST_ID` int NOT NULL DEFAULT '0',
  `USER_ID` int NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_image`
--

INSERT INTO `b_blog_image` (`ID`, `FILE_ID`, `BLOG_ID`, `POST_ID`, `USER_ID`, `TIMESTAMP_X`, `TITLE`, `IMAGE_SIZE`, `IS_COMMENT`, `COMMENT_ID`) VALUES
(1, 28, 1, 1, 1, '2023-10-17 09:37:49', 'post5_1.jpg', 67883, 'N', NULL),
(2, 29, 1, 1, 1, '2023-10-17 09:37:49', 'post5_2.jpg', 42373, 'N', NULL),
(3, 30, 1, 2, 1, '2023-10-17 09:37:49', 'post4_1.jpg', 44801, 'N', NULL),
(4, 31, 1, 3, 1, '2023-10-17 09:37:49', 'post3_1.jpg', 47454, 'N', NULL),
(5, 32, 1, 4, 1, '2023-10-17 09:37:49', 'post2_1.jpg', 36236, 'N', NULL),
(6, 33, 1, 5, 1, '2023-10-17 09:37:50', 'post1_1.jpg', 54784, 'N', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_post`
--

CREATE TABLE `b_blog_post` (
  `ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BLOG_ID` int NOT NULL,
  `AUTHOR_ID` int NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8mb3_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int DEFAULT NULL,
  `NUM_COMMENTS` int NOT NULL DEFAULT '0',
  `NUM_COMMENTS_ALL` int NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int NOT NULL DEFAULT '0',
  `VIEWS` int DEFAULT NULL,
  `FAVORITE_SORT` int DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `BACKGROUND_CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_post`
--

INSERT INTO `b_blog_post` (`ID`, `TITLE`, `BLOG_ID`, `AUTHOR_ID`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `DATE_CREATE`, `DATE_PUBLISH`, `KEYWORDS`, `PUBLISH_STATUS`, `CATEGORY_ID`, `ATRIBUTE`, `ENABLE_TRACKBACK`, `ENABLE_COMMENTS`, `ATTACH_IMG`, `NUM_COMMENTS`, `NUM_COMMENTS_ALL`, `NUM_TRACKBACKS`, `VIEWS`, `FAVORITE_SORT`, `PATH`, `CODE`, `MICRO`, `HAS_IMAGES`, `HAS_PROPS`, `HAS_TAGS`, `HAS_COMMENT_IMAGES`, `HAS_SOCNET_ALL`, `SEO_TITLE`, `SEO_TAGS`, `SEO_DESCRIPTION`, `BACKGROUND_CODE`) VALUES
(1, 'Тайские зарисовки: Парк миллионолетних камней и крокодиловая ферма', 1, 1, NULL, 'text', 'Парк расположен не в самой Паттайе, но недалеко. Добраться до него можно: взяв экскурсию, взяв тук-тук или \"мотосай\", или самим на байке. 15 минут \"с ветерком\" и мы на месте.\n\n[B]Парк камней[/B] - это красивый парк тропической растительности украшенный камнями самой разной формы. Некоторые камни - окаменевшие деревья.\n\n\nПарк небольшой и ухоженный. Разноцветье, пальмы, деревья в стиле бансай, лотосы. Все это причудливо переплетено и оформлено. Впервые увидел как расцветают пальмы. Удалось найти точку, где показаны три этапа выпуска пальмой листьев:\n\n\nВ центре парка - весьма симпатичная композиция: фонтан, камни, деревья, скульптуры.\n\n[IMG ID=1]\n\n[CUT]\nВ пруду у этой композиции водятся рыбки. Не просто рыбки, а море рыб! Их можно кормить. Здесь также есть и свой минизоопарк. \n\nКроме парка это \"предприятие\" занимается и разведением крокодилов.В парке регулярно проходят шоу с крокодилами.\n\n[IMG ID=2]\n\nИх тоже можно покормить, и это увлекательное занятие. Пронести курицу перед носом, чтобы крокодил не успел ее схватить. Попробуйте, это не просто, они шустрые.\n\n[B]Резюме[/B]: [I]Парк - прекрасное место для отдыха. Место для сосредоточения, медитации, мечтаний, если хотите. Это красота, живая, неповторимая и впечатляющая.[/I]', 'text', '2023-10-17 09:37:49', '2023-10-17 09:37:49', NULL, 'P', '1,2,3,4', NULL, 'N', 'Y', NULL, 0, 0, 0, 2, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Тайские зарисовки : Храм истины', 1, 1, NULL, 'text', 'Храм Истины - проект, призванный служить объединению людей ближайших соседей Таиланда: Камбоджи, Китая и Индии.\n[IMG ID=3]\n[I]Вид с запада[/I]\n\nПроект частный, владелец потратил 1 млн долларов на начальный этап, сейчас проект финансируется за счет посетителей и частных взносов.\n\nИдея проекта - идеалистическая попытка объединения религий. Может и не так, но так поняли нашего гида. Названные страны имеют разные религии, своих богов. Храм выполнен в виде креста, каждый из концов креста посвящен одной стране. Внутренняя отделка выполнена в стиле каждой из религий с божествами этих стран. Гид ходила и рассказывала в каждом зале про каждое божество, но понималось плохо и потому почти ничего не запоминалось.Да, тайский инглиш - это еще отдельный разговор. Оставалось только любоваться.', 'text', '2023-10-17 09:37:49', '2023-10-17 09:37:49', NULL, 'P', '1,2,3,5', NULL, 'N', 'Y', NULL, 0, 0, 0, 7, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Авто в Испании', 1, 1, NULL, 'text', '[IMG ID=4]\n[I]Наш Seat Ibica[/I]\n\nПри планировании поездки в Испанию (Санта Сюсанна) встал вопрос по аренде авто.\n\nАпартаменты в Сюсанне, самолет прилетает в Жирону, плюс желание съездить во Францию, Андорру, покататься по самой Испании. Так что аренда авто выглядело логичным решением. Анализируя сайты и отзывы понял, что самая большая проблема будет (для новичка) - слабое знание английского языка и полное незнание любого другого языка. Все условия аренды, даже на сайтах предоставляющих русскоязычный интерфейс для заказа, в лучшем случае - на английском, в худшем - на испанском (а рассматривались и испанские местные конторы). В таких условиях влететь в какую-то юридическую проблему - пару раз плюнуть. \n[CUT]\nНам повезло. Воспользовавшись чужим опытом нашли русскоязычного посредника . (Маленький секрет: если заказывать авто не с русскоязычного, а с англоязычного интерфейса, то авто будет дешевле!) Сервис оказался на высоте. Что мы получили: \n1. Общаясь по Скайпу на \"великом и могучем\" детальное разъяснение юридических нюансов аренды авто. Для нас это было главнее денег.\n2. Заказ авто полностью под наши потребности: не дороже 300 евро на 13 дней. Заказывая машину эконом класса (типа Форд Ка) в конечном счете получили пятидверный Сеат Ибицу. Может по классу это и одно и тоже, но на заднее сиденье сыну не надо было корячится залезать. Анализ стоимостей в других компаниях показал, что это - выгодный заказ. \n3. Договоренность на депозит кешем. Это была наша просьба, которую менеджер выполнил, договорившись с арендодателем. Договоренностью мы не воспользовались, так как в последний момент стало известно, что депозит в апартаменты не нужно будет вносить и деньги высвободились. Вот, ждем разблокирования средств. \n4. Депозит показался нам немного большим - 560 евро, но так как авто вернули с полным баком и машина не повреждена, то это не имеет значения.\n5. В те же 300 евро общей оплаты вошла полная страховка. То есть при форс мажоре фирма снимала бы с депозита сумму, которую возвратила бы нам потом страховая компания.  Обошлись без этого, несмотря на поездку в сильный ливень по сумасшедшему перинейскому серпантину, когда влететь куда-то было довольно просто.\n\nАнализируя впоследствии заказ, убедились в выгодности этого решения. Даже местные конторы не давали таких выгодных условий (чуть больше 22 евро в день с полной страховкой).\n\nЧто реально выиграно?\n\n1. Свобода передвижения - думаю в пояснениях не нуждается.\n2. Деньги. Одно такси от Жироны до Санта Сюсанны стоит 50 евро. То есть 100 евро с 300 списываем сразу. Поездки в Барселону, в Андорру, Перпиньян (Франция), по побережью можно делать, конечно, общественным транспортом. Но когда делаешь детальный подсчет по средствам, то явно авто окупается, несмотря на дополнительные траты на бензин и платные дороги.\n\nЧто было не так? Неудачно выбран тип авто. Ибица - машинка хорошая, но для города.\n\n1. Имеющийся в наличии дома Форд Мондео универсал с 1,8 движком полностью загруженный и забитым багажником на серпантине на Кавказе вел себя очень прилично. А вот Ибица с 1,4 движком оказалась слабовата для серпантина даже с пустым багажником, увы, но со второй передачи почти не слазил. Хотя на трассе Ибица ведет себя хорошо. Динамика страдает, но экономичность все окупает. \n2. Ужасно неудобная для серпантина передняя стойка, перекрывающая обзор слева. Приходилось постоянно изгибаться и изворачиваться..\n\nПроблемы с парковкой - это классика жанра для Европы. Это мы поняли в Перпиньяне, когда за неудачную парковку поплатились пешей эротической прогулкой до площадки эвакуатора и 100 евро. Впредь будем умнее, лучше заплатить за паркинг, честное слово. (Кстати, у французов странные представления о расстояниях. Все опрошеные, в том числе и полицеские, назвали километраж до стоянки в три - четырые раза меньше реального. Знали бы - взяли такси.)\n\nНа будущее выводы:\n\n1. Внимательнее подходить к выбору типа авто. Примерный план поездок есть всегда и если в нем есть горы, то лучше взять подороже, но помощнее.\n2. Не жалеть денег на парковку.\n\nБольше минусов нет в аренде авто. А плюсов.. для нас достаточно двух описанных.', 'text', '2023-10-17 09:37:49', '2023-10-17 09:37:49', NULL, 'P', '1,6,3,7', NULL, 'N', 'Y', NULL, 4, 4, 0, 8, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Итальянские каникулы: Бергамо', 1, 1, NULL, 'text', '[B]Бергамо[/B]. Этот пункт поездки получился случайно. Был вариант: Досидеть до самолета в Милане или в Бергамо. Так как день отлета - воскресение, в который итальянцы работать совсем не любят и начанают фактически только с обеда, то решили все же ехать в Бергамо, чтобы часть времени сэкономить на их пробуждении. И оказались и правы и не правы. \n\nПравы в том плане, что посмотрели новый красивый город. Не правы в том, что в провинциальных городках спят еще дольше. \n\nЧасов в 12 на улицах было еще мало народу, а в три дня народ повалил толпами.\n\n[IMG ID=5]\n[I]Вид на верхний город[/I]\n[CUT]\nБергамо - город, где мне хотелось бы остаться на пару тройку дней и обходить его весь. Огромная крепость на вершине холма, называемая верхний город, уютный и красивый нижний город. Ходил бы там до усталости полной. Воздух Альп давал силы, дышалось очень легко.\n\nВ чем-то город Бергамо похож на Милан. Множество магазинов, они более уютные, и цены пониже. Но настоящий шопинг можно в Италии сделать не будучи вообще ни в одном из городов. Просто прилетайте в Бергамо, выходите из аэропорта, переходите дорогу и к вашим услугам - сумасшедший по размерам торговый центр. На его стоянке я видел авто и с миланскими номерами. Здесь цены намного демократичнее, а с учетом рождественских скидок - можно говорить о каких-то покупках серьезных.\n\n[B]Резюме поездки:[/B] [I]Все получилось очень удачно. Поездка на авто дает свободу и возможности, которых нет в обычной турпоездке. Да и по деньгам все получилось намного дешевле, чем было бы в агентстве.[/I] \n\nНа следующие каникулы опять в Италию? Только на Юг уже: Бари, Неаполь...', 'text', '2023-10-17 09:37:49', '2023-10-17 09:37:49', NULL, 'P', '1,8,3,9,7', NULL, 'N', 'Y', NULL, 3, 3, 0, 12, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Велопробег', 1, 1, NULL, 'text', 'Имея велосипед, им необходимо пользоваться. Давно уже напрашивалась дальняя поездка, и вот она состоялась.\n[IMG ID=6]\n[I]Вперед![/I]\n\nРовно в 9:00 команда стартанула.\n\nКоллектив большой, это оказалось имеет и плюсы и минусы. Плюс тот, что на дорогах водители авто к нам относились уважительно. Трудно не уважать колонну расстянувшуюся на полкилометра. Минусы - разношерстная группа с разным уровнем подготовки, потребности в долгих перекусах и поджиданиях отставших.\n\nКонечно, устали здорово. Но впечатления того стоят! При случае поедем еще и еще раз!\n\nИ на последок. Какой только техники мы там не несмотрелись у \"лосей\" и \"веломаньяков\". Но меня больше всего приколол шлем одного участника, который другие гонщики могут использовать как зеркало заднего вида!', 'text', '2023-10-17 09:37:50', '2023-10-17 09:37:50', NULL, 'P', '1,10,3', NULL, 'N', 'Y', NULL, 3, 3, 0, 10, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_post_category`
--

CREATE TABLE `b_blog_post_category` (
  `ID` int NOT NULL,
  `BLOG_ID` int NOT NULL,
  `POST_ID` int NOT NULL,
  `CATEGORY_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_post_param`
--

CREATE TABLE `b_blog_post_param` (
  `ID` int NOT NULL,
  `POST_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_site_path`
--

CREATE TABLE `b_blog_site_path` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_site_path`
--

INSERT INTO `b_blog_site_path` (`ID`, `SITE_ID`, `PATH`, `TYPE`) VALUES
(1, 's1', '/', 'B'),
(2, 's1', '/#post_id#/', 'P');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_socnet`
--

CREATE TABLE `b_blog_socnet` (
  `ID` int NOT NULL,
  `BLOG_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_socnet_rights`
--

CREATE TABLE `b_blog_socnet_rights` (
  `ID` int NOT NULL,
  `POST_ID` int NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_trackback`
--

CREATE TABLE `b_blog_trackback` (
  `ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int NOT NULL,
  `POST_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user`
--

CREATE TABLE `b_blog_user` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `AVATAR` int DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_user`
--

INSERT INTO `b_blog_user` (`ID`, `USER_ID`, `ALIAS`, `DESCRIPTION`, `AVATAR`, `INTERESTS`, `LAST_VISIT`, `DATE_REG`, `ALLOW_POST`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, '2023-10-17 09:36:16', 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user2blog`
--

CREATE TABLE `b_blog_user2blog` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `BLOG_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user2user_group`
--

CREATE TABLE `b_blog_user2user_group` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `BLOG_ID` int NOT NULL,
  `USER_GROUP_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user_group`
--

CREATE TABLE `b_blog_user_group` (
  `ID` int NOT NULL,
  `BLOG_ID` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_user_group`
--

INSERT INTO `b_blog_user_group` (`ID`, `BLOG_ID`, `NAME`) VALUES
(1, NULL, 'all'),
(2, NULL, 'registered');

-- --------------------------------------------------------

--
-- Структура таблицы `b_blog_user_group_perms`
--

CREATE TABLE `b_blog_user_group_perms` (
  `ID` int NOT NULL,
  `BLOG_ID` int NOT NULL,
  `USER_GROUP_ID` int NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_blog_user_group_perms`
--

INSERT INTO `b_blog_user_group_perms` (`ID`, `BLOG_ID`, `USER_GROUP_ID`, `PERMS_TYPE`, `POST_ID`, `PERMS`, `AUTOSET`) VALUES
(1, 1, 1, 'P', NULL, 'I', 'N'),
(2, 1, 2, 'P', NULL, 'I', 'N'),
(3, 1, 1, 'C', NULL, 'P', 'N'),
(4, 1, 2, 'C', NULL, 'P', 'N'),
(5, 2, 1, 'P', NULL, 'I', 'N'),
(6, 2, 2, 'P', NULL, 'I', 'N'),
(7, 2, 1, 'C', NULL, 'P', 'N'),
(8, 2, 2, 'C', NULL, 'P', 'N'),
(9, 1, 1, 'P', 1, 'I', 'N'),
(10, 1, 2, 'P', 1, 'I', 'N'),
(11, 1, 1, 'C', 1, 'P', 'N'),
(12, 1, 2, 'C', 1, 'P', 'N'),
(13, 1, 1, 'P', 2, 'I', 'N'),
(14, 1, 2, 'P', 2, 'I', 'N'),
(15, 1, 1, 'C', 2, 'P', 'N'),
(16, 1, 2, 'C', 2, 'P', 'N'),
(17, 1, 1, 'P', 3, 'I', 'N'),
(18, 1, 2, 'P', 3, 'I', 'N'),
(19, 1, 1, 'C', 3, 'P', 'N'),
(20, 1, 2, 'C', 3, 'P', 'N'),
(21, 1, 1, 'P', 4, 'I', 'N'),
(22, 1, 2, 'P', 4, 'I', 'N'),
(23, 1, 1, 'C', 4, 'P', 'N'),
(24, 1, 2, 'C', 4, 'P', 'N'),
(25, 1, 1, 'P', 5, 'I', 'N'),
(26, 1, 2, 'P', 5, 'I', 'N'),
(27, 1, 1, 'C', 5, 'P', 'N'),
(28, 1, 2, 'C', 5, 'P', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE `b_cache_tag` (
  `ID` bigint NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_cache_tag`
--

INSERT INTO `b_cache_tag` (`ID`, `SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
(2, NULL, NULL, '0:1697620762', '**'),
(6, 's1', '/e25', '/s1/bitrix/search.tags.cloud/345', 'bitrix:search.tags.cloud'),
(10, 's1', '/fc1', '/s1/bitrix/search.tags.cloud/345', 'bitrix:search.tags.cloud'),
(12, 's1', '/c0a', '/s1/bitrix/search.tags.cloud/c0a', 'bitrix:search.tags.cloud'),
(13, 's1', '/c0a', '/s1/bitrix/search.tags.cloud/345', 'bitrix:search.tags.cloud');

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE `b_checklist` (
  `ID` int NOT NULL,
  `DATE_CREATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `TOTAL` int DEFAULT NULL,
  `SUCCESS` int DEFAULT NULL,
  `FAILED` int DEFAULT NULL,
  `PENDING` int DEFAULT NULL,
  `SKIP` int DEFAULT NULL,
  `STATE` longtext COLLATE utf8mb3_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8mb3_unicode_ci,
  `REPORT` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_copy_queue`
--

CREATE TABLE `b_clouds_copy_queue` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `OP` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_SIZE` int NOT NULL DEFAULT '-1',
  `FILE_POS` int NOT NULL DEFAULT '0',
  `FAIL_COUNTER` int NOT NULL DEFAULT '0',
  `STATUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_delete_queue`
--

CREATE TABLE `b_clouds_delete_queue` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_bucket`
--

CREATE TABLE `b_clouds_file_bucket` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `SORT` int DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int DEFAULT '0',
  `FILE_SIZE` double DEFAULT '0',
  `LAST_FILE_ID` int DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8mb3_unicode_ci,
  `FILE_RULES` text COLLATE utf8mb3_unicode_ci,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_hash`
--

CREATE TABLE `b_clouds_file_hash` (
  `ID` int NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `FILE_PATH` varchar(760) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_resize`
--

CREATE TABLE `b_clouds_file_resize` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int DEFAULT NULL,
  `PARAMS` text COLLATE utf8mb3_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_save`
--

CREATE TABLE `b_clouds_file_save` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_upload`
--

CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int NOT NULL,
  `PART_SIZE` int NOT NULL,
  `PART_NO` int NOT NULL,
  `PART_FAIL_COUNTER` int NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE `b_component_params` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `START_CHAR` int NOT NULL,
  `END_CHAR` int NOT NULL,
  `PARAMETERS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_component_params`
--

INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
(1, 's1', 'bitrix:news', '', '/news/index.php', 'N', NULL, 99, 2201, 'a:66:{s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"Y\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:0:\"\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"2\";s:11:\"IBLOCK_TYPE\";s:15:\"dynamic_content\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:10:\"NEWS_COUNT\";s:2:\"20\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:8:\"SEF_MODE\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:10:\"USE_REVIEW\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"N\";s:10:\"USE_SEARCH\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";s:16:\"VARIABLE_ALIASES\";a:2:{s:10:\"ELEMENT_ID\";s:10:\"ELEMENT_ID\";s:10:\"SECTION_ID\";s:10:\"SECTION_ID\";}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_log`
--

CREATE TABLE `b_composite_log` (
  `ID` int NOT NULL,
  `HOST` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8mb3_unicode_ci,
  `AJAX` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int NOT NULL DEFAULT '0',
  `PAGE_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_page`
--

CREATE TABLE `b_composite_page` (
  `ID` int NOT NULL,
  `CACHE_KEY` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int NOT NULL DEFAULT '0',
  `REWRITES` int NOT NULL DEFAULT '0',
  `SIZE` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_agreement`
--

CREATE TABLE `b_consent_agreement` (
  `ID` int NOT NULL,
  `CODE` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8mb3_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_field`
--

CREATE TABLE `b_consent_field` (
  `ID` int NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent`
--

CREATE TABLE `b_consent_user_consent` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent_item`
--

CREATE TABLE `b_consent_user_consent_item` (
  `ID` int NOT NULL,
  `USER_CONSENT_ID` int NOT NULL,
  `VALUE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE `b_culture` (
  `ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WEEK_START` int DEFAULT '1',
  `CHARSET` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `b_entity_usage`
--

CREATE TABLE `b_entity_usage` (
  `USER_ID` int NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ITEM_ID_INT` int NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE `b_event` (
  `ID` int NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE_ID` int DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8mb3_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_event`
--

INSERT INTO `b_event` (`ID`, `EVENT_NAME`, `MESSAGE_ID`, `LID`, `C_FIELDS`, `DATE_INSERT`, `DATE_EXEC`, `SUCCESS_EXEC`, `DUPLICATE`, `LANGUAGE_ID`) VALUES
(1, 'USER_INFO', NULL, 's1', 'a:9:{s:7:\"USER_ID\";s:1:\"1\";s:6:\"STATUS\";s:14:\"активен\";s:7:\"MESSAGE\";s:70:\"Новый пароль для учетной записи с ID=1 - 0\";s:5:\"LOGIN\";s:5:\"admin\";s:9:\"URL_LOGIN\";s:5:\"admin\";s:9:\"CHECKWORD\";s:1:\"l\";s:4:\"NAME\";s:0:\"\";s:9:\"LAST_NAME\";s:0:\"\";s:5:\"EMAIL\";s:23:\"trashmail2002@yandex.ru\";}', '2023-10-17 15:49:45', '2023-10-17 15:50:18', 'Y', 'Y', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_attachment`
--

CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE `b_event_log` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8mb3_unicode_ci,
  `REQUEST_URI` text COLLATE utf8mb3_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `GUEST_ID` int DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(1, '2023-10-17 06:53:44', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; rv:109.0) Gecko/20100101 Firefox/118.0', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=minimal_black&newFolder=Y&path=%2F&back_url=%2F%3Ffinish%3D%26MUL_MODE%3D%26back_url_admin%3D%252Fbitrix%252Fadmin%252Fiblock_element_admin.php%253FIBLOCK_ID%253D2%2526type%253Ddynamic_content%2526lang%253Dru%2526find_section_section%253D-1&siteTemplateId=minimal_black', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}'),
(2, '2023-10-17 06:53:44', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; rv:109.0) Gecko/20100101 Firefox/118.0', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=minimal_black&newFolder=Y&path=%2F&back_url=%2F%3Ffinish%3D%26MUL_MODE%3D%26back_url_admin%3D%252Fbitrix%252Fadmin%252Fiblock_element_admin.php%253FIBLOCK_ID%253D2%2526type%253Ddynamic_content%2526lang%253Dru%2526find_section_section%253D-1&siteTemplateId=minimal_black', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:4:\"news\";}'),
(3, '2023-10-17 06:53:44', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; rv:109.0) Gecko/20100101 Firefox/118.0', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=minimal_black&newFolder=Y&path=%2F&back_url=%2F%3Ffinish%3D%26MUL_MODE%3D%26back_url_admin%3D%252Fbitrix%252Fadmin%252Fiblock_element_admin.php%253FIBLOCK_ID%253D2%2526type%253Ddynamic_content%2526lang%253Dru%2526find_section_section%253D-1&siteTemplateId=minimal_black', NULL, 1, NULL, 'a:2:{s:4:\"path\";s:0:\"\";s:9:\"menu_name\";s:23:\"Верхнее меню\";}'),
(4, '2023-10-17 06:55:14', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; rv:109.0) Gecko/20100101 Firefox/118.0', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:14:\"news/index.php\";}'),
(5, '2023-10-18 07:33:33', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE `b_event_message` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8mb3_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8mb3_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8mb3_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8mb3_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1, '2023-10-17 06:33:56', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2023-10-17 06:33:56', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2023-10-17 06:33:56', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2023-10-17 06:33:56', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2023-10-17 06:33:56', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2023-10-17 06:33:56', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2023-10-17 06:33:56', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(8, '2023-10-17 06:33:56', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(9, '2023-10-17 06:33:56', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(10, '2023-10-17 06:33:56', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(11, '2023-10-17 06:33:56', 'NEW_DEVICE_LOGIN', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Вход с нового устройства', 'Здравствуйте, #NAME#,\n\nНовое устройство авторизовалось под вашим логином #LOGIN#.\n \nУстройство: #DEVICE# \nБраузер: #BROWSER#\nПлатформа: #PLATFORM#\nМестоположение: #LOCATION# (может быть неточным)\nДата: #DATE#\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'Здравствуйте, <?=$arParams[\"NAME\"];?>,\n\nНовое устройство авторизовалось под вашим логином <?=$arParams[\"LOGIN\"];?>.\n \nУстройство: <?=$arParams[\"DEVICE\"];?> \nБраузер: <?=$arParams[\"BROWSER\"];?>\n\nПлатформа: <?=$arParams[\"PLATFORM\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?> (может быть неточным)\nДата: <?=$arParams[\"DATE\"];?>\n\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(12, '2023-10-17 06:34:14', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\"\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2023-10-17 06:34:14', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2023-10-17 06:34:14', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2023-10-17 06:34:14', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2023-10-17 06:34:14', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2023-10-17 06:34:14', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВаш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен в друзья к <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2023-10-17 06:34:14', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2023-10-17 06:34:14', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2023-10-17 06:34:14', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВ ваш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен друг <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2023-10-17 06:34:14', 'BLOG_SONET_NEW_POST', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
(22, '2023-10-17 06:34:14', 'BLOG_SONET_NEW_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', 'Re: #POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{#COMMENT_ID#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{$arParams[\'COMMENT_ID\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
(23, '2023-10-17 06:34:14', 'BLOG_SONET_POST_SHARE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
(24, '2023-10-17 06:34:14', 'BLOG_POST_BROADCAST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2023-10-17 06:34:23', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '2023-10-17 06:34:23', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?> <?=$arParams[\"FROM_EMAIL\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '2023-10-17 06:34:23', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСсылка на сообщение: <?=$arParams[\"MESSAGE_LINK\"];?>Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '2023-10-17 06:34:23', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '2023-10-17 06:34:23', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '2023-10-17 06:35:18', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '2023-10-17 06:35:22', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE_SUBSCR\"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nОтписаться:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '2023-10-17 06:35:29', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams[\"USER_NAME\"];?> принял участие в опросе \"<?=$arParams[\"VOTE_TITLE\"];?>\":\n<?=$arParams[\"VOTE_STATISTIC\"];?>\n\n\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"URL\"];?>\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_attachment`
--

CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1'),
(12, 's1'),
(13, 's1'),
(14, 's1'),
(15, 's1'),
(16, 's1'),
(17, 's1'),
(18, 's1'),
(19, 's1'),
(20, 's1'),
(21, 's1'),
(22, 's1'),
(23, 's1'),
(24, 's1'),
(25, 's1'),
(26, 's1'),
(27, 's1'),
(28, 's1'),
(29, 's1'),
(30, 's1'),
(31, 's1'),
(32, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE `b_event_type` (
  `ID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `SORT` int NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
(11, 'ru', 'NEW_DEVICE_LOGIN', 'Вход с нового устройства', '#USER_ID# - ID пользователя\n#EMAIL# - Email пользователя\n#LOGIN# - Логин пользователя\n#NAME# - Имя пользователя\n#LAST_NAME# - Фамилия пользователя\n#DEVICE# - Устройство\n#BROWSER# - Браузер\n#PLATFORM# - Платформа\n#USER_AGENT# - User agent\n#IP# - IP-адрес\n#DATE# - Дата\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Объединенные город, регион, страна\n', 11, 'email'),
(12, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(13, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
(14, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
(15, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
(16, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
(17, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
(18, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
(19, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
(20, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
(21, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
(22, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
(23, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
(24, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
(25, 'en', 'NEW_DEVICE_LOGIN', 'New device signed in', '#USER_ID# - User ID\n#EMAIL# - User email:\n#LOGIN# - User login\n#NAME# - User first name\n#LAST_NAME# - User last name\n#DEVICE# - Device\n#BROWSER# - Browser\n#PLATFORM# - Platform\n#USER_AGENT# - User agent\n#IP# - IP address\n#DATE# - Date\n#COUNTRY# - Country\n#REGION# - Region\n#CITY# - City\n#LOCATION# - Full location (city, region, country)\n', 11, 'email'),
(26, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
(27, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
(28, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms'),
(29, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
(30, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
(31, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
(32, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
(33, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
(34, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
(35, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
(36, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
(37, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
(38, 'ru', 'BLOG_SONET_NEW_POST', 'Добавлено новое сообщение', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
(39, 'ru', 'BLOG_SONET_NEW_COMMENT', 'Добавлен новый комментарий', '#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
(40, 'ru', 'BLOG_SONET_POST_SHARE', 'Добавлен новый получатель сообщения', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
(41, 'ru', 'BLOG_POST_BROADCAST', 'Добавлено новое сообщение', '\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
(42, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
(43, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
(44, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
(45, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
(46, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
(47, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
(48, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
(49, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
(50, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
(51, 'en', 'BLOG_SONET_NEW_POST', 'New post added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
(52, 'en', 'BLOG_SONET_NEW_COMMENT', 'Comment added', '#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
(53, 'en', 'BLOG_SONET_POST_SHARE', 'New recipient added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
(54, 'en', 'BLOG_POST_BROADCAST', 'New post added', '\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient', 100, 'email'),
(55, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
(56, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 100, 'email'),
(57, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 100, 'email'),
(58, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
(59, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
(60, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 100, 'email'),
(61, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 100, 'email'),
(62, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
(63, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100, 'email'),
(64, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100, 'email'),
(65, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100, 'email'),
(66, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100, 'email'),
(67, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 100, 'email'),
(68, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 100, 'email'),
(69, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 100, 'email'),
(70, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 100, 'email');

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE `b_favorite` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int NOT NULL DEFAULT '100',
  `MODIFIED_BY` int DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8mb3_unicode_ci,
  `COMMENTS` text COLLATE utf8mb3_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `CODE_ID` int DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE `b_file` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_file`
--

INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
(1, '2023-10-17 06:37:48', 'iblock', 150, 150, 4401, 'image/jpeg', 'iblock/8cd', '8.jpg', '7a488362c2e0f0bc584012624d519232.jpg', '', NULL, 'fbd60303859a6a401d6eee79293a38ea'),
(2, '2023-10-17 06:37:48', 'iblock', 150, 150, 4401, 'image/jpeg', 'iblock/8cd', '8.jpg', '9e79156cc17203589bc3f86da271515e.jpg', '', NULL, '1e909b4f1d69c6c250c399d6c289507d'),
(3, '2023-10-17 06:37:48', 'iblock', 167, 250, 6978, 'image/jpeg', 'iblock/efc', 'd.jpg', '5ac6130998bb588933d8ede4c48a7c2c.jpg', '', NULL, '979d51ca501f6277f2ad7fb95a546fcd'),
(4, '2023-10-17 06:37:48', 'iblock', 467, 700, 29783, 'image/jpeg', 'iblock/d89', 'g.jpg', 'de52cc8287925a1bdb1e0d448d916c84.jpg', '', NULL, '1ca39bdc8513bb558ef38346b5221420'),
(5, '2023-10-17 06:37:48', 'iblock', 668, 1000, 271905, 'image/jpeg', 'iblock/496', 'q.jpg', 'f53e5a3a3c800df22e3b6c20a7bfb90a.jpg', '', NULL, '4c09f84e023e3dc750a86f5525214fb1'),
(6, '2023-10-17 06:37:48', 'iblock', 166, 250, 9799, 'image/jpeg', 'iblock/fe2', 's.jpg', '3185031406b120a27a8f3899688c494b.jpg', '', NULL, '328e955a2c9debe9a5c7faff34726915'),
(7, '2023-10-17 06:37:48', 'iblock', 466, 700, 45085, 'image/jpeg', 'iblock/a38', 'S.jpg', '7e329851bc766e085bdde04be4d0581d.jpg', '', NULL, 'c3208557046f309638c12cc32bd4ad74'),
(8, '2023-10-17 06:37:48', 'iblock', 667, 1000, 341102, 'image/jpeg', 'iblock/792', 'c.jpg', '6ea12b9bafdbda8065819bd8e13dd49e.jpg', '', NULL, '158f15fb7423d2414120eac07f14ea20'),
(9, '2023-10-17 06:37:48', 'iblock', 250, 166, 7518, 'image/jpeg', 'iblock/d4d', 'H.jpg', 'c6776a9b695722ff440801ff6d664348.jpg', '', NULL, '17f123c883a40517170fbbe97b223711'),
(10, '2023-10-17 06:37:48', 'iblock', 700, 467, 32514, 'image/jpeg', 'iblock/377', 'Q.jpg', 'e343dc670d0a57b362defd42ebb19e23.jpg', '', NULL, '5e9cebad0b0c292a0af0e57440a312c6'),
(11, '2023-10-17 06:37:48', 'iblock', 800, 534, 199264, 'image/jpeg', 'iblock/394', 'a.jpg', 'a3d076dc9c2719c5a4197b3a656d0f51.jpg', '', NULL, '2a6cb13d41a3f4caae75c8a2b63e2a5f'),
(12, '2023-10-17 06:37:48', 'iblock', 250, 166, 6684, 'image/jpeg', 'iblock/377/b14', 'T.jpg', '04394cddf6b6ed096ab44b99058c15ce.jpg', '', NULL, '99549906b11f0ae99166baafa03ba393'),
(13, '2023-10-17 06:37:48', 'iblock', 700, 467, 30196, 'image/jpeg', 'iblock/119', 'j.jpg', 'c71a0b858b3df5d15c4b8331f7aa4186.jpg', '', NULL, '56df1b0d113f0ac1f99c8acab964462b'),
(14, '2023-10-17 06:37:48', 'iblock', 800, 534, 181652, 'image/jpeg', 'iblock/ea0', 'e.jpg', '7bc98e3aa0bb874f3662e097ea125363.jpg', '', NULL, '5909eb286a3ffb1ed21b7c18d3e118b2'),
(15, '2023-10-17 06:37:48', 'iblock', 167, 250, 6731, 'image/jpeg', 'iblock/b14', 'T.jpg', 'd0148f9672466e9209ac55ca948d002b.jpg', '', NULL, '55161a6fe430e50795d9ad04a90007da'),
(16, '2023-10-17 06:37:48', 'iblock', 467, 700, 39886, 'image/jpeg', 'iblock/134', 'i.jpg', 'a4efc2b07b0276d30890ad1ba7908c25.jpg', '', NULL, '5a9c6a0e3b07e9cf7f7c0445c549be80'),
(17, '2023-10-17 06:37:48', 'iblock', 668, 1000, 311038, 'image/jpeg', 'iblock/78a', 'z.jpg', '07de49ce9069307ffb4611656061e94a.jpg', '', NULL, '7f94cfe57d06bf915f48bfaaf42d0e0d'),
(18, '2023-10-17 06:37:48', 'iblock', 167, 250, 8539, 'image/jpeg', 'iblock/b5c', 'k.jpg', 'e592427eab7f35d794429bac173fb4c5.jpg', '', NULL, 'c4e0551663c15204c4e58a8d8057b53c'),
(19, '2023-10-17 06:37:48', 'iblock', 467, 700, 45593, 'image/jpeg', 'iblock/568', 'B.jpg', '01374c23f9ec15758f738a3de5c50765.jpg', '', NULL, '203391577b29793626554a5a16b94062'),
(20, '2023-10-17 06:37:48', 'iblock', 668, 1000, 347998, 'image/jpeg', 'iblock/fe5', '7.jpg', 'c02924cbfe9cd8104161e30de9b9afd7.jpg', '', NULL, '954206af77faad7ae73a31b7b7ff6a6f'),
(21, '2023-10-17 06:37:48', 'iblock', 167, 250, 7722, 'image/jpeg', 'iblock/068', 'R.jpg', 'bafc10c43d9d489c98227238b89d480b.jpg', '', NULL, '7e94e8c69d6088d46eb614ec48246a76'),
(22, '2023-10-17 06:37:48', 'iblock', 467, 700, 46325, 'image/jpeg', 'iblock/18e', '6.jpg', 'f1f627091745907851b2efc3ac6c3d69.jpg', '', NULL, '8181f158bb8a37ada7acae2bb64cf26b'),
(23, '2023-10-17 06:37:48', 'iblock', 668, 1000, 388770, 'image/jpeg', 'iblock/b14/aa2', 'n.jpg', '3ce7864deca81a8f76da6bfb3cad3431.jpg', '', NULL, '87eeffdec5970dab3d127bb5846bfebf'),
(24, '2023-10-17 06:37:48', 'iblock', 467, 700, 38620, 'image/jpeg', 'iblock/156', '2.jpg', '1750ca30210af6d002932007b9f2c199.jpg', '', NULL, '0de0c1bc91bef1e2d388583569412272'),
(25, '2023-10-17 06:37:48', 'iblock', 167, 250, 11499, 'image/jpeg', 'iblock/cc6', 'h.jpg', '0adffa1c0cc376da0e281a8aa4bfb6ae.jpg', '', NULL, 'd7a7ced663b90664a603323b468f5f77'),
(26, '2023-10-17 06:37:48', 'iblock', 467, 700, 48932, 'image/jpeg', 'iblock/5f7', 'f.jpg', 'ed716b8ba553ff8a42780c3c11f37ca5.jpg', '', NULL, '4136d23ccc1312e6906b986efbda365d'),
(27, '2023-10-17 06:37:48', 'iblock', 668, 1000, 351444, 'image/jpeg', 'iblock/de8', 'M.jpg', '1afe6fe0d6f65941fc9571e017b9167d.jpg', '', NULL, '0c51ff70fee15d20811f23a063f31206'),
(28, '2023-10-17 06:37:49', 'blog', 401, 600, 67883, 'image/jpeg', 'blog/b5c', 'k.jpg', 'post5_1.jpg', '', NULL, 'f2813b3b0b834e29adcbda51794a9911'),
(29, '2023-10-17 06:37:49', 'blog', 401, 600, 42373, 'image/jpeg', 'blog/081', 'l.jpg', 'post5_2.jpg', '', NULL, '208e38affe128cdf684c4b773a96efc6'),
(30, '2023-10-17 06:37:49', 'blog', 401, 600, 44801, 'image/jpeg', 'blog/fae', 'X.jpg', 'post4_1.jpg', '', NULL, '275dc0e1baefc7b8d8b6e4361eb7de4e'),
(31, '2023-10-17 06:37:49', 'blog', 401, 600, 47454, 'image/jpeg', 'blog/638', 'Y.jpg', 'post3_1.jpg', '', NULL, '686ecef674d558446424dec5d8cb22fa'),
(32, '2023-10-17 06:37:49', 'blog', 401, 600, 36236, 'image/jpeg', 'blog/ea0', 'e.jpg', 'post2_1.jpg', '', NULL, 'cf2840306e47c1bf025716537c2e99a5'),
(33, '2023-10-17 06:37:50', 'blog', 401, 600, 54784, 'image/jpeg', 'blog/134', 'i.jpg', 'post1_1.jpg', '', NULL, 'c98f886a39b8e3b5b1f4dfee7d9278f6'),
(34, '2023-10-17 06:52:40', 'iblock', 600, 480, 38611, 'image/jpeg', 'iblock/119/568', 'B.jpg', 'edubiga509651.jpg', '', NULL, 'bec77b4995fc57aa63a4da2be8043cec'),
(35, '2023-10-17 07:39:26', 'iblock', 600, 480, 38611, 'image/jpeg', 'iblock/119/568', 'B.jpg', 'edubiga509651.jpg', '', NULL, '2ce60583f6f8803cb547b42327016aaf'),
(36, '2023-10-17 07:06:04', 'iblock', 1118, 1125, 69940, 'image/jpeg', 'iblock/c49', 'J.jpg', 'gzyea2plzfw41.jpg', '', NULL, 'a82ad85cc81024c994615b546ca989bf'),
(37, '2023-10-17 07:39:34', 'iblock', 1118, 1125, 69940, 'image/jpeg', 'iblock/c49', 'J.jpg', 'gzyea2plzfw41.jpg', '', NULL, '7a16fa2e88e6d7e22b32bdefca3095ff'),
(38, '2023-10-17 07:08:30', 'iblock', 298, 300, 33358, 'image/jpeg', 'iblock/496/3e6', 'x.jpg', 'gzyea2plzfw41_min.jpg', '', NULL, 'fd5dd1a7801d468536e083ed0c8d221b'),
(39, '2023-10-17 07:39:34', 'iblock', 298, 300, 33358, 'image/jpeg', 'iblock/496/3e6', 'x.jpg', 'gzyea2plzfw41_min.jpg', '', NULL, '8b7552fad817b1f4677c4252e1b91f0f'),
(40, '2023-10-17 07:39:26', 'iblock', 300, 240, 34810, 'image/jpeg', 'iblock/799', '3.jpg', 'edubiga509651_min.jpg', '', NULL, 'ea754b8fe1a00d2e3808b02fc3f0b63c'),
(41, '2023-10-18 09:14:04', 'iblock', 480, 640, 131234, 'image/png', 'iblock/c6b', 'cosl8zc6rqpndmixbxylpp4q6rid5yrv.png', 'canvas.png', '', NULL, '3cd85acfd7d23eebc56fd02fe0149885'),
(42, '2023-10-18 09:14:04', 'iblock', 480, 640, 131234, 'image/png', 'iblock/c6b', 'cosl8zc6rqpndmixbxylpp4q6rid5yrv.png', 'canvas.png', '', NULL, 'c19663269045bae2d01e2aec3506c367'),
(43, '2023-10-18 09:14:34', 'iblock', 480, 640, 99063, 'image/png', 'iblock/d00', 'cdkmby1z05gy1oiecb68gfhozo6z9u3b.png', 'canvas1.png', '', NULL, '1f1db28e008fb8c6c32fc2e6ec68c942'),
(44, '2023-10-18 09:14:34', 'iblock', 480, 640, 99063, 'image/png', 'iblock/d00', 'cdkmby1z05gy1oiecb68gfhozo6z9u3b.png', 'canvas1.png', '', NULL, 'b3c3be1aade2e734dced3da64751215d'),
(45, '2023-10-18 09:15:00', 'iblock', 480, 640, 189262, 'image/png', 'iblock/5d1', 'ab1s5uvqbvejwhk9bi504558m5ddtfb3.png', 'canvas2.png', '', NULL, '47238ac8c2b377bcd09ff1baf022ba1e'),
(46, '2023-10-18 09:15:00', 'iblock', 480, 640, 189262, 'image/png', 'iblock/5d1', 'ab1s5uvqbvejwhk9bi504558m5ddtfb3.png', 'canvas2.png', '', NULL, '4a7a7cb0e2651de0bc99ea516955021b'),
(47, '2023-10-18 09:15:43', 'iblock', 480, 640, 125923, 'image/png', 'iblock/000', 'ndlz0pltdhe3yohppuye2i5z905reqwf.png', 'canvas3.png', '', NULL, '61976642001d5f80cdfdd18ff73266c4'),
(48, '2023-10-18 09:15:43', 'iblock', 480, 640, 125923, 'image/png', 'iblock/000', 'ndlz0pltdhe3yohppuye2i5z905reqwf.png', 'canvas3.png', '', NULL, '9bb888cc261891352d4e1306246b3cc6'),
(49, '2023-10-18 09:16:15', 'iblock', 480, 640, 206107, 'image/png', 'iblock/2b1', 'ae43ht2ni3xgee955ses0oi039bj2dg9.png', 'canvas4.png', '', NULL, '9be101b060c52668bc9d29b81fc4fab8'),
(50, '2023-10-18 09:16:15', 'iblock', 480, 640, 206107, 'image/png', 'iblock/2b1', 'ae43ht2ni3xgee955ses0oi039bj2dg9.png', 'canvas4.png', '', NULL, '8a1b305c0d1d77d492138fa7aa91a783'),
(51, '2023-10-18 09:17:22', 'iblock', 480, 640, 100722, 'image/png', 'iblock/470', 'vo48sbdfqpwocfjpldm5fi6kipm6v5k0.png', 'canvas5.png', '', NULL, 'b75c56c85b628cb3240c046438d459a4'),
(52, '2023-10-18 09:17:22', 'iblock', 480, 640, 100722, 'image/png', 'iblock/470', 'vo48sbdfqpwocfjpldm5fi6kipm6v5k0.png', 'canvas5.png', '', NULL, '412f26cda3260ac5bf209945a35b65e4'),
(53, '2023-10-18 09:17:50', 'iblock', 480, 640, 187769, 'image/png', 'iblock/1bd', '37l0tb5k3zyt1p2gbmpyd5ehzzxqyx87.png', 'canvas6.png', '', NULL, '57cf83b476fb40b9681bd5c0f083a255'),
(54, '2023-10-18 09:17:50', 'iblock', 480, 640, 187769, 'image/png', 'iblock/1bd', '37l0tb5k3zyt1p2gbmpyd5ehzzxqyx87.png', 'canvas6.png', '', NULL, '88517c373ef89bd8433bd6bd3f83c9b7'),
(55, '2023-10-18 09:18:20', 'iblock', 480, 640, 129331, 'image/png', 'iblock/6e3', 'n7v1mbv4bqvwdm8fdoe3k5p2s2w6z197.png', 'canvas7.png', '', NULL, 'ffc3f79d95fd4a33a3e955289972903d'),
(56, '2023-10-18 09:18:20', 'iblock', 480, 640, 129331, 'image/png', 'iblock/6e3', 'n7v1mbv4bqvwdm8fdoe3k5p2s2w6z197.png', 'canvas7.png', '', NULL, '5d0753663bb4aeb5437d419146cc8a36');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_duplicate`
--

CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int NOT NULL,
  `ORIGINAL_ID` int NOT NULL,
  `COUNTER` int NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_file_duplicate`
--

INSERT INTO `b_file_duplicate` (`DUPLICATE_ID`, `ORIGINAL_ID`, `COUNTER`, `ORIGINAL_DELETED`) VALUES
(2, 1, 1, 'N'),
(35, 34, 1, 'Y'),
(37, 36, 1, 'Y'),
(39, 38, 1, 'Y'),
(42, 41, 1, 'N'),
(44, 43, 1, 'N'),
(46, 45, 1, 'N'),
(48, 47, 1, 'N'),
(50, 49, 1, 'N'),
(52, 51, 1, 'N'),
(54, 53, 1, 'N'),
(56, 55, 1, 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_hash`
--

CREATE TABLE `b_file_hash` (
  `FILE_ID` int NOT NULL,
  `FILE_SIZE` bigint NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_file_hash`
--

INSERT INTO `b_file_hash` (`FILE_ID`, `FILE_SIZE`, `FILE_HASH`) VALUES
(1, 4401, '3864e3f827855e75dd5e99b0addef52f'),
(12, 6684, '63861b044b5f29aaacd483b40e8a58b0'),
(15, 6731, 'c42ad34de88e62071b27f1ff17ea4f63'),
(3, 6978, '06ea584411314f6f6975996f311998e1'),
(9, 7518, '8f5bb8e759f5c244afed4731e77d7a16'),
(21, 7722, '554fce8b87fa0788d07bc3d4ec57be5e'),
(18, 8539, '6e1e30192b114a13b9e56917a0041368'),
(6, 9799, '57ed4abca1e2c1ab0d1e0e9aff28284c'),
(25, 11499, '49800f059fb7b6557566261ad66c5ccc'),
(4, 29783, 'dcafea0c55cb516178d55e87892b60f8'),
(13, 30196, '22fa0beb9517be1f5b6785c47e071781'),
(10, 32514, '542bf64b51d022b7f6df1c8fe4326a7b'),
(38, 33358, '855187086cfa32198839b8a39b83bcd0'),
(40, 34810, '52141a3e9a116088d7a4daf8b80c46a7'),
(32, 36236, 'c8fb25b68bb5d7aa1a9d9930ff6ae99d'),
(34, 38611, 'cdef758ab5ff0d384161ec21f520ac3e'),
(24, 38620, 'd299b9b30e131ce3bfb5e275f1f349b3'),
(16, 39886, 'fd21b9f701b9318b97a270d106851dac'),
(29, 42373, 'feb6bb2a894a6e6bd1e1fca8954e998a'),
(30, 44801, 'a76e1e8e3de2d3db8cfffc3a0f155d39'),
(7, 45085, '8131484212a2b18a51e92a05ae1de332'),
(19, 45593, '931b8366c44963a5063ce8fc49f456e1'),
(22, 46325, 'dc7f5d2cb6563ecab852c11dd4136d23'),
(31, 47454, 'b5d14be5c193246a77abfd758b6b4265'),
(26, 48932, '260ff60bc9f6ef6e424aa8b2dec5b3bd'),
(33, 54784, 'edc4d15a6cc5ebd2849ae825b1ba3af0'),
(28, 67883, '990f33a33b0204dd51611107d5add81a'),
(36, 69940, '2e2a7cd39af50a3befa7ee883846e477'),
(43, 99063, '0cb622ce2b8911b021d71c8c709eea76'),
(51, 100722, 'b727dc4e9375ef4eb1a05d9f9141b251'),
(47, 125923, '2fbd8b0d94d321d0b8de4ebb71c93c55'),
(55, 129331, '957a69dc6164c20f40d56bd692159553'),
(41, 131234, '4d605c671d7e3021f2a79e843ee5faca'),
(14, 181652, 'ffe9738e82823a5e0623526b8e051b4a'),
(53, 187769, 'c0857e7b8336a372710c21a30daffd81'),
(45, 189262, '24de3aee9fd8e0c60c10a64f9151330a'),
(11, 199264, '96a67632bb80e5a607947f225dcc53a6'),
(49, 206107, 'c71864639de967d6fadecaab242cd9c3'),
(5, 271905, '39b2b6894389b00f637915fba3860947'),
(17, 311038, 'c37cab441d12e6d4ad13da952bde8ea4'),
(8, 341102, '85e73edd3460c955110c62afdc345825'),
(20, 347998, '0559292edf323defcb3c5629e39e8ace'),
(27, 351444, '5aa87e9ef320b13d916afafbc93c48e5'),
(23, 388770, '0744439c435f2aaaa89939f25cee14b3');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_preview`
--

CREATE TABLE `b_file_preview` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PREVIEW_ID` int DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE `b_file_search` (
  `ID` int NOT NULL,
  `SESS_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `B_DIR` int NOT NULL DEFAULT '0',
  `F_SIZE` int NOT NULL DEFAULT '0',
  `F_TIME` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_version`
--

CREATE TABLE `b_file_version` (
  `ORIGINAL_ID` int NOT NULL,
  `VERSION_ID` int NOT NULL,
  `META` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE `b_filters` (
  `ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_finder_dest`
--

CREATE TABLE `b_finder_dest` (
  `USER_ID` int NOT NULL,
  `CODE` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE_USER_ID` int DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form`
--

CREATE TABLE `b_form` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `C_SORT` int DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8mb3_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8mb3_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8mb3_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int DEFAULT '0',
  `RESTRICT_TIME` int DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_2_group`
--

CREATE TABLE `b_form_2_group` (
  `ID` int NOT NULL,
  `FORM_ID` int NOT NULL DEFAULT '0',
  `GROUP_ID` int NOT NULL DEFAULT '0',
  `PERMISSION` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_2_mail_template`
--

CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_2_site`
--

CREATE TABLE `b_form_2_site` (
  `FORM_ID` int NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_answer`
--

CREATE TABLE `b_form_answer` (
  `ID` int NOT NULL,
  `FIELD_ID` int NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8mb3_unicode_ci,
  `C_SORT` int NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int DEFAULT NULL,
  `FIELD_HEIGHT` int DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_crm`
--

CREATE TABLE `b_form_crm` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_crm_field`
--

CREATE TABLE `b_form_crm_field` (
  `ID` int NOT NULL,
  `LINK_ID` int NOT NULL DEFAULT '0',
  `FIELD_ID` int DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_crm_link`
--

CREATE TABLE `b_form_crm_link` (
  `ID` int NOT NULL,
  `FORM_ID` int NOT NULL DEFAULT '0',
  `CRM_ID` int NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_field`
--

CREATE TABLE `b_form_field` (
  `ID` int NOT NULL,
  `FORM_ID` int NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8mb3_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `C_SORT` int NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int DEFAULT NULL,
  `COMMENTS` text COLLATE utf8mb3_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8mb3_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_field_filter`
--

CREATE TABLE `b_form_field_filter` (
  `ID` int NOT NULL,
  `FIELD_ID` int NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_field_validator`
--

CREATE TABLE `b_form_field_validator` (
  `ID` int NOT NULL,
  `FORM_ID` int NOT NULL DEFAULT '0',
  `FIELD_ID` int NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'y',
  `C_SORT` int DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_menu`
--

CREATE TABLE `b_form_menu` (
  `ID` int NOT NULL,
  `FORM_ID` int NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_result`
--

CREATE TABLE `b_form_result` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int NOT NULL DEFAULT '0',
  `FORM_ID` int NOT NULL DEFAULT '0',
  `USER_ID` int DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int DEFAULT NULL,
  `STAT_SESSION_ID` int DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_result_answer`
--

CREATE TABLE `b_form_result_answer` (
  `ID` int NOT NULL,
  `RESULT_ID` int NOT NULL DEFAULT '0',
  `FORM_ID` int NOT NULL DEFAULT '0',
  `FIELD_ID` int NOT NULL DEFAULT '0',
  `ANSWER_ID` int DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8mb3_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8mb3_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8mb3_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8mb3_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8mb3_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_status`
--

CREATE TABLE `b_form_status` (
  `ID` int NOT NULL,
  `FORM_ID` int NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_status_2_group`
--

CREATE TABLE `b_form_status_2_group` (
  `ID` int NOT NULL,
  `STATUS_ID` int NOT NULL DEFAULT '0',
  `GROUP_ID` int NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_form_status_2_mail_template`
--

CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum`
--

CREATE TABLE `b_forum` (
  `ID` int NOT NULL,
  `FORUM_GROUP_ID` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `SORT` int NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int NOT NULL DEFAULT '0',
  `POSTS` int NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint DEFAULT NULL,
  `POSTS_UNAPPROVED` int DEFAULT '0',
  `ABS_LAST_POSTER_ID` int DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum2site`
--

CREATE TABLE `b_forum2site` (
  `FORUM_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_dictionary`
--

CREATE TABLE `b_forum_dictionary` (
  `ID` int NOT NULL,
  `TITLE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_forum_dictionary`
--

INSERT INTO `b_forum_dictionary` (`ID`, `TITLE`, `TYPE`) VALUES
(1, '[ru] Словарь слов', 'W'),
(2, '[ru] Словарь транслита', 'T'),
(3, '[en] Bad words', 'W'),
(4, '[en] Transliteration', 'T');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_email`
--

CREATE TABLE `b_forum_email` (
  `ID` int NOT NULL,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int NOT NULL,
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  `MAIL_FILTER_ID` int NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_file`
--

CREATE TABLE `b_forum_file` (
  `ID` int NOT NULL,
  `FORUM_ID` int DEFAULT NULL,
  `TOPIC_ID` int DEFAULT NULL,
  `MESSAGE_ID` int DEFAULT NULL,
  `FILE_ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `HITS` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_filter`
--

CREATE TABLE `b_forum_filter` (
  `ID` int NOT NULL,
  `DICTIONARY_ID` int DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8mb3_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_forum_filter`
--

INSERT INTO `b_forum_filter` (`ID`, `DICTIONARY_ID`, `WORDS`, `PATTERN`, `REPLACEMENT`, `DESCRIPTION`, `USE_IT`, `PATTERN_CREATE`) VALUES
(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_group`
--

CREATE TABLE `b_forum_group` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '150',
  `PARENT_ID` int DEFAULT NULL,
  `LEFT_MARGIN` int DEFAULT NULL,
  `RIGHT_MARGIN` int DEFAULT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_group_lang`
--

CREATE TABLE `b_forum_group_lang` (
  `ID` int NOT NULL,
  `FORUM_GROUP_ID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_letter`
--

CREATE TABLE `b_forum_letter` (
  `ID` int NOT NULL,
  `DICTIONARY_ID` int DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_forum_letter`
--

INSERT INTO `b_forum_letter` (`ID`, `DICTIONARY_ID`, `LETTER`, `REPLACEMENT`) VALUES
(1, 2, 'а', 'АаAa'),
(2, 2, 'б', 'БбBb'),
(3, 2, 'в', 'ВвVv'),
(4, 2, 'г', 'Гг'),
(5, 2, 'д', 'ДдDd'),
(6, 2, 'е', 'ЁёЕеEe'),
(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
(8, 2, 'ж', 'ЖжGg'),
(9, 2, 'з', 'ЗзZz3'),
(10, 2, 'и', 'ИиIi'),
(11, 2, 'й', 'ЙйИиYy'),
(12, 2, 'к', 'КкKk'),
(13, 2, 'л', 'ЛлLl'),
(14, 2, 'м', 'МмMm'),
(15, 2, 'н', 'НнNn'),
(16, 2, 'о', 'ОоOo'),
(17, 2, 'п', 'ПпPp'),
(18, 2, 'р', 'РрPpRr'),
(19, 2, 'с', 'СсCc'),
(20, 2, 'т', 'ТтTt'),
(21, 2, 'у', 'УуUu'),
(22, 2, 'ф', 'ФфFf'),
(23, 2, 'х', 'ХхXx'),
(24, 2, 'ц', 'ЦцCc'),
(25, 2, 'ч', 'Чч'),
(26, 2, 'ш', 'Шш'),
(27, 2, 'щ', 'Щщ'),
(28, 2, 'ь', 'ЪъЬь\"\','),
(29, 2, 'ы', 'Ыы'),
(30, 2, 'ъ', 'ЪъЬь\"\','),
(31, 2, 'э', 'Ээ'),
(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
(33, 2, 'я', 'Яя'),
(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
(36, 2, 'тся', '%'),
(37, 2, 'ться', '%');

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_message`
--

CREATE TABLE `b_forum_message` (
  `ID` bigint NOT NULL,
  `FORUM_ID` int NOT NULL,
  `TOPIC_ID` bigint NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8mb3_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8mb3_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8mb3_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PARAM2` int DEFAULT NULL,
  `AUTHOR_ID` int DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GUEST_ID` int DEFAULT NULL,
  `EDITOR_ID` int DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8mb3_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8mb3_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8mb3_unicode_ci,
  `SERVICE_TYPE` tinyint DEFAULT NULL,
  `SERVICE_DATA` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_perms`
--

CREATE TABLE `b_forum_perms` (
  `ID` int NOT NULL,
  `FORUM_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `PERMISSION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_pm_folder`
--

CREATE TABLE `b_forum_pm_folder` (
  `ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `SORT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_forum_pm_folder`
--

INSERT INTO `b_forum_pm_folder` (`ID`, `TITLE`, `USER_ID`, `SORT`) VALUES
(1, 'SYSTEM_FOLDER_1', 0, 0),
(2, 'SYSTEM_FOLDER_2', 0, 0),
(3, 'SYSTEM_FOLDER_3', 0, 0),
(4, 'SYSTEM_FOLDER_4', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_points`
--

CREATE TABLE `b_forum_points` (
  `ID` int NOT NULL,
  `MIN_POINTS` int NOT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_points2post`
--

CREATE TABLE `b_forum_points2post` (
  `ID` int NOT NULL,
  `MIN_NUM_POSTS` int NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_points_lang`
--

CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_private_message`
--

CREATE TABLE `b_forum_private_message` (
  `ID` bigint NOT NULL,
  `AUTHOR_ID` int DEFAULT '0',
  `RECIPIENT_ID` int DEFAULT '0',
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `FOLDER_ID` int NOT NULL,
  `IS_READ` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_rank`
--

CREATE TABLE `b_forum_rank` (
  `ID` int NOT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_rank_lang`
--

CREATE TABLE `b_forum_rank_lang` (
  `ID` int NOT NULL,
  `RANK_ID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_service_deleted_message`
--

CREATE TABLE `b_forum_service_deleted_message` (
  `ID` bigint NOT NULL,
  `FORUM_ID` int NOT NULL,
  `TOPIC_ID` bigint NOT NULL,
  `MESSAGE_ID` bigint NOT NULL,
  `NEW_TOPIC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `PARAM1` varchar(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PARAM2` int DEFAULT NULL,
  `AUTHOR_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_service_statistic_queue`
--

CREATE TABLE `b_forum_service_statistic_queue` (
  `ID` bigint NOT NULL,
  `ENTITY_TYPE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ENTITY_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_stat`
--

CREATE TABLE `b_forum_stat` (
  `ID` bigint NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint NOT NULL DEFAULT '0',
  `TOPIC_ID` int DEFAULT NULL,
  `SHOW_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_subscribe`
--

CREATE TABLE `b_forum_subscribe` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `FORUM_ID` int NOT NULL,
  `TOPIC_ID` int DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_topic`
--

CREATE TABLE `b_forum_topic` (
  `ID` bigint NOT NULL,
  `FORUM_ID` int NOT NULL,
  `TOPIC_ID` bigint DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '150',
  `VIEWS` int NOT NULL DEFAULT '0',
  `USER_START_ID` int DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int NOT NULL DEFAULT '0',
  `POSTS_SERVICE` int NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint DEFAULT NULL,
  `POSTS_UNAPPROVED` int DEFAULT '0',
  `ABS_LAST_POSTER_ID` int DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8mb3_unicode_ci,
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  `OWNER_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user`
--

CREATE TABLE `b_forum_user` (
  `ID` bigint NOT NULL,
  `USER_ID` int NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AVATAR` int DEFAULT NULL,
  `NUM_POSTS` int DEFAULT '0',
  `INTERESTS` text COLLATE utf8mb3_unicode_ci,
  `LAST_POST` int DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int DEFAULT NULL,
  `POINTS` int NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user_forum`
--

CREATE TABLE `b_forum_user_forum` (
  `ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `FORUM_ID` int DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user_points`
--

CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int NOT NULL,
  `TO_USER_ID` int NOT NULL,
  `POINTS` int NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_forum_user_topic`
--

CREATE TABLE `b_forum_user_topic` (
  `ID` bigint NOT NULL,
  `TOPIC_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `FORUM_ID` int DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoip_handlers`
--

CREATE TABLE `b_geoip_handlers` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_geoip_handlers`
--

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1, 100, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\GeoIP2', NULL),
(2, 110, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(3, 120, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoname`
--

CREATE TABLE `b_geoname` (
  `ID` bigint UNSIGNED NOT NULL,
  `LANGUAGE_CODE` varchar(35) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(600) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE `b_group` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8mb3_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `COLLECTION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE `b_group_subordinate` (
  `ID` int NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE `b_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE `b_hlblock_entity` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_lang`
--

CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int UNSIGNED NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_rights`
--

CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int UNSIGNED NOT NULL,
  `HL_ID` int UNSIGNED NOT NULL,
  `TASK_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE `b_hot_keys` (
  `ID` int NOT NULL,
  `KEYS_STRING` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE_ID` int NOT NULL,
  `USER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE `b_hot_keys_code` (
  `ID` int NOT NULL,
  `CLASS_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock`
--

CREATE TABLE `b_iblock` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REST_ON` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int DEFAULT NULL,
  `RSS_FILE_DAYS` int DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VERSION` int NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock`
--

INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `API_CODE`, `REST_ON`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
(1, '2023-10-17 06:37:48', 'photos', 's1', 'photogallery_personal_s1', NULL, 'N', '[s1] Фотогалерея пользователей', 'Y', 500, '#SITE_DIR#/photo/', '#SITE_DIR#/photo/#SECTION_ID#/#ID#/', '#SITE_DIR#/photo/#ID#/', NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'photogallery_personal_s1', '7612d5992a2294c35d583273dbae1bed', 'Y', 'Y', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Альбомы', 'Альбом', 'Фотографии', 'Фотография'),
(2, '2023-10-17 06:41:48', 'dynamic_content', 's1', '', NULL, 'N', 'Новости', 'Y', 500, '#SITE_DIR#/news/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/dynamic_content/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/news/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_cache`
--

CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element`
--

CREATE TABLE `b_iblock_element` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `IBLOCK_ID` int NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8mb3_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8mb3_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8mb3_unicode_ci,
  `WF_STATUS_ID` int DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8mb3_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int DEFAULT NULL,
  `SHOW_COUNTER` int DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element`
--

INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
(1, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '1.jpg', 3, '', 'html', 4, NULL, 'text', '1.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2865', '1.jpg', '', '-1331450879', NULL, NULL, NULL),
(2, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '13.jpg', 6, '', 'html', 7, NULL, 'text', '13.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2867', '13.jpg', '', '-1083459278', NULL, NULL, NULL),
(3, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '18.jpg', 9, '', 'html', 10, NULL, 'text', '18.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2868', '18.jpg', '', '55446061', NULL, NULL, NULL),
(4, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '2.jpg', 12, '', 'html', 13, NULL, 'text', '2.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2869', '2.jpg', '', '-1503706126', NULL, NULL, NULL),
(5, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '38.jpg', 15, '', 'html', 16, NULL, 'text', '38.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2874', '38.jpg', '', '899078098', NULL, NULL, NULL),
(6, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '40.jpg', 18, '', 'html', 19, NULL, 'text', '40.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2875', '40.jpg', '', '-423480074', NULL, NULL, NULL),
(7, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '48.jpg', 21, '', 'html', 22, NULL, 'text', '48.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2877', '48.jpg', '', '-656072010', NULL, NULL, NULL),
(8, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '50.jpg', NULL, '', 'html', 24, NULL, 'text', '50.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2878', '50.jpg', '', '1207537908', NULL, NULL, NULL),
(9, '2023-10-17 09:37:48', 1, '2023-10-17 09:37:48', 1, 1, 1, 'Y', NULL, NULL, 500, '8.jpg', 25, '', 'html', 26, NULL, 'text', '8.JPG\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2879', '8.jpg', '', '460743621', NULL, NULL, NULL),
(10, '2023-10-17 10:39:27', 1, '2023-10-17 09:48:17', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 1', 40, 'Описание для анонса', 'text', 35, 'полный текст новости.', 'text', 'НОВОСТЬ 1\r\nОПИСАНИЕ ДЛЯ АНОНСА\r\nПОЛНЫЙ ТЕКСТ НОВОСТИ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '10', '', '', '0', NULL, 2, '2023-10-17 09:55:30'),
(11, '2023-10-17 10:39:34', 1, '2023-10-17 10:06:04', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 2', 39, 'Описание для анонса 2', 'text', 37, 'Детальное описание новости 2', 'text', 'НОВОСТЬ 2\r\nОПИСАНИЕ ДЛЯ АНОНСА 2\r\nДЕТАЛЬНОЕ ОПИСАНИЕ НОВОСТИ 2', 1, NULL, NULL, NULL, NULL, NULL, 'N', '11', '', '', '0', NULL, 1, '2023-10-17 10:09:17'),
(12, '2023-10-18 12:14:04', 1, '2023-10-18 12:14:04', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 3', 41, 'Анонс новости 3', 'text', 42, 'Детальный текст новости 3', 'text', 'НОВОСТЬ 3\r\nАНОНС НОВОСТИ 3\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 3', 1, NULL, NULL, NULL, NULL, NULL, 'N', '12', '', '', '0', NULL, NULL, NULL),
(13, '2023-10-18 12:14:34', 1, '2023-10-18 12:14:34', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 4', 43, 'Анонс новости 4', 'text', 44, 'Детальный текст новости 4', 'text', 'НОВОСТЬ 4\r\nАНОНС НОВОСТИ 4\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 4', 1, NULL, NULL, NULL, NULL, NULL, 'N', '13', '', '', '0', NULL, NULL, NULL),
(14, '2023-10-18 12:15:00', 1, '2023-10-18 12:15:00', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 5', 45, 'Описание новости 5', 'text', 46, 'Детальный текст новости 5', 'text', 'НОВОСТЬ 5\r\nОПИСАНИЕ НОВОСТИ 5\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 5', 1, NULL, NULL, NULL, NULL, NULL, 'N', '14', '', '', '0', NULL, NULL, NULL),
(15, '2023-10-18 12:15:43', 1, '2023-10-18 12:15:43', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 6', 47, 'Анонс новости 6', 'text', 48, 'Детальный текст новости 6', 'text', 'НОВОСТЬ 6\r\nАНОНС НОВОСТИ 6\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 6', 1, NULL, NULL, NULL, NULL, NULL, 'N', '15', '', '', '0', NULL, NULL, NULL),
(16, '2023-10-18 12:16:15', 1, '2023-10-18 12:16:15', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 7', 49, 'Анонс новости 7', 'text', 50, 'Детальный текст новости 7', 'text', 'НОВОСТЬ 7\r\nАНОНС НОВОСТИ 7\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 7', 1, NULL, NULL, NULL, NULL, NULL, 'N', '16', '', '', '0', NULL, 1, '2023-10-18 12:16:47'),
(17, '2023-10-18 12:17:22', 1, '2023-10-18 12:17:22', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 8', 51, 'Анонс новости 8', 'text', 52, 'Детальная новости 8', 'text', 'НОВОСТЬ 8\r\nАНОНС НОВОСТИ 8\r\nДЕТАЛЬНАЯ НОВОСТИ 8', 1, NULL, NULL, NULL, NULL, NULL, 'N', '17', '', '', '0', NULL, NULL, NULL),
(18, '2023-10-18 12:17:50', 1, '2023-10-18 12:17:50', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 9', 53, 'Анонс новости 9', 'text', 54, 'Детальная новости 9', 'text', 'НОВОСТЬ 9\r\nАНОНС НОВОСТИ 9\r\nДЕТАЛЬНАЯ НОВОСТИ 9', 1, NULL, NULL, NULL, NULL, NULL, 'N', '18', '', '', '0', NULL, NULL, NULL),
(19, '2023-10-18 12:18:20', 1, '2023-10-18 12:18:20', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Новость 10', 55, 'Анонс новости 10', 'text', 56, 'Детальная новости 10', 'text', 'НОВОСТЬ 10\r\nАНОНС НОВОСТИ 10\r\nДЕТАЛЬНАЯ НОВОСТИ 10', 1, NULL, NULL, NULL, NULL, NULL, 'N', '19', '', '', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_iprop`
--

CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `ELEMENT_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_lock`
--

CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_property`
--

CREATE TABLE `b_iblock_element_property` (
  `ID` int NOT NULL,
  `IBLOCK_PROPERTY_ID` int NOT NULL,
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element_property`
--

INSERT INTO `b_iblock_element_property` (`ID`, `IBLOCK_PROPERTY_ID`, `IBLOCK_ELEMENT_ID`, `VALUE`, `VALUE_TYPE`, `VALUE_ENUM`, `VALUE_NUM`, `DESCRIPTION`) VALUES
(1, 1, 1, 'Y', 'text', NULL, '0.0000', ''),
(2, 2, 1, '5', 'text', NULL, '5.0000', ''),
(3, 3, 1, 'Y', 'text', NULL, '0.0000', ''),
(4, 6, 1, '3', 'text', NULL, '3.0000', ''),
(5, 7, 1, '15', 'text', NULL, '15.0000', ''),
(6, 8, 1, '3.56', 'text', NULL, '3.5600', ''),
(7, 1, 2, 'Y', 'text', NULL, '0.0000', ''),
(8, 2, 2, '8', 'text', NULL, '8.0000', ''),
(9, 3, 2, 'Y', 'text', NULL, '0.0000', ''),
(10, 6, 2, '3', 'text', NULL, '3.0000', ''),
(11, 7, 2, '15', 'text', NULL, '15.0000', ''),
(12, 8, 2, '3.56', 'text', NULL, '3.5600', ''),
(13, 1, 3, 'Y', 'text', NULL, '0.0000', ''),
(14, 2, 3, '11', 'text', NULL, '11.0000', ''),
(15, 3, 3, 'Y', 'text', NULL, '0.0000', ''),
(16, 6, 3, '3', 'text', NULL, '3.0000', ''),
(17, 7, 3, '15', 'text', NULL, '15.0000', ''),
(18, 8, 3, '3.56', 'text', NULL, '3.5600', ''),
(19, 1, 4, 'Y', 'text', NULL, '0.0000', ''),
(20, 2, 4, '14', 'text', NULL, '14.0000', ''),
(21, 3, 4, 'Y', 'text', NULL, '0.0000', ''),
(22, 6, 4, '3', 'text', NULL, '3.0000', ''),
(23, 7, 4, '15', 'text', NULL, '15.0000', ''),
(24, 8, 4, '3.56', 'text', NULL, '3.5600', ''),
(25, 1, 5, 'Y', 'text', NULL, '0.0000', ''),
(26, 2, 5, '17', 'text', NULL, '17.0000', ''),
(27, 3, 5, 'Y', 'text', NULL, '0.0000', ''),
(28, 6, 5, '2', 'text', NULL, '2.0000', ''),
(29, 7, 5, '10', 'text', NULL, '10.0000', ''),
(30, 8, 5, '3.44', 'text', NULL, '3.4400', ''),
(31, 1, 6, 'Y', 'text', NULL, '0.0000', ''),
(32, 2, 6, '20', 'text', NULL, '20.0000', ''),
(33, 3, 6, 'Y', 'text', NULL, '0.0000', ''),
(34, 6, 6, '2', 'text', NULL, '2.0000', ''),
(35, 7, 6, '10', 'text', NULL, '10.0000', ''),
(36, 8, 6, '3.44', 'text', NULL, '3.4400', ''),
(37, 1, 7, 'Y', 'text', NULL, '0.0000', ''),
(38, 2, 7, '23', 'text', NULL, '23.0000', ''),
(39, 3, 7, 'Y', 'text', NULL, '0.0000', ''),
(40, 6, 7, '1', 'text', NULL, '1.0000', ''),
(41, 7, 7, '5', 'text', NULL, '5.0000', ''),
(42, 8, 7, '3.3', 'text', NULL, '3.3000', ''),
(43, 1, 8, 'Y', 'text', NULL, '0.0000', ''),
(44, 3, 8, 'Y', 'text', NULL, '0.0000', ''),
(45, 6, 8, '1', 'text', NULL, '1.0000', ''),
(46, 7, 8, '5', 'text', NULL, '5.0000', ''),
(47, 8, 8, '3.3', 'text', NULL, '3.3000', ''),
(48, 1, 9, 'Y', 'text', NULL, '0.0000', ''),
(49, 2, 9, '27', 'text', NULL, '27.0000', ''),
(50, 3, 9, 'Y', 'text', NULL, '0.0000', ''),
(51, 6, 9, '1', 'text', NULL, '1.0000', ''),
(52, 7, 9, '5', 'text', NULL, '5.0000', ''),
(53, 8, 9, '3.3', 'text', NULL, '3.3000', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_right`
--

CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `ELEMENT_ID` int NOT NULL,
  `RIGHT_ID` int NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_fields`
--

CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_fields`
--

INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', ''),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'N', ''),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SORT', 'N', '0'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'Y', ''),
(1, 'XML_IMPORT_START_TIME', 'N', '2023-10-17 09:37:48'),
(2, 'ACTIVE', 'Y', 'Y'),
(2, 'ACTIVE_FROM', 'N', ''),
(2, 'ACTIVE_TO', 'N', ''),
(2, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),
(2, 'DETAIL_TEXT', 'N', ''),
(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(2, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(2, 'LOG_ELEMENT_ADD', 'N', NULL),
(2, 'LOG_ELEMENT_DELETE', 'N', NULL),
(2, 'LOG_ELEMENT_EDIT', 'N', NULL),
(2, 'LOG_SECTION_ADD', 'N', NULL),
(2, 'LOG_SECTION_DELETE', 'N', NULL),
(2, 'LOG_SECTION_EDIT', 'N', NULL),
(2, 'NAME', 'Y', ''),
(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),
(2, 'PREVIEW_TEXT', 'N', ''),
(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(2, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'SECTION_DESCRIPTION', 'N', ''),
(2, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(2, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),
(2, 'SECTION_NAME', 'Y', ''),
(2, 'SECTION_PICTURE', 'N', 'a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),
(2, 'SECTION_XML_ID', 'N', ''),
(2, 'SORT', 'N', '500'),
(2, 'TAGS', 'N', ''),
(2, 'XML_ID', 'Y', ''),
(2, 'XML_IMPORT_START_TIME', 'N', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_group`
--

CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `PERMISSION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_group`
--

INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
(1, 1, 'X'),
(1, 2, 'R'),
(2, 1, 'X');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iblock_iprop`
--

CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iproperty`
--

CREATE TABLE `b_iblock_iproperty` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `TEMPLATE` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_messages`
--

CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_messages`
--

INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
(1, 'ELEMENT_ADD', 'Добавить фотографию'),
(1, 'ELEMENT_DELETE', 'Удалить фотографию'),
(1, 'ELEMENT_EDIT', 'Изменить фотографию'),
(1, 'ELEMENT_NAME', 'Фотография'),
(1, 'ELEMENTS_NAME', 'Фотографии'),
(1, 'SECTION_ADD', 'Добавить альбом'),
(1, 'SECTION_DELETE', 'Удалить альбом'),
(1, 'SECTION_EDIT', 'Изменить альбом'),
(1, 'SECTION_NAME', 'Альбом'),
(1, 'SECTIONS_NAME', 'Альбомы'),
(2, 'ELEMENT_ADD', 'Добавить элемент'),
(2, 'ELEMENT_DELETE', 'Удалить элемент'),
(2, 'ELEMENT_EDIT', 'Изменить элемент'),
(2, 'ELEMENT_NAME', 'Элемент'),
(2, 'ELEMENTS_NAME', 'Элементы'),
(2, 'SECTION_ADD', 'Добавить раздел'),
(2, 'SECTION_DELETE', 'Удалить раздел'),
(2, 'SECTION_EDIT', 'Изменить раздел'),
(2, 'SECTION_NAME', 'Раздел'),
(2, 'SECTIONS_NAME', 'Разделы');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_offers_tmp`
--

CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int UNSIGNED NOT NULL,
  `PRODUCT_IBLOCK_ID` int UNSIGNED NOT NULL,
  `OFFERS_IBLOCK_ID` int UNSIGNED NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property`
--

CREATE TABLE `b_iblock_property` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8mb3_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int NOT NULL DEFAULT '1',
  `COL_COUNT` int NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VERSION` int NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8mb3_unicode_ci,
  `HINT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_property`
--

INSERT INTO `b_iblock_property` (`ID`, `TIMESTAMP_X`, `IBLOCK_ID`, `NAME`, `ACTIVE`, `SORT`, `CODE`, `DEFAULT_VALUE`, `PROPERTY_TYPE`, `ROW_COUNT`, `COL_COUNT`, `LIST_TYPE`, `MULTIPLE`, `XML_ID`, `FILE_TYPE`, `MULTIPLE_CNT`, `TMP_ID`, `LINK_IBLOCK_ID`, `WITH_DESCRIPTION`, `SEARCHABLE`, `FILTRABLE`, `IS_REQUIRED`, `VERSION`, `USER_TYPE`, `USER_TYPE_SETTINGS`, `HINT`) VALUES
(1, '2023-10-17 06:37:48', 1, 'Элемент одобрен', 'Y', 500, 'APPROVE_ELEMENT', NULL, 'S', 1, 30, 'L', 'N', '69', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(2, '2023-10-17 06:37:48', 1, 'Оригинал', 'Y', 500, 'REAL_PICTURE', NULL, 'F', 1, 30, 'L', 'N', '67', 'jpg, gif, bmp, png, jpeg', 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(3, '2023-10-17 06:37:48', 1, 'Элемент опубликован', 'Y', 500, 'PUBLIC_ELEMENT', NULL, 'S', 1, 30, 'L', 'N', '68', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(4, '2023-10-17 06:37:48', 1, 'Тема форума для комментариев', 'Y', 500, 'FORUM_TOPIC_ID', NULL, 'S', 1, 30, 'L', 'N', '70', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, 'TopicID', NULL, NULL),
(5, '2023-10-17 06:37:48', 1, 'Количество комментариев к элементу', 'Y', 500, 'FORUM_MESSAGE_CNT', NULL, 'N', 1, 30, 'L', 'N', '71', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(6, '2023-10-17 06:37:48', 1, 'Количество голосов', 'Y', 500, 'vote_count', NULL, 'N', 1, 30, 'L', 'N', '72', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(7, '2023-10-17 06:37:48', 1, 'Сумма голосов', 'Y', 500, 'vote_sum', NULL, 'N', 1, 30, 'L', 'N', '73', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(8, '2023-10-17 06:37:48', 1, 'Рейтинг', 'Y', 500, 'rating', NULL, 'N', 1, 30, 'L', 'N', '74', NULL, 0, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_enum`
--

CREATE TABLE `b_iblock_property_enum` (
  `ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_feature`
--

CREATE TABLE `b_iblock_property_feature` (
  `ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_right`
--

CREATE TABLE `b_iblock_right` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TASK_ID` int NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_rss`
--

CREATE TABLE `b_iblock_rss` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `NODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section`
--

CREATE TABLE `b_iblock_section` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `IBLOCK_ID` int NOT NULL,
  `IBLOCK_SECTION_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PICTURE` int DEFAULT NULL,
  `LEFT_MARGIN` int DEFAULT NULL,
  `RIGHT_MARGIN` int DEFAULT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8mb3_unicode_ci,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int DEFAULT NULL,
  `SOCNET_GROUP_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_section`
--

INSERT INTO `b_iblock_section` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `GLOBAL_ACTIVE`, `SORT`, `NAME`, `PICTURE`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `SEARCHABLE_CONTENT`, `CODE`, `XML_ID`, `TMP_ID`, `DETAIL_PICTURE`, `SOCNET_GROUP_ID`) VALUES
(1, '2023-10-17 06:37:48', 1, '2023-10-17 09:37:48', 1, 1, NULL, 'Y', 'Y', 500, 'Корпоративный выезд на косу', 1, 1, 2, 1, 'День рождения компании на косе.', 'html', 'КОРПОРАТИВНЫЙ ВЫЕЗД НА КОСУ\r\nДЕНЬ РОЖДЕНИЯ КОМПАНИИ НА КОСЕ.', NULL, '751', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_element`
--

CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int NOT NULL,
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_section_element`
--

INSERT INTO `b_iblock_section_element` (`IBLOCK_SECTION_ID`, `IBLOCK_ELEMENT_ID`, `ADDITIONAL_PROPERTY_ID`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(1, 8, NULL),
(1, 9, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_iprop`
--

CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_property`
--

CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_right`
--

CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `RIGHT_ID` int NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_sequence`
--

CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SEQ_VALUE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_site`
--

CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_site`
--

INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type`
--

CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type`
--

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('dynamic_content', 'Y', '', '', 'N', 500),
('photos', 'Y', NULL, NULL, 'N', 50),
('rest_entity', 'Y', NULL, NULL, 'N', 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type_lang`
--

CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type_lang`
--

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('rest_entity', 'ru', 'Хранилище данных для приложений', 'Разделы', 'Элементы'),
('photos', 'ru', 'Фотогалерея', 'Альбомы', 'Фотографии'),
('photos', 'en', 'Photo Gallery', 'Albums', 'Photos'),
('dynamic_content', 'ru', 'Динамический контент', '', ''),
('dynamic_content', 'en', 'Dynamic content', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing`
--

CREATE TABLE `b_landing` (
  `ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TPL_ID` int DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SITE_ID` int NOT NULL,
  `SITEMAP` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8mb3_unicode_ci,
  `VERSION` int NOT NULL DEFAULT '1',
  `HISTORY_STEP` int NOT NULL DEFAULT '0',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_binding`
--

CREATE TABLE `b_landing_binding` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_block`
--

CREATE TABLE `b_landing_block` (
  `ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `LID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE_ORIGINAL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT '500',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8mb3_unicode_ci,
  `CONTENT` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8mb3_unicode_ci,
  `ASSETS` text COLLATE utf8mb3_unicode_ci,
  `FAVORITE_META` text COLLATE utf8mb3_unicode_ci,
  `HISTORY_STEP_DESIGNER` int NOT NULL DEFAULT '0',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_block_last_used`
--

CREATE TABLE `b_landing_block_last_used` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_chat`
--

CREATE TABLE `b_landing_chat` (
  `ID` int NOT NULL,
  `CHAT_ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AVATAR` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_chat_binding`
--

CREATE TABLE `b_landing_chat_binding` (
  `ID` int NOT NULL,
  `INTERNAL_CHAT_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_cookies_agreement`
--

CREATE TABLE `b_landing_cookies_agreement` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_demo`
--

CREATE TABLE `b_landing_demo` (
  `ID` int NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8mb3_unicode_ci,
  `LANG` text COLLATE utf8mb3_unicode_ci,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_designer_repo`
--

CREATE TABLE `b_landing_designer_repo` (
  `ID` int NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT '100',
  `HTML` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_domain`
--

CREATE TABLE `b_landing_domain` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PREV_DOMAIN` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FAIL_COUNT` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_entity_lock`
--

CREATE TABLE `b_landing_entity_lock` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LOCK_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_entity_rights`
--

CREATE TABLE `b_landing_entity_rights` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TASK_ID` int NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ROLE_ID` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_file`
--

CREATE TABLE `b_landing_file` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_ID` int NOT NULL,
  `TEMP` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_filter_block`
--

CREATE TABLE `b_landing_filter_block` (
  `ID` int NOT NULL,
  `FILTER_ID` int NOT NULL,
  `BLOCK_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_filter_entity`
--

CREATE TABLE `b_landing_filter_entity` (
  `ID` int NOT NULL,
  `SOURCE_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8mb3_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_folder`
--

CREATE TABLE `b_landing_folder` (
  `ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` int NOT NULL,
  `INDEX_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_history`
--

CREATE TABLE `b_landing_history` (
  `ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'L',
  `ENTITY_ID` int NOT NULL,
  `ACTION` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTION_PARAMS` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `MULTIPLY_ID` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_hook_data`
--

CREATE TABLE `b_landing_hook_data` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci,
  `PUBLIC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_placement`
--

CREATE TABLE `b_landing_placement` (
  `ID` int NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_repo`
--

CREATE TABLE `b_landing_repo` (
  `ID` int NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8mb3_unicode_ci,
  `CONTENT` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_role`
--

CREATE TABLE `b_landing_role` (
  `ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8mb3_unicode_ci,
  `ADDITIONAL_RIGHTS` text COLLATE utf8mb3_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_site`
--

CREATE TABLE `b_landing_site` (
  `ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int DEFAULT NULL,
  `LANDING_ID_404` int DEFAULT NULL,
  `LANDING_ID_503` int DEFAULT NULL,
  `LANG` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `VERSION` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_syspage`
--

CREATE TABLE `b_landing_syspage` (
  `ID` int NOT NULL,
  `SITE_ID` int NOT NULL,
  `TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LANDING_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_template`
--

CREATE TABLE `b_landing_template` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int DEFAULT '100',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `AREA_COUNT` int NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_landing_template`
--

INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50'),
(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50'),
(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50'),
(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>', 1, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50'),
(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>', 2, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50'),
(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50'),
(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2023-10-17 06:34:50', '2023-10-17 06:34:50');

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_template_ref`
--

CREATE TABLE `b_landing_template_ref` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AREA` int NOT NULL,
  `LANDING_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_update_block`
--

CREATE TABLE `b_landing_update_block` (
  `ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int DEFAULT '0',
  `PARAMS` text COLLATE utf8mb3_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_host`
--

CREATE TABLE `b_landing_urlchecker_host` (
  `ID` int NOT NULL,
  `STATUS_ID` int NOT NULL,
  `HOST` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_status`
--

CREATE TABLE `b_landing_urlchecker_status` (
  `ID` int NOT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `HASH` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `STATUS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_whitelist`
--

CREATE TABLE `b_landing_urlchecker_whitelist` (
  `ID` int NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlrewrite`
--

CREATE TABLE `b_landing_urlrewrite` (
  `ID` int NOT NULL,
  `SITE_ID` int NOT NULL,
  `RULE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LANDING_ID` int NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_view`
--

CREATE TABLE `b_landing_view` (
  `ID` int NOT NULL,
  `LID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `VIEWS` int NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1', 1, 'Y', 'Y', 'Персональный сайт (Сайт по умолчанию)', '/', NULL, NULL, NULL, NULL, NULL, 'ru', NULL, 'N', NULL, 'Персональный сайт', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL,
  `CODE` varchar(35) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`, `CODE`) VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2, 'en'),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_list_rubric`
--

CREATE TABLE `b_list_rubric` (
  `ID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `SORT` int NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location`
--

CREATE TABLE `b_location` (
  `ID` int NOT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SOURCE_CODE` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `TYPE` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_address`
--

CREATE TABLE `b_location_address` (
  `ID` int NOT NULL,
  `LOCATION_ID` int DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_addr_fld`
--

CREATE TABLE `b_location_addr_fld` (
  `ADDRESS_ID` int NOT NULL,
  `TYPE` int NOT NULL,
  `VALUE` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALUE_NORMALIZED` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_addr_link`
--

CREATE TABLE `b_location_addr_link` (
  `ADDRESS_ID` int NOT NULL,
  `ENTITY_ID` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_area`
--

CREATE TABLE `b_location_area` (
  `ID` int NOT NULL,
  `TYPE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL,
  `GEOMETRY` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_location_area`
--

INSERT INTO `b_location_area` (`ID`, `TYPE`, `CODE`, `SORT`, `GEOMETRY`) VALUES
(1, 'DISPUTED', 'CRIMEA', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[32.201579,45.396892],[32.2052178,45.3690507],[32.2090567,45.3553206],[32.2172905,45.3355145],[32.2240585,45.3025866],[32.235686,45.2758033],[32.2434204,45.2628881],[32.2625503,45.2383126],[32.2738567,45.2267674],[32.2996887,45.2054331],[32.329404,45.1867687],[32.3624492,45.1711247],[32.3982085,45.1587952],[32.4168995,45.1539484],[32.4554687,45.1470047],[32.4878048,45.1442331],[32.5164102,45.1327887],[32.5532795,45.1222016],[32.5918488,45.115254],[32.6313994,45.1120768],[32.6711947,45.1127297],[32.729727,45.1208441],[32.8314558,45.1507864],[32.853076,45.1219934],[32.8767811,45.0994253],[32.8902144,45.0890467],[32.9199297,45.0703442],[32.9451894,45.0580954],[32.9796287,45.0321305],[33.0110823,45.0148866],[33.0279839,45.0074406],[33.0637432,44.9950757],[33.0879643,44.989073],[33.1342119,44.9689946],[33.192902,44.9506562],[33.2511697,44.9416162],[33.2951871,44.9405202],[33.5542562,44.8402319],[33.5621787,44.8410979],[33.5671526,44.838601],[33.5736666,44.8238183],[33.5866523,44.807848],[33.6044231,44.8103433],[33.6586481,44.7965631],[33.6693271,44.7918226],[33.6774224,44.7858657],[33.6827993,44.7703386],[33.6355485,44.7529449],[33.6136625,44.7497551],[33.6148368,44.7391957],[33.6111957,44.738286],[33.6105707,44.7329396],[33.611606,44.7296545],[33.6146258,44.729927],[33.6161203,44.711976],[33.6589663,44.7142533],[33.6708014,44.7097439],[33.7006932,44.7148119],[33.7072434,44.7105734],[33.7051533,44.7086069],[33.7050933,44.7049158],[33.7145084,44.705868],[33.715643,44.715848],[33.7265921,44.716636],[33.7348624,44.7075832],[33.7462868,44.7010307],[33.7518027,44.6987863],[33.7615132,44.7009902],[33.7769711,44.690265],[33.7674787,44.6820761],[33.754625,44.6753399],[33.7518666,44.6637439],[33.7300323,44.6470751],[33.7254762,44.6401041],[33.7176817,44.6375914],[33.7168675,44.6332156],[33.7218757,44.631584],[33.7162703,44.6204383],[33.7272166,44.6085501],[33.7286926,44.6046812],[33.735653,44.6009246],[33.7419126,44.6053835],[33.7496197,44.60791],[33.7651672,44.6091022],[33.7795796,44.6131096],[33.7828306,44.6059825],[33.781845,44.5971035],[33.7872108,44.5856602],[33.7920091,44.5848619],[33.7951987,44.5802969],[33.8004378,44.5814222],[33.8056839,44.5753186],[33.8093847,44.5769972],[33.8114458,44.5738111],[33.8139036,44.5771175],[33.8173303,44.577274],[33.8272108,44.5712636],[33.8273394,44.563316],[33.8310821,44.5548411],[33.8345552,44.5499395],[33.8372152,44.548782],[33.8337314,44.5416787],[33.8394649,44.5384748],[33.8401482,44.5304315],[33.8494976,44.5306195],[33.8572702,44.5258757],[33.8456566,44.519124],[33.85315,44.5154015],[33.8603572,44.5067568],[33.868911,44.5073968],[33.8707581,44.5054113],[33.8673484,44.5025419],[33.8672494,44.5003522],[33.8736292,44.4926938],[33.8869091,44.4822103],[33.8971535,44.4787873],[33.8934902,44.4732254],[33.8972198,44.4692246],[33.9262025,44.4213251],[33.9094099,44.4188846],[33.9024805,44.4193681],[33.8980569,44.4214726],[33.8828051,44.4210572],[33.8706281,44.4188467],[33.8591887,44.4199143],[33.8469623,44.4171293],[33.8292787,44.4089158],[33.8245729,44.411664],[33.8140922,44.4100258],[33.797829,44.4041246],[33.781585,44.4057444],[33.7840022,44.402866],[33.7855572,44.3968776],[33.7623083,44.3900862],[33.696591,44.1910397],[33.7357422,44.1858835],[33.7755079,44.184598],[33.8151473,44.1872073],[33.8567133,44.1943491],[33.9116725,44.1858835],[33.9514382,44.184598],[33.9910776,44.1872073],[34.0298524,44.1936623],[34.0670401,44.2038415],[34.0927335,44.2136353],[34.1417952,44.2137713],[34.2003274,44.2220125],[34.2375152,44.2321868],[34.2552959,44.2386127],[34.2888171,44.2539909],[34.3191029,44.2724903],[34.3328536,44.282804],[34.3551268,44.3032135],[34.3834932,44.3128241],[34.4170144,44.3281829],[34.4325985,44.3370516],[34.4579166,44.3546118],[34.4947227,44.3688605],[34.5111166,44.3769423],[34.5414024,44.3954029],[34.5678887,44.4166315],[34.590082,44.4402299],[34.607569,44.4657558],[34.6144422,44.4790935],[34.6220858,44.4994412],[34.6450122,44.5206113],[34.6661359,44.547163],[34.7006849,44.5628297],[34.735755,44.5848013],[34.7764494,44.5934492],[34.8085382,44.6038903],[34.8324881,44.6023351],[34.8722834,44.6029938],[34.9291911,44.6108698],[34.963432,44.598995],[35.0012394,44.590126],[35.0602428,44.5838827],[35.1197957,44.5863196],[35.1774068,44.5973337],[35.1957581,44.6028408],[35.2306662,44.6164595],[35.2586785,44.6310857],[35.2852182,44.6416945],[35.3171962,44.6585585],[35.3318979,44.668113],[35.3583842,44.6892424],[35.3805775,44.7127305],[35.3975542,44.7373268],[35.4116276,44.7442895],[35.4626979,44.7517865],[35.4998857,44.7618689],[35.5176664,44.7682366],[35.5511876,44.7834757],[35.5667717,44.7922754],[35.5952241,44.8120281],[35.6196208,44.8343376],[35.6322493,44.8491155],[35.670408,44.8272773],[35.7048906,44.8131714],[35.7230689,44.8074017],[35.7803291,44.7955387],[35.8397932,44.7921897],[35.8794326,44.7947719],[35.9241291,44.8026019],[35.9742343,44.8026778],[36.013533,44.8071728],[36.051603,44.8154218],[36.1028199,44.8336163],[36.1372853,44.8256548],[36.1764365,44.8205545],[36.2162022,44.8192829],[36.2558416,44.821864],[36.3134527,44.8328333],[36.3630225,44.8503296],[36.4154063,44.8528108],[36.454181,44.8591924],[36.4913688,44.869256],[36.5262768,44.8828121],[36.5426707,44.8908227],[36.5729565,44.9091205],[36.5994428,44.9301619],[36.6097225,44.9406672],[36.5679872,45.0506562],[36.5428648,45.1340402],[36.5338353,45.1751824],[36.530486,45.1992024],[36.5542469,45.2216309],[36.5859391,45.2441721],[36.5941742,45.252542],[36.5937019,45.2823897],[36.6030245,45.3093876],[36.6227602,45.3280113],[36.6635019,45.3599397],[36.6815681,45.4566115],[36.6684499,45.6266206],[36.583205,45.635158],[36.3387005,45.6715002],[36.1353542,45.6476547],[36.1034835,45.638376],[36.0723795,45.6256431],[36.028427,45.6242237],[35.9817734,45.6167329],[35.9534794,45.6280572],[35.9215589,45.6372534],[35.8711492,45.6454011],[35.8366954,45.6469342],[35.8022501,45.6453103],[35.7518847,45.6370298],[35.7200141,45.6277494],[35.6901483,45.6156372],[35.6627986,45.6008987],[35.6384328,45.5837842],[35.6174678,45.5645842],[35.6002625,45.5436256],[35.587111,45.5212652],[35.5764936,45.4903874],[35.5747509,45.4895333],[35.5487365,45.5142538],[35.5242787,45.5313252],[35.4968497,45.5460096],[35.459695,45.5603381],[35.4555162,45.5730522],[35.4443574,45.5959169],[35.4290297,45.6175579],[35.4198817,45.6278035],[35.3869834,45.6557223],[35.3609843,45.6715964],[35.3373014,45.6827713],[35.3237297,45.7127561],[35.3165721,45.7237303],[35.299254,45.7445762],[35.2663557,45.7724368],[35.2334204,45.7917299],[34.9750748,45.7619919],[34.9597746,45.7565682],[34.9411705,45.7658247],[34.876163,45.7904304],[34.7990874,45.8104643],[34.8021689,45.9006479],[34.7540112,45.9088363],[34.6699108,45.9676437],[34.628541,45.9864034],[34.6011392,45.9941699],[34.5816123,45.9956678],[34.5611691,45.9943843],[34.5542176,45.9904652],[34.5448398,45.9790277],[34.5443875,45.9761218],[34.5269998,45.9590021],[34.5109022,45.9480281],[34.4985264,45.9425606],[34.4762212,45.9441393],[34.459176,45.9512094],[34.4430184,45.9618096],[34.4233801,45.9786713],[34.4131796,45.9897359],[34.4107666,45.9992636],[34.4049875,46.0092864],[34.3471695,46.0549489],[34.3326403,46.0598467],[34.320021,46.0682092],[34.2648618,46.0548851],[34.2521968,46.0531749],[34.1843736,46.0668628],[34.1450093,46.0866862],[34.1359107,46.0966617],[34.1218931,46.1057194],[34.0809285,46.117556],[34.0695052,46.1166994],[34.0526389,46.1091293],[33.9982336,46.1264504],[33.971714,46.1411991],[33.9405553,46.1546515],[33.8973358,46.1706248],[33.86133,46.1945116],[33.8486859,46.1996667],[33.811324,46.203796],[33.7968936,46.2030156],[33.7726027,46.1976249],[33.7503231,46.18772],[33.7399776,46.1852474],[33.6995994,46.2028553],[33.6892658,46.2047794],[33.670864,46.2117939],[33.6661371,46.2207141],[33.6467708,46.22958],[33.6152408,46.2262179],[33.6177993,46.215981],[33.6135506,46.2139172],[33.6185932,46.213932],[33.6355706,46.1463365],[33.6412746,46.1424429],[33.6147111,46.1346624],[33.5870932,46.1191796],[33.5721329,46.1025643],[33.5911874,46.0612472],[33.5407189,46.0120312],[32.7727018,45.8266419],[32.7396744,45.8073204],[32.7259238,45.7972779],[32.7026395,45.7764183],[32.6659033,45.7625368],[32.6339252,45.7459969],[32.6054729,45.7265666],[32.5890615,45.7123247],[32.5685226,45.7063996],[32.5336146,45.6930389],[32.5016366,45.6764785],[32.4779329,45.660501],[32.4354921,45.6517736],[32.39936,45.6400966],[32.3822327,45.6329918],[32.3502547,45.6164136],[32.3218024,45.5969383],[32.2974057,45.5749258],[32.2868735,45.5630938],[32.2775192,45.5507836],[32.2643049,45.5283722],[32.2405042,45.5038633],[32.2230173,45.4787954],[32.2105624,45.4522796],[32.2062983,45.4386318],[32.2017961,45.4108733],[32.201579,45.396892]]]}'),
(2, 'DISPUTED', 'SEVASTOPOL', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[33.3779569,44.5838462],[33.3930152,44.5681987],[33.3996503,44.5643423],[33.4016594,44.5610614],[33.4004612,44.5592715],[33.4071732,44.5565894],[33.4100748,44.5535486],[33.414671,44.5526219],[33.4163465,44.5493377],[33.4274077,44.5457891],[33.4284008,44.543313],[33.4350539,44.5419983],[33.4348217,44.5409146],[33.4497224,44.5320144],[33.4573813,44.5290313],[33.464198,44.5233092],[33.4788113,44.5192613],[33.4788555,44.5174026],[33.4814623,44.5157171],[33.4897719,44.5122984],[33.4927974,44.5125433],[33.4930381,44.5174183],[33.4889039,44.5249823],[33.5078625,44.5311455],[33.5264968,44.5459033],[33.5395687,44.539262],[33.542912,44.5395173],[33.5372403,44.5484954],[33.5389717,44.5502823],[33.5485239,44.554409],[33.5500686,44.5525636],[33.5478351,44.5516093],[33.5487427,44.5497441],[33.5539774,44.5515491],[33.562927,44.5488265],[33.5684734,44.5559147],[33.5608581,44.55859],[33.563492,44.5617802],[33.5728005,44.5610282],[33.5747846,44.5592686],[33.5792988,44.5620965],[33.5702383,44.5724854],[33.578923,44.5730758],[33.5847547,44.5754084],[33.5895307,44.5805367],[33.5923472,44.5877529],[33.5923331,44.5924807],[33.5842788,44.5996505],[33.576377,44.6033141],[33.5738875,44.606603],[33.5673845,44.6074099],[33.5672286,44.6088974],[33.5706902,44.6149581],[33.5828279,44.6132154],[33.5835438,44.6150882],[33.5782058,44.6192201],[33.5859866,44.6374677],[33.5960725,44.6407591],[33.6034952,44.651651],[33.5993199,44.6632008],[33.6103428,44.6726833],[33.5991785,44.6709085],[33.5935735,44.67909],[33.5975627,44.6990734],[33.5945586,44.7071473],[33.5873092,44.7054915],[33.5868975,44.7004837],[33.5518827,44.711301],[33.5560938,44.7201787],[33.5554076,44.7221413],[33.5466985,44.7220158],[33.5474959,44.6897199],[33.5424577,44.6576964],[33.5313548,44.6400224],[33.5168858,44.636586],[33.5105038,44.6309138],[33.5075866,44.6209989],[33.5047582,44.6165579],[33.5013126,44.6151564],[33.5019782,44.6118966],[33.4973069,44.6098852],[33.5001394,44.6082374],[33.5007351,44.603576],[33.4993233,44.6074879],[33.4978317,44.607504],[33.4957525,44.6109471],[33.4981029,44.6121538],[33.4952779,44.6148727],[33.4864865,44.612926],[33.4843169,44.6092739],[33.4812423,44.6085388],[33.4805395,44.6110345],[33.4739853,44.6119977],[33.4730492,44.6057619],[33.4706817,44.6050402],[33.4746431,44.6017974],[33.4707787,44.6005913],[33.4714544,44.5926046],[33.4684703,44.5946123],[33.4680171,44.6001056],[33.4662354,44.6009409],[33.4662572,44.6065902],[33.468789,44.6078146],[33.4681762,44.6119631],[33.4636229,44.6117513],[33.4602628,44.6093012],[33.4571182,44.6105217],[33.4482092,44.6078374],[33.4475432,44.6041441],[33.4498455,44.6016442],[33.4468175,44.5979061],[33.4481208,44.5973543],[33.4476833,44.5948093],[33.4441644,44.5987997],[33.4404307,44.599419],[33.4413997,44.6015135],[33.4400636,44.605054],[33.4339409,44.6038632],[33.4313517,44.5969346],[33.4262966,44.5989669],[33.4198732,44.5924681],[33.4241188,44.5947288],[33.4264939,44.5934479],[33.4248662,44.581237],[33.4314365,44.574999],[33.4359306,44.5745808],[33.4376948,44.572334],[33.4353869,44.571057],[33.4344226,44.5719787],[33.4366416,44.5730618],[33.4356493,44.573903],[33.4267301,44.5733978],[33.428097,44.5756042],[33.419624,44.5838806],[33.4191592,44.5871545],[33.4170871,44.5878755],[33.4168157,44.5928239],[33.4161384,44.587998],[33.4136207,44.5857566],[33.412809,44.5782986],[33.4143867,44.5766282],[33.4119291,44.572169],[33.4136588,44.5699718],[33.4122288,44.564404],[33.4110539,44.5650361],[33.4098393,44.5712544],[33.4107359,44.575972],[33.4094392,44.5779911],[33.4065798,44.5767197],[33.4024217,44.5708259],[33.4043875,44.5825173],[33.4024193,44.5834106],[33.4030967,44.5911368],[33.3984799,44.5914294],[33.395001,44.5875713],[33.383653,44.5863156],[33.3779569,44.5838462]]]}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_field`
--

CREATE TABLE `b_location_field` (
  `LOCATION_ID` int NOT NULL,
  `TYPE` int NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_hierarchy`
--

CREATE TABLE `b_location_hierarchy` (
  `ANCESTOR_ID` int NOT NULL,
  `DESCENDANT_ID` int NOT NULL,
  `LEVEL` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_name`
--

CREATE TABLE `b_location_name` (
  `LOCATION_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME_NORMALIZED` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_source`
--

CREATE TABLE `b_location_source` (
  `CODE` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONFIG` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_location_source`
--

INSERT INTO `b_location_source` (`CODE`, `NAME`, `CONFIG`) VALUES
('GOOGLE', 'Google', 'a:4:{i:0;a:4:{s:4:\"code\";s:16:\"API_KEY_FRONTEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:10;s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"code\";s:15:\"API_KEY_BACKEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:20;s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"code\";s:18:\"SHOW_PHOTOS_ON_MAP\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:30;s:5:\"value\";b:1;}i:3;a:4:{s:4:\"code\";s:21:\"USE_GEOCODING_SERVICE\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:40;s:5:\"value\";b:1;}}'),
('OSM', 'OpenStreetMap', 'a:3:{i:0;a:5:{s:4:\"code\";s:11:\"SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:10;s:5:\"value\";s:30:\"https://osm-ru-002.bitrix.info\";}i:1;a:5:{s:4:\"code\";s:15:\"MAP_SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:15;s:5:\"value\";s:30:\"https://osm-ru-001.bitrix.info\";}i:2;a:5:{s:4:\"code\";s:5:\"TOKEN\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:0;s:4:\"sort\";i:20;s:5:\"value\";N;}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification`
--

CREATE TABLE `b_log_notification` (
  `ID` int UNSIGNED NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int DEFAULT NULL,
  `ALERT_COUNT` int DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification_action`
--

CREATE TABLE `b_log_notification_action` (
  `ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_blacklist`
--

CREATE TABLE `b_main_mail_blacklist` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender`
--

CREATE TABLE `b_main_mail_sender` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `IS_CONFIRMED` tinyint NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint NOT NULL DEFAULT '0',
  `OPTIONS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender_send_counter`
--

CREATE TABLE `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CNT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE `b_medialib_collection` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int DEFAULT NULL,
  `ML_TYPE` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE `b_medialib_item` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE `b_medialib_type` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_incoming_message`
--

CREATE TABLE `b_messageservice_incoming_message` (
  `ID` int NOT NULL,
  `REQUEST_BODY` longtext COLLATE utf8mb3_unicode_ci,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_message`
--

CREATE TABLE `b_messageservice_message` (
  `ID` int NOT NULL,
  `TYPE` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AUTHOR_ID` int NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8mb3_unicode_ci,
  `MESSAGE_BODY` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STATUS_ID` int NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CLUSTER_GROUP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_rest_app`
--

CREATE TABLE `b_messageservice_rest_app` (
  `ID` int NOT NULL,
  `APP_ID` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_rest_app_lang`
--

CREATE TABLE `b_messageservice_rest_app_lang` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_mobileapp_app`
--

CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_mobileapp_config`
--

CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('b24connector', NULL),
('bitrix.sitecorporate', NULL),
('bitrix.siteinfoportal', NULL),
('bitrix.sitepersonal', NULL),
('bitrixcloud', NULL),
('blog', NULL),
('clouds', NULL),
('fileman', NULL),
('form', NULL),
('forum', NULL),
('highloadblock', NULL),
('iblock', NULL),
('landing', NULL),
('location', NULL),
('main', NULL),
('messageservice', NULL),
('mobileapp', NULL),
('perfmon', NULL),
('photogallery', NULL),
('rest', NULL),
('scale', NULL),
('search', NULL),
('security', NULL),
('seo', NULL),
('socialservices', NULL),
('subscribe', NULL),
('translate', NULL),
('ui', NULL),
('vote', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE `b_module_group` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GROUP_ID` int NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_module_group`
--

INSERT INTO `b_module_group` (`ID`, `MODULE_ID`, `GROUP_ID`, `G_ACCESS`, `SITE_ID`) VALUES
(1, 'blog', 1, 'W', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE `b_module_to_module` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VERSION` int DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
(23, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
(24, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
(25, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
(26, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
(27, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
(28, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(29, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(30, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
(31, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
(32, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
(33, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
(34, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
(35, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
(36, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
(37, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
(38, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
(39, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(40, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
(41, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
(42, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
(43, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
(44, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
(45, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
(46, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
(47, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
(48, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
(49, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
(50, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(51, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
(52, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
(53, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
(54, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
(55, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
(56, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
(57, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
(58, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
(59, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
(60, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
(61, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
(62, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
(63, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
(64, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
(65, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
(66, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
(67, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '37b1b1538fa6a6c5f41c9ce4afbf2789'),
(68, NULL, 100, 'main', 'OnAfterUserTypeUpdate', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '6a53bbd6e85686f4aa8a69d3d75f7e37'),
(69, NULL, 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '010cc1e3107418a1fd9f9a4cde7d93b9'),
(70, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
(71, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
(72, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
(73, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1, '7ffb3da30f1bec7fe0c7456a8ec3b8d7'),
(74, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1, '5a8bf3ea4b17f8d011b8f398c05ac89b'),
(75, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
(76, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
(77, NULL, 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1, '6c23ebfcdfc99d14541ad083b0ee7430'),
(78, NULL, 100, 'main', 'OnUserDelete', 'blog', '', '\\Bitrix\\Blog\\BlogUser', 'onUserDelete', '', 1, '470dc0caadb6eee3cf6bd32a89d2aa38'),
(79, NULL, 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1, '33b1b3449b56990b745b251f3976521d'),
(80, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1, '4fa06723b7108652d8f6846f17c4bfda'),
(81, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '5e642b195637a47eda278a2f769d72ae'),
(82, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '94116bd773c35830e32cabd264e1deac'),
(83, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsAdd', '', 1, 'ef99702762ccf8958b3bd05a0bc2bd21'),
(84, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '7e78a43487928787ac0665eb1eade0d5'),
(85, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsUpdate', '', 1, '13116dc44040b680c93a2b7f60ff2845'),
(86, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '06ae1cde11216c73393f8720c0f31ea9'),
(87, NULL, 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1, '6dd70a97fa5c2f15e619721007813bd0'),
(88, NULL, 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1, 'a2f4b906bc5e1e984c28ef37728d7007'),
(89, NULL, 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1, '4461c77de3ca9dec12cd66c9554555a0'),
(90, NULL, 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1, '6708964800c60ed28bb3ac095494d0f8'),
(91, NULL, 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1, '29df09132203259924e883921fed0971'),
(92, NULL, 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1, 'a47b921e59710bdca16e2284d11e8aa0'),
(93, NULL, 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1, 'cd6910b2ee2dd66f257a68a6406b9f79'),
(94, NULL, 100, 'im', 'OnAnswerNotify', 'blog', '', 'CBlogNotifySchema', 'CBlogEventsIMCallback', '', 1, '890d3be770eab6025cc54e120d3b51f5'),
(95, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1, 'bfd07861166a9d51c1d21d18b291a1dc'),
(96, NULL, 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'e5df84e19828b3b95901e7b2a5d55cb1'),
(97, NULL, 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '75028a7a2551f7c677c09c367ed1a54c'),
(98, NULL, 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1, 'a3b637f0c0945089c95d5c08e1166938'),
(99, NULL, 100, 'mail', 'onReplyReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleReplyReceivedBlogPost', '', 2, '5e3d8ad3f14c5b994981074e43a02cd7'),
(100, NULL, 100, 'mail', 'onForwardReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleForwardReceivedBlogPost', '', 2, '6002badd4ffa13790a43d45c5c29fca3'),
(101, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '3fba13b74a731f896448388c082c24a4'),
(102, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, '57ce8e76c004b1447554d8ec64c48783'),
(103, NULL, 100, 'socialnetwork', 'onContentViewed', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, 'd33a4b2ae579a2c9b5ddcea17bc62806'),
(104, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
(105, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
(106, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
(107, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
(108, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
(109, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
(110, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
(111, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
(112, NULL, 100, 'main', 'OnPhysicalFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, '3151c487c747a57d7817f68e97fd1c94'),
(113, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
(114, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
(115, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
(116, NULL, 100, 'main', 'OnAfterFileDeleteDuplicate', 'clouds', '', 'CCloudStorage', 'OnAfterFileDeleteDuplicate', '', 1, 'c5f3eb3991b50d4f80c2ccbdc94f8656'),
(117, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
(118, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
(119, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
(120, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
(121, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
(122, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
(123, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
(124, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
(125, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_S3', 'GetObjectInstance', '', 1, '4af3f0ba1f50ed9be6efcdb55dfbee4e'),
(126, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
(127, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
(128, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
(129, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
(130, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
(131, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
(132, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
(133, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
(134, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
(135, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
(136, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
(137, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
(138, NULL, 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1, '182217f1803d20e2899086e379ada21c'),
(139, NULL, 100, 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', 1, '18ca0a9757a229b6290603235dfff0d1'),
(140, NULL, 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1, '63f10ce39f269a9f1add6a0600aa05b9'),
(141, NULL, 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1, '201c2a343960654a90382521e253328f'),
(142, NULL, 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1, 'a00aa95408b2665018cb63e21cef4684'),
(143, NULL, 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1, '3fe2c3077963069fee2360611d840816'),
(144, NULL, 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1, 'eb0cb7958d708be629eba740bcabd8c4'),
(145, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1, 'd5b04b52654500981293dbcf10ca1ef9'),
(146, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1, '929cf569dd703b922e4a96a0a023f120'),
(147, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1, '30a759001702af8052ea65e700c519c7'),
(148, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1, '78ecc0524ac5d4fb0545c8a3fa28b3bd'),
(149, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1, '94cfb4cf5460746b7b31a5b93a3805f6'),
(150, NULL, 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1, '28c7a91a467c1190a064f597487abd5c'),
(151, NULL, 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1, 'e42fc61795fed0c5f397259bb6f1f6b9'),
(152, NULL, 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1, 'db966e6ee1f8b98f83e57411f4757858'),
(153, NULL, 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1, 'f5f6a93c1fe6d7dc61fbb5bf25f9965f'),
(154, NULL, 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1, '84556c2f1f7f23189f90603f45ad3942'),
(155, NULL, 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1, '7ead6be47d7bb2e297a2af57f85dc7ee'),
(156, NULL, 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1, '99f4b68c8e6c1598377e0016b31234bb'),
(157, NULL, 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1, '5ef51ecf36931b3a32f4fea00dc49c8c'),
(158, NULL, 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1, 'ad425ff862192078c050ea34d60f8d63'),
(159, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1, '205fd3e33648d7e1ed6f4b7f0298f603'),
(160, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'forum', '', 'CForumRestService', 'OnRestServiceBuildDescription', '', 1, '506b2a93cea64d73c9e7c187fdde2840'),
(161, NULL, 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'fa69bf6ff10a0fb9b2e91098f0c0bab3'),
(162, NULL, 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '9eb2b6d8edde63385655c1001d9e0c31'),
(163, NULL, 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1, 'ea61a319e93c2c3a9bfc9a63840b2155'),
(164, NULL, 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1, '3cc5f27501dad77acdecb1c8a4e978de'),
(165, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '909a8b84bf80774a6a89bfbbd2258ce8'),
(166, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, 'e6aaa86c7daeae2bc002e513f06ccffa'),
(167, NULL, 100, 'socialnetwork', 'onContentViewed', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, '5db6b373f6612f36c2ff6783dd4d6154'),
(168, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
(169, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
(170, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
(171, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
(172, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
(173, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
(174, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
(175, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
(176, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
(177, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
(178, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
(179, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
(180, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
(181, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
(182, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
(183, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
(184, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
(185, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
(186, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
(187, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
(188, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
(189, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
(190, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
(191, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
(192, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
(193, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
(194, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
(195, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
(196, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
(197, NULL, 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
(198, NULL, 100, 'ai', 'onTuningLoad', 'landing', '', '\\Bitrix\\Landing\\Connector\\Ai', 'onTuningLoad', '', 2, '64d7f5f3d8a372fb0d441d82a49f369b'),
(199, NULL, 100, 'ai', 'onBeforeCompletions', 'landing', '', '\\Bitrix\\Landing\\Connector\\Ai', 'onBeforeCompletions', '', 2, '9192985f1e2da4ddd7a3328eb95a975e'),
(200, NULL, 100, 'crm', 'onAfterCrmCompanyAdd', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '7e8fed841380d8075d45525f328e8940'),
(201, NULL, 100, 'crm', 'onAfterCrmCompanyUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '688027a0f389137b02ac0a834f0a8495'),
(202, NULL, 100, 'iblock', 'onAfterIBlockSectionDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\Iblock', 'onAfterIBlockSectionDelete', '', 2, 'ffe8a984ae7ff50064ac74e788a80118'),
(203, NULL, 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
(204, NULL, 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
(205, NULL, 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
(206, NULL, 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
(207, NULL, 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
(208, NULL, 100, 'main', 'OnAfterFileDeleteDuplicate', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\DuplicateImages', 'onAfterFileDeleteDuplicate', '', 2, 'b80f7597db6200591a0e0e41c14e0ee0'),
(209, NULL, 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
(210, NULL, 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
(211, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
(212, NULL, 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
(213, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
(214, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
(215, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
(216, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
(217, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
(218, NULL, 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
(219, NULL, 100, 'seo', 'onExtensionInstall', 'landing', '', '\\Bitrix\\Landing\\Hook\\Page\\PixelFb', 'changeBusinessPixel', '', 2, '27bf01f04349ff82ede423de62df5384'),
(220, NULL, 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
(221, NULL, 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
(222, NULL, 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
(223, NULL, 100, 'socialnetwork', 'onSocNetFeaturesUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetFeaturesUpdate', '', 2, 'd385df085957d9e418b63017d75630fe'),
(224, NULL, 100, 'ui', 'onUIFormInitialize', 'location', '', '\\Bitrix\\Location\\Infrastructure\\EventHandler', 'onUIFormInitialize', '', 2, '462272192a150e16b28f1e1bd33ed62b'),
(225, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
(226, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
(227, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
(228, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
(229, NULL, 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1, '4833278dbe60d476fbccbaa54545cffa'),
(230, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
(231, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1, 'dc9ea0b8411dfa54929a022d44bc5b1a'),
(232, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1, '7fc7f3cc71ad3188022388365d446ed2'),
(233, NULL, 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1, '06e2330d56c3b972e67707d665383704'),
(234, NULL, 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1, '7ca75249042a033e858d90dc2473adac'),
(235, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'photogallery', '', '\\Bitrix\\Photogallery\\Integration\\Socialnetwork\\Group', 'onSocNetGroupDelete', '', 1, 'bded61c39d768685fa7dd112c63c702b'),
(236, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
(237, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
(238, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
(239, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
(240, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
(241, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
(242, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
(243, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
(244, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
(245, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
(246, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
(247, NULL, 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
(248, NULL, 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
(249, NULL, 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
(250, NULL, 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
(251, NULL, 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
(252, NULL, 100, 'main', 'OnAfterSetOption_~mp24_paid_date', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\Client', 'onChangeSubscriptionDate', '', 2, 'b6ab5bafe2befd82726761f5a8b38a0b'),
(253, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
(254, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
(255, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
(256, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, '900fb8bbf0d59d1924bedae5da1b6eb1'),
(257, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, 'e97e569fe3fc7775aa4ece09cdf209bc'),
(258, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterRegisterModule', '', 2, '80afec537db1eeda99462f0676dbb835'),
(259, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterUnRegisterModule', '', 2, 'fe9cb5af7e8ca277ca29b4a5423bd08b'),
(260, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1, 'd8192b7113f1652bdf8a37bcd4e38dea'),
(261, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
(262, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
(263, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
(264, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
(265, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
(266, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
(267, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
(268, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
(269, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
(270, NULL, 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1, '450a1c7509f5363a9bf7d1472f22f9cf'),
(271, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1, '893bc94df887141b4f3579561ea37454'),
(272, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1, '9ba919b0537aa25fe47e438c2428b4d9'),
(273, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1, 'c751923f396ccc4e102ed17e97cb8afb'),
(274, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1, '0c7cea553d58a72f7c5521d282898bc7'),
(275, NULL, 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1, 'bb70fedd18267b1c5290068ae80dbc4d'),
(276, NULL, 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1, 'd1886589ecd51b020420e6c1415edeaf'),
(277, NULL, 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1, '2dbeb7fa7a8bec4d90e8940616976b3d'),
(278, NULL, 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1, '099871646b4df8c1263e26f9bd91f3bd'),
(279, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
(280, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
(281, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
(282, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
(283, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
(284, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2, '148ce014df9dd9f99f17ebfc5d766e8a'),
(285, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2, '4b1e9896d9f0aa37a7039a321f25f9a5'),
(286, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2, 'b699c1c0d6665f9cffe7ff76ab108a24'),
(287, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2, 'ff3a36654015c53890f4cf2204b030c4'),
(288, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2, 'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
(289, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2, 'a1022e0619263c0e91139fb3f9837085'),
(290, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2, '27930cffcd40b84666d0a22e1a953c41'),
(291, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2, 'f0151e07363564774d45acba4100aebe'),
(292, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2, 'd4d54756116942c9ee0bda9b31e9d0e7'),
(293, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2, '3e0a8569016a4c941f3eb4aa9fca6e8b'),
(294, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2, '7f4379c818231561b41589d3de41e36b'),
(295, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
(296, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
(297, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
(298, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
(299, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
(300, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
(301, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
(302, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
(303, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
(304, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
(305, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
(306, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
(307, NULL, 100, 'bitrix24', 'onDomainChange', 'seo', '', '\\Bitrix\\Seo\\Service', 'changeRegisteredDomain', '', 2, 'fcb2dadb8b7ff1863c0ad86320e9e521'),
(308, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
(309, NULL, 100, 'main', 'OnAfterUserLogout', 'socialservices', '', 'CSocServEventHandlers', 'OnUserLogout', '', 1, '7e4c40a3ff7cd102879cef10653f97ac'),
(310, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
(311, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
(312, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
(313, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
(314, NULL, 100, 'perfmon', 'OnGetTableSchema', 'socialservices', '', 'socialservices', 'OnGetTableSchema', '', 1, '56107bf1a0dcee0db660c0ec27c31c6c'),
(315, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
(316, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6');
INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
(317, NULL, 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1, 'ee539731a3e52fe65cb52596ce0856d2'),
(318, NULL, 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1, '88c6e57a6f0f18341332db1879c0005b'),
(319, NULL, 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1, 'f4fa3b156b00fb4415c8612f8439f278'),
(320, NULL, 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1, '990d63845f75e93e670ed85f1aa15152'),
(321, NULL, 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1, '8a1cffe1bd46a72108e48656a1bae99b'),
(322, NULL, 100, 'perfmon', 'OnGetTableSchema', 'subscribe', '', 'subscribe', 'OnGetTableSchema', '', 1, '320b1fb657ce46ad23992d00b2f54916'),
(323, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', '\\Bitrix\\Translate\\Ui\\Panel', 'onPanelCreate', '', 1, '88ecb95eac2e28b80f234bfc8c1cd597'),
(324, NULL, 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
(327, NULL, 100, 'main', 'OnUserDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Main\\User', 'onDelete', '', 2, '5e748ff204d0dac471be127b136eeb1d'),
(328, NULL, 100, 'main', 'OnFileDelete', 'ui', '', '\\Bitrix\\UI\\Avatar\\Mask\\Item', 'onFileDelete', '', 2, 'bdf678d45b7e9f3ce906099a5e4fc975'),
(329, NULL, 100, 'rest', 'onRestAppDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'onRestAppDelete', '', 2, 'b213605cfa38675d5e4b60f257f6acce'),
(330, NULL, 100, 'rest', 'OnRestAppInstall', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'OnRestAppInstall', '', 2, '206ce4eafe25cc4b5fbaddfa36eaba47'),
(331, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifest', '', 2, 'daad84620a1a84daef4884f1162e2099'),
(332, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifestSetting', '', 2, 'b3290d964ad532e24a892bae6001146c'),
(333, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationExport', '', 2, 'ac9b60f1d69d98c3980413800a3524f7'),
(334, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationEntity', '', 2, '8d609b415b9bfa097d137ab69ba6903f'),
(335, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationImport', '', 2, 'b1a5ce1bd868f8c86462c5b60eec1307'),
(336, NULL, 10, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1, '251d4d100c1545ca5847d8d6d626dea9'),
(337, NULL, 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'Bitrix\\Vote\\Uf\\VoteUserType', 'getUserTypeDescription', '', 1, 'e30dd2d26df22ce2dcffef84256cf160'),
(338, NULL, 200, 'main', 'OnUserLogin', 'vote', '', 'Bitrix\\Vote\\User', 'onUserLogin', '', 1, '5047b245af7aede3f2474b40dfbc65be'),
(339, NULL, 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1, '97ffe9642e64dc7d68f9ec9bc789be47'),
(340, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator`
--

CREATE TABLE `b_numerator` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8mb3_unicode_ci,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator_sequence`
--

CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int NOT NULL DEFAULT '0',
  `KEY` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int DEFAULT NULL,
  `LAST_INVOCATION_TIME` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE `b_operation` (
  `ID` int NOT NULL,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(38, 'clouds_browse', 'clouds', NULL, 'module'),
(39, 'clouds_upload', 'clouds', NULL, 'module'),
(40, 'clouds_config', 'clouds', NULL, 'module'),
(41, 'fileman_view_all_settings', 'fileman', '', 'module'),
(42, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(43, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(44, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(45, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(46, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(47, 'fileman_admin_files', 'fileman', '', 'module'),
(48, 'fileman_admin_folders', 'fileman', '', 'module'),
(49, 'fileman_view_permissions', 'fileman', '', 'module'),
(50, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(51, 'fileman_upload_files', 'fileman', '', 'module'),
(52, 'fileman_view_file_structure', 'fileman', '', 'module'),
(53, 'fileman_install_control', 'fileman', '', 'module'),
(54, 'medialib_view_collection', 'fileman', '', 'medialib'),
(55, 'medialib_new_collection', 'fileman', '', 'medialib'),
(56, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(57, 'medialib_del_collection', 'fileman', '', 'medialib'),
(58, 'medialib_access', 'fileman', '', 'medialib'),
(59, 'medialib_new_item', 'fileman', '', 'medialib'),
(60, 'medialib_edit_item', 'fileman', '', 'medialib'),
(61, 'medialib_del_item', 'fileman', '', 'medialib'),
(62, 'sticker_view', 'fileman', '', 'stickers'),
(63, 'sticker_edit', 'fileman', '', 'stickers'),
(64, 'sticker_new', 'fileman', '', 'stickers'),
(65, 'sticker_del', 'fileman', '', 'stickers'),
(66, 'hl_element_read', 'highloadblock', NULL, 'module'),
(67, 'hl_element_write', 'highloadblock', NULL, 'module'),
(68, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(69, 'section_read', 'iblock', NULL, 'iblock'),
(70, 'element_read', 'iblock', NULL, 'iblock'),
(71, 'section_element_bind', 'iblock', NULL, 'iblock'),
(72, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(73, 'element_edit', 'iblock', NULL, 'iblock'),
(74, 'element_edit_price', 'iblock', NULL, 'iblock'),
(75, 'element_delete', 'iblock', NULL, 'iblock'),
(76, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(77, 'section_edit', 'iblock', NULL, 'iblock'),
(78, 'section_delete', 'iblock', NULL, 'iblock'),
(79, 'section_section_bind', 'iblock', NULL, 'iblock'),
(80, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(81, 'iblock_edit', 'iblock', NULL, 'iblock'),
(82, 'iblock_delete', 'iblock', NULL, 'iblock'),
(83, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(84, 'iblock_export', 'iblock', NULL, 'iblock'),
(85, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(86, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'landing_read', 'landing', NULL, 'module'),
(88, 'landing_edit', 'landing', NULL, 'module'),
(89, 'landing_sett', 'landing', NULL, 'module'),
(90, 'landing_public', 'landing', NULL, 'module'),
(91, 'landing_delete', 'landing', NULL, 'module'),
(92, 'security_filter_bypass', 'security', NULL, 'module'),
(93, 'security_edit_user_otp', 'security', NULL, 'module'),
(94, 'security_module_settings_read', 'security', NULL, 'module'),
(95, 'security_panel_view', 'security', NULL, 'module'),
(96, 'security_filter_settings_read', 'security', NULL, 'module'),
(97, 'security_otp_settings_read', 'security', NULL, 'module'),
(98, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
(99, 'security_session_settings_read', 'security', NULL, 'module'),
(100, 'security_redirect_settings_read', 'security', NULL, 'module'),
(101, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
(102, 'security_iprule_settings_read', 'security', NULL, 'module'),
(103, 'security_antivirus_settings_read', 'security', NULL, 'module'),
(104, 'security_frame_settings_read', 'security', NULL, 'module'),
(105, 'security_module_settings_write', 'security', NULL, 'module'),
(106, 'security_filter_settings_write', 'security', NULL, 'module'),
(107, 'security_otp_settings_write', 'security', NULL, 'module'),
(108, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
(109, 'security_session_settings_write', 'security', NULL, 'module'),
(110, 'security_redirect_settings_write', 'security', NULL, 'module'),
(111, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
(112, 'security_iprule_settings_write', 'security', NULL, 'module'),
(113, 'security_file_verifier_sign', 'security', NULL, 'module'),
(114, 'security_file_verifier_collect', 'security', NULL, 'module'),
(115, 'security_file_verifier_verify', 'security', NULL, 'module'),
(116, 'security_antivirus_settings_write', 'security', NULL, 'module'),
(117, 'security_frame_settings_write', 'security', NULL, 'module'),
(118, 'seo_settings', 'seo', '', 'module'),
(119, 'seo_tools', 'seo', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8mb3_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('blog', 'allow_alias', 'Y', NULL, NULL),
('blog', 'allow_html', 'Y', NULL, NULL),
('blog', 'avatar_max_height', '100', NULL, NULL),
('blog', 'avatar_max_size', '30000', NULL, NULL),
('blog', 'avatar_max_width', '100', NULL, NULL),
('blog', 'block_url_change', 'Y', NULL, NULL),
('blog', 'enable_trackback', 'N', NULL, NULL),
('blog', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('blog', 'image_max_height', '600', NULL, NULL),
('blog', 'image_max_width', '600', NULL, NULL),
('blog', 'show_ip', 'N', NULL, NULL),
('blog', 'socNetNewPerms', 'Y', NULL, NULL),
('fileman', 'different_set', 'Y', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('forum', 'FILTER', 'N', NULL, NULL),
('iblock', 'use_htmledit', 'Y', NULL, NULL),
('landing', 'pub_path_s1', '/lp/', NULL, NULL),
('location', 'address_format_code', 'RU', NULL, NULL),
('main', '~crypto_b_socialservices_user', 'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_auth_code', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~new_license18_0_sign', 'Y', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'admin_passwordh', 'FVkQeWYUBwUtCUVcBBcBCgsTAQ==', NULL, NULL),
('main', 'control_file_duplicates', 'Y', NULL, NULL),
('main', 'email_from', 'trashmail2002@yandex.ru', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'new_user_registration', 'N', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'secure_logout', 'Y', NULL, NULL),
('main', 'server_uniq_id', 'R', NULL, NULL),
('main', 'signer_default_key', '61037724a2fb00a12fa8a53ada233f54ff7fc6ee02048e579b83a127ce79fc03906c35b5307beb18a3cf5021fe031ae6587448d4d60a082d73252fe2e2f4ae7f', NULL, NULL),
('main', 'site_copyright', 'Владелец сайта', NULL, NULL),
('main', 'site_personal_name', 'Название сайта', NULL, NULL),
('main', 'smile_gallery_id', '1', NULL, NULL),
('main', 'smile_last_update', '1697524436', NULL, NULL),
('main', 'update_site', 'www.1c-bitrix.ru', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'wizard_firstdemo_personal_s1', 'Y', NULL, NULL),
('main', 'wizard_minimal_theme_id', 'black', NULL, NULL),
('messageservice', 'clean_up_period', '14', NULL, NULL),
('photogallery', '~uniq_ajax_id', '0e082d8a84aba4e36fb01cb24ff51457', NULL, NULL),
('photogallery', 'UF_GALLERY_SIZE', 'a:1:{i:1;a:7:{s:6:\"status\";s:4:\"done\";s:4:\"step\";i:1;s:12:\"elements_cnt\";i:13;s:14:\"element_number\";i:13;s:10:\"element_id\";s:0:\"\";s:2:\"id\";s:6:\"123456\";s:4:\"date\";s:0:\"\";}}', NULL, NULL),
('rest', 'app_immune', '[\"infoservice.migrator_amocrm\",\"informunity.excel\",\"integrations24ru.pipedrive\",\"integrations24ru.asana\",\"integrations24ru.sugar\",\"bitrix.eshop\",\"bitrix.1cdoc\",\"bitrix.assistant\",\"bitrix.denominationby\",\"bitrix.propertiesbot\",\"bitrix.giphybot\",\"bitrix.1c\",\"bitrix.restapi\",\"bitrix.partnerlandingexport\",\"bitrix.partnerapplication\",\"bitrix.partnerlanding\",\"bitrix.1ctotal\",\"integrations24.pipedrive\",\"integrations24ru.pipedrive\",\"integrations24.zoho\",\"integrations24.asana\",\"integrations24ru.asana\",\"integrations24.sugar\",\"integrations24ru.sugar\",\"integrations24.jira_migration\",\"integrations24.qbinventory\",\"integrations24.zohoinventory\",\"integrations24.trello\",\"integrations24ru.slack_migration\",\"SEVERCODE.trello_migrator\",\"htmls.ms_migrator\",\"integrations24.mns_kazakhstan_poisk_po_bin\",\"integrations24.portal_nalog_gov_by\",\"integrations24ru.microsoft_teams_migration\",\"bitrix.pbi_all\",\"bitrix.pbi_company\",\"bitrix.pbi_company_uf\",\"bitrix.pbi_contact\",\"bitrix.pbi_contact_uf\",\"bitrix.pbi_crm_activity\",\"bitrix.pbi_deal_product_row\",\"bitrix.pbi_deal_stage_history\",\"bitrix.pbi_deals_ru\",\"bitrix.pbi_lead\",\"bitrix.pbi_lead_product_row\",\"bitrix.pbi_lead_uf\",\"bitrix.pbi_leads_ru\",\"bitrix.pbi_socialnetwork_group\",\"bitrix.pbi_telephony\",\"bitrix.pbi_user\",\"bitrix.gds_all\",\"bitrix.gds_company\",\"bitrix.gds_company_uf\",\"bitrix.gds_contact\",\"bitrix.gds_contact_uf\",\"bitrix.gds_crm_activity\",\"bitrix.gds_deal_product_row\",\"bitrix.gds_deal_stage_history\",\"bitrix.gds_deals_ru\",\"bitrix.gds_lead\",\"bitrix.gds_lead_product_row\",\"bitrix.gds_lead_uf\",\"bitrix.gds_leads_ru\",\"bitrix.gds_socialnetwork_group\",\"bitrix.gds_telephony\",\"bitrix.gds_user\",\"bitrix.gds_activity\",\"bitrix.gds_deal_uf\",\"bitrix.gds_telephony_call\",\"bitrix.khellouin_ru\",\"bitrix.den_zashchitnika_otechestva_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ua\",\"bitrix.den_smekha_ua\",\"bitrix.den_svyatogo_valentina_ua\",\"bitrix.den_vsekh_vlyublyennykh_ua\",\"bitrix.katolicheskaya_paskha_ua\",\"bitrix.novyy_god_ua\",\"bitrix.rozhdestvo_ua\",\"bitrix.valentinov_den_ua\",\"bitrix.pravoslavnaya_paskha_ua\",\"bitrix.chernaya_pyatnitsa_ua\",\"bitrix.khellouin_ua\",\"bitrix.den_zashchitnika_otechestva_3_ru\",\"bitrix.den_zashchitnika_otechestva_ru\",\"bitrix.den_zashchitnika_otechestva_by\",\"bitrix.den_zashchitnika_otechestva_2_by\",\"bitrix.den_zashchitnika_otechestva_3_by\",\"bitrix.den_zashchitnika_otechestva_kz\",\"bitrix.den_zashchitnika_otechestva_2_kz\",\"bitrix.den_zashchitnika_otechestva_3_kz\",\"bitrix.pravoslavnaya_paskha_ru\",\"bitrix.pravoslavnaya_paskha_by\",\"bitrix.pravoslavnaya_paskha_kz\",\"bitrix.den_smekha_ru\",\"bitrix.den_smekha_by\",\"bitrix.den_smekha_kz\",\"bitrix.valentinov_den_ru\",\"bitrix.valentinov_den_by\",\"bitrix.valentinov_den_kz\",\"bitrix.rozhdestvo_ru\",\"bitrix.rozhdestvo_by\",\"bitrix.rozhdestvo_kz\",\"bitrix.novyy_god_ru\",\"bitrix.novyy_god_by\",\"bitrix.novyy_god_kz\",\"bitrix.katolicheskaya_paskha_ru\",\"bitrix.katolicheskaya_paskha_by\",\"bitrix.katolicheskaya_paskha_kz\",\"bitrix.den_vsekh_vlyublyennykh_ru\",\"bitrix.den_vsekh_vlyublyennykh_by\",\"bitrix.den_vsekh_vlyublyennykh_kz\",\"bitrix.den_svyatogo_valentina_ru\",\"bitrix.den_svyatogo_valentina_by\",\"bitrix.den_svyatogo_valentina_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_kz\",\"bitrix.thanksgiving_day_en\",\"bitrix.april_fools_day_en\",\"bitrix.valentine_s_day_en\",\"bitrix.valentine_s_day_2_en\",\"bitrix.valentine_s_day_3_en\",\"bitrix.chernaya_pyatnitsa_ru\",\"bitrix.chernaya_pyatnitsa_by\",\"bitrix.chernaya_pyatnitsa_kz\",\"bitrix.khellouin_by\",\"bitrix.khellouin_kz\",\"bitrix.easter_en\",\"bitrix.halloween_en\",\"bitrix.christmas_en\",\"bitrix.new_year_en\",\"bitrix.black_friday_en\",\"bitrix.kraytvirtualtravel_ru\",\"bitrix.kraytvirtualtravel_by\",\"bitrix.kraytvirtualtravel_kz\",\"bitrix.kraytvirtualtravel_ua\",\"bitrix.kraytnutritionist_ru\",\"bitrix.kraytnutritionist_by\",\"bitrix.delobotcorporatetraining_en\",\"bitrix.delobotblackfriday_en\",\"bitrix.delobotcleaningcompany_en\",\"bitrix.delobotfitness_en\",\"bitrix.delobotfooddelivery_en\",\"bitrix.delobotvisagiste_en\",\"bitrix.delobotpsychologist_en\",\"bitrix.delobotflorist_en\",\"bitrix.delobotdecoration_en\",\"bitrix.delobotcarservice_en\",\"bitrix.kraytagency_en\",\"bitrix.kraytagriculture_en\",\"bitrix.kraytarchitecture_en\",\"bitrix.kraytbusiness_en\",\"bitrix.kraytdelivery_en\",\"bitrix.kraytevents_en\",\"bitrix.kraythalloween_en\",\"bitrix.kraytvetclinic_en\",\"bitrix.kraytmasterforhour_en\",\"bitrix.kraytinstagramcontacts_en\",\"bitrix.kraytinstagramstock_en\",\"bitrix.kraytinstagramtarget_en\",\"bitrix.kraytonlinebabysitter_en\",\"bitrix.kraytpetservice_en\",\"bitrix.kraytsolarenergy_en\",\"bitrix.kraytsportonline_en\",\"bitrix.kraytsummersale_en\",\"bitrix.krayttravelblog_en\",\"bitrix.kraytvebinar_en\",\"bitrix.kraytartificialintelligence_en\",\"bitrix.kraytbakeryproducts_en\",\"bitrix.kraytchildrensschool_en\",\"bitrix.kraytfooddelivery_en\",\"bitrix.kraytfurniture_en\",\"bitrix.kraytvirtualtravel_en\",\"bitrix.kraytyoutubechannel_en\",\"bitrix.kraytknitting_en\",\"bitrix.kraytnutritionist_en\",\"bitrix.kraytnailservice_en\",\"bitrix.kraytmedicine_en\",\"bitrix.kraytprofipage_en\",\"bitrix.kraytsale11_en\",\"bitrix.delobotblackfriday_ua\",\"bitrix.delobotcleaning_ua\",\"bitrix.delobotcorporatetraining_ua\",\"bitrix.delobotfitness_ua\",\"bitrix.delobotfooddelivery_ua\",\"bitrix.delobotvisagiste_ua\",\"bitrix.kraytagency_ua\",\"bitrix.kraytagriculture_ua\",\"bitrix.kraytarchitecture_ua\",\"bitrix.kraytbusiness_ua\",\"bitrix.kraytevents_ua\",\"bitrix.kraythalloween_ua\",\"bitrix.kraytinstagramcontacts_ua\",\"bitrix.kraytinstagramstock_ua\",\"bitrix.kraytinstagramtarget_ua\",\"bitrix.kraytpetservice_ua\",\"bitrix.kraytsolarenergy_ua\",\"bitrix.kraytsummersale_ua\",\"bitrix.krayttravelblog_ua\",\"bitrix.kraytvebinar_ua\",\"bitrix.kraytvetclinic_ua\",\"bitrix.kraytnutritionist_ua\",\"bitrix.kraytnutritionist_kz\",\"bitrix.kraytfurniture_by\",\"bitrix.kraytfurniture_ru\",\"bitrix.kraytfurniture_kz\",\"bitrix.kraytfurniture_ua\",\"bitrix.kraytmedicine_ru\",\"bitrix.kraytmedicine_by\",\"bitrix.kraytmedicine_kz\",\"bitrix.kraytmedicine_ua\",\"bitrix.kraytsale11_ru\",\"bitrix.kraytsale11_by\",\"bitrix.kraytsale11_kz\",\"bitrix.kraytsale11_ua\",\"bitrix.kraytnailservice_ru\",\"bitrix.kraytnailservice_by\",\"bitrix.kraytnailservice_kz\",\"bitrix.kraytnailservice_ua\",\"bitrix.kraytknitting_ru\",\"bitrix.kraytknitting_by\",\"bitrix.kraytknitting_kz\",\"bitrix.kraytknitting_ua\",\"bitrix.kraytfooddelivery_ru\",\"bitrix.kraytfooddelivery_by\",\"bitrix.kraytfooddelivery_kz\",\"bitrix.kraytfooddelivery_ua\",\"bitrix.kraytbakeryproducts_ru\",\"bitrix.kraytbakeryproducts_by\",\"bitrix.kraytbakeryproducts_kz\",\"bitrix.kraytbakeryproducts_ua\",\"bitrix.kraytschoolmusic_ru\",\"bitrix.kraytschoolmusic_by\",\"bitrix.kraytschoolmusic_kz\",\"bitrix.kraytschoolmusic_ua\",\"bitrix.kraytautomechanic_ru\",\"bitrix.kraytautomechanic_by\",\"bitrix.kraytautomechanic_kz\",\"bitrix.kraytautomechanic_ua\",\"bitrix.kraytpresents_ru\",\"bitrix.kraytpresents_by\",\"bitrix.kraytpresents_kz\",\"bitrix.kraytpresents_ua\",\"bitrix.kraytportfoliophotographer_ru\",\"bitrix.kraytportfoliophotographer_by\",\"bitrix.kraytportfoliophotographer_kz\",\"bitrix.kraytportfoliophotographer_ua\",\"bitrix.kraytcrm_ru\",\"bitrix.delobotcleaningcompany_ru\",\"bitrix.delobotblackfriday_ru\",\"bitrix.delobotblackfriday_by\",\"bitrix.delobotblackfriday_kz\",\"bitrix.delobotcleaningcompany_by\",\"bitrix.delobotcleaningcompany_kz\",\"bitrix.delobotcorporatetraining_ru\",\"bitrix.delobotcorporatetraining_by\",\"bitrix.delobotcorporatetraining_kz\",\"bitrix.delobotfitness_ru\",\"bitrix.delobotfitness_by\",\"bitrix.delobotfitness_kz\",\"bitrix.delobotfooddelivery_ru\",\"bitrix.delobotfooddelivery_by\",\"bitrix.delobotfooddelivery_kz\",\"bitrix.delobotvisagiste_ru\",\"bitrix.delobotvisagiste_by\",\"bitrix.delobotvisagiste_kz\",\"bitrix.delobotgiftsforwomensday_ru\",\"bitrix.delobotgiftsforwomensday_by\",\"bitrix.delobotgiftsforwomensday_kz\",\"bitrix.delobotgiftsforwomensday_ua\",\"bitrix.delobotwebdesigner_ru\",\"bitrix.delobotwebdesigner_by\",\"bitrix.delobotwebdesigner_kz\",\"bitrix.delobotwebdesigner_ua\",\"bitrix.delobotatelier_ru\",\"bitrix.delobotatelier_by\",\"bitrix.delobotatelier_kz\",\"bitrix.delobotatelier_ua\",\"bitrix.delobotconstructioncompany_ru\",\"bitrix.delobotconstructioncompany_by\",\"bitrix.delobotconstructioncompany_ua\",\"bitrix.delobotlanguageschool_ru\",\"bitrix.delobotlanguageschool_by\",\"bitrix.delobotlanguageschool_kz\",\"bitrix.delobotlanguageschool_ua\",\"bitrix.delobotcoffee_ru\",\"bitrix.delobotcoffee_by\",\"bitrix.delobotcoffee_kz\",\"bitrix.delobotcoffee_ua\",\"bitrix.kraytcrm_by\",\"bitrix.kraytcrm_kz\",\"bitrix.kraytcrm_ua\",\"bitrix.kraytonlinebabysitter_ru\",\"bitrix.kraytonlinebabysitter_by\",\"bitrix.kraytonlinebabysitter_kz\",\"bitrix.kraytonlinebabysitter_uaa\",\"bitrix.kraytsportonline_ru\",\"bitrix.kraytsportonline_by\",\"bitrix.kraytsportonline_kz\",\"bitrix.kraytsportonline_ua\",\"bitrix.kraytmasterforhour_ru\",\"bitrix.kraytmasterforhour_by\",\"bitrix.kraytmasterforhour_kz\",\"bitrix.kraytmasterforhour_ua\",\"bitrix.kraytdelivery_ru\",\"bitrix.kraytdelivery_by\",\"bitrix.kraytdelivery_kz\",\"bitrix.kraytdelivery_ua\",\"bitrix.kraytrepairservice_ru\",\"bitrix.kraytrepairservice_by\",\"bitrix.kraytrepairservice_kz\",\"bitrix.kraytrepairservice_ua\",\"bitrix.kraytprofipage_ru\",\"bitrix.kraytprofipage_by\",\"bitrix.kraytprofipage_kz\",\"bitrix.kraytprofipage_ua\",\"bitrix.krayttutor_ru\",\"bitrix.krayttutor_by\",\"bitrix.krayttutor_kz\",\"bitrix.krayttutor_ua\",\"bitrix.kraytartificialintelligence_ru\",\"bitrix.kraytartificialintelligence_by\",\"bitrix.kraytartificialintelligence_kz\",\"bitrix.kraytartificialintelligence_ua\",\"bitrix.kraytyoutubechannel_ru\",\"bitrix.kraytyoutubechannel_by\",\"bitrix.kraytyoutubechannel_kz\",\"bitrix.kraytyoutubechannel_ua\",\"bitrix.kraytchildrensschool_ru\",\"bitrix.kraytchildrensschool_by\",\"bitrix.kraytchildrensschool_kz\",\"bitrix.kraytchildrensschool_ua\",\"bitrix.krayttravelagency_ru\",\"bitrix.krayttravelagency_by\",\"bitrix.krayttravelagency_kz\",\"bitrix.krayttravelagency_ua\",\"bitrix.krayttranslator_ru\",\"bitrix.krayttranslator_by\",\"bitrix.krayttranslator_kz\",\"bitrix.krayttranslator_ua\",\"bitrix.kraytstylist_ru\",\"bitrix.kraytstylist_by\",\"bitrix.kraytstylist_kz\",\"bitrix.kraytstylist_ua\",\"bitrix.kraytstretchingstudio_ru\",\"bitrix.kraytstretchingstudio_by\",\"bitrix.kraytstretchingstudio_kz\",\"bitrix.kraytstretchingstudio_ua\",\"bitrix.kraytsportschool_ru\",\"bitrix.kraytsportschool_by\",\"bitrix.kraytsportschool_kz\",\"bitrix.kraytsportschool_ua\",\"bitrix.kraytsitedesigner_ru\",\"bitrix.kraytsitedesigner_by\",\"bitrix.kraytsitedesigner_kz\",\"bitrix.kraytsitedesigner_ua\",\"bitrix.kraytsport_ru\",\"bitrix.kraytsport_by\",\"bitrix.kraytsport_kz\",\"bitrix.kraytsport_ua\",\"bitrix.kraytmobileapp_ru\",\"bitrix.kraytmobileapp_by\",\"bitrix.kraytmobileapp_kz\",\"bitrix.kraytmobileapp_ua\",\"bitrix.kraytrealestate_ru\",\"bitrix.kraytrealestate_by\",\"bitrix.kraytrealestate_kz\",\"bitrix.kraytrealestate_ua\",\"bitrix.delobotnewyearsale_ru\",\"bitrix.delobotnewyearsale_by\",\"bitrix.delobotnewyearsale_kz\",\"bitrix.delobotnewyearsale_ua\",\"bitrix.delobotyoga_ru\",\"bitrix.delobotyoga_by\",\"bitrix.delobotyoga_kz\",\"bitrix.delobotyoga_ua\",\"bitrix.delobotcake_ru\",\"bitrix.delobotcake_by\",\"bitrix.delobotcake_kz\",\"bitrix.delobotcake_ua\",\"bitrix.delobotveterinarian_ru\",\"bitrix.delobotveterinarian_by\",\"bitrix.delobotveterinarian_kz\",\"bitrix.delobotveterinarian_ua\",\"bitrix.delobotpsychologist_ru\",\"bitrix.delobotpsychologist_by\",\"bitrix.delobotpsychologist_kz\",\"bitrix.delobotpsychologist_ua\",\"bitrix.delobotdecoration_ru\",\"bitrix.delobotdecoration_by\",\"bitrix.delobotdecoration_kz\",\"bitrix.delobotdecoration_ua\",\"bitrix.delobotflorist_ru\",\"bitrix.delobotflorist_by\",\"bitrix.delobotflorist_kz\",\"bitrix.delobotflorist_ua\",\"bitrix.delobotcarservice_ru\",\"bitrix.delobotcarservice_by\",\"bitrix.delobotcarservice_kz\",\"bitrix.delobotcarservice_ua\",\"bitrix.delobotcargotransportation_ru\",\"bitrix.delobotcargotransportation_by\",\"bitrix.delobotcargotransportation_kz\",\"bitrix.delobotcargotransportation_ua\",\"bitrix.delobotrealtor_ru\",\"bitrix.delobotrealtor_by\",\"bitrix.delobotrealtor_kz\",\"bitrix.delobotrealtor_ua\",\"bitrix.delobotfurnituremanufacturing_ru\",\"bitrix.delobotfurnituremanufacturing_by\",\"bitrix.delobotfurnituremanufacturing_kz\",\"bitrix.delobotfurnituremanufacturing_ua\",\"bitrix.delobotorganizationofholidays_ru\",\"bitrix.delobotorganizationofholidays_by\",\"bitrix.delobotorganizationofholidays_kz\",\"bitrix.delobotorganizationofholidays_ua\",\"bitrix.delobotconcertannounce_ru\",\"bitrix.delobotconcertannounce_by\",\"bitrix.delobotconcertannounce_kz\",\"bitrix.delobotconcertannounce_ua\",\"bitrix.delobotphotographersservice_ru\",\"bitrix.delobotphotographersservice_by\",\"bitrix.delobotphotographersservice_kz\",\"bitrix.delobotphotographersservice_ua\",\"bitrix.kraytsecurityagency_ru\",\"bitrix.kraytsecurityagency_by\",\"bitrix.kraytsecurityagency_kz\",\"bitrix.kraytsecurityagency_ua\",\"bitrix.kraytrecordingstudio_ru\",\"bitrix.kraytrecordingstudio_by\",\"bitrix.kraytrecordingstudio_kz\",\"bitrix.kraytrecordingstudio_ua\",\"bitrix.kraytrealestateagent_ru\",\"bitrix.kraytrealestateagent_by\",\"bitrix.kraytrealestateagent_kz\",\"bitrix.kraytrealestateagent_ua\",\"bitrix.delobotdecorationhouses_ru\",\"bitrix.delobotdecorationhouses_by\",\"bitrix.delobotdecorationhouses_kz\",\"bitrix.delobotdecorationhouses_ua\",\"bitrix.delobotairconditioners_ru\",\"bitrix.delobotairconditioners_by\",\"bitrix.delobotairconditioners_kz\",\"bitrix.delobotairconditioners_ua\",\"bitrix.delobotdesignworkshop_ru\",\"bitrix.delobotdesignworkshop_by\",\"bitrix.delobotdesignworkshop_kz\",\"bitrix.delobotdesignworkshop_ua\",\"bitrix.delobotcitygreeningproject_ru\",\"bitrix.delobotcitygreeningproject_by\",\"bitrix.delobotcitygreeningproject_kz\",\"bitrix.delobotcitygreeningproject_ua\",\"bitrix.delobotecoproducts_ru\",\"bitrix.delobotecoproducts_by\",\"bitrix.delobotecoproducts_kz\",\"bitrix.delobotecoproducts_ua\",\"bitrix.delobotsoundrecordingservices_ru\",\"bitrix.delobotsoundrecordingservices_by\",\"bitrix.delobotsoundrecordingservices_kz\",\"bitrix.delobotsoundrecordingservices_ua\",\"bitrix.delobotsecurityservice_ru\",\"bitrix.delobotsecurityservice_by\",\"bitrix.delobotsecurityservice_kz\",\"bitrix.delobotsecurityservice_ua\",\"bitrix.delobotsportschool_ru\",\"bitrix.delobotsportschool_by\",\"bitrix.delobotsportschool_kz\",\"bitrix.delobotsportschool_ua\",\"bitrix.delobotfamilyleisure_ru\",\"bitrix.delobotfamilyleisure_by\",\"bitrix.delobotfamilyleisure_kz\",\"bitrix.delobotfamilyleisure_ua\",\"bitrix.delobotdoctortherapist_ru\",\"bitrix.delobotdoctortherapist_by\",\"bitrix.delobotdoctortherapist_kz\",\"bitrix.delobotdoctortherapist_ua\",\"bitrix.kraytagency_ru\",\"bitrix.kraytagency_by\",\"bitrix.kraytagency_kz\",\"bitrix.kraytarchitecture_ru\",\"bitrix.kraytarchitecture_by\",\"bitrix.kraytarchitecture_kz\",\"bitrix.kraytagriculture_ru\",\"bitrix.kraytagriculture_by\",\"bitrix.kraytagriculture_kz\",\"bitrix.kraytbusiness_ru\",\"bitrix.kraytbusiness_by\",\"bitrix.kraytbusiness_kz\",\"bitrix.kraytevents_ru\",\"bitrix.kraytevents_by\",\"bitrix.kraytevents_kz\",\"bitrix.kraythalloween_ru\",\"bitrix.kraythalloween_by\",\"bitrix.kraythalloween_kz\",\"bitrix.kraytinstagramtarget_ru\",\"bitrix.kraytinstagramtarget_by\",\"bitrix.kraytinstagramtarget_kz\",\"bitrix.kraytinstagramcontacts_ru\",\"bitrix.kraytinstagramcontacts_by\",\"bitrix.kraytinstagramcontacts_kz\",\"bitrix.kraytinstagramstock_ru\",\"bitrix.kraytinstagramstock_by\",\"bitrix.kraytinstagramstock_kz\",\"bitrix.kraytpetservice_ru\",\"bitrix.kraytpetservice_by\",\"bitrix.kraytpetservice_kz\",\"bitrix.kraytsolarenergy_ru\",\"bitrix.kraytsolarenergy_by\",\"bitrix.kraytsolarenergy_kz\",\"bitrix.kraytsummersale_ru\",\"bitrix.kraytsummersale_by\",\"bitrix.kraytsummersale_kz\",\"bitrix.krayttravelblog_ru\",\"bitrix.krayttravelblog_by\",\"bitrix.krayttravelblog_kz\",\"bitrix.kraytvebinar_ru\",\"bitrix.kraytvebinar_by\",\"bitrix.kraytvebinar_kz\",\"bitrix.kraytvetclinic_ru\",\"bitrix.kraytvetclinic_by\",\"bitrix.kraytvetclinic_kz\",\"bitrix.kraytrestaurant_ru\",\"bitrix.kraytrestaurant_by\",\"bitrix.kraytrestaurant_kz\",\"bitrix.kraytrestaurant_ua\",\"bitrix.kraytweddingservices_ru\",\"bitrix.kraytweddingservices_by\",\"bitrix.kraytweddingservices_kz\",\"bitrix.kraytweddingservices_ua\",\"bitrix.kraytoptics_ru\",\"bitrix.kraytoptics_by\",\"bitrix.kraytoptics_kz\",\"bitrix.kraytoptics_ua\",\"bitrix.krayt3dprint_ru\",\"bitrix.krayt3dprint_by\",\"bitrix.krayt3dprint_kz\",\"bitrix.krayt3dprint_ua\",\"bitrix.kraytbusinesspremisesdesign_ru\",\"bitrix.kraytbusinesspremisesdesign_by\",\"bitrix.kraytbusinesspremisesdesign_kz\",\"bitrix.kraytbusinesspremisesdesign_ua\",\"bitrix.kraytcentersproject_ru\",\"bitrix.kraytcentersproject_by\",\"bitrix.kraytcentersproject_kz\",\"bitrix.kraytcentersproject_ua\",\"bitrix.kraytcitygreening_ru\",\"bitrix.kraytcitygreening_by\",\"bitrix.kraytcitygreening_kz\",\"bitrix.kraytcitygreening_ua\",\"bitrix.kraytclimatesystems_ru\",\"bitrix.kraytclimatesystems_by\",\"bitrix.kraytclimatesystems_kz\",\"bitrix.kraytclimatesystems_ua\",\"bitrix.kraytclinicmomandbaby_ru\",\"bitrix.kraytclinicmomandbaby_by\",\"bitrix.kraytclinicmomandbaby_kz\",\"bitrix.kraytclinicmomandbaby_ua\",\"bitrix.kraytdesignerclothing_ru\",\"bitrix.kraytdesignerclothing_by\",\"bitrix.kraytdesignerclothing_kz\",\"bitrix.kraytdesignerclothing_ua\",\"bitrix.kraytprivatedoctor_ru\",\"bitrix.kraytprivatedoctor_by\",\"bitrix.kraytprivatedoctor_kz\",\"bitrix.kraytprivatedoctor_ua\",\"bitrix.kraytprintinghouse_ru\",\"bitrix.kraytprintinghouse_by\",\"bitrix.kraytprintinghouse_kz\",\"bitrix.kraytprintinghouse_ua\",\"bitrix.kraytpersonalcoach_ru\",\"bitrix.kraytpersonalcoach_by\",\"bitrix.kraytpersonalcoach_kz\",\"bitrix.kraytpersonalcoach_ua\",\"bitrix.kraytperfumer_ru\",\"bitrix.kraytperfumer_by\",\"bitrix.kraytperfumer_kz\",\"bitrix.kraytperfumer_ua\",\"bitrix.kraytnewsblog_ru\",\"bitrix.kraytnewsblog_by\",\"bitrix.kraytnewsblog_kz\",\"bitrix.kraytnewsblog_ua\",\"bitrix.kraytmakeupstudio_ru\",\"bitrix.kraytmakeupstudio_by\",\"bitrix.kraytmakeupstudio_kz\",\"bitrix.kraytmakeupstudio_ua\",\"bitrix.kraytlawyer_ru\",\"bitrix.kraytlawyer_by\",\"bitrix.kraytlawyer_kz\",\"bitrix.kraytlawyer_ua\",\"bitrix.kraytlandscapedesign_ru\",\"bitrix.kraytlandscapedesign_by\",\"bitrix.kraytlandscapedesign_kz\",\"bitrix.kraytlandscapedesign_ua\",\"bitrix.kraytjewelryrepairshop_ru\",\"bitrix.kraytjewelryrepairshop_by\",\"bitrix.kraytjewelryrepairshop_kz\",\"bitrix.kraytjewelryrepairshop_ua\",\"bitrix.kraytinteriordesign_ru\",\"bitrix.kraytinteriordesign_by\",\"bitrix.kraytinteriordesign_kz\",\"bitrix.kraytinsurancecompany_ru\",\"bitrix.kraytinsurancecompany_kz\",\"bitrix.kraytinsurancecompany_ua\",\"bitrix.kraytillustrator_ru\",\"bitrix.kraytillustrator_by\",\"bitrix.kraytillustrator_kz\",\"bitrix.kraytillustrator_ua\",\"bitrix.kraytgiftsvalentineday_ru\",\"bitrix.kraytgiftsvalentineday_by\",\"bitrix.kraytgiftsvalentineday_kz\",\"bitrix.kraytgiftsvalentineday_ua\",\"bitrix.kraytfebruary23_ru\",\"bitrix.kraytfebruary23_by\",\"bitrix.kraytfebruary23_kz\",\"bitrix.kraytfebruary23_ua\",\"bitrix.kraytequipmentrepair_ru\",\"bitrix.kraytequipmentrepair_by\",\"bitrix.kraytequipmentrepair_kz\",\"bitrix.kraytequipmentrepair_ua\",\"bitrix.kraytdentistry_ru\",\"bitrix.kraytdentistry_by\",\"bitrix.kraytdentistry_kz\",\"bitrix.kraytdentistry_ua\",\"bitrix.kraytdancemarathon_ru\",\"bitrix.kraytdancemarathon_by\",\"bitrix.kraytdancemarathon_kz\",\"bitrix.kraytdancemarathon_ua\",\"bitrix.kraytcourseformothers_ru\",\"bitrix.kraytcourseformothers_by\",\"bitrix.kraytcourseformothers_kz\",\"bitrix.kraytcourseformothers_ua\",\"bitrix.kraytcosmetologist_ru\",\"bitrix.kraytcosmetologist_by\",\"bitrix.kraytcosmetologist_kz\",\"bitrix.kraytcosmetologist_ua\",\"bitrix.kraytconstructionofprivatehouses_ru\",\"bitrix.kraytconstructionofprivatehouses_by\",\"bitrix.kraytconstructionofprivatehouses_kz\",\"bitrix.kraytconstructionofprivatehouses_ua\",\"bitrix.kraytconfectionery_ru\",\"bitrix.kraytconfectionery_by\",\"bitrix.kraytconfectionery_kz\",\"bitrix.kraytconfectionery_ua\",\"bitrix.kraytcoffeehouse_ru\",\"bitrix.kraytcoffeehouse_by\",\"bitrix.kraytcoffeehouse_kz\",\"bitrix.kraytcoffeehouse_ua\",\"bitrix.kraytcleaningservice_ru\",\"bitrix.kraytcleaningservice_by\",\"bitrix.kraytcleaningservice_kz\",\"bitrix.kraytcleaningservice_ua\",\"bitrix.kraytbeautystudio_ru\",\"bitrix.kraytbeautystudio_by\",\"bitrix.kraytbeautystudio_kz\",\"bitrix.kraytbeautystudio_ua\",\"bitrix.kraytbarbershop_ru\",\"bitrix.kraytbarbershop_by\",\"bitrix.kraytartworkshop_by\",\"bitrix.kraytbarbershop_kz\",\"bitrix.kraytbarbershop_ua\",\"bitrix.kraytartworkshop_ru\",\"bitrix.kraytartworkshop_kz\",\"bitrix.kraytartworkshop_ua\",\"bitrix.kraytaprilfoolsdaygifts_ru\",\"bitrix.kraytaprilfoolsdaygifts_by\",\"bitrix.kraytaprilfoolsdaygifts_kz\",\"bitrix.kraytaprilfoolsdaygifts_ua\",\"bitrix.kraytwindowinstallation_ru\",\"bitrix.kraytwindowinstallation_by\",\"bitrix.kraytwindowinstallation_kz\",\"bitrix.kraytwindowinstallation_ua\",\"bitrix.kraytwindowdesign_ru\",\"bitrix.kraytwindowdesign_by\",\"bitrix.kraytwindowdesign_kz\",\"bitrix.kraytwindowdesign_ua\",\"bitrix.krayttelecommunications_ru\",\"bitrix.krayttelecommunications_by\",\"bitrix.krayttelecommunications_kz\",\"bitrix.krayttelecommunications_ua\",\"bitrix.kraytsportsnutritionorder_ru\",\"bitrix.kraytsportsnutritionorder_by\",\"bitrix.kraytsportsnutritionorder_kz\",\"bitrix.kraytsportsnutritionorder_ua\",\"bitrix.kraytreconstructionoffices_ru\",\"bitrix.kraytreconstructionoffices_by\",\"bitrix.kraytreconstructionoffices_kz\",\"bitrix.kraytreconstructionoffices_ua\",\"bitrix.kraytpremisestrade_ru\",\"bitrix.kraytpremisestrade_by\",\"bitrix.kraytpremisestrade_ua\",\"bitrix.kraytinsulationhouses_ru\",\"bitrix.kraytinsulationhouses_by\",\"bitrix.kraytinsulationhouses_kz\",\"bitrix.kraytinsulationhouses_ua\",\"bitrix.kraytinstallsecuritysystems_ru\",\"bitrix.kraytinstallsecuritysystems_by\",\"bitrix.kraytinstallsecuritysystems_kz\",\"bitrix.kraytinstallsecuritysystems_ua\",\"bitrix.kraytinstallbathrooms_ru\",\"bitrix.kraytinstallbathrooms_by\",\"bitrix.kraytinstallbathrooms_kz\",\"bitrix.kraytinstallbathrooms_ua\",\"bitrix.kraythousedesign_ru\",\"bitrix.kraythousedesign_by\",\"bitrix.kraythousedesign_kz\",\"bitrix.kraythousedesign_ua\",\"bitrix.kraythospitalforfamily_ru\",\"bitrix.kraythospitalforfamily_by\",\"bitrix.kraythospitalforfamily_kz\",\"bitrix.kraythospitalforfamily_ua\",\"bitrix.kraythomedecoration_ru\",\"bitrix.kraythomedecoration_by\",\"bitrix.kraythomedecoration_kz\",\"bitrix.kraythomedecoration_ua\",\"bitrix.kraytfurniturettransformer_ru\",\"bitrix.kraytfurniturettransformer_by\",\"bitrix.kraytfurniturettransformer_kz\",\"bitrix.kraytfurniturettransformer_ua\",\"bitrix.kraytfloristics_ru\",\"bitrix.kraytfloristics_by\",\"bitrix.kraytfloristics_kz\",\"bitrix.kraytfloristics_ua\",\"bitrix.kraytfestiveevents_ru\",\"bitrix.kraytfestiveevents_by\",\"bitrix.kraytfestiveevents_kz\",\"bitrix.kraytfestiveevents_ua\",\"bitrix.kraytecogreen_ru\",\"bitrix.kraytecogreen_by\",\"bitrix.kraytecogreen_kz\",\"bitrix.kraytecogreen_ua\",\"bitrix.kraytdoorinstallation_ru\",\"bitrix.kraytdoorinstallation_by\",\"bitrix.kraytdoorinstallation_kz\",\"bitrix.kraytdoorinstallation_ua\",\"bitrix.kraytdoordesign_ru\",\"bitrix.kraytdoordesign_by\",\"bitrix.kraytdoordesign_kz\",\"bitrix.kraytdoordesign_ua\",\"bitrix.kraytdesigningpeopledisabilities_ru\",\"bitrix.kraytdesigningpeopledisabilities_by\",\"bitrix.kraytdesigningpeopledisabilities_kz\",\"bitrix.kraytdesigningpeopledisabilities_ua\",\"bitrix.delobotkindergarten_ru\",\"bitrix.kraytvideostudio_ru\",\"bitrix.kraytlegalservices_ru\",\"bitrix.kraytaccountingservices_ru\",\"bitrix.kraytbookannouncement_ru\",\"bitrix.kraytcharity_ru\",\"bitrix.kraytspa_ru\",\"bitrix.kraythandmadecosmetics_ru\",\"bitrix.delobotmusic_ru\",\"bitrix.kraythotelforanimals_ru\",\"bitrix.kraytcityguide_ru\",\"bitrix.delobotfoodblog_ru\",\"bitrix.delobotgamedeveloper_ru\",\"bitrix.delobotrenovationoffices_ru\",\"bitrix.delobotcourses_ru\",\"bitrix.delobotcityb__beautification_ru\",\"bitrix.delobotaidfund_ru\",\"bitrix.delobotnewsblog_ru\",\"bitrix.delobottransportservices_ru\",\"bitrix.delobotguide_ru\",\"bitrix.delobotnnturalcosmetic_ru\",\"bitrix.delobotboutiqueforsale_ru\",\"bitrix.delobotorganizationweddings_ru\",\"bitrix.delobotbeautyandrecreationcenter_ru\",\"bitrix.delobotwriter_ru\",\"bitrix.kraytotel\",\"bitrix.kraytigrovoyklub\",\"bitrix.kraytbazaotdykha\",\"bitrix.kraytkurspotiktoku\",\"bitrix.kraytkadrovoeagenstvo\",\"bitrix.kraytportfoliomodeli\",\"bitrix.kraytminecraftserver\",\"bitrix.kraytigrovayakompaniya\",\"bitrix.delobotuslugivideoproizvodstva\",\"bitrix.delobotportfolioaktera\",\"bitrix.delobotpub\",\"bitrix.delobotminihotel\",\"bitrix.delobotcamping\",\"bitrix.delobotcafe\",\"bitrix.delobotizgotovlenieduxov\",\"bitrix.delobotbuhgalterskoeobslujivanie\",\"bitrix.delobotarendanedvizimosti\",\"bitrix.delobotalternativnayaenergetika\",\"bitrix.delobotagentstvoponaimy\",\"bitrix.kraytpodarkikjenskomydny\",\"bitrix.kraytinstagramcontacts_ru1\",\"bitrix.kraytinstagramstock_ru1\",\"bitrix.kraytinstagramtarget_ru1\",\"bitrix.kraytkhimchistka\",\"bitrix.krayt_detskaya_odezhda_na_zakaz\",\"bitrix.krayt_retsepty_blyud\",\"bitrix.krayt_detskaya_mebel\",\"bitrix.krayt_biblioteka\",\"bitrix.krayt_pitomnik_rasteniy\",\"bitrix.delobot_lawyer\",\"bitrix.delobot_oformlenie_dverey\",\"bitrix.delobot_montaj_dverey\",\"bitrix.delobot_manicure_and_pedicure\",\"bitrix.delobot_printing_services\",\"bitrix.delobot_plants\",\"bitrix.delobot_nutritionist\",\"bitrix.delobot_designer_tableware\",\"bitrix.delobot_montaj_okon\",\"bitrix.delobot_oformlenie_okon\",\"bitrix.krayt_zhurnalist\",\"bitrix.krayt_tato_salon\",\"bitrix.krayt_massajist\",\"bitrix.krayt_consulting\",\"bitrix.krayt_elektromontazh\",\"bitrix.krayt_rezyume_spetsialista\",\"bitrix.kraytportfoliophotographer\",\"bitrix.kraytbeautystudio_en\",\"bitrix.kraytautomechanic_en\",\"bitrix.kraytequipmentrepair_en\",\"bitrix.delobot_furniture_for_children\",\"bitrix.delobot_architectural_projects\",\"bitrix.delobot_scientists_page\",\"bitrix.delobot_tatoo_studio\",\"bitrix.delobot_journalist_resume\",\"bitrix.delobot_leather_goods\",\"bitrix.delobot_dance_marathon\",\"bitrix.krayt_art_gallery\",\"bitrix.krayt_leather_products\",\"bitrix.krayt_scientific_researcher\",\"bitrix.krayt_bureau_of_architecture\",\"bitrix.krayt_jewelry_designer\",\"bitrix.krayt_food_photographer\",\"bitrix.krayt_acting_studio\",\"bitrix.krayt_farm\",\"bitrix.krayt_fashion_blog\",\"bitrix.krayt_birthday_cakes\",\"bitrix.krayt_plussize_fashion\",\"bitrix.krayt_diving\",\"bitrix.krayt_it_services\",\"bitrix.krayt_beauty_blog\",\"bitrix.krayt_aquarium\",\"bitrix.krayt_sport_blog\",\"bitrix.delobot_online_library\",\"bitrix.delobot_diving_center\",\"bitrix.delobot_designer_jewelry\",\"bitrix.delobot_nail_art_course\",\"bitrix.delobot_art_galery\",\"bitrix.delobot_fashion_for_everyone\",\"bitrix.delobot_handmade_chocolate\",\"bitrix.krayt_chocolate_shop\",\"bitrix.krayt_advertising_agency\",\"bitrix.krayt_asian_food\",\"bitrix.krayt_avtorskiy_master_klass\",\"bitrix.krayt_utilizatsiya_otkhodov\",\"bitrix.krayt_italyanskaya_kukhnya\",\"bitrix.krayt_kurs_po_nogtevomu_servisu\",\"bitrix.krayt_begovoy_klub\",\"bitrix.krayt_gornyy_turizm\",\"bitrix.krayt_biznes_prostranstvo\",\"bitrix.krayt_shkola_iskusstv\",\"bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka\",\"bitrix.delobot_reklama_brenda\",\"bitrix.delobot_italyanskiy_restoran\",\"bitrix.delobot_modnaya_stranichka\",\"bitrix.delobot_fotografiya_edy\",\"bitrix.krayt_pishchevoe_proizvodstvo\",\"bitrix.krayt_appetitnyy_blog\",\"bitrix.krayt_uslugi_remonta\",\"bitrix.krayt_onlayn_kurs_kreativnogo_prodyusera\",\"bitrix.krayt_detskie_prazdniki\",\"bitrix.krayt_svetotekhnika\",\"bitrix.krayt_urbanistika\",\"bitrix.krayt_otdykh_na_prirode\",\"bitrix.krayt_sportivnye_ploshchadki\",\"bitrix.krayt_oborudovanie_dlya_turizma\",\"bitrix.krayt_meksikanskaya_kukhnya\",\"bitrix.delobot_sports_blog_20\",\"bitrix.delobot_aziatskie_blyuda\",\"bitrix.delobot_beauty_blog\",\"bitrix.delobot_meksikanskiy_restoran_2_0\",\"bitrix.delobot_urban_project\",\"bitrix.delobot_drawing_school\",\"bitrix.delobot_tourism\",\"bitrix.delobot_runnig_club\",\"bitrix.delobot_lighting_company\",\"bitrix.delobot_garbage_disposal\",\"bitrix.delobot_master_class\",\"bitrix.delobot_it_outsourcing\",\"bitrix.krayt_rent_car\",\"bitrix.krayt_aviation\",\"bitrix.krayt_street_sport_club\",\"bitrix.krayt_kofemaniya\",\"bitrix.krayt_corporate_events\",\"bitrix.krayt_cooking_school\",\"bitrix.krayt_blacksmith_craft\",\"bitrix.krayt_med_lab\",\"bitrix.krayt_music_studio\",\"bitrix.krayt_web_application_development\",\"bitrix.krayt_tennis_club\",\"bitrix.krayt_bank_services\",\"bitrix.krayt_smart_furniture\",\"bitrix.krayt_dom_pod_klyuch\",\"bitrix.krayt_uslugi_mediatora\",\"bitrix.krayt_child_club\",\"bitrix.delobot_custom_made_cakes\",\"bitrix.delobot_online_yoga_classes\",\"bitrix.krayt_pevitsa\",\"bitrix.krayt_ozelenenie_pomeshcheniy\",\"bitrix.krayt_internet_agentstvo\",\"bitrix.krayt_kinolog\",\"bitrix.krayt_poleznye_sneki\",\"bitrix.krayt_oformlenie_interera\",\"bitrix.delobot_tourist_equipment\",\"bitrix.delobot_creative_producer\",\"bitrix.delobot_aviation_services\",\"bitrix.delobot_blacksmith_services\",\"bitrix.delobot_coffee_subscription\",\"bitrix.delobot_construction_company\",\"bitrix.delobot_business_premises\",\"bitrix.delobot_pet_hotel\",\"bitrix.delobot_food_industry\",\"bitrix.delobot_cars_for_rent\",\"bitrix.krayt_klub_dlya_geymerov\",\"bitrix.krayt_relaks_uslugi\",\"bitrix.krayt_sportivnyy_inventar\",\"bitrix.krayt_universitet\",\"bitrix.delobot_uslugi_kinologa\",\"bitrix.delobot_business_training\",\"bitrix.krayt_vebinar\",\"bitrix.krayt_kurs_po_iskusstvennomu_intellektu\",\"bitrix.delobot_vypechka_na_zakaz\",\"bitrix.delobot_osennaya_rasprodazh\",\"bitrix.krayt_onlayn_shkola_dlya_detey\",\"bitrix.krayt_arkhitekturnaya_kompaniya\",\"bitrix.krayt_den_blagodareniya\",\"bitrix.krayt_uslugi_nyani\",\"bitrix.krayt_uslugi_repetitora\",\"bitrix.krayt_logoped\",\"bitrix.krayt_chyernaya_pyatnitsa\",\"bitrix.krayt_sladosti_na_rozhdestvo\",\"bitrix.krayt_podarki_na_novyy_god\",\"bitrix.delobot_laboratory\",\"bitrix.delobot_street_sports_grounds\",\"bitrix.delobot_about_webinar\",\"bitrix.krayt_dostavka_gruza\",\"bitrix.delobot_online_travel\",\"bitrix.delobot_youtube_channel\",\"bitrix.delobot_interior_design\",\"bitrix.krayt_kursy_po_interesam\",\"bitrix.krayt_zimnyaya_rasprodazha\",\"bitrix.krayt_tsifrovye_kommunikatsii\",\"bitrix.krayt_avtosalon\",\"bitrix.krayt_uslugi_stroitelnoy_kompanii\",\"bitrix.krayt_vysshee_uchebnoe_zavedenie\",\"bitrix.krayt_veterinar\",\"bitrix.krayt_akademiya_iskusstv\",\"bitrix.krayt_master_po_domu\",\"bitrix.krayt_onlayn_trenirovki\",\"bitrix.krayt_apart_otel\",\"bitrix.krayt_tsvety_i_bukety_na_zakaz\",\"bitrix.krayt_biznes_forum\",\"bitrix.krayt_uslugi_stomatologii\",\"bitrix.krayt_uslugi_avtoservisa\",\"bitrix.delobot_winter_sale\",\"bitrix.krayt_christmas_treats\",\"bitrix.krayt_eksperty_tochnogo_zemledeliya\",\"bitrix.krayt_servis_ukhoda_za_domom\",\"bitrix.delobot_repetitor\",\"bitrix.delobot_babysitter_for_children\",\"bitrix.delobot_speech_therapist_services\",\"bitrix.empty_template\",\"bitrix.krayt_gift_wrapping\",\"bitrix.delobot_fitness_clothes\",\"bitrix.delobot_bathroom_renovation\",\"bitrix.delobot_travel_arrangements\",\"bitrix.krayt_music_classes\",\"bitrix.delobot_klinika_dlya_mam_i_detok\",\"bitrix.delobot_bankovskie_uslugi\",\"bitrix.krayt_videoproizvodstvo\",\"bitrix.krayt_manikyur\",\"bitrix.krayt_meditsinskaya_pomoshch_onlayn\",\"bitrix.krayt_oblagorazhivanie_goroda\",\"bitrix.krayt_uslugi_barbershopa\",\"bitrix.krayt_taksi\",\"bitrix.delobot_optika\",\"bitrix.delobot_klinika_stomatologii\",\"bitrix.delobot_konditer\",\"bitrix.delobot_3d_print_services\",\"bitrix.delobot_uslugi_khimchistki\",\"bitrix.delobot_obuchenie_po_iskusstvennomu_intellektu\",\"bitrix.krayt_nutritsiologiya\",\"bitrix.krayt_salon_krasoty\",\"bitrix.krayt_uslugi_perevoda\",\"bitrix.krayt_landshaftnyy_dizayner\",\"bitrix.krayt_mebel_gotovaya_i_na_zakaz\",\"bitrix.krayt_uslugi_yurista\",\"bitrix.krayt_uslugi_po_bukhgalterii\",\"bitrix.krayt_yuvelir\",\"bitrix.krayt_stranichka_s_aktsiey\",\"bitrix.krayt_den_vsekh_vlyublennykh\",\"bitrix.krayt_stranichka_kontaktov\",\"bitrix.krayt_uslugi_massazhista\",\"bitrix.krayt_dostavka_edy_i_napitkov\",\"bitrix.krayt_podarki_na_zhenskiy_den\",\"bitrix.krayt_ekskursii\",\"bitrix.krayt_proizvodstvo_kosmetiki\",\"bitrix.krayt_logistika\",\"bitrix.krayt_fotograf\",\"bitrix.krayt_arenda_zhilya\",\"bitrix.krayt_kliningovye_uslugi\",\"bitrix.krayt_agentstvo_po_naymu\",\"bitrix.krayt_dukhi_na_zakaz\",\"bitrix.delobot_event_anounce\",\"bitrix.delobot_barbershop\",\"bitrix.delobot_italian_cafe\",\"bitrix.delobot_application_development\",\"bitrix.delobot_construction\",\"bitrix.delobot_uslugi_khudozhnika\",\"bitrix.krayt_prepodavatel\",\"bitrix.krayt_dveri_na_zakaz\",\"bitrix.krayt_kursy_po_gotovke\",\"bitrix.krayt_interernyy_dizayn\",\"bitrix.krayt_konsultatsii_po_zdorovyu\",\"bitrix.krayt_uslugi_atele\",\"bitrix.krayt_vizitka\",\"bitrix.krayt_remont_zhilya\",\"bitrix.krayt_voskhozhdenie_s_alpinistami\",\"bitrix.krayt_vesennyaya_rasprodazha\",\"bitrix.krayt_svadebnyy_salon\",\"bitrix.kraytlawyer_en\",\"bitrix.kraytinsurancecompany_en\",\"bitrix.krayt_interior_designer\",\"bitrix.delobot_bank\",\"bitrix.delobot_custom_made_clothes\",\"bitrix.delobot_telemedicine\",\"bitrix.krayt_spetsialist_po_nedvizhimosti\",\"bitrix.krayt_sportzal\",\"bitrix.krayt_mebel\",\"bitrix.krayt_tvorcheskie_kursy\",\"bitrix.krayt_kosmetologiya\",\"bitrix.krayt_remont_bytovoy_tekhniki\",\"bitrix.delobot_stylist_services\",\"bitrix.delobot_holidays_for_children\",\"bitrix.delobot_logistics_services\",\"bitrix.krayt_remont_avto\",\"bitrix.krayt_torgovoe_oborudovanie\",\"bitrix.krayt_rasteniya_i_zhivye_izgorodi\",\"bitrix.krayt_organizatsiya_meropriyatiy\",\"bitrix.krayt_o_psikhologe\",\"bitrix.krayt_prozhivanie_v_otele\",\"bitrix.krayt_dental_clinic\",\"bitrix.krayt_barbershop\",\"bitrix.krayt_personal_stylist\",\"bitrix.delobot_muzykalnaya_shkola\",\"bitrix.delobot_parfumer_services\",\"bitrix.delobot_uslugi_po_upakovke_podarkov\",\"bitrix.delobot_insurance\",\"bitrix.delobot_zabota_o_zhivotnyh\",\"bitrix.delobot_landscape_studio\",\"bitrix.krayt_dizayn_saytov\",\"bitrix.krayt_arenda_tekhniki\",\"bitrix.krayt_kursy_dlya_sotrudnikov\",\"bitrix.krayt_konditsionery_v_dom\",\"bitrix.krayt_promyshlennost\",\"bitrix.krayt_tantsy\",\"bitrix.krayt_pechat_3d_figur\",\"bitrix.krayt_o_biblioteke\",\"bitrix.krayt_vyrashchivanie_zeleni\",\"bitrix.krayt_okhrannye_sistemy\",\"bitrix.krayt_zvukozapis\",\"bitrix.krayt_rasprodazha\",\"bitrix.form_template_with_product_galery_for_social_media\",\"bitrix.form_template_with_offer\",\"bitrix.facebook_form_template_with_offer\",\"bitrix.facebook_form_template_with_product_images\",\"bitrix.facebook_form_template_with_extra_communication_channels\",\"bitrix.shablon_dlya_formy_v_vk_s_kartinkami_tovarov\",\"bitrix.shablon_dlya_formy_v_vk_s_kanalami_svyazi\",\"bitrix.shablon_dlya_formy_v_vk_s_promo_aktsiey\",\"bitrix.form_template_with_offer_for_social_media\",\"bitrix.form_template_with_contacts_for_social_media\",\"bitrix.form_template_with_product_images_for_social_media\",\"bitrix.form_template_with_communication_channels_for_social_media\",\"bitrix.krayt_vypechka\",\"bitrix.krayt_it_spetsialisty\",\"bitrix.krayt_modnyy_konsultant\",\"bitrix.krayt_agentstvo_po_turizmu\",\"bitrix.krayt_uslugi_vizazhista\",\"bitrix.krayt_fotostudiya\",\"bitrix.krayt_vyazanie\",\"bitrix.krayt_blagotvoritelnaya_organizatsiya\",\"bitrix.krayt_uslugi_illyustratora\",\"bitrix.delobot_intensiv_po_inostrannomu_yazyku\",\"bitrix.delobot_uslugi_po_remontu_tekhniki\",\"bitrix.delobot_stranichka_mobilnogo_prilozheniya\",\"bitrix.delobot_kreativnaya_mebel\",\"bitrix.delobot_klub_tsifrovykh_igr\",\"bitrix.delobot_dizayn_dlya_doma\",\"bitrix.krayt_studiya_spa\",\"bitrix.krayt_proekt_po_utepleniyu_doma\",\"bitrix.krayt_klining_kompaniya\",\"bitrix.krayt_arkhitektor\",\"bitrix.krayt_sladosti_na_zakaz\",\"bitrix.krayt_fotografiya\",\"bitrix.krayt_poligraficheskie_uslugi\",\"bitrix.krayt_manikyur_i_pedikyur\",\"bitrix.krayt_vyazanie_2\",\"bitrix.krayt_kofe\",\"bitrix.krayt_obuchenie_muzyke\",\"bitrix.krayt_novosti\",\"bitrix.delobot_spetsialist_po_tekstam\",\"bitrix.delobot_uslugi_elektrika\",\"bitrix.delobot_otslezhivanie_zdorovya\",\"bitrix.delobot_studiya_dlya_aktyerov\",\"bitrix.delobot_uslugi_kosmetologa\",\"bitrix.delobot_kottedzhnyy_posyelok\",\"bitrix.delobot_izdeliya_ot_yuvelira\",\"bitrix.krayt_montazh_panelnykh_domov\",\"bitrix.krayt_masterskaya_tekstilya\"]', NULL, NULL),
('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
('rest', 'server_path', '/rest', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('search', 'suggest_save_days', '250', NULL, NULL),
('search', 'use_social_rating', 'Y', NULL, NULL),
('search', 'use_tf_cache', 'Y', NULL, NULL),
('search', 'use_word_distance', 'Y', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_b1c1573e37a51e8d300817f2e80b22c3', NULL, NULL),
('security', 'redirect_sid', '2', NULL, NULL),
('socialnetwork', 'allow_tooltip', 'N', NULL, NULL),
('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
('socialservices', 'auth_services', 'a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}', NULL, NULL),
('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
('vote', 'VOTE_DIR', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_option_site`
--

CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_option_site`
--

INSERT INTO `b_option_site` (`MODULE_ID`, `NAME`, `SITE_ID`, `VALUE`) VALUES
('fileman', 'menutypes', 's1', 'a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}'),
('fileman', 'propstypes', 's1', 'a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}'),
('forum', 'FILTER_DICT_T', 'en', '4'),
('forum', 'FILTER_DICT_T', 'ru', '2'),
('forum', 'FILTER_DICT_W', 'en', '3'),
('forum', 'FILTER_DICT_W', 'ru', '1'),
('main', 'wizard_solution', 's1', 'personal'),
('main', 'wizard_template_id', 's1', 'minimal');

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cache`
--

CREATE TABLE `b_perf_cache` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8mb3_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8mb3_unicode_ci,
  `BASE_DIR` text COLLATE utf8mb3_unicode_ci,
  `INIT_DIR` text COLLATE utf8mb3_unicode_ci,
  `FILE_NAME` text COLLATE utf8mb3_unicode_ci,
  `FILE_PATH` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cluster`
--

CREATE TABLE `b_perf_cluster` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int DEFAULT NULL,
  `HITS` int DEFAULT NULL,
  `ERRORS` int DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_component`
--

CREATE TABLE `b_perf_component` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int DEFAULT NULL,
  `CACHE_COUNT_R` int DEFAULT NULL,
  `CACHE_COUNT_W` int DEFAULT NULL,
  `CACHE_COUNT_C` int DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_error`
--

CREATE TABLE `b_perf_error` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `ERRNO` int DEFAULT NULL,
  `ERRSTR` text COLLATE utf8mb3_unicode_ci,
  `ERRFILE` text COLLATE utf8mb3_unicode_ci,
  `ERRLINE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_history`
--

CREATE TABLE `b_perf_history` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_hit`
--

CREATE TABLE `b_perf_hit` (
  `ID` int NOT NULL,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8mb3_unicode_ci,
  `REQUEST_URI` text COLLATE utf8mb3_unicode_ci,
  `INCLUDED_FILES` int DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int DEFAULT NULL,
  `CACHE_COUNT_R` int DEFAULT NULL,
  `CACHE_COUNT_W` int DEFAULT NULL,
  `CACHE_COUNT_C` int DEFAULT NULL,
  `QUERIES` int DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_ban`
--

CREATE TABLE `b_perf_index_ban` (
  `ID` int NOT NULL,
  `BAN_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_complete`
--

CREATE TABLE `b_perf_index_complete` (
  `ID` int NOT NULL,
  `BANNED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest`
--

CREATE TABLE `b_perf_index_suggest` (
  `ID` int NOT NULL,
  `SQL_MD5` char(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8mb3_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest_sql`
--

CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int NOT NULL,
  `SQL_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql`
--

CREATE TABLE `b_perf_sql` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8mb3_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8mb3_unicode_ci,
  `SQL_TEXT` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql_backtrace`
--

CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int NOT NULL,
  `NN` int NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINE_NO` int DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_column_stat`
--

CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int NOT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_stat`
--

CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_test`
--

CREATE TABLE `b_perf_test` (
  `ID` int NOT NULL,
  `REFERENCE_ID` int DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting`
--

CREATE TABLE `b_posting` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8mb3_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8mb3_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8mb3_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_email`
--

CREATE TABLE `b_posting_email` (
  `ID` int NOT NULL,
  `POSTING_ID` int NOT NULL,
  `STATUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_file`
--

CREATE TABLE `b_posting_file` (
  `POSTING_ID` int NOT NULL,
  `FILE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_group`
--

CREATE TABLE `b_posting_group` (
  `POSTING_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_posting_rubric`
--

CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int NOT NULL,
  `LIST_RUBRIC_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE `b_rating` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2023-10-17 09:33:55', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2023-10-17 09:33:55', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE `b_rating_component` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int NOT NULL,
  `CONFIG` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE `b_rating_component_results` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE `b_rating_prepare` (
  `ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE `b_rating_results` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int DEFAULT '0',
  `PREVIOUS_POSITION` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE `b_rating_rule` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8mb3_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8mb3_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2023-10-17 09:33:55', '2023-10-17 09:33:55', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2023-10-17 09:33:55', '2023-10-17 09:33:55', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2023-10-17 09:33:55', '2023-10-17 09:33:55', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2023-10-17 09:33:55', '2023-10-17 09:33:55', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2023-10-17 09:33:55', '2023-10-17 09:33:55', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE `b_rating_rule_vetting` (
  `ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE `b_rating_user` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, '3.0000', '30.0000', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE `b_rating_vote` (
  `ID` int NOT NULL,
  `RATING_VOTING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE `b_rating_vote_group` (
  `ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5, 1, 'A'),
(1, 1, 'R'),
(3, 1, 'R'),
(2, 3, 'R'),
(4, 3, 'R'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE `b_rating_voting` (
  `ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE `b_rating_voting_prepare` (
  `ID` int NOT NULL,
  `RATING_VOTING_ID` int NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_reaction`
--

CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `REACTION` varchar(8) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE `b_rating_weight` (
  `ID` int NOT NULL,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, '-1000000.0000', '1000000.0000', '1.0000', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_ap`
--

CREATE TABLE `b_rest_ap` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app`
--

CREATE TABLE `b_rest_app` (
  `ID` int NOT NULL,
  `CLIENT_ID` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8mb3_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app_lang`
--

CREATE TABLE `b_rest_app_lang` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app_log`
--

CREATE TABLE `b_rest_app_log` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_ap_permission`
--

CREATE TABLE `b_rest_ap_permission` (
  `ID` int NOT NULL,
  `PASSWORD_ID` int NOT NULL,
  `PERM` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_configuration_storage`
--

CREATE TABLE `b_rest_configuration_storage` (
  `ID` int NOT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_event`
--

CREATE TABLE `b_rest_event` (
  `ID` int NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_ID` int DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int DEFAULT NULL,
  `OPTIONS` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_event_offline`
--

CREATE TABLE `b_rest_event_offline` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `APP_ID` int NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8mb3_unicode_ci,
  `EVENT_ADDITIONAL` text COLLATE utf8mb3_unicode_ci,
  `PROCESS_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `ERROR` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_integration`
--

CREATE TABLE `b_rest_integration` (
  `ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PASSWORD_ID` int DEFAULT NULL,
  `APP_ID` int DEFAULT NULL,
  `SCOPE` text COLLATE utf8mb3_unicode_ci,
  `QUERY` text COLLATE utf8mb3_unicode_ci,
  `OUTGOING_EVENTS` text COLLATE utf8mb3_unicode_ci,
  `OUTGOING_NEEDED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8mb3_unicode_ci,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BOT_ID` int DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_log`
--

CREATE TABLE `b_rest_log` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8mb3_unicode_ci,
  `REQUEST_DATA` text COLLATE utf8mb3_unicode_ci,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_owner_entity`
--

CREATE TABLE `b_rest_owner_entity` (
  `ID` int NOT NULL,
  `OWNER_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER` int NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_placement`
--

CREATE TABLE `b_rest_placement` (
  `ID` int NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT '0',
  `PLACEMENT` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ICON_ID` int DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OPTIONS` varchar(2048) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_placement_lang`
--

CREATE TABLE `b_rest_placement_lang` (
  `ID` int NOT NULL,
  `PLACEMENT_ID` int NOT NULL,
  `LANGUAGE_ID` varchar(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat`
--

CREATE TABLE `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int NOT NULL,
  `METHOD_ID` int NOT NULL,
  `HOUR_0` int NOT NULL DEFAULT '0',
  `HOUR_1` int NOT NULL DEFAULT '0',
  `HOUR_2` int NOT NULL DEFAULT '0',
  `HOUR_3` int NOT NULL DEFAULT '0',
  `HOUR_4` int NOT NULL DEFAULT '0',
  `HOUR_5` int NOT NULL DEFAULT '0',
  `HOUR_6` int NOT NULL DEFAULT '0',
  `HOUR_7` int NOT NULL DEFAULT '0',
  `HOUR_8` int NOT NULL DEFAULT '0',
  `HOUR_9` int NOT NULL DEFAULT '0',
  `HOUR_10` int NOT NULL DEFAULT '0',
  `HOUR_11` int NOT NULL DEFAULT '0',
  `HOUR_12` int NOT NULL DEFAULT '0',
  `HOUR_13` int NOT NULL DEFAULT '0',
  `HOUR_14` int NOT NULL DEFAULT '0',
  `HOUR_15` int NOT NULL DEFAULT '0',
  `HOUR_16` int NOT NULL DEFAULT '0',
  `HOUR_17` int NOT NULL DEFAULT '0',
  `HOUR_18` int NOT NULL DEFAULT '0',
  `HOUR_19` int NOT NULL DEFAULT '0',
  `HOUR_20` int NOT NULL DEFAULT '0',
  `HOUR_21` int NOT NULL DEFAULT '0',
  `HOUR_22` int NOT NULL DEFAULT '0',
  `HOUR_23` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat_app`
--

CREATE TABLE `b_rest_stat_app` (
  `APP_ID` int NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat_method`
--

CREATE TABLE `b_rest_stat_method` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_usage_entity`
--

CREATE TABLE `b_rest_usage_entity` (
  `ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_usage_stat`
--

CREATE TABLE `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int NOT NULL DEFAULT '0',
  `IS_SENT` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int NOT NULL DEFAULT '0',
  `HOUR_1` int NOT NULL DEFAULT '0',
  `HOUR_2` int NOT NULL DEFAULT '0',
  `HOUR_3` int NOT NULL DEFAULT '0',
  `HOUR_4` int NOT NULL DEFAULT '0',
  `HOUR_5` int NOT NULL DEFAULT '0',
  `HOUR_6` int NOT NULL DEFAULT '0',
  `HOUR_7` int NOT NULL DEFAULT '0',
  `HOUR_8` int NOT NULL DEFAULT '0',
  `HOUR_9` int NOT NULL DEFAULT '0',
  `HOUR_10` int NOT NULL DEFAULT '0',
  `HOUR_11` int NOT NULL DEFAULT '0',
  `HOUR_12` int NOT NULL DEFAULT '0',
  `HOUR_13` int NOT NULL DEFAULT '0',
  `HOUR_14` int NOT NULL DEFAULT '0',
  `HOUR_15` int NOT NULL DEFAULT '0',
  `HOUR_16` int NOT NULL DEFAULT '0',
  `HOUR_17` int NOT NULL DEFAULT '0',
  `HOUR_18` int NOT NULL DEFAULT '0',
  `HOUR_19` int NOT NULL DEFAULT '0',
  `HOUR_20` int NOT NULL DEFAULT '0',
  `HOUR_21` int NOT NULL DEFAULT '0',
  `HOUR_22` int NOT NULL DEFAULT '0',
  `HOUR_23` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content`
--

CREATE TABLE `b_search_content` (
  `ID` int NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CUSTOM_RANK` int NOT NULL DEFAULT '0',
  `USER_ID` int DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8mb3_unicode_ci,
  `TITLE` text COLLATE utf8mb3_unicode_ci,
  `BODY` longtext COLLATE utf8mb3_unicode_ci,
  `TAGS` text COLLATE utf8mb3_unicode_ci,
  `PARAM1` text COLLATE utf8mb3_unicode_ci,
  `PARAM2` text COLLATE utf8mb3_unicode_ci,
  `UPD` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_search_content`
--

INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(1, '2023-10-17 09:37:48', 'iblock', 'S1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=751&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=', 'Корпоративный выезд на косу', 'День рождения компании на косе.', NULL, 'photos', '1', NULL, NULL, NULL),
(2, '2023-10-17 09:37:48', 'iblock', '1', 0, NULL, 'IBLOCK_ELEMENT', '1', '=ID=1&EXTERNAL_ID=2865&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=1.jpg', '1.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(3, '2023-10-17 09:37:48', 'iblock', '2', 0, NULL, 'IBLOCK_ELEMENT', '2', '=ID=2&EXTERNAL_ID=2867&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=13.jpg', '13.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(4, '2023-10-17 09:37:48', 'iblock', '3', 0, NULL, 'IBLOCK_ELEMENT', '3', '=ID=3&EXTERNAL_ID=2868&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=18.jpg', '18.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(5, '2023-10-17 09:37:48', 'iblock', '4', 0, NULL, 'IBLOCK_ELEMENT', '4', '=ID=4&EXTERNAL_ID=2869&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=2.jpg', '2.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(6, '2023-10-17 09:37:48', 'iblock', '5', 0, NULL, 'IBLOCK_ELEMENT', '5', '=ID=5&EXTERNAL_ID=2874&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=38.jpg', '38.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(7, '2023-10-17 09:37:48', 'iblock', '6', 0, NULL, 'IBLOCK_ELEMENT', '6', '=ID=6&EXTERNAL_ID=2875&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=40.jpg', '40.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(8, '2023-10-17 09:37:48', 'iblock', '7', 0, NULL, 'IBLOCK_ELEMENT', '7', '=ID=7&EXTERNAL_ID=2877&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=48.jpg', '48.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(9, '2023-10-17 09:37:48', 'iblock', '8', 0, NULL, 'IBLOCK_ELEMENT', '8', '=ID=8&EXTERNAL_ID=2878&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=50.jpg', '50.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(10, '2023-10-17 09:37:48', 'iblock', '9', 0, NULL, 'IBLOCK_ELEMENT', '9', '=ID=9&EXTERNAL_ID=2879&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=photos&IBLOCK_ID=1&IBLOCK_CODE=photogallery_personal&IBLOCK_EXTERNAL_ID=photogallery_personal&CODE=8.jpg', '8.jpg', '', '', 'photos', '1', NULL, NULL, NULL),
(11, '2023-10-17 09:37:49', 'blog', 'B1', 0, NULL, NULL, NULL, NULL, 'Блог пользователя', 'Блог пользователя', NULL, 'BLOG', '1', NULL, NULL, NULL),
(12, '2023-10-17 09:37:49', 'blog', 'B2', 0, NULL, NULL, NULL, NULL, 'Блог для комментариев к фотографиям (s1)', 'Блог для комментариев к фотографиям (s1)', NULL, 'BLOG', '1', NULL, NULL, NULL),
(13, '2023-10-17 09:37:49', 'blog', 'P1', 0, 1, 'BLOG_POST', '1', NULL, 'Тайские зарисовки: Парк миллионолетних камней и крокодиловая ферма', 'Парк расположен не в самой Паттайе, но недалеко. Добраться до него можно: взяв экскурсию, взяв тук-тук или \"мотосай\", или самим на байке. 15 минут \"с ветерком\" и мы на месте.\nПарк камней - это красивый парк тропической растительности украшенный камнями самой разной формы. Некоторые камни - окаменевшие деревья.\nПарк небольшой и ухоженный. Разноцветье, пальмы, деревья в стиле бансай, лотосы. Все это причудливо переплетено и оформлено. Впервые увидел как расцветают пальмы. Удалось найти точку, где показаны три этапа выпуска пальмой листьев:\nВ центре парка - весьма симпатичная композиция: фонтан, камни, деревья, скульптуры.\nВ пруду у этой композиции водятся рыбки. Не просто рыбки, а море рыб! Их можно кормить. Здесь также есть и свой минизоопарк. \nКроме парка это \"предприятие\" занимается и разведением крокодилов.В парке регулярно проходят шоу с крокодилами.\nИх тоже можно покормить, и это увлекательное занятие. Пронести курицу перед носом, чтобы крокодил не успел ее схватить. Попробуйте, это не просто, они шустрые.\nРезюме: Парк - прекрасное место для отдыха. Место для сосредоточения, медитации, мечтаний, если хотите. Это красота, живая, неповторимая и впечатляющая.', 'Путешествия,Таиланд,Фото,Парк Камней', 'POST', '1', NULL, NULL, NULL),
(14, '2023-10-17 09:37:49', 'blog', 'P2', 0, 1, 'BLOG_POST', '2', NULL, 'Тайские зарисовки : Храм истины', 'Храм Истины - проект, призванный служить объединению людей ближайших соседей Таиланда: Камбоджи, Китая и Индии.\nВид с запада\nПроект частный, владелец потратил 1 млн долларов на начальный этап, сейчас проект финансируется за счет посетителей и частных взносов.\nИдея проекта - идеалистическая попытка объединения религий. Может и не так, но так поняли нашего гида. Названные страны имеют разные религии, своих богов. Храм выполнен в виде креста, каждый из концов креста посвящен одной стране. Внутренняя отделка выполнена в стиле каждой из религий с божествами этих стран. Гид ходила и рассказывала в каждом зале про каждое божество, но понималось плохо и потому почти ничего не запоминалось.Да, тайский инглиш - это еще отдельный разговор. Оставалось только любоваться.', 'Путешествия,Таиланд,Фото,Храм истины', 'POST', '1', NULL, NULL, NULL),
(15, '2023-10-17 09:37:49', 'blog', 'P3', 0, 1, 'BLOG_POST', '3', NULL, 'Авто в Испании', 'Наш Seat Ibica\nПри планировании поездки в Испанию (Санта Сюсанна) встал вопрос по аренде авто.\nАпартаменты в Сюсанне, самолет прилетает в Жирону, плюс желание съездить во Францию, Андорру, покататься по самой Испании. Так что аренда авто выглядело логичным решением. Анализируя сайты и отзывы понял, что самая большая проблема будет (для новичка) - слабое знание английского языка и полное незнание любого другого языка. Все условия аренды, даже на сайтах предоставляющих русскоязычный интерфейс для заказа, в лучшем случае - на английском, в худшем - на испанском (а рассматривались и испанские местные конторы). В таких условиях влететь в какую-то юридическую проблему - пару раз плюнуть. \nНам повезло. Воспользовавшись чужим опытом нашли русскоязычного посредника . (Маленький секрет: если заказывать авто не с русскоязычного, а с англоязычного интерфейса, то авто будет дешевле!) Сервис оказался на высоте. Что мы получили: \n1. Общаясь по Скайпу на \"великом и могучем\" детальное разъяснение юридических нюансов аренды авто. Для нас это было главнее денег.\n2. Заказ авто полностью под наши потребности: не дороже 300 евро на 13 дней. Заказывая машину эконом класса (типа Форд Ка) в конечном счете получили пятидверный Сеат Ибицу. Может по классу это и одно и тоже, но на заднее сиденье сыну не надо было корячится залезать. Анализ стоимостей в других компаниях показал, что это - выгодный заказ. \n3. Договоренность на депозит кешем. Это была наша просьба, которую менеджер выполнил, договорившись с арендодателем. Договоренностью мы не воспользовались, так как в последний момент стало известно, что депозит в апартаменты не нужно будет вносить и деньги высвободились. Вот, ждем разблокирования средств. \n4. Депозит показался нам немного большим - 560 евро, но так как авто вернули с полным баком и машина не повреждена, то это не имеет значения.\n5. В те же 300 евро общей оплаты вошла полная страховка. То есть при форс мажоре фирма снимала бы с депозита сумму, которую возвратила бы нам потом страховая компания. Обошлись без этого, несмотря на поездку в сильный ливень по сумасшедшему перинейскому серпантину, когда влететь куда-то было довольно просто.\nАнализируя впоследствии заказ, убедились в выгодности этого решения. Даже местные конторы не давали таких выгодных условий (чуть больше 22 евро в день с полной страховкой).\nЧто реально выиграно?\n1. Свобода передвижения - думаю в пояснениях не нуждается.\n2. Деньги. Одно такси от Жироны до Санта Сюсанны стоит 50 евро. То есть 100 евро с 300 списываем сразу. Поездки в Барселону, в Андорру, Перпиньян (Франция), по побережью можно делать, конечно, общественным транспортом. Но когда делаешь детальный подсчет по средствам, то явно авто окупается, несмотря на дополнительные траты на бензин и платные дороги.\nЧто было не так? Неудачно выбран тип авто. Ибица - машинка хорошая, но для города.\n1. Имеющийся в наличии дома Форд Мондео универсал с 1,8 движком полностью загруженный и забитым багажником на серпантине на Кавказе вел себя очень прилично. А вот Ибица с 1,4 движком оказалась слабовата для серпантина даже с пустым багажником, увы, но со второй передачи почти не слазил. Хотя на трассе Ибица ведет себя хорошо. Динамика страдает, но экономичность все окупает. \n2. Ужасно неудобная для серпантина передняя стойка, перекрывающая обзор слева. Приходилось постоянно изгибаться и изворачиваться..\nПроблемы с парковкой - это классика жанра для Европы. Это мы поняли в Перпиньяне, когда за неудачную парковку поплатились пешей эротической прогулкой до площадки эвакуатора и 100 евро. Впредь будем умнее, лучше заплатить за паркинг, честное слово. (Кстати, у французов странные представления о расстояниях. Все опрошеные, в том числе и полицеские, назвали километраж до стоянки в три - четырые раза меньше реального. Знали бы - взяли такси.)\nНа будущее выводы:\n1. Внимательнее подходить к выбору типа авто. Примерный план поездок есть всегда и если в нем есть горы, то лучше взять подороже, но помощнее.\n2. Не жалеть денег на парковку.\nБольше минусов нет в аренде авто. А плюсов.. для нас достаточно двух описанных.', 'Путешествия,Испания,Фото,Каникулы', 'POST', '1', NULL, NULL, NULL),
(16, '2023-10-17 09:37:49', 'blog', 'C1', 0, NULL, 'BLOG_COMMENT', '1', NULL, 'Отличная машина, у меня такая же', 'Отличная машина, у меня такая же', NULL, 'COMMENT', '1|3', NULL, NULL, NULL),
(17, '2023-10-17 09:37:49', 'blog', 'C2', 0, 1, 'BLOG_COMMENT', '2', NULL, 'Поздравляю', 'Поздравляю', NULL, 'COMMENT', '1|3', NULL, NULL, NULL),
(18, '2023-10-17 09:37:49', 'blog', 'C3', 0, NULL, 'BLOG_COMMENT', '3', NULL, 'Симпатичная девушка на фотографии :)', 'Симпатичная девушка на фотографии :)', NULL, 'COMMENT', '1|3', NULL, NULL, NULL),
(19, '2023-10-17 09:37:49', 'blog', 'C4', 0, 1, 'BLOG_COMMENT', '4', NULL, 'Спасибо ;)', 'Спасибо ;)', NULL, 'COMMENT', '1|3', NULL, NULL, NULL),
(20, '2023-10-17 09:37:49', 'blog', 'P4', 0, 1, 'BLOG_POST', '4', NULL, 'Итальянские каникулы: Бергамо', 'Бергамо. Этот пункт поездки получился случайно. Был вариант: Досидеть до самолета в Милане или в Бергамо. Так как день отлета - воскресение, в который итальянцы работать совсем не любят и начанают фактически только с обеда, то решили все же ехать в Бергамо, чтобы часть времени сэкономить на их пробуждении. И оказались и правы и не правы. \nПравы в том плане, что посмотрели новый красивый город. Не правы в том, что в провинциальных городках спят еще дольше. \nЧасов в 12 на улицах было еще мало народу, а в три дня народ повалил толпами.\nВид на верхний город\nБергамо - город, где мне хотелось бы остаться на пару тройку дней и обходить его весь. Огромная крепость на вершине холма, называемая верхний город, уютный и красивый нижний город. Ходил бы там до усталости полной. Воздух Альп давал силы, дышалось очень легко.\nВ чем-то город Бергамо похож на Милан. Множество магазинов, они более уютные, и цены пониже. Но настоящий шопинг можно в Италии сделать не будучи вообще ни в одном из городов. Просто прилетайте в Бергамо, выходите из аэропорта, переходите дорогу и к вашим услугам - сумасшедший по размерам торговый центр. На его стоянке я видел авто и с миланскими номерами. Здесь цены намного демократичнее, а с учетом рождественских скидок - можно говорить о каких-то покупках серьезных.\nРезюме поездки: Все получилось очень удачно. Поездка на авто дает свободу и возможности, которых нет в обычной турпоездке. Да и по деньгам все получилось намного дешевле, чем было бы в агентстве. \nНа следующие каникулы опять в Италию? Только на Юг уже: Бари, Неаполь...', 'Путешествия,Италия,Фото,Бергамо,Каникулы', 'POST', '1', NULL, NULL, NULL),
(21, '2023-10-17 09:37:49', 'blog', 'C5', 0, NULL, 'BLOG_COMMENT', '5', NULL, 'Отличный город, был в нем не раз', 'Отличный город, был в нем не раз', NULL, 'COMMENT', '1|4', NULL, NULL, NULL),
(22, '2023-10-17 09:37:49', 'blog', 'C6', 0, NULL, 'BLOG_COMMENT', '6', NULL, 'Во сколько обошлась поездка?', 'Во сколько обошлась поездка?', NULL, 'COMMENT', '1|4', NULL, NULL, NULL),
(23, '2023-10-17 09:37:50', 'blog', 'C7', 0, 1, 'BLOG_COMMENT', '7', NULL, '2000 евро с человека', '2000 евро с человека', NULL, 'COMMENT', '1|4', NULL, NULL, NULL),
(24, '2023-10-17 09:37:50', 'blog', 'P5', 0, 1, 'BLOG_POST', '5', NULL, 'Велопробег', 'Имея велосипед, им необходимо пользоваться. Давно уже напрашивалась дальняя поездка, и вот она состоялась.\nВперед!\nРовно в 9:00 команда стартанула.\nКоллектив большой, это оказалось имеет и плюсы и минусы. Плюс тот, что на дорогах водители авто к нам относились уважительно. Трудно не уважать колонну расстянувшуюся на полкилометра. Минусы - разношерстная группа с разным уровнем подготовки, потребности в долгих перекусах и поджиданиях отставших.\nКонечно, устали здорово. Но впечатления того стоят! При случае поедем еще и еще раз!\nИ на последок. Какой только техники мы там не несмотрелись у \"лосей\" и \"веломаньяков\". Но меня больше всего приколол шлем одного участника, который другие гонщики могут использовать как зеркало заднего вида!', 'Путешествия,Велопробеги,Фото', 'POST', '1', NULL, NULL, NULL),
(25, '2023-10-17 09:37:50', 'blog', 'C8', 0, NULL, 'BLOG_COMMENT', '8', NULL, 'Суперский отдых! Молодцы!', 'Суперский отдых! Молодцы!', NULL, 'COMMENT', '1|5', NULL, NULL, NULL),
(26, '2023-10-17 09:37:50', 'blog', 'C9', 0, NULL, 'BLOG_COMMENT', '9', NULL, 'А по какому маршруту вы ездили?', 'А по какому маршруту вы ездили?', NULL, 'COMMENT', '1|5', NULL, NULL, NULL),
(27, '2023-10-17 09:37:50', 'blog', 'C10', 0, 1, 'BLOG_COMMENT', '10', NULL, 'Калининград - Зеленоградск. По старой трассе.', 'Калининград - Зеленоградск. По старой трассе.', NULL, 'COMMENT', '1|5', NULL, NULL, NULL),
(28, '2023-10-17 09:37:53', 'blog', 'U1', 0, NULL, NULL, NULL, NULL, 'admin', '', NULL, 'USER', '1', NULL, NULL, NULL),
(29, '2023-10-17 10:39:27', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 1', 'Описание для анонса\r\nполный текст новости.', '', 'dynamic_content', '2', NULL, NULL, NULL),
(30, '2023-10-17 09:55:15', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Новости', '', '', '', '', NULL, NULL, NULL),
(31, '2023-10-17 10:39:34', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=11&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 2', 'Описание для анонса 2\r\nДетальное описание новости 2', '', 'dynamic_content', '2', NULL, NULL, NULL),
(32, '2023-10-18 12:14:04', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=12&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 3', 'Анонс новости 3\r\nДетальный текст новости 3', '', 'dynamic_content', '2', NULL, NULL, NULL),
(33, '2023-10-18 12:14:34', 'iblock', '13', 0, NULL, NULL, NULL, '=ID=13&EXTERNAL_ID=13&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 4', 'Анонс новости 4\r\nДетальный текст новости 4', '', 'dynamic_content', '2', NULL, NULL, NULL),
(34, '2023-10-18 12:15:00', 'iblock', '14', 0, NULL, NULL, NULL, '=ID=14&EXTERNAL_ID=14&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 5', 'Описание новости 5\r\nДетальный текст новости 5', '', 'dynamic_content', '2', NULL, NULL, NULL),
(35, '2023-10-18 12:15:43', 'iblock', '15', 0, NULL, NULL, NULL, '=ID=15&EXTERNAL_ID=15&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 6', 'Анонс новости 6\r\nДетальный текст новости 6', '', 'dynamic_content', '2', NULL, NULL, NULL),
(36, '2023-10-18 12:16:15', 'iblock', '16', 0, NULL, NULL, NULL, '=ID=16&EXTERNAL_ID=16&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 7', 'Анонс новости 7\r\nДетальный текст новости 7', '', 'dynamic_content', '2', NULL, NULL, NULL),
(37, '2023-10-18 12:17:22', 'iblock', '17', 0, NULL, NULL, NULL, '=ID=17&EXTERNAL_ID=17&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 8', 'Анонс новости 8\r\nДетальная новости 8', '', 'dynamic_content', '2', NULL, NULL, NULL),
(38, '2023-10-18 12:17:50', 'iblock', '18', 0, NULL, NULL, NULL, '=ID=18&EXTERNAL_ID=18&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 9', 'Анонс новости 9\r\nДетальная новости 9', '', 'dynamic_content', '2', NULL, NULL, NULL),
(39, '2023-10-18 12:18:20', 'iblock', '19', 0, NULL, NULL, NULL, '=ID=19&EXTERNAL_ID=19&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=dynamic_content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Новость 10', 'Анонс новости 10\r\nДетальная новости 10', '', 'dynamic_content', '2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_freq`
--

CREATE TABLE `b_search_content_freq` (
  `STEM` int NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_param`
--

CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_right`
--

CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_right`
--

INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
(1, 'G2'),
(2, 'G2'),
(3, 'G2'),
(4, 'G2'),
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(8, 'G2'),
(9, 'G2'),
(10, 'G2'),
(11, 'G2'),
(12, 'G2'),
(13, 'G2'),
(14, 'G2'),
(15, 'G2'),
(16, 'G2'),
(17, 'G2'),
(18, 'G2'),
(19, 'G2'),
(20, 'G2'),
(21, 'G2'),
(22, 'G2'),
(23, 'G2'),
(24, 'G2'),
(25, 'G2'),
(26, 'G2'),
(27, 'G2'),
(28, 'G2'),
(29, 'G1'),
(30, 'G2'),
(31, 'G1'),
(32, 'G1'),
(33, 'G1'),
(34, 'G1'),
(35, 'G1'),
(36, 'G1'),
(37, 'G1'),
(38, 'G1'),
(39, 'G1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_site`
--

CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URL` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_site`
--

INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
(1, 's1', ''),
(2, 's1', ''),
(3, 's1', ''),
(4, 's1', ''),
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(8, 's1', ''),
(9, 's1', ''),
(10, 's1', ''),
(11, 's1', '/'),
(12, 's1', '/'),
(13, 's1', '/1/'),
(14, 's1', '/2/'),
(15, 's1', '/3/'),
(16, 's1', '/3/'),
(17, 's1', '/3/'),
(18, 's1', '/3/'),
(19, 's1', '/3/'),
(20, 's1', '/4/'),
(21, 's1', '/4/'),
(22, 's1', '/4/'),
(23, 's1', '/4/'),
(24, 's1', '/5/'),
(25, 's1', '/5/'),
(26, 's1', '/5/'),
(27, 's1', '/5/'),
(28, 's1', '/users/1.php'),
(29, 's1', ''),
(30, 's1', ''),
(31, 's1', ''),
(32, 's1', ''),
(33, 's1', ''),
(34, 's1', ''),
(35, 's1', ''),
(36, 's1', ''),
(37, 's1', ''),
(38, 's1', ''),
(39, 's1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_stem`
--

CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `STEM` int NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_stem`
--

INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(1, 'ru', 1, 0.2314, 1),
(1, 'ru', 2, 0.2314, 2),
(1, 'ru', 3, 0.3667, 6.5),
(1, 'ru', 4, 0.2314, 5),
(1, 'ru', 5, 0.2314, 6),
(1, 'ru', 6, 0.2314, 7),
(2, 'ru', 7, 0.2314, 7),
(3, 'ru', 7, 0.2314, 7),
(3, 'ru', 8, 0.2314, 1),
(4, 'ru', 7, 0.2314, 7),
(4, 'ru', 9, 0.2314, 1),
(5, 'ru', 7, 0.2314, 7),
(6, 'ru', 7, 0.2314, 7),
(6, 'ru', 10, 0.2314, 1),
(7, 'ru', 7, 0.2314, 7),
(7, 'ru', 11, 0.2314, 1),
(8, 'ru', 7, 0.2314, 7),
(8, 'ru', 12, 0.2314, 1),
(9, 'ru', 7, 0.2314, 7),
(9, 'ru', 13, 0.2314, 1),
(10, 'ru', 7, 0.2314, 7),
(11, 'ru', 14, 0.3667, 2),
(11, 'ru', 15, 0.3667, 3),
(12, 'ru', 14, 0.3667, 4),
(12, 'ru', 16, 0.3667, 6),
(12, 'ru', 17, 0.5372, 6),
(12, 'ru', 18, 0.3667, 8),
(12, 'ru', 19, 0.3667, 9),
(13, 'ru', 20, 0.142, 1),
(13, 'ru', 21, 0.142, 2),
(13, 'ru', 22, 0.4911, 129.3),
(13, 'ru', 23, 0.142, 4),
(13, 'ru', 24, 0.3985, 105.5),
(13, 'ru', 25, 0.225, 103),
(13, 'ru', 26, 0.142, 8),
(13, 'ru', 27, 0.142, 10),
(13, 'ru', 28, 0.142, 14),
(13, 'ru', 29, 0.142, 16),
(13, 'ru', 30, 0.142, 22),
(13, 'ru', 31, 0.142, 24),
(13, 'ru', 32, 0.2839, 139.333),
(13, 'ru', 33, 0.225, 27),
(13, 'ru', 34, 0.142, 27),
(13, 'ru', 35, 0.142, 29),
(13, 'ru', 36, 0.142, 31),
(13, 'ru', 37, 0.142, 35),
(13, 'ru', 38, 0.142, 41),
(13, 'ru', 39, 0.142, 42),
(13, 'ru', 40, 0.142, 44),
(13, 'ru', 41, 0.2839, 192),
(13, 'ru', 42, 0.142, 58),
(13, 'ru', 43, 0.142, 60),
(13, 'ru', 44, 0.142, 61),
(13, 'ru', 45, 0.142, 62),
(13, 'ru', 46, 0.142, 65),
(13, 'ru', 47, 0.142, 66),
(13, 'ru', 48, 0.142, 72),
(13, 'ru', 49, 0.142, 75),
(13, 'ru', 50, 0.2839, 104),
(13, 'ru', 51, 0.142, 83),
(13, 'ru', 52, 0.142, 85),
(13, 'ru', 53, 0.142, 91),
(13, 'ru', 54, 0.2839, 114),
(13, 'ru', 55, 0.142, 95),
(13, 'ru', 56, 0.142, 96),
(13, 'ru', 57, 0.142, 97),
(13, 'ru', 58, 0.142, 105),
(13, 'ru', 59, 0.142, 106),
(13, 'ru', 60, 0.142, 108),
(13, 'ru', 61, 0.142, 114),
(13, 'ru', 62, 0.142, 115),
(13, 'ru', 63, 0.142, 117),
(13, 'ru', 64, 0.142, 124),
(13, 'ru', 65, 0.142, 125),
(13, 'ru', 66, 0.142, 126),
(13, 'ru', 67, 0.142, 128),
(13, 'ru', 68, 0.142, 129),
(13, 'ru', 69, 0.142, 130),
(13, 'ru', 70, 0.142, 131),
(13, 'ru', 71, 0.142, 133),
(13, 'ru', 72, 0.225, 133),
(13, 'ru', 73, 0.142, 135),
(13, 'ru', 74, 0.142, 138),
(13, 'ru', 75, 0.142, 139),
(13, 'ru', 76, 0.225, 147),
(13, 'ru', 77, 0.142, 141),
(13, 'ru', 78, 0.142, 144),
(13, 'ru', 79, 0.142, 151),
(13, 'ru', 80, 0.142, 155),
(13, 'ru', 81, 0.225, 160),
(13, 'ru', 82, 0.225, 205.5),
(13, 'ru', 83, 0.142, 166),
(13, 'ru', 84, 0.142, 167),
(13, 'ru', 85, 0.142, 175),
(13, 'ru', 86, 0.142, 181),
(13, 'ru', 87, 0.142, 182),
(13, 'ru', 88, 0.142, 186),
(13, 'ru', 89, 0.142, 192),
(13, 'ru', 90, 0.142, 195),
(13, 'ru', 91, 0.142, 196),
(13, 'ru', 92, 0.142, 198),
(13, 'ru', 93, 0.225, 205),
(13, 'ru', 94, 0.225, 217),
(13, 'ru', 95, 0.142, 207),
(13, 'ru', 96, 0.142, 208),
(13, 'ru', 97, 0.142, 209),
(13, 'ru', 98, 0.142, 220),
(13, 'ru', 99, 0.142, 223),
(13, 'ru', 100, 0.142, 224),
(13, 'ru', 101, 0.142, 230),
(13, 'ru', 102, 0.142, 231),
(13, 'ru', 103, 0.142, 232),
(13, 'ru', 104, 0.142, 233),
(13, 'ru', 105, 0.142, 237),
(13, 'ru', 106, 0.142, 239),
(13, 'ru', 107, 0.142, 245),
(13, 'ru', 108, 0.142, 250),
(13, 'ru', 109, 0.142, 256),
(13, 'ru', 110, 0.142, 259),
(13, 'ru', 111, 0.142, 262),
(13, 'ru', 112, 0.142, 270),
(13, 'ru', 113, 0.142, 271),
(13, 'ru', 114, 0.142, 272),
(13, 'ru', 115, 0.142, 281),
(13, 'ru', 116, 0.142, 282),
(13, 'ru', 117, 0.142, 283),
(13, 'ru', 118, 0.142, 285),
(13, 'ru', 119, 0.142, 291),
(13, 'ru', 120, 0.142, 292),
(13, 'ru', 121, 0.142, 293),
(14, 'ru', 20, 0.2386, 75),
(14, 'ru', 21, 0.1505, 2),
(14, 'ru', 46, 0.1505, 81),
(14, 'ru', 55, 0.1505, 111),
(14, 'ru', 69, 0.1505, 37),
(14, 'ru', 119, 0.1505, 169),
(14, 'ru', 120, 0.2386, 92.5),
(14, 'ru', 121, 0.1505, 171),
(14, 'ru', 122, 0.3495, 67.5),
(14, 'ru', 123, 0.301, 61),
(14, 'ru', 124, 0.3495, 32),
(14, 'ru', 125, 0.1505, 9),
(14, 'ru', 126, 0.1505, 10),
(14, 'ru', 127, 0.2386, 34),
(14, 'ru', 128, 0.1505, 12),
(14, 'ru', 129, 0.1505, 13),
(14, 'ru', 130, 0.1505, 14),
(14, 'ru', 131, 0.1505, 16),
(14, 'ru', 132, 0.1505, 17),
(14, 'ru', 133, 0.1505, 19),
(14, 'ru', 134, 0.2386, 59),
(14, 'ru', 135, 0.1505, 27),
(14, 'ru', 136, 0.2386, 37),
(14, 'ru', 137, 0.1505, 30),
(14, 'ru', 138, 0.1505, 31),
(14, 'ru', 139, 0.1505, 33),
(14, 'ru', 140, 0.1505, 34),
(14, 'ru', 141, 0.2386, 34),
(14, 'ru', 142, 0.1505, 36),
(14, 'ru', 143, 0.1505, 38),
(14, 'ru', 144, 0.1505, 40),
(14, 'ru', 145, 0.1505, 42),
(14, 'ru', 146, 0.1505, 43),
(14, 'ru', 147, 0.1505, 46),
(14, 'ru', 148, 0.2386, 46),
(14, 'ru', 149, 0.1505, 52),
(14, 'ru', 150, 0.1505, 55),
(14, 'ru', 151, 0.1505, 56),
(14, 'ru', 152, 0.301, 84.6667),
(14, 'ru', 153, 0.1505, 64),
(14, 'ru', 154, 0.1505, 70),
(14, 'ru', 155, 0.1505, 71),
(14, 'ru', 156, 0.2386, 98),
(14, 'ru', 157, 0.1505, 78),
(14, 'ru', 158, 0.301, 99.3333),
(14, 'ru', 159, 0.1505, 80),
(14, 'ru', 160, 0.1505, 84),
(14, 'ru', 161, 0.2386, 84),
(14, 'ru', 162, 0.2386, 100),
(14, 'ru', 163, 0.2386, 96),
(14, 'ru', 164, 0.3495, 117),
(14, 'ru', 165, 0.1505, 97),
(14, 'ru', 166, 0.2386, 97),
(14, 'ru', 167, 0.1505, 99),
(14, 'ru', 168, 0.1505, 100),
(14, 'ru', 169, 0.1505, 107),
(14, 'ru', 170, 0.1505, 108),
(14, 'ru', 171, 0.2386, 124.5),
(14, 'ru', 172, 0.1505, 125),
(14, 'ru', 173, 0.1505, 127),
(14, 'ru', 174, 0.1505, 130),
(14, 'ru', 175, 0.1505, 135),
(14, 'ru', 176, 0.1505, 136),
(14, 'ru', 177, 0.1505, 138),
(14, 'ru', 178, 0.1505, 139),
(14, 'ru', 179, 0.1505, 140),
(14, 'ru', 180, 0.1505, 142),
(14, 'ru', 181, 0.1505, 150),
(14, 'ru', 182, 0.1505, 154),
(14, 'ru', 183, 0.1505, 155),
(14, 'ru', 184, 0.1505, 161),
(14, 'ru', 185, 0.1505, 163),
(15, 'ru', 4, 0.1146, 500),
(15, 'ru', 6, 0.1816, 368),
(15, 'ru', 8, 0.1146, 239),
(15, 'ru', 13, 0.1146, 556),
(15, 'ru', 32, 0.1146, 585),
(15, 'ru', 67, 0.1816, 335),
(15, 'ru', 68, 0.1146, 847),
(15, 'ru', 82, 0.1146, 468),
(15, 'ru', 119, 0.1146, 959),
(15, 'ru', 121, 0.1146, 961),
(15, 'ru', 145, 0.1146, 255),
(15, 'ru', 153, 0.1146, 265),
(15, 'ru', 154, 0.1816, 424.5),
(15, 'ru', 155, 0.2291, 185.667),
(15, 'ru', 157, 0.1146, 842),
(15, 'ru', 158, 0.1146, 826),
(15, 'ru', 162, 0.1146, 325),
(15, 'ru', 168, 0.1816, 409),
(15, 'ru', 177, 0.1146, 442),
(15, 'ru', 178, 0.1146, 705),
(15, 'ru', 186, 0.424, 355.25),
(15, 'ru', 187, 0.266, 253.5),
(15, 'ru', 188, 0.1146, 5),
(15, 'ru', 189, 0.1146, 6),
(15, 'ru', 190, 0.1146, 8),
(15, 'ru', 191, 0.2291, 346.667),
(15, 'ru', 192, 0.1816, 282.5),
(15, 'ru', 193, 0.2291, 197.667),
(15, 'ru', 194, 0.1146, 14),
(15, 'ru', 195, 0.1146, 15),
(15, 'ru', 196, 0.2962, 257.4),
(15, 'ru', 197, 0.1816, 186),
(15, 'ru', 198, 0.1146, 27),
(15, 'ru', 199, 0.1146, 28),
(15, 'ru', 200, 0.1816, 290.5),
(15, 'ru', 201, 0.2291, 635.667),
(15, 'ru', 202, 0.1146, 32),
(15, 'ru', 203, 0.1146, 33),
(15, 'ru', 204, 0.1816, 308.5),
(15, 'ru', 205, 0.1816, 308),
(15, 'ru', 206, 0.1146, 37),
(15, 'ru', 207, 0.1146, 50),
(15, 'ru', 208, 0.1146, 51),
(15, 'ru', 209, 0.1816, 266.5),
(15, 'ru', 210, 0.1816, 266),
(15, 'ru', 211, 0.1816, 75),
(15, 'ru', 212, 0.1146, 61),
(15, 'ru', 213, 0.266, 466.75),
(15, 'ru', 214, 0.1816, 418.5),
(15, 'ru', 215, 0.2291, 195.333),
(15, 'ru', 216, 0.1146, 69),
(15, 'ru', 217, 0.1146, 71),
(15, 'ru', 218, 0.1146, 72),
(15, 'ru', 219, 0.1816, 87.5),
(15, 'ru', 220, 0.1816, 77),
(15, 'ru', 221, 0.266, 347),
(15, 'ru', 222, 0.1146, 77),
(15, 'ru', 223, 0.1146, 78),
(15, 'ru', 224, 0.1816, 185),
(15, 'ru', 225, 0.2291, 234),
(15, 'ru', 226, 0.1146, 92),
(15, 'ru', 227, 0.2291, 133.667),
(15, 'ru', 228, 0.1816, 129.5),
(15, 'ru', 229, 0.266, 274.5),
(15, 'ru', 230, 0.2291, 603.333),
(15, 'ru', 231, 0.1146, 99),
(15, 'ru', 232, 0.1146, 104),
(15, 'ru', 233, 0.1816, 109),
(15, 'ru', 234, 0.1146, 109),
(15, 'ru', 235, 0.1816, 300),
(15, 'ru', 236, 0.1816, 301),
(15, 'ru', 237, 0.1816, 293),
(15, 'ru', 238, 0.1146, 124),
(15, 'ru', 239, 0.1816, 163.5),
(15, 'ru', 240, 0.1146, 126),
(15, 'ru', 241, 0.1146, 128),
(15, 'ru', 242, 0.1816, 489.5),
(15, 'ru', 243, 0.1146, 130),
(15, 'ru', 244, 0.2291, 318.333),
(15, 'ru', 245, 0.1146, 137),
(15, 'ru', 246, 0.1816, 240),
(15, 'ru', 247, 0.1146, 144),
(15, 'ru', 248, 0.1146, 145),
(15, 'ru', 249, 0.1146, 146),
(15, 'ru', 250, 0.1146, 148),
(15, 'ru', 251, 0.1146, 154),
(15, 'ru', 252, 0.1146, 155),
(15, 'ru', 253, 0.1146, 157),
(15, 'ru', 254, 0.1146, 164),
(15, 'ru', 255, 0.1146, 169),
(15, 'ru', 256, 0.1146, 175),
(15, 'ru', 257, 0.1816, 434),
(15, 'ru', 258, 0.1146, 178),
(15, 'ru', 259, 0.1816, 221),
(15, 'ru', 260, 0.1816, 305),
(15, 'ru', 261, 0.1146, 195),
(15, 'ru', 262, 0.1146, 197),
(15, 'ru', 263, 0.1146, 199),
(15, 'ru', 264, 0.1816, 399),
(15, 'ru', 265, 0.1146, 201),
(15, 'ru', 266, 0.1146, 203),
(15, 'ru', 267, 0.1816, 203),
(15, 'ru', 268, 0.1816, 581),
(15, 'ru', 269, 0.1146, 215),
(15, 'ru', 270, 0.1816, 567),
(15, 'ru', 271, 0.1816, 448.5),
(15, 'ru', 272, 0.1146, 233),
(15, 'ru', 273, 0.1146, 235),
(15, 'ru', 274, 0.2291, 406.333),
(15, 'ru', 275, 0.3437, 494.286),
(15, 'ru', 276, 0.1146, 240),
(15, 'ru', 277, 0.1146, 246),
(15, 'ru', 278, 0.1816, 320),
(15, 'ru', 279, 0.1146, 248),
(15, 'ru', 280, 0.1816, 258),
(15, 'ru', 281, 0.2291, 587.333),
(15, 'ru', 282, 0.1816, 455.5),
(15, 'ru', 283, 0.1146, 252),
(15, 'ru', 284, 0.1816, 420.5),
(15, 'ru', 285, 0.1146, 257),
(15, 'ru', 286, 0.1146, 258),
(15, 'ru', 287, 0.266, 575),
(15, 'ru', 288, 0.1146, 275),
(15, 'ru', 289, 0.1146, 276),
(15, 'ru', 290, 0.1146, 277),
(15, 'ru', 291, 0.1146, 281),
(15, 'ru', 292, 0.1146, 282),
(15, 'ru', 293, 0.1146, 288),
(15, 'ru', 294, 0.1146, 289),
(15, 'ru', 295, 0.2291, 423),
(15, 'ru', 296, 0.1816, 322),
(15, 'ru', 297, 0.2291, 344.667),
(15, 'ru', 298, 0.1146, 313),
(15, 'ru', 299, 0.1146, 322),
(15, 'ru', 300, 0.1816, 380.5),
(15, 'ru', 301, 0.1146, 324),
(15, 'ru', 302, 0.1146, 326),
(15, 'ru', 303, 0.1146, 328),
(15, 'ru', 304, 0.1146, 341),
(15, 'ru', 305, 0.1146, 342),
(15, 'ru', 306, 0.1146, 343),
(15, 'ru', 307, 0.1146, 344),
(15, 'ru', 308, 0.1146, 350),
(15, 'ru', 309, 0.1146, 352),
(15, 'ru', 310, 0.1816, 448),
(15, 'ru', 311, 0.1146, 355),
(15, 'ru', 312, 0.1146, 362),
(15, 'ru', 313, 0.1146, 363),
(15, 'ru', 314, 0.1816, 482.5),
(15, 'ru', 315, 0.1146, 379),
(15, 'ru', 316, 0.1146, 382),
(15, 'ru', 317, 0.1146, 388),
(15, 'ru', 318, 0.1146, 391),
(15, 'ru', 319, 0.1146, 395),
(15, 'ru', 320, 0.1146, 399),
(15, 'ru', 321, 0.1146, 400),
(15, 'ru', 322, 0.1146, 413),
(15, 'ru', 323, 0.1146, 418),
(15, 'ru', 324, 0.1146, 419),
(15, 'ru', 325, 0.1816, 462),
(15, 'ru', 326, 0.1146, 430),
(15, 'ru', 327, 0.1146, 431),
(15, 'ru', 328, 0.1146, 432),
(15, 'ru', 329, 0.1146, 433),
(15, 'ru', 330, 0.1146, 436),
(15, 'ru', 331, 0.1146, 437),
(15, 'ru', 332, 0.1146, 439),
(15, 'ru', 333, 0.1146, 443),
(15, 'ru', 334, 0.1146, 450),
(15, 'ru', 335, 0.1816, 529.5),
(15, 'ru', 336, 0.1146, 457),
(15, 'ru', 337, 0.1146, 458),
(15, 'ru', 338, 0.1146, 460),
(15, 'ru', 339, 0.1146, 461),
(15, 'ru', 340, 0.266, 643.75),
(15, 'ru', 341, 0.1146, 465),
(15, 'ru', 342, 0.1146, 467),
(15, 'ru', 343, 0.1146, 475),
(15, 'ru', 344, 0.1146, 477),
(15, 'ru', 345, 0.1146, 491),
(15, 'ru', 346, 0.1146, 495),
(15, 'ru', 347, 0.1146, 497),
(15, 'ru', 348, 0.1816, 681),
(15, 'ru', 349, 0.1146, 511),
(15, 'ru', 350, 0.1146, 523),
(15, 'ru', 351, 0.1146, 524),
(15, 'ru', 352, 0.1146, 526),
(15, 'ru', 353, 0.1146, 528),
(15, 'ru', 354, 0.1146, 530),
(15, 'ru', 355, 0.1816, 705.5),
(15, 'ru', 356, 0.1146, 555),
(15, 'ru', 357, 0.1816, 683.5),
(15, 'ru', 358, 0.1146, 569),
(15, 'ru', 359, 0.1146, 570),
(15, 'ru', 360, 0.1146, 578),
(15, 'ru', 361, 0.1146, 581),
(15, 'ru', 362, 0.1146, 584),
(15, 'ru', 363, 0.1816, 591.5),
(15, 'ru', 364, 0.1146, 588),
(15, 'ru', 365, 0.1146, 589),
(15, 'ru', 366, 0.1146, 599),
(15, 'ru', 367, 0.1146, 603),
(15, 'ru', 368, 0.1816, 667.5),
(15, 'ru', 369, 0.1146, 608),
(15, 'ru', 370, 0.1146, 609),
(15, 'ru', 371, 0.1146, 611),
(15, 'ru', 372, 0.1146, 613),
(15, 'ru', 373, 0.1146, 614),
(15, 'ru', 374, 0.1816, 710.5),
(15, 'ru', 375, 0.1146, 630),
(15, 'ru', 376, 0.1146, 640),
(15, 'ru', 377, 0.1816, 680),
(15, 'ru', 378, 0.1146, 644),
(15, 'ru', 379, 0.1146, 656),
(15, 'ru', 380, 0.1146, 658),
(15, 'ru', 381, 0.1146, 659),
(15, 'ru', 382, 0.1146, 661),
(15, 'ru', 383, 0.1146, 662),
(15, 'ru', 384, 0.1816, 678.5),
(15, 'ru', 385, 0.1146, 668),
(15, 'ru', 386, 0.1146, 670),
(15, 'ru', 387, 0.1816, 685),
(15, 'ru', 388, 0.1146, 675),
(15, 'ru', 389, 0.1146, 676),
(15, 'ru', 390, 0.1146, 679),
(15, 'ru', 391, 0.1146, 693),
(15, 'ru', 392, 0.1146, 698),
(15, 'ru', 393, 0.1146, 700),
(15, 'ru', 394, 0.1146, 702),
(15, 'ru', 395, 0.1146, 703),
(15, 'ru', 396, 0.1146, 704),
(15, 'ru', 397, 0.1146, 707),
(15, 'ru', 398, 0.1146, 715),
(15, 'ru', 399, 0.1146, 717),
(15, 'ru', 400, 0.1146, 725),
(15, 'ru', 401, 0.1146, 726),
(15, 'ru', 402, 0.1146, 728),
(15, 'ru', 403, 0.1146, 742),
(15, 'ru', 404, 0.1146, 743),
(15, 'ru', 405, 0.1146, 746),
(15, 'ru', 406, 0.1146, 747),
(15, 'ru', 407, 0.1146, 748),
(15, 'ru', 408, 0.1146, 749),
(15, 'ru', 409, 0.1816, 750),
(15, 'ru', 410, 0.1146, 756),
(15, 'ru', 411, 0.1146, 757),
(15, 'ru', 412, 0.1146, 758),
(15, 'ru', 413, 0.1146, 760),
(15, 'ru', 414, 0.2291, 828.667),
(15, 'ru', 415, 0.1146, 776),
(15, 'ru', 416, 0.1146, 777),
(15, 'ru', 417, 0.1146, 779),
(15, 'ru', 418, 0.1146, 789),
(15, 'ru', 419, 0.1146, 794),
(15, 'ru', 420, 0.1146, 795),
(15, 'ru', 421, 0.1146, 796),
(15, 'ru', 422, 0.1146, 797),
(15, 'ru', 423, 0.1146, 799),
(15, 'ru', 424, 0.1146, 800),
(15, 'ru', 425, 0.1146, 809),
(15, 'ru', 426, 0.1146, 810),
(15, 'ru', 427, 0.1146, 811),
(15, 'ru', 428, 0.1146, 813),
(15, 'ru', 429, 0.1146, 815),
(15, 'ru', 430, 0.1146, 816),
(15, 'ru', 431, 0.1146, 817),
(15, 'ru', 432, 0.1146, 823),
(15, 'ru', 433, 0.1146, 825),
(15, 'ru', 434, 0.1816, 825),
(15, 'ru', 435, 0.1146, 827),
(15, 'ru', 436, 0.1146, 829),
(15, 'ru', 437, 0.1146, 836),
(15, 'ru', 438, 0.1146, 838),
(15, 'ru', 439, 0.1146, 839),
(15, 'ru', 440, 0.1146, 841),
(15, 'ru', 441, 0.1146, 843),
(15, 'ru', 442, 0.1146, 845),
(15, 'ru', 443, 0.1146, 849),
(15, 'ru', 444, 0.1146, 851),
(15, 'ru', 445, 0.1146, 858),
(15, 'ru', 446, 0.1146, 861),
(15, 'ru', 447, 0.1146, 869),
(15, 'ru', 448, 0.1146, 870),
(15, 'ru', 449, 0.1146, 877),
(15, 'ru', 450, 0.1146, 878),
(15, 'ru', 451, 0.1146, 880),
(15, 'ru', 452, 0.1146, 888),
(15, 'ru', 453, 0.1146, 889),
(15, 'ru', 454, 0.1146, 890),
(15, 'ru', 455, 0.1146, 892),
(15, 'ru', 456, 0.1146, 896),
(15, 'ru', 457, 0.1146, 898),
(15, 'ru', 458, 0.1146, 901),
(15, 'ru', 459, 0.1146, 902),
(15, 'ru', 460, 0.1146, 904),
(15, 'ru', 461, 0.1146, 917),
(15, 'ru', 462, 0.1146, 927),
(15, 'ru', 463, 0.1816, 927),
(15, 'ru', 464, 0.1146, 938),
(15, 'ru', 465, 0.1146, 951),
(15, 'ru', 466, 0.1146, 952),
(15, 'ru', 467, 0.1146, 953),
(15, 'ru', 468, 0.1146, 962),
(16, 'ru', 278, 0.2314, 2),
(16, 'ru', 469, 0.2314, 1),
(17, 'ru', 470, 0.2314, 1),
(18, 'ru', 18, 0.2314, 4),
(18, 'ru', 75, 0.2314, 1),
(18, 'ru', 471, 0.2314, 2),
(19, 'ru', 472, 0.2314, 1),
(20, 'ru', 4, 0.1345, 37),
(20, 'ru', 32, 0.2132, 263),
(20, 'ru', 42, 0.2132, 131.5),
(20, 'ru', 68, 0.1345, 126),
(20, 'ru', 73, 0.1345, 265),
(20, 'ru', 82, 0.1345, 247),
(20, 'ru', 86, 0.1345, 286),
(20, 'ru', 109, 0.1345, 307),
(20, 'ru', 119, 0.1345, 385),
(20, 'ru', 121, 0.1345, 387),
(20, 'ru', 134, 0.1345, 136),
(20, 'ru', 168, 0.1345, 239),
(20, 'ru', 172, 0.1345, 179),
(20, 'ru', 186, 0.2132, 298),
(20, 'ru', 191, 0.269, 212.667),
(20, 'ru', 198, 0.1345, 24),
(20, 'ru', 199, 0.1345, 248),
(20, 'ru', 221, 0.1345, 184),
(20, 'ru', 223, 0.1345, 47),
(20, 'ru', 241, 0.1345, 149),
(20, 'ru', 255, 0.1345, 342),
(20, 'ru', 257, 0.1345, 74),
(20, 'ru', 259, 0.269, 221),
(20, 'ru', 276, 0.1345, 151),
(20, 'ru', 300, 0.2132, 183.5),
(20, 'ru', 310, 0.1345, 338),
(20, 'ru', 338, 0.1345, 261),
(20, 'ru', 345, 0.1345, 192),
(20, 'ru', 350, 0.1345, 322),
(20, 'ru', 373, 0.1345, 255),
(20, 'ru', 378, 0.4264, 175.125),
(20, 'ru', 438, 0.2132, 94.5),
(20, 'ru', 442, 0.1345, 273),
(20, 'ru', 453, 0.1345, 88),
(20, 'ru', 468, 0.269, 248.667),
(20, 'ru', 473, 0.1345, 1),
(20, 'ru', 474, 0.4264, 134.875),
(20, 'ru', 475, 0.1345, 11),
(20, 'ru', 476, 0.1345, 14),
(20, 'ru', 477, 0.1345, 21),
(20, 'ru', 478, 0.1345, 22),
(20, 'ru', 479, 0.1345, 26),
(20, 'ru', 480, 0.1345, 38),
(20, 'ru', 481, 0.1345, 40),
(20, 'ru', 482, 0.1345, 43),
(20, 'ru', 483, 0.1345, 44),
(20, 'ru', 484, 0.1345, 45),
(20, 'ru', 485, 0.1345, 49),
(20, 'ru', 486, 0.1345, 50),
(20, 'ru', 487, 0.1345, 53),
(20, 'ru', 488, 0.1345, 55),
(20, 'ru', 489, 0.1345, 58),
(20, 'ru', 490, 0.1345, 62),
(20, 'ru', 491, 0.1345, 63),
(20, 'ru', 492, 0.1345, 64),
(20, 'ru', 493, 0.1345, 67),
(20, 'ru', 494, 0.3123, 85),
(20, 'ru', 495, 0.1345, 90),
(20, 'ru', 496, 0.1345, 91),
(20, 'ru', 497, 0.1345, 105),
(20, 'ru', 498, 0.1345, 106),
(20, 'ru', 499, 0.1345, 107),
(20, 'ru', 500, 0.1345, 109),
(20, 'ru', 501, 0.1345, 115),
(20, 'ru', 502, 0.2132, 115),
(20, 'ru', 503, 0.1345, 117),
(20, 'ru', 504, 0.1345, 119),
(20, 'ru', 505, 0.1345, 122),
(20, 'ru', 506, 0.2132, 125.5),
(20, 'ru', 507, 0.1345, 127),
(20, 'ru', 508, 0.1345, 129),
(20, 'ru', 509, 0.1345, 130),
(20, 'ru', 510, 0.2132, 152.5),
(20, 'ru', 511, 0.1345, 145),
(20, 'ru', 512, 0.1345, 147),
(20, 'ru', 513, 0.1345, 150),
(20, 'ru', 514, 0.1345, 153),
(20, 'ru', 515, 0.1345, 155),
(20, 'ru', 516, 0.1345, 161),
(20, 'ru', 517, 0.1345, 162),
(20, 'ru', 518, 0.1345, 164),
(20, 'ru', 519, 0.1345, 165),
(20, 'ru', 520, 0.1345, 166),
(20, 'ru', 521, 0.2132, 193.5),
(20, 'ru', 522, 0.1345, 172),
(20, 'ru', 523, 0.1345, 183),
(20, 'ru', 524, 0.1345, 190),
(20, 'ru', 525, 0.1345, 191),
(20, 'ru', 526, 0.1345, 193),
(20, 'ru', 527, 0.1345, 194),
(20, 'ru', 528, 0.1345, 196),
(20, 'ru', 529, 0.1345, 203),
(20, 'ru', 530, 0.1345, 206),
(20, 'ru', 531, 0.1345, 208),
(20, 'ru', 532, 0.1345, 214),
(20, 'ru', 533, 0.1345, 215),
(20, 'ru', 534, 0.2132, 215),
(20, 'ru', 535, 0.1345, 217),
(20, 'ru', 536, 0.2132, 253.5),
(20, 'ru', 537, 0.1345, 221),
(20, 'ru', 538, 0.1345, 228),
(20, 'ru', 539, 0.1345, 229),
(20, 'ru', 540, 0.269, 325.333),
(20, 'ru', 541, 0.1345, 233),
(20, 'ru', 542, 0.1345, 235),
(20, 'ru', 543, 0.1345, 236),
(20, 'ru', 544, 0.1345, 241),
(20, 'ru', 545, 0.1345, 251),
(20, 'ru', 546, 0.1345, 253),
(20, 'ru', 547, 0.1345, 254),
(20, 'ru', 548, 0.1345, 259),
(20, 'ru', 549, 0.1345, 263),
(20, 'ru', 550, 0.1345, 264),
(20, 'ru', 551, 0.1345, 275),
(20, 'ru', 552, 0.1345, 279),
(20, 'ru', 553, 0.1345, 280),
(20, 'ru', 554, 0.2132, 314.5),
(20, 'ru', 555, 0.1345, 289),
(20, 'ru', 556, 0.1345, 292),
(20, 'ru', 557, 0.1345, 293),
(20, 'ru', 558, 0.1345, 294),
(20, 'ru', 559, 0.1345, 297),
(20, 'ru', 560, 0.1345, 299),
(20, 'ru', 561, 0.1345, 300),
(20, 'ru', 562, 0.1345, 301),
(20, 'ru', 563, 0.1345, 312),
(20, 'ru', 564, 0.1345, 321),
(20, 'ru', 565, 0.1345, 324),
(20, 'ru', 566, 0.1345, 328),
(20, 'ru', 567, 0.1345, 329),
(20, 'ru', 568, 0.1345, 347),
(20, 'ru', 569, 0.1345, 354),
(20, 'ru', 570, 0.1345, 356),
(20, 'ru', 571, 0.1345, 366),
(20, 'ru', 572, 0.1345, 368),
(20, 'ru', 573, 0.1345, 369),
(21, 'ru', 242, 0.2314, 7),
(21, 'ru', 378, 0.2314, 2),
(21, 'ru', 456, 0.2314, 5),
(21, 'ru', 469, 0.2314, 1),
(22, 'ru', 191, 0.2314, 4),
(22, 'ru', 334, 0.2314, 3),
(22, 'ru', 574, 0.2314, 2),
(23, 'ru', 275, 0.2314, 2),
(23, 'ru', 575, 0.2314, 1),
(23, 'ru', 576, 0.2314, 4),
(24, 'ru', 46, 0.1591, 90),
(24, 'ru', 119, 0.1591, 180),
(24, 'ru', 121, 0.1591, 182),
(24, 'ru', 134, 0.1591, 174),
(24, 'ru', 168, 0.1591, 164),
(24, 'ru', 186, 0.1591, 63),
(24, 'ru', 191, 0.1591, 16),
(24, 'ru', 201, 0.2522, 53),
(24, 'ru', 213, 0.2522, 102),
(24, 'ru', 224, 0.1591, 167),
(24, 'ru', 231, 0.1591, 123),
(24, 'ru', 242, 0.1591, 128),
(24, 'ru', 244, 0.1591, 65),
(24, 'ru', 257, 0.1591, 46),
(24, 'ru', 272, 0.1591, 93),
(24, 'ru', 284, 0.1591, 105),
(24, 'ru', 288, 0.1591, 173),
(24, 'ru', 300, 0.1591, 166),
(24, 'ru', 320, 0.1591, 47),
(24, 'ru', 356, 0.1591, 116),
(24, 'ru', 373, 0.1591, 61),
(24, 'ru', 463, 0.2522, 68),
(24, 'ru', 577, 0.2522, 91),
(24, 'ru', 578, 0.1591, 2),
(24, 'ru', 579, 0.1591, 3),
(24, 'ru', 580, 0.1591, 5),
(24, 'ru', 581, 0.1591, 6),
(24, 'ru', 582, 0.1591, 12),
(24, 'ru', 583, 0.1591, 14),
(24, 'ru', 584, 0.1591, 15),
(24, 'ru', 585, 0.1591, 20),
(24, 'ru', 586, 0.1591, 26),
(24, 'ru', 587, 0.1591, 32),
(24, 'ru', 588, 0.1591, 35),
(24, 'ru', 589, 0.1591, 36),
(24, 'ru', 590, 0.1591, 37),
(24, 'ru', 591, 0.1591, 43),
(24, 'ru', 592, 0.1591, 58),
(24, 'ru', 593, 0.1591, 62),
(24, 'ru', 594, 0.1591, 66),
(24, 'ru', 595, 0.1591, 67),
(24, 'ru', 596, 0.1591, 73),
(24, 'ru', 597, 0.1591, 75),
(24, 'ru', 598, 0.1591, 76),
(24, 'ru', 599, 0.1591, 77),
(24, 'ru', 600, 0.1591, 79),
(24, 'ru', 601, 0.1591, 87),
(24, 'ru', 602, 0.1591, 88),
(24, 'ru', 603, 0.1591, 91),
(24, 'ru', 604, 0.1591, 92),
(24, 'ru', 605, 0.1591, 95),
(24, 'ru', 606, 0.1591, 96),
(24, 'ru', 607, 0.1591, 98),
(24, 'ru', 608, 0.1591, 99),
(24, 'ru', 609, 0.1591, 106),
(24, 'ru', 610, 0.1591, 107),
(24, 'ru', 611, 0.1591, 114),
(24, 'ru', 612, 0.1591, 115),
(24, 'ru', 613, 0.1591, 124),
(24, 'ru', 614, 0.1591, 136),
(24, 'ru', 615, 0.1591, 144),
(24, 'ru', 616, 0.1591, 148),
(24, 'ru', 617, 0.1591, 150),
(24, 'ru', 618, 0.1591, 152),
(24, 'ru', 619, 0.2522, 152),
(24, 'ru', 620, 0.1591, 161),
(24, 'ru', 621, 0.1591, 162),
(24, 'ru', 622, 0.1591, 163),
(24, 'ru', 623, 0.1591, 165),
(24, 'ru', 624, 0.1591, 168),
(24, 'ru', 625, 0.1591, 169),
(24, 'ru', 626, 0.1591, 170),
(24, 'ru', 627, 0.1591, 172),
(25, 'ru', 628, 0.2314, 1),
(25, 'ru', 629, 0.2314, 2),
(25, 'ru', 630, 0.2314, 8),
(26, 'ru', 631, 0.2314, 4),
(26, 'ru', 632, 0.2314, 6),
(27, 'ru', 398, 0.2314, 11),
(27, 'ru', 633, 0.2314, 1),
(27, 'ru', 634, 0.2314, 3),
(27, 'ru', 635, 0.2314, 10),
(28, 'ru', 636, 0.2314, 1),
(29, 'ru', 221, 0.2314, 6),
(29, 'ru', 637, 0.3667, 4.5),
(29, 'ru', 638, 0.2314, 3),
(29, 'ru', 639, 0.2314, 5),
(29, 'ru', 640, 0.2314, 7),
(30, 'ru', 637, 0.2314, 1),
(31, 'ru', 264, 0.2314, 7),
(31, 'ru', 637, 0.3667, 5),
(31, 'ru', 638, 0.3667, 5.5),
(31, 'ru', 639, 0.2314, 5),
(32, 'ru', 264, 0.2314, 6),
(32, 'ru', 637, 0.4628, 4.3333),
(32, 'ru', 639, 0.2314, 3),
(32, 'ru', 640, 0.2314, 7),
(33, 'ru', 264, 0.2314, 6),
(33, 'ru', 637, 0.4628, 4.3333),
(33, 'ru', 639, 0.2314, 3),
(33, 'ru', 640, 0.2314, 7),
(34, 'ru', 264, 0.2314, 6),
(34, 'ru', 637, 0.4628, 4.3333),
(34, 'ru', 638, 0.2314, 3),
(34, 'ru', 640, 0.2314, 7),
(35, 'ru', 264, 0.2314, 6),
(35, 'ru', 637, 0.4628, 4.3333),
(35, 'ru', 639, 0.2314, 3),
(35, 'ru', 640, 0.2314, 7),
(36, 'ru', 264, 0.2314, 6),
(36, 'ru', 637, 0.4628, 4.3333),
(36, 'ru', 639, 0.2314, 3),
(36, 'ru', 640, 0.2314, 7),
(37, 'ru', 264, 0.2314, 6),
(37, 'ru', 637, 0.4628, 4),
(37, 'ru', 639, 0.2314, 3),
(38, 'ru', 264, 0.2314, 6),
(38, 'ru', 637, 0.4628, 4),
(38, 'ru', 639, 0.2314, 3),
(39, 'ru', 264, 0.2314, 6),
(39, 'ru', 637, 0.4628, 4),
(39, 'ru', 639, 0.2314, 3),
(39, 'ru', 643, 0.4628, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_text`
--

CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_text`
--

INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(1, 'cf086aeb0d1566b7c11018de65ef527e', 'КОРПОРАТИВНЫЙ ВЫЕЗД НА КОСУ\r\nДЕНЬ РОЖДЕНИЯ КОМПАНИИ НА КОСЕ.\r\n'),
(2, 'f120910196e3705e9010462b771e217d', '1.JPG\r\n\r\n'),
(3, '1a52dc05dba0830c969389b575f39271', '13.JPG\r\n\r\n'),
(4, '30b1c80a61bfcf8828c2234200dd8dc8', '18.JPG\r\n\r\n'),
(5, '5374e953786a5d300aac6184daa054d5', '2.JPG\r\n\r\n'),
(6, '99afca8022344dd55a48c850a74807d9', '38.JPG\r\n\r\n'),
(7, 'dc26a96b6045e7ad9e6a1d86c8ee9a5e', '40.JPG\r\n\r\n'),
(8, 'a8923508e1f0eba209477e61529f7a06', '48.JPG\r\n\r\n'),
(9, 'ba1e2a997fa9800390a84dcd3cd0711d', '50.JPG\r\n\r\n'),
(10, '1b7b2e5f9721c6c4780d2ff96c92fdc3', '8.JPG\r\n\r\n'),
(11, '4a804a7d0302d24775c66d80c651bc4b', 'БЛОГ ПОЛЬЗОВАТЕЛЯ\r\nБЛОГ ПОЛЬЗОВАТЕЛЯ\r\n'),
(12, '322160a511f9f1d62bba40424020b310', 'БЛОГ ДЛЯ КОММЕНТАРИЕВ К ФОТОГРАФИЯМ (S1)\r\nБЛОГ ДЛЯ КОММЕНТАРИЕВ К ФОТОГРАФИЯМ (S1)\r\n'),
(13, '61a665a491d93c8a4308734fa7a529d7', 'ТАЙСКИЕ ЗАРИСОВКИ: ПАРК МИЛЛИОНОЛЕТНИХ КАМНЕЙ И КРОКОДИЛОВАЯ ФЕРМА\r\nПАРК РАСПОЛОЖЕН НЕ В САМОЙ ПАТТАЙЕ, НО НЕДАЛЕКО. ДОБРАТЬСЯ ДО НЕГО МОЖНО: ВЗЯВ ЭКСКУРСИЮ, ВЗЯВ ТУК-ТУК ИЛИ \"МОТОСАЙ\", ИЛИ САМИМ НА БАЙКЕ. 15 МИНУТ \"С ВЕТЕРКОМ\" И МЫ НА МЕСТЕ.\nПАРК КАМНЕЙ - ЭТО КРАСИВЫЙ ПАРК ТРОПИЧЕСКОЙ РАСТИТЕЛЬНОСТИ УКРАШЕННЫЙ КАМНЯМИ САМОЙ РАЗНОЙ ФОРМЫ. НЕКОТОРЫЕ КАМНИ - ОКАМЕНЕВШИЕ ДЕРЕВЬЯ.\nПАРК НЕБОЛЬШОЙ И УХОЖЕННЫЙ. РАЗНОЦВЕТЬЕ, ПАЛЬМЫ, ДЕРЕВЬЯ В СТИЛЕ БАНСАЙ, ЛОТОСЫ. ВСЕ ЭТО ПРИЧУДЛИВО ПЕРЕПЛЕТЕНО И ОФОРМЛЕНО. ВПЕРВЫЕ УВИДЕЛ КАК РАСЦВЕТАЮТ ПАЛЬМЫ. УДАЛОСЬ НАЙТИ ТОЧКУ, ГДЕ ПОКАЗАНЫ ТРИ ЭТАПА ВЫПУСКА ПАЛЬМОЙ ЛИСТЬЕВ:\nВ ЦЕНТРЕ ПАРКА - ВЕСЬМА СИМПАТИЧНАЯ КОМПОЗИЦИЯ: ФОНТАН, КАМНИ, ДЕРЕВЬЯ, СКУЛЬПТУРЫ.\nВ ПРУДУ У ЭТОЙ КОМПОЗИЦИИ ВОДЯТСЯ РЫБКИ. НЕ ПРОСТО РЫБКИ, А МОРЕ РЫБ! ИХ МОЖНО КОРМИТЬ. ЗДЕСЬ ТАКЖЕ ЕСТЬ И СВОЙ МИНИЗООПАРК. \nКРОМЕ ПАРКА ЭТО \"ПРЕДПРИЯТИЕ\" ЗАНИМАЕТСЯ И РАЗВЕДЕНИЕМ КРОКОДИЛОВ.В ПАРКЕ РЕГУЛЯРНО ПРОХОДЯТ ШОУ С КРОКОДИЛАМИ.\nИХ ТОЖЕ МОЖНО ПОКОРМИТЬ, И ЭТО УВЛЕКАТЕЛЬНОЕ ЗАНЯТИЕ. ПРОНЕСТИ КУРИЦУ ПЕРЕД НОСОМ, ЧТОБЫ КРОКОДИЛ НЕ УСПЕЛ ЕЕ СХВАТИТЬ. ПОПРОБУЙТЕ, ЭТО НЕ ПРОСТО, ОНИ ШУСТРЫЕ.\nРЕЗЮМЕ: ПАРК - ПРЕКРАСНОЕ МЕСТО ДЛЯ ОТДЫХА. МЕСТО ДЛЯ СОСРЕДОТОЧЕНИЯ, МЕДИТАЦИИ, МЕЧТАНИЙ, ЕСЛИ ХОТИТЕ. ЭТО КРАСОТА, ЖИВАЯ, НЕПОВТОРИМАЯ И ВПЕЧАТЛЯЮЩАЯ.\r\nПУТЕШЕСТВИЯ,ТАИЛАНД,ФОТО,ПАРК КАМНЕЙ'),
(14, 'bb1ff7bed56299fcf6cf231d6ea3b02d', 'ТАЙСКИЕ ЗАРИСОВКИ : ХРАМ ИСТИНЫ\r\nХРАМ ИСТИНЫ - ПРОЕКТ, ПРИЗВАННЫЙ СЛУЖИТЬ ОБЪЕДИНЕНИЮ ЛЮДЕЙ БЛИЖАЙШИХ СОСЕДЕЙ ТАИЛАНДА: КАМБОДЖИ, КИТАЯ И ИНДИИ.\nВИД С ЗАПАДА\nПРОЕКТ ЧАСТНЫЙ, ВЛАДЕЛЕЦ ПОТРАТИЛ 1 МЛН ДОЛЛАРОВ НА НАЧАЛЬНЫЙ ЭТАП, СЕЙЧАС ПРОЕКТ ФИНАНСИРУЕТСЯ ЗА СЧЕТ ПОСЕТИТЕЛЕЙ И ЧАСТНЫХ ВЗНОСОВ.\nИДЕЯ ПРОЕКТА - ИДЕАЛИСТИЧЕСКАЯ ПОПЫТКА ОБЪЕДИНЕНИЯ РЕЛИГИЙ. МОЖЕТ И НЕ ТАК, НО ТАК ПОНЯЛИ НАШЕГО ГИДА. НАЗВАННЫЕ СТРАНЫ ИМЕЮТ РАЗНЫЕ РЕЛИГИИ, СВОИХ БОГОВ. ХРАМ ВЫПОЛНЕН В ВИДЕ КРЕСТА, КАЖДЫЙ ИЗ КОНЦОВ КРЕСТА ПОСВЯЩЕН ОДНОЙ СТРАНЕ. ВНУТРЕННЯЯ ОТДЕЛКА ВЫПОЛНЕНА В СТИЛЕ КАЖДОЙ ИЗ РЕЛИГИЙ С БОЖЕСТВАМИ ЭТИХ СТРАН. ГИД ХОДИЛА И РАССКАЗЫВАЛА В КАЖДОМ ЗАЛЕ ПРО КАЖДОЕ БОЖЕСТВО, НО ПОНИМАЛОСЬ ПЛОХО И ПОТОМУ ПОЧТИ НИЧЕГО НЕ ЗАПОМИНАЛОСЬ.ДА, ТАЙСКИЙ ИНГЛИШ - ЭТО ЕЩЕ ОТДЕЛЬНЫЙ РАЗГОВОР. ОСТАВАЛОСЬ ТОЛЬКО ЛЮБОВАТЬСЯ.\r\nПУТЕШЕСТВИЯ,ТАИЛАНД,ФОТО,ХРАМ ИСТИНЫ'),
(15, 'aeb76b6528b6b7356d1decd86021cb65', 'АВТО В ИСПАНИИ\r\nНАШ SEAT IBICA\nПРИ ПЛАНИРОВАНИИ ПОЕЗДКИ В ИСПАНИЮ (САНТА СЮСАННА) ВСТАЛ ВОПРОС ПО АРЕНДЕ АВТО.\nАПАРТАМЕНТЫ В СЮСАННЕ, САМОЛЕТ ПРИЛЕТАЕТ В ЖИРОНУ, ПЛЮС ЖЕЛАНИЕ СЪЕЗДИТЬ ВО ФРАНЦИЮ, АНДОРРУ, ПОКАТАТЬСЯ ПО САМОЙ ИСПАНИИ. ТАК ЧТО АРЕНДА АВТО ВЫГЛЯДЕЛО ЛОГИЧНЫМ РЕШЕНИЕМ. АНАЛИЗИРУЯ САЙТЫ И ОТЗЫВЫ ПОНЯЛ, ЧТО САМАЯ БОЛЬШАЯ ПРОБЛЕМА БУДЕТ (ДЛЯ НОВИЧКА) - СЛАБОЕ ЗНАНИЕ АНГЛИЙСКОГО ЯЗЫКА И ПОЛНОЕ НЕЗНАНИЕ ЛЮБОГО ДРУГОГО ЯЗЫКА. ВСЕ УСЛОВИЯ АРЕНДЫ, ДАЖЕ НА САЙТАХ ПРЕДОСТАВЛЯЮЩИХ РУССКОЯЗЫЧНЫЙ ИНТЕРФЕЙС ДЛЯ ЗАКАЗА, В ЛУЧШЕМ СЛУЧАЕ - НА АНГЛИЙСКОМ, В ХУДШЕМ - НА ИСПАНСКОМ (А РАССМАТРИВАЛИСЬ И ИСПАНСКИЕ МЕСТНЫЕ КОНТОРЫ). В ТАКИХ УСЛОВИЯХ ВЛЕТЕТЬ В КАКУЮ-ТО ЮРИДИЧЕСКУЮ ПРОБЛЕМУ - ПАРУ РАЗ ПЛЮНУТЬ. \nНАМ ПОВЕЗЛО. ВОСПОЛЬЗОВАВШИСЬ ЧУЖИМ ОПЫТОМ НАШЛИ РУССКОЯЗЫЧНОГО ПОСРЕДНИКА . (МАЛЕНЬКИЙ СЕКРЕТ: ЕСЛИ ЗАКАЗЫВАТЬ АВТО НЕ С РУССКОЯЗЫЧНОГО, А С АНГЛОЯЗЫЧНОГО ИНТЕРФЕЙСА, ТО АВТО БУДЕТ ДЕШЕВЛЕ!) СЕРВИС ОКАЗАЛСЯ НА ВЫСОТЕ. ЧТО МЫ ПОЛУЧИЛИ: \n1. ОБЩАЯСЬ ПО СКАЙПУ НА \"ВЕЛИКОМ И МОГУЧЕМ\" ДЕТАЛЬНОЕ РАЗЪЯСНЕНИЕ ЮРИДИЧЕСКИХ НЮАНСОВ АРЕНДЫ АВТО. ДЛЯ НАС ЭТО БЫЛО ГЛАВНЕЕ ДЕНЕГ.\n2. ЗАКАЗ АВТО ПОЛНОСТЬЮ ПОД НАШИ ПОТРЕБНОСТИ: НЕ ДОРОЖЕ 300 ЕВРО НА 13 ДНЕЙ. ЗАКАЗЫВАЯ МАШИНУ ЭКОНОМ КЛАССА (ТИПА ФОРД КА) В КОНЕЧНОМ СЧЕТЕ ПОЛУЧИЛИ ПЯТИДВЕРНЫЙ СЕАТ ИБИЦУ. МОЖЕТ ПО КЛАССУ ЭТО И ОДНО И ТОЖЕ, НО НА ЗАДНЕЕ СИДЕНЬЕ СЫНУ НЕ НАДО БЫЛО КОРЯЧИТСЯ ЗАЛЕЗАТЬ. АНАЛИЗ СТОИМОСТЕЙ В ДРУГИХ КОМПАНИЯХ ПОКАЗАЛ, ЧТО ЭТО - ВЫГОДНЫЙ ЗАКАЗ. \n3. ДОГОВОРЕННОСТЬ НА ДЕПОЗИТ КЕШЕМ. ЭТО БЫЛА НАША ПРОСЬБА, КОТОРУЮ МЕНЕДЖЕР ВЫПОЛНИЛ, ДОГОВОРИВШИСЬ С АРЕНДОДАТЕЛЕМ. ДОГОВОРЕННОСТЬЮ МЫ НЕ ВОСПОЛЬЗОВАЛИСЬ, ТАК КАК В ПОСЛЕДНИЙ МОМЕНТ СТАЛО ИЗВЕСТНО, ЧТО ДЕПОЗИТ В АПАРТАМЕНТЫ НЕ НУЖНО БУДЕТ ВНОСИТЬ И ДЕНЬГИ ВЫСВОБОДИЛИСЬ. ВОТ, ЖДЕМ РАЗБЛОКИРОВАНИЯ СРЕДСТВ. \n4. ДЕПОЗИТ ПОКАЗАЛСЯ НАМ НЕМНОГО БОЛЬШИМ - 560 ЕВРО, НО ТАК КАК АВТО ВЕРНУЛИ С ПОЛНЫМ БАКОМ И МАШИНА НЕ ПОВРЕЖДЕНА, ТО ЭТО НЕ ИМЕЕТ ЗНАЧЕНИЯ.\n5. В ТЕ ЖЕ 300 ЕВРО ОБЩЕЙ ОПЛАТЫ ВОШЛА ПОЛНАЯ СТРАХОВКА. ТО ЕСТЬ ПРИ ФОРС МАЖОРЕ ФИРМА СНИМАЛА БЫ С ДЕПОЗИТА СУММУ, КОТОРУЮ ВОЗВРАТИЛА БЫ НАМ ПОТОМ СТРАХОВАЯ КОМПАНИЯ. ОБОШЛИСЬ БЕЗ ЭТОГО, НЕСМОТРЯ НА ПОЕЗДКУ В СИЛЬНЫЙ ЛИВЕНЬ ПО СУМАСШЕДШЕМУ ПЕРИНЕЙСКОМУ СЕРПАНТИНУ, КОГДА ВЛЕТЕТЬ КУДА-ТО БЫЛО ДОВОЛЬНО ПРОСТО.\nАНАЛИЗИРУЯ ВПОСЛЕДСТВИИ ЗАКАЗ, УБЕДИЛИСЬ В ВЫГОДНОСТИ ЭТОГО РЕШЕНИЯ. ДАЖЕ МЕСТНЫЕ КОНТОРЫ НЕ ДАВАЛИ ТАКИХ ВЫГОДНЫХ УСЛОВИЙ (ЧУТЬ БОЛЬШЕ 22 ЕВРО В ДЕНЬ С ПОЛНОЙ СТРАХОВКОЙ).\nЧТО РЕАЛЬНО ВЫИГРАНО?\n1. СВОБОДА ПЕРЕДВИЖЕНИЯ - ДУМАЮ В ПОЯСНЕНИЯХ НЕ НУЖДАЕТСЯ.\n2. ДЕНЬГИ. ОДНО ТАКСИ ОТ ЖИРОНЫ ДО САНТА СЮСАННЫ СТОИТ 50 ЕВРО. ТО ЕСТЬ 100 ЕВРО С 300 СПИСЫВАЕМ СРАЗУ. ПОЕЗДКИ В БАРСЕЛОНУ, В АНДОРРУ, ПЕРПИНЬЯН (ФРАНЦИЯ), ПО ПОБЕРЕЖЬЮ МОЖНО ДЕЛАТЬ, КОНЕЧНО, ОБЩЕСТВЕННЫМ ТРАНСПОРТОМ. НО КОГДА ДЕЛАЕШЬ ДЕТАЛЬНЫЙ ПОДСЧЕТ ПО СРЕДСТВАМ, ТО ЯВНО АВТО ОКУПАЕТСЯ, НЕСМОТРЯ НА ДОПОЛНИТЕЛЬНЫЕ ТРАТЫ НА БЕНЗИН И ПЛАТНЫЕ ДОРОГИ.\nЧТО БЫЛО НЕ ТАК? НЕУДАЧНО ВЫБРАН ТИП АВТО. ИБИЦА - МАШИНКА ХОРОШАЯ, НО ДЛЯ ГОРОДА.\n1. ИМЕЮЩИЙСЯ В НАЛИЧИИ ДОМА ФОРД МОНДЕО УНИВЕРСАЛ С 1,8 ДВИЖКОМ ПОЛНОСТЬЮ ЗАГРУЖЕННЫЙ И ЗАБИТЫМ БАГАЖНИКОМ НА СЕРПАНТИНЕ НА КАВКАЗЕ ВЕЛ СЕБЯ ОЧЕНЬ ПРИЛИЧНО. А ВОТ ИБИЦА С 1,4 ДВИЖКОМ ОКАЗАЛАСЬ СЛАБОВАТА ДЛЯ СЕРПАНТИНА ДАЖЕ С ПУСТЫМ БАГАЖНИКОМ, УВЫ, НО СО ВТОРОЙ ПЕРЕДАЧИ ПОЧТИ НЕ СЛАЗИЛ. ХОТЯ НА ТРАССЕ ИБИЦА ВЕДЕТ СЕБЯ ХОРОШО. ДИНАМИКА СТРАДАЕТ, НО ЭКОНОМИЧНОСТЬ ВСЕ ОКУПАЕТ. \n2. УЖАСНО НЕУДОБНАЯ ДЛЯ СЕРПАНТИНА ПЕРЕДНЯЯ СТОЙКА, ПЕРЕКРЫВАЮЩАЯ ОБЗОР СЛЕВА. ПРИХОДИЛОСЬ ПОСТОЯННО ИЗГИБАТЬСЯ И ИЗВОРАЧИВАТЬСЯ..\nПРОБЛЕМЫ С ПАРКОВКОЙ - ЭТО КЛАССИКА ЖАНРА ДЛЯ ЕВРОПЫ. ЭТО МЫ ПОНЯЛИ В ПЕРПИНЬЯНЕ, КОГДА ЗА НЕУДАЧНУЮ ПАРКОВКУ ПОПЛАТИЛИСЬ ПЕШЕЙ ЭРОТИЧЕСКОЙ ПРОГУЛКОЙ ДО ПЛОЩАДКИ ЭВАКУАТОРА И 100 ЕВРО. ВПРЕДЬ БУДЕМ УМНЕЕ, ЛУЧШЕ ЗАПЛАТИТЬ ЗА ПАРКИНГ, ЧЕСТНОЕ СЛОВО. (КСТАТИ, У ФРАНЦУЗОВ СТРАННЫЕ ПРЕДСТАВЛЕНИЯ О РАССТОЯНИЯХ. ВСЕ ОПРОШЕНЫЕ, В ТОМ ЧИСЛЕ И ПОЛИЦЕСКИЕ, НАЗВАЛИ КИЛОМЕТРАЖ ДО СТОЯНКИ В ТРИ - ЧЕТЫРЫЕ РАЗА МЕНЬШЕ РЕАЛЬНОГО. ЗНАЛИ БЫ - ВЗЯЛИ ТАКСИ.)\nНА БУДУЩЕЕ ВЫВОДЫ:\n1. ВНИМАТЕЛЬНЕЕ ПОДХОДИТЬ К ВЫБОРУ ТИПА АВТО. ПРИМЕРНЫЙ ПЛАН ПОЕЗДОК ЕСТЬ ВСЕГДА И ЕСЛИ В НЕМ ЕСТЬ ГОРЫ, ТО ЛУЧШЕ ВЗЯТЬ ПОДОРОЖЕ, НО ПОМОЩНЕЕ.\n2. НЕ ЖАЛЕТЬ ДЕНЕГ НА ПАРКОВКУ.\nБОЛЬШЕ МИНУСОВ НЕТ В АРЕНДЕ АВТО. А ПЛЮСОВ.. ДЛЯ НАС ДОСТАТОЧНО ДВУХ ОПИСАННЫХ.\r\nПУТЕШЕСТВИЯ,ИСПАНИЯ,ФОТО,КАНИКУЛЫ'),
(16, '2c8daeeaaf3fbfcbaaed24921bfd844f', 'ОТЛИЧНАЯ МАШИНА, У МЕНЯ ТАКАЯ ЖЕ\r\n'),
(17, '57c491c8f9bf20e17cb754aaa94fc2f1', 'ПОЗДРАВЛЯЮ\r\n'),
(18, 'e8045c254313e5e1666436c58d0236e2', 'СИМПАТИЧНАЯ ДЕВУШКА НА ФОТОГРАФИИ :)\r\n'),
(19, '50a6e36e8d991cc939398547683eeb18', 'СПАСИБО ;)\r\n'),
(20, 'c2e2edecb72902215e41ab0909b0a3fa', 'ИТАЛЬЯНСКИЕ КАНИКУЛЫ: БЕРГАМО\r\nБЕРГАМО. ЭТОТ ПУНКТ ПОЕЗДКИ ПОЛУЧИЛСЯ СЛУЧАЙНО. БЫЛ ВАРИАНТ: ДОСИДЕТЬ ДО САМОЛЕТА В МИЛАНЕ ИЛИ В БЕРГАМО. ТАК КАК ДЕНЬ ОТЛЕТА - ВОСКРЕСЕНИЕ, В КОТОРЫЙ ИТАЛЬЯНЦЫ РАБОТАТЬ СОВСЕМ НЕ ЛЮБЯТ И НАЧАНАЮТ ФАКТИЧЕСКИ ТОЛЬКО С ОБЕДА, ТО РЕШИЛИ ВСЕ ЖЕ ЕХАТЬ В БЕРГАМО, ЧТОБЫ ЧАСТЬ ВРЕМЕНИ СЭКОНОМИТЬ НА ИХ ПРОБУЖДЕНИИ. И ОКАЗАЛИСЬ И ПРАВЫ И НЕ ПРАВЫ. \nПРАВЫ В ТОМ ПЛАНЕ, ЧТО ПОСМОТРЕЛИ НОВЫЙ КРАСИВЫЙ ГОРОД. НЕ ПРАВЫ В ТОМ, ЧТО В ПРОВИНЦИАЛЬНЫХ ГОРОДКАХ СПЯТ ЕЩЕ ДОЛЬШЕ. \nЧАСОВ В 12 НА УЛИЦАХ БЫЛО ЕЩЕ МАЛО НАРОДУ, А В ТРИ ДНЯ НАРОД ПОВАЛИЛ ТОЛПАМИ.\nВИД НА ВЕРХНИЙ ГОРОД\nБЕРГАМО - ГОРОД, ГДЕ МНЕ ХОТЕЛОСЬ БЫ ОСТАТЬСЯ НА ПАРУ ТРОЙКУ ДНЕЙ И ОБХОДИТЬ ЕГО ВЕСЬ. ОГРОМНАЯ КРЕПОСТЬ НА ВЕРШИНЕ ХОЛМА, НАЗЫВАЕМАЯ ВЕРХНИЙ ГОРОД, УЮТНЫЙ И КРАСИВЫЙ НИЖНИЙ ГОРОД. ХОДИЛ БЫ ТАМ ДО УСТАЛОСТИ ПОЛНОЙ. ВОЗДУХ АЛЬП ДАВАЛ СИЛЫ, ДЫШАЛОСЬ ОЧЕНЬ ЛЕГКО.\nВ ЧЕМ-ТО ГОРОД БЕРГАМО ПОХОЖ НА МИЛАН. МНОЖЕСТВО МАГАЗИНОВ, ОНИ БОЛЕЕ УЮТНЫЕ, И ЦЕНЫ ПОНИЖЕ. НО НАСТОЯЩИЙ ШОПИНГ МОЖНО В ИТАЛИИ СДЕЛАТЬ НЕ БУДУЧИ ВООБЩЕ НИ В ОДНОМ ИЗ ГОРОДОВ. ПРОСТО ПРИЛЕТАЙТЕ В БЕРГАМО, ВЫХОДИТЕ ИЗ АЭРОПОРТА, ПЕРЕХОДИТЕ ДОРОГУ И К ВАШИМ УСЛУГАМ - СУМАСШЕДШИЙ ПО РАЗМЕРАМ ТОРГОВЫЙ ЦЕНТР. НА ЕГО СТОЯНКЕ Я ВИДЕЛ АВТО И С МИЛАНСКИМИ НОМЕРАМИ. ЗДЕСЬ ЦЕНЫ НАМНОГО ДЕМОКРАТИЧНЕЕ, А С УЧЕТОМ РОЖДЕСТВЕНСКИХ СКИДОК - МОЖНО ГОВОРИТЬ О КАКИХ-ТО ПОКУПКАХ СЕРЬЕЗНЫХ.\nРЕЗЮМЕ ПОЕЗДКИ: ВСЕ ПОЛУЧИЛОСЬ ОЧЕНЬ УДАЧНО. ПОЕЗДКА НА АВТО ДАЕТ СВОБОДУ И ВОЗМОЖНОСТИ, КОТОРЫХ НЕТ В ОБЫЧНОЙ ТУРПОЕЗДКЕ. ДА И ПО ДЕНЬГАМ ВСЕ ПОЛУЧИЛОСЬ НАМНОГО ДЕШЕВЛЕ, ЧЕМ БЫЛО БЫ В АГЕНТСТВЕ. \nНА СЛЕДУЮЩИЕ КАНИКУЛЫ ОПЯТЬ В ИТАЛИЮ? ТОЛЬКО НА ЮГ УЖЕ: БАРИ, НЕАПОЛЬ...\r\nПУТЕШЕСТВИЯ,ИТАЛИЯ,ФОТО,БЕРГАМО,КАНИКУЛЫ'),
(21, 'dbcd9a8e913758511efb3e248dfd26d8', 'ОТЛИЧНЫЙ ГОРОД, БЫЛ В НЕМ НЕ РАЗ\r\n'),
(22, '9f7b81a0a7a1baeae81a58ed306fc831', 'ВО СКОЛЬКО ОБОШЛАСЬ ПОЕЗДКА?\r\n'),
(23, 'dbd1fd97795d44ef2df50a9df933aceb', '2000 ЕВРО С ЧЕЛОВЕКА\r\n'),
(24, '5ac613b995b5aa8e2404a49f7c03862d', 'ВЕЛОПРОБЕГ\r\nИМЕЯ ВЕЛОСИПЕД, ИМ НЕОБХОДИМО ПОЛЬЗОВАТЬСЯ. ДАВНО УЖЕ НАПРАШИВАЛАСЬ ДАЛЬНЯЯ ПОЕЗДКА, И ВОТ ОНА СОСТОЯЛАСЬ.\nВПЕРЕД!\nРОВНО В 9:00 КОМАНДА СТАРТАНУЛА.\nКОЛЛЕКТИВ БОЛЬШОЙ, ЭТО ОКАЗАЛОСЬ ИМЕЕТ И ПЛЮСЫ И МИНУСЫ. ПЛЮС ТОТ, ЧТО НА ДОРОГАХ ВОДИТЕЛИ АВТО К НАМ ОТНОСИЛИСЬ УВАЖИТЕЛЬНО. ТРУДНО НЕ УВАЖАТЬ КОЛОННУ РАССТЯНУВШУЮСЯ НА ПОЛКИЛОМЕТРА. МИНУСЫ - РАЗНОШЕРСТНАЯ ГРУППА С РАЗНЫМ УРОВНЕМ ПОДГОТОВКИ, ПОТРЕБНОСТИ В ДОЛГИХ ПЕРЕКУСАХ И ПОДЖИДАНИЯХ ОТСТАВШИХ.\nКОНЕЧНО, УСТАЛИ ЗДОРОВО. НО ВПЕЧАТЛЕНИЯ ТОГО СТОЯТ! ПРИ СЛУЧАЕ ПОЕДЕМ ЕЩЕ И ЕЩЕ РАЗ!\nИ НА ПОСЛЕДОК. КАКОЙ ТОЛЬКО ТЕХНИКИ МЫ ТАМ НЕ НЕСМОТРЕЛИСЬ У \"ЛОСЕЙ\" И \"ВЕЛОМАНЬЯКОВ\". НО МЕНЯ БОЛЬШЕ ВСЕГО ПРИКОЛОЛ ШЛЕМ ОДНОГО УЧАСТНИКА, КОТОРЫЙ ДРУГИЕ ГОНЩИКИ МОГУТ ИСПОЛЬЗОВАТЬ КАК ЗЕРКАЛО ЗАДНЕГО ВИДА!\r\nПУТЕШЕСТВИЯ,ВЕЛОПРОБЕГИ,ФОТО'),
(25, '346867581844779d7690918ea737af2a', 'СУПЕРСКИЙ ОТДЫХ! МОЛОДЦЫ!\r\n'),
(26, '2474a636d7dff0571bd306681d5d7615', 'А ПО КАКОМУ МАРШРУТУ ВЫ ЕЗДИЛИ?\r\n'),
(27, 'c80ad9b53cb5b2141aa093b1dbf05bf2', 'КАЛИНИНГРАД - ЗЕЛЕНОГРАДСК. ПО СТАРОЙ ТРАССЕ.\r\n'),
(28, 'ae6a7829b96f1a1c44f57d79429b8109', 'ADMIN\r\n\r\n'),
(29, 'b61e3ca9cbbfc41a3a1731afd44dc803', 'НОВОСТЬ 1\r\nОПИСАНИЕ ДЛЯ АНОНСА\r\nПОЛНЫЙ ТЕКСТ НОВОСТИ.\r\n'),
(30, '626a5d1bd18fcc622fbe4e4e3619a88a', 'НОВОСТИ\r\n\r\n'),
(31, '40d79cc883f2d8920a55107be1f009f1', 'НОВОСТЬ 2\r\nОПИСАНИЕ ДЛЯ АНОНСА 2\r\nДЕТАЛЬНОЕ ОПИСАНИЕ НОВОСТИ 2\r\n'),
(32, 'db5f36b00ee1ee1bb484e846e7436744', 'НОВОСТЬ 3\r\nАНОНС НОВОСТИ 3\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 3\r\n'),
(33, 'eece5398b389e671eeb47c7ec7377ccb', 'НОВОСТЬ 4\r\nАНОНС НОВОСТИ 4\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 4\r\n'),
(34, '78babfc3b89c13aa3252f7c70a23500a', 'НОВОСТЬ 5\r\nОПИСАНИЕ НОВОСТИ 5\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 5\r\n'),
(35, '9f33cc62d44f39f3ea57cfce521086e9', 'НОВОСТЬ 6\r\nАНОНС НОВОСТИ 6\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 6\r\n'),
(36, 'c25816265372c0bfdbd45defc8db2165', 'НОВОСТЬ 7\r\nАНОНС НОВОСТИ 7\r\nДЕТАЛЬНЫЙ ТЕКСТ НОВОСТИ 7\r\n'),
(37, 'aff3cd14015277bac8b5a41c3f7b7ede', 'НОВОСТЬ 8\r\nАНОНС НОВОСТИ 8\r\nДЕТАЛЬНАЯ НОВОСТИ 8\r\n'),
(38, '0ac6bc8c94be3b36a8aac957a92690fe', 'НОВОСТЬ 9\r\nАНОНС НОВОСТИ 9\r\nДЕТАЛЬНАЯ НОВОСТИ 9\r\n'),
(39, '727d676697a6fc5751f2352a7e498f76', 'НОВОСТЬ 10\r\nАНОНС НОВОСТИ 10\r\nДЕТАЛЬНАЯ НОВОСТИ 10\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_title`
--

CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `POS` int NOT NULL,
  `WORD` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_title`
--

INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
(1, 's1', 14, 'ВЫЕЗД'),
(1, 's1', 0, 'КОРПОРАТИВНЫЙ'),
(1, 's1', 23, 'КОСУ'),
(1, 's1', 20, 'НА'),
(2, 's1', 0, '1'),
(2, 's1', 2, 'JPG'),
(3, 's1', 0, '13'),
(3, 's1', 3, 'JPG'),
(4, 's1', 0, '18'),
(4, 's1', 3, 'JPG'),
(5, 's1', 0, '2'),
(5, 's1', 2, 'JPG'),
(6, 's1', 0, '38'),
(6, 's1', 3, 'JPG'),
(7, 's1', 0, '40'),
(7, 's1', 3, 'JPG'),
(8, 's1', 0, '48'),
(8, 's1', 3, 'JPG'),
(9, 's1', 0, '50'),
(9, 's1', 3, 'JPG'),
(10, 's1', 0, '8'),
(10, 's1', 2, 'JPG'),
(11, 's1', 0, 'БЛОГ'),
(11, 's1', 5, 'ПОЛЬЗОВАТЕЛЯ'),
(12, 's1', 37, 'S1'),
(12, 's1', 0, 'БЛОГ'),
(12, 's1', 5, 'ДЛЯ'),
(12, 's1', 9, 'К'),
(12, 's1', 9, 'КОММЕНТАРИЕВ'),
(12, 's1', 24, 'ФОТОГРАФИЯМ'),
(13, 's1', 8, 'ЗАРИСОВКИ'),
(13, 's1', 5, 'И'),
(13, 's1', 39, 'КАМНЕЙ'),
(13, 's1', 48, 'КРОКОДИЛОВАЯ'),
(13, 's1', 24, 'МИЛЛИОНОЛЕТНИХ'),
(13, 's1', 19, 'ПАРК'),
(13, 's1', 0, 'ТАЙСКИЕ'),
(13, 's1', 61, 'ФЕРМА'),
(14, 's1', 8, 'ЗАРИСОВКИ'),
(14, 's1', 25, 'ИСТИНЫ'),
(14, 's1', 0, 'ТАЙСКИЕ'),
(14, 's1', 20, 'ХРАМ'),
(15, 's1', 0, 'АВТО'),
(15, 's1', 1, 'В'),
(15, 's1', 7, 'ИСПАНИИ'),
(20, 's1', 22, 'БЕРГАМО'),
(20, 's1', 0, 'ИТАЛЬЯНСКИЕ'),
(20, 's1', 12, 'КАНИКУЛЫ'),
(24, 's1', 0, 'ВЕЛОПРОБЕГ'),
(28, 's1', 0, 'ADMIN'),
(29, 's1', 8, '1'),
(29, 's1', 0, 'НОВОСТЬ'),
(30, 's1', 0, 'НОВОСТИ'),
(31, 's1', 8, '2'),
(31, 's1', 0, 'НОВОСТЬ'),
(32, 's1', 8, '3'),
(32, 's1', 0, 'НОВОСТЬ'),
(33, 's1', 8, '4'),
(33, 's1', 0, 'НОВОСТЬ'),
(34, 's1', 8, '5'),
(34, 's1', 0, 'НОВОСТЬ'),
(35, 's1', 8, '6'),
(35, 's1', 0, 'НОВОСТЬ'),
(36, 's1', 8, '7'),
(36, 's1', 0, 'НОВОСТЬ'),
(37, 's1', 8, '8'),
(37, 's1', 0, 'НОВОСТЬ'),
(38, 's1', 8, '9'),
(38, 's1', 0, 'НОВОСТЬ'),
(39, 's1', 8, '10'),
(39, 's1', 0, 'НОВОСТЬ');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_custom_rank`
--

CREATE TABLE `b_search_custom_rank` (
  `ID` int NOT NULL,
  `APPLIED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8mb3_unicode_ci,
  `PARAM2` text COLLATE utf8mb3_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_phrase`
--

CREATE TABLE `b_search_phrase` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RESULT_COUNT` int NOT NULL,
  `PAGES` int NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8mb3_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_search_phrase`
--

INSERT INTO `b_search_phrase` (`ID`, `TIMESTAMP_X`, `SITE_ID`, `RESULT_COUNT`, `PAGES`, `SESSION_ID`, `PHRASE`, `TAGS`, `URL_TO`, `URL_TO_404`, `URL_TO_SITE_ID`, `STAT_SESS_ID`, `EVENT1`) VALUES
(1, '2023-10-17 11:12:53', 's1', 1, 1, '73dc05483413cb5f986f755e51362d27', NULL, 'Храм истины', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_stem`
--

CREATE TABLE `b_search_stem` (
  `ID` int NOT NULL,
  `STEM` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_search_stem`
--

INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
(588, '00'),
(643, '10'),
(357, '100'),
(503, '12'),
(8, '13'),
(38, '15'),
(9, '18'),
(575, '2000'),
(347, '22'),
(274, '300'),
(10, '38'),
(11, '40'),
(12, '48'),
(13, '50'),
(316, '560'),
(636, 'ADMIN'),
(642, 'HERE'),
(189, 'IBICA'),
(7, 'JPG'),
(19, 'S1'),
(188, 'SEAT'),
(641, 'TEXT'),
(186, 'АВТ'),
(568, 'АГЕНТСТВ'),
(525, 'АЛЬП'),
(293, 'АНАЛИЗ'),
(210, 'АНАЛИЗИРУ'),
(219, 'АНГЛИЙСК'),
(254, 'АНГЛОЯЗЫЧН'),
(205, 'АНДОРР'),
(639, 'АНОНС'),
(197, 'АПАРТАМЕНТ'),
(196, 'АРЕНД'),
(303, 'АРЕНДОДАТЕЛ'),
(546, 'АЭРОПОРТ'),
(387, 'БАГАЖНИК'),
(37, 'БАЙК'),
(318, 'БАК'),
(56, 'БАНСА'),
(572, 'БАР'),
(360, 'БАРСЕЛОН'),
(371, 'БЕНЗИН'),
(474, 'БЕРГАМ'),
(129, 'БЛИЖАЙШ'),
(14, 'БЛОГ'),
(161, 'БОГ'),
(160, 'БОГОВ'),
(171, 'БОЖЕСТВ'),
(535, 'БОЛ'),
(213, 'БОЛЬШ'),
(426, 'БУД'),
(215, 'БУДЕТ'),
(542, 'БУДУЧ'),
(447, 'БУДУЩ'),
(477, 'ВАРИАНТ'),
(515, 'ВЕ'),
(399, 'ВЕДЕТ'),
(389, 'ВЕЛ'),
(262, 'ВЕЛИК'),
(619, 'ВЕЛОМАНЬЯК'),
(618, 'ВЕЛОМАНЬЯКОВ'),
(577, 'ВЕЛОПРОБЕГ'),
(579, 'ВЕЛОСИПЕД'),
(317, 'ВЕРНУЛ'),
(510, 'ВЕРХН'),
(518, 'ВЕРШИН'),
(74, 'ВЕСЬМ'),
(40, 'ВЕТЕРК'),
(148, 'ВЗНОС'),
(147, 'ВЗНОСОВ'),
(33, 'ВЗЯВ'),
(446, 'ВЗЯЛ'),
(458, 'ВЗЯТ'),
(134, 'ВИД'),
(551, 'ВИДЕЛ'),
(137, 'ВЛАДЕЛЕЦ'),
(237, 'ВЛЕТЕТ'),
(449, 'ВНИМАТЕЛЬН'),
(309, 'ВНОС'),
(169, 'ВНУТРЕН'),
(80, 'ВОД'),
(593, 'ВОДИТЕЛ'),
(332, 'ВОЗВРАТ'),
(524, 'ВОЗДУХ'),
(565, 'ВОЗМОЖН'),
(543, 'ВООБЩ'),
(195, 'ВОПРОС'),
(481, 'ВОСКРЕСЕН'),
(246, 'ВОСПОЛЬЗОВА'),
(324, 'ВОШЛ'),
(61, 'ВПЕРВ'),
(586, 'ВПЕРЕД'),
(611, 'ВПЕЧАТЛЕН'),
(118, 'ВПЕЧАТЛЯ'),
(343, 'ВПОСЛЕДСТВ'),
(425, 'ВПРЕД'),
(491, 'ВРЕМЕН'),
(620, 'ВСЕГ'),
(455, 'ВСЕГД'),
(194, 'ВСТАЛ'),
(395, 'ВТОР'),
(451, 'ВЫБОР'),
(375, 'ВЫБРА'),
(448, 'ВЫВОД'),
(207, 'ВЫГЛЯДЕЛ'),
(295, 'ВЫГОДН'),
(2, 'ВЫЕЗД'),
(349, 'ВЫИГРА'),
(162, 'ВЫПОЛН'),
(70, 'ВЫПУСК'),
(311, 'ВЫСВОБОД'),
(258, 'ВЫСОТ'),
(545, 'ВЫХОД'),
(156, 'ГИД'),
(269, 'ГЛАВН'),
(559, 'ГОВОР'),
(624, 'ГОНЩИК'),
(457, 'ГОР'),
(378, 'ГОРОД'),
(498, 'ГОРОДК'),
(544, 'ГОРОДОВ'),
(602, 'ГРУПП'),
(345, 'ДАВА'),
(582, 'ДАВН'),
(564, 'ДАЕТ'),
(584, 'ДАЛЬН'),
(384, 'ДВИЖК'),
(466, 'ДВУХ'),
(471, 'ДЕВУШК'),
(363, 'ДЕЛА'),
(555, 'ДЕМОКРАТИЧН'),
(4, 'ДЕН'),
(270, 'ДЕНЕГ'),
(310, 'ДЕНЬГ'),
(297, 'ДЕПОЗ'),
(330, 'ДЕПОЗИТ'),
(50, 'ДЕРЕВ'),
(264, 'ДЕТАЛЬН'),
(255, 'ДЕШЕВЛ'),
(400, 'ДИНАМИК'),
(276, 'ДНЕ'),
(507, 'ДНЯ'),
(30, 'ДОБРА'),
(342, 'ДОВОЛЬН'),
(302, 'ДОГОВОР'),
(296, 'ДОГОВОРЕН'),
(605, 'ДОЛГ'),
(141, 'ДОЛЛАР'),
(140, 'ДОЛЛАРОВ'),
(500, 'ДОЛЬШ'),
(381, 'ДОМ'),
(369, 'ДОПОЛНИТЕЛЬН'),
(373, 'ДОРОГ'),
(273, 'ДОРОЖ'),
(478, 'ДОСИДЕТ'),
(465, 'ДОСТАТОЧН'),
(224, 'ДРУГ'),
(352, 'ДУМА'),
(527, 'ДЫША'),
(275, 'ЕВР'),
(417, 'ЕВРОП'),
(632, 'ЕЗД'),
(489, 'ЕХА'),
(461, 'ЖАЛЕТ'),
(416, 'ЖАНР'),
(312, 'ЖДЕМ'),
(202, 'ЖЕЛАН'),
(116, 'ЖИВ'),
(200, 'ЖИРОН'),
(386, 'ЗАБИТ'),
(385, 'ЗАГРУЖЕН'),
(288, 'ЗАДН'),
(229, 'ЗАКАЗ'),
(277, 'ЗАКАЗЫВ'),
(253, 'ЗАКАЗЫВА'),
(174, 'ЗАЛ'),
(292, 'ЗАЛЕЗА'),
(91, 'ЗАНИМА'),
(100, 'ЗАНЯТ'),
(135, 'ЗАПАД'),
(428, 'ЗАПЛАТ'),
(180, 'ЗАПОМИНА'),
(21, 'ЗАРИСОВК'),
(86, 'ЗДЕ'),
(610, 'ЗДОРОВ'),
(634, 'ЗЕЛЕНОГРАДСК'),
(627, 'ЗЕРКА'),
(445, 'ЗНАЛ'),
(218, 'ЗНАН'),
(321, 'ЗНАЧЕН'),
(287, 'ИБИЦ'),
(149, 'ИДЕ'),
(150, 'ИДЕАЛИСТИЧЕСК'),
(307, 'ИЗВЕСТН'),
(413, 'ИЗВОРАЧИВА'),
(412, 'ИЗГИБА'),
(578, 'ИМЕ'),
(320, 'ИМЕЕТ'),
(159, 'ИМЕЮТ'),
(379, 'ИМЕЮЩ'),
(181, 'ИНГЛИШ'),
(133, 'ИНД'),
(228, 'ИНТЕРФЕЙС'),
(187, 'ИСПАН'),
(233, 'ИСПАНСК'),
(626, 'ИСПОЛЬЗОВА'),
(123, 'ИСТИН'),
(540, 'ИТАЛ'),
(473, 'ИТАЛЬЯНСК'),
(482, 'ИТАЛЬЯНЦ'),
(283, 'КА'),
(388, 'КАВКАЗ'),
(164, 'КАЖД'),
(560, 'КАКИХ-Т'),
(238, 'КАКУЮ-Т'),
(633, 'КАЛИНИНГРАД'),
(131, 'КАМБОДЖ'),
(24, 'КАМН'),
(468, 'КАНИКУЛ'),
(298, 'КЕШ'),
(441, 'КИЛОМЕТРАЖ'),
(132, 'КИТ'),
(280, 'КЛАСС'),
(415, 'КЛАССИК'),
(591, 'КОЛЛЕКТ'),
(598, 'КОЛОН'),
(589, 'КОМАНД'),
(17, 'КОММЕНТАР'),
(16, 'КОММЕНТАРИЕВ'),
(6, 'КОМПАН'),
(76, 'КОМПОЗИЦ'),
(284, 'КОНЕЧН'),
(236, 'КОНТОР'),
(166, 'КОНЦ'),
(165, 'КОНЦОВ'),
(85, 'КОРМ'),
(1, 'КОРПОРАТИВН'),
(291, 'КОРЯЧ'),
(3, 'КОС'),
(300, 'КОТОР'),
(42, 'КРАСИВ'),
(115, 'КРАСОТ'),
(517, 'КРЕПОСТ'),
(163, 'КРЕСТ'),
(94, 'КРОКОД'),
(93, 'КРОКОДИЛ'),
(25, 'КРОКОДИЛОВ'),
(89, 'КРОМ'),
(432, 'КСТАТ'),
(341, 'КУДА-Т'),
(102, 'КУРИЦ'),
(528, 'ЛЕГК'),
(337, 'ЛИВЕН'),
(72, 'ЛИСТ'),
(71, 'ЛИСТЬЕВ'),
(208, 'ЛОГИЧН'),
(617, 'ЛОС'),
(57, 'ЛОТОС'),
(230, 'ЛУЧШ'),
(223, 'ЛЮБ'),
(185, 'ЛЮБОВА'),
(128, 'ЛЮД'),
(534, 'МАГАЗИН'),
(533, 'МАГАЗИНОВ'),
(327, 'МАЖОР'),
(505, 'МАЛ'),
(251, 'МАЛЕНЬК'),
(631, 'МАРШРУТ'),
(278, 'МАШИН'),
(376, 'МАШИНК'),
(113, 'МЕДИТАЦ'),
(301, 'МЕНЕДЖЕР'),
(444, 'МЕНЬШ'),
(41, 'МЕСТ'),
(235, 'МЕСТН'),
(114, 'МЕЧТАН'),
(531, 'МИЛА'),
(479, 'МИЛАН'),
(552, 'МИЛАНСК'),
(23, 'МИЛЛИОНОЛЕТН'),
(88, 'МИНИЗООПАРК'),
(463, 'МИНУС'),
(462, 'МИНУСОВ'),
(39, 'МИНУТ'),
(139, 'МЛН'),
(532, 'МНОЖЕСТВ'),
(625, 'МОГУТ'),
(263, 'МОГУЧ'),
(153, 'МОЖЕТ'),
(32, 'МОЖН'),
(630, 'МОЛОДЦ'),
(305, 'МОМЕНТ'),
(382, 'МОНДЕ'),
(83, 'МОР'),
(36, 'МОТОСА'),
(157, 'НАЗВА'),
(520, 'НАЗЫВА'),
(65, 'НАЙТ'),
(380, 'НАЛИЧ'),
(244, 'НАМ'),
(554, 'НАМН'),
(583, 'НАПРАШИВА'),
(506, 'НАРОД'),
(268, 'НАС'),
(538, 'НАСТОЯ'),
(142, 'НАЧАЛЬН'),
(485, 'НАЧАНА'),
(155, 'НАШ'),
(249, 'НАШЛ'),
(573, 'НЕАПОЛ'),
(51, 'НЕБОЛЬШ'),
(31, 'НЕГ'),
(29, 'НЕДАЛЕК'),
(222, 'НЕЗНАН'),
(48, 'НЕКОТОР'),
(456, 'НЕМ'),
(315, 'НЕМН'),
(580, 'НЕОБХОДИМ'),
(117, 'НЕПОВТОРИМ'),
(335, 'НЕСМОТР'),
(616, 'НЕСМОТРЕЛ'),
(374, 'НЕУДАЧН'),
(404, 'НЕУДОБН'),
(522, 'НИЖН'),
(179, 'НИЧ'),
(496, 'НОВ'),
(216, 'НОВИЧК'),
(637, 'НОВОСТ'),
(553, 'НОМЕР'),
(104, 'НОС'),
(354, 'НУЖДА'),
(308, 'НУЖН'),
(267, 'НЮАНС'),
(266, 'НЮАНСОВ'),
(487, 'ОБЕД'),
(408, 'ОБЗОР'),
(334, 'ОБОШЛ'),
(514, 'ОБХОД'),
(260, 'ОБЩ'),
(364, 'ОБЩЕСТВЕН'),
(127, 'ОБЪЕДИНЕН'),
(566, 'ОБЫЧН'),
(516, 'ОГРОМН'),
(168, 'ОДН'),
(257, 'ОКАЗА'),
(49, 'ОКАМЕНЕВШ'),
(368, 'ОКУПА'),
(467, 'ОПИСА'),
(638, 'ОПИСАН'),
(323, 'ОПЛАТ'),
(437, 'ОПРОШЕН'),
(248, 'ОПЫТ'),
(570, 'ОПЯ'),
(512, 'ОСТА'),
(184, 'ОСТАВА'),
(629, 'ОТД'),
(170, 'ОТДЕЛК'),
(182, 'ОТДЕЛЬН'),
(111, 'ОТДЫХ'),
(212, 'ОТЗЫВ'),
(480, 'ОТЛЕТ'),
(469, 'ОТЛИЧН'),
(594, 'ОТНОС'),
(608, 'ОТСТА'),
(60, 'ОФОРМЛ'),
(54, 'ПАЛЬМ'),
(241, 'ПАР'),
(22, 'ПАРК'),
(429, 'ПАРКИНГ'),
(414, 'ПАРКОВК'),
(28, 'ПАТТАЙ'),
(103, 'ПЕРЕД'),
(396, 'ПЕРЕДАЧ'),
(351, 'ПЕРЕДВИЖЕН'),
(405, 'ПЕРЕДН'),
(407, 'ПЕРЕКРЫВА'),
(606, 'ПЕРЕКУС'),
(59, 'ПЕРЕПЛЕТ'),
(547, 'ПЕРЕХОД'),
(339, 'ПЕРИНЕЙСК'),
(361, 'ПЕРПИНЬЯ'),
(418, 'ПЕРПИНЬЯН'),
(420, 'ПЕШ'),
(453, 'ПЛАН'),
(190, 'ПЛАНИРОВАН'),
(372, 'ПЛАТН'),
(176, 'ПЛОХ'),
(423, 'ПЛОЩАДК'),
(243, 'ПЛЮНУТ'),
(201, 'ПЛЮС'),
(464, 'ПЛЮСОВ'),
(362, 'ПОБЕРЕЖ'),
(508, 'ПОВАЛ'),
(245, 'ПОВЕЗЛ'),
(319, 'ПОВРЕЖД'),
(604, 'ПОДГОТОВК'),
(607, 'ПОДЖИДАН'),
(459, 'ПОДОРОЖ'),
(366, 'ПОДСЧЕТ'),
(450, 'ПОДХОД'),
(613, 'ПОЕД'),
(191, 'ПОЕЗДК'),
(454, 'ПОЕЗДОК'),
(470, 'ПОЗДРАВЛЯ'),
(67, 'ПОКАЗА'),
(206, 'ПОКАТА'),
(98, 'ПОКОРМ'),
(561, 'ПОКУПК'),
(440, 'ПОЛИЦЕСК'),
(600, 'ПОЛКИЛОМЕТР'),
(221, 'ПОЛН'),
(271, 'ПОЛНОСТ'),
(259, 'ПОЛУЧ'),
(581, 'ПОЛЬЗОВА'),
(15, 'ПОЛЬЗОВАТЕЛ'),
(460, 'ПОМОЩН'),
(537, 'ПОНИЖ'),
(175, 'ПОНИМА'),
(154, 'ПОНЯ'),
(419, 'ПОПЛАТ'),
(107, 'ПОПРОБ'),
(151, 'ПОПЫТК'),
(167, 'ПОСВЯЩ'),
(146, 'ПОСЕТИТЕЛ'),
(304, 'ПОСЛЕДН'),
(614, 'ПОСЛЕДОК'),
(495, 'ПОСМОТРЕЛ'),
(250, 'ПОСРЕДНИК'),
(411, 'ПОСТОЯ'),
(177, 'ПОТ'),
(138, 'ПОТРАТ'),
(272, 'ПОТРЕБН'),
(530, 'ПОХОЖ'),
(178, 'ПОЧТ'),
(353, 'ПОЯСНЕН'),
(494, 'ПРАВ'),
(226, 'ПРЕДОСТАВЛЯ'),
(90, 'ПРЕДПРИЯТ'),
(435, 'ПРЕДСТАВЛЕН'),
(110, 'ПРЕКРАСН'),
(125, 'ПРИЗВА'),
(621, 'ПРИКОЛОЛ'),
(199, 'ПРИЛЕТА'),
(390, 'ПРИЛИЧН'),
(452, 'ПРИМЕРН'),
(410, 'ПРИХОД'),
(58, 'ПРИЧУДЛИВ'),
(240, 'ПРОБЛ'),
(214, 'ПРОБЛЕМ'),
(493, 'ПРОБУЖДЕН'),
(497, 'ПРОВИНЦИАЛЬН'),
(422, 'ПРОГУЛК'),
(124, 'ПРОЕКТ'),
(101, 'ПРОНЕСТ'),
(82, 'ПРОСТ'),
(299, 'ПРОСЬБ'),
(96, 'ПРОХОД'),
(79, 'ПРУД'),
(475, 'ПУНКТ'),
(392, 'ПУСТ'),
(119, 'ПУТЕШЕСТВ'),
(285, 'ПЯТИДВЕРН'),
(483, 'РАБОТА'),
(242, 'РАЗ'),
(313, 'РАЗБЛОКИРОВАН'),
(92, 'РАЗВЕДЕН'),
(183, 'РАЗГОВОР'),
(549, 'РАЗМЕР'),
(46, 'РАЗН'),
(53, 'РАЗНОЦВЕТ'),
(601, 'РАЗНОШЕРСТН'),
(265, 'РАЗЪЯСНЕН'),
(27, 'РАСПОЛОЖ'),
(173, 'РАССКАЗЫВА'),
(234, 'РАССМАТРИВА'),
(436, 'РАССТОЯН'),
(599, 'РАССТЯНУВШ'),
(44, 'РАСТИТЕЛЬН'),
(63, 'РАСЦВЕТА'),
(348, 'РЕАЛЬН'),
(95, 'РЕГУЛЯРН'),
(109, 'РЕЗЮМ'),
(152, 'РЕЛИГ'),
(488, 'РЕШ'),
(209, 'РЕШЕН'),
(587, 'РОВН'),
(5, 'РОЖДЕН'),
(557, 'РОЖДЕСТВЕНСК'),
(227, 'РУССКОЯЗЫЧН'),
(84, 'РЫБ'),
(81, 'РЫБК'),
(211, 'САЙТ'),
(198, 'САМОЛЕТ'),
(192, 'САНТ'),
(350, 'СВОБОД'),
(541, 'СДЕЛА'),
(286, 'СЕАТ'),
(143, 'СЕЙЧАС'),
(252, 'СЕКРЕТ'),
(256, 'СЕРВИС'),
(340, 'СЕРПАНТИН'),
(562, 'СЕРЬЕЗН'),
(289, 'СИДЕН'),
(526, 'СИЛ'),
(336, 'СИЛЬН'),
(75, 'СИМПАТИЧН'),
(261, 'СКАЙП'),
(558, 'СКИДОК'),
(574, 'СКОЛЬК'),
(78, 'СКУЛЬПТУР'),
(217, 'СЛАБ'),
(391, 'СЛАБОВАТ'),
(397, 'СЛАЗ'),
(409, 'СЛЕВ'),
(569, 'СЛЕД'),
(431, 'СЛОВ'),
(126, 'СЛУЖ'),
(231, 'СЛУЧА'),
(476, 'СЛУЧАЙН'),
(329, 'СНИМА'),
(394, 'СО'),
(484, 'СОВС'),
(130, 'СОСЕД'),
(112, 'СОСРЕДОТОЧЕН'),
(585, 'СОСТОЯ'),
(472, 'СПАСИБ'),
(358, 'СПИСЫВА'),
(499, 'СПЯТ'),
(359, 'СРАЗ'),
(314, 'СРЕДСТВ'),
(306, 'СТАЛ'),
(635, 'СТАР'),
(590, 'СТАРТАНУЛ'),
(55, 'СТИЛ'),
(356, 'СТО'),
(294, 'СТОИМОСТ'),
(406, 'СТОЙК'),
(442, 'СТОЯНК'),
(401, 'СТРАДА'),
(158, 'СТРАН'),
(333, 'СТРАХОВ'),
(325, 'СТРАХОВК'),
(338, 'СУМАСШЕДШ'),
(331, 'СУММ'),
(628, 'СУПЕРСК'),
(106, 'СХВАТ'),
(145, 'СЧЕТ'),
(203, 'СЪЕЗД'),
(290, 'СЫН'),
(492, 'СЭКОНОМ'),
(193, 'СЮСАН'),
(120, 'ТАИЛАНД'),
(20, 'ТАЙСК'),
(87, 'ТАКЖ'),
(355, 'ТАКС'),
(322, 'ТЕ'),
(640, 'ТЕКСТ'),
(615, 'ТЕХНИК'),
(281, 'ТИП'),
(612, 'ТОГ'),
(509, 'ТОЛП'),
(438, 'ТОМ'),
(550, 'ТОРГОВ'),
(592, 'ТОТ'),
(66, 'ТОЧК'),
(365, 'ТРАНСПОРТ'),
(398, 'ТРАСС'),
(370, 'ТРАТ'),
(68, 'ТРИ'),
(513, 'ТРОЙК'),
(43, 'ТРОПИЧЕСК'),
(596, 'ТРУДН'),
(35, 'ТУК-ТУК'),
(567, 'ТУРПОЕЗДК'),
(344, 'УБЕД'),
(393, 'УВ'),
(597, 'УВАЖА'),
(595, 'УВАЖИТЕЛЬН'),
(62, 'УВИДЕЛ'),
(99, 'УВЛЕКАТЕЛЬН'),
(64, 'УДА'),
(563, 'УДАЧН'),
(403, 'УЖАСН'),
(45, 'УКРАШЕН'),
(504, 'УЛИЦ'),
(427, 'УМН'),
(383, 'УНИВЕРСА'),
(603, 'УРОВН'),
(225, 'УСЛОВ'),
(548, 'УСЛУГ'),
(105, 'УСПЕЛ'),
(609, 'УСТА'),
(523, 'УСТАЛ'),
(52, 'УХОЖЕН'),
(623, 'УЧАСТНИК'),
(556, 'УЧЕТ'),
(521, 'УЮТН'),
(486, 'ФАКТИЧЕСК'),
(26, 'ФЕРМ'),
(144, 'ФИНАНСИР'),
(328, 'ФИРМ'),
(77, 'ФОНТА'),
(282, 'ФОРД'),
(47, 'ФОРМ'),
(326, 'ФОРС'),
(121, 'ФОТ'),
(18, 'ФОТОГРАФ'),
(204, 'ФРАНЦ'),
(434, 'ФРАНЦУЗ'),
(433, 'ФРАНЦУЗОВ'),
(172, 'ХОД'),
(519, 'ХОЛМ'),
(377, 'ХОРОШ'),
(511, 'ХОТЕЛ'),
(122, 'ХРАМ'),
(232, 'ХУДШ'),
(536, 'ЦЕН'),
(73, 'ЦЕНТР'),
(502, 'ЧАС'),
(501, 'ЧАСОВ'),
(490, 'ЧАСТ'),
(136, 'ЧАСТН'),
(576, 'ЧЕЛОВЕК'),
(529, 'ЧЕМ-Т'),
(430, 'ЧЕСТН'),
(443, 'ЧЕТЫР'),
(439, 'ЧИСЛ'),
(247, 'ЧУЖ'),
(346, 'ЧУТ'),
(622, 'ШЛЕМ'),
(97, 'ШО'),
(539, 'ШОПИНГ'),
(108, 'ШУСТР'),
(424, 'ЭВАКУАТОР'),
(279, 'ЭКОН'),
(402, 'ЭКОНОМИЧН'),
(34, 'ЭКСКУРС'),
(421, 'ЭРОТИЧЕСК'),
(69, 'ЭТАП'),
(571, 'ЮГ'),
(239, 'ЮРИДИЧЕСК'),
(367, 'ЯВН'),
(220, 'ЯЗЫК');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_suggest`
--

CREATE TABLE `b_search_suggest` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_tags`
--

CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_tags`
--

INSERT INTO `b_search_tags` (`SEARCH_CONTENT_ID`, `SITE_ID`, `NAME`) VALUES
(20, 's1', 'Бергамо'),
(24, 's1', 'Велопробеги'),
(15, 's1', 'Испания'),
(20, 's1', 'Италия'),
(15, 's1', 'Каникулы'),
(20, 's1', 'Каникулы'),
(13, 's1', 'Парк Камней'),
(13, 's1', 'Путешествия'),
(14, 's1', 'Путешествия'),
(15, 's1', 'Путешествия'),
(20, 's1', 'Путешествия'),
(24, 's1', 'Путешествия'),
(13, 's1', 'Таиланд'),
(14, 's1', 'Таиланд'),
(13, 's1', 'Фото'),
(14, 's1', 'Фото'),
(15, 's1', 'Фото'),
(20, 's1', 'Фото'),
(24, 's1', 'Фото'),
(14, 's1', 'Храм истины');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_user_right`
--

CREATE TABLE `b_search_user_right` (
  `USER_ID` int NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_security_sitecheck`
--

CREATE TABLE `b_security_sitecheck` (
  `ID` int NOT NULL,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_filter_mask`
--

CREATE TABLE `b_sec_filter_mask` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_frame_mask`
--

CREATE TABLE `b_sec_frame_mask` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule`
--

CREATE TABLE `b_sec_iprule` (
  `ID` int NOT NULL,
  `RULE_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_ip`
--

CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `IP_START` bigint DEFAULT NULL,
  `IP_END` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_mask`
--

CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_ip`
--

CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `IP_START` bigint DEFAULT NULL,
  `IP_END` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_mask`
--

CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_recovery_codes`
--

CREATE TABLE `b_sec_recovery_codes` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_redirect_url`
--

CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_session`
--

CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_user`
--

CREATE TABLE `b_sec_user` (
  `USER_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8mb3_unicode_ci,
  `ATTEMPTS` int DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_virus`
--

CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_white_list`
--

CREATE TABLE `b_sec_white_list` (
  `ID` int NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_autolog`
--

CREATE TABLE `b_seo_adv_autolog` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `BANNER_ID` int NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CAUSE_CODE` int DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_banner`
--

CREATE TABLE `b_seo_adv_banner` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8mb3_unicode_ci,
  `CAMPAIGN_ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_campaign`
--

CREATE TABLE `b_seo_adv_campaign` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_group`
--

CREATE TABLE `b_seo_adv_group` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8mb3_unicode_ci,
  `CAMPAIGN_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_link`
--

CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LINK_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_log`
--

CREATE TABLE `b_seo_adv_log` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8mb3_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_order`
--

CREATE TABLE `b_seo_adv_order` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  `ORDER_ID` int NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_region`
--

CREATE TABLE `b_seo_adv_region` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8mb3_unicode_ci,
  `PARENT_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_keywords`
--

CREATE TABLE `b_seo_keywords` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_search_engine`
--

CREATE TABLE `b_seo_search_engine` (
  `ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `SORT` int DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_seo_search_engine`
--

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_log`
--

CREATE TABLE `b_seo_service_log` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_queue`
--

CREATE TABLE `b_seo_service_queue` (
  `ID` int NOT NULL,
  `TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SERVICE_TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_rtg_queue`
--

CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARENT_ID` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_subscription`
--

CREATE TABLE `b_seo_service_subscription` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_webhook`
--

CREATE TABLE `b_seo_service_webhook` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap`
--

CREATE TABLE `b_seo_sitemap` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_entity`
--

CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int NOT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `SITEMAP_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_iblock`
--

CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `SITEMAP_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_runtime`
--

CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int NOT NULL,
  `PID` int NOT NULL,
  `PROCESSED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ITEM_ID` int DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_yandex_direct_stat`
--

CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int DEFAULT '0',
  `CLICKS_SEARCH` int DEFAULT '0',
  `CLICKS_CONTEXT` int DEFAULT '0',
  `SHOWS` int DEFAULT '0',
  `SHOWS_SEARCH` int DEFAULT '0',
  `SHOWS_CONTEXT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE `b_short_uri` (
  `ID` int NOT NULL,
  `URI` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URI_CRC` int NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int NOT NULL,
  `STATUS` int NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE `b_site_template` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_site_template`
--

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(1, 's1', '', 150, 'minimal_black');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE `b_smile` (
  `ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE `b_smile_lang` (
  `ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE `b_smile_set` (
  `ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template`
--

CREATE TABLE `b_sms_template` (
  `ID` int NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8mb3_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_sms_template`
--

INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL),
(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template_site`
--

CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_sms_template_site`
--

INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sm_version_history`
--

CREATE TABLE `b_sm_version_history` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_ap`
--

CREATE TABLE `b_socialservices_ap` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact`
--

CREATE TABLE `b_socialservices_contact` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NOT NULL,
  `CONTACT_USER_ID` int DEFAULT NULL,
  `CONTACT_XML_ID` int DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact_connect`
--

CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int DEFAULT NULL,
  `LINK_ID` int DEFAULT NULL,
  `CONTACT_PROFILE_ID` int NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_message`
--

CREATE TABLE `b_socialservices_message` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `SOCSERV_USER_ID` int NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user`
--

CREATE TABLE `b_socialservices_user` (
  `ID` int NOT NULL,
  `LOGIN` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OATOKEN` text COLLATE utf8mb3_unicode_ci,
  `OATOKEN_EXPIRES` int DEFAULT NULL,
  `OASECRET` text COLLATE utf8mb3_unicode_ci,
  `REFRESH_TOKEN` text COLLATE utf8mb3_unicode_ci,
  `SEND_ACTIVITY` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user_link`
--

CREATE TABLE `b_socialservices_user_link` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `SOCSERV_USER_ID` int NOT NULL,
  `LINK_USER_ID` int DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_zoom_meeting`
--

CREATE TABLE `b_socialservices_zoom_meeting` (
  `ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CONFERENCE_URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint UNSIGNED NOT NULL,
  `CONFERENCE_PASSWORD` text COLLATE utf8mb3_unicode_ci,
  `JOINED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int DEFAULT NULL,
  `TITLE` text COLLATE utf8mb3_unicode_ci,
  `SHORT_LINK` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HAS_RECORDING` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_zoom_meeting_recording`
--

CREATE TABLE `b_socialservices_zoom_meeting_recording` (
  `ID` int NOT NULL,
  `EXTERNAL_ID` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MEETING_ID` int NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_SIZE` int NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8mb3_unicode_ci,
  `PASSWORD` text COLLATE utf8mb3_unicode_ci,
  `FILE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE `b_sticker` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int NOT NULL,
  `CREATED_BY` int NOT NULL,
  `PERSONAL` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8mb3_unicode_ci,
  `POS_TOP` int DEFAULT NULL,
  `POS_LEFT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `COLOR` int DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int DEFAULT NULL,
  `MARKER_LEFT` int DEFAULT NULL,
  `MARKER_WIDTH` int DEFAULT NULL,
  `MARKER_HEIGHT` int DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_subscription`
--

CREATE TABLE `b_subscription` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_subscription_rubric`
--

CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int NOT NULL,
  `LIST_RUBRIC_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE `b_task` (
  `ID` int NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
(47, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
(48, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
(49, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
(50, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
(51, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
(52, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(53, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(54, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE `b_task_operation` (
  `TASK_ID` int NOT NULL,
  `OPERATION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(15, 38),
(16, 38),
(16, 39),
(17, 38),
(17, 39),
(17, 40),
(19, 43),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(19, 51),
(19, 52),
(20, 41),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(22, 54),
(23, 54),
(23, 55),
(23, 59),
(24, 54),
(24, 59),
(24, 60),
(24, 61),
(25, 54),
(25, 55),
(25, 56),
(25, 57),
(25, 59),
(25, 60),
(25, 61),
(26, 54),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(28, 62),
(29, 62),
(29, 63),
(29, 64),
(29, 65),
(31, 66),
(32, 67),
(32, 68),
(34, 69),
(34, 70),
(35, 71),
(36, 69),
(36, 70),
(36, 72),
(37, 69),
(37, 70),
(37, 71),
(37, 72),
(38, 69),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(39, 69),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(40, 69),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(42, 87),
(43, 88),
(44, 89),
(45, 90),
(46, 91),
(48, 92),
(49, 93),
(50, 94),
(50, 95),
(50, 96),
(50, 97),
(50, 98),
(50, 99),
(50, 100),
(50, 101),
(50, 102),
(50, 103),
(50, 104),
(51, 92),
(51, 93),
(51, 94),
(51, 95),
(51, 96),
(51, 97),
(51, 98),
(51, 99),
(51, 100),
(51, 101),
(51, 102),
(51, 103),
(51, 104),
(51, 105),
(51, 106),
(51, 107),
(51, 108),
(51, 109),
(51, 110),
(51, 111),
(51, 112),
(51, 113),
(51, 114),
(51, 115),
(51, 116),
(51, 117),
(53, 119),
(54, 118),
(54, 119);

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_diff`
--

CREATE TABLE `b_translate_diff` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AGAINST_LANG_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EXCESS_COUNT` int NOT NULL DEFAULT '0',
  `DEFICIENCY_COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_file`
--

CREATE TABLE `b_translate_file` (
  `ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FULL_PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PHRASE_COUNT` int NOT NULL DEFAULT '0',
  `INDEXED` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path`
--

CREATE TABLE `b_translate_path` (
  `ID` int NOT NULL,
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `DEPTH_LEVEL` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '0',
  `PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `IS_LANG` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INDEXED` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ASSIGNMENT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path_lang`
--

CREATE TABLE `b_translate_path_lang` (
  `ID` int NOT NULL,
  `PATH` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path_tree`
--

CREATE TABLE `b_translate_path_tree` (
  `ID` int NOT NULL,
  `PARENT_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_phrase`
--

CREATE TABLE `b_translate_phrase` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PHRASE` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_access`
--

CREATE TABLE `b_ui_avatar_mask_access` (
  `ID` bigint UNSIGNED NOT NULL,
  `ITEM_ID` int NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_file_deleted`
--

CREATE TABLE `b_ui_avatar_mask_file_deleted` (
  `ID` bigint NOT NULL,
  `ENTITY` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ORIGINAL_FILE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_group`
--

CREATE TABLE `b_ui_avatar_mask_group` (
  `ID` int UNSIGNED NOT NULL,
  `OWNER_TYPE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_item`
--

CREATE TABLE `b_ui_avatar_mask_item` (
  `ID` int UNSIGNED NOT NULL,
  `OWNER_TYPE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OWNER_ID` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_item_applied_to`
--

CREATE TABLE `b_ui_avatar_mask_item_applied_to` (
  `ID` bigint UNSIGNED NOT NULL,
  `ORIGINAL_FILE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_recently_used`
--

CREATE TABLE `b_ui_avatar_mask_recently_used` (
  `ID` bigint UNSIGNED NOT NULL,
  `ITEM_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config`
--

CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int UNSIGNED NOT NULL,
  `CATEGORY` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config_ac`
--

CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONFIG_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_file_uploader_temp_file`
--

CREATE TABLE `b_ui_file_uploader_temp_file` (
  `ID` int NOT NULL,
  `GUID` char(36) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILE_ID` int DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SIZE` bigint NOT NULL,
  `PATH` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MIMETYPE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RECEIVED_SIZE` bigint NOT NULL DEFAULT '0',
  `WIDTH` int NOT NULL DEFAULT '0',
  `HEIGHT` int NOT NULL DEFAULT '0',
  `BUCKET_ID` int DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONTROLLER` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CLOUD` tinyint(1) NOT NULL DEFAULT '0',
  `UPLOADED` tinyint(1) NOT NULL DEFAULT '0',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `CREATED_BY` int NOT NULL DEFAULT '0',
  `CREATED_AT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8mb3_unicode_ci,
  `USER_ID` int DEFAULT NULL,
  `TIMESTAMP_X` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_metadata`
--

CREATE TABLE `b_urlpreview_metadata` (
  `ID` int NOT NULL,
  `URL` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `IMAGE_ID` int DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8mb3_unicode_ci,
  `EXTRA` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_route`
--

CREATE TABLE `b_urlpreview_route` (
  `ID` int NOT NULL,
  `ROUTE` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_urlpreview_route`
--

INSERT INTO `b_urlpreview_route` (`ID`, `ROUTE`, `MODULE`, `CLASS`, `PARAMETERS`) VALUES
(1, '/knowledge/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(2, '/knowledge/group/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE `b_user` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8mb3_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8mb3_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8mb3_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8mb3_unicode_ci,
  `WORK_LOGO` int DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8mb3_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8mb3_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`, `PASSWORD_EXPIRED`) VALUES
(1, '2023-10-17 13:00:49', 'admin', '$6$k$UJQfHvU9Gc6qKA39mQPB9k2dUfpDwCm2N9aUw8N6SlgkxZOTdo/zpOjIWDSrek1.U6PWnhq6TtYtrMdM3/rNJ.', '$6$l$1fA3ImV6ovYKlkrXSXWpoMr6QtI4Dz5A4xn6srroDikRgKeyh7N9.giMHbITpELm9.bQHRu8f4G3j/GJVjZ6J.', 'Y', '', '', 'trashmail2002@yandex.ru', '2023-10-18 10:37:43', '2023-10-17 09:36:16', 's1', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-17 16:00:49', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE `b_user_access` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`ID`, `USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(1, 0, 'group', 'G2'),
(2, 1, 'group', 'G1'),
(3, 1, 'group', 'G3'),
(4, 1, 'group', 'G4'),
(5, 1, 'group', 'G2'),
(9, 1, 'user', 'U1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE `b_user_access_check` (
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_action`
--

CREATE TABLE `b_user_auth_action` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `PRIORITY` int NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_auth_action`
--

INSERT INTO `b_user_auth_action` (`ID`, `USER_ID`, `PRIORITY`, `ACTION`, `ACTION_DATE`, `APPLICATION_ID`) VALUES
(2, 1, 100, 'logout', '2023-10-17 15:54:33', NULL),
(3, 1, 100, 'logout', '2023-10-17 15:54:48', NULL),
(4, 1, 100, 'logout', '2023-10-17 15:55:02', NULL),
(5, 1, 100, 'logout', '2023-10-17 15:55:06', NULL),
(6, 1, 100, 'logout', '2023-10-17 15:55:45', NULL),
(7, 1, 100, 'logout', '2023-10-17 15:55:46', NULL),
(8, 1, 100, 'logout', '2023-10-17 16:00:47', NULL),
(9, 1, 100, 'logout', '2023-10-17 16:00:49', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_code`
--

CREATE TABLE `b_user_auth_code` (
  `USER_ID` int NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8mb3_unicode_ci,
  `ATTEMPTS` int DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE `b_user_counter` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CNT` int NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8mb3_unicode_ci,
  `SENT` char(1) COLLATE utf8mb3_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_device`
--

CREATE TABLE `b_user_device` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` bigint UNSIGNED NOT NULL,
  `DEVICE_UID` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEVICE_TYPE` int UNSIGNED NOT NULL DEFAULT '0',
  `BROWSER` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PLATFORM` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COOKABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_device_login`
--

CREATE TABLE `b_user_device_login` (
  `ID` bigint UNSIGNED NOT NULL,
  `DEVICE_ID` bigint UNSIGNED NOT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CITY_GEOID` bigint DEFAULT NULL,
  `REGION_GEOID` bigint DEFAULT NULL,
  `COUNTRY_ISO_CODE` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `APP_PASSWORD_ID` bigint UNSIGNED DEFAULT NULL,
  `STORED_AUTH_ID` bigint UNSIGNED DEFAULT NULL,
  `HIT_AUTH_ID` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE `b_user_digest` (
  `USER_ID` int NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE `b_user_field` (
  `ID` int NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_field`
--

INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(3, 'BLOG_POST', 'UF_BLOG_POST_URL_PRV', 'url_preview', 'UF_BLOG_POST_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(4, 'BLOG_COMMENT', 'UF_BLOG_COMM_URL_PRV', 'url_preview', 'UF_BLOG_COMM_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(5, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
(6, 'FORUM_MESSAGE', 'UF_FORUM_MES_URL_PRV', 'url_preview', 'UF_FORUM_MES_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
(7, 'FORUM_MESSAGE', 'UF_TASK_COMMENT_TYPE', 'integer', 'UF_TASK_COMMENT_TYPE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE `b_user_field_confirm` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ATTEMPTS` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE `b_user_field_enum` (
  `ID` int NOT NULL,
  `USER_FIELD_ID` int DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_permission`
--

CREATE TABLE `b_user_field_permission` (
  `ID` int UNSIGNED NOT NULL,
  `ENTITY_TYPE_ID` tinyint UNSIGNED NOT NULL,
  `USER_FIELD_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE `b_user_group` (
  `USER_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE `b_user_hit_auth` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `HASH` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `VALID_UNTIL` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_index`
--

CREATE TABLE `b_user_index` (
  `USER_ID` int NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8mb3_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8mb3_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8mb3_unicode_ci,
  `NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_index`
--

INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
(1, '001', '', '001 genfuznvy2002 lnaqrk genfuznvy2002@lnaqrk.eh nqzva', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE `b_user_option` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8mb3_unicode_ci,
  `COMMON` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 0, 'main.interface', 'global', 'a:1:{s:5:\"theme\";s:5:\"black\";}', 'Y'),
(3, 0, 'form', 'form_element_1', 'a:1:{s:4:\"tabs\";s:960:\"edit1--#--Фотография--,--ACTIVE--#--  Запись активна--,--NAME--#--*Название--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PREVIEW_PICTURE--#--  Картинка для анонса--,--DETAIL_PICTURE--#--  Детальная картинка--,--PROPERTY_2--#--  Оригинал--,--PROPERTY_8--#--  Рейтинг--,--PROPERTY_6--#--  Количество голосов--,--PROPERTY_7--#--  Сумма голосов--,--PROPERTY_1--#--  Элемент одобрен--,--PROPERTY_3--#--  Элемент опубликован--;--edit6--#--Описание--,--PREVIEW_TEXT--#--  Описание для анонса--,--DETAIL_TEXT--#--  Детальное описание--;--edit2--#--Разделы--,--SECTIONS--#--  Разделы--;--edit3--#--Дополнительно--,--SORT--#--  Индекс сортировки--,--CODE--#--  Символьный код--,--TAGS--#--  Теги--;--\";}', 'Y'),
(4, 1, 'admin_panel', 'settings', 'a:1:{s:4:\"edit\";s:3:\"off\";}', 'N'),
(5, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(6, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(8, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:111:\"menu_iblock,iblock_admin,menu_iblock_/dynamic_content,menu_iblock_%2Fdynamic_content%2F2,menu_util,menu_perfmon\";}', 'N'),
(11, 1, 'main.interface.grid', 'tbl_iblock_admin_3c4e0a60664d4374c5df37d7512ab460', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(16, 1, 'main.ui.filter', 'tbl_iblock_section_a4da3e229827e79db68d57dbcab92fd6', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(22, 1, 'main.interface.grid', 'tbl_iblock_section_a4da3e229827e79db68d57dbcab92fd6', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(23, 1, 'main.ui.filter', 'tbl_iblock_element_a4da3e229827e79db68d57dbcab92fd6', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}', 'N'),
(28, 1, 'main.interface.grid', 'tbl_iblock_element_a4da3e229827e79db68d57dbcab92fd6', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(34, 1, 'html_editor', 'user_settings_', 'a:2:{s:13:\"taskbar_shown\";s:1:\"1\";s:13:\"taskbar_width\";s:2:\"20\";}', 'N'),
(41, 1, 'main.interface.grid', 'tbl_iblock_admin_750dd17d83198dd551018232269fa242', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(75, 1, 'main', 'helper_hero_admin', 'a:1:{s:4:\"show\";s:1:\"Y\";}', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_password`
--

CREATE TABLE `b_user_password` (
  `ID` bigint NOT NULL,
  `USER_ID` bigint NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_user_password`
--

INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
(1, 1, '$6$L$tSY1kAP2etsK6ZiKBQ9vOHlb.MADH7v20lP1bdbi0.t32U7OiCo2mwEHzwZiGuVjvbmq3jWBZmij0HropI5JK/', '2023-10-17 09:36:16'),
(2, 1, '$6$h$8RLV0Xg8CRFY7kGFTyrkFQ7hqOQwJEilgxJ9jHSo7ekavlaQ2wTXrRUgK1eeKAbo3bK/0WoL1oSGKmchUVS26/', '2023-10-17 15:54:33'),
(3, 1, '$6$V$bsvGPEm3CYEDPv9xxBNaFsTaWU.0HbC4J.bDda3FZ1vIGxsAaFx1ZYm5XtwmjfXFuMg3v7VcIpMywxbALpvnP0', '2023-10-17 15:54:48'),
(4, 1, '$6$0$gp9x5i9A5MeLzJFosiMvEYoVXxO4pLYwfUBe3cKrAqjDVOohCmmjcBflqWiNXsEdLgbFM7hJfZhNufNmL9Yrg0', '2023-10-17 15:55:02'),
(5, 1, '$6$M$rGbi1ZODp9hAAPW/hS6QRj47js2i1PKBMeoYFoyoGA0bX6Yw6GsRVcG./V8VsC48gMQ/ikspmnjm0vB84dJSr0', '2023-10-17 15:55:06'),
(6, 1, '$6$2$XH.01Q6IqHZHdfRfHkM8l1DOU9A/KqkfCZDBcdk7DPsZ4aVwx/HnmEpJe/KN8lMlR712iD7MOFQZVirgjyrRR1', '2023-10-17 15:55:44'),
(7, 1, '$6$C$mnEZeUupVtri4wVES5ofT6DQ/ta4UppIGIblWahwQa5I0cBDMg/OZBk2Cw7O7IYVOOCVp3oMlhTXLPLYzBcp81', '2023-10-17 15:55:46'),
(8, 1, '$6$q$Z8xeuUlVDvI96WelkwrEZpWLWWp9RBg2tXZKLOxxf4wxVJAZ4L2oLBcCeQ8lV0SWjHhbv7IEGPZFSjkNefINo1', '2023-10-17 16:00:47'),
(9, 1, '$6$k$UJQfHvU9Gc6qKA39mQPB9k2dUfpDwCm2N9aUw8N6SlgkxZOTdo/zpOjIWDSrek1.U6PWnhq6TtYtrMdM3/rNJ.', '2023-10-17 16:00:49');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_phone_auth`
--

CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8mb3_unicode_ci,
  `ATTEMPTS` int DEFAULT '0',
  `CONFIRMED` char(1) COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_history`
--

CREATE TABLE `b_user_profile_history` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `EVENT_TYPE` int DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8mb3_unicode_ci,
  `REQUEST_URI` text COLLATE utf8mb3_unicode_ci,
  `UPDATED_BY_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_record`
--

CREATE TABLE `b_user_profile_record` (
  `ID` int NOT NULL,
  `HISTORY_ID` int NOT NULL,
  `FIELD` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_session`
--

CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE `b_user_stored_auth` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_blog_comment`
--

CREATE TABLE `b_utm_blog_comment` (
  `ID` int NOT NULL,
  `VALUE_ID` int NOT NULL,
  `FIELD_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci,
  `VALUE_INT` int DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_blog_post`
--

CREATE TABLE `b_utm_blog_post` (
  `ID` int NOT NULL,
  `VALUE_ID` int NOT NULL,
  `FIELD_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci,
  `VALUE_INT` int DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_forum_message`
--

CREATE TABLE `b_utm_forum_message` (
  `ID` int NOT NULL,
  `VALUE_ID` int NOT NULL,
  `FIELD_ID` int NOT NULL,
  `VALUE` text COLLATE utf8mb3_unicode_ci,
  `VALUE_INT` int DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_blog_comment`
--

CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8mb3_unicode_ci,
  `UF_BLOG_COMM_URL_PRV` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_blog_post`
--

CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8mb3_unicode_ci,
  `UF_BLOG_POST_URL_PRV` int DEFAULT NULL,
  `UF_GRATITUDE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_forum_message`
--

CREATE TABLE `b_uts_forum_message` (
  `VALUE_ID` int NOT NULL,
  `UF_FORUM_MES_URL_PRV` int DEFAULT NULL,
  `UF_TASK_COMMENT_TYPE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote`
--

CREATE TABLE `b_vote` (
  `ID` int NOT NULL,
  `CHANNEL_ID` int NOT NULL DEFAULT '0',
  `C_SORT` int DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `ANONYMITY` int NOT NULL DEFAULT '0',
  `NOTIFY` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COUNTER` int NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb3_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int DEFAULT NULL,
  `OPTIONS` int DEFAULT '1',
  `TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_answer`
--

CREATE TABLE `b_vote_answer` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int NOT NULL DEFAULT '0',
  `C_SORT` int DEFAULT '100',
  `IMAGE_ID` int DEFAULT NULL,
  `MESSAGE` text COLLATE utf8mb3_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int NOT NULL DEFAULT '0',
  `FIELD_TYPE` int NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int DEFAULT NULL,
  `FIELD_HEIGHT` int DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_attached_object`
--

CREATE TABLE `b_vote_attached_object` (
  `ID` int NOT NULL,
  `OBJECT_ID` int NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_channel`
--

CREATE TABLE `b_vote_channel` (
  `ID` int NOT NULL,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `C_SORT` int DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_channel_2_group`
--

CREATE TABLE `b_vote_channel_2_group` (
  `ID` int NOT NULL,
  `CHANNEL_ID` int NOT NULL DEFAULT '0',
  `GROUP_ID` int NOT NULL DEFAULT '0',
  `PERMISSION` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_channel_2_site`
--

CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_event`
--

CREATE TABLE `b_vote_event` (
  `ID` int NOT NULL,
  `VOTE_ID` int NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `VISIBLE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_event_answer`
--

CREATE TABLE `b_vote_event_answer` (
  `ID` int NOT NULL,
  `EVENT_QUESTION_ID` int NOT NULL DEFAULT '0',
  `ANSWER_ID` int NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_event_question`
--

CREATE TABLE `b_vote_event_question` (
  `ID` int NOT NULL,
  `EVENT_ID` int NOT NULL DEFAULT '0',
  `QUESTION_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_question`
--

CREATE TABLE `b_vote_question` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int NOT NULL DEFAULT '0',
  `C_SORT` int DEFAULT '100',
  `IMAGE_ID` int DEFAULT NULL,
  `QUESTION` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'html',
  `FIELD_TYPE` int NOT NULL DEFAULT '0',
  `REQUIRED` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `COUNTER` int NOT NULL DEFAULT '0',
  `DIAGRAM` char(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_vote_user`
--

CREATE TABLE `b_vote_user` (
  `ID` int NOT NULL,
  `COOKIE_ID` int NOT NULL,
  `AUTH_USER_ID` int DEFAULT NULL,
  `COUNTER` int NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `STAT_GUEST_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_xml_tree`
--

CREATE TABLE `b_xml_tree` (
  `ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `LEFT_MARGIN` int DEFAULT NULL,
  `RIGHT_MARGIN` int DEFAULT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8mb3_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `b_xml_tree`
--

INSERT INTO `b_xml_tree` (`ID`, `PARENT_ID`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `NAME`, `VALUE`, `ATTRIBUTES`) VALUES
(1, 0, 1, 2056, 0, 'КоммерческаяИнформация', NULL, 'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2008-09-27T15:33:51\";}'),
(2, 1, 2, 381, 1, 'Классификатор', NULL, NULL),
(3, 2, 3, 4, 2, 'Ид', '26', NULL),
(4, 2, 5, 6, 2, 'Наименование', 'Фотогалерея пользователей', NULL),
(5, 2, 7, 360, 2, 'Свойства', NULL, NULL),
(6, 5, 8, 15, 3, 'Свойство', NULL, NULL),
(7, 6, 9, 10, 4, 'Ид', 'CML2_CODE', NULL),
(8, 6, 11, 12, 4, 'Наименование', 'Символьный код', NULL),
(9, 6, 13, 14, 4, 'Множественное', 'false', NULL),
(10, 5, 16, 23, 3, 'Свойство', NULL, NULL),
(11, 10, 17, 18, 4, 'Ид', 'CML2_SORT', NULL),
(12, 10, 19, 20, 4, 'Наименование', 'Сортировка', NULL),
(13, 10, 21, 22, 4, 'Множественное', 'false', NULL),
(14, 5, 24, 31, 3, 'Свойство', NULL, NULL),
(15, 14, 25, 26, 4, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(16, 14, 27, 28, 4, 'Наименование', 'Начало активности', NULL),
(17, 14, 29, 30, 4, 'Множественное', 'false', NULL),
(18, 5, 32, 39, 3, 'Свойство', NULL, NULL),
(19, 18, 33, 34, 4, 'Ид', 'CML2_ACTIVE_TO', NULL),
(20, 18, 35, 36, 4, 'Наименование', 'Окончание активности', NULL),
(21, 18, 37, 38, 4, 'Множественное', 'false', NULL),
(22, 5, 40, 47, 3, 'Свойство', NULL, NULL),
(23, 22, 41, 42, 4, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(24, 22, 43, 44, 4, 'Наименование', 'Анонс', NULL),
(25, 22, 45, 46, 4, 'Множественное', 'false', NULL),
(26, 5, 48, 55, 3, 'Свойство', NULL, NULL),
(27, 26, 49, 50, 4, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(28, 26, 51, 52, 4, 'Наименование', 'Картинка анонса', NULL),
(29, 26, 53, 54, 4, 'Множественное', 'false', NULL),
(30, 5, 56, 93, 3, 'Свойство', NULL, NULL),
(31, 30, 57, 58, 4, 'Ид', '69', NULL),
(32, 30, 59, 60, 4, 'Наименование', 'Элемент одобрен', NULL),
(33, 30, 61, 62, 4, 'Множественное', 'false', NULL),
(34, 30, 63, 64, 4, 'БитриксСортировка', '500', NULL),
(35, 30, 65, 66, 4, 'БитриксКод', 'APPROVE_ELEMENT', NULL),
(36, 30, 67, 68, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(37, 30, 69, 70, 4, 'БитриксТипСвойства', 'S', NULL),
(38, 30, 71, 72, 4, 'БитриксСтрок', '1', NULL),
(39, 30, 73, 74, 4, 'БитриксКолонок', '30', NULL),
(40, 30, 75, 76, 4, 'БитриксТипСписка', 'L', NULL),
(41, 30, 77, 78, 4, 'БитриксТипыФайлов', NULL, NULL),
(42, 30, 79, 80, 4, 'БитриксКоличествоПолей', '0', NULL),
(43, 30, 81, 82, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(44, 30, 83, 84, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(45, 30, 85, 86, 4, 'БитриксПоискРазрешен', 'false', NULL),
(46, 30, 87, 88, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(47, 30, 89, 90, 4, 'БитриксРасширениеТипа', NULL, NULL),
(48, 30, 91, 92, 4, 'БитриксОбязательное', 'false', NULL),
(49, 5, 94, 131, 3, 'Свойство', NULL, NULL),
(50, 49, 95, 96, 4, 'Ид', '67', NULL),
(51, 49, 97, 98, 4, 'Наименование', 'Оригинал', NULL),
(52, 49, 99, 100, 4, 'Множественное', 'false', NULL),
(53, 49, 101, 102, 4, 'БитриксСортировка', '500', NULL),
(54, 49, 103, 104, 4, 'БитриксКод', 'REAL_PICTURE', NULL),
(55, 49, 105, 106, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(56, 49, 107, 108, 4, 'БитриксТипСвойства', 'F', NULL),
(57, 49, 109, 110, 4, 'БитриксСтрок', '1', NULL),
(58, 49, 111, 112, 4, 'БитриксКолонок', '30', NULL),
(59, 49, 113, 114, 4, 'БитриксТипСписка', 'L', NULL),
(60, 49, 115, 116, 4, 'БитриксТипыФайлов', 'jpg, gif, bmp, png, jpeg', NULL),
(61, 49, 117, 118, 4, 'БитриксКоличествоПолей', '0', NULL),
(62, 49, 119, 120, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(63, 49, 121, 122, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(64, 49, 123, 124, 4, 'БитриксПоискРазрешен', 'false', NULL),
(65, 49, 125, 126, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(66, 49, 127, 128, 4, 'БитриксРасширениеТипа', NULL, NULL),
(67, 49, 129, 130, 4, 'БитриксОбязательное', 'false', NULL),
(68, 5, 132, 169, 3, 'Свойство', NULL, NULL),
(69, 68, 133, 134, 4, 'Ид', '68', NULL),
(70, 68, 135, 136, 4, 'Наименование', 'Элемент опубликован', NULL),
(71, 68, 137, 138, 4, 'Множественное', 'false', NULL),
(72, 68, 139, 140, 4, 'БитриксСортировка', '500', NULL),
(73, 68, 141, 142, 4, 'БитриксКод', 'PUBLIC_ELEMENT', NULL),
(74, 68, 143, 144, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(75, 68, 145, 146, 4, 'БитриксТипСвойства', 'S', NULL),
(76, 68, 147, 148, 4, 'БитриксСтрок', '1', NULL),
(77, 68, 149, 150, 4, 'БитриксКолонок', '30', NULL),
(78, 68, 151, 152, 4, 'БитриксТипСписка', 'L', NULL),
(79, 68, 153, 154, 4, 'БитриксТипыФайлов', NULL, NULL),
(80, 68, 155, 156, 4, 'БитриксКоличествоПолей', '0', NULL),
(81, 68, 157, 158, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(82, 68, 159, 160, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(83, 68, 161, 162, 4, 'БитриксПоискРазрешен', 'false', NULL),
(84, 68, 163, 164, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(85, 68, 165, 166, 4, 'БитриксРасширениеТипа', NULL, NULL),
(86, 68, 167, 168, 4, 'БитриксОбязательное', 'false', NULL),
(87, 5, 170, 207, 3, 'Свойство', NULL, NULL),
(88, 87, 171, 172, 4, 'Ид', '70', NULL),
(89, 87, 173, 174, 4, 'Наименование', 'Тема форума для комментариев', NULL),
(90, 87, 175, 176, 4, 'Множественное', 'false', NULL),
(91, 87, 177, 178, 4, 'БитриксСортировка', '500', NULL),
(92, 87, 179, 180, 4, 'БитриксКод', 'FORUM_TOPIC_ID', NULL),
(93, 87, 181, 182, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(94, 87, 183, 184, 4, 'БитриксТипСвойства', 'S', NULL),
(95, 87, 185, 186, 4, 'БитриксСтрок', '1', NULL),
(96, 87, 187, 188, 4, 'БитриксКолонок', '30', NULL),
(97, 87, 189, 190, 4, 'БитриксТипСписка', 'L', NULL),
(98, 87, 191, 192, 4, 'БитриксТипыФайлов', NULL, NULL),
(99, 87, 193, 194, 4, 'БитриксКоличествоПолей', '0', NULL),
(100, 87, 195, 196, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(101, 87, 197, 198, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(102, 87, 199, 200, 4, 'БитриксПоискРазрешен', 'false', NULL),
(103, 87, 201, 202, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(104, 87, 203, 204, 4, 'БитриксРасширениеТипа', 'TopicID', NULL),
(105, 87, 205, 206, 4, 'БитриксОбязательное', 'false', NULL),
(106, 5, 208, 245, 3, 'Свойство', NULL, NULL),
(107, 106, 209, 210, 4, 'Ид', '71', NULL),
(108, 106, 211, 212, 4, 'Наименование', 'Количество комментариев к элементу', NULL),
(109, 106, 213, 214, 4, 'Множественное', 'false', NULL),
(110, 106, 215, 216, 4, 'БитриксСортировка', '500', NULL),
(111, 106, 217, 218, 4, 'БитриксКод', 'FORUM_MESSAGE_CNT', NULL),
(112, 106, 219, 220, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(113, 106, 221, 222, 4, 'БитриксТипСвойства', 'N', NULL),
(114, 106, 223, 224, 4, 'БитриксСтрок', '1', NULL),
(115, 106, 225, 226, 4, 'БитриксКолонок', '30', NULL),
(116, 106, 227, 228, 4, 'БитриксТипСписка', 'L', NULL),
(117, 106, 229, 230, 4, 'БитриксТипыФайлов', NULL, NULL),
(118, 106, 231, 232, 4, 'БитриксКоличествоПолей', '0', NULL),
(119, 106, 233, 234, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(120, 106, 235, 236, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(121, 106, 237, 238, 4, 'БитриксПоискРазрешен', 'false', NULL),
(122, 106, 239, 240, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(123, 106, 241, 242, 4, 'БитриксРасширениеТипа', NULL, NULL),
(124, 106, 243, 244, 4, 'БитриксОбязательное', 'false', NULL),
(125, 5, 246, 283, 3, 'Свойство', NULL, NULL),
(126, 125, 247, 248, 4, 'Ид', '72', NULL),
(127, 125, 249, 250, 4, 'Наименование', 'Количество голосов', NULL),
(128, 125, 251, 252, 4, 'Множественное', 'false', NULL),
(129, 125, 253, 254, 4, 'БитриксСортировка', '500', NULL),
(130, 125, 255, 256, 4, 'БитриксКод', 'vote_count', NULL),
(131, 125, 257, 258, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(132, 125, 259, 260, 4, 'БитриксТипСвойства', 'N', NULL),
(133, 125, 261, 262, 4, 'БитриксСтрок', '1', NULL),
(134, 125, 263, 264, 4, 'БитриксКолонок', '30', NULL),
(135, 125, 265, 266, 4, 'БитриксТипСписка', 'L', NULL),
(136, 125, 267, 268, 4, 'БитриксТипыФайлов', NULL, NULL),
(137, 125, 269, 270, 4, 'БитриксКоличествоПолей', '0', NULL),
(138, 125, 271, 272, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(139, 125, 273, 274, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(140, 125, 275, 276, 4, 'БитриксПоискРазрешен', 'false', NULL),
(141, 125, 277, 278, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(142, 125, 279, 280, 4, 'БитриксРасширениеТипа', NULL, NULL),
(143, 125, 281, 282, 4, 'БитриксОбязательное', 'false', NULL),
(144, 5, 284, 321, 3, 'Свойство', NULL, NULL),
(145, 144, 285, 286, 4, 'Ид', '73', NULL),
(146, 144, 287, 288, 4, 'Наименование', 'Сумма голосов', NULL),
(147, 144, 289, 290, 4, 'Множественное', 'false', NULL),
(148, 144, 291, 292, 4, 'БитриксСортировка', '500', NULL),
(149, 144, 293, 294, 4, 'БитриксКод', 'vote_sum', NULL),
(150, 144, 295, 296, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(151, 144, 297, 298, 4, 'БитриксТипСвойства', 'N', NULL),
(152, 144, 299, 300, 4, 'БитриксСтрок', '1', NULL),
(153, 144, 301, 302, 4, 'БитриксКолонок', '30', NULL),
(154, 144, 303, 304, 4, 'БитриксТипСписка', 'L', NULL),
(155, 144, 305, 306, 4, 'БитриксТипыФайлов', NULL, NULL),
(156, 144, 307, 308, 4, 'БитриксКоличествоПолей', '0', NULL),
(157, 144, 309, 310, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(158, 144, 311, 312, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(159, 144, 313, 314, 4, 'БитриксПоискРазрешен', 'false', NULL),
(160, 144, 315, 316, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(161, 144, 317, 318, 4, 'БитриксРасширениеТипа', NULL, NULL),
(162, 144, 319, 320, 4, 'БитриксОбязательное', 'false', NULL),
(163, 5, 322, 359, 3, 'Свойство', NULL, NULL),
(164, 163, 323, 324, 4, 'Ид', '74', NULL),
(165, 163, 325, 326, 4, 'Наименование', 'Рейтинг', NULL),
(166, 163, 327, 328, 4, 'Множественное', 'false', NULL),
(167, 163, 329, 330, 4, 'БитриксСортировка', '500', NULL),
(168, 163, 331, 332, 4, 'БитриксКод', 'rating', NULL),
(169, 163, 333, 334, 4, 'БитриксЗначениеПоУмолчанию', NULL, NULL),
(170, 163, 335, 336, 4, 'БитриксТипСвойства', 'N', NULL),
(171, 163, 337, 338, 4, 'БитриксСтрок', '1', NULL),
(172, 163, 339, 340, 4, 'БитриксКолонок', '30', NULL),
(173, 163, 341, 342, 4, 'БитриксТипСписка', 'L', NULL),
(174, 163, 343, 344, 4, 'БитриксТипыФайлов', NULL, NULL),
(175, 163, 345, 346, 4, 'БитриксКоличествоПолей', '0', NULL),
(176, 163, 347, 348, 4, 'БитриксСвязанныйИнфоблок', NULL, NULL),
(177, 163, 349, 350, 4, 'БитриксОписаниеРазрешено', 'false', NULL),
(178, 163, 351, 352, 4, 'БитриксПоискРазрешен', 'false', NULL),
(179, 163, 353, 354, 4, 'БитриксФильтрРазрешен', 'false', NULL),
(180, 163, 355, 356, 4, 'БитриксРасширениеТипа', NULL, NULL),
(181, 163, 357, 358, 4, 'БитриксОбязательное', 'false', NULL),
(182, 2, 361, 380, 2, 'Группы', NULL, NULL),
(183, 182, 362, 379, 3, 'Группа', NULL, NULL),
(184, 183, 363, 364, 4, 'Ид', '751', NULL),
(185, 183, 365, 366, 4, 'Наименование', 'Корпоративный выезд на косу', NULL),
(186, 183, 367, 368, 4, 'Описание', 'День рождения компании на косе.', NULL),
(187, 183, 369, 370, 4, 'БитриксСортировка', '500', NULL),
(188, 183, 371, 372, 4, 'БитриксКод', NULL, NULL),
(189, 183, 373, 374, 4, 'БитриксКартинка', 'user_photogallery_files/iblock/7a4/7a488362c2e0f0bc584012624d519232.jpg', NULL),
(190, 183, 375, 376, 4, 'БитриксКартинкаДетальная', 'user_photogallery_files/iblock/9e7/9e79156cc17203589bc3f86da271515e.jpg', NULL),
(191, 183, 377, 378, 4, 'Группы', NULL, NULL),
(192, 1, 382, 2055, 1, 'Каталог', NULL, NULL),
(193, 192, 383, 384, 2, 'Ид', 'photogallery_personal', NULL),
(194, 192, 385, 386, 2, 'ИдКлассификатора', '26', NULL),
(195, 192, 387, 388, 2, 'Наименование', 'Фотогалерея пользователей', NULL),
(196, 192, 389, 390, 2, 'БитриксКод', 'photogallery_personal', NULL),
(197, 192, 391, 392, 2, 'БитриксСортировка', '500', NULL),
(198, 192, 393, 394, 2, 'БитриксURLСписок', '#SITE_DIR#/photo/', NULL),
(199, 192, 395, 396, 2, 'БитриксURLДеталь', '#SITE_DIR#/photo/#SECTION_ID#/#ID#/', NULL),
(200, 192, 397, 398, 2, 'БитриксURLРаздел', '#SITE_DIR#/photo/#ID#/', NULL),
(201, 192, 399, 400, 2, 'БитриксКартинка', NULL, NULL),
(202, 192, 401, 402, 2, 'БитриксИндексироватьЭлементы', 'true', NULL),
(203, 192, 403, 404, 2, 'БитриксИндексироватьРазделы', 'true', NULL),
(204, 192, 405, 406, 2, 'БитриксДокументооборот', 'false', NULL),
(205, 192, 407, 468, 2, 'БитриксПодписи', NULL, NULL),
(206, 205, 408, 413, 3, 'БитриксПодпись', NULL, NULL),
(207, 206, 409, 410, 4, 'Ид', 'ELEMENT_NAME', NULL),
(208, 206, 411, 412, 4, 'Значение', 'Фотография', NULL),
(209, 205, 414, 419, 3, 'БитриксПодпись', NULL, NULL),
(210, 209, 415, 416, 4, 'Ид', 'ELEMENTS_NAME', NULL),
(211, 209, 417, 418, 4, 'Значение', 'Фотографии', NULL),
(212, 205, 420, 425, 3, 'БитриксПодпись', NULL, NULL),
(213, 212, 421, 422, 4, 'Ид', 'ELEMENT_ADD', NULL),
(214, 212, 423, 424, 4, 'Значение', 'Добавить фотографию', NULL),
(215, 205, 426, 431, 3, 'БитриксПодпись', NULL, NULL),
(216, 215, 427, 428, 4, 'Ид', 'ELEMENT_EDIT', NULL),
(217, 215, 429, 430, 4, 'Значение', 'Изменить фотографию', NULL),
(218, 205, 432, 437, 3, 'БитриксПодпись', NULL, NULL),
(219, 218, 433, 434, 4, 'Ид', 'ELEMENT_DELETE', NULL),
(220, 218, 435, 436, 4, 'Значение', 'Удалить фотографию', NULL),
(221, 205, 438, 443, 3, 'БитриксПодпись', NULL, NULL),
(222, 221, 439, 440, 4, 'Ид', 'SECTION_NAME', NULL),
(223, 221, 441, 442, 4, 'Значение', 'Альбом', NULL),
(224, 205, 444, 449, 3, 'БитриксПодпись', NULL, NULL),
(225, 224, 445, 446, 4, 'Ид', 'SECTIONS_NAME', NULL),
(226, 224, 447, 448, 4, 'Значение', 'Альбомы', NULL),
(227, 205, 450, 455, 3, 'БитриксПодпись', NULL, NULL),
(228, 227, 451, 452, 4, 'Ид', 'SECTION_ADD', NULL),
(229, 227, 453, 454, 4, 'Значение', 'Добавить альбом', NULL),
(230, 205, 456, 461, 3, 'БитриксПодпись', NULL, NULL),
(231, 230, 457, 458, 4, 'Ид', 'SECTION_EDIT', NULL),
(232, 230, 459, 460, 4, 'Значение', 'Изменить альбом', NULL),
(233, 205, 462, 467, 3, 'БитриксПодпись', NULL, NULL),
(234, 233, 463, 464, 4, 'Ид', 'SECTION_DELETE', NULL),
(235, 233, 465, 466, 4, 'Значение', 'Удалить альбом', NULL),
(236, 192, 469, 2054, 2, 'Товары', NULL, NULL),
(237, 236, 470, 601, 3, 'Товар', NULL, NULL),
(238, 237, 471, 472, 4, 'Ид', '2865', NULL),
(239, 237, 473, 474, 4, 'Наименование', '1.jpg', NULL),
(240, 237, 475, 476, 4, 'БитриксТеги', NULL, NULL),
(241, 237, 477, 480, 4, 'Группы', NULL, NULL),
(242, 241, 478, 479, 5, 'Ид', '751', NULL),
(243, 237, 481, 482, 4, 'Картинка', 'user_photogallery_files/iblock/de5/de52cc8287925a1bdb1e0d448d916c84.jpg', NULL),
(244, 237, 483, 600, 4, 'ЗначенияСвойств', NULL, NULL),
(245, 244, 484, 489, 5, 'ЗначенияСвойства', NULL, NULL),
(246, 245, 485, 486, 6, 'Ид', 'CML2_CODE', NULL),
(247, 245, 487, 488, 6, 'Значение', '1.jpg', NULL),
(248, 244, 490, 495, 5, 'ЗначенияСвойства', NULL, NULL),
(249, 248, 491, 492, 6, 'Ид', 'CML2_SORT', NULL),
(250, 248, 493, 494, 6, 'Значение', '500', NULL),
(251, 244, 496, 501, 5, 'ЗначенияСвойства', NULL, NULL),
(252, 251, 497, 498, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(253, 251, 499, 500, 6, 'Значение', NULL, NULL),
(254, 244, 502, 507, 5, 'ЗначенияСвойства', NULL, NULL),
(255, 254, 503, 504, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(256, 254, 505, 506, 6, 'Значение', NULL, NULL),
(257, 244, 508, 513, 5, 'ЗначенияСвойства', NULL, NULL),
(258, 257, 509, 510, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(259, 257, 511, 512, 6, 'Значение', NULL, NULL),
(260, 244, 514, 519, 5, 'ЗначенияСвойства', NULL, NULL),
(261, 260, 515, 516, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(262, 260, 517, 518, 6, 'Значение', 'user_photogallery_files/iblock/5ac/5ac6130998bb588933d8ede4c48a7c2c.jpg', NULL),
(263, 244, 520, 531, 5, 'ЗначенияСвойства', NULL, NULL),
(264, 263, 521, 522, 6, 'Ид', '67', NULL),
(265, 263, 523, 524, 6, 'Значение', 'user_photogallery_files/iblock/f53/f53e5a3a3c800df22e3b6c20a7bfb90a.jpg', NULL),
(266, 263, 525, 530, 6, 'ЗначениеСвойства', NULL, NULL),
(267, 266, 526, 527, 7, 'Значение', 'user_photogallery_files/iblock/f53/f53e5a3a3c800df22e3b6c20a7bfb90a.jpg', NULL),
(268, 266, 528, 529, 7, 'Описание', NULL, NULL),
(269, 244, 532, 543, 5, 'ЗначенияСвойства', NULL, NULL),
(270, 269, 533, 534, 6, 'Ид', '68', NULL),
(271, 269, 535, 536, 6, 'Значение', 'Y', NULL),
(272, 269, 537, 542, 6, 'ЗначениеСвойства', NULL, NULL),
(273, 272, 538, 539, 7, 'Значение', 'Y', NULL),
(274, 272, 540, 541, 7, 'Описание', NULL, NULL),
(275, 244, 544, 555, 5, 'ЗначенияСвойства', NULL, NULL),
(276, 275, 545, 546, 6, 'Ид', '69', NULL),
(277, 275, 547, 548, 6, 'Значение', 'Y', NULL),
(278, 275, 549, 554, 6, 'ЗначениеСвойства', NULL, NULL),
(279, 278, 550, 551, 7, 'Значение', 'Y', NULL),
(280, 278, 552, 553, 7, 'Описание', NULL, NULL),
(281, 244, 556, 559, 5, 'ЗначенияСвойства', NULL, NULL),
(282, 281, 557, 558, 6, 'Ид', '70', NULL),
(283, 244, 560, 563, 5, 'ЗначенияСвойства', NULL, NULL),
(284, 283, 561, 562, 6, 'Ид', '71', NULL),
(285, 244, 564, 575, 5, 'ЗначенияСвойства', NULL, NULL),
(286, 285, 565, 566, 6, 'Ид', '72', NULL),
(287, 285, 567, 568, 6, 'Значение', '3', NULL),
(288, 285, 569, 574, 6, 'ЗначениеСвойства', NULL, NULL),
(289, 288, 570, 571, 7, 'Значение', '3', NULL),
(290, 288, 572, 573, 7, 'Описание', NULL, NULL),
(291, 244, 576, 587, 5, 'ЗначенияСвойства', NULL, NULL),
(292, 291, 577, 578, 6, 'Ид', '73', NULL),
(293, 291, 579, 580, 6, 'Значение', '15', NULL),
(294, 291, 581, 586, 6, 'ЗначениеСвойства', NULL, NULL),
(295, 294, 582, 583, 7, 'Значение', '15', NULL),
(296, 294, 584, 585, 7, 'Описание', NULL, NULL),
(297, 244, 588, 599, 5, 'ЗначенияСвойства', NULL, NULL),
(298, 297, 589, 590, 6, 'Ид', '74', NULL),
(299, 297, 591, 592, 6, 'Значение', '3.56', NULL),
(300, 297, 593, 598, 6, 'ЗначениеСвойства', NULL, NULL),
(301, 300, 594, 595, 7, 'Значение', '3.56', NULL),
(302, 300, 596, 597, 7, 'Описание', NULL, NULL),
(303, 236, 602, 733, 3, 'Товар', NULL, NULL),
(304, 303, 603, 604, 4, 'Ид', '2867', NULL),
(305, 303, 605, 606, 4, 'Наименование', '13.jpg', NULL),
(306, 303, 607, 608, 4, 'БитриксТеги', NULL, NULL),
(307, 303, 609, 612, 4, 'Группы', NULL, NULL),
(308, 307, 610, 611, 5, 'Ид', '751', NULL),
(309, 303, 613, 614, 4, 'Картинка', 'user_photogallery_files/iblock/7e3/7e329851bc766e085bdde04be4d0581d.jpg', NULL),
(310, 303, 615, 732, 4, 'ЗначенияСвойств', NULL, NULL),
(311, 310, 616, 621, 5, 'ЗначенияСвойства', NULL, NULL),
(312, 311, 617, 618, 6, 'Ид', 'CML2_CODE', NULL),
(313, 311, 619, 620, 6, 'Значение', '13.jpg', NULL),
(314, 310, 622, 627, 5, 'ЗначенияСвойства', NULL, NULL),
(315, 314, 623, 624, 6, 'Ид', 'CML2_SORT', NULL),
(316, 314, 625, 626, 6, 'Значение', '500', NULL),
(317, 310, 628, 633, 5, 'ЗначенияСвойства', NULL, NULL),
(318, 317, 629, 630, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(319, 317, 631, 632, 6, 'Значение', NULL, NULL),
(320, 310, 634, 639, 5, 'ЗначенияСвойства', NULL, NULL),
(321, 320, 635, 636, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(322, 320, 637, 638, 6, 'Значение', NULL, NULL),
(323, 310, 640, 645, 5, 'ЗначенияСвойства', NULL, NULL),
(324, 323, 641, 642, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(325, 323, 643, 644, 6, 'Значение', NULL, NULL),
(326, 310, 646, 651, 5, 'ЗначенияСвойства', NULL, NULL),
(327, 326, 647, 648, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(328, 326, 649, 650, 6, 'Значение', 'user_photogallery_files/iblock/318/3185031406b120a27a8f3899688c494b.jpg', NULL),
(329, 310, 652, 663, 5, 'ЗначенияСвойства', NULL, NULL),
(330, 329, 653, 654, 6, 'Ид', '67', NULL),
(331, 329, 655, 656, 6, 'Значение', 'user_photogallery_files/iblock/6ea/6ea12b9bafdbda8065819bd8e13dd49e.jpg', NULL),
(332, 329, 657, 662, 6, 'ЗначениеСвойства', NULL, NULL),
(333, 332, 658, 659, 7, 'Значение', 'user_photogallery_files/iblock/6ea/6ea12b9bafdbda8065819bd8e13dd49e.jpg', NULL),
(334, 332, 660, 661, 7, 'Описание', NULL, NULL),
(335, 310, 664, 675, 5, 'ЗначенияСвойства', NULL, NULL),
(336, 335, 665, 666, 6, 'Ид', '68', NULL),
(337, 335, 667, 668, 6, 'Значение', 'Y', NULL),
(338, 335, 669, 674, 6, 'ЗначениеСвойства', NULL, NULL),
(339, 338, 670, 671, 7, 'Значение', 'Y', NULL),
(340, 338, 672, 673, 7, 'Описание', NULL, NULL),
(341, 310, 676, 687, 5, 'ЗначенияСвойства', NULL, NULL),
(342, 341, 677, 678, 6, 'Ид', '69', NULL),
(343, 341, 679, 680, 6, 'Значение', 'Y', NULL),
(344, 341, 681, 686, 6, 'ЗначениеСвойства', NULL, NULL),
(345, 344, 682, 683, 7, 'Значение', 'Y', NULL),
(346, 344, 684, 685, 7, 'Описание', NULL, NULL),
(347, 310, 688, 691, 5, 'ЗначенияСвойства', NULL, NULL),
(348, 347, 689, 690, 6, 'Ид', '70', NULL),
(349, 310, 692, 695, 5, 'ЗначенияСвойства', NULL, NULL),
(350, 349, 693, 694, 6, 'Ид', '71', NULL),
(351, 310, 696, 707, 5, 'ЗначенияСвойства', NULL, NULL),
(352, 351, 697, 698, 6, 'Ид', '72', NULL),
(353, 351, 699, 700, 6, 'Значение', '3', NULL),
(354, 351, 701, 706, 6, 'ЗначениеСвойства', NULL, NULL),
(355, 354, 702, 703, 7, 'Значение', '3', NULL),
(356, 354, 704, 705, 7, 'Описание', NULL, NULL),
(357, 310, 708, 719, 5, 'ЗначенияСвойства', NULL, NULL),
(358, 357, 709, 710, 6, 'Ид', '73', NULL),
(359, 357, 711, 712, 6, 'Значение', '15', NULL),
(360, 357, 713, 718, 6, 'ЗначениеСвойства', NULL, NULL),
(361, 360, 714, 715, 7, 'Значение', '15', NULL),
(362, 360, 716, 717, 7, 'Описание', NULL, NULL),
(363, 310, 720, 731, 5, 'ЗначенияСвойства', NULL, NULL),
(364, 363, 721, 722, 6, 'Ид', '74', NULL),
(365, 363, 723, 724, 6, 'Значение', '3.56', NULL),
(366, 363, 725, 730, 6, 'ЗначениеСвойства', NULL, NULL),
(367, 366, 726, 727, 7, 'Значение', '3.56', NULL),
(368, 366, 728, 729, 7, 'Описание', NULL, NULL),
(369, 236, 734, 865, 3, 'Товар', NULL, NULL),
(370, 369, 735, 736, 4, 'Ид', '2868', NULL),
(371, 369, 737, 738, 4, 'Наименование', '18.jpg', NULL),
(372, 369, 739, 740, 4, 'БитриксТеги', NULL, NULL),
(373, 369, 741, 744, 4, 'Группы', NULL, NULL),
(374, 373, 742, 743, 5, 'Ид', '751', NULL),
(375, 369, 745, 746, 4, 'Картинка', 'user_photogallery_files/iblock/e34/e343dc670d0a57b362defd42ebb19e23.jpg', NULL),
(376, 369, 747, 864, 4, 'ЗначенияСвойств', NULL, NULL),
(377, 376, 748, 753, 5, 'ЗначенияСвойства', NULL, NULL),
(378, 377, 749, 750, 6, 'Ид', 'CML2_CODE', NULL),
(379, 377, 751, 752, 6, 'Значение', '18.jpg', NULL),
(380, 376, 754, 759, 5, 'ЗначенияСвойства', NULL, NULL),
(381, 380, 755, 756, 6, 'Ид', 'CML2_SORT', NULL),
(382, 380, 757, 758, 6, 'Значение', '500', NULL),
(383, 376, 760, 765, 5, 'ЗначенияСвойства', NULL, NULL),
(384, 383, 761, 762, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(385, 383, 763, 764, 6, 'Значение', NULL, NULL),
(386, 376, 766, 771, 5, 'ЗначенияСвойства', NULL, NULL),
(387, 386, 767, 768, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(388, 386, 769, 770, 6, 'Значение', NULL, NULL),
(389, 376, 772, 777, 5, 'ЗначенияСвойства', NULL, NULL),
(390, 389, 773, 774, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(391, 389, 775, 776, 6, 'Значение', NULL, NULL),
(392, 376, 778, 783, 5, 'ЗначенияСвойства', NULL, NULL),
(393, 392, 779, 780, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(394, 392, 781, 782, 6, 'Значение', 'user_photogallery_files/iblock/c67/c6776a9b695722ff440801ff6d664348.jpg', NULL),
(395, 376, 784, 795, 5, 'ЗначенияСвойства', NULL, NULL),
(396, 395, 785, 786, 6, 'Ид', '67', NULL),
(397, 395, 787, 788, 6, 'Значение', 'user_photogallery_files/iblock/a3d/a3d076dc9c2719c5a4197b3a656d0f51.jpg', NULL),
(398, 395, 789, 794, 6, 'ЗначениеСвойства', NULL, NULL),
(399, 398, 790, 791, 7, 'Значение', 'user_photogallery_files/iblock/a3d/a3d076dc9c2719c5a4197b3a656d0f51.jpg', NULL),
(400, 398, 792, 793, 7, 'Описание', NULL, NULL),
(401, 376, 796, 807, 5, 'ЗначенияСвойства', NULL, NULL),
(402, 401, 797, 798, 6, 'Ид', '68', NULL),
(403, 401, 799, 800, 6, 'Значение', 'Y', NULL),
(404, 401, 801, 806, 6, 'ЗначениеСвойства', NULL, NULL),
(405, 404, 802, 803, 7, 'Значение', 'Y', NULL),
(406, 404, 804, 805, 7, 'Описание', NULL, NULL),
(407, 376, 808, 819, 5, 'ЗначенияСвойства', NULL, NULL),
(408, 407, 809, 810, 6, 'Ид', '69', NULL),
(409, 407, 811, 812, 6, 'Значение', 'Y', NULL),
(410, 407, 813, 818, 6, 'ЗначениеСвойства', NULL, NULL),
(411, 410, 814, 815, 7, 'Значение', 'Y', NULL),
(412, 410, 816, 817, 7, 'Описание', NULL, NULL),
(413, 376, 820, 823, 5, 'ЗначенияСвойства', NULL, NULL),
(414, 413, 821, 822, 6, 'Ид', '70', NULL),
(415, 376, 824, 827, 5, 'ЗначенияСвойства', NULL, NULL),
(416, 415, 825, 826, 6, 'Ид', '71', NULL),
(417, 376, 828, 839, 5, 'ЗначенияСвойства', NULL, NULL),
(418, 417, 829, 830, 6, 'Ид', '72', NULL),
(419, 417, 831, 832, 6, 'Значение', '3', NULL),
(420, 417, 833, 838, 6, 'ЗначениеСвойства', NULL, NULL),
(421, 420, 834, 835, 7, 'Значение', '3', NULL),
(422, 420, 836, 837, 7, 'Описание', NULL, NULL),
(423, 376, 840, 851, 5, 'ЗначенияСвойства', NULL, NULL),
(424, 423, 841, 842, 6, 'Ид', '73', NULL),
(425, 423, 843, 844, 6, 'Значение', '15', NULL),
(426, 423, 845, 850, 6, 'ЗначениеСвойства', NULL, NULL),
(427, 426, 846, 847, 7, 'Значение', '15', NULL),
(428, 426, 848, 849, 7, 'Описание', NULL, NULL),
(429, 376, 852, 863, 5, 'ЗначенияСвойства', NULL, NULL),
(430, 429, 853, 854, 6, 'Ид', '74', NULL),
(431, 429, 855, 856, 6, 'Значение', '3.56', NULL),
(432, 429, 857, 862, 6, 'ЗначениеСвойства', NULL, NULL),
(433, 432, 858, 859, 7, 'Значение', '3.56', NULL),
(434, 432, 860, 861, 7, 'Описание', NULL, NULL),
(435, 236, 866, 997, 3, 'Товар', NULL, NULL),
(436, 435, 867, 868, 4, 'Ид', '2869', NULL),
(437, 435, 869, 870, 4, 'Наименование', '2.jpg', NULL),
(438, 435, 871, 872, 4, 'БитриксТеги', NULL, NULL),
(439, 435, 873, 876, 4, 'Группы', NULL, NULL),
(440, 439, 874, 875, 5, 'Ид', '751', NULL),
(441, 435, 877, 878, 4, 'Картинка', 'user_photogallery_files/iblock/c71/c71a0b858b3df5d15c4b8331f7aa4186.jpg', NULL),
(442, 435, 879, 996, 4, 'ЗначенияСвойств', NULL, NULL),
(443, 442, 880, 885, 5, 'ЗначенияСвойства', NULL, NULL),
(444, 443, 881, 882, 6, 'Ид', 'CML2_CODE', NULL),
(445, 443, 883, 884, 6, 'Значение', '2.jpg', NULL),
(446, 442, 886, 891, 5, 'ЗначенияСвойства', NULL, NULL),
(447, 446, 887, 888, 6, 'Ид', 'CML2_SORT', NULL),
(448, 446, 889, 890, 6, 'Значение', '500', NULL),
(449, 442, 892, 897, 5, 'ЗначенияСвойства', NULL, NULL),
(450, 449, 893, 894, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(451, 449, 895, 896, 6, 'Значение', NULL, NULL),
(452, 442, 898, 903, 5, 'ЗначенияСвойства', NULL, NULL),
(453, 452, 899, 900, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(454, 452, 901, 902, 6, 'Значение', NULL, NULL),
(455, 442, 904, 909, 5, 'ЗначенияСвойства', NULL, NULL),
(456, 455, 905, 906, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(457, 455, 907, 908, 6, 'Значение', NULL, NULL),
(458, 442, 910, 915, 5, 'ЗначенияСвойства', NULL, NULL),
(459, 458, 911, 912, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(460, 458, 913, 914, 6, 'Значение', 'user_photogallery_files/iblock/043/04394cddf6b6ed096ab44b99058c15ce.jpg', NULL),
(461, 442, 916, 927, 5, 'ЗначенияСвойства', NULL, NULL),
(462, 461, 917, 918, 6, 'Ид', '67', NULL),
(463, 461, 919, 920, 6, 'Значение', 'user_photogallery_files/iblock/7bc/7bc98e3aa0bb874f3662e097ea125363.jpg', NULL),
(464, 461, 921, 926, 6, 'ЗначениеСвойства', NULL, NULL),
(465, 464, 922, 923, 7, 'Значение', 'user_photogallery_files/iblock/7bc/7bc98e3aa0bb874f3662e097ea125363.jpg', NULL),
(466, 464, 924, 925, 7, 'Описание', NULL, NULL),
(467, 442, 928, 939, 5, 'ЗначенияСвойства', NULL, NULL),
(468, 467, 929, 930, 6, 'Ид', '68', NULL),
(469, 467, 931, 932, 6, 'Значение', 'Y', NULL),
(470, 467, 933, 938, 6, 'ЗначениеСвойства', NULL, NULL),
(471, 470, 934, 935, 7, 'Значение', 'Y', NULL),
(472, 470, 936, 937, 7, 'Описание', NULL, NULL),
(473, 442, 940, 951, 5, 'ЗначенияСвойства', NULL, NULL),
(474, 473, 941, 942, 6, 'Ид', '69', NULL),
(475, 473, 943, 944, 6, 'Значение', 'Y', NULL),
(476, 473, 945, 950, 6, 'ЗначениеСвойства', NULL, NULL),
(477, 476, 946, 947, 7, 'Значение', 'Y', NULL),
(478, 476, 948, 949, 7, 'Описание', NULL, NULL),
(479, 442, 952, 955, 5, 'ЗначенияСвойства', NULL, NULL),
(480, 479, 953, 954, 6, 'Ид', '70', NULL),
(481, 442, 956, 959, 5, 'ЗначенияСвойства', NULL, NULL),
(482, 481, 957, 958, 6, 'Ид', '71', NULL),
(483, 442, 960, 971, 5, 'ЗначенияСвойства', NULL, NULL),
(484, 483, 961, 962, 6, 'Ид', '72', NULL),
(485, 483, 963, 964, 6, 'Значение', '3', NULL),
(486, 483, 965, 970, 6, 'ЗначениеСвойства', NULL, NULL),
(487, 486, 966, 967, 7, 'Значение', '3', NULL),
(488, 486, 968, 969, 7, 'Описание', NULL, NULL),
(489, 442, 972, 983, 5, 'ЗначенияСвойства', NULL, NULL),
(490, 489, 973, 974, 6, 'Ид', '73', NULL),
(491, 489, 975, 976, 6, 'Значение', '15', NULL),
(492, 489, 977, 982, 6, 'ЗначениеСвойства', NULL, NULL),
(493, 492, 978, 979, 7, 'Значение', '15', NULL),
(494, 492, 980, 981, 7, 'Описание', NULL, NULL),
(495, 442, 984, 995, 5, 'ЗначенияСвойства', NULL, NULL),
(496, 495, 985, 986, 6, 'Ид', '74', NULL),
(497, 495, 987, 988, 6, 'Значение', '3.56', NULL),
(498, 495, 989, 994, 6, 'ЗначениеСвойства', NULL, NULL),
(499, 498, 990, 991, 7, 'Значение', '3.56', NULL),
(500, 498, 992, 993, 7, 'Описание', NULL, NULL),
(501, 236, 998, 1129, 3, 'Товар', NULL, NULL),
(502, 501, 999, 1000, 4, 'Ид', '2871', NULL),
(503, 501, 1001, 1002, 4, 'Наименование', '25.jpg', NULL),
(504, 501, 1003, 1004, 4, 'БитриксТеги', NULL, NULL),
(505, 501, 1005, 1008, 4, 'Группы', NULL, NULL),
(506, 505, 1006, 1007, 5, 'Ид', '751', NULL),
(507, 501, 1009, 1010, 4, 'Картинка', 'user_photogallery_files/iblock/ead/ead0ddd340f9a24132f488d0502e1de0.jpg', NULL),
(508, 501, 1011, 1128, 4, 'ЗначенияСвойств', NULL, NULL),
(509, 508, 1012, 1017, 5, 'ЗначенияСвойства', NULL, NULL),
(510, 509, 1013, 1014, 6, 'Ид', 'CML2_CODE', NULL),
(511, 509, 1015, 1016, 6, 'Значение', '25.jpg', NULL),
(512, 508, 1018, 1023, 5, 'ЗначенияСвойства', NULL, NULL),
(513, 512, 1019, 1020, 6, 'Ид', 'CML2_SORT', NULL),
(514, 512, 1021, 1022, 6, 'Значение', '500', NULL),
(515, 508, 1024, 1029, 5, 'ЗначенияСвойства', NULL, NULL),
(516, 515, 1025, 1026, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(517, 515, 1027, 1028, 6, 'Значение', NULL, NULL),
(518, 508, 1030, 1035, 5, 'ЗначенияСвойства', NULL, NULL),
(519, 518, 1031, 1032, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(520, 518, 1033, 1034, 6, 'Значение', NULL, NULL),
(521, 508, 1036, 1041, 5, 'ЗначенияСвойства', NULL, NULL),
(522, 521, 1037, 1038, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(523, 521, 1039, 1040, 6, 'Значение', NULL, NULL),
(524, 508, 1042, 1047, 5, 'ЗначенияСвойства', NULL, NULL),
(525, 524, 1043, 1044, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(526, 524, 1045, 1046, 6, 'Значение', 'user_photogallery_files/iblock/c31/c31796d752dcc444bffb554045a01dab.jpg', NULL),
(527, 508, 1048, 1059, 5, 'ЗначенияСвойства', NULL, NULL),
(528, 527, 1049, 1050, 6, 'Ид', '67', NULL),
(529, 527, 1051, 1052, 6, 'Значение', 'user_photogallery_files/iblock/fba/fba6364f1e882725de70fa6fa0570fcd.jpg', NULL),
(530, 527, 1053, 1058, 6, 'ЗначениеСвойства', NULL, NULL),
(531, 530, 1054, 1055, 7, 'Значение', 'user_photogallery_files/iblock/fba/fba6364f1e882725de70fa6fa0570fcd.jpg', NULL),
(532, 530, 1056, 1057, 7, 'Описание', NULL, NULL),
(533, 508, 1060, 1071, 5, 'ЗначенияСвойства', NULL, NULL),
(534, 533, 1061, 1062, 6, 'Ид', '68', NULL),
(535, 533, 1063, 1064, 6, 'Значение', 'Y', NULL),
(536, 533, 1065, 1070, 6, 'ЗначениеСвойства', NULL, NULL),
(537, 536, 1066, 1067, 7, 'Значение', 'Y', NULL),
(538, 536, 1068, 1069, 7, 'Описание', NULL, NULL),
(539, 508, 1072, 1083, 5, 'ЗначенияСвойства', NULL, NULL),
(540, 539, 1073, 1074, 6, 'Ид', '69', NULL),
(541, 539, 1075, 1076, 6, 'Значение', 'Y', NULL),
(542, 539, 1077, 1082, 6, 'ЗначениеСвойства', NULL, NULL),
(543, 542, 1078, 1079, 7, 'Значение', 'Y', NULL),
(544, 542, 1080, 1081, 7, 'Описание', NULL, NULL),
(545, 508, 1084, 1087, 5, 'ЗначенияСвойства', NULL, NULL),
(546, 545, 1085, 1086, 6, 'Ид', '70', NULL),
(547, 508, 1088, 1091, 5, 'ЗначенияСвойства', NULL, NULL),
(548, 547, 1089, 1090, 6, 'Ид', '71', NULL),
(549, 508, 1092, 1103, 5, 'ЗначенияСвойства', NULL, NULL),
(550, 549, 1093, 1094, 6, 'Ид', '72', NULL),
(551, 549, 1095, 1096, 6, 'Значение', '2', NULL),
(552, 549, 1097, 1102, 6, 'ЗначениеСвойства', NULL, NULL),
(553, 552, 1098, 1099, 7, 'Значение', '2', NULL),
(554, 552, 1100, 1101, 7, 'Описание', NULL, NULL),
(555, 508, 1104, 1115, 5, 'ЗначенияСвойства', NULL, NULL),
(556, 555, 1105, 1106, 6, 'Ид', '73', NULL),
(557, 555, 1107, 1108, 6, 'Значение', '10', NULL),
(558, 555, 1109, 1114, 6, 'ЗначениеСвойства', NULL, NULL),
(559, 558, 1110, 1111, 7, 'Значение', '10', NULL),
(560, 558, 1112, 1113, 7, 'Описание', NULL, NULL),
(561, 508, 1116, 1127, 5, 'ЗначенияСвойства', NULL, NULL),
(562, 561, 1117, 1118, 6, 'Ид', '74', NULL),
(563, 561, 1119, 1120, 6, 'Значение', '3.44', NULL),
(564, 561, 1121, 1126, 6, 'ЗначениеСвойства', NULL, NULL),
(565, 564, 1122, 1123, 7, 'Значение', '3.44', NULL),
(566, 564, 1124, 1125, 7, 'Описание', NULL, NULL),
(567, 236, 1130, 1261, 3, 'Товар', NULL, NULL),
(568, 567, 1131, 1132, 4, 'Ид', '2873', NULL),
(569, 567, 1133, 1134, 4, 'Наименование', '36.jpg', NULL),
(570, 567, 1135, 1136, 4, 'БитриксТеги', NULL, NULL),
(571, 567, 1137, 1140, 4, 'Группы', NULL, NULL),
(572, 571, 1138, 1139, 5, 'Ид', '751', NULL),
(573, 567, 1141, 1142, 4, 'Картинка', 'user_photogallery_files/iblock/2c8/2c813b79919e3287b6259d2e457db83e.jpg', NULL),
(574, 567, 1143, 1260, 4, 'ЗначенияСвойств', NULL, NULL),
(575, 574, 1144, 1149, 5, 'ЗначенияСвойства', NULL, NULL),
(576, 575, 1145, 1146, 6, 'Ид', 'CML2_CODE', NULL),
(577, 575, 1147, 1148, 6, 'Значение', '36.jpg', NULL),
(578, 574, 1150, 1155, 5, 'ЗначенияСвойства', NULL, NULL),
(579, 578, 1151, 1152, 6, 'Ид', 'CML2_SORT', NULL),
(580, 578, 1153, 1154, 6, 'Значение', '500', NULL),
(581, 574, 1156, 1161, 5, 'ЗначенияСвойства', NULL, NULL),
(582, 581, 1157, 1158, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(583, 581, 1159, 1160, 6, 'Значение', NULL, NULL),
(584, 574, 1162, 1167, 5, 'ЗначенияСвойства', NULL, NULL),
(585, 584, 1163, 1164, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(586, 584, 1165, 1166, 6, 'Значение', NULL, NULL),
(587, 574, 1168, 1173, 5, 'ЗначенияСвойства', NULL, NULL),
(588, 587, 1169, 1170, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(589, 587, 1171, 1172, 6, 'Значение', NULL, NULL),
(590, 574, 1174, 1179, 5, 'ЗначенияСвойства', NULL, NULL),
(591, 590, 1175, 1176, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(592, 590, 1177, 1178, 6, 'Значение', 'user_photogallery_files/iblock/34d/34d5d51b7d67475d846eefaa329827d7.jpg', NULL),
(593, 574, 1180, 1191, 5, 'ЗначенияСвойства', NULL, NULL),
(594, 593, 1181, 1182, 6, 'Ид', '67', NULL),
(595, 593, 1183, 1184, 6, 'Значение', 'user_photogallery_files/iblock/5ff/5ff0db8f24ecf84c2f17842e827672b0.jpg', NULL),
(596, 593, 1185, 1190, 6, 'ЗначениеСвойства', NULL, NULL),
(597, 596, 1186, 1187, 7, 'Значение', 'user_photogallery_files/iblock/5ff/5ff0db8f24ecf84c2f17842e827672b0.jpg', NULL),
(598, 596, 1188, 1189, 7, 'Описание', NULL, NULL),
(599, 574, 1192, 1203, 5, 'ЗначенияСвойства', NULL, NULL),
(600, 599, 1193, 1194, 6, 'Ид', '68', NULL),
(601, 599, 1195, 1196, 6, 'Значение', 'Y', NULL),
(602, 599, 1197, 1202, 6, 'ЗначениеСвойства', NULL, NULL),
(603, 602, 1198, 1199, 7, 'Значение', 'Y', NULL),
(604, 602, 1200, 1201, 7, 'Описание', NULL, NULL),
(605, 574, 1204, 1215, 5, 'ЗначенияСвойства', NULL, NULL),
(606, 605, 1205, 1206, 6, 'Ид', '69', NULL),
(607, 605, 1207, 1208, 6, 'Значение', 'Y', NULL),
(608, 605, 1209, 1214, 6, 'ЗначениеСвойства', NULL, NULL),
(609, 608, 1210, 1211, 7, 'Значение', 'Y', NULL),
(610, 608, 1212, 1213, 7, 'Описание', NULL, NULL),
(611, 574, 1216, 1219, 5, 'ЗначенияСвойства', NULL, NULL),
(612, 611, 1217, 1218, 6, 'Ид', '70', NULL),
(613, 574, 1220, 1223, 5, 'ЗначенияСвойства', NULL, NULL),
(614, 613, 1221, 1222, 6, 'Ид', '71', NULL),
(615, 574, 1224, 1235, 5, 'ЗначенияСвойства', NULL, NULL),
(616, 615, 1225, 1226, 6, 'Ид', '72', NULL),
(617, 615, 1227, 1228, 6, 'Значение', '2', NULL),
(618, 615, 1229, 1234, 6, 'ЗначениеСвойства', NULL, NULL),
(619, 618, 1230, 1231, 7, 'Значение', '2', NULL),
(620, 618, 1232, 1233, 7, 'Описание', NULL, NULL),
(621, 574, 1236, 1247, 5, 'ЗначенияСвойства', NULL, NULL),
(622, 621, 1237, 1238, 6, 'Ид', '73', NULL),
(623, 621, 1239, 1240, 6, 'Значение', '10', NULL),
(624, 621, 1241, 1246, 6, 'ЗначениеСвойства', NULL, NULL),
(625, 624, 1242, 1243, 7, 'Значение', '10', NULL),
(626, 624, 1244, 1245, 7, 'Описание', NULL, NULL),
(627, 574, 1248, 1259, 5, 'ЗначенияСвойства', NULL, NULL),
(628, 627, 1249, 1250, 6, 'Ид', '74', NULL),
(629, 627, 1251, 1252, 6, 'Значение', '3.44', NULL),
(630, 627, 1253, 1258, 6, 'ЗначениеСвойства', NULL, NULL),
(631, 630, 1254, 1255, 7, 'Значение', '3.44', NULL),
(632, 630, 1256, 1257, 7, 'Описание', NULL, NULL),
(633, 236, 1262, 1393, 3, 'Товар', NULL, NULL),
(634, 633, 1263, 1264, 4, 'Ид', '2874', NULL),
(635, 633, 1265, 1266, 4, 'Наименование', '38.jpg', NULL),
(636, 633, 1267, 1268, 4, 'БитриксТеги', NULL, NULL),
(637, 633, 1269, 1272, 4, 'Группы', NULL, NULL),
(638, 637, 1270, 1271, 5, 'Ид', '751', NULL),
(639, 633, 1273, 1274, 4, 'Картинка', 'user_photogallery_files/iblock/a4e/a4efc2b07b0276d30890ad1ba7908c25.jpg', NULL),
(640, 633, 1275, 1392, 4, 'ЗначенияСвойств', NULL, NULL),
(641, 640, 1276, 1281, 5, 'ЗначенияСвойства', NULL, NULL),
(642, 641, 1277, 1278, 6, 'Ид', 'CML2_CODE', NULL),
(643, 641, 1279, 1280, 6, 'Значение', '38.jpg', NULL),
(644, 640, 1282, 1287, 5, 'ЗначенияСвойства', NULL, NULL),
(645, 644, 1283, 1284, 6, 'Ид', 'CML2_SORT', NULL),
(646, 644, 1285, 1286, 6, 'Значение', '500', NULL),
(647, 640, 1288, 1293, 5, 'ЗначенияСвойства', NULL, NULL),
(648, 647, 1289, 1290, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(649, 647, 1291, 1292, 6, 'Значение', NULL, NULL),
(650, 640, 1294, 1299, 5, 'ЗначенияСвойства', NULL, NULL),
(651, 650, 1295, 1296, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(652, 650, 1297, 1298, 6, 'Значение', NULL, NULL),
(653, 640, 1300, 1305, 5, 'ЗначенияСвойства', NULL, NULL),
(654, 653, 1301, 1302, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(655, 653, 1303, 1304, 6, 'Значение', NULL, NULL),
(656, 640, 1306, 1311, 5, 'ЗначенияСвойства', NULL, NULL),
(657, 656, 1307, 1308, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(658, 656, 1309, 1310, 6, 'Значение', 'user_photogallery_files/iblock/d01/d0148f9672466e9209ac55ca948d002b.jpg', NULL),
(659, 640, 1312, 1323, 5, 'ЗначенияСвойства', NULL, NULL),
(660, 659, 1313, 1314, 6, 'Ид', '67', NULL),
(661, 659, 1315, 1316, 6, 'Значение', 'user_photogallery_files/iblock/07d/07de49ce9069307ffb4611656061e94a.jpg', NULL),
(662, 659, 1317, 1322, 6, 'ЗначениеСвойства', NULL, NULL),
(663, 662, 1318, 1319, 7, 'Значение', 'user_photogallery_files/iblock/07d/07de49ce9069307ffb4611656061e94a.jpg', NULL),
(664, 662, 1320, 1321, 7, 'Описание', NULL, NULL),
(665, 640, 1324, 1335, 5, 'ЗначенияСвойства', NULL, NULL),
(666, 665, 1325, 1326, 6, 'Ид', '68', NULL),
(667, 665, 1327, 1328, 6, 'Значение', 'Y', NULL),
(668, 665, 1329, 1334, 6, 'ЗначениеСвойства', NULL, NULL),
(669, 668, 1330, 1331, 7, 'Значение', 'Y', NULL),
(670, 668, 1332, 1333, 7, 'Описание', NULL, NULL),
(671, 640, 1336, 1347, 5, 'ЗначенияСвойства', NULL, NULL),
(672, 671, 1337, 1338, 6, 'Ид', '69', NULL),
(673, 671, 1339, 1340, 6, 'Значение', 'Y', NULL),
(674, 671, 1341, 1346, 6, 'ЗначениеСвойства', NULL, NULL),
(675, 674, 1342, 1343, 7, 'Значение', 'Y', NULL),
(676, 674, 1344, 1345, 7, 'Описание', NULL, NULL),
(677, 640, 1348, 1351, 5, 'ЗначенияСвойства', NULL, NULL),
(678, 677, 1349, 1350, 6, 'Ид', '70', NULL),
(679, 640, 1352, 1355, 5, 'ЗначенияСвойства', NULL, NULL),
(680, 679, 1353, 1354, 6, 'Ид', '71', NULL),
(681, 640, 1356, 1367, 5, 'ЗначенияСвойства', NULL, NULL),
(682, 681, 1357, 1358, 6, 'Ид', '72', NULL),
(683, 681, 1359, 1360, 6, 'Значение', '2', NULL),
(684, 681, 1361, 1366, 6, 'ЗначениеСвойства', NULL, NULL),
(685, 684, 1362, 1363, 7, 'Значение', '2', NULL),
(686, 684, 1364, 1365, 7, 'Описание', NULL, NULL),
(687, 640, 1368, 1379, 5, 'ЗначенияСвойства', NULL, NULL),
(688, 687, 1369, 1370, 6, 'Ид', '73', NULL),
(689, 687, 1371, 1372, 6, 'Значение', '10', NULL),
(690, 687, 1373, 1378, 6, 'ЗначениеСвойства', NULL, NULL),
(691, 690, 1374, 1375, 7, 'Значение', '10', NULL),
(692, 690, 1376, 1377, 7, 'Описание', NULL, NULL),
(693, 640, 1380, 1391, 5, 'ЗначенияСвойства', NULL, NULL),
(694, 693, 1381, 1382, 6, 'Ид', '74', NULL),
(695, 693, 1383, 1384, 6, 'Значение', '3.44', NULL),
(696, 693, 1385, 1390, 6, 'ЗначениеСвойства', NULL, NULL),
(697, 696, 1386, 1387, 7, 'Значение', '3.44', NULL),
(698, 696, 1388, 1389, 7, 'Описание', NULL, NULL),
(699, 236, 1394, 1525, 3, 'Товар', NULL, NULL),
(700, 699, 1395, 1396, 4, 'Ид', '2875', NULL),
(701, 699, 1397, 1398, 4, 'Наименование', '40.jpg', NULL),
(702, 699, 1399, 1400, 4, 'БитриксТеги', NULL, NULL),
(703, 699, 1401, 1404, 4, 'Группы', NULL, NULL),
(704, 703, 1402, 1403, 5, 'Ид', '751', NULL),
(705, 699, 1405, 1406, 4, 'Картинка', 'user_photogallery_files/iblock/013/01374c23f9ec15758f738a3de5c50765.jpg', NULL),
(706, 699, 1407, 1524, 4, 'ЗначенияСвойств', NULL, NULL),
(707, 706, 1408, 1413, 5, 'ЗначенияСвойства', NULL, NULL),
(708, 707, 1409, 1410, 6, 'Ид', 'CML2_CODE', NULL),
(709, 707, 1411, 1412, 6, 'Значение', '40.jpg', NULL),
(710, 706, 1414, 1419, 5, 'ЗначенияСвойства', NULL, NULL),
(711, 710, 1415, 1416, 6, 'Ид', 'CML2_SORT', NULL),
(712, 710, 1417, 1418, 6, 'Значение', '500', NULL),
(713, 706, 1420, 1425, 5, 'ЗначенияСвойства', NULL, NULL),
(714, 713, 1421, 1422, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(715, 713, 1423, 1424, 6, 'Значение', NULL, NULL),
(716, 706, 1426, 1431, 5, 'ЗначенияСвойства', NULL, NULL),
(717, 716, 1427, 1428, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(718, 716, 1429, 1430, 6, 'Значение', NULL, NULL),
(719, 706, 1432, 1437, 5, 'ЗначенияСвойства', NULL, NULL),
(720, 719, 1433, 1434, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(721, 719, 1435, 1436, 6, 'Значение', NULL, NULL),
(722, 706, 1438, 1443, 5, 'ЗначенияСвойства', NULL, NULL),
(723, 722, 1439, 1440, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(724, 722, 1441, 1442, 6, 'Значение', 'user_photogallery_files/iblock/e59/e592427eab7f35d794429bac173fb4c5.jpg', NULL),
(725, 706, 1444, 1455, 5, 'ЗначенияСвойства', NULL, NULL),
(726, 725, 1445, 1446, 6, 'Ид', '67', NULL),
(727, 725, 1447, 1448, 6, 'Значение', 'user_photogallery_files/iblock/c02/c02924cbfe9cd8104161e30de9b9afd7.jpg', NULL),
(728, 725, 1449, 1454, 6, 'ЗначениеСвойства', NULL, NULL),
(729, 728, 1450, 1451, 7, 'Значение', 'user_photogallery_files/iblock/c02/c02924cbfe9cd8104161e30de9b9afd7.jpg', NULL),
(730, 728, 1452, 1453, 7, 'Описание', NULL, NULL),
(731, 706, 1456, 1467, 5, 'ЗначенияСвойства', NULL, NULL),
(732, 731, 1457, 1458, 6, 'Ид', '68', NULL),
(733, 731, 1459, 1460, 6, 'Значение', 'Y', NULL),
(734, 731, 1461, 1466, 6, 'ЗначениеСвойства', NULL, NULL),
(735, 734, 1462, 1463, 7, 'Значение', 'Y', NULL),
(736, 734, 1464, 1465, 7, 'Описание', NULL, NULL),
(737, 706, 1468, 1479, 5, 'ЗначенияСвойства', NULL, NULL),
(738, 737, 1469, 1470, 6, 'Ид', '69', NULL),
(739, 737, 1471, 1472, 6, 'Значение', 'Y', NULL),
(740, 737, 1473, 1478, 6, 'ЗначениеСвойства', NULL, NULL),
(741, 740, 1474, 1475, 7, 'Значение', 'Y', NULL),
(742, 740, 1476, 1477, 7, 'Описание', NULL, NULL),
(743, 706, 1480, 1483, 5, 'ЗначенияСвойства', NULL, NULL),
(744, 743, 1481, 1482, 6, 'Ид', '70', NULL),
(745, 706, 1484, 1487, 5, 'ЗначенияСвойства', NULL, NULL),
(746, 745, 1485, 1486, 6, 'Ид', '71', NULL),
(747, 706, 1488, 1499, 5, 'ЗначенияСвойства', NULL, NULL),
(748, 747, 1489, 1490, 6, 'Ид', '72', NULL),
(749, 747, 1491, 1492, 6, 'Значение', '2', NULL),
(750, 747, 1493, 1498, 6, 'ЗначениеСвойства', NULL, NULL),
(751, 750, 1494, 1495, 7, 'Значение', '2', NULL),
(752, 750, 1496, 1497, 7, 'Описание', NULL, NULL),
(753, 706, 1500, 1511, 5, 'ЗначенияСвойства', NULL, NULL),
(754, 753, 1501, 1502, 6, 'Ид', '73', NULL),
(755, 753, 1503, 1504, 6, 'Значение', '10', NULL),
(756, 753, 1505, 1510, 6, 'ЗначениеСвойства', NULL, NULL),
(757, 756, 1506, 1507, 7, 'Значение', '10', NULL),
(758, 756, 1508, 1509, 7, 'Описание', NULL, NULL),
(759, 706, 1512, 1523, 5, 'ЗначенияСвойства', NULL, NULL),
(760, 759, 1513, 1514, 6, 'Ид', '74', NULL),
(761, 759, 1515, 1516, 6, 'Значение', '3.44', NULL),
(762, 759, 1517, 1522, 6, 'ЗначениеСвойства', NULL, NULL),
(763, 762, 1518, 1519, 7, 'Значение', '3.44', NULL),
(764, 762, 1520, 1521, 7, 'Описание', NULL, NULL),
(765, 236, 1526, 1657, 3, 'Товар', NULL, NULL),
(766, 765, 1527, 1528, 4, 'Ид', '2876', NULL),
(767, 765, 1529, 1530, 4, 'Наименование', '46.jpg', NULL),
(768, 765, 1531, 1532, 4, 'БитриксТеги', NULL, NULL),
(769, 765, 1533, 1536, 4, 'Группы', NULL, NULL),
(770, 769, 1534, 1535, 5, 'Ид', '751', NULL),
(771, 765, 1537, 1538, 4, 'Картинка', 'user_photogallery_files/iblock/b2d/b2d0868bae56f45e80c5a6d52626b5f2.jpg', NULL),
(772, 765, 1539, 1656, 4, 'ЗначенияСвойств', NULL, NULL),
(773, 772, 1540, 1545, 5, 'ЗначенияСвойства', NULL, NULL),
(774, 773, 1541, 1542, 6, 'Ид', 'CML2_CODE', NULL),
(775, 773, 1543, 1544, 6, 'Значение', '46.jpg', NULL),
(776, 772, 1546, 1551, 5, 'ЗначенияСвойства', NULL, NULL),
(777, 776, 1547, 1548, 6, 'Ид', 'CML2_SORT', NULL),
(778, 776, 1549, 1550, 6, 'Значение', '500', NULL),
(779, 772, 1552, 1557, 5, 'ЗначенияСвойства', NULL, NULL),
(780, 779, 1553, 1554, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(781, 779, 1555, 1556, 6, 'Значение', NULL, NULL),
(782, 772, 1558, 1563, 5, 'ЗначенияСвойства', NULL, NULL),
(783, 782, 1559, 1560, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(784, 782, 1561, 1562, 6, 'Значение', NULL, NULL),
(785, 772, 1564, 1569, 5, 'ЗначенияСвойства', NULL, NULL),
(786, 785, 1565, 1566, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(787, 785, 1567, 1568, 6, 'Значение', NULL, NULL),
(788, 772, 1570, 1575, 5, 'ЗначенияСвойства', NULL, NULL),
(789, 788, 1571, 1572, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(790, 788, 1573, 1574, 6, 'Значение', 'user_photogallery_files/iblock/437/437563e3bb585cf6da5098f993d87c9a.jpg', NULL),
(791, 772, 1576, 1587, 5, 'ЗначенияСвойства', NULL, NULL),
(792, 791, 1577, 1578, 6, 'Ид', '67', NULL),
(793, 791, 1579, 1580, 6, 'Значение', 'user_photogallery_files/iblock/e23/e23aec2e2cb88a7839b09d9f8aefa74e.jpg', NULL),
(794, 791, 1581, 1586, 6, 'ЗначениеСвойства', NULL, NULL),
(795, 794, 1582, 1583, 7, 'Значение', 'user_photogallery_files/iblock/e23/e23aec2e2cb88a7839b09d9f8aefa74e.jpg', NULL),
(796, 794, 1584, 1585, 7, 'Описание', NULL, NULL),
(797, 772, 1588, 1599, 5, 'ЗначенияСвойства', NULL, NULL),
(798, 797, 1589, 1590, 6, 'Ид', '68', NULL),
(799, 797, 1591, 1592, 6, 'Значение', 'Y', NULL),
(800, 797, 1593, 1598, 6, 'ЗначениеСвойства', NULL, NULL),
(801, 800, 1594, 1595, 7, 'Значение', 'Y', NULL),
(802, 800, 1596, 1597, 7, 'Описание', NULL, NULL),
(803, 772, 1600, 1611, 5, 'ЗначенияСвойства', NULL, NULL),
(804, 803, 1601, 1602, 6, 'Ид', '69', NULL),
(805, 803, 1603, 1604, 6, 'Значение', 'Y', NULL),
(806, 803, 1605, 1610, 6, 'ЗначениеСвойства', NULL, NULL),
(807, 806, 1606, 1607, 7, 'Значение', 'Y', NULL),
(808, 806, 1608, 1609, 7, 'Описание', NULL, NULL),
(809, 772, 1612, 1615, 5, 'ЗначенияСвойства', NULL, NULL),
(810, 809, 1613, 1614, 6, 'Ид', '70', NULL),
(811, 772, 1616, 1619, 5, 'ЗначенияСвойства', NULL, NULL),
(812, 811, 1617, 1618, 6, 'Ид', '71', NULL),
(813, 772, 1620, 1631, 5, 'ЗначенияСвойства', NULL, NULL),
(814, 813, 1621, 1622, 6, 'Ид', '72', NULL),
(815, 813, 1623, 1624, 6, 'Значение', '2', NULL),
(816, 813, 1625, 1630, 6, 'ЗначениеСвойства', NULL, NULL),
(817, 816, 1626, 1627, 7, 'Значение', '2', NULL),
(818, 816, 1628, 1629, 7, 'Описание', NULL, NULL),
(819, 772, 1632, 1643, 5, 'ЗначенияСвойства', NULL, NULL),
(820, 819, 1633, 1634, 6, 'Ид', '73', NULL),
(821, 819, 1635, 1636, 6, 'Значение', '10', NULL),
(822, 819, 1637, 1642, 6, 'ЗначениеСвойства', NULL, NULL),
(823, 822, 1638, 1639, 7, 'Значение', '10', NULL),
(824, 822, 1640, 1641, 7, 'Описание', NULL, NULL),
(825, 772, 1644, 1655, 5, 'ЗначенияСвойства', NULL, NULL),
(826, 825, 1645, 1646, 6, 'Ид', '74', NULL),
(827, 825, 1647, 1648, 6, 'Значение', '3.44', NULL),
(828, 825, 1649, 1654, 6, 'ЗначениеСвойства', NULL, NULL),
(829, 828, 1650, 1651, 7, 'Значение', '3.44', NULL),
(830, 828, 1652, 1653, 7, 'Описание', NULL, NULL),
(831, 236, 1658, 1789, 3, 'Товар', NULL, NULL),
(832, 831, 1659, 1660, 4, 'Ид', '2877', NULL),
(833, 831, 1661, 1662, 4, 'Наименование', '48.jpg', NULL),
(834, 831, 1663, 1664, 4, 'БитриксТеги', NULL, NULL),
(835, 831, 1665, 1668, 4, 'Группы', NULL, NULL),
(836, 835, 1666, 1667, 5, 'Ид', '751', NULL),
(837, 831, 1669, 1670, 4, 'Картинка', 'user_photogallery_files/iblock/f1f/f1f627091745907851b2efc3ac6c3d69.jpg', NULL),
(838, 831, 1671, 1788, 4, 'ЗначенияСвойств', NULL, NULL),
(839, 838, 1672, 1677, 5, 'ЗначенияСвойства', NULL, NULL),
(840, 839, 1673, 1674, 6, 'Ид', 'CML2_CODE', NULL),
(841, 839, 1675, 1676, 6, 'Значение', '48.jpg', NULL),
(842, 838, 1678, 1683, 5, 'ЗначенияСвойства', NULL, NULL),
(843, 842, 1679, 1680, 6, 'Ид', 'CML2_SORT', NULL),
(844, 842, 1681, 1682, 6, 'Значение', '500', NULL),
(845, 838, 1684, 1689, 5, 'ЗначенияСвойства', NULL, NULL),
(846, 845, 1685, 1686, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(847, 845, 1687, 1688, 6, 'Значение', NULL, NULL),
(848, 838, 1690, 1695, 5, 'ЗначенияСвойства', NULL, NULL),
(849, 848, 1691, 1692, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(850, 848, 1693, 1694, 6, 'Значение', NULL, NULL),
(851, 838, 1696, 1701, 5, 'ЗначенияСвойства', NULL, NULL),
(852, 851, 1697, 1698, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(853, 851, 1699, 1700, 6, 'Значение', NULL, NULL),
(854, 838, 1702, 1707, 5, 'ЗначенияСвойства', NULL, NULL),
(855, 854, 1703, 1704, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(856, 854, 1705, 1706, 6, 'Значение', 'user_photogallery_files/iblock/baf/bafc10c43d9d489c98227238b89d480b.jpg', NULL),
(857, 838, 1708, 1719, 5, 'ЗначенияСвойства', NULL, NULL),
(858, 857, 1709, 1710, 6, 'Ид', '67', NULL),
(859, 857, 1711, 1712, 6, 'Значение', 'user_photogallery_files/iblock/3ce/3ce7864deca81a8f76da6bfb3cad3431.jpg', NULL),
(860, 857, 1713, 1718, 6, 'ЗначениеСвойства', NULL, NULL),
(861, 860, 1714, 1715, 7, 'Значение', 'user_photogallery_files/iblock/3ce/3ce7864deca81a8f76da6bfb3cad3431.jpg', NULL),
(862, 860, 1716, 1717, 7, 'Описание', NULL, NULL),
(863, 838, 1720, 1731, 5, 'ЗначенияСвойства', NULL, NULL),
(864, 863, 1721, 1722, 6, 'Ид', '68', NULL),
(865, 863, 1723, 1724, 6, 'Значение', 'Y', NULL),
(866, 863, 1725, 1730, 6, 'ЗначениеСвойства', NULL, NULL),
(867, 866, 1726, 1727, 7, 'Значение', 'Y', NULL),
(868, 866, 1728, 1729, 7, 'Описание', NULL, NULL),
(869, 838, 1732, 1743, 5, 'ЗначенияСвойства', NULL, NULL),
(870, 869, 1733, 1734, 6, 'Ид', '69', NULL),
(871, 869, 1735, 1736, 6, 'Значение', 'Y', NULL),
(872, 869, 1737, 1742, 6, 'ЗначениеСвойства', NULL, NULL),
(873, 872, 1738, 1739, 7, 'Значение', 'Y', NULL),
(874, 872, 1740, 1741, 7, 'Описание', NULL, NULL),
(875, 838, 1744, 1747, 5, 'ЗначенияСвойства', NULL, NULL),
(876, 875, 1745, 1746, 6, 'Ид', '70', NULL),
(877, 838, 1748, 1751, 5, 'ЗначенияСвойства', NULL, NULL),
(878, 877, 1749, 1750, 6, 'Ид', '71', NULL),
(879, 838, 1752, 1763, 5, 'ЗначенияСвойства', NULL, NULL),
(880, 879, 1753, 1754, 6, 'Ид', '72', NULL),
(881, 879, 1755, 1756, 6, 'Значение', '1', NULL),
(882, 879, 1757, 1762, 6, 'ЗначениеСвойства', NULL, NULL),
(883, 882, 1758, 1759, 7, 'Значение', '1', NULL),
(884, 882, 1760, 1761, 7, 'Описание', NULL, NULL),
(885, 838, 1764, 1775, 5, 'ЗначенияСвойства', NULL, NULL),
(886, 885, 1765, 1766, 6, 'Ид', '73', NULL),
(887, 885, 1767, 1768, 6, 'Значение', '5', NULL),
(888, 885, 1769, 1774, 6, 'ЗначениеСвойства', NULL, NULL),
(889, 888, 1770, 1771, 7, 'Значение', '5', NULL),
(890, 888, 1772, 1773, 7, 'Описание', NULL, NULL),
(891, 838, 1776, 1787, 5, 'ЗначенияСвойства', NULL, NULL),
(892, 891, 1777, 1778, 6, 'Ид', '74', NULL),
(893, 891, 1779, 1780, 6, 'Значение', '3.3', NULL),
(894, 891, 1781, 1786, 6, 'ЗначениеСвойства', NULL, NULL),
(895, 894, 1782, 1783, 7, 'Значение', '3.3', NULL),
(896, 894, 1784, 1785, 7, 'Описание', NULL, NULL),
(897, 236, 1790, 1921, 3, 'Товар', NULL, NULL),
(898, 897, 1791, 1792, 4, 'Ид', '2878', NULL),
(899, 897, 1793, 1794, 4, 'Наименование', '50.jpg', NULL),
(900, 897, 1795, 1796, 4, 'БитриксТеги', NULL, NULL),
(901, 897, 1797, 1800, 4, 'Группы', NULL, NULL),
(902, 901, 1798, 1799, 5, 'Ид', '751', NULL);
INSERT INTO `b_xml_tree` (`ID`, `PARENT_ID`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `NAME`, `VALUE`, `ATTRIBUTES`) VALUES
(903, 897, 1801, 1802, 4, 'Картинка', 'user_photogallery_files/iblock/175/1750ca30210af6d002932007b9f2c199.jpg', NULL),
(904, 897, 1803, 1920, 4, 'ЗначенияСвойств', NULL, NULL),
(905, 904, 1804, 1809, 5, 'ЗначенияСвойства', NULL, NULL),
(906, 905, 1805, 1806, 6, 'Ид', 'CML2_CODE', NULL),
(907, 905, 1807, 1808, 6, 'Значение', '50.jpg', NULL),
(908, 904, 1810, 1815, 5, 'ЗначенияСвойства', NULL, NULL),
(909, 908, 1811, 1812, 6, 'Ид', 'CML2_SORT', NULL),
(910, 908, 1813, 1814, 6, 'Значение', '500', NULL),
(911, 904, 1816, 1821, 5, 'ЗначенияСвойства', NULL, NULL),
(912, 911, 1817, 1818, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(913, 911, 1819, 1820, 6, 'Значение', NULL, NULL),
(914, 904, 1822, 1827, 5, 'ЗначенияСвойства', NULL, NULL),
(915, 914, 1823, 1824, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(916, 914, 1825, 1826, 6, 'Значение', NULL, NULL),
(917, 904, 1828, 1833, 5, 'ЗначенияСвойства', NULL, NULL),
(918, 917, 1829, 1830, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(919, 917, 1831, 1832, 6, 'Значение', NULL, NULL),
(920, 904, 1834, 1839, 5, 'ЗначенияСвойства', NULL, NULL),
(921, 920, 1835, 1836, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(922, 920, 1837, 1838, 6, 'Значение', 'user_photogallery_files/iblock/4a6/4a6be213d9a82c6146a7cd1094764015.jpg', NULL),
(923, 904, 1840, 1851, 5, 'ЗначенияСвойства', NULL, NULL),
(924, 923, 1841, 1842, 6, 'Ид', '67', NULL),
(925, 923, 1843, 1844, 6, 'Значение', 'user_photogallery_files/iblock/546/546d289c986f5db6863f06c209a51f5b.jpg', NULL),
(926, 923, 1845, 1850, 6, 'ЗначениеСвойства', NULL, NULL),
(927, 926, 1846, 1847, 7, 'Значение', 'user_photogallery_files/iblock/546/546d289c986f5db6863f06c209a51f5b.jpg', NULL),
(928, 926, 1848, 1849, 7, 'Описание', NULL, NULL),
(929, 904, 1852, 1863, 5, 'ЗначенияСвойства', NULL, NULL),
(930, 929, 1853, 1854, 6, 'Ид', '68', NULL),
(931, 929, 1855, 1856, 6, 'Значение', 'Y', NULL),
(932, 929, 1857, 1862, 6, 'ЗначениеСвойства', NULL, NULL),
(933, 932, 1858, 1859, 7, 'Значение', 'Y', NULL),
(934, 932, 1860, 1861, 7, 'Описание', NULL, NULL),
(935, 904, 1864, 1875, 5, 'ЗначенияСвойства', NULL, NULL),
(936, 935, 1865, 1866, 6, 'Ид', '69', NULL),
(937, 935, 1867, 1868, 6, 'Значение', 'Y', NULL),
(938, 935, 1869, 1874, 6, 'ЗначениеСвойства', NULL, NULL),
(939, 938, 1870, 1871, 7, 'Значение', 'Y', NULL),
(940, 938, 1872, 1873, 7, 'Описание', NULL, NULL),
(941, 904, 1876, 1879, 5, 'ЗначенияСвойства', NULL, NULL),
(942, 941, 1877, 1878, 6, 'Ид', '70', NULL),
(943, 904, 1880, 1883, 5, 'ЗначенияСвойства', NULL, NULL),
(944, 943, 1881, 1882, 6, 'Ид', '71', NULL),
(945, 904, 1884, 1895, 5, 'ЗначенияСвойства', NULL, NULL),
(946, 945, 1885, 1886, 6, 'Ид', '72', NULL),
(947, 945, 1887, 1888, 6, 'Значение', '1', NULL),
(948, 945, 1889, 1894, 6, 'ЗначениеСвойства', NULL, NULL),
(949, 948, 1890, 1891, 7, 'Значение', '1', NULL),
(950, 948, 1892, 1893, 7, 'Описание', NULL, NULL),
(951, 904, 1896, 1907, 5, 'ЗначенияСвойства', NULL, NULL),
(952, 951, 1897, 1898, 6, 'Ид', '73', NULL),
(953, 951, 1899, 1900, 6, 'Значение', '5', NULL),
(954, 951, 1901, 1906, 6, 'ЗначениеСвойства', NULL, NULL),
(955, 954, 1902, 1903, 7, 'Значение', '5', NULL),
(956, 954, 1904, 1905, 7, 'Описание', NULL, NULL),
(957, 904, 1908, 1919, 5, 'ЗначенияСвойства', NULL, NULL),
(958, 957, 1909, 1910, 6, 'Ид', '74', NULL),
(959, 957, 1911, 1912, 6, 'Значение', '3.3', NULL),
(960, 957, 1913, 1918, 6, 'ЗначениеСвойства', NULL, NULL),
(961, 960, 1914, 1915, 7, 'Значение', '3.3', NULL),
(962, 960, 1916, 1917, 7, 'Описание', NULL, NULL),
(963, 236, 1922, 2053, 3, 'Товар', NULL, NULL),
(964, 963, 1923, 1924, 4, 'Ид', '2879', NULL),
(965, 963, 1925, 1926, 4, 'Наименование', '8.jpg', NULL),
(966, 963, 1927, 1928, 4, 'БитриксТеги', NULL, NULL),
(967, 963, 1929, 1932, 4, 'Группы', NULL, NULL),
(968, 967, 1930, 1931, 5, 'Ид', '751', NULL),
(969, 963, 1933, 1934, 4, 'Картинка', 'user_photogallery_files/iblock/ed7/ed716b8ba553ff8a42780c3c11f37ca5.jpg', NULL),
(970, 963, 1935, 2052, 4, 'ЗначенияСвойств', NULL, NULL),
(971, 970, 1936, 1941, 5, 'ЗначенияСвойства', NULL, NULL),
(972, 971, 1937, 1938, 6, 'Ид', 'CML2_CODE', NULL),
(973, 971, 1939, 1940, 6, 'Значение', '8.jpg', NULL),
(974, 970, 1942, 1947, 5, 'ЗначенияСвойства', NULL, NULL),
(975, 974, 1943, 1944, 6, 'Ид', 'CML2_SORT', NULL),
(976, 974, 1945, 1946, 6, 'Значение', '500', NULL),
(977, 970, 1948, 1953, 5, 'ЗначенияСвойства', NULL, NULL),
(978, 977, 1949, 1950, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(979, 977, 1951, 1952, 6, 'Значение', NULL, NULL),
(980, 970, 1954, 1959, 5, 'ЗначенияСвойства', NULL, NULL),
(981, 980, 1955, 1956, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(982, 980, 1957, 1958, 6, 'Значение', NULL, NULL),
(983, 970, 1960, 1965, 5, 'ЗначенияСвойства', NULL, NULL),
(984, 983, 1961, 1962, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(985, 983, 1963, 1964, 6, 'Значение', NULL, NULL),
(986, 970, 1966, 1971, 5, 'ЗначенияСвойства', NULL, NULL),
(987, 986, 1967, 1968, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(988, 986, 1969, 1970, 6, 'Значение', 'user_photogallery_files/iblock/0ad/0adffa1c0cc376da0e281a8aa4bfb6ae.jpg', NULL),
(989, 970, 1972, 1983, 5, 'ЗначенияСвойства', NULL, NULL),
(990, 989, 1973, 1974, 6, 'Ид', '67', NULL),
(991, 989, 1975, 1976, 6, 'Значение', 'user_photogallery_files/iblock/1af/1afe6fe0d6f65941fc9571e017b9167d.jpg', NULL),
(992, 989, 1977, 1982, 6, 'ЗначениеСвойства', NULL, NULL),
(993, 992, 1978, 1979, 7, 'Значение', 'user_photogallery_files/iblock/1af/1afe6fe0d6f65941fc9571e017b9167d.jpg', NULL),
(994, 992, 1980, 1981, 7, 'Описание', NULL, NULL),
(995, 970, 1984, 1995, 5, 'ЗначенияСвойства', NULL, NULL),
(996, 995, 1985, 1986, 6, 'Ид', '68', NULL),
(997, 995, 1987, 1988, 6, 'Значение', 'Y', NULL),
(998, 995, 1989, 1994, 6, 'ЗначениеСвойства', NULL, NULL),
(999, 998, 1990, 1991, 7, 'Значение', 'Y', NULL),
(1000, 998, 1992, 1993, 7, 'Описание', NULL, NULL),
(1001, 970, 1996, 2007, 5, 'ЗначенияСвойства', NULL, NULL),
(1002, 1001, 1997, 1998, 6, 'Ид', '69', NULL),
(1003, 1001, 1999, 2000, 6, 'Значение', 'Y', NULL),
(1004, 1001, 2001, 2006, 6, 'ЗначениеСвойства', NULL, NULL),
(1005, 1004, 2002, 2003, 7, 'Значение', 'Y', NULL),
(1006, 1004, 2004, 2005, 7, 'Описание', NULL, NULL),
(1007, 970, 2008, 2011, 5, 'ЗначенияСвойства', NULL, NULL),
(1008, 1007, 2009, 2010, 6, 'Ид', '70', NULL),
(1009, 970, 2012, 2015, 5, 'ЗначенияСвойства', NULL, NULL),
(1010, 1009, 2013, 2014, 6, 'Ид', '71', NULL),
(1011, 970, 2016, 2027, 5, 'ЗначенияСвойства', NULL, NULL),
(1012, 1011, 2017, 2018, 6, 'Ид', '72', NULL),
(1013, 1011, 2019, 2020, 6, 'Значение', '1', NULL),
(1014, 1011, 2021, 2026, 6, 'ЗначениеСвойства', NULL, NULL),
(1015, 1014, 2022, 2023, 7, 'Значение', '1', NULL),
(1016, 1014, 2024, 2025, 7, 'Описание', NULL, NULL),
(1017, 970, 2028, 2039, 5, 'ЗначенияСвойства', NULL, NULL),
(1018, 1017, 2029, 2030, 6, 'Ид', '73', NULL),
(1019, 1017, 2031, 2032, 6, 'Значение', '5', NULL),
(1020, 1017, 2033, 2038, 6, 'ЗначениеСвойства', NULL, NULL),
(1021, 1020, 2034, 2035, 7, 'Значение', '5', NULL),
(1022, 1020, 2036, 2037, 7, 'Описание', NULL, NULL),
(1023, 970, 2040, 2051, 5, 'ЗначенияСвойства', NULL, NULL),
(1024, 1023, 2041, 2042, 6, 'Ид', '74', NULL),
(1025, 1023, 2043, 2044, 6, 'Значение', '3.3', NULL),
(1026, 1023, 2045, 2050, 6, 'ЗначениеСвойства', NULL, NULL),
(1027, 1026, 2046, 2047, 7, 'Значение', '3.3', NULL),
(1028, 1026, 2048, 2049, 7, 'Описание', NULL, NULL),
(1029, 0, 1, 0, 0, '', NULL, NULL),
(1030, 0, 1, 0, 0, '', NULL, NULL),
(1031, 0, 2, 0, 0, '', NULL, NULL),
(1032, 0, 3, 0, 0, '', NULL, NULL),
(1033, 0, 4, 0, 0, '', NULL, NULL),
(1034, 0, 5, 0, 0, '', NULL, NULL),
(1035, 0, 6, 0, 0, '', NULL, NULL),
(1036, 0, 7, 0, 0, '', NULL, NULL),
(1037, 0, 8, 0, 0, '', NULL, NULL),
(1038, 0, 9, 0, 0, '', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_AD_TAG` (`TAG`);

--
-- Индексы таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  ADD KEY `IX_ADM_NTFY_LID` (`LID`);

--
-- Индексы таблицы `b_agent`
--
ALTER TABLE `b_agent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  ADD KEY `ix_agent_user_id` (`USER_ID`),
  ADD KEY `ix_agent_name` (`NAME`(100)),
  ADD KEY `ix_agent_act_period_next_exec` (`ACTIVE`,`IS_PERIOD`,`NEXT_EXEC`);

--
-- Индексы таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_app_password_user` (`USER_ID`);

--
-- Индексы таблицы `b_b24connector_buttons`
--
ALTER TABLE `b_b24connector_buttons`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_b24connector_button_site`
--
ALTER TABLE `b_b24connector_button_site`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BUTTON_ID` (`BUTTON_ID`);

--
-- Индексы таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_bitrixcloud_option_1` (`NAME`);

--
-- Индексы таблицы `b_blog`
--
ALTER TABLE `b_blog`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  ADD KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  ADD KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  ADD KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  ADD KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`);

--
-- Индексы таблицы `b_blog_category`
--
ALTER TABLE `b_blog_category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`);

--
-- Индексы таблицы `b_blog_comment`
--
ALTER TABLE `b_blog_comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  ADD KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  ADD KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  ADD KEY `IX_BLOG_COMM_4` (`POST_ID`);

--
-- Индексы таблицы `b_blog_group`
--
ALTER TABLE `b_blog_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_GROUP_1` (`SITE_ID`);

--
-- Индексы таблицы `b_blog_image`
--
ALTER TABLE `b_blog_image`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`);

--
-- Индексы таблицы `b_blog_post`
--
ALTER TABLE `b_blog_post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  ADD KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  ADD KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  ADD KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  ADD KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  ADD KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  ADD KEY `IX_BLOG_POST_6` (`CODE`);

--
-- Индексы таблицы `b_blog_post_category`
--
ALTER TABLE `b_blog_post_category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  ADD KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`);

--
-- Индексы таблицы `b_blog_post_param`
--
ALTER TABLE `b_blog_post_param`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  ADD KEY `IX_BLOG_PP_2` (`USER_ID`);

--
-- Индексы таблицы `b_blog_site_path`
--
ALTER TABLE `b_blog_site_path`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`);

--
-- Индексы таблицы `b_blog_socnet`
--
ALTER TABLE `b_blog_socnet`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`);

--
-- Индексы таблицы `b_blog_socnet_rights`
--
ALTER TABLE `b_blog_socnet_rights`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_SR_1` (`POST_ID`),
  ADD KEY `IX_BLOG_SR_2` (`ENTITY`);

--
-- Индексы таблицы `b_blog_trackback`
--
ALTER TABLE `b_blog_trackback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  ADD KEY `IX_BLOG_TRBK_2` (`POST_ID`);

--
-- Индексы таблицы `b_blog_user`
--
ALTER TABLE `b_blog_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  ADD KEY `IX_BLOG_USER_2` (`ALIAS`);

--
-- Индексы таблицы `b_blog_user2blog`
--
ALTER TABLE `b_blog_user2blog`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`);

--
-- Индексы таблицы `b_blog_user2user_group`
--
ALTER TABLE `b_blog_user2user_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`);

--
-- Индексы таблицы `b_blog_user_group`
--
ALTER TABLE `b_blog_user_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`);

--
-- Индексы таблицы `b_blog_user_group_perms`
--
ALTER TABLE `b_blog_user_group_perms`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  ADD KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  ADD KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`);

--
-- Индексы таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  ADD KEY `ix_b_cache_tag_1` (`TAG`);

--
-- Индексы таблицы `b_captcha`
--
ALTER TABLE `b_captcha`
  ADD UNIQUE KEY `UX_B_CAPTCHA` (`ID`);

--
-- Индексы таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_copy_queue`
--
ALTER TABLE `b_clouds_copy_queue`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_delete_queue`
--
ALTER TABLE `b_clouds_delete_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100));

--
-- Индексы таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_file_hash`
--
ALTER TABLE `b_clouds_file_hash`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_clouds_file_hash` (`BUCKET_ID`,`FILE_PATH`(190));

--
-- Индексы таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  ADD KEY `ix_b_file_resize_file` (`FILE_ID`);

--
-- Индексы таблицы `b_clouds_file_save`
--
ALTER TABLE `b_clouds_file_save`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_clouds_file_upload`
--
ALTER TABLE `b_clouds_file_upload`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  ADD KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  ADD KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`);

--
-- Индексы таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  ADD KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`);

--
-- Индексы таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  ADD KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  ADD KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`);

--
-- Индексы таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`);

--
-- Индексы таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  ADD KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`);

--
-- Индексы таблицы `b_consent_user_consent_item`
--
ALTER TABLE `b_consent_user_consent_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`);

--
-- Индексы таблицы `b_counter_data`
--
ALTER TABLE `b_counter_data`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_culture`
--
ALTER TABLE `b_culture`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_entity_usage`
--
ALTER TABLE `b_entity_usage`
  ADD PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  ADD KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  ADD KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`);

--
-- Индексы таблицы `b_event`
--
ALTER TABLE `b_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_success` (`SUCCESS_EXEC`),
  ADD KEY `ix_b_event_date_exec` (`DATE_EXEC`);

--
-- Индексы таблицы `b_event_attachment`
--
ALTER TABLE `b_event_attachment`
  ADD PRIMARY KEY (`EVENT_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  ADD KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`);

--
-- Индексы таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_event_message_attachment`
--
ALTER TABLE `b_event_message_attachment`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_message_site`
--
ALTER TABLE `b_event_message_site`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`);

--
-- Индексы таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_file`
--
ALTER TABLE `b_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_file_duplicate`
--
ALTER TABLE `b_file_duplicate`
  ADD PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  ADD KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`);

--
-- Индексы таблицы `b_file_hash`
--
ALTER TABLE `b_file_hash`
  ADD PRIMARY KEY (`FILE_ID`),
  ADD KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`);

--
-- Индексы таблицы `b_file_preview`
--
ALTER TABLE `b_file_preview`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  ADD KEY `IX_B_FILE_PL_FILE` (`FILE_ID`);

--
-- Индексы таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_file_version`
--
ALTER TABLE `b_file_version`
  ADD PRIMARY KEY (`ORIGINAL_ID`),
  ADD UNIQUE KEY `ux_file_version_version` (`VERSION_ID`);

--
-- Индексы таблицы `b_filters`
--
ALTER TABLE `b_filters`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_finder_dest`
--
ALTER TABLE `b_finder_dest`
  ADD PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  ADD KEY `IX_FINDER_DEST` (`CODE_TYPE`);

--
-- Индексы таблицы `b_form`
--
ALTER TABLE `b_form`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_SID` (`SID`);

--
-- Индексы таблицы `b_form_2_group`
--
ALTER TABLE `b_form_2_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_ID` (`FORM_ID`);

--
-- Индексы таблицы `b_form_2_mail_template`
--
ALTER TABLE `b_form_2_mail_template`
  ADD PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`);

--
-- Индексы таблицы `b_form_2_site`
--
ALTER TABLE `b_form_2_site`
  ADD PRIMARY KEY (`FORM_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_form_answer`
--
ALTER TABLE `b_form_answer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FIELD_ID` (`FIELD_ID`);

--
-- Индексы таблицы `b_form_crm`
--
ALTER TABLE `b_form_crm`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_form_crm_field`
--
ALTER TABLE `b_form_crm_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_form_crm_field_1` (`LINK_ID`);

--
-- Индексы таблицы `b_form_crm_link`
--
ALTER TABLE `b_form_crm_link`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`);

--
-- Индексы таблицы `b_form_field`
--
ALTER TABLE `b_form_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_ID` (`FORM_ID`),
  ADD KEY `IX_SID` (`SID`);

--
-- Индексы таблицы `b_form_field_filter`
--
ALTER TABLE `b_form_field_filter`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FIELD_ID` (`FIELD_ID`);

--
-- Индексы таблицы `b_form_field_validator`
--
ALTER TABLE `b_form_field_validator`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_ID` (`FORM_ID`),
  ADD KEY `IX_FIELD_ID` (`FIELD_ID`);

--
-- Индексы таблицы `b_form_menu`
--
ALTER TABLE `b_form_menu`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_ID` (`FORM_ID`);

--
-- Индексы таблицы `b_form_result`
--
ALTER TABLE `b_form_result`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_ID` (`FORM_ID`),
  ADD KEY `IX_STATUS_ID` (`STATUS_ID`),
  ADD KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`);

--
-- Индексы таблицы `b_form_result_answer`
--
ALTER TABLE `b_form_result_answer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RESULT_ID` (`RESULT_ID`),
  ADD KEY `IX_FIELD_ID` (`FIELD_ID`),
  ADD KEY `IX_ANSWER_ID` (`ANSWER_ID`);

--
-- Индексы таблицы `b_form_status`
--
ALTER TABLE `b_form_status`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_ID` (`FORM_ID`);

--
-- Индексы таблицы `b_form_status_2_group`
--
ALTER TABLE `b_form_status_2_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_form_status_2_mail_template`
--
ALTER TABLE `b_form_status_2_mail_template`
  ADD PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`);

--
-- Индексы таблицы `b_forum`
--
ALTER TABLE `b_forum`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORUM_SORT` (`SORT`),
  ADD KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`);

--
-- Индексы таблицы `b_forum2site`
--
ALTER TABLE `b_forum2site`
  ADD PRIMARY KEY (`FORUM_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_forum_dictionary`
--
ALTER TABLE `b_forum_dictionary`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_forum_email`
--
ALTER TABLE `b_forum_email`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  ADD KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`);

--
-- Индексы таблицы `b_forum_file`
--
ALTER TABLE `b_forum_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  ADD KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  ADD KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  ADD KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`);

--
-- Индексы таблицы `b_forum_filter`
--
ALTER TABLE `b_forum_filter`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  ADD KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`);

--
-- Индексы таблицы `b_forum_group`
--
ALTER TABLE `b_forum_group`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_forum_group_lang`
--
ALTER TABLE `b_forum_group_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`);

--
-- Индексы таблицы `b_forum_letter`
--
ALTER TABLE `b_forum_letter`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_forum_message`
--
ALTER TABLE `b_forum_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  ADD KEY `IX_FORUM_MESSAGE_FORUM_TOPIC` (`FORUM_ID`,`TOPIC_ID`),
  ADD KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`),
  ADD KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`),
  ADD KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  ADD KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  ADD KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  ADD KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  ADD KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`),
  ADD KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`),
  ADD KEY `IX_FORUM_MESSAGE_SERVICE_TYPE` (`SERVICE_TYPE`);

--
-- Индексы таблицы `b_forum_perms`
--
ALTER TABLE `b_forum_perms`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  ADD KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`);

--
-- Индексы таблицы `b_forum_pm_folder`
--
ALTER TABLE `b_forum_pm_folder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`);

--
-- Индексы таблицы `b_forum_points`
--
ALTER TABLE `b_forum_points`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`);

--
-- Индексы таблицы `b_forum_points2post`
--
ALTER TABLE `b_forum_points2post`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`);

--
-- Индексы таблицы `b_forum_points_lang`
--
ALTER TABLE `b_forum_points_lang`
  ADD PRIMARY KEY (`POINTS_ID`,`LID`);

--
-- Индексы таблицы `b_forum_private_message`
--
ALTER TABLE `b_forum_private_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  ADD KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  ADD KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`);

--
-- Индексы таблицы `b_forum_rank`
--
ALTER TABLE `b_forum_rank`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_forum_rank_lang`
--
ALTER TABLE `b_forum_rank_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`);

--
-- Индексы таблицы `b_forum_service_deleted_message`
--
ALTER TABLE `b_forum_service_deleted_message`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_MESSAGE_DELETED_ID` (`MESSAGE_ID`);

--
-- Индексы таблицы `b_forum_service_statistic_queue`
--
ALTER TABLE `b_forum_service_statistic_queue`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_SERVICE_STATISTIC` (`ENTITY_TYPE`,`ENTITY_ID`);

--
-- Индексы таблицы `b_forum_stat`
--
ALTER TABLE `b_forum_stat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  ADD KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  ADD KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  ADD KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`);

--
-- Индексы таблицы `b_forum_subscribe`
--
ALTER TABLE `b_forum_subscribe`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`);

--
-- Индексы таблицы `b_forum_topic`
--
ALTER TABLE `b_forum_topic`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  ADD KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  ADD KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  ADD KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  ADD KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  ADD KEY `IX_FORUM_TOPIC_LAST_POSTER_ID` (`LAST_POSTER_ID`),
  ADD KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  ADD KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  ADD KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  ADD KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`),
  ADD KEY `IX_FORUM_OWNER_ID` (`OWNER_ID`);

--
-- Индексы таблицы `b_forum_user`
--
ALTER TABLE `b_forum_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`);

--
-- Индексы таблицы `b_forum_user_forum`
--
ALTER TABLE `b_forum_user_forum`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`);

--
-- Индексы таблицы `b_forum_user_points`
--
ALTER TABLE `b_forum_user_points`
  ADD PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  ADD KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`);

--
-- Индексы таблицы `b_forum_user_topic`
--
ALTER TABLE `b_forum_user_topic`
  ADD PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  ADD KEY `ID` (`ID`),
  ADD KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`),
  ADD KEY `IX_B_FORUM_USER_FORUM_ID3` (`FORUM_ID`,`USER_ID`);

--
-- Индексы таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_geoname`
--
ALTER TABLE `b_geoname`
  ADD PRIMARY KEY (`ID`,`LANGUAGE_CODE`);

--
-- Индексы таблицы `b_group`
--
ALTER TABLE `b_group`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_collection_task`
--
ALTER TABLE `b_group_collection_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_group_subordinate`
--
ALTER TABLE `b_group_subordinate`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_task`
--
ALTER TABLE `b_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  ADD KEY `ix_hot_keys_user` (`USER_ID`);

--
-- Индексы таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  ADD KEY `ix_hot_keys_code_url` (`URL`);

--
-- Индексы таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  ADD KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`);

--
-- Индексы таблицы `b_iblock_cache`
--
ALTER TABLE `b_iblock_cache`
  ADD PRIMARY KEY (`CACHE_KEY`);

--
-- Индексы таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_element_iprop`
--
ALTER TABLE `b_iblock_element_iprop`
  ADD PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_element_lock`
--
ALTER TABLE `b_iblock_element_lock`
  ADD PRIMARY KEY (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_element_right`
--
ALTER TABLE `b_iblock_element_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_fields`
--
ALTER TABLE `b_iblock_fields`
  ADD PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`);

--
-- Индексы таблицы `b_iblock_group`
--
ALTER TABLE `b_iblock_group`
  ADD UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_iblock_iblock_iprop`
--
ALTER TABLE `b_iblock_iblock_iprop`
  ADD PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`);

--
-- Индексы таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`);

--
-- Индексы таблицы `b_iblock_messages`
--
ALTER TABLE `b_iblock_messages`
  ADD PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`);

--
-- Индексы таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  ADD KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  ADD KEY `ix_iblock_property_2` (`CODE`);

--
-- Индексы таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`);

--
-- Индексы таблицы `b_iblock_property_feature`
--
ALTER TABLE `b_iblock_property_feature`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`);

--
-- Индексы таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_task_id` (`TASK_ID`);

--
-- Индексы таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  ADD KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  ADD KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  ADD KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`);

--
-- Индексы таблицы `b_iblock_section_element`
--
ALTER TABLE `b_iblock_section_element`
  ADD UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  ADD KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_section_iprop`
--
ALTER TABLE `b_iblock_section_iprop`
  ADD PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_section_property`
--
ALTER TABLE `b_iblock_section_property`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_2` (`SECTION_ID`);

--
-- Индексы таблицы `b_iblock_section_right`
--
ALTER TABLE `b_iblock_section_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_sequence`
--
ALTER TABLE `b_iblock_sequence`
  ADD PRIMARY KEY (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_site`
--
ALTER TABLE `b_iblock_site`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_iblock_type`
--
ALTER TABLE `b_iblock_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_landing`
--
ALTER TABLE `b_landing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_LAND_CODE` (`CODE`),
  ADD KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_LAND_DELETED` (`DELETED`),
  ADD KEY `IX_B_LAND_SYS` (`SYS`),
  ADD KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  ADD KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  ADD KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  ADD KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`);
ALTER TABLE `b_landing` ADD FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`);

--
-- Индексы таблицы `b_landing_binding`
--
ALTER TABLE `b_landing_binding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  ADD KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`);

--
-- Индексы таблицы `b_landing_block`
--
ALTER TABLE `b_landing_block`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_BLOCK_LID` (`LID`),
  ADD KEY `IX_B_BLOCK_LID_PUBLIC` (`LID`,`PUBLIC`),
  ADD KEY `IX_B_BLOCK_CODE` (`CODE`),
  ADD KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  ADD KEY `IX_B_BLOCK_DELETED` (`DELETED`);
ALTER TABLE `b_landing_block` ADD FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`);

--
-- Индексы таблицы `b_landing_block_last_used`
--
ALTER TABLE `b_landing_block_last_used`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  ADD KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  ADD KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`);

--
-- Индексы таблицы `b_landing_chat`
--
ALTER TABLE `b_landing_chat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHAT` (`CHAT_ID`);

--
-- Индексы таблицы `b_landing_chat_binding`
--
ALTER TABLE `b_landing_chat_binding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  ADD KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`);

--
-- Индексы таблицы `b_landing_cookies_agreement`
--
ALTER TABLE `b_landing_cookies_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SITE` (`SITE_ID`,`CODE`);

--
-- Индексы таблицы `b_landing_demo`
--
ALTER TABLE `b_landing_demo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  ADD KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  ADD KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`);

--
-- Индексы таблицы `b_landing_designer_repo`
--
ALTER TABLE `b_landing_designer_repo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_XML_ID` (`XML_ID`);

--
-- Индексы таблицы `b_landing_domain`
--
ALTER TABLE `b_landing_domain`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  ADD KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  ADD KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`);

--
-- Индексы таблицы `b_landing_entity_lock`
--
ALTER TABLE `b_landing_entity_lock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_TYPE` (`LOCK_TYPE`);

--
-- Индексы таблицы `b_landing_entity_rights`
--
ALTER TABLE `b_landing_entity_rights`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_ROLE` (`ROLE_ID`);

--
-- Индексы таблицы `b_landing_file`
--
ALTER TABLE `b_landing_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_FILE` (`FILE_ID`),
  ADD KEY `IX_TEMP` (`TEMP`);

--
-- Индексы таблицы `b_landing_filter_block`
--
ALTER TABLE `b_landing_filter_block`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`);

--
-- Индексы таблицы `b_landing_filter_entity`
--
ALTER TABLE `b_landing_filter_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`);

--
-- Индексы таблицы `b_landing_folder`
--
ALTER TABLE `b_landing_folder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  ADD KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_FOLDER_DELETED` (`DELETED`),
  ADD KEY `IX_B_FOLDER_PARENT_ID` (`PARENT_ID`);

--
-- Индексы таблицы `b_landing_history`
--
ALTER TABLE `b_landing_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_LAND_HISTORY_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`);

--
-- Индексы таблицы `b_landing_hook_data`
--
ALTER TABLE `b_landing_hook_data`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `K_HOOK_CODE` (`HOOK`,`CODE`);

--
-- Индексы таблицы `b_landing_placement`
--
ALTER TABLE `b_landing_placement`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_landing_repo`
--
ALTER TABLE `b_landing_repo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  ADD KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`);

--
-- Индексы таблицы `b_landing_role`
--
ALTER TABLE `b_landing_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_ROLE_TYPE` (`TYPE`);

--
-- Индексы таблицы `b_landing_site`
--
ALTER TABLE `b_landing_site`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SITE_CODE` (`CODE`),
  ADD KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_SITE_DELETED` (`DELETED`),
  ADD KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_SITE_SPECIAL` (`SPECIAL`);

--
-- Индексы таблицы `b_landing_syspage`
--
ALTER TABLE `b_landing_syspage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_SITE_ID` (`SITE_ID`),
  ADD KEY `IX_LANDING_ID` (`LANDING_ID`);

--
-- Индексы таблицы `b_landing_template`
--
ALTER TABLE `b_landing_template`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_landing_template_ref`
--
ALTER TABLE `b_landing_template_ref`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `K_LANDING_ID` (`LANDING_ID`),
  ADD KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`);

--
-- Индексы таблицы `b_landing_update_block`
--
ALTER TABLE `b_landing_update_block`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_CODE` (`CODE`);

--
-- Индексы таблицы `b_landing_urlchecker_host`
--
ALTER TABLE `b_landing_urlchecker_host`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`);

--
-- Индексы таблицы `b_landing_urlchecker_status`
--
ALTER TABLE `b_landing_urlchecker_status`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHECKER_HASH` (`HASH`);

--
-- Индексы таблицы `b_landing_urlchecker_whitelist`
--
ALTER TABLE `b_landing_urlchecker_whitelist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`);

--
-- Индексы таблицы `b_landing_urlrewrite`
--
ALTER TABLE `b_landing_urlrewrite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  ADD KEY `IX_LANDING_ID` (`LANDING_ID`);

--
-- Индексы таблицы `b_landing_view`
--
ALTER TABLE `b_landing_view`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`);

--
-- Индексы таблицы `b_lang`
--
ALTER TABLE `b_lang`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_language`
--
ALTER TABLE `b_language`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_lang_domain`
--
ALTER TABLE `b_lang_domain`
  ADD PRIMARY KEY (`LID`,`DOMAIN`);

--
-- Индексы таблицы `b_list_rubric`
--
ALTER TABLE `b_list_rubric`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_location`
--
ALTER TABLE `b_location`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CODE` (`CODE`),
  ADD UNIQUE KEY `IX_LOC_SE` (`EXTERNAL_ID`,`SOURCE_CODE`),
  ADD KEY `IX_LOC_LAT` (`LATITUDE`),
  ADD KEY `IX_LOC_LON` (`LONGITUDE`),
  ADD KEY `IX_LOC_T` (`TYPE`);

--
-- Индексы таблицы `b_location_address`
--
ALTER TABLE `b_location_address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_LOC_BLA_LOC` (`LOCATION_ID`);

--
-- Индексы таблицы `b_location_addr_fld`
--
ALTER TABLE `b_location_addr_fld`
  ADD PRIMARY KEY (`ADDRESS_ID`,`TYPE`);

--
-- Индексы таблицы `b_location_addr_link`
--
ALTER TABLE `b_location_addr_link`
  ADD PRIMARY KEY (`ADDRESS_ID`,`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IDX_BLAL_EI_ET` (`ENTITY_ID`,`ENTITY_TYPE`);

--
-- Индексы таблицы `b_location_area`
--
ALTER TABLE `b_location_area`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TYPE` (`TYPE`,`CODE`);

--
-- Индексы таблицы `b_location_field`
--
ALTER TABLE `b_location_field`
  ADD PRIMARY KEY (`LOCATION_ID`,`TYPE`),
  ADD KEY `IDX_BLLFL_VAL` (`VALUE`);

--
-- Индексы таблицы `b_location_hierarchy`
--
ALTER TABLE `b_location_hierarchy`
  ADD PRIMARY KEY (`ANCESTOR_ID`,`DESCENDANT_ID`),
  ADD KEY `IX_LOC_LH_D` (`DESCENDANT_ID`);

--
-- Индексы таблицы `b_location_name`
--
ALTER TABLE `b_location_name`
  ADD PRIMARY KEY (`LOCATION_ID`,`LANGUAGE_ID`),
  ADD KEY `IX_LOC_LNN` (`NAME_NORMALIZED`(200),`LANGUAGE_ID`);

--
-- Индексы таблицы `b_location_source`
--
ALTER TABLE `b_location_source`
  ADD PRIMARY KEY (`CODE`);

--
-- Индексы таблицы `b_log_notification`
--
ALTER TABLE `b_log_notification`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_log_notification_action`
--
ALTER TABLE `b_log_notification_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`);

--
-- Индексы таблицы `b_main_mail_blacklist`
--
ALTER TABLE `b_main_mail_blacklist`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`);

--
-- Индексы таблицы `b_main_mail_sender`
--
ALTER TABLE `b_main_mail_sender`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`);

--
-- Индексы таблицы `b_main_mail_sender_send_counter`
--
ALTER TABLE `b_main_mail_sender_send_counter`
  ADD PRIMARY KEY (`DATE_STAT`,`EMAIL`);

--
-- Индексы таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_collection_item`
--
ALTER TABLE `b_medialib_collection_item`
  ADD PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_messageservice_incoming_message`
--
ALTER TABLE `b_messageservice_incoming_message`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_MS_INCOMING_MESSAGE_1` (`SENDER_ID`,`EXTERNAL_ID`);

--
-- Индексы таблицы `b_messageservice_message`
--
ALTER TABLE `b_messageservice_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  ADD KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`,`CLUSTER_GROUP`),
  ADD KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`);

--
-- Индексы таблицы `b_messageservice_rest_app`
--
ALTER TABLE `b_messageservice_rest_app`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`);

--
-- Индексы таблицы `b_messageservice_rest_app_lang`
--
ALTER TABLE `b_messageservice_rest_app_lang`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_mobileapp_app`
--
ALTER TABLE `b_mobileapp_app`
  ADD PRIMARY KEY (`CODE`);

--
-- Индексы таблицы `b_mobileapp_config`
--
ALTER TABLE `b_mobileapp_config`
  ADD PRIMARY KEY (`APP_CODE`,`PLATFORM`);

--
-- Индексы таблицы `b_module`
--
ALTER TABLE `b_module`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  ADD KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20));

--
-- Индексы таблицы `b_numerator`
--
ALTER TABLE `b_numerator`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_numerator_code` (`CODE`);

--
-- Индексы таблицы `b_numerator_sequence`
--
ALTER TABLE `b_numerator_sequence`
  ADD PRIMARY KEY (`NUMERATOR_ID`,`KEY`);

--
-- Индексы таблицы `b_operation`
--
ALTER TABLE `b_operation`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_option`
--
ALTER TABLE `b_option`
  ADD PRIMARY KEY (`MODULE_ID`,`NAME`),
  ADD KEY `ix_option_name` (`NAME`);

--
-- Индексы таблицы `b_option_site`
--
ALTER TABLE `b_option_site`
  ADD PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  ADD KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`);

--
-- Индексы таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_ERROR_0` (`HIT_ID`);

--
-- Индексы таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_HIT_0` (`DATE_HIT`);

--
-- Индексы таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`);

--
-- Индексы таблицы `b_perf_index_suggest_sql`
--
ALTER TABLE `b_perf_index_suggest_sql`
  ADD PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  ADD KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`);

--
-- Индексы таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_sql_backtrace`
--
ALTER TABLE `b_perf_sql_backtrace`
  ADD PRIMARY KEY (`SQL_ID`,`NN`);

--
-- Индексы таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`);

--
-- Индексы таблицы `b_perf_tab_stat`
--
ALTER TABLE `b_perf_tab_stat`
  ADD PRIMARY KEY (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`);

--
-- Индексы таблицы `b_posting`
--
ALTER TABLE `b_posting`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_posting_email`
--
ALTER TABLE `b_posting_email`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  ADD KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`);

--
-- Индексы таблицы `b_posting_file`
--
ALTER TABLE `b_posting_file`
  ADD UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_posting_group`
--
ALTER TABLE `b_posting_group`
  ADD UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_posting_rubric`
--
ALTER TABLE `b_posting_rubric`
  ADD UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`);

--
-- Индексы таблицы `b_rating`
--
ALTER TABLE `b_rating`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`);

--
-- Индексы таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  ADD KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`);

--
-- Индексы таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  ADD KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  ADD KEY `IX_B_RAT_USER_2` (`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  ADD KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  ADD KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`);

--
-- Индексы таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`GROUP_ID`,`TYPE`);

--
-- Индексы таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  ADD KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`);

--
-- Индексы таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`);

--
-- Индексы таблицы `b_rating_voting_reaction`
--
ALTER TABLE `b_rating_voting_reaction`
  ADD PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`);

--
-- Индексы таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_ap`
--
ALTER TABLE `b_rest_ap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`);

--
-- Индексы таблицы `b_rest_app`
--
ALTER TABLE `b_rest_app`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`);

--
-- Индексы таблицы `b_rest_app_lang`
--
ALTER TABLE `b_rest_app_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_rest_app_log`
--
ALTER TABLE `b_rest_app_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_rest_app_log1` (`APP_ID`);

--
-- Индексы таблицы `b_rest_ap_permission`
--
ALTER TABLE `b_rest_ap_permission`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`);

--
-- Индексы таблицы `b_rest_configuration_storage`
--
ALTER TABLE `b_rest_configuration_storage`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_event`
--
ALTER TABLE `b_rest_event`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  ADD KEY `ix_b_rest_event_event_name` (`EVENT_NAME`);

--
-- Индексы таблицы `b_rest_event_offline`
--
ALTER TABLE `b_rest_event_offline`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  ADD KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  ADD KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  ADD KEY `ix_b_rest_event_offline4` (`PROCESS_ID`);

--
-- Индексы таблицы `b_rest_integration`
--
ALTER TABLE `b_rest_integration`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_log`
--
ALTER TABLE `b_rest_log`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_owner_entity`
--
ALTER TABLE `b_rest_owner_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`);

--
-- Индексы таблицы `b_rest_placement`
--
ALTER TABLE `b_rest_placement`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  ADD KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100)),
  ADD KEY `ix_b_rest_placement4` (`PLACEMENT`,`USER_ID`);

--
-- Индексы таблицы `b_rest_placement_lang`
--
ALTER TABLE `b_rest_placement_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_rest_stat`
--
ALTER TABLE `b_rest_stat`
  ADD PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`);

--
-- Индексы таблицы `b_rest_stat_app`
--
ALTER TABLE `b_rest_stat_app`
  ADD PRIMARY KEY (`APP_ID`),
  ADD KEY `ix_b_rest_stat_app_code` (`APP_CODE`);

--
-- Индексы таблицы `b_rest_stat_method`
--
ALTER TABLE `b_rest_stat_method`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_stat_method` (`NAME`);

--
-- Индексы таблицы `b_rest_usage_entity`
--
ALTER TABLE `b_rest_usage_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`);

--
-- Индексы таблицы `b_rest_usage_stat`
--
ALTER TABLE `b_rest_usage_stat`
  ADD PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  ADD KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`);

--
-- Индексы таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  ADD KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  ADD KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`);

--
-- Индексы таблицы `b_search_content_freq`
--
ALTER TABLE `b_search_content_freq`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_param`
--
ALTER TABLE `b_search_content_param`
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_right`
--
ALTER TABLE `b_search_content_right`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_search_content_site`
--
ALTER TABLE `b_search_content_site`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_stem`
--
ALTER TABLE `b_search_content_stem`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  ADD KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_text`
--
ALTER TABLE `b_search_content_text`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_title`
--
ALTER TABLE `b_search_content_title`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  ADD KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`);

--
-- Индексы таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`);

--
-- Индексы таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_tags`
--
ALTER TABLE `b_search_tags`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  ADD KEY `IX_B_SEARCH_TAGS_0` (`NAME`);

--
-- Индексы таблицы `b_search_user_right`
--
ALTER TABLE `b_search_user_right`
  ADD UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_security_sitecheck`
--
ALTER TABLE `b_security_sitecheck`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_filter_mask`
--
ALTER TABLE `b_sec_filter_mask`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_frame_mask`
--
ALTER TABLE `b_sec_frame_mask`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_iprule`
--
ALTER TABLE `b_sec_iprule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`);

--
-- Индексы таблицы `b_sec_iprule_excl_ip`
--
ALTER TABLE `b_sec_iprule_excl_ip`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_IP`);

--
-- Индексы таблицы `b_sec_iprule_excl_mask`
--
ALTER TABLE `b_sec_iprule_excl_mask`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`);

--
-- Индексы таблицы `b_sec_iprule_incl_ip`
--
ALTER TABLE `b_sec_iprule_incl_ip`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_IP`);

--
-- Индексы таблицы `b_sec_iprule_incl_mask`
--
ALTER TABLE `b_sec_iprule_incl_mask`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`);

--
-- Индексы таблицы `b_sec_recovery_codes`
--
ALTER TABLE `b_sec_recovery_codes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`);

--
-- Индексы таблицы `b_sec_session`
--
ALTER TABLE `b_sec_session`
  ADD PRIMARY KEY (`SESSION_ID`),
  ADD KEY `ix_b_sec_session_time` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_sec_user`
--
ALTER TABLE `b_sec_user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_sec_virus`
--
ALTER TABLE `b_sec_virus`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_white_list`
--
ALTER TABLE `b_sec_white_list`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  ADD KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`);

--
-- Индексы таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`);

--
-- Индексы таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_seo_adv_link`
--
ALTER TABLE `b_seo_adv_link`
  ADD PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`);

--
-- Индексы таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  ADD KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`);

--
-- Индексы таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_region1` (`PARENT_ID`);

--
-- Индексы таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`);

--
-- Индексы таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`);

--
-- Индексы таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_service_queue`
--
ALTER TABLE `b_seo_service_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_QUEUE_TYPE` (`TYPE`),
  ADD KEY `IX_B_SEO_SERVICE_SERVICE_TYPE_CLIENT_ID` (`SERVICE_TYPE`,`CLIENT_ID`);

--
-- Индексы таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`);

--
-- Индексы таблицы `b_seo_service_subscription`
--
ALTER TABLE `b_seo_service_subscription`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`);

--
-- Индексы таблицы `b_seo_service_webhook`
--
ALTER TABLE `b_seo_service_webhook`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`);

--
-- Индексы таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`);

--
-- Индексы таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  ADD KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  ADD KEY `ux_b_short_uri_2` (`URI_CRC`);

--
-- Индексы таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_site_template_site` (`SITE_ID`);

--
-- Индексы таблицы `b_smile`
--
ALTER TABLE `b_smile`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`);

--
-- Индексы таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sms_template`
--
ALTER TABLE `b_sms_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_sms_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_sms_template_site`
--
ALTER TABLE `b_sms_template_site`
  ADD PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_sm_version_history`
--
ALTER TABLE `b_sm_version_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`);

--
-- Индексы таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact1` (`USER_ID`),
  ADD KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  ADD KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  ADD KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  ADD KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  ADD KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`);

--
-- Индексы таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  ADD KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_user_link_7` (`LINK_UID`);

--
-- Индексы таблицы `b_socialservices_zoom_meeting`
--
ALTER TABLE `b_socialservices_zoom_meeting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_socialservices_zoom_meeting_recording`
--
ALTER TABLE `b_socialservices_zoom_meeting_recording`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`);

--
-- Индексы таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sticker_group_task`
--
ALTER TABLE `b_sticker_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_subscription`
--
ALTER TABLE `b_subscription`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  ADD KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`);

--
-- Индексы таблицы `b_subscription_rubric`
--
ALTER TABLE `b_subscription_rubric`
  ADD UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`);

--
-- Индексы таблицы `b_task`
--
ALTER TABLE `b_task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`);

--
-- Индексы таблицы `b_task_operation`
--
ALTER TABLE `b_task_operation`
  ADD PRIMARY KEY (`TASK_ID`,`OPERATION_ID`);

--
-- Индексы таблицы `b_translate_diff`
--
ALTER TABLE `b_translate_diff`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  ADD KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`);

--
-- Индексы таблицы `b_translate_file`
--
ALTER TABLE `b_translate_file`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  ADD KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255));

--
-- Индексы таблицы `b_translate_path`
--
ALTER TABLE `b_translate_path`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  ADD KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  ADD KEY `IX_TRNSL_PTH_PATH` (`PATH`(255));

--
-- Индексы таблицы `b_translate_path_lang`
--
ALTER TABLE `b_translate_path_lang`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_TRNSL_LNG_PATH` (`PATH`(255));

--
-- Индексы таблицы `b_translate_path_tree`
--
ALTER TABLE `b_translate_path_tree`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  ADD UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`);

--
-- Индексы таблицы `b_translate_phrase`
--
ALTER TABLE `b_translate_phrase`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  ADD KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  ADD KEY `IX_TRNSL_FILE` (`FILE_ID`);
ALTER TABLE `b_translate_phrase` ADD FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`);

--
-- Индексы таблицы `b_ui_avatar_mask_access`
--
ALTER TABLE `b_ui_avatar_mask_access`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `B_UI_AVATAR_MASK_RIGHT_3` (`ITEM_ID`,`ACCESS_CODE`),
  ADD KEY `B_UI_AVATAR_MASK_RIGHT_1` (`ITEM_ID`),
  ADD KEY `B_UI_AVATAR_MASK_RIGHT_2` (`ACCESS_CODE`);

--
-- Индексы таблицы `b_ui_avatar_mask_file_deleted`
--
ALTER TABLE `b_ui_avatar_mask_file_deleted`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_UI_AVATAR_MASK_FILE_DELETED_1` (`ENTITY`),
  ADD KEY `B_UI_AVATAR_MASK_FILE_DELETED_2` (`ITEM_ID`),
  ADD KEY `B_UI_AVATAR_MASK_FILE_DELETED_3` (`FILE_ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_group`
--
ALTER TABLE `b_ui_avatar_mask_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_UI_AVATAR_MASK_GROUP_OWNER` (`OWNER_ID`,`OWNER_TYPE`);

--
-- Индексы таблицы `b_ui_avatar_mask_item`
--
ALTER TABLE `b_ui_avatar_mask_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_UI_AVATAR_MASK_ITEM_OWNER` (`OWNER_TYPE`,`OWNER_ID`),
  ADD KEY `B_UI_AVATAR_MASK_ITEM_FILE_ID` (`FILE_ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_item_applied_to`
--
ALTER TABLE `b_ui_avatar_mask_item_applied_to`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `b_ui_avatar_mask_item_applied1` (`FILE_ID`,`ITEM_ID`),
  ADD KEY `b_ui_avatar_mask_item_applied2` (`ITEM_ID`),
  ADD KEY `b_ui_avatar_mask_item_applied3` (`USER_ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_recently_used`
--
ALTER TABLE `b_ui_avatar_mask_recently_used`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `B_UI_AVATAR_MASK_ITEM_R_OWNER` (`ITEM_ID`,`USER_ID`);

--
-- Индексы таблицы `b_ui_entity_editor_config`
--
ALTER TABLE `b_ui_entity_editor_config`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `CATEGORY` (`CATEGORY`);

--
-- Индексы таблицы `b_ui_entity_editor_config_ac`
--
ALTER TABLE `b_ui_entity_editor_config_ac`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCESS_CODE` (`ACCESS_CODE`),
  ADD KEY `CONFIG_ID` (`CONFIG_ID`);

--
-- Индексы таблицы `b_ui_file_uploader_temp_file`
--
ALTER TABLE `b_ui_file_uploader_temp_file`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_UI_UPLOADER_GUID` (`GUID`),
  ADD KEY `IX_B_UI_UPLOADER_FILE_ID` (`FILE_ID`),
  ADD KEY `IX_B_UI_UPLOADER_CREATED_AT` (`CREATED_AT`);

--
-- Индексы таблицы `b_undo`
--
ALTER TABLE `b_undo`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255));

--
-- Индексы таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255));

--
-- Индексы таблицы `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  ADD KEY `ix_b_user_email` (`EMAIL`),
  ADD KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  ADD KEY `IX_B_USER_XML_ID` (`XML_ID`),
  ADD KEY `ix_user_last_login` (`LAST_LOGIN`),
  ADD KEY `ix_user_date_register` (`DATE_REGISTER`);

--
-- Индексы таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  ADD KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  ADD KEY `ix_ua_access` (`ACCESS_CODE`),
  ADD KEY `ix_ua_provider` (`PROVIDER_ID`);

--
-- Индексы таблицы `b_user_access_check`
--
ALTER TABLE `b_user_access_check`
  ADD UNIQUE KEY `ux_uac_user_provider` (`USER_ID`,`PROVIDER_ID`);

--
-- Индексы таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  ADD KEY `ix_auth_action_date` (`ACTION_DATE`);

--
-- Индексы таблицы `b_user_auth_code`
--
ALTER TABLE `b_user_auth_code`
  ADD PRIMARY KEY (`USER_ID`,`CODE_TYPE`);

--
-- Индексы таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_counter_user_site_code` (`USER_ID`,`SITE_ID`,`CODE`),
  ADD KEY `ix_buc_tag` (`TAG`),
  ADD KEY `ix_buc_code` (`CODE`),
  ADD KEY `ix_buc_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`);

--
-- Индексы таблицы `b_user_device`
--
ALTER TABLE `b_user_device`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_device_user` (`USER_ID`,`DEVICE_UID`);

--
-- Индексы таблицы `b_user_device_login`
--
ALTER TABLE `b_user_device_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_device_login_device` (`DEVICE_ID`),
  ADD KEY `ix_user_device_login_date` (`LOGIN_DATE`);

--
-- Индексы таблицы `b_user_digest`
--
ALTER TABLE `b_user_digest`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`);

--
-- Индексы таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`);

--
-- Индексы таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`);

--
-- Индексы таблицы `b_user_field_lang`
--
ALTER TABLE `b_user_field_lang`
  ADD PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_user_field_permission`
--
ALTER TABLE `b_user_field_permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `GROUP_ID` (`USER_FIELD_ID`),
  ADD KEY `PERMISSION_ID` (`PERMISSION_ID`);

--
-- Индексы таблицы `b_user_group`
--
ALTER TABLE `b_user_group`
  ADD UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  ADD KEY `ix_user_group_group` (`GROUP_ID`);

--
-- Индексы таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  ADD KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  ADD KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_index`
--
ALTER TABLE `b_user_index`
  ADD PRIMARY KEY (`USER_ID`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`);

--
-- Индексы таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`);

--
-- Индексы таблицы `b_user_password`
--
ALTER TABLE `b_user_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`);

--
-- Индексы таблицы `b_user_phone_auth`
--
ALTER TABLE `b_user_phone_auth`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`);

--
-- Индексы таблицы `b_user_profile_history`
--
ALTER TABLE `b_user_profile_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_profile_history_user` (`USER_ID`),
  ADD KEY `ix_profile_history_date` (`DATE_INSERT`);

--
-- Индексы таблицы `b_user_profile_record`
--
ALTER TABLE `b_user_profile_record`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`);

--
-- Индексы таблицы `b_user_session`
--
ALTER TABLE `b_user_session`
  ADD PRIMARY KEY (`SESSION_ID`),
  ADD KEY `ix_user_session_time` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_user_hash` (`USER_ID`);

--
-- Индексы таблицы `b_utm_blog_comment`
--
ALTER TABLE `b_utm_blog_comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`),
  ADD KEY `ix_utm_BLOG_COMMENT_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`);

--
-- Индексы таблицы `b_utm_blog_post`
--
ALTER TABLE `b_utm_blog_post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`),
  ADD KEY `ix_utm_BLOG_POST_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`);

--
-- Индексы таблицы `b_utm_forum_message`
--
ALTER TABLE `b_utm_forum_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`),
  ADD KEY `ix_utm_FORUM_MESSAGE_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`);

--
-- Индексы таблицы `b_uts_blog_comment`
--
ALTER TABLE `b_uts_blog_comment`
  ADD PRIMARY KEY (`VALUE_ID`);

--
-- Индексы таблицы `b_uts_blog_post`
--
ALTER TABLE `b_uts_blog_post`
  ADD PRIMARY KEY (`VALUE_ID`);

--
-- Индексы таблицы `b_uts_forum_message`
--
ALTER TABLE `b_uts_forum_message`
  ADD PRIMARY KEY (`VALUE_ID`);

--
-- Индексы таблицы `b_vote`
--
ALTER TABLE `b_vote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_CHANNEL_ID` (`CHANNEL_ID`);

--
-- Индексы таблицы `b_vote_answer`
--
ALTER TABLE `b_vote_answer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_QUESTION_ID` (`QUESTION_ID`);

--
-- Индексы таблицы `b_vote_attached_object`
--
ALTER TABLE `b_vote_attached_object`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  ADD KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`);

--
-- Индексы таблицы `b_vote_channel`
--
ALTER TABLE `b_vote_channel`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_vote_channel_2_group`
--
ALTER TABLE `b_vote_channel_2_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_vote_channel_2_site`
--
ALTER TABLE `b_vote_channel_2_site`
  ADD PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_vote_event`
--
ALTER TABLE `b_vote_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_USER_ID` (`VOTE_USER_ID`),
  ADD KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`);

--
-- Индексы таблицы `b_vote_event_answer`
--
ALTER TABLE `b_vote_event_answer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`);

--
-- Индексы таблицы `b_vote_event_question`
--
ALTER TABLE `b_vote_event_question`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_EVENT_ID` (`EVENT_ID`);

--
-- Индексы таблицы `b_vote_question`
--
ALTER TABLE `b_vote_question`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_VOTE_ID` (`VOTE_ID`);

--
-- Индексы таблицы `b_vote_user`
--
ALTER TABLE `b_vote_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_VOTE_COOKIE_USER` (`COOKIE_ID`,`AUTH_USER_ID`);

--
-- Индексы таблицы `b_xml_tree`
--
ALTER TABLE `b_xml_tree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  ADD KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_agent`
--
ALTER TABLE `b_agent`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_b24connector_button_site`
--
ALTER TABLE `b_b24connector_button_site`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_blog`
--
ALTER TABLE `b_blog`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_blog_category`
--
ALTER TABLE `b_blog_category`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `b_blog_comment`
--
ALTER TABLE `b_blog_comment`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `b_blog_group`
--
ALTER TABLE `b_blog_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_blog_image`
--
ALTER TABLE `b_blog_image`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `b_blog_post`
--
ALTER TABLE `b_blog_post`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_blog_post_category`
--
ALTER TABLE `b_blog_post_category`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_post_param`
--
ALTER TABLE `b_blog_post_param`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_site_path`
--
ALTER TABLE `b_blog_site_path`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_blog_socnet`
--
ALTER TABLE `b_blog_socnet`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_socnet_rights`
--
ALTER TABLE `b_blog_socnet_rights`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_trackback`
--
ALTER TABLE `b_blog_trackback`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_user`
--
ALTER TABLE `b_blog_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_blog_user2blog`
--
ALTER TABLE `b_blog_user2blog`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_user2user_group`
--
ALTER TABLE `b_blog_user2user_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_blog_user_group`
--
ALTER TABLE `b_blog_user_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_blog_user_group_perms`
--
ALTER TABLE `b_blog_user_group_perms`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_copy_queue`
--
ALTER TABLE `b_clouds_copy_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_delete_queue`
--
ALTER TABLE `b_clouds_delete_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_hash`
--
ALTER TABLE `b_clouds_file_hash`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_save`
--
ALTER TABLE `b_clouds_file_save`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent_item`
--
ALTER TABLE `b_consent_user_consent_item`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_culture`
--
ALTER TABLE `b_culture`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_event`
--
ALTER TABLE `b_event`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file`
--
ALTER TABLE `b_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `b_file_preview`
--
ALTER TABLE `b_file_preview`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_filters`
--
ALTER TABLE `b_filters`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form`
--
ALTER TABLE `b_form`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_2_group`
--
ALTER TABLE `b_form_2_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_answer`
--
ALTER TABLE `b_form_answer`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_crm`
--
ALTER TABLE `b_form_crm`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_crm_field`
--
ALTER TABLE `b_form_crm_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_crm_link`
--
ALTER TABLE `b_form_crm_link`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_field`
--
ALTER TABLE `b_form_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_field_filter`
--
ALTER TABLE `b_form_field_filter`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_field_validator`
--
ALTER TABLE `b_form_field_validator`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_menu`
--
ALTER TABLE `b_form_menu`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_result`
--
ALTER TABLE `b_form_result`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_result_answer`
--
ALTER TABLE `b_form_result_answer`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_status`
--
ALTER TABLE `b_form_status`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_form_status_2_group`
--
ALTER TABLE `b_form_status_2_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum`
--
ALTER TABLE `b_forum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_dictionary`
--
ALTER TABLE `b_forum_dictionary`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_forum_email`
--
ALTER TABLE `b_forum_email`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_file`
--
ALTER TABLE `b_forum_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_filter`
--
ALTER TABLE `b_forum_filter`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT для таблицы `b_forum_group`
--
ALTER TABLE `b_forum_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_group_lang`
--
ALTER TABLE `b_forum_group_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_letter`
--
ALTER TABLE `b_forum_letter`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `b_forum_message`
--
ALTER TABLE `b_forum_message`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_perms`
--
ALTER TABLE `b_forum_perms`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_pm_folder`
--
ALTER TABLE `b_forum_pm_folder`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_forum_points`
--
ALTER TABLE `b_forum_points`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_points2post`
--
ALTER TABLE `b_forum_points2post`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_private_message`
--
ALTER TABLE `b_forum_private_message`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_rank`
--
ALTER TABLE `b_forum_rank`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_rank_lang`
--
ALTER TABLE `b_forum_rank_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_service_deleted_message`
--
ALTER TABLE `b_forum_service_deleted_message`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_service_statistic_queue`
--
ALTER TABLE `b_forum_service_statistic_queue`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_stat`
--
ALTER TABLE `b_forum_stat`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_subscribe`
--
ALTER TABLE `b_forum_subscribe`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_topic`
--
ALTER TABLE `b_forum_topic`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_user`
--
ALTER TABLE `b_forum_user`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_user_forum`
--
ALTER TABLE `b_forum_user_forum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_forum_user_topic`
--
ALTER TABLE `b_forum_user_topic`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_group`
--
ALTER TABLE `b_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT для таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property_feature`
--
ALTER TABLE `b_iblock_property_feature`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_landing`
--
ALTER TABLE `b_landing`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_binding`
--
ALTER TABLE `b_landing_binding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_block`
--
ALTER TABLE `b_landing_block`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_block_last_used`
--
ALTER TABLE `b_landing_block_last_used`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_chat`
--
ALTER TABLE `b_landing_chat`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_chat_binding`
--
ALTER TABLE `b_landing_chat_binding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_cookies_agreement`
--
ALTER TABLE `b_landing_cookies_agreement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_demo`
--
ALTER TABLE `b_landing_demo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_designer_repo`
--
ALTER TABLE `b_landing_designer_repo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_domain`
--
ALTER TABLE `b_landing_domain`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_entity_lock`
--
ALTER TABLE `b_landing_entity_lock`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_entity_rights`
--
ALTER TABLE `b_landing_entity_rights`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_file`
--
ALTER TABLE `b_landing_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_filter_block`
--
ALTER TABLE `b_landing_filter_block`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_filter_entity`
--
ALTER TABLE `b_landing_filter_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_folder`
--
ALTER TABLE `b_landing_folder`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_history`
--
ALTER TABLE `b_landing_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_hook_data`
--
ALTER TABLE `b_landing_hook_data`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_placement`
--
ALTER TABLE `b_landing_placement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_repo`
--
ALTER TABLE `b_landing_repo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_role`
--
ALTER TABLE `b_landing_role`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_site`
--
ALTER TABLE `b_landing_site`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_syspage`
--
ALTER TABLE `b_landing_syspage`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_template`
--
ALTER TABLE `b_landing_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `b_landing_template_ref`
--
ALTER TABLE `b_landing_template_ref`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_update_block`
--
ALTER TABLE `b_landing_update_block`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlchecker_host`
--
ALTER TABLE `b_landing_urlchecker_host`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlchecker_status`
--
ALTER TABLE `b_landing_urlchecker_status`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlchecker_whitelist`
--
ALTER TABLE `b_landing_urlchecker_whitelist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlrewrite`
--
ALTER TABLE `b_landing_urlrewrite`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_view`
--
ALTER TABLE `b_landing_view`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_list_rubric`
--
ALTER TABLE `b_list_rubric`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_location`
--
ALTER TABLE `b_location`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_location_address`
--
ALTER TABLE `b_location_address`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_location_area`
--
ALTER TABLE `b_location_area`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_log_notification`
--
ALTER TABLE `b_log_notification`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_log_notification_action`
--
ALTER TABLE `b_log_notification_action`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_mail_blacklist`
--
ALTER TABLE `b_main_mail_blacklist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_mail_sender`
--
ALTER TABLE `b_main_mail_sender`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_incoming_message`
--
ALTER TABLE `b_messageservice_incoming_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_message`
--
ALTER TABLE `b_messageservice_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_rest_app`
--
ALTER TABLE `b_messageservice_rest_app`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_rest_app_lang`
--
ALTER TABLE `b_messageservice_rest_app_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT для таблицы `b_numerator`
--
ALTER TABLE `b_numerator`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_operation`
--
ALTER TABLE `b_operation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT для таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_posting`
--
ALTER TABLE `b_posting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_posting_email`
--
ALTER TABLE `b_posting_email`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating`
--
ALTER TABLE `b_rating`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_rest_ap`
--
ALTER TABLE `b_rest_ap`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_app`
--
ALTER TABLE `b_rest_app`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_app_lang`
--
ALTER TABLE `b_rest_app_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_app_log`
--
ALTER TABLE `b_rest_app_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_ap_permission`
--
ALTER TABLE `b_rest_ap_permission`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_configuration_storage`
--
ALTER TABLE `b_rest_configuration_storage`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_event`
--
ALTER TABLE `b_rest_event`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_event_offline`
--
ALTER TABLE `b_rest_event_offline`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_integration`
--
ALTER TABLE `b_rest_integration`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_log`
--
ALTER TABLE `b_rest_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_owner_entity`
--
ALTER TABLE `b_rest_owner_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_placement`
--
ALTER TABLE `b_rest_placement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_placement_lang`
--
ALTER TABLE `b_rest_placement_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_stat_method`
--
ALTER TABLE `b_rest_stat_method`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_usage_entity`
--
ALTER TABLE `b_rest_usage_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=644;

--
-- AUTO_INCREMENT для таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_security_sitecheck`
--
ALTER TABLE `b_security_sitecheck`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_filter_mask`
--
ALTER TABLE `b_sec_filter_mask`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_frame_mask`
--
ALTER TABLE `b_sec_frame_mask`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_iprule`
--
ALTER TABLE `b_sec_iprule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_recovery_codes`
--
ALTER TABLE `b_sec_recovery_codes`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_queue`
--
ALTER TABLE `b_seo_service_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_subscription`
--
ALTER TABLE `b_seo_service_subscription`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_webhook`
--
ALTER TABLE `b_seo_service_webhook`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_smile`
--
ALTER TABLE `b_smile`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_sms_template`
--
ALTER TABLE `b_sms_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_sm_version_history`
--
ALTER TABLE `b_sm_version_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_zoom_meeting`
--
ALTER TABLE `b_socialservices_zoom_meeting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_zoom_meeting_recording`
--
ALTER TABLE `b_socialservices_zoom_meeting_recording`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_subscription`
--
ALTER TABLE `b_subscription`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_task`
--
ALTER TABLE `b_task`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `b_translate_diff`
--
ALTER TABLE `b_translate_diff`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_file`
--
ALTER TABLE `b_translate_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_path`
--
ALTER TABLE `b_translate_path`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_path_lang`
--
ALTER TABLE `b_translate_path_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_path_tree`
--
ALTER TABLE `b_translate_path_tree`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_phrase`
--
ALTER TABLE `b_translate_phrase`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_access`
--
ALTER TABLE `b_ui_avatar_mask_access`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_file_deleted`
--
ALTER TABLE `b_ui_avatar_mask_file_deleted`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_group`
--
ALTER TABLE `b_ui_avatar_mask_group`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_item`
--
ALTER TABLE `b_ui_avatar_mask_item`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_item_applied_to`
--
ALTER TABLE `b_ui_avatar_mask_item_applied_to`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_recently_used`
--
ALTER TABLE `b_ui_avatar_mask_recently_used`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_entity_editor_config`
--
ALTER TABLE `b_ui_entity_editor_config`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_entity_editor_config_ac`
--
ALTER TABLE `b_ui_entity_editor_config_ac`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_file_uploader_temp_file`
--
ALTER TABLE `b_ui_file_uploader_temp_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_user`
--
ALTER TABLE `b_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_device`
--
ALTER TABLE `b_user_device`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_device_login`
--
ALTER TABLE `b_user_device_login`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_permission`
--
ALTER TABLE `b_user_field_permission`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `b_user_password`
--
ALTER TABLE `b_user_password`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `b_user_profile_history`
--
ALTER TABLE `b_user_profile_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_profile_record`
--
ALTER TABLE `b_user_profile_record`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_utm_blog_comment`
--
ALTER TABLE `b_utm_blog_comment`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_utm_blog_post`
--
ALTER TABLE `b_utm_blog_post`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_utm_forum_message`
--
ALTER TABLE `b_utm_forum_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote`
--
ALTER TABLE `b_vote`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_answer`
--
ALTER TABLE `b_vote_answer`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_attached_object`
--
ALTER TABLE `b_vote_attached_object`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_channel`
--
ALTER TABLE `b_vote_channel`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_channel_2_group`
--
ALTER TABLE `b_vote_channel_2_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_event`
--
ALTER TABLE `b_vote_event`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_event_answer`
--
ALTER TABLE `b_vote_event_answer`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_event_question`
--
ALTER TABLE `b_vote_event_question`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_question`
--
ALTER TABLE `b_vote_question`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_vote_user`
--
ALTER TABLE `b_vote_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_xml_tree`
--
ALTER TABLE `b_xml_tree`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1039;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
