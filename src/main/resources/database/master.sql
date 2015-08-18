SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `basic_activity`;
CREATE TABLE `basic_activity` (
  `id` char(16) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  `activity_pic_url` char(128) DEFAULT NULL,
  `user_number` smallint(8) DEFAULT NULL,
  `linkman` varchar(16) DEFAULT NULL,
  `telephone` char(16) DEFAULT NULL,
  `favorite_count` smallint(8) DEFAULT NULL,
  `introduce` text,
  `real_count` smallint(8) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `province_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `basic_activity_guest`;
CREATE TABLE `basic_activity_guest` (
  `id` char(16) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `company_name` varchar(64) DEFAULT NULL,
  `position` varchar(32) DEFAULT NULL,
  `activity_id` char(16) DEFAULT NULL,
  `picture_url` char(128) DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `basic_keywords`;
CREATE TABLE `basic_keywords` (
  `id` char(16) NOT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `words` varchar(16) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `basic_requirement`;
CREATE TABLE `basic_requirement` (
  `id` char(16) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` char(16) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `memo` varchar(256) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `linkman` varchar(16) DEFAULT NULL,
  `telephone` char(16) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `favorite_count` smallint(8) DEFAULT NULL,
  `items_name` varchar(32) DEFAULT NULL,
  `items_url` char(128) DEFAULT NULL,
  `province_id` char(16) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `character_company`;
CREATE TABLE `character_company` (
  `id` char(16) NOT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `position` varchar(64) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  `introduce` text,
  `home_url` char(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `character_expert_industry`;
CREATE TABLE `character_expert_industry` (
  `id` char(16) NOT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `character_expert_major`;
CREATE TABLE `character_expert_major` (
  `id` char(16) NOT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `major` char(16) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `character_favorite_expert`;
CREATE TABLE `character_favorite_expert` (
  `id` char(16) NOT NULL,
  `user_id` char(16) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `character_link_address`;
CREATE TABLE `character_link_address` (
  `id` char(16) NOT NULL,
  `province_id` char(16) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `character_linkman`;
CREATE TABLE `character_linkman` (
  `id` char(16) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `info_sms`;
CREATE TABLE `info_sms` (
  `id` char(16) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `target` text,
  `the_date_time` datetime DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `user_id` char(16) DEFAULT NULL,
  `serial_number` varchar(16) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `info_sms_check_code`;
CREATE TABLE `info_sms_check_code` (
  `id` char(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `the_date_time` datetime DEFAULT NULL,
  `result_msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_expert_serve`;
CREATE TABLE `main_expert_serve` (
  `id` char(16) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `serve_type` char(16) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `work_time` tinyint(4) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  `major` char(16) DEFAULT NULL,
  `course_type` char(16) DEFAULT NULL,
  `develop_type` char(16) DEFAULT NULL,
  `list_page_index` smallint(8) DEFAULT NULL,
  `grade` tinyint(4) DEFAULT NULL,
  `discount` tinyint(4) DEFAULT NULL,
  `cheap` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serve_expert` (`expert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_expert_style_label`;
CREATE TABLE `main_expert_style_label` (
  `id` char(16) NOT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `style_label` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_payment`;
CREATE TABLE `main_payment` (
  `id` char(16) NOT NULL,
  `pay_type` tinyint(4) DEFAULT NULL,
  `income_user_id` char(16) DEFAULT NULL,
  `outlay_user_id` char(16) DEFAULT NULL,
  `payed` decimal(10,0) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `income_user` (`income_user_id`),
  KEY `outlay_user` (`outlay_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_schedule`;
CREATE TABLE `main_schedule` (
  `id` char(16) NOT NULL,
  `date` date DEFAULT NULL,
  `date_status` tinyint(4) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `purchase_order_id` char(16) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_expert` (`expert_id`),
  KEY `schedule_order` (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_served_consumer`;
CREATE TABLE `main_served_consumer` (
  `id` char(16) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `project_name` varchar(64) DEFAULT NULL,
  `introduce` text,
  `serve_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serve` (`serve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_stroke`;
CREATE TABLE `main_stroke` (
  `id` char(16) NOT NULL,
  `consumer_id` char(16) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `purchase_order_id` char(16) DEFAULT NULL,
  `date_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stroke_user` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `main_style_label`;
CREATE TABLE `main_style_label` (
  `id` char(16) NOT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `label` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `order_purchase_order`;
CREATE TABLE `order_purchase_order` (
  `id` char(16) NOT NULL,
  `serial` char(16) DEFAULT NULL,
  `order_type` char(16) DEFAULT NULL,
  `consumer_id` char(16) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `assistant_id` char(16) DEFAULT NULL,
  `process_status` tinyint(4) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `activity_id` char(16) DEFAULT NULL,
  `requirement_id` char(16) DEFAULT NULL,
  `work_days` tinyint(4) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `ptype` char(16) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  `major` char(16) DEFAULT NULL,
  `day_type` tinyint(4) DEFAULT NULL,
  `pay_type` tinyint(4) DEFAULT NULL,
  `expert_serve_id` char(16) DEFAULT NULL,
  `serve_datetime` datetime DEFAULT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `telephone` char(16) DEFAULT NULL,
  `link_address` varchar(64) DEFAULT NULL,
  `province_id` char(16) DEFAULT NULL,
  `memo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_expert` (`expert_id`),
  KEY `order_assistant` (`assistant_id`),
  KEY `order_user` (`consumer_id`),
  KEY `order_requirement` (`requirement_id`),
  KEY `order_activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `order_purchase_order_comment`;
CREATE TABLE `order_purchase_order_comment` (
  `id` char(16) NOT NULL,
  `comment_type` tinyint(4) DEFAULT NULL,
  `expert_id` char(16) DEFAULT NULL,
  `consumer_id` char(16) DEFAULT NULL,
  `assistant_id` char(16) DEFAULT NULL,
  `content` text,
  `grade` tinyint(4) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consumer` (`consumer_id`),
  KEY `expert` (`expert_id`),
  KEY `assistant` (`assistant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `order_purchase_order_payment`;
CREATE TABLE `order_purchase_order_payment` (
  `id` char(16) NOT NULL,
  `purchase_order_id` char(16) DEFAULT NULL,
  `payed` decimal(10,0) DEFAULT NULL,
  `gateway` tinyint(4) DEFAULT NULL,
  `user_id` char(16) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `account` char(32) DEFAULT NULL,
  `pay_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order` (`purchase_order_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `order_purchase_order_temp`;
CREATE TABLE `order_purchase_order_temp` (
  `id` char(16) NOT NULL,
  `expert_serve_id` char(16) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `pay_type` tinyint(4) DEFAULT NULL,
  `day_type` tinyint(4) DEFAULT NULL,
  `purchase_order_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_address_city`;
CREATE TABLE `organization_address_city` (
  `id` int(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `province_id` int(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_address_district`;
CREATE TABLE `organization_address_district` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_address_province`;
CREATE TABLE `organization_address_province` (
  `id` int(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_assistant`;
CREATE TABLE `organization_assistant` (
  `id` char(16) NOT NULL,
  `order_number` smallint(8) DEFAULT NULL,
  `praise` smallint(8) DEFAULT NULL,
  `consumer_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zjh_user` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_expert`;
CREATE TABLE `organization_expert` (
  `id` char(16) NOT NULL,
  `consumer_id` char(16) DEFAULT NULL,
  `home_page_index` smallint(8) DEFAULT NULL,
  `favorite_count` smallint(8) DEFAULT NULL,
  `min_price` decimal(10,0) DEFAULT NULL,
  `max_price` decimal(10,0) DEFAULT NULL,
  `chief` varchar(16) DEFAULT NULL,
  `is_chief` tinyint(4) DEFAULT NULL,
  `assistant_id` char(16) DEFAULT NULL,
  `linkman` varchar(16) DEFAULT NULL,
  `linkman_phone` char(16) DEFAULT NULL,
  `preposition` varchar(32) DEFAULT NULL,
  `grade` tinyint(4) DEFAULT NULL,
  `freedom` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_manager`;
CREATE TABLE `organization_manager` (
  `id` char(16) NOT NULL,
  `introduce` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `organization_user`;
CREATE TABLE `organization_user` (
  `id` char(16) NOT NULL,
  `username` char(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `utype` tinyint(4) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `picture_url` char(128) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `email` char(32) DEFAULT NULL,
  `thestatus` tinyint(4) DEFAULT NULL,
  `memo` varchar(256) DEFAULT NULL,
  `is_enabled` tinyint(4) DEFAULT NULL,
  `is_account_expired` tinyint(4) DEFAULT NULL,
  `is_account_locked` tinyint(4) DEFAULT NULL,
  `is_credentials_expired` tinyint(4) DEFAULT NULL,
  `role_type` tinyint(4) DEFAULT NULL,
  `company_name` varchar(32) DEFAULT NULL,
  `company_address` varchar(64) DEFAULT NULL,
  `company_memo` varchar(128) DEFAULT NULL,
  `id_no` char(16) DEFAULT NULL,
  `work_time` tinyint(4) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `introduce` text,
  `order_number` smallint(8) DEFAULT NULL,
  `praise` smallint(8) DEFAULT NULL,
  `visit_count` smallint(8) DEFAULT NULL,
  `order_value` smallint(8) DEFAULT NULL,
  `industry` char(16) DEFAULT NULL,
  `identity_pic_url` char(128) DEFAULT NULL,
  `identity_pic_url2` char(128) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `province_id` char(16) DEFAULT NULL,
  `check_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE `order_purchase_order_payment`
	ADD COLUMN `serial` char(32) NULL AFTER `pay_type`;

ALTER TABLE `order_purchase_order_payment`
	ADD COLUMN `pay_status` int(4) NULL AFTER `serial`;

CREATE TABLE `main_expert_serve_content` (
	`id` char(16) NOT NULL,
	`expert_serve_id` char(16) NULL,
	`content` text NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

ALTER TABLE `basic_activity`
	ADD COLUMN `visit_count` int(6) NULL AFTER `province_id`;

CREATE TABLE `basic_activity_discuss` (
	`id` char(16) NOT NULL,
	`content` varchar(256) NULL,
	`create_datetime` datetime NULL,
	`consumer_id` char(16) NULL,
	`activity_id` char(16) NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

ALTER TABLE `basic_activity_guest`
	ADD COLUMN `status` tinyint(4) NULL AFTER `introduce`;

ALTER TABLE `basic_activity`
	ADD COLUMN `activity_date2` datetime NULL AFTER `visit_count`;

ALTER TABLE `basic_activity_guest`
	DROP COLUMN `status`;

CREATE TABLE `basic_requirement_discuss` (
	`id` char(16) NOT NULL,
	`content` varchar(256) NULL,
	`create_datetime` datetime NULL,
	`consumer_id` char(16) NULL,
	`requirement_id` char(16) NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `basic_expert_activity` (
	`id` char(16) NOT NULL,
	`expert_id` char(16) NULL,
	`activity_id` char(16) NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

ALTER TABLE `main_expert_serve_content`
	ADD COLUMN `expert_id` char(16) NULL AFTER `content`;

ALTER TABLE `main_expert_serve_content`
	ADD COLUMN `anchor` char(32) NULL AFTER `expert_id`;

ALTER TABLE `main_expert_serve`
	ADD COLUMN `anchor` char(32) NULL AFTER `expert_serve_content_id`;

ALTER TABLE `main_expert_serve`
	DROP COLUMN `anchor`,
	ADD COLUMN `served_consumer` varchar(256) NULL AFTER `expert_serve_content_id`;

ALTER TABLE `main_expert_serve_content`
	DROP COLUMN `anchor`;


ALTER TABLE `basic_requirement`
	ADD COLUMN `major` char(16) NULL AFTER `introduce`,
	ADD COLUMN `course_type` char(16) NULL AFTER `major`,
	ADD COLUMN `develop_type` char(16) NULL AFTER `course_type`;

CREATE TABLE `basic_activity_expert` (
	`id` char(16) NOT NULL,
	`expert_id` char(16) NULL,
	`activity_id` char(16) NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

ALTER TABLE `basic_activity`
	CHANGE COLUMN `expert_id` `user_id` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `real_count`;

CREATE TABLE `basic_activity_order` (
	`id` char(16) NOT NULL,
	`activity_id` char(16) NULL,
	`order_id` char(16) NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

