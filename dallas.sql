-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2019 at 01:38 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dallas`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE `apps` (
  `appId` int(20) NOT NULL,
  `appName` varchar(250) DEFAULT NULL,
  `appPath` varchar(255) DEFAULT NULL,
  `appStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apps`
--

INSERT INTO `apps` (`appId`, `appName`, `appPath`, `appStatus`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'accounts', 'accounts', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'check-ins', 'checkins', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'giving', 'giving', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'groups', 'groups', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(5, 'people', 'people', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(6, 'registrations', 'registrations', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(7, 'resources', 'resources', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(8, 'services', 'services', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `chId` bigint(20) NOT NULL,
  `eventId` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `chINDateTime` timestamp NULL DEFAULT NULL,
  `chOUTDateTime` timestamp NULL DEFAULT NULL,
  `chKind` enum('Regular','Guest','Volunteer') DEFAULT 'Regular' COMMENT 'user type with ''Regular'',''Guest'',''Volunteer''',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comm_details`
--

CREATE TABLE `comm_details` (
  `id` bigint(20) NOT NULL,
  `comm_master_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `read_status` varchar(255) NOT NULL DEFAULT 'UNREAD' COMMENT 'Read status:READ,UNREAD',
  `delete_status` varchar(255) NOT NULL DEFAULT 'UNDELETED' COMMENT 'Message status:DELETED,UNDELETED',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comm_masters`
--

CREATE TABLE `comm_masters` (
  `id` bigint(20) NOT NULL,
  `comm_template_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Email,2=Notification',
  `tag` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `name` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `from_user_id` bigint(20) DEFAULT NULL COMMENT 'From UserId',
  `related_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comm_masters`
--

INSERT INTO `comm_masters` (`id`, `comm_template_id`, `org_id`, `type`, `tag`, `name`, `subject`, `body`, `from_user_id`, `related_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 11, 1, 1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, NULL, '2019-12-19 03:52:41', NULL, '2019-12-19 03:52:41', NULL, NULL),
(2, 12, 1, 2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, NULL, '2019-12-19 03:54:17', NULL, '2019-12-19 03:54:17', NULL, NULL),
(3, 11, 1, 1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, NULL, '2019-12-19 05:57:53', NULL, '2019-12-19 05:57:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_templates`
--

CREATE TABLE `comm_templates` (
  `id` bigint(20) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` text,
  `body` text,
  `org_id` bigint(20) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comm_templates`
--

INSERT INTO `comm_templates` (`id`, `tag`, `name`, `subject`, `body`, `org_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-21 18:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-21 18:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-21 18:01:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(5, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(6, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(7, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(8, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(9, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(10, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(11, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(12, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(13, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(14, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(15, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(16, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(17, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(18, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(19, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(20, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(21, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(22, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(23, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(24, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(25, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(26, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(27, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(28, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(29, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL),
(30, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 2, NULL, '2019-12-23 06:46:05', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventId` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `eventName` varchar(250) DEFAULT NULL,
  `eventFreq` varchar(250) DEFAULT NULL COMMENT 'Daily,Weekly,None',
  `eventDesc` text,
  `eventCreatedDate` date DEFAULT NULL,
  `eventCheckin` time DEFAULT NULL,
  `eventShowTime` time DEFAULT NULL,
  `eventStartCheckin` time DEFAULT NULL,
  `eventEndCheckin` time DEFAULT NULL,
  `eventLocation` text,
  `eventRoom` int(11) DEFAULT NULL,
  `eventResource` int(11) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `orgId`, `eventName`, `eventFreq`, `eventDesc`, `eventCreatedDate`, `eventCheckin`, `eventShowTime`, `eventStartCheckin`, `eventEndCheckin`, `eventLocation`, `eventRoom`, `eventResource`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Chennai Dance', 'Daily', NULL, '2019-12-19', NULL, '14:00:00', '10:00:00', '18:00:00', '1', NULL, NULL, '1', '2019-12-18 11:52:23', NULL, '2019-12-18 11:52:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `fields` varchar(1000) DEFAULT NULL,
  `profile_fields` varchar(250) DEFAULT NULL,
  `general_fields` varchar(500) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - deactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

CREATE TABLE `form_submissions` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `profile_fields` varchar(1000) DEFAULT NULL,
  `general_fields` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `giving`
--

CREATE TABLE `giving` (
  `id` bigint(20) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `payment_gateway_id` bigint(20) DEFAULT NULL COMMENT 'payment_gateway.payment_gateway_id',
  `other_payment_method_id` bigint(20) DEFAULT NULL COMMENT 'other_payment_methods.other_payment_method_id',
  `amount` varchar(25) DEFAULT NULL,
  `pay_mode` varchar(100) DEFAULT NULL COMMENT 'Credit,Debit',
  `purpose_note` text,
  `transaction_date` datetime DEFAULT NULL COMMENT 'Date on which transaction was done',
  `transaction_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status of transaction 1 => submitted, 2 = > confirmed 3=> declined/error',
  `customer_id` text COMMENT 'customer_id response sent from payment gateway',
  `token_id` text COMMENT 'token id from payment Gateway',
  `submited_datetime` datetime DEFAULT NULL,
  `confirmed_date` datetime DEFAULT NULL,
  `final_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Submitted,2=InProgress,3=Confirmed,4=Declined/Rejected',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `giving`
--

INSERT INTO `giving` (`id`, `type`, `user_id`, `orgId`, `event_id`, `email`, `first_name`, `middle_name`, `last_name`, `full_name`, `mobile_no`, `payment_gateway_id`, `other_payment_method_id`, `amount`, `pay_mode`, `purpose_note`, `transaction_date`, `transaction_status`, `customer_id`, `token_id`, `submited_datetime`, `confirmed_date`, `final_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 2, 1, 1, 1, 'santhosh@test.com', 'Santhosh', 'Zeal', 'Krishnan', NULL, '9994309807', 1, 1, '1000', 'Credit', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, '2019-12-18 13:19:55', NULL, '2019-12-19 07:11:50', NULL, NULL),
(2, 1, 1, 1, NULL, 'aaaa@asd.com', 'santhosh', 'test', 'krishnan', NULL, '2468024', 1, 1, '100', 'Credit', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, '2019-12-19 06:01:34', NULL, '2019-12-19 07:11:20', NULL, NULL),
(3, 1, 1, 1, NULL, 'kk@test.com', 'kkkkk', 'sssss', 'rrrrrrr', NULL, '3423434343', 1, 1, '300', 'Credit', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, '2019-12-19 13:36:37', NULL, '2019-12-19 13:36:37', NULL, NULL),
(4, 1, 4, 2, NULL, 'ss@gmail.com', 'kkkkk', 'sssss', 'krish', NULL, '2468024', 1, 1, '600', 'Credit', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, '2019-12-23 06:51:34', NULL, '2019-12-23 06:51:34', NULL, NULL),
(5, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '1230', 'Credit', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, '2019-12-24 10:44:47', NULL, '2019-12-24 10:44:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `groupType_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `notes` text,
  `image_path` text,
  `meeting_schedule` text,
  `isPublic` tinyint(1) DEFAULT '1' COMMENT '0=Disable, 1=Enable',
  `location` varchar(255) DEFAULT NULL,
  `is_enroll_autoClose` tinyint(1) NOT NULL DEFAULT '0',
  `enroll_autoClose_on` date DEFAULT NULL,
  `is_enroll_autoClose_count` tinyint(1) NOT NULL DEFAULT '0',
  `enroll_autoClose_count` int(15) DEFAULT NULL COMMENT 'Max attendendies per group',
  `is_enroll_notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `enroll_notify_count` int(15) DEFAULT NULL,
  `contact_email` varchar(75) DEFAULT NULL,
  `visible_leaders_fields` text COMMENT 'Stored in serialized formate',
  `visible_members_fields` text COMMENT 'Stored in serialized Formate',
  `can_leaders_search_people` tinyint(1) NOT NULL DEFAULT '1',
  `can_leaders_take_attendance` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `event_remind_before` int(5) DEFAULT '0',
  `enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `enroll_msg` varchar(255) DEFAULT NULL,
  `leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_public` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `orgId`, `groupType_id`, `name`, `description`, `notes`, `image_path`, `meeting_schedule`, `isPublic`, `location`, `is_enroll_autoClose`, `enroll_autoClose_on`, `is_enroll_autoClose_count`, `enroll_autoClose_count`, `is_enroll_notify_count`, `enroll_notify_count`, `contact_email`, `visible_leaders_fields`, `visible_members_fields`, `can_leaders_search_people`, `can_leaders_take_attendance`, `is_event_remind`, `event_remind_before`, `enroll_status`, `enroll_msg`, `leader_visibility_publicly`, `is_event_public`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 'Group 1', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-19 04:05:11', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_enrolls`
--

CREATE TABLE `group_enrolls` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_no` int(15) DEFAULT NULL,
  `message` text,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_events`
--

CREATE TABLE `group_events` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `isMutiDay_event` tinyint(1) NOT NULL DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  `is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `event_remind_before` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_events_attendance`
--

CREATE TABLE `group_events_attendance` (
  `id` bigint(22) NOT NULL,
  `event_id` bigint(22) DEFAULT NULL,
  `group_member_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `isUser` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=User, 2=Enrolled User',
  `user_id` bigint(20) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Leader, 2=Member',
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `message` text,
  `member_since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_resources`
--

CREATE TABLE `group_resources` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=File, 2=URL Path',
  `source` text,
  `description` text,
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Only for Leaders / Admins, 2=ALL',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_resources`
--

INSERT INTO `group_resources` (`id`, `group_id`, `name`, `type`, `source`, `description`, `visibility`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Test', 1, NULL, NULL, 1, '1', '2019-12-19 04:05:37', NULL, '2019-12-19 04:05:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_tags`
--

CREATE TABLE `group_tags` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `tag_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_types`
--

CREATE TABLE `group_types` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  `d_isPublic` tinyint(1) DEFAULT '1' COMMENT '0=Disable, 1=Enable',
  `d_meeting_schedule` text,
  `d_description` text,
  `d_location` varchar(255) DEFAULT NULL,
  `d_contact_email` varchar(75) DEFAULT NULL,
  `d_visible_leaders_fields` text COMMENT 'Stored in serialized formate',
  `d_visible_members_fields` text COMMENT 'Stored in serialized Formate',
  `d_is_enroll_autoClose` tinyint(1) NOT NULL DEFAULT '0',
  `d_enroll_autoClose_on` date DEFAULT NULL,
  `d_is_enroll_autoClose_count` tinyint(1) NOT NULL DEFAULT '0',
  `d_enroll_autoClose_count` int(15) DEFAULT NULL COMMENT 'Max attendendies per group',
  `d_is_enroll_notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `d_enroll_notify_count` int(15) DEFAULT NULL,
  `d_can_leaders_search_people` tinyint(1) NOT NULL DEFAULT '1',
  `d_is_event_public` tinyint(1) NOT NULL DEFAULT '1',
  `d_is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `d_event_remind_before` int(5) DEFAULT NULL,
  `d_can_leaders_take_attendance` tinyint(1) NOT NULL DEFAULT '1',
  `d_enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `d_enroll_msg` varchar(255) DEFAULT NULL,
  `d_leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_types`
--

INSERT INTO `group_types` (`id`, `orgId`, `name`, `description`, `isPublic`, `d_isPublic`, `d_meeting_schedule`, `d_description`, `d_location`, `d_contact_email`, `d_visible_leaders_fields`, `d_visible_members_fields`, `d_is_enroll_autoClose`, `d_enroll_autoClose_on`, `d_is_enroll_autoClose_count`, `d_enroll_autoClose_count`, `d_is_enroll_notify_count`, `d_enroll_notify_count`, `d_can_leaders_search_people`, `d_is_event_public`, `d_is_event_remind`, `d_event_remind_before`, `d_can_leaders_take_attendance`, `d_enroll_status`, `d_enroll_msg`, `d_leader_visibility_publicly`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Small groups', 'Small groups are a key aspect of our church community. Most meet weekly in the home of a group member (usually the leader\'s home). We try to keep them limited to about 12 people. If you can\'t find an open group, please let us know!', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-12-19 04:04:58', NULL, '2019-12-19 04:04:58', NULL, NULL),
(2, 2, 'Small groups', 'Small groups are a key aspect of our church community. Most meet weekly in the home of a group member (usually the leader\'s home). We try to keep them limited to about 12 people. If you can\'t find an open group, please let us know!', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-12-23 06:53:24', NULL, '2019-12-23 06:53:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE `households` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `hhPrimaryUserId` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`id`, `orgId`, `hhPrimaryUserId`, `name`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 'St Paul Admin Household', NULL, '2019-12-19 03:54:16', NULL, '2019-12-19 03:54:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `household_user`
--

CREATE TABLE `household_user` (
  `id` int(11) NOT NULL,
  `household_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `isPrimary` tinyint(2) NOT NULL DEFAULT '2',
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedBy` text,
  `deletedBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insights`
--

CREATE TABLE `insights` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=File, 2=URL Path',
  `source` text,
  `description` text,
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Only for Leaders / Admins, 2=ALL',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insights`
--

INSERT INTO `insights` (`id`, `group_id`, `name`, `type`, `source`, `description`, `visibility`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Insight one update', 1, 's:363:\"{\"uploaded_path\":\"C:\\\\xampp\\\\htdocs\\\\dallas\\\\public\\\\assets\\\\uploads\\\\organizations\\\\1\\\\group\\\\1\\\\insights\\\\\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/1\\/insights\\/\",\"uploaded_file_name\":\"React Error_1576826964.PNG\",\"original_filename\":\"React Error_1576826964.PNG\",\"upload_file_extension\":\"PNG\",\"file_size\":0}\";', 'Insight Desc update', 1, '1', '2019-12-20 07:29:24', '1', '2019-12-20 07:50:12', NULL, NULL),
(2, 1, 'Google', 2, 'http://google.co.in', 'Google Description', 2, '1', '2019-12-20 07:51:41', NULL, '2019-12-20 07:51:41', NULL, NULL),
(3, 1, 'W3schools', 2, 'https://www.w3schools.com/', 'WEB DEVELOPER SITE', 1, '1', '2019-12-20 08:35:59', '1', '2019-12-20 08:36:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `orgId`, `name`, `latitude`, `longitude`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Chennai', '1', '1', 1, '2019-12-18 11:51:49', NULL, '2019-12-18 11:51:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_lookup_data`
--

CREATE TABLE `master_lookup_data` (
  `mldId` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `mldKey` varchar(150) DEFAULT NULL,
  `mldValue` varchar(200) DEFAULT NULL,
  `mldType` enum('A','B') NOT NULL DEFAULT 'A' COMMENT ' A=Master Code,B=Organization Added Code',
  `mldOption` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Edit - Delete, 2=Edit - No Delete,3=No Edit - Delete,4=No Edit - No Delete',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_lookup_data`
--

INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 0, 'school_name', 'High School', 'A', 1, NULL, '2019-07-10 12:21:10', NULL, '2019-07-16 12:09:52', NULL, NULL),
(2, 0, 'school_name', 'Middle School', 'A', 1, NULL, '2019-07-10 12:30:06', NULL, '2019-07-16 12:09:52', NULL, NULL),
(3, 0, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(4, 0, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(5, 0, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(6, 0, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(7, 0, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(8, 0, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(9, 0, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(10, 0, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(11, 0, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(12, 0, 'name_suffix', 'II', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(13, 0, 'name_suffix', 'III', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(14, 0, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(15, 0, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(16, 0, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(17, 0, 'marital_status', 'Single', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(18, 0, 'marital_status', 'Married', 'A', 4, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(19, 0, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(20, 0, 'membership_status', 'Member', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(21, 0, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(22, 0, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(23, 0, 'membership_status', 'Participant', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(24, 0, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(25, 0, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(26, 0, 'grade_name', 'K', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(27, 0, 'grade_name', '1st', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(28, 0, 'grade_name', '2nd', 'A', 1, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(29, 0, 'grade_name', '3rd', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(30, 0, 'room_group', 'Group1', 'A', 4, NULL, '2019-08-22 16:33:55', NULL, '2019-08-22 16:33:55', NULL, NULL),
(31, 0, 'resource_category', 'Electronic', 'A', 4, NULL, '2019-08-22 16:33:55', NULL, '2019-08-22 16:33:55', NULL, NULL),
(32, 0, 'pastor_board', 'Electronic', 'A', 1, NULL, '2019-09-11 09:35:01', NULL, '0000-00-00 00:00:00', NULL, NULL),
(33, 0, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-09-11 09:35:01', NULL, '0000-00-00 00:00:00', NULL, NULL),
(34, 1, 'school_name', 'High School', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(35, 1, 'school_name', 'Middle School', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(36, 1, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(37, 1, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(38, 1, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(39, 1, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(40, 1, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(41, 1, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(42, 1, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(43, 1, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(44, 1, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(45, 1, 'name_suffix', 'II', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(46, 1, 'name_suffix', 'III', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(47, 1, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(48, 1, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(49, 1, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(50, 1, 'marital_status', 'Single', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(51, 1, 'marital_status', 'Married', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(52, 1, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(53, 1, 'membership_status', 'Member', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(54, 1, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(55, 1, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(56, 1, 'membership_status', 'Participant', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(57, 1, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(58, 1, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(59, 1, 'grade_name', 'K', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(60, 1, 'grade_name', '1st', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(61, 1, 'grade_name', '2nd', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(62, 1, 'grade_name', '3rd', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(63, 1, 'room_group', 'Group1', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(64, 1, 'resource_category', 'Electronic', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(65, 1, 'pastor_board', 'Electronic', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(66, 1, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(67, 2, 'school_name', 'High School', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(68, 2, 'school_name', 'Middle School', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(69, 2, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(70, 2, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(71, 2, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(72, 2, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(73, 2, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(74, 2, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(75, 2, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(76, 2, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(77, 2, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(78, 2, 'name_suffix', 'II', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(79, 2, 'name_suffix', 'III', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(80, 2, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(81, 2, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(82, 2, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(83, 2, 'marital_status', 'Single', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(84, 2, 'marital_status', 'Married', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(85, 2, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(86, 2, 'membership_status', 'Member', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(87, 2, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(88, 2, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(89, 2, 'membership_status', 'Participant', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(90, 2, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(91, 2, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(92, 2, 'grade_name', 'K', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(93, 2, 'grade_name', '1st', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(94, 2, 'grade_name', '2nd', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(95, 2, 'grade_name', '3rd', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(96, 2, 'room_group', 'Group1', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(97, 2, 'resource_category', 'Electronic', 'A', 4, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(98, 2, 'pastor_board', 'Electronic', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL),
(99, 2, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-12-23 06:46:05', NULL, '2019-12-23 06:46:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_05_06_061007_create_permission_tables', 1),
(8, '2019_05_06_061659_create_posts_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(12, '2016_06_01_000004_create_oauth_clients_table', 2),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 1),
(2, 'App\\User', 4),
(13, 'App\\User', 1),
(14, 'App\\User', 2),
(14, 'App\\User', 3),
(24, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('04b2fbfd3b5f0e1b5a1d53656cc79be95ce03509f5727cda98cbdff0e4aa2ad03fc50b3e5a3ffeb0', 1, 1, 'dollar', '[]', 0, '2019-12-18 01:55:00', '2019-12-18 01:55:00', '2020-12-18 07:25:00'),
('0d7de4da49f7d62ca0b1fd700464f7323e800fbb5585c9cc88390b2c86511fc948f8fb2746dca8cb', 1, 1, 'dollar', '[]', 0, '2019-12-20 09:35:49', '2019-12-20 09:35:49', '2020-12-20 15:05:49'),
('1ab2519da1154b009cb2e375ac651d92e34595609d1fc275075304a48070adb8a5f2627a9ca91716', 1, 1, 'dollar', '[]', 0, '2019-12-27 07:27:07', '2019-12-27 07:27:07', '2020-12-27 12:57:07'),
('2b9091a5d4bccbb3946f447c1618cd2a2fcc5f598b8e25d820a11ed4dbd2085e6a537ba5421db57b', 1, 1, 'dollar', '[]', 0, '2019-12-23 11:40:39', '2019-12-23 11:40:39', '2020-12-23 17:10:39'),
('33fb7951ed4f4df1108b88eebb000d3d6001a4b55624ecc3f6c86ef655ce0b3087d3a75a925a43ac', 1, 1, 'dollar', '[]', 0, '2019-12-24 09:58:39', '2019-12-24 09:58:39', '2020-12-24 15:28:39'),
('3dc10eadf622445da2f5a198c4d681b5975dce84f13d7f80c281bda74f7596442f0987e39ad40884', 1, 1, 'dollar', '[]', 0, '2019-12-18 07:26:17', '2019-12-18 07:26:17', '2020-12-18 12:56:17'),
('3ec249bdd2803f578e6096adf0cef23c009c9de1a3f73a5ab4afa5f1d15807e696054292848c2031', 1, 1, 'dollar', '[]', 0, '2019-12-27 07:43:58', '2019-12-27 07:43:58', '2020-12-27 13:13:58'),
('46374c386935edcc3cc90c6d065e298a2aa55234509db509f484e1b5ccc458f45e70ba81e5094281', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:59:13', '2019-12-19 03:59:13', '2020-12-19 09:29:13'),
('48ffc041a97cae80486aa8cfc96149f749256dc00b89478d70fd97b254e71ea71afb3435f6a5effd', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:59:03', '2019-12-19 03:59:03', '2020-12-19 09:29:03'),
('4f169067ce65e364e645caa405efd19c60ab4b388b1fe131cad0f9142a61c27b34245cd67e3abad7', 4, 1, 'dollar', '[]', 0, '2019-12-27 07:39:27', '2019-12-27 07:39:27', '2020-12-27 13:09:27'),
('5d4fb7499ac572a8dcac5d9514fe1ebd2e4983a08e93eec6dd21d0fbe0c43d217644440ef6f52fb3', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:59:03', '2019-12-19 03:59:03', '2020-12-19 09:29:03'),
('5fddda10e9d8502214fd2dd9b1124aa5ab5411b0dad0ae74ff05330190e98892f2d3bf5a064e96e8', 1, 1, 'dollar', '[]', 0, '2019-12-18 10:17:20', '2019-12-18 10:17:20', '2020-12-18 15:47:20'),
('691a0bc1b5c07d8b8d25200b05b9b92160fdb3a6923eeac2e81e8969ab898ea4ed3c61c7c3972c02', 1, 1, 'dollar', '[]', 0, '2019-12-26 04:13:36', '2019-12-26 04:13:36', '2020-12-26 09:43:36'),
('786fcf91d486ebfe73be5c7bc6bd9a9e4ebf5bb68a08a73a142149c961c8555fc495132eacdcdeb4', 1, 1, 'dollar', '[]', 0, '2019-12-18 06:50:54', '2019-12-18 06:50:54', '2020-12-18 12:20:54'),
('8551ee9a30da6bf68c030951e8de61f0db4755eea6af55d4b0485d661c88677658fab7f2779b5bdd', 1, 1, 'dollar', '[]', 0, '2019-12-18 07:03:39', '2019-12-18 07:03:39', '2020-12-18 12:33:39'),
('85e938e8e774812ec95aa621a75c874ad657a5015e4a047ea101f4607adf58fd804a25fa6dae16d3', 1, 1, 'dollar', '[]', 0, '2019-12-23 10:40:17', '2019-12-23 10:40:17', '2020-12-23 16:10:17'),
('88ca2c5046419875b669dfe9abd120097c8d4d4ddeb369abddb8eea46c556020a278ddf431312cf1', 1, 1, 'dollar', '[]', 0, '2019-12-26 10:47:50', '2019-12-26 10:47:50', '2020-12-26 16:17:50'),
('8902b2b25bcfe6d2a14107b8db58c1d430eb8a0404734aa6e1b1ac2404659886786bf0e3fe3e45e3', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:59:03', '2019-12-19 03:59:03', '2020-12-19 09:29:03'),
('98b2b3be7966b1d78d93bdb99353eace9352a47f32ddded3a17352344a6321f21ee9c6193be438fd', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:59:03', '2019-12-19 03:59:03', '2020-12-19 09:29:03'),
('9b4aadd0e5575923f004f9349fc5a4226b5d9af24a6649e26f1e705c2ce51c57d434f2a508187539', 4, 1, 'dollar', '[]', 0, '2019-12-27 07:24:46', '2019-12-27 07:24:46', '2020-12-27 12:54:46'),
('a1236daeae4ba50600bb7cc91ddb9edc7cab98d3b26b974621703193e497d20dc0ac906626830422', 1, 1, 'dollar', '[]', 0, '2019-12-23 10:40:17', '2019-12-23 10:40:17', '2020-12-23 16:10:17'),
('a24ac52afe4a959c3cd181ac3be467f6bc0ec7e57efc539ee9769352494b58107b1658829cb947a0', 4, 1, 'dollar', '[]', 0, '2019-12-27 07:21:41', '2019-12-27 07:21:41', '2020-12-27 12:51:41'),
('aaf3982cb26bfd5df2c597eaf010f9f64dba5c5784a28cd058f0a826854791cde7f1e9becb251e00', 1, 1, 'dollar', '[]', 0, '2019-12-18 10:29:51', '2019-12-18 10:29:51', '2020-12-18 15:59:51'),
('ade572caae2b22cc4c54cbf90b50f8f0f24f48f09ae9a4f3a2ad7e8a4c8fd47417ea958925d58ef8', 1, 1, 'dollar', '[]', 0, '2019-12-19 13:35:50', '2019-12-19 13:35:50', '2020-12-19 19:05:50'),
('ae16c3e2b4d7117b36063371fb03ae2b0f7209e10e121c05ecf7c2f2f31efa7e3c79b6360ec06503', 1, 1, 'dollar', '[]', 0, '2019-12-23 05:36:18', '2019-12-23 05:36:18', '2020-12-23 11:06:18'),
('b1809ac5c5925ba5c4575e32349d2cdcd0fa66a6ebedbc106882b77e581c84e3114c4d131d0b3cd8', 4, 1, 'dollar', '[]', 0, '2019-12-23 06:47:38', '2019-12-23 06:47:38', '2020-12-23 12:17:38'),
('b21960c2c7d555f7c3f037c0636b93f5e54333b6b7410e3a6e03d8edac89817fd0339fbb56ce91c7', 2, 1, 'dollar', '[]', 0, '2019-12-26 10:47:39', '2019-12-26 10:47:39', '2020-12-26 16:17:39'),
('b87fb8b5e6f8bb478599511d58b4687be5c8bb02ac3b2673ac6dd9674cfb5f5ecbc4789d9bfd5c6b', 4, 1, 'dollar', '[]', 0, '2019-12-26 10:45:02', '2019-12-26 10:45:02', '2020-12-26 16:15:02'),
('c82625b2512546b612a4a425eb7ed7831d71290b7a251ad353ea238ec13aee047f182e2d9470f3eb', 1, 1, 'dollar', '[]', 0, '2019-12-27 07:57:25', '2019-12-27 07:57:25', '2020-12-27 13:27:25'),
('c9cecee0a38ce4e38a47ca40f2528635d198531f17cfc45ef6a8d16413ecd2ce1eb551388c7ea75c', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:45:52', '2019-12-19 03:45:52', '2020-12-19 09:15:52'),
('cdf5d4cee34646a8f985e5f55324ad791d02a297a90dd9f232f3b4efc3e6edacc9aabe6adc87e6e1', 1, 1, 'dollar', '[]', 0, '2019-12-27 04:03:02', '2019-12-27 04:03:02', '2020-12-27 09:33:02'),
('cf7ba5e9ff8a26e88db4938bea6a7a29c031bf33ad690fe8b3745853577202f50db6e674bcb24637', 1, 1, 'dollar', '[]', 0, '2019-12-20 04:05:16', '2019-12-20 04:05:16', '2020-12-20 09:35:16'),
('d5989a99dc7fc0890419c982f7cb6c2e096986bd9303d718c47852967ade7a8e611010d72994ea2f', 1, 1, 'dollar', '[]', 0, '2019-12-18 07:22:38', '2019-12-18 07:22:38', '2020-12-18 12:52:38'),
('e6c2ec13b12e944b19b6b2889bba9f03a60f6237f075b556679781e6eefc225be397d118a14b0e07', 1, 1, 'dollar', '[]', 0, '2019-12-19 03:45:52', '2019-12-19 03:45:52', '2020-12-19 09:15:52'),
('e8140852fb6881dbde2f3da194e6e34c850df0922b1aefc316c9939250d4818c3017eab5cc843beb', 1, 1, 'dollar', '[]', 0, '2019-12-27 10:57:18', '2019-12-27 10:57:18', '2020-12-27 16:27:18'),
('edc97192d25965798f4f4908d81cff15a6687c874eb669c8d422d30d229d974144d14ad6e96d40a8', 1, 1, 'dollar', '[]', 0, '2019-12-18 01:55:08', '2019-12-18 01:55:08', '2020-12-18 07:25:08'),
('f9c9dff2ec29537aba19346e36fd96d1ed291d5f6dc331fbf4d83c6247fcbcb95faab8c289682f94', 1, 1, 'dollar', '[]', 0, '2019-12-18 10:17:24', '2019-12-18 10:17:24', '2020-12-18 15:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'KTpGS8SGl59m7hYg24lfah08jwIvdGi4xmdwCRJl', 'http://localhost', 1, 0, 0, '2019-04-22 11:22:39', '2019-04-22 11:22:39'),
(2, NULL, 'Laravel Password Grant Client', '9beWRls9Vc1uMuBkuN0PT1ypowdrXmxnf27GVqha', 'http://localhost', 0, 1, 0, '2019-04-22 11:22:39', '2019-04-22 11:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-05 20:28:45', '2019-05-05 20:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `orgId` bigint(20) NOT NULL,
  `orgName` varchar(255) NOT NULL,
  `orgAddress` text,
  `orgAptUnitBox` text,
  `orgCity` varchar(255) DEFAULT NULL,
  `orgState` varchar(255) DEFAULT NULL,
  `orgPincode` varchar(100) DEFAULT NULL,
  `orgPhone` varchar(50) DEFAULT NULL,
  `orgLogo` text,
  `orgTimeZone` text,
  `orgTimeCountry` int(20) DEFAULT NULL,
  `orgTimeFormat` varchar(10) DEFAULT NULL,
  `orgDateFormat` varchar(255) DEFAULT NULL,
  `orgCurrency` varchar(150) DEFAULT NULL,
  `orgEmail` text,
  `orgWebsite` text,
  `orgTaxIdNo` varchar(150) DEFAULT NULL,
  `orgDomain` varchar(250) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`orgId`, `orgName`, `orgAddress`, `orgAptUnitBox`, `orgCity`, `orgState`, `orgPincode`, `orgPhone`, `orgLogo`, `orgTimeZone`, `orgTimeCountry`, `orgTimeFormat`, `orgDateFormat`, `orgCurrency`, `orgEmail`, `orgWebsite`, `orgTaxIdNo`, `orgDomain`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'St Paul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Canada/Saskatchewan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stpaul', NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(2, 'ssss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Asia/Calcutta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ssss', NULL, '2019-12-23 06:46:04', NULL, '2019-12-23 06:46:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `other_payment_methods`
--

CREATE TABLE `other_payment_methods` (
  `other_payment_method_id` int(11) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_method_notes` text,
  `confirm_payment_method` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Deactive,1=Active  (When a student submits the registration fee method with flag 1 , the payment status will be marked as confirmed )',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive,1=Active',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `other_payment_methods`
--

INSERT INTO `other_payment_methods` (`other_payment_method_id`, `orgId`, `payment_method`, `payment_method_notes`, `confirm_payment_method`, `status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, NULL, 'Cash', 'other_payment_methods', 0, 1, NULL, '2019-12-13 03:57:02', '1', '2019-12-27 11:32:20', NULL, NULL),
(2, NULL, 'Cheque', 'Cheque is made', 0, 1, NULL, '2019-12-13 03:57:02', '1', '2019-12-27 11:37:28', NULL, NULL),
(3, 1, 'Cheque', 'Payment by Cheque', 0, 1, '1', '2019-12-27 11:22:21', NULL, '2019-12-27 11:22:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pastor_board`
--

CREATE TABLE `pastor_board` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `parent_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Post,2=News,3=Ads',
  `p_title` text,
  `p_description` text,
  `classified_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Buy,2=Sell',
  `p_category` bigint(22) DEFAULT NULL COMMENT 'Category from master_lookup table with pastor_board cat',
  `posted_date` datetime DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_email` text,
  `contact_phone` varchar(20) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `image_path` text,
  `location_id` bigint(22) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2-Inactive',
  `createdBy` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL COMMENT 'Unique ID Primary Key',
  `payment_gateway_id` tinyint(1) DEFAULT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `gateway_name` varchar(50) NOT NULL COMMENT 'name of the gateway',
  `active` varchar(1) NOT NULL DEFAULT '1' COMMENT 'Status of the gateway',
  `createdBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `payment_gateway_id`, `orgId`, `gateway_name`, `active`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, NULL, 'Stripe', '1', NULL, '2019-12-26 08:14:24', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 2, NULL, 'Paypal', '1', NULL, '2019-12-26 08:14:24', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 3, NULL, 'Others', '1', NULL, '2019-12-26 08:14:24', NULL, '0000-00-00 00:00:00', NULL, NULL),
(9, 1, 1, 'Stripe', '1', NULL, '2019-12-27 06:19:33', NULL, '2019-12-27 06:19:33', NULL, NULL),
(10, 2, 1, 'Paypal', '1', NULL, '2019-12-27 06:36:10', NULL, '2019-12-27 06:36:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_parameters`
--

CREATE TABLE `payment_gateway_parameters` (
  `parameter_id` int(11) NOT NULL,
  `payment_gateway_id` int(11) NOT NULL,
  `parameter_name` varchar(50) NOT NULL,
  `validation_type` varchar(100) DEFAULT NULL COMMENT 'enter if specific validation is required except "required" validation',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateway_parameters`
--

INSERT INTO `payment_gateway_parameters` (`parameter_id`, `payment_gateway_id`, `parameter_name`, `validation_type`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Public Key', 'text', NULL, '2019-12-26 11:13:14', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 1, 'Secret Key', 'text', NULL, '2019-12-26 11:13:14', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 2, 'Client Email Id', 'email', NULL, '2019-12-26 11:13:14', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `orgId` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `orgId`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Nextgen Checkin', 'web', '2019-05-05 02:51:47', '2019-05-05 02:51:47'),
(2, 0, 'Member Directory', 'web', '2019-05-05 02:51:47', '2019-05-05 02:51:47'),
(3, 0, 'Scheduling', 'web', '2019-05-05 02:51:47', '2019-05-05 03:43:48'),
(4, 0, 'Event management', 'web', '2019-05-05 02:51:47', '2019-05-05 02:51:47'),
(5, 0, 'Small Group', 'web', '2019-05-05 03:30:09', '2019-05-05 03:38:33'),
(6, 0, 'Accounting', 'web', '2019-05-05 03:30:21', '2019-05-05 03:38:37'),
(7, 1, 'Nextgen Checkin', 'web', NULL, NULL),
(8, 1, 'Member Directory', 'web', NULL, NULL),
(9, 1, 'Scheduling', 'web', NULL, NULL),
(10, 1, 'Event management', 'web', NULL, NULL),
(11, 1, 'Small Group', 'web', NULL, NULL),
(12, 1, 'Accounting', 'web', NULL, NULL),
(13, 2, 'Nextgen Checkin', 'web', NULL, NULL),
(14, 2, 'Member Directory', 'web', NULL, NULL),
(15, 2, 'Scheduling', 'web', NULL, NULL),
(16, 2, 'Event management', 'web', NULL, NULL),
(17, 2, 'Small Group', 'web', NULL, NULL),
(18, 2, 'Accounting', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) NOT NULL,
  `orgId` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `item_desc` text,
  `location_id` bigint(20) DEFAULT NULL,
  `item_year` int(11) DEFAULT NULL,
  `item_model` varchar(100) DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `notification_period` varchar(200) NOT NULL,
  `item_photo` text,
  `coa` varchar(150) DEFAULT NULL,
  `rod` varchar(150) DEFAULT NULL,
  `approval_group` int(20) DEFAULT NULL COMMENT 'From ''roles'' table role id resepective of orgId',
  `quantity` int(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `orgId` bigint(20) DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_tag` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `orgId`, `name`, `guard_name`, `role_tag`, `created_at`, `updated_at`) VALUES
(1, 0, 'Super Adminin', 'web', 'superadmin', '2019-05-04 21:22:07', '2019-05-04 21:22:07'),
(2, 0, 'Adminstrator', 'web', 'admin', '2019-05-04 21:22:08', '2019-08-24 15:57:41'),
(3, 0, 'Member', 'web', 'member', '2019-05-04 22:20:10', '2019-05-04 22:20:10'),
(4, 0, 'Volunteer', 'web', 'volunteer', '2019-07-25 17:48:18', '2019-07-25 17:48:18'),
(5, 0, 'Pastor', 'web', 'pastor', '2019-08-24 15:59:13', '2019-09-12 19:52:59'),
(6, 0, 'First Time Guest', 'web', 'firsttimeguest', '2019-08-24 15:59:13', '2019-09-12 19:52:59'),
(7, 0, 'Inactive Member', 'web', 'InactiveMember', '2019-08-24 15:59:52', '2019-09-12 19:52:59'),
(8, 0, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-08-24 15:59:52', '2019-09-12 19:52:59'),
(9, 0, 'Event Organizer', 'web', 'EventOrganizer', '2019-08-24 16:00:12', '2019-09-12 19:52:59'),
(10, 0, 'Production Manager', 'web', 'ProductionManager', '2019-08-24 16:00:12', '2019-09-12 19:52:59'),
(11, 0, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-08-24 16:00:29', '2019-09-12 19:52:59'),
(12, 0, 'Visitor', 'web', 'Visitor', '2019-08-24 16:00:29', '2019-09-12 19:52:59'),
(13, 1, 'Adminstrator', 'web', 'admin', '2019-12-18 01:54:50', NULL),
(14, 1, 'Member', 'web', 'member', '2019-12-18 01:54:50', NULL),
(15, 1, 'Volunteer', 'web', 'volunteer', '2019-12-18 01:54:50', NULL),
(16, 1, 'Pastor', 'web', 'pastor', '2019-12-18 01:54:50', NULL),
(17, 1, 'First Time Guest', 'web', 'firsttimeguest', '2019-12-18 01:54:50', NULL),
(18, 1, 'Inactive Member', 'web', 'InactiveMember', '2019-12-18 01:54:50', NULL),
(19, 1, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-12-18 01:54:50', NULL),
(20, 1, 'Event Organizer', 'web', 'EventOrganizer', '2019-12-18 01:54:50', NULL),
(21, 1, 'Production Manager', 'web', 'ProductionManager', '2019-12-18 01:54:50', NULL),
(22, 1, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-12-18 01:54:50', NULL),
(23, 1, 'Visitor', 'web', 'Visitor', '2019-12-18 01:54:50', NULL),
(24, 2, 'Adminstrator', 'web', 'admin', '2019-12-23 06:46:04', NULL),
(25, 2, 'Member', 'web', 'member', '2019-12-23 06:46:04', NULL),
(26, 2, 'Volunteer', 'web', 'volunteer', '2019-12-23 06:46:04', NULL),
(27, 2, 'Pastor', 'web', 'pastor', '2019-12-23 06:46:04', NULL),
(28, 2, 'First Time Guest', 'web', 'firsttimeguest', '2019-12-23 06:46:04', NULL),
(29, 2, 'Inactive Member', 'web', 'InactiveMember', '2019-12-23 06:46:04', NULL),
(30, 2, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-12-23 06:46:04', NULL),
(31, 2, 'Event Organizer', 'web', 'EventOrganizer', '2019-12-23 06:46:04', NULL),
(32, 2, 'Production Manager', 'web', 'ProductionManager', '2019-12-23 06:46:04', NULL),
(33, 2, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-12-23 06:46:04', NULL),
(34, 2, 'Visitor', 'web', 'Visitor', '2019-12-23 06:46:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(8, 13),
(9, 13),
(10, 13),
(11, 13),
(12, 13),
(13, 24),
(13, 25),
(13, 26),
(13, 27),
(13, 28),
(13, 29),
(13, 30),
(13, 31),
(13, 32),
(13, 33),
(13, 34),
(14, 24),
(15, 24),
(16, 24),
(17, 24),
(18, 24);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) NOT NULL,
  `orgId` int(11) NOT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `room_owner` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `room_desc` text,
  `room_image` text,
  `group_id` bigint(20) DEFAULT NULL,
  `building_number` varchar(150) DEFAULT NULL,
  `approval_group` int(20) DEFAULT NULL COMMENT 'From ''''roles'''' table role id resepective of orgId',
  `room_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(22) NOT NULL,
  `s_title` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_service_users_count`
--

CREATE TABLE `schedule_service_users_count` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `scheduling_id` bigint(22) DEFAULT NULL,
  `team_id` bigint(22) DEFAULT NULL,
  `service_id` bigint(22) DEFAULT NULL,
  `user_count` int(10) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scheduling`
--

CREATE TABLE `scheduling` (
  `id` bigint(22) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `orgId` bigint(22) NOT NULL,
  `event_date` date DEFAULT NULL,
  `event_id` bigint(22) DEFAULT NULL,
  `is_manual_schedule` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Auto scheduling, 2=Manual Scheduling',
  `assign_ids` text,
  `notification_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=None,2=SMS,3=Email,4=Both',
  `team_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scheduling_user`
--

CREATE TABLE `scheduling_user` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) NOT NULL,
  `scheduling_id` bigint(22) NOT NULL,
  `team_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Decline',
  `token` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_payment_gateway_values`
--

CREATE TABLE `store_payment_gateway_values` (
  `payment_values_id` int(11) NOT NULL COMMENT 'Unique ID Primary Key',
  `orgId` bigint(20) DEFAULT NULL COMMENT 'Foreign key reference to organization',
  `payment_gateway_id` int(11) NOT NULL,
  `payment_gateway_parameter_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key reference to payment_gateway_parameters',
  `payment_gateway_parameter_value` varchar(200) NOT NULL COMMENT 'Values of the parameter to be passed to payment gateway',
  `active` varchar(1) NOT NULL DEFAULT '1' COMMENT 'Record status',
  `preferred_payment_gateway` int(1) NOT NULL DEFAULT '0' COMMENT '0 -> inactive, 1 - active',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store_payment_gateway_values`
--

INSERT INTO `store_payment_gateway_values` (`payment_values_id`, `orgId`, `payment_gateway_id`, `payment_gateway_parameter_id`, `payment_gateway_parameter_value`, `active`, `preferred_payment_gateway`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 1, 'sk_test_QG6L3rVCIgHevuQ3JyJJKM9Z00mN1powxx', '1', 0, NULL, '2019-12-27 06:06:20', NULL, '2019-12-27 07:17:55', NULL, NULL),
(2, 1, 1, 2, 'sk_test_QG6L3rVCIgHevuQ3JyJJKM9Z00mN1powxx', '1', 0, NULL, '2019-12-27 06:06:20', NULL, '2019-12-27 07:58:13', NULL, NULL),
(3, 1, 2, 3, 'santhoshk@gt.com', '1', 0, NULL, '2019-12-27 06:36:10', NULL, '2019-12-27 07:57:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(22) NOT NULL,
  `tagGroup_id` bigint(22) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `order` tinyint(10) NOT NULL DEFAULT '0' COMMENT 'Listing order number for sorting',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag_groups`
--

CREATE TABLE `tag_groups` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Public, 0=Restricted',
  `isMultiple_select` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Multiple select, 0=single',
  `order` tinyint(10) NOT NULL DEFAULT '0' COMMENT 'Listing order number for sorting',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team_has_position`
--

CREATE TABLE `team_has_position` (
  `id` bigint(22) NOT NULL,
  `team_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `householdName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_prefix` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `given_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` text COLLATE utf8mb4_unicode_ci,
  `user_full_name` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referal_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_suffix` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` text COLLATE utf8mb4_unicode_ci,
  `dob` date DEFAULT NULL,
  `doa` date DEFAULT NULL,
  `school_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `life_stage` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'Adult' COMMENT 'Adult,Child',
  `mobile_no` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone_no` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_profile` text COLLATE utf8mb4_unicode_ci,
  `marital_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `medical_note` text COLLATE utf8mb4_unicode_ci,
  `congregration_status` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deletedBy` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `full_name`, `user_full_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'St Paul Admin\'s household', '0000000001', NULL, NULL, 'St Paul Admin', NULL, NULL, NULL, 'St Paul Admin', NULL, 'stpaul@gmail.com', NULL, NULL, '$2y$10$j81Uj33DWeh6SoXbuqFdFeA2wr72bVXjV1qsGDjc11e8ZnQbyQtP6', NULL, 'St Paht4', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-18 01:54:50', '2019-12-18 01:54:50', NULL, NULL),
(2, 1, 'test\'s household', '0000000002', '40', NULL, 'test', 'test', NULL, NULL, 'test test', NULL, 'test@test.com', NULL, NULL, '$2y$10$j81Uj33DWeh6SoXbuqFdFeA2wr72bVXjV1qsGDjc11e8ZnQbyQtP6', NULL, 'testjzah', '45', NULL, '1970-01-01', '1970-01-01', '34', 60, 'Adult', NULL, NULL, 'Male', NULL, '51', '////////////', NULL, NULL, '2019-12-19 03:52:40', '2019-12-19 03:52:40', NULL, NULL),
(3, 1, 'satheesh\'s household', '0000000003', '40', NULL, 'satheesh', 'krish', NULL, NULL, 'satheesh krish', NULL, 'satheesh@test.com', NULL, NULL, '$2y$10$elQrENXatmdwMaEHPBzGdOgkM1P7rE6n5uQxjU6i0jljEheVLoMqK', NULL, 'sathsdwa', '45', NULL, '1970-01-01', '1970-01-01', '34', 60, 'Adult', NULL, NULL, 'Male', NULL, '51', '////////////', NULL, NULL, '2019-12-19 05:57:52', '2019-12-19 05:57:52', NULL, NULL),
(4, 2, 'ssss\'s household', '0000000004', NULL, NULL, 'ssss', NULL, NULL, NULL, 'ssss', NULL, 'ssss@gmail.com', NULL, NULL, '$2y$10$mhlOKWfdZK6i7WuDPajUDe/0v6qsKvAJUULVRjvhL1i0QzxF0B1bG', NULL, 'sssstazw', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-23 06:46:05', '2019-12-23 06:46:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_position`
--

CREATE TABLE `user_has_position` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`appId`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`chId`);

--
-- Indexes for table `comm_details`
--
ALTER TABLE `comm_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comm_masters`
--
ALTER TABLE `comm_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comm_templates`
--
ALTER TABLE `comm_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventId`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giving`
--
ALTER TABLE `giving`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_enrolls`
--
ALTER TABLE `group_enrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_events`
--
ALTER TABLE `group_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_events_attendance`
--
ALTER TABLE `group_events_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_resources`
--
ALTER TABLE `group_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_tags`
--
ALTER TABLE `group_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_types`
--
ALTER TABLE `group_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `households`
--
ALTER TABLE `households`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `household_user`
--
ALTER TABLE `household_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insights`
--
ALTER TABLE `insights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_lookup_data`
--
ALTER TABLE `master_lookup_data`
  ADD PRIMARY KEY (`mldId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`orgId`);

--
-- Indexes for table `other_payment_methods`
--
ALTER TABLE `other_payment_methods`
  ADD PRIMARY KEY (`other_payment_method_id`),
  ADD KEY `orgId` (`orgId`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pastor_board`
--
ALTER TABLE `pastor_board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateway_parameters`
--
ALTER TABLE `payment_gateway_parameters`
  ADD PRIMARY KEY (`parameter_id`),
  ADD KEY `payment_gateways_payment_gateway_parameters_FK1` (`payment_gateway_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_service_users_count`
--
ALTER TABLE `schedule_service_users_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduling`
--
ALTER TABLE `scheduling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduling_user`
--
ALTER TABLE `scheduling_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_payment_gateway_values`
--
ALTER TABLE `store_payment_gateway_values`
  ADD PRIMARY KEY (`payment_values_id`),
  ADD KEY `orgId` (`orgId`) USING BTREE;

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_groups`
--
ALTER TABLE `tag_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_has_position`
--
ALTER TABLE `team_has_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_position`
--
ALTER TABLE `user_has_position`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `appId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `chId` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comm_details`
--
ALTER TABLE `comm_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comm_masters`
--
ALTER TABLE `comm_masters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comm_templates`
--
ALTER TABLE `comm_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_submissions`
--
ALTER TABLE `form_submissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `giving`
--
ALTER TABLE `giving`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_enrolls`
--
ALTER TABLE `group_enrolls`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_events`
--
ALTER TABLE `group_events`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_events_attendance`
--
ALTER TABLE `group_events_attendance`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_resources`
--
ALTER TABLE `group_resources`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_tags`
--
ALTER TABLE `group_tags`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_types`
--
ALTER TABLE `group_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `households`
--
ALTER TABLE `households`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `household_user`
--
ALTER TABLE `household_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insights`
--
ALTER TABLE `insights`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_lookup_data`
--
ALTER TABLE `master_lookup_data`
  MODIFY `mldId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `orgId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `other_payment_methods`
--
ALTER TABLE `other_payment_methods`
  MODIFY `other_payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pastor_board`
--
ALTER TABLE `pastor_board`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_gateway_parameters`
--
ALTER TABLE `payment_gateway_parameters`
  MODIFY `parameter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_service_users_count`
--
ALTER TABLE `schedule_service_users_count`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scheduling`
--
ALTER TABLE `scheduling`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scheduling_user`
--
ALTER TABLE `scheduling_user`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_payment_gateway_values`
--
ALTER TABLE `store_payment_gateway_values`
  MODIFY `payment_values_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_groups`
--
ALTER TABLE `tag_groups`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_has_position`
--
ALTER TABLE `team_has_position`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_has_position`
--
ALTER TABLE `user_has_position`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
