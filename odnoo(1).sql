-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2016 at 01:34 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `odnoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl_role`
--

CREATE TABLE IF NOT EXISTS `acl_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_persian_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `acl_role`
--

INSERT INTO `acl_role` (`role_id`, `name`, `description`, `creation_date`, `create_by`) VALUES
(1, 'مدیریت کاربران', '', '2016-10-06 05:59:24', 0),
(3, 'ادمین', '', '2016-10-08 12:03:21', 0),
(12, 'ثبت نام کرده ها', '', '2016-10-18 06:24:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_role_action`
--

CREATE TABLE IF NOT EXISTS `acl_role_action` (
  `role_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `action_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_action_id`),
  KEY `idx_acl_role_action` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `acl_role_action`
--

INSERT INTO `acl_role_action` (`role_action_id`, `role_id`, `action_id`, `creation_date`) VALUES
(15, 3, 10, '2016-10-18 07:13:46'),
(16, 3, 11, '2016-10-18 07:13:46'),
(17, 3, 14, '2016-10-18 07:13:46'),
(18, 3, 18, '2016-10-18 07:13:46'),
(19, 3, 20, '2016-10-18 07:13:46'),
(20, 3, 24, '2016-10-18 07:13:46'),
(21, 3, 26, '2016-10-18 07:13:46'),
(22, 3, 27, '2016-10-18 07:13:46'),
(23, 3, 28, '2016-10-18 07:13:47'),
(24, 3, 30, '2016-10-18 07:13:47'),
(25, 3, 33, '2016-10-18 07:13:47'),
(26, 3, 35, '2016-10-18 07:13:47'),
(27, 3, 36, '2016-10-18 07:13:47'),
(28, 3, 37, '2016-10-18 07:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `acl_role_action_list`
--

CREATE TABLE IF NOT EXISTS `acl_role_action_list` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(150) COLLATE utf8_persian_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_persian_ci NOT NULL,
  `component_id` int(11) NOT NULL,
  `action_name_fa` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `action_name` (`action_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `acl_role_action_list`
--

INSERT INTO `acl_role_action_list` (`action_id`, `action_name`, `description`, `component_id`, `action_name_fa`) VALUES
(10, 'user_view', '', 1, 'مشاهده کاربران'),
(11, 'user_edit', '', 1, 'ویرایش کاربران'),
(14, 'user_new', '', 1, 'ثبت کاربر جدید'),
(18, 'user_view_action', '', 1, 'مشاهده فعالیت های سایت'),
(20, 'user_new_roletoaction', '', 1, 'اختصاص  کاربر به نقش'),
(24, 'user_new_roletogroup', '', 1, 'اختصاص گروه کاربری به نقش'),
(26, 'user_view_roll', '', 1, 'مشاهده نقش'),
(27, 'user_new_roll', '', 1, 'ثبت نقش جدید'),
(28, 'user_edit_roll', '', 1, 'ویرایش نقش '),
(30, 'user_new_setrole', '', 1, 'اختصاص کاربر به نقش'),
(33, 'user_new_setusergroup', '', 1, 'اختصاص کاربر به گروه کاربری'),
(35, 'user_view_usergroup', '', 1, 'مشاهده گروه کاربری'),
(36, 'user_new_usergroup', '', 1, 'ثبت گروه کاربری جدید'),
(37, 'user_edit_usergroup', '', 1, 'ویرایش گروه کاربری'),
(38, 'user_view_setusergroup', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `acl_role_group`
--

CREATE TABLE IF NOT EXISTS `acl_role_group` (
  `role_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `creation_by` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `acl_role_group`
--

INSERT INTO `acl_role_group` (`role_group_id`, `group_name`, `role_id`, `creation_by`, `creation_date`, `group_id`) VALUES
(2, 'مدیر کل', 3, 0, '2016-10-08 07:08:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acl_user_log`
--

CREATE TABLE IF NOT EXISTS `acl_user_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action_id` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `access_status` int(11) NOT NULL,
  `message` text COLLATE utf8_persian_ci NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=74 ;

--
-- Dumping data for table `acl_user_log`
--

INSERT INTO `acl_user_log` (`log_id`, `user_id`, `action_id`, `access_status`, `message`, `create_at`) VALUES
(1, 120, 'edit_profile', 1, '', '2016-10-06 11:01:07'),
(2, 120, 'saveProfile', 0, '', '2016-10-06 11:01:07'),
(3, 120, 'edit_profile', 1, '', '2016-10-08 06:23:43'),
(4, 120, 'saveProfile', 0, '', '2016-10-08 06:23:43'),
(5, 120, 'kimia', 0, '', '2016-10-08 06:28:34'),
(6, 120, 'neda', 0, '', '2016-10-08 06:29:55'),
(7, 120, 'neda', 1, '', '2016-10-08 06:33:27'),
(8, 120, 'edit_profile', 1, '', '2016-10-08 06:33:27'),
(9, 120, 'saveProfile', 0, '', '2016-10-08 06:33:27'),
(10, 6, 'neda', 0, '', '2016-10-08 06:49:49'),
(11, 6, 'neda', 0, '', '2016-10-08 06:49:54'),
(12, 6, 'noaccess', 0, '', '2016-10-08 06:49:56'),
(13, 6, 'noaccess', 1, '', '2016-10-08 06:50:31'),
(14, 120, 'neda', 1, '', '2016-10-08 06:55:05'),
(15, 120, 'edit_profile', 1, '', '2016-10-08 06:55:05'),
(16, 120, 'saveProfile', 0, '', '2016-10-08 06:55:05'),
(17, 120, 'noaccess', 0, '', '2016-10-08 06:55:32'),
(18, 120, 'view_user', 1, '', '2016-10-08 06:57:46'),
(19, 120, 'view_user', 1, '', '2016-10-08 06:57:50'),
(20, 120, 'view_user', 1, '', '2016-10-08 06:59:58'),
(21, 120, 'view_user', 1, '', '2016-10-08 07:01:01'),
(22, 120, 'view_user', 1, '', '2016-10-08 07:02:06'),
(23, 120, 'edit_user', 0, '', '2016-10-08 07:02:08'),
(24, 120, 'view_user', 1, '', '2016-10-08 07:08:12'),
(25, 120, 'view_user', 1, '', '2016-10-08 07:08:16'),
(26, 120, 'view_user', 1, '', '2016-10-08 07:08:34'),
(27, 120, 'edit_user', 1, '', '2016-10-08 07:08:36'),
(28, 120, 'view_user', 1, '', '2016-10-08 07:08:40'),
(29, 6, 'view_user', 1, '', '2016-10-10 13:43:45'),
(30, 6, 'view_user', 1, '', '2016-10-10 13:44:05'),
(31, 6, 'view_user', 1, '', '2016-10-10 13:45:11'),
(32, 6, 'view_user', 1, '', '2016-10-10 13:45:37'),
(33, 6, 'view_user', 1, '', '2016-10-10 13:45:37'),
(34, 6, 'view_user', 1, '', '2016-10-10 13:46:14'),
(35, 6, 'view_user', 1, '', '2016-10-10 13:46:14'),
(36, 6, 'view_user', 1, '', '2016-10-10 13:46:45'),
(37, 6, 'view_user', 1, '', '2016-10-10 13:46:45'),
(38, 6, 'new_user', 0, '', '2016-10-10 13:47:11'),
(39, 6, 'new_user', 0, '', '2016-10-10 13:47:11'),
(40, 6, 'view_user', 1, '', '2016-10-10 13:48:25'),
(41, 6, 'view_user', 1, '', '2016-10-10 13:48:25'),
(42, 6, 'view_user', 1, '', '2016-10-10 14:05:50'),
(43, 6, 'view_user', 1, '', '2016-10-10 14:05:50'),
(44, 6, 'view_user', 1, '', '2016-10-10 14:11:41'),
(45, 6, 'view_user', 1, '', '2016-10-10 14:11:41'),
(46, 6, 'view_user', 1, '', '2016-10-18 05:57:44'),
(47, 6, 'view_user', 1, '', '2016-10-18 05:57:44'),
(48, 6, 'view_user', 0, '', '2016-10-18 06:27:40'),
(49, 6, 'view_user', 0, '', '2016-10-18 06:27:40'),
(50, 6, 'view_user', 0, '', '2016-10-18 06:27:56'),
(51, 6, 'view_user', 0, '', '2016-10-18 06:27:56'),
(52, 6, 'user_view_roll', 0, '', '2016-10-18 06:59:44'),
(53, 6, 'user_view_roll', 0, '', '2016-10-18 06:59:44'),
(54, 6, 'user_view', 1, '', '2016-10-18 07:00:00'),
(55, 6, 'user_view', 1, '', '2016-10-18 07:00:00'),
(56, 6, 'user_view', 1, '', '2016-10-18 07:00:01'),
(57, 6, 'user_view', 1, '', '2016-10-18 07:00:01'),
(58, 6, 'user_view', 1, '', '2016-10-18 07:00:02'),
(59, 6, 'user_view', 1, '', '2016-10-18 07:00:03'),
(60, 6, 'user_view_roll', 0, '', '2016-10-18 07:00:14'),
(61, 6, 'user_view_roll', 0, '', '2016-10-18 07:00:14'),
(62, 6, 'user_view', 1, '', '2016-10-18 07:00:39'),
(63, 6, 'user_view_roll', 0, '', '2016-10-18 07:00:43'),
(64, 6, 'user_view_roll', 0, '', '2016-10-18 07:00:58'),
(65, 6, 'user_view_action', 1, '', '2016-10-18 07:14:25'),
(66, 6, 'user_view_roll', 1, '', '2016-10-18 07:14:27'),
(67, 6, 'user_new_roletoaction', 1, '', '2016-10-18 07:14:29'),
(68, 6, 'user_new_setrole', 1, '', '2016-10-18 07:14:37'),
(69, 6, 'user_view_usergroup', 1, '', '2016-10-18 07:14:41'),
(70, 6, 'user_new_roletogroup', 1, '', '2016-10-18 07:14:43'),
(71, 6, 'user_new_setusergroup', 1, '', '2016-10-18 07:14:47'),
(72, 6, 'user_view_roll', 1, '', '2016-10-18 07:15:13'),
(73, 6, 'user_new_setrole', 1, '', '2016-10-18 07:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `acl_user_role`
--

CREATE TABLE IF NOT EXISTS `acl_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_role_id`),
  KEY `idx_acl_user_role` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `acl_user_role`
--

INSERT INTO `acl_user_role` (`user_role_id`, `user_id`, `role_id`, `creation_date`) VALUES
(11, 6, 3, '2016-10-18 07:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `group_description` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`group_id`, `group_name`, `group_description`, `creation_date`, `create_by`) VALUES
(1, 'مدیر کل', NULL, '2016-10-06 09:05:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_set_group`
--

CREATE TABLE IF NOT EXISTS `user_set_group` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL,
  `set_group_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_set_group`
--

INSERT INTO `user_set_group` (`user_id`, `group_id`, `creation_date`, `create_by`, `set_group_id`) VALUES
(6, 1, '2016-10-18 07:12:44', NULL, 6);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acl_role_action`
--
ALTER TABLE `acl_role_action`
  ADD CONSTRAINT `fk_acl_role_action_0` FOREIGN KEY (`role_id`) REFERENCES `acl_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
