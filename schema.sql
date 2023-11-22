

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm_event` (
  `EVENT_ID` int NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alarm_logging`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm_logging` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `REFERANCE_ID` varchar(250) DEFAULT NULL,
  `TRX_DATE` timestamp NULL DEFAULT NULL,
  `TRX_DETAILS` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alarm_schema`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm_schema` (
  `SCHEMA_ID` int NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`SCHEMA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alarm_schema_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm_schema_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int DEFAULT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EVENT_ID` (`EVENT_ID`),
  UNIQUE KEY `SCHEMA_ID` (`SCHEMA_ID`),
  CONSTRAINT `alarm_schema_event_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `alarm_event` (`EVENT_ID`),
  CONSTRAINT `alarm_schema_event_ibfk_2` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `alarm_schema` (`SCHEMA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_event` (
  `EVENT_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_event_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_event_variable` (
  `ID` int NOT NULL,
  `VARIABLE_ID` int NOT NULL,
  `EVENT_ID` int NOT NULL,
  `VARIABLE_ORDER` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EN_EVENT_VARIABLE__VAR` (`VARIABLE_ID`),
  KEY `FK_EN_EVENT_VARIABLE__EVENT` (`EVENT_ID`),
  CONSTRAINT `FK_EN_EVENT_VARIABLE__EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `en_event` (`event_id`),
  CONSTRAINT `FK_EN_EVENT_VARIABLE__VAR` FOREIGN KEY (`VARIABLE_ID`) REFERENCES `en_variable` (`variable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_in_notification_queue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_in_notification_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_CODE` varchar(20) NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `PREFERRED_LANGUAGE` int NOT NULL,
  `STATE_ID` int DEFAULT '0',
  `MSISDN` varchar(50) DEFAULT NULL,
  `DEVICE_TOKEN` varchar(400) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PARAMS` varchar(200) NOT NULL,
  `RECEIVER_NAME` varchar(100) DEFAULT NULL,
  `CREATION_DATE` date NOT NULL,
  `DESCRIPTION` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_media_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_media_type` (
  `MEDIA_TYPE_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MEDIA_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_notification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_notification` (
  `ID` int NOT NULL,
  `NOTIFICATION_NAME` varchar(50) NOT NULL,
  `NOTIFICATION_CODE` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `EVENT_ID` int NOT NULL,
  `PRIORITY_ID` int NOT NULL,
  `STATUS` int NOT NULL,
  `IS_DELETED` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EN_NOTI__EVENT` (`EVENT_ID`),
  KEY `FK_EN_NOTI__PRIORITY` (`PRIORITY_ID`),
  CONSTRAINT `FK_EN_NOTI__EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `en_event` (`event_id`),
  CONSTRAINT `FK_EN_NOTI__PRIORITY` FOREIGN KEY (`PRIORITY_ID`) REFERENCES `en_priority` (`priority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_notification_media_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_notification_media_type` (
  `ID` int NOT NULL,
  `MEDIA_TYPE_ID` int NOT NULL,
  `NOTIFICATION_ID` int NOT NULL,
  `ENGLISH_CONTENT` blob NOT NULL,
  `ARABIC_CONTENT` blob NOT NULL,
  `SUBJECT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EN_NOT_MED_TYPE__MED_TYPE` (`MEDIA_TYPE_ID`),
  KEY `FK_EN_NOT_MED_TYPE__NOTI` (`NOTIFICATION_ID`),
  CONSTRAINT `FK_EN_NOT_MED_TYPE__MED_TYPE` FOREIGN KEY (`MEDIA_TYPE_ID`) REFERENCES `en_media_type` (`media_type_id`),
  CONSTRAINT `FK_EN_NOT_MED_TYPE__NOTI` FOREIGN KEY (`NOTIFICATION_ID`) REFERENCES `en_notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_notification_trx`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_notification_trx` (
  `ID` int NOT NULL,
  `IN_NOTIFICATION_QUEUE_ID` int NOT NULL,
  `EVENT_ID` int NOT NULL,
  `NOTIFICATION_CODE` varchar(20) NOT NULL,
  `NOTIFICATION_NAME` varchar(50) NOT NULL,
  `MEDIA_TYPE_ID` int NOT NULL,
  `OUT_QUEUE_REF_ID` int DEFAULT NULL,
  `DESTINATION_ADDRESS` varchar(400) DEFAULT NULL,
  `RECEIVER_NAME` varchar(100) DEFAULT NULL,
  `SENT_DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EN_NOTI_TRX__EVENT` (`EVENT_ID`),
  KEY `FK_EN_NOTI_TRX__MEDIA_TYPE` (`MEDIA_TYPE_ID`),
  KEY `FK_EN_NOTI_TRX__IN_NOTI_QUEUE` (`IN_NOTIFICATION_QUEUE_ID`),
  CONSTRAINT `FK_EN_NOTI_TRX__EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `en_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EN_NOTI_TRX__IN_NOTI_QUEUE` FOREIGN KEY (`IN_NOTIFICATION_QUEUE_ID`) REFERENCES `en_in_notification_queue` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EN_NOTI_TRX__MEDIA_TYPE` FOREIGN KEY (`MEDIA_TYPE_ID`) REFERENCES `en_media_type` (`media_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_priority`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_priority` (
  `PRIORITY_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PRIORITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `en_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_variable` (
  `VARIABLE_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VARIABLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint NOT NULL,
  PRIMARY KEY (`next_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `out_email_queue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `out_email_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(100) DEFAULT NULL,
  `CONTENT` blob,
  `SENDER` varchar(100) DEFAULT NULL,
  `CREATION_DATE` date DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `SENT_DATE` date DEFAULT NULL,
  `DELIVERY_TIME` date DEFAULT NULL,
  `EXPIRY_TIME` date DEFAULT NULL,
  `SENT_TRIALS` int DEFAULT NULL,
  `DESTINATION_EMAIL` varchar(100) DEFAULT NULL,
  `SENT` int DEFAULT NULL,
  `DELIVERED` int DEFAULT NULL,
  `FAILED` int DEFAULT NULL,
  `CANCELED` int DEFAULT NULL,
  `PRIORITY_ID` int DEFAULT NULL,
  `CENTER_ID` int DEFAULT NULL,
  `CONNECTION_DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGENT_NAME` varchar(400) NOT NULL,
  `CODE` varchar(400) NOT NULL,
  `STATUS_FLAG` tinyint(1) NOT NULL,
  `HIRE_DATE` datetime NOT NULL,
  `POSITION_ID` int DEFAULT '1',
  `AGENT_LEVEL_ID` int NOT NULL,
  `AGENT_TYPE_ID` int NOT NULL,
  `PHONE_NUMBER` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `MANAGED_ACCOUNT_TYPE_ID` int DEFAULT NULL,
  `LAST_SYNC_DATE` datetime DEFAULT NULL,
  `ACCOUNT_ID` int DEFAULT NULL,
  `REFLECTION_TYPE_ID` int NOT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  `ALLOWANCES` double DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_AGENT_NAME` (`AGENT_NAME`,`Email`,`PHONE_NUMBER`),
  KEY `FK_AGT_AGT_ID_idx` (`PARENT_ID`),
  KEY `FK_AGT_AGT_LEV_ALI` (`AGENT_LEVEL_ID`),
  KEY `FK_AGT_POS_PI` (`POSITION_ID`),
  KEY `FK__AGENT_REFLECTION_TYPE` (`REFLECTION_TYPE_ID`),
  KEY `FK__AGT_AGT_TYP` (`AGENT_TYPE_ID`),
  KEY `FK__AGT_MNG_ACC_TYP` (`MANAGED_ACCOUNT_TYPE_ID`),
  CONSTRAINT `FK__AGENT_REFLECTION_TYPE` FOREIGN KEY (`REFLECTION_TYPE_ID`) REFERENCES `rm_reflection_type` (`reflection_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__AGT_AGT_TYP` FOREIGN KEY (`AGENT_TYPE_ID`) REFERENCES `rm_agent_type` (`agent_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__AGT_MNG_ACC_TYP` FOREIGN KEY (`MANAGED_ACCOUNT_TYPE_ID`) REFERENCES `rm_managed_account_type` (`managed_account_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_AGT_ID` FOREIGN KEY (`PARENT_ID`) REFERENCES `rm_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_AGT_LEV_ALI` FOREIGN KEY (`AGENT_LEVEL_ID`) REFERENCES `rm_agent_level` (`agent_level_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_POS_PI` FOREIGN KEY (`POSITION_ID`) REFERENCES `rm_position` (`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_commission_matrix`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_commission_matrix` (
  `ID` int NOT NULL,
  `COMMISSION_MATRIX_ID` int DEFAULT NULL,
  `AGENT_ID` int DEFAULT NULL,
  `COMMISSION_BASE` int DEFAULT NULL,
  `REWARDING_TYPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__AGENT_COMM_MTX__AGENT` (`AGENT_ID`),
  KEY `FK__AGENT_COMM_MTX__COMM_MTX` (`COMMISSION_MATRIX_ID`),
  KEY `FK__AGENT_COMM_MTX__REWD_TYPE` (`REWARDING_TYPE_ID`),
  CONSTRAINT `FK__AGENT_COMM_MTX__AGENT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__AGENT_COMM_MTX__COMM_MTX` FOREIGN KEY (`COMMISSION_MATRIX_ID`) REFERENCES `rm_commission_matrix` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__AGENT_COMM_MTX__REWD_TYPE` FOREIGN KEY (`REWARDING_TYPE_ID`) REFERENCES `rm_rewarding_type` (`rewarding_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_group` (
  `ID` int NOT NULL,
  `AGENT_ID` int DEFAULT NULL,
  `GROUP_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AGENT_GROUP__GROUPS` (`GROUP_ID`),
  KEY `FK__AGENT_GROUP__AGENT` (`AGENT_ID`),
  CONSTRAINT `FK__AGENT_GROUP__AGENT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGENT_GROUP__GROUPS` FOREIGN KEY (`GROUP_ID`) REFERENCES `rm_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_level`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_level` (
  `AGENT_LEVEL_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`AGENT_LEVEL_ID`),
  UNIQUE KEY `UK_AGENT_LEVEL_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_plan_eligible_commission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_plan_eligible_commission` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGENT_ID` int DEFAULT NULL,
  `PLAN_ID` int DEFAULT NULL,
  `TOTAL_COMMISSION` double DEFAULT NULL,
  `TRX_DATE` date DEFAULT NULL,
  `PERIOD_START_DATE` date DEFAULT NULL,
  `PERIOD_END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `agent_plan_eli_comm_fk` (`AGENT_ID`),
  KEY `plan_eli_comm_fk` (`PLAN_ID`),
  CONSTRAINT `agent_plan_eli_comm_fk` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`),
  CONSTRAINT `plan_eli_comm_fk` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1860 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_plan_scope`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_plan_scope` (
  `ID` int NOT NULL,
  `AGENT_ID` int DEFAULT NULL,
  `PLAN_SCOPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__AGT_PROF_SCOP__AGT` (`AGENT_ID`),
  KEY `FK__AGT_PROF_SCOP__PROF_SCOP` (`PLAN_SCOPE_ID`),
  CONSTRAINT `FK__AGT_PROF_SCOP__AGT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__AGT_PROF_SCOP__PROF_SCOP` FOREIGN KEY (`PLAN_SCOPE_ID`) REFERENCES `rm_plan_scope` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_schema`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_schema` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGENT_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SCHEMA_ID` int NOT NULL,
  `STATUS_FLAG` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `FK_AGENT_SCH_STR__AGENT_SCH_STR` (`PARENT_ID`),
  KEY `FK_AGT_SCH_STR__SCH_STR_idx` (`SCHEMA_ID`),
  KEY `FK_AGT_DOM_AGT_AI` (`AGENT_ID`),
  CONSTRAINT `fk_agent_schema` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_target`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_target` (
  `ID` int NOT NULL,
  `MEASURE_AMOUNT` int NOT NULL,
  `TARGET_SPLIT` int DEFAULT NULL,
  `MEASURE_ID` int NOT NULL,
  `AGENT_ID` int NOT NULL,
  `DURATION_TYPE_ID` int NOT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AGT_TRG_DOM_TRG_DTI` (`TARGET_MEASURE_ID`),
  KEY `FK_AGT_TRG_TRG_MEASURE` (`MEASURE_ID`),
  KEY `FK_AG_TRG_AGT_AI` (`AGENT_ID`),
  KEY `FK_AG_TRG_DUR_TP_DTI` (`DURATION_TYPE_ID`),
  CONSTRAINT `FK_AG_TRG_AGT_AI` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AG_TRG_DUR_TP_DTI` FOREIGN KEY (`DURATION_TYPE_ID`) REFERENCES `rm_duration_type` (`duration_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_TRG_DOM_TRG_DTI` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_TRG_TRG_MEASURE` FOREIGN KEY (`MEASURE_ID`) REFERENCES `rm_measure` (`MEASURE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_target_aggregator`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_target_aggregator` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STATUS_CODE` int DEFAULT NULL,
  `AGENT_ID` int DEFAULT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `ELIGIBLE_COMMISSION_STATE` int DEFAULT NULL,
  `AMOUNT` varchar(1000) NOT NULL,
  `INSERTION_DATE` datetime NOT NULL,
  `LAST_UPDATE_DATE` datetime NOT NULL,
  `PLAN_ID` int DEFAULT NULL,
  `CHURN_AMOUNT` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REFERENCE_68` (`STATUS_CODE`),
  KEY `FK_REFERENCE_69` (`AGENT_ID`),
  KEY `FK_REFERENCE_70` (`TARGET_MEASURE_ID`),
  KEY `FK_REFERENCE_71` (`ELIGIBLE_COMMISSION_STATE`),
  KEY `fk_agent_agg_plan_id` (`PLAN_ID`),
  CONSTRAINT `fk_agent_agg_plan_id` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`),
  CONSTRAINT `FK_REFERENCE_68` FOREIGN KEY (`STATUS_CODE`) REFERENCES `rm_status_code` (`status_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_69` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_70` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_71` FOREIGN KEY (`ELIGIBLE_COMMISSION_STATE`) REFERENCES `rm_reflection_state` (`reflection_state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_target_rule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_target_rule` (
  `ID` int NOT NULL,
  `AGENT_TARGET_ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_AGENT_TARGET_RULE` (`AGENT_TARGET_ID`,`RULE_ID`),
  KEY `FK_AGT_TRG_RUL_RUL_RI` (`RULE_ID`),
  CONSTRAINT `FK_AGT_TRG_RUL_AGT_TRG_ATI` FOREIGN KEY (`AGENT_TARGET_ID`) REFERENCES `rm_agent_target` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_TRG_RUL_RUL_RI` FOREIGN KEY (`RULE_ID`) REFERENCES `rm_rule` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_team`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_team` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGENT_ID` int NOT NULL,
  `TEAM_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__TEAM_AGENT_AGENT` (`AGENT_ID`),
  KEY `FK__TEAM_AGENT_SELF` (`PARENT_ID`),
  KEY `FK__TEAM_AGENT_TEAM` (`TEAM_ID`),
  CONSTRAINT `FK__TEAM_AGENT_AGENT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TEAM_AGENT_SELF` FOREIGN KEY (`PARENT_ID`) REFERENCES `rm_agent_team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TEAM_AGENT_TEAM` FOREIGN KEY (`TEAM_ID`) REFERENCES `rm_team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_tracking`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_tracking` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IN_EVENT_ID` int DEFAULT NULL,
  `SCHEMA_ID` int NOT NULL,
  `AGENT_ID` int NOT NULL,
  `PLAN_ID` int NOT NULL,
  `PLAN_SCOP_ID` int DEFAULT NULL,
  `TARGET_ID` int DEFAULT NULL,
  `SETTING_ID` int DEFAULT NULL,
  `TRX_DATE` datetime NOT NULL,
  `TRX_TYPE` varchar(100) DEFAULT NULL,
  `EVENT_CODE` varchar(100) NOT NULL,
  `ORIGINAL_ACHIEVEMENT` varchar(1000) DEFAULT NULL,
  `NEW_ACHIEVEMENT` varchar(1000) DEFAULT NULL,
  `COMMISSION` varchar(1000) DEFAULT NULL,
  `RULE_APPLIED` text,
  `APPLIED_ACTION` varchar(1000) DEFAULT NULL,
  `COMMENTS` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3942 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_agent_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_agent_type` (
  `AGENT_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `PARENT_AGENT_TYPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`AGENT_TYPE_ID`),
  UNIQUE KEY `AK_UK_AGENT_TYPE_NAME` (`NAME`),
  KEY `FK_PARENT_AGENT_TYPE_ID__AGENT_TYPE_idx` (`PARENT_AGENT_TYPE_ID`),
  CONSTRAINT `FK_PARENT_AGENT_TYPE_ID__AGENT_TYPE` FOREIGN KEY (`PARENT_AGENT_TYPE_ID`) REFERENCES `rm_agent_type` (`AGENT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_aggregated_extension_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_aggregated_extension_detail` (
  `ID` int NOT NULL,
  `AGENT_AGGRE_ID` int DEFAULT NULL,
  `PRODUCT_NUMBER` varchar(1000) DEFAULT NULL,
  `INSERTION_DATE` datetime DEFAULT NULL,
  `INVOICE_DUE_DATE` datetime DEFAULT NULL,
  `INVOICE_AMOUNT` double DEFAULT NULL,
  `INVOICE_DUE_AMOUNT` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AGENT_AGGRE_ID` (`AGENT_AGGRE_ID`),
  CONSTRAINT `rm_aggregated_extension_detail_ibfk_1` FOREIGN KEY (`AGENT_AGGRE_ID`) REFERENCES `rm_agent_target_aggregator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_aggregation_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_aggregation_type` (
  `AGGREGATION_TYPE_ID` int NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AGGREGATION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_aggregator_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_aggregator_metadata` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STATUS_CODE` int DEFAULT NULL,
  `AGENT_ID` int DEFAULT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `ELIGIBLE_COMMISSION_STATE` int DEFAULT NULL,
  `AMOUNT` varchar(50) NOT NULL,
  `INSERTION_DATE` datetime NOT NULL,
  `LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `PLAN_ID` int DEFAULT NULL,
  `METADATA_VALUE_IDS` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AGG_METADATA__STATUS_CD` (`STATUS_CODE`),
  KEY `FK_AGG_METADATA__REF_STATE` (`ELIGIBLE_COMMISSION_STATE`),
  KEY `FK_AGG_METADATA__TAR_MES` (`TARGET_MEASURE_ID`),
  KEY `FK_AGG_METADATA__AGENT` (`AGENT_ID`),
  KEY `FK_AGG_METADATA__PLAN` (`PLAN_ID`),
  CONSTRAINT `FK_AGG_METADATA__AGENT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`),
  CONSTRAINT `FK_AGG_METADATA__PLAN` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`),
  CONSTRAINT `FK_AGG_METADATA__REF_STATE` FOREIGN KEY (`ELIGIBLE_COMMISSION_STATE`) REFERENCES `rm_reflection_state` (`REFLECTION_STATE_ID`),
  CONSTRAINT `FK_AGG_METADATA__STATUS_CD` FOREIGN KEY (`STATUS_CODE`) REFERENCES `rm_status_code` (`STATUS_CODE_ID`),
  CONSTRAINT `FK_AGG_METADATA__TAR_MES` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_aggregator_metadata_extension_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_aggregator_metadata_extension_detail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGGREGATOR_METADA_ID` int DEFAULT NULL,
  `AGGREGATION_TYPE_ID` int DEFAULT NULL,
  `VALUE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AGG_META_EX_DET__AGG_META` (`AGGREGATOR_METADA_ID`),
  KEY `FK_AGG_META_EX_DET__AGG_TYPE` (`AGGREGATION_TYPE_ID`),
  CONSTRAINT `FK_AGG_META_EX_DET__AGG_META` FOREIGN KEY (`AGGREGATOR_METADA_ID`) REFERENCES `rm_aggregator_metadata` (`ID`),
  CONSTRAINT `FK_AGG_META_EX_DET__AGG_TYPE` FOREIGN KEY (`AGGREGATION_TYPE_ID`) REFERENCES `rm_aggregation_type` (`AGGREGATION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_area`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_area` (
  `ID` int NOT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_calculation_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_calculation_type` (
  `CALCULATION_TYPE_ID` int NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CALCULATION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_category` (
  `ID` int NOT NULL,
  `NAME` varchar(1000) DEFAULT NULL,
  `DESCREPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_claw_back_trx`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_claw_back_trx` (
  `ID` int NOT NULL,
  `PRODUCT_NUMBER` varchar(1000) NOT NULL,
  `STATUS` tinyint(1) NOT NULL,
  `DATE` datetime NOT NULL,
  `AMOUNT` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_clawback_rule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_clawback_rule` (
  `ID` int NOT NULL,
  `COMMISSION_SETTING_ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  `STATUS_FLAG` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLBK_RUL_COMM_SETT` (`RULE_ID`,`COMMISSION_SETTING_ID`),
  KEY `FK_COMM_SETT__CLBK_RUL` (`COMMISSION_SETTING_ID`),
  CONSTRAINT `FK_CLBK_RUL_RUL_RI` FOREIGN KEY (`RULE_ID`) REFERENCES `rm_rule` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COMM_SETT__CLBK_RUL` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_eligible_targets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_eligible_targets` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TARGET_ID` int DEFAULT NULL,
  `COMMISSION_SETTING_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE_TARGET_COMMISSION_SETTING` (`TARGET_ID`,`COMMISSION_SETTING_ID`),
  KEY `FK__COMM_ELIG_TAR_COMM_SETT` (`COMMISSION_SETTING_ID`),
  CONSTRAINT `FK__COMM_ELIG_TAR__TAR` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__COMM_ELIG_TAR_COMM_SETT` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=49700 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_matrix`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_matrix` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FROM_ACHIEVEMENT_PERCENTAGE` int DEFAULT NULL,
  `TO_ACHIEVEMENT_PERCENTAGE` int DEFAULT NULL,
  `COMMISSION_DUE` varchar(500) NOT NULL,
  `COMMISSION_SETTING_ID` int NOT NULL,
  `CALCULATION_TYPE_ID` int DEFAULT NULL,
  `ACCUMULATED` tinyint(1) DEFAULT NULL,
  `NO_UPPER_LIMIT` tinyint(1) DEFAULT NULL,
  `HAS_ACCELERATOR` tinyint(1) DEFAULT NULL,
  `HAS_DECELERATOR` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMM_MTX__COMM_SETTING` (`COMMISSION_SETTING_ID`),
  KEY `FK__CALC_TYPE__COMM_MTX` (`CALCULATION_TYPE_ID`),
  CONSTRAINT `FK__CALC_TYPE__COMM_MTX` FOREIGN KEY (`CALCULATION_TYPE_ID`) REFERENCES `rm_calculation_type` (`calculation_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COMM_MTX__COMM_SETTING` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_matrix_modifier`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_matrix_modifier` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COMMISSION_MATRIX_ID` int NOT NULL,
  `COMMISSION_MODIFIER_TYPE_ID` int NOT NULL,
  `MODIFIER_PERC_FROM_VALUE` double DEFAULT NULL,
  `MODIFIER_PERC_TO_VALUE` double DEFAULT NULL,
  `MODIFIER_THRESHOLD` double DEFAULT NULL,
  `MODIFIER_PERCENTAGE` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `COMMISSION_MATRIX_ID_idx` (`COMMISSION_MATRIX_ID`),
  KEY `COMMISSION_MODIFIER_TYPE_ID_idx` (`COMMISSION_MODIFIER_TYPE_ID`),
  CONSTRAINT `COMMISSION_MATRIX_ID` FOREIGN KEY (`COMMISSION_MATRIX_ID`) REFERENCES `rm_commission_matrix` (`ID`),
  CONSTRAINT `COMMISSION_MODIFIER_TYPE_ID` FOREIGN KEY (`COMMISSION_MODIFIER_TYPE_ID`) REFERENCES `rm_commission_modifier_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_modifier_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_modifier_type` (
  `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_plan_clawback_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_plan_clawback_settings` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COMMISSION_PLAN_ID` int DEFAULT NULL,
  `CLAWBACK_STATUS` tinyint(1) DEFAULT NULL,
  `CLAWBACK_PERCENTAGE` int DEFAULT NULL,
  `REFUND_THRESHOLD` double DEFAULT NULL,
  `PERIOD` int DEFAULT NULL,
  `START_CLAWBACK_DATE` datetime DEFAULT NULL,
  `END_CLAWBACK_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLAWBACK_SETTINGS__COMMISSION_PLAN_idx` (`COMMISSION_PLAN_ID`),
  CONSTRAINT `FK_CLAWBACK_SETTINGS__COMMISSION_PLAN` FOREIGN KEY (`COMMISSION_PLAN_ID`) REFERENCES `rm_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_plan_formula`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_plan_formula` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int DEFAULT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `FORMULA` text,
  `COMMENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PLAN_ID` (`PLAN_ID`),
  CONSTRAINT `rm_commission_plan_formula_ibfk_1` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_plan_general_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_plan_general_settings` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COMMISSION_PLAN_ID` int DEFAULT NULL,
  `TARGET_DISTRIBUTED_PER_MEMBER` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `COMMISSION_PLAN_ID_UNIQUE` (`COMMISSION_PLAN_ID`),
  CONSTRAINT `fk_general_settings_commission_plan` FOREIGN KEY (`COMMISSION_PLAN_ID`) REFERENCES `rm_plan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_rule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_rule` (
  `ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  `COMMISSION_SETTING_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_UK_COMM_RULE` (`RULE_ID`,`COMMISSION_SETTING_ID`),
  KEY `FK_COM_RUL_COM_ST_CSI` (`COMMISSION_SETTING_ID`),
  CONSTRAINT `FK_COM_RUL_COM_ST_CSI` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COM_RUL_RUL_RI` FOREIGN KEY (`RULE_ID`) REFERENCES `rm_rule` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_setting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_setting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(400) DEFAULT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  `MEASURE_TYPE_ID` int DEFAULT NULL,
  `CALCULATION_TYPE_ID` int DEFAULT NULL,
  `CAP` double DEFAULT NULL,
  `COMMISSION_BASE` double DEFAULT NULL,
  `AGENT_TYPE_ID` int DEFAULT NULL,
  `STATUS` tinyint(1) NOT NULL,
  `DELETED_FLAG` tinyint DEFAULT '0',
  `CLAWBACK_STATUS` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_COMM_SETT_SCHEMA` (`NAME`,`SCHEMA_ID`),
  KEY `FK__COMM_SETTING_MEASURE_idx` (`MEASURE_TYPE_ID`),
  KEY `FK__COMM_SETT__CALC_TYPE` (`CALCULATION_TYPE_ID`),
  KEY `FK__COMM_SETT__SCHM` (`SCHEMA_ID`),
  KEY `AGENT_TYPE_ID` (`AGENT_TYPE_ID`),
  CONSTRAINT `FK__COMM_SETT__CALC_TYPE` FOREIGN KEY (`CALCULATION_TYPE_ID`) REFERENCES `rm_calculation_type` (`calculation_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__COMM_SETT__SCHM` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__COMM_SETTING_MEASURE` FOREIGN KEY (`MEASURE_TYPE_ID`) REFERENCES `rm_measure_type` (`measure_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rm_commission_setting_ibfk_1` FOREIGN KEY (`AGENT_TYPE_ID`) REFERENCES `rm_agent_type` (`AGENT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_setting_formula`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_setting_formula` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COMMISSION_SETTING_ID` int NOT NULL,
  `FORMULA` text,
  `NAME` varchar(200) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `rm_commission_setting_formula_ibfk_1` (`COMMISSION_SETTING_ID`),
  CONSTRAINT `rm_commission_setting_formula_ibfk_1` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_commission_trigger`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_commission_trigger` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int DEFAULT NULL,
  `NEXT_TRIGGER` datetime DEFAULT NULL,
  `PREVIOUS_TRIGGER` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMM_TRIG_TRIG_idx` (`PLAN_ID`),
  CONSTRAINT `FK_COMM_TRIG_TRIG` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_communication_logging`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_communication_logging` (
  `ID` int NOT NULL,
  `SOURCE_ID` int DEFAULT NULL,
  `REQUEST_TYPE_ID` int DEFAULT NULL,
  `TRX_ID` varchar(1000) NOT NULL,
  `TRX_DATE` datetime DEFAULT NULL,
  `REQUEST` mediumblob,
  `RESPONSE` mediumblob,
  PRIMARY KEY (`ID`),
  KEY `FK_REFERENCE_91` (`SOURCE_ID`),
  KEY `FK_REFERENCE_92` (`REQUEST_TYPE_ID`),
  CONSTRAINT `FK_REFERENCE_91` FOREIGN KEY (`SOURCE_ID`) REFERENCES `rm_communication_source` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_92` FOREIGN KEY (`REQUEST_TYPE_ID`) REFERENCES `rm_request_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_communication_source`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_communication_source` (
  `ID` int NOT NULL,
  `SOURCE_NAME` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_component`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_component` (
  `COMPONENT_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_composite_target_setting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_composite_target_setting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `DISTRIBUTION_TYPE_ID` int NOT NULL,
  `DURATION_TYPE_ID` int NOT NULL,
  `MEASURE_ID` int DEFAULT NULL,
  `STRATEGIC_TARGET` int DEFAULT NULL,
  `REMAINING_STRATEGIC_TARGET` int DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_SCHEMA__COM_TAR_SET_idx` (`SCHEMA_ID`),
  KEY `FK_DUR_TYPE__COM_TAR_SET_idx` (`DURATION_TYPE_ID`),
  KEY `FK_MEASURE__COM_TAR_SET_idx` (`MEASURE_ID`),
  KEY `FK_DIST_TYP__COM_TAR_SET_idx` (`DISTRIBUTION_TYPE_ID`),
  CONSTRAINT `FK_DIST_TYP__COM_TAR_SET` FOREIGN KEY (`DISTRIBUTION_TYPE_ID`) REFERENCES `rm_distribution_type` (`DISTRIBUTION_TYPE_ID`),
  CONSTRAINT `FK_DUR_TYPE__COM_TAR_SET` FOREIGN KEY (`DURATION_TYPE_ID`) REFERENCES `rm_duration_type` (`DURATION_TYPE_ID`),
  CONSTRAINT `FK_MEASURE__COM_TAR_SET` FOREIGN KEY (`MEASURE_ID`) REFERENCES `rm_measure` (`MEASURE_ID`),
  CONSTRAINT `FK_SCHEMA__COM_TAR_SET` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_currency`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_currency` (
  `CUARRENCY_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CODE` varchar(100) NOT NULL,
  PRIMARY KEY (`CUARRENCY_ID`),
  UNIQUE KEY `AK_UK_CURRECY_NAME` (`NAME`),
  UNIQUE KEY `AK_UK_CURRECY_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_dashboard_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_dashboard_type` (
  `DASHBOARD_TYPE_ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`DASHBOARD_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_dashboard_user_filteration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_dashboard_user_filteration` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DASHBOARD_TYPE_ID` int NOT NULL,
  `COMMISSION_PLAN_ID` int DEFAULT NULL,
  `TARGET_ID` int DEFAULT NULL,
  `TEAM_ID` int DEFAULT NULL,
  `MEMBER_ID` int DEFAULT NULL,
  `YEAR` varchar(45) DEFAULT NULL,
  `MONTH` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DASH_FILT__SCHEMA_idx` (`SCHEMA_ID`),
  KEY `FK_DASH_FILT__DASH_TYP_idx` (`DASHBOARD_TYPE_ID`),
  KEY `FK_DASH_FILT__COM_PLN_idx` (`COMMISSION_PLAN_ID`),
  KEY `FK_DASH_FILT__TRGT_idx` (`TARGET_ID`),
  CONSTRAINT `FK_DASH_FILT__COM_PLN` FOREIGN KEY (`COMMISSION_PLAN_ID`) REFERENCES `rm_plan` (`ID`),
  CONSTRAINT `FK_DASH_FILT__DASH_TYP` FOREIGN KEY (`DASHBOARD_TYPE_ID`) REFERENCES `rm_dashboard_type` (`DASHBOARD_TYPE_ID`),
  CONSTRAINT `FK_DASH_FILT__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`),
  CONSTRAINT `FK_DASH_FILT__TRGT` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_data_source_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_data_source_type` (
  `DATA_SOURCE_TYPE_ID` int NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DATA_SOURCE_TYPE_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_data_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_data_type` (
  `DATA_TYPE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`DATA_TYPE_ID`),
  UNIQUE KEY `AK_UK_DATA_TYPE_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_distribution_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_distribution_type` (
  `DISTRIBUTION_TYPE_ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`DISTRIBUTION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_duration_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_duration_detail` (
  `DURATION_DETAIL_ID` int NOT NULL,
  `DURATION_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `NAME_AR` varchar(400) NOT NULL,
  PRIMARY KEY (`DURATION_DETAIL_ID`),
  UNIQUE KEY `UK_DUR_DETAIL` (`NAME`),
  KEY `FK__DUR_DET_TYP` (`DURATION_TYPE_ID`),
  CONSTRAINT `FK__DUR_DET_TYP` FOREIGN KEY (`DURATION_TYPE_ID`) REFERENCES `rm_duration_type` (`duration_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_duration_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_duration_type` (
  `DURATION_TYPE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`DURATION_TYPE_ID`),
  UNIQUE KEY `UK_DURATION_TYPE_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_elig_commi_trx_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_elig_commi_trx_type` (
  `ID` int NOT NULL,
  `TRX_TYPE` varchar(1500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_eligible_commission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_eligible_commission` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGENT_ID` int NOT NULL,
  `COMMISSION_SETTING_ID` int DEFAULT NULL,
  `AMOUNT` double NOT NULL,
  `TRX_DATE` datetime NOT NULL,
  `MAKER_CHECKER_STATE_ID` int NOT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `IS_REFLECTED` tinyint(1) NOT NULL,
  `PRODUCT_NUMBER` varchar(1000) DEFAULT NULL,
  `CLAW_BACK_STATUS` tinyint(1) DEFAULT NULL,
  `TEAM_ID` int DEFAULT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  `STATUS_CODE` int DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(100) DEFAULT NULL,
  `PLAN_ELIGIBLE_COMMISSION_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ELG_COM_COM_ST_CSI` (`COMMISSION_SETTING_ID`),
  KEY `FK_MKCHK_STAT__ELIG_COMM` (`MAKER_CHECKER_STATE_ID`),
  KEY `FK_ELIGIBLE_COMM__AGENT` (`AGENT_ID`),
  KEY `FK_ELIGIBLE_COMM__TAR_MEASURE` (`TARGET_MEASURE_ID`),
  KEY `FK_ELIGIBLE_COMM_SCHEMA_idx` (`SCHEMA_ID`),
  KEY `FK_ELIGIBLE_COMM__TEAM` (`TEAM_ID`),
  KEY `status_code_fk` (`STATUS_CODE`),
  KEY `plan_eli_com_FK` (`PLAN_ELIGIBLE_COMMISSION_ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__AGENT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__TAR_MEASURE` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__TEAM` FOREIGN KEY (`TEAM_ID`) REFERENCES `rm_team` (`ID`),
  CONSTRAINT `plan_eli_com_FK` FOREIGN KEY (`PLAN_ELIGIBLE_COMMISSION_ID`) REFERENCES `rm_agent_plan_eligible_commission` (`ID`),
  CONSTRAINT `status_code_fk` FOREIGN KEY (`STATUS_CODE`) REFERENCES `rm_status_code` (`STATUS_CODE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_eligible_commission_logging`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_eligible_commission_logging` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TRX_TYPE_ID` int NOT NULL,
  `AGENT_ID` int NOT NULL,
  `REFERENCE_NUMBER` varchar(3000) NOT NULL,
  `TRX_DATE` datetime NOT NULL,
  `TRX_DETAIL` varchar(5000) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__ELG_COMM_LOGG_AGNT` (`AGENT_ID`),
  KEY `FK__ELG_COMM_LOGG_TRX` (`TRX_TYPE_ID`),
  CONSTRAINT `FK__ELG_COMM_LOGG_AGNT` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__ELG_COMM_LOGG_TRX` FOREIGN KEY (`TRX_TYPE_ID`) REFERENCES `rm_elig_commi_trx_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_eligible_commission_temp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_eligible_commission_temp` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AGENT_ID` int NOT NULL,
  `COMMISSION_SETTING_ID` int DEFAULT NULL,
  `AMOUNT` double NOT NULL,
  `TRX_DATE` datetime NOT NULL,
  `MAKER_CHECKER_STATE_ID` int NOT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `IS_REFLECTED` tinyint(1) NOT NULL,
  `PRODUCT_NUMBER` varchar(1000) DEFAULT NULL,
  `CLAW_BACK_STATUS` tinyint(1) DEFAULT NULL,
  `TEAM_ID` int DEFAULT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  `STATUS_CODE` int DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(100) DEFAULT NULL,
  `PLAN_ELIGIBLE_COMMISSION_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ELG_COM_COM_ST_CSI1` (`COMMISSION_SETTING_ID`),
  KEY `FK_MKCHK_STAT__ELIG_COMM1` (`MAKER_CHECKER_STATE_ID`),
  KEY `FK_ELIGIBLE_COMM__AGENT1` (`AGENT_ID`),
  KEY `FK_ELIGIBLE_COMM__TAR_MEASURE1` (`TARGET_MEASURE_ID`),
  KEY `FK_ELIGIBLE_COMM_SCHEMA_idx1` (`SCHEMA_ID`),
  KEY `FK_ELIGIBLE_COMM__TEAM1` (`TEAM_ID`),
  KEY `status_code_fk1` (`STATUS_CODE`),
  KEY `plan_eli_com_FK1` (`PLAN_ELIGIBLE_COMMISSION_ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__AGENT1` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__SCHEMA1` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__TAR_MEASURE1` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`),
  CONSTRAINT `FK_ELIGIBLE_COMM__TEAM1` FOREIGN KEY (`TEAM_ID`) REFERENCES `rm_team` (`ID`),
  CONSTRAINT `plan_eli_com_FK1` FOREIGN KEY (`PLAN_ELIGIBLE_COMMISSION_ID`) REFERENCES `rm_agent_plan_eligible_commission` (`ID`),
  CONSTRAINT `status_code_fk1` FOREIGN KEY (`STATUS_CODE`) REFERENCES `rm_status_code` (`STATUS_CODE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4768 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_event` (
  `EVENT_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `CODE` varchar(45) DEFAULT NULL,
  `TYPE_ID` int DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`EVENT_ID`),
  UNIQUE KEY `UK_EVENT_NAME` (`NAME`,`CODE`),
  KEY `FK_EVENT__EVENT_TYPE_ID_idx` (`TYPE_ID`),
  CONSTRAINT `FK_EVENT__EVENT_TYPE_ID` FOREIGN KEY (`TYPE_ID`) REFERENCES `rm_event_type` (`event_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_event_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_event_type` (
  `EVENT_TYPE_ID` int NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EVENT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_formula_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_formula_type` (
  `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_formula_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_formula_variable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VALRIABLE_ID` int NOT NULL,
  `FORMULA_ID` int NOT NULL,
  `PREFIX_NAME` varchar(100) DEFAULT NULL,
  `VALUE` varchar(100) DEFAULT NULL,
  `TYPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FRM_FRM_VRB__VRB_idx` (`VALRIABLE_ID`),
  KEY `FK_FRM_VRB__TYPE_idx` (`TYPE_ID`) /*!80000 INVISIBLE */,
  KEY `FK_FRM_VRB__FRM_idx` (`FORMULA_ID`),
  KEY `FRM_PRFX_NAME_UNI` (`PREFIX_NAME`,`FORMULA_ID`,`TYPE_ID`),
  CONSTRAINT `FRM_FRM_VRB__TYPE` FOREIGN KEY (`TYPE_ID`) REFERENCES `rm_variable_type` (`VARIABLE_TYPE_ID`),
  CONSTRAINT `FRM_FRM_VRB__VRB` FOREIGN KEY (`VALRIABLE_ID`) REFERENCES `rm_variable` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_group_commission_matrix`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_group_commission_matrix` (
  `ID` int NOT NULL,
  `COMMISSION_MATRIX_ID` int DEFAULT NULL,
  `GROUP_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__GROUP_COMM_MTX__COMM_MTX` (`COMMISSION_MATRIX_ID`),
  KEY `FK__GROUP_COMM_MTX__GROUP` (`GROUP_ID`),
  CONSTRAINT `FK__GROUP_COMM_MTX__COMM_MTX` FOREIGN KEY (`COMMISSION_MATRIX_ID`) REFERENCES `rm_commission_matrix` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__GROUP_COMM_MTX__GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `rm_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_group_plan_scope`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_group_plan_scope` (
  `ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `PLAN_SCOPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__GROUP_PROF_SCOP__PROF_GROUP` (`GROUP_ID`),
  KEY `FK__GROUP_PROF_SCOP__PROF_SCOP` (`PLAN_SCOPE_ID`),
  CONSTRAINT `FK__GROUP_PROF_SCOP__PROF_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `rm_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__GROUP_PROF_SCOP__PROF_SCOP` FOREIGN KEY (`PLAN_SCOPE_ID`) REFERENCES `rm_plan_scope` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_groups` (
  `ID` int NOT NULL,
  `NAME` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_in_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_in_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(100) NOT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `EVENT_DATE` datetime NOT NULL,
  `AGENT_ID` int NOT NULL,
  `EVENT_ID` int NOT NULL,
  `AGGREGATOR_STATE_ID` int NOT NULL,
  `PRODUCT_NUMBER` varchar(100) DEFAULT NULL,
  `IS_DISPUTE` tinyint(1) NOT NULL,
  `IS_ADJUSTMENT` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IN_EVT_AG_A` (`AGENT_ID`),
  KEY `FK_REFERENCE_87` (`EVENT_ID`),
  KEY `FK_RM_IN_EVENT_IBFK_2` (`AGGREGATOR_STATE_ID`),
  CONSTRAINT `FK_IN_EVT_AG_A` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_87` FOREIGN KEY (`EVENT_ID`) REFERENCES `rm_event` (`EVENT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_IN_EVENT_IBFK_2` FOREIGN KEY (`AGGREGATOR_STATE_ID`) REFERENCES `rm_reflection_state` (`reflection_state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_in_event_extension_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_in_event_extension_detail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EXTENSION_KEY` varchar(50) NOT NULL,
  `EXTENSION_VALUE` varchar(50) NOT NULL,
  `IN_EVENT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IN_EVT_EXT_DET__IN_EVT` (`IN_EVENT_ID`),
  CONSTRAINT `FK_IN_EVT_EXT_DET__IN_EVT` FOREIGN KEY (`IN_EVENT_ID`) REFERENCES `rm_in_event` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_in_event_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_in_event_log` (
  `ID` int NOT NULL,
  `JSON_REQUEST` varchar(1000) NOT NULL,
  `JSON_RESPONSE` varchar(1000) NOT NULL,
  `IS_SUCCESS` tinyint(1) DEFAULT NULL,
  `IN_EVENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_in_event_on_hold`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_in_event_on_hold` (
  `ID` int NOT NULL,
  `AGENT_ID` int NOT NULL,
  `EVENT_ID` int NOT NULL,
  `TARGET_MEASURE_ID` int NOT NULL,
  `AGGREGATOR_STATE_ID` int NOT NULL,
  `VALUE` varchar(100) NOT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `EVENT_DATE` datetime NOT NULL,
  `PRODUCT_NUMBER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RM_IN_EVENT_ON_HOLD_IBFK_1` (`AGENT_ID`),
  KEY `FK_RM_IN_EVENT_ON_HOLD_IBFK_2` (`EVENT_ID`),
  KEY `FK_RM_IN_EVENT_ON_HOLD_IBFK_3` (`TARGET_MEASURE_ID`),
  KEY `FK_RM_IN_EVENT_ON_HOLD_IBFK_4` (`AGGREGATOR_STATE_ID`),
  CONSTRAINT `FK_RM_IN_EVENT_ON_HOLD_IBFK_1` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_IN_EVENT_ON_HOLD_IBFK_2` FOREIGN KEY (`EVENT_ID`) REFERENCES `rm_event` (`EVENT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_IN_EVENT_ON_HOLD_IBFK_3` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_IN_EVENT_ON_HOLD_IBFK_4` FOREIGN KEY (`AGGREGATOR_STATE_ID`) REFERENCES `rm_reflection_state` (`reflection_state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_in_event_plan`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_in_event_plan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IN_EVENT_ID` int NOT NULL,
  `PLAN_ID` int NOT NULL,
  `PLAN_SCOP_ID` int NOT NULL,
  `TRX_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IN_EVT_PLAN__IN_EVT` (`IN_EVENT_ID`),
  KEY `FK_IN_EVT_PLAN__PLAN` (`PLAN_ID`),
  KEY `FK_IN_EVT_PLAN__PLAN_SCOP` (`PLAN_SCOP_ID`),
  CONSTRAINT `FK_IN_EVT_PLAN__IN_EVT` FOREIGN KEY (`IN_EVENT_ID`) REFERENCES `rm_in_event` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_IN_EVT_PLAN__PLAN` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_IN_EVT_PLAN__PLAN_SCOP` FOREIGN KEY (`PLAN_SCOP_ID`) REFERENCES `rm_plan_scope` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_language`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_language` (
  `LANGUAGE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`LANGUAGE_ID`),
  UNIQUE KEY `UK_LANGUAGE_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_maker_checker_state`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_maker_checker_state` (
  `MAKER_CHECKER_STATE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`MAKER_CHECKER_STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_managed_account_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_managed_account_type` (
  `MANAGED_ACCOUNT_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`MANAGED_ACCOUNT_TYPE_ID`),
  UNIQUE KEY `AK_UK_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_measure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_measure` (
  `MEASURE_ID` int NOT NULL AUTO_INCREMENT,
  `MEASURE_TYPE_ID` int DEFAULT NULL,
  `MEASURE_CALCULATION_TYPE_ID` int DEFAULT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `STATUS` tinyint NOT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MEASURE_ID`),
  KEY `FK_MEASURE_MEASURE_TYPE` (`MEASURE_TYPE_ID`),
  KEY `FK_MEASURE_MEASURE_CALC_TYPE_idx` (`MEASURE_CALCULATION_TYPE_ID`),
  CONSTRAINT `FK_MEASURE_MEASURE_CALC_TYPE` FOREIGN KEY (`MEASURE_CALCULATION_TYPE_ID`) REFERENCES `rm_measure_calculation_type` (`measure_calculation_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_MEASURE_MEASURE_TYPE` FOREIGN KEY (`MEASURE_TYPE_ID`) REFERENCES `rm_measure_type` (`measure_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_measure_calculation_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_measure_calculation_type` (
  `MEASURE_CALCULATION_TYPE_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`MEASURE_CALCULATION_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_measure_rule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_measure_rule` (
  `ID` int NOT NULL,
  `MEASURE_ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__TRG_MEASURE_RUL` (`RULE_ID`),
  KEY `FK__TRG_MEASURE_RUL_TRG_MEASURE` (`MEASURE_ID`),
  CONSTRAINT `FK__TRG_MEASURE_RUL` FOREIGN KEY (`RULE_ID`) REFERENCES `rm_rule` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TRG_MEASURE_RUL_TRG_MEASURE` FOREIGN KEY (`MEASURE_ID`) REFERENCES `rm_measure` (`MEASURE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_measure_setting_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_measure_setting_type` (
  `ID` int NOT NULL,
  `NAME` varchar(1000) NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_measure_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_measure_type` (
  `MEASURE_TYPE_ID` int NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEASURE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_measure_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_measure_variable` (
  `MEASURE_VARIABLE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `MEASURE_ID` int DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`MEASURE_VARIABLE_ID`),
  UNIQUE KEY `UK_COMM_VAR_NAME` (`NAME`),
  KEY `FK_MEASURE_VAR__MEASUE` (`MEASURE_ID`),
  CONSTRAINT `FK_MEASURE_VAR__MEASUE` FOREIGN KEY (`MEASURE_ID`) REFERENCES `rm_measure` (`MEASURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_metadata` (
  `METADATA_ID` int NOT NULL,
  `CRITERIA_NAME` varchar(200) NOT NULL,
  `COLUMN_NAME` varchar(200) NOT NULL,
  PRIMARY KEY (`METADATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_metadata_value`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_metadata_value` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `METADATA_ID` int NOT NULL,
  `METADATA_VALUE` varchar(200) NOT NULL,
  `SCHEMA_METADATA_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_METDATA_VAL__SCHEMA_METDATA` (`SCHEMA_METADATA_ID`),
  KEY `FK_METDATA_VAL__METDATA` (`METADATA_ID`),
  CONSTRAINT `FK_METDATA_VAL__METDATA` FOREIGN KEY (`METADATA_ID`) REFERENCES `rm_metadata` (`METADATA_ID`),
  CONSTRAINT `FK_METDATA_VAL__SCHEMA_METDATA` FOREIGN KEY (`SCHEMA_METADATA_ID`) REFERENCES `rm_schema_metadata` (`SCHEMA_METADATA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_payout_cycle`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_payout_cycle` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int DEFAULT NULL,
  `NAME` varchar(400) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `SCHEDULE_TYPE_ID` int DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT '0',
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_PAYOUT_CYC__SCHEMA` (`SCHEMA_ID`),
  KEY `FK_PYT_CYC__SCH_TYP` (`SCHEDULE_TYPE_ID`),
  CONSTRAINT `FK_PYT_CYC__SCH_TYP` FOREIGN KEY (`SCHEDULE_TYPE_ID`) REFERENCES `rm_schedule_type` (`schedule_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PYT_CYC__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_payout_cycle_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_payout_cycle_schedule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PAYOUT_CYCLE_ID` int NOT NULL,
  `SCHEDULE_TYPE_ID` int NOT NULL,
  `VALUE` varchar(400) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PYT_CYC_SCH_PYT_CYC` (`PAYOUT_CYCLE_ID`),
  KEY `FK_PYT_CYC_SCH_SCH_TYP` (`SCHEDULE_TYPE_ID`),
  CONSTRAINT `FK_PYT_CYC_SCH_PYT_CYC` FOREIGN KEY (`PAYOUT_CYCLE_ID`) REFERENCES `rm_payout_cycle` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PYT_CYC_SCH_SCH_TYP` FOREIGN KEY (`SCHEDULE_TYPE_ID`) REFERENCES `rm_schedule_type` (`schedule_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_payout_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_payout_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_pending_claw_back_trx`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_pending_claw_back_trx` (
  `ID` int NOT NULL,
  `ELIGIBLE_COMMISSION_ID` int NOT NULL,
  `DUE_DATE` datetime NOT NULL,
  `AMOUNT` decimal(10,0) NOT NULL,
  `STATUS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_plan`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_plan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int DEFAULT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `ACTIVATION_DATE` datetime DEFAULT NULL,
  `STATE_ID` int DEFAULT NULL,
  `PAYOUT_TYPE_ID` int DEFAULT NULL,
  `PAYOUT_CYCLE_ID` int DEFAULT NULL,
  `PERIOD_TYPE_ID` int DEFAULT NULL,
  `RECURRENT` tinyint(1) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT '1',
  `IS_ACTIVATED` tinyint(1) DEFAULT '0',
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `PLAN_TYPE_ID` int DEFAULT '1',
  `IS_RUNNING_FLAG` tinyint(1) DEFAULT '0',
  `IS_ONLY_ACHIEVEMENT` tinyint(1) DEFAULT '0',
  `COMPOSITE_TARGET_SETTING_ID` int DEFAULT NULL,
  `RE_RUN_STATE_ID` int DEFAULT NULL,
  `CUT_OFF_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PLAN__PAYOUT_TYPE_idx` (`PAYOUT_TYPE_ID`),
  KEY `FK_PLAN__DUREATION_TYPE_ID_idx` (`PERIOD_TYPE_ID`),
  KEY `FK_PLAN__SCHEMA_idx` (`SCHEMA_ID`),
  KEY `FK_PLAN__STATE_idx` (`STATE_ID`),
  KEY `FK_PLAN__PAYOUT_CYCLE` (`PAYOUT_CYCLE_ID`),
  KEY `FK_PLAN__COMPOSITE_SETTING_ID_idx` (`COMPOSITE_TARGET_SETTING_ID`),
  KEY `RE_RUN_STATE_ID` (`RE_RUN_STATE_ID`),
  CONSTRAINT `FK_PLAN__COMPOSITE_SETTING_ID` FOREIGN KEY (`COMPOSITE_TARGET_SETTING_ID`) REFERENCES `rm_composite_target_setting` (`ID`),
  CONSTRAINT `FK_PLAN__DUREATION_TYPE_ID` FOREIGN KEY (`PERIOD_TYPE_ID`) REFERENCES `rm_duration_type` (`duration_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PLAN__PAYOUT_CYCLE` FOREIGN KEY (`PAYOUT_CYCLE_ID`) REFERENCES `rm_payout_cycle` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PLAN__PAYOUT_TYPE` FOREIGN KEY (`PAYOUT_TYPE_ID`) REFERENCES `rm_payout_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PLAN__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PLAN__STATE` FOREIGN KEY (`STATE_ID`) REFERENCES `rm_state` (`STATE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rm_plan_ibfk_1` FOREIGN KEY (`RE_RUN_STATE_ID`) REFERENCES `rm_rerun_state` (`RE_RUN_STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_plan_scope`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_plan_scope` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int DEFAULT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `COMMISSION_SETTING_ID` int DEFAULT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  `CREATION_DATE` date DEFAULT NULL,
  `LAST_UPDATE_DATE` date DEFAULT NULL,
  `STATUS_FLAG` tinyint(1) DEFAULT NULL,
  `TARGET_WEIGHT` double DEFAULT NULL,
  `COMPOSITE_TARGET_CAP` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__PROF_SCOPE__COMM_SETT` (`COMMISSION_SETTING_ID`),
  KEY `FK__PROF_SCOPE__PROF` (`PLAN_ID`),
  KEY `FK__PROF_SCOPE__TGT_MEASURE` (`TARGET_MEASURE_ID`),
  KEY `FK_PROF_SCOPE__SCHEM_STRU_idx` (`SCHEMA_ID`),
  CONSTRAINT `FK__PROF_SCOPE__COMM_SETT` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__PROF_SCOPE__PROF` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__PROF_SCOPE__TGT_MEASURE` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PROF_SCOPE__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_plan_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_plan_type` (
  `ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_position`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_position` (
  `POSITION_ID` int NOT NULL,
  `POSITION_NAME` varchar(400) NOT NULL,
  `AGENT_TYPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`POSITION_ID`),
  KEY `tk_agent_type_id__agent_type_idx` (`AGENT_TYPE_ID`),
  CONSTRAINT `tk_agent_type_id__agent_type` FOREIGN KEY (`AGENT_TYPE_ID`) REFERENCES `rm_agent_type` (`AGENT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `CODE` varchar(1000) DEFAULT NULL,
  `CATEGORY_ID` int DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `FEES` double DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK__PRODUCT__CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK__PRODUCT__CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `rm_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_reflected_commission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_reflected_commission` (
  `ID` int NOT NULL,
  `COMMISSION_SETTING_ID` int NOT NULL,
  `AMOUNT` double NOT NULL,
  `REFLECTION_STATE_ID` int NOT NULL,
  `STATUS_CODE_ID` int NOT NULL,
  `AGENT_ID` int NOT NULL,
  `TARGET_MEASURE_ID` int NOT NULL,
  `REFLECTION_FAILURE_REASON` varchar(1000) DEFAULT NULL,
  `TRX_DATE` datetime NOT NULL,
  `PLAN_ID` int DEFAULT NULL,
  `TEAM_ID` int DEFAULT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PRE_COM_COM_ST_CSI` (`COMMISSION_SETTING_ID`),
  KEY `FK_REFERENCE_84` (`AGENT_ID`),
  KEY `FK_REFLECTED_COMMISSION_PLAN_ID` (`PLAN_ID`),
  KEY `FK_REF_STAT__REF_COMM` (`REFLECTION_STATE_ID`),
  KEY `FK_STUS_CODE__REF_COMM` (`STATUS_CODE_ID`),
  KEY `FK__RM_REFLE_REFERENCE_RM_DOMAI` (`TARGET_MEASURE_ID`),
  KEY `FK_REFLECTED__TEAM_idx` (`TEAM_ID`),
  KEY `FK_REF__SCHEMA_idx` (`SCHEMA_ID`),
  CONSTRAINT `FK__RM_REFLE_REFERENCE_RM_DOMAI` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRE_COM_COM_ST_CSI` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REF__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`),
  CONSTRAINT `FK_REF_STAT__REF_COMM` FOREIGN KEY (`REFLECTION_STATE_ID`) REFERENCES `rm_reflection_state` (`reflection_state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_84` FOREIGN KEY (`AGENT_ID`) REFERENCES `rm_agent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFLECTED__TEAM` FOREIGN KEY (`TEAM_ID`) REFERENCES `rm_team` (`id`),
  CONSTRAINT `FK_REFLECTED_COMMISSION_PLAN_ID` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_STUS_CODE__REF_COMM` FOREIGN KEY (`STATUS_CODE_ID`) REFERENCES `rm_status_code` (`status_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_reflection_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_reflection_schedule` (
  `ID` int NOT NULL,
  `VALUE` varchar(100) NOT NULL,
  `COMMISSION_SETTING_ID` int NOT NULL,
  `SCHEDULE_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REF_SEC_COM_SET_CSI` (`COMMISSION_SETTING_ID`),
  KEY `FK_SCH_TPE__REFLE_SCH` (`SCHEDULE_TYPE_ID`),
  CONSTRAINT `FK_REF_SEC_COM_SET_CSI` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SCH_TPE__REFLE_SCH` FOREIGN KEY (`SCHEDULE_TYPE_ID`) REFERENCES `rm_schedule_type` (`schedule_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_reflection_state`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_reflection_state` (
  `REFLECTION_STATE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`REFLECTION_STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_reflection_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_reflection_type` (
  `REFLECTION_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `PLUG_IN_EXECUTOR` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`REFLECTION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_request_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_request_type` (
  `ID` int NOT NULL,
  `REQUEST_TYPE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_rerun_state`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_rerun_state` (
  `RE_RUN_STATE_ID` int NOT NULL,
  `STATE` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`RE_RUN_STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_rewarding_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_rewarding_type` (
  `REWARDING_TYPE_ID` int NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REWARDING_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_rule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_rule` (
  `RULE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) NOT NULL,
  `RULE_TYPE_ID` int NOT NULL,
  `PLUG_IN_EXECUTOR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RULE_ID`),
  KEY `FK__RUL_RUL_TP_RTI` (`RULE_TYPE_ID`),
  CONSTRAINT `FK__RUL_RUL_TP_RTI` FOREIGN KEY (`RULE_TYPE_ID`) REFERENCES `rm_rule_type` (`rule_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_rule_parameter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_rule_parameter` (
  `RULE_PARAMETER_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `RULE_ID` int DEFAULT NULL,
  `DATA_TYPE_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`RULE_PARAMETER_ID`),
  UNIQUE KEY `AK_UK_NAME` (`NAME`),
  KEY `FK__RULE_PARAM__DATA_TYP` (`DATA_TYPE_ID`),
  KEY `FK_RUL_PARAM__COMP` (`COMPONENT_ID`),
  KEY `FK_RUL_PARM_RUL_RI` (`RULE_ID`),
  CONSTRAINT `FK__RULE_PARAM__DATA_TYP` FOREIGN KEY (`DATA_TYPE_ID`) REFERENCES `rm_data_type` (`data_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RUL_PARAM__COMP` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `rm_component` (`component_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RUL_PARM_RUL_RI` FOREIGN KEY (`RULE_ID`) REFERENCES `rm_rule` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_rule_parameter_value`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_rule_parameter_value` (
  `ID` int NOT NULL,
  `VALUE` varchar(1000) NOT NULL,
  `RULE_PARAMETER_ID` int NOT NULL,
  `TARGET_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__RUL_PARM_VAL_RUL_PARM_RPI` (`RULE_PARAMETER_ID`),
  KEY `FK__TRG_RUL_PARAM` (`TARGET_ID`),
  CONSTRAINT `FK__RUL_PARM_VAL_RUL_PARM_RPI` FOREIGN KEY (`RULE_PARAMETER_ID`) REFERENCES `rm_rule_parameter` (`rule_parameter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TRG_RUL_PARAM` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_rule_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_rule_type` (
  `RULE_TYPE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`RULE_TYPE_ID`),
  UNIQUE KEY `AK_UK_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schedule_setting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schedule_setting` (
  `SCHEDULE_SETTING_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SCHEDULE_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`SCHEDULE_SETTING_ID`),
  KEY `FK__SCD_SET_SCD_TP_STI` (`SCHEDULE_TYPE_ID`),
  CONSTRAINT `FK__SCD_SET_SCD_TP_STI` FOREIGN KEY (`SCHEDULE_TYPE_ID`) REFERENCES `rm_schedule_type` (`schedule_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schedule_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schedule_type` (
  `SCHEDULE_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`SCHEDULE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(400) NOT NULL,
  `CODE` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SCHEMA_TYPE_ID` int NOT NULL DEFAULT '1',
  `DELETED_FLAG` tinyint(1) NOT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `DESCRIPTION` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SCHEMA_NAME` (`NAME`),
  KEY `FK_SCHM_TYP__SCHM` (`SCHEMA_TYPE_ID`),
  CONSTRAINT `FK_SCHM_TYP__SCHM` FOREIGN KEY (`SCHEMA_TYPE_ID`) REFERENCES `rm_schema_type` (`SCHEMA_TYPE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_commission_setting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_commission_setting` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int DEFAULT NULL,
  `COMMISSION_SETTING_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SCH_COMM_STNG_SCH` (`SCHEMA_ID`),
  KEY `FK_SCH_COMM_STNG_COMM_STNG` (`COMMISSION_SETTING_ID`),
  CONSTRAINT `FK_SCH_COMM_STNG_COMM_STNG` FOREIGN KEY (`COMMISSION_SETTING_ID`) REFERENCES `rm_commission_setting` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SCH_COMM_STNG_SCH` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_measure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_measure` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int DEFAULT NULL,
  `MEASURE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__SCHM_STRU_MEASURE__SCHEM_STRU_idx` (`SCHEMA_ID`),
  KEY `FK__SCHM_STRU_MEASURE__MEASURE` (`MEASURE_ID`),
  CONSTRAINT `FK__SCHM_STRU_MEASURE__MEASURE` FOREIGN KEY (`MEASURE_ID`) REFERENCES `rm_measure` (`measure_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__SCHM_STRU_MEASURE__SCHEM_STRU` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_metadata` (
  `SCHEMA_METADATA_ID` int NOT NULL,
  `SCHEMA_ID` int NOT NULL,
  `METADATA_ID` int NOT NULL,
  `STATUS` int NOT NULL,
  PRIMARY KEY (`SCHEMA_METADATA_ID`),
  KEY `FK_SCH_METDATA__SCHEMA` (`SCHEMA_ID`),
  KEY `FK_SCH_METDATA__METDATA` (`METADATA_ID`),
  CONSTRAINT `FK_SCH_METDATA__METDATA` FOREIGN KEY (`METADATA_ID`) REFERENCES `rm_metadata` (`METADATA_ID`),
  CONSTRAINT `FK_SCH_METDATA__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SCH_PROD_SCH` (`SCHEMA_ID`),
  KEY `FK_SCH_PROD_PROD` (`PRODUCT_ID`),
  CONSTRAINT `FK_SCH_PROD_PROD` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `rm_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SCH_PROD_SCH` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_product_measure_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_product_measure_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_ID` int DEFAULT NULL,
  `EVENT_ID` int NOT NULL,
  `SCHEMA_PRODUCT_ID` int DEFAULT NULL,
  `SCHEMA_MEASURE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SCH_PR_ME_EV__EVENT` (`EVENT_ID`),
  KEY `FK_SCH_PR_ME_EV__SCH_MEASURE_idx` (`SCHEMA_MEASURE_ID`),
  KEY `FK_SCH_PR_ME_EV__SCH_PRODUCT_idx` (`SCHEMA_PRODUCT_ID`),
  KEY `FK_SCH_PR_ME_EV__SCH` (`SCHEMA_ID`),
  CONSTRAINT `FK_SCH_PR_ME_EV__EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `rm_event` (`EVENT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SCH_PR_ME_EV__SCH` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SCH_PR_ME_EV__SCH_MEASURE` FOREIGN KEY (`SCHEMA_MEASURE_ID`) REFERENCES `rm_schema_measure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SCH_PR_ME_EV__SCH_PRODUCT` FOREIGN KEY (`SCHEMA_PRODUCT_ID`) REFERENCES `rm_schema_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_structure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_structure` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `SCHEMA_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SC_NAME__SCHEMA_ID` (`NAME`,`SCHEMA_ID`),
  KEY `FK__SCHM_STRU__SCHEM_STRU` (`PARENT_ID`),
  KEY `FK__SCHM__SCHM_STR` (`SCHEMA_ID`),
  CONSTRAINT `FK__SCHM__SCHM_STR` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__SCHM_STRU__SCHEM_STRU` FOREIGN KEY (`PARENT_ID`) REFERENCES `rm_schema_structure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_structure_area`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_structure_area` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_STRUCTURE_ID` int DEFAULT NULL,
  `AREA_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__SCHM_STRU_AREA__AREA` (`AREA_ID`),
  KEY `FK__SCHM_STRU_TAR__SCHM_STRU` (`SCHEMA_STRUCTURE_ID`),
  CONSTRAINT `FK__SCHM_STRU_AREA__AREA` FOREIGN KEY (`AREA_ID`) REFERENCES `rm_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__SCHM_STRU_TAR__SCHM_STRU` FOREIGN KEY (`SCHEMA_STRUCTURE_ID`) REFERENCES `rm_schema_structure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_structure_product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_structure_product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCHEMA_STRUCTURE_ID` int DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__SCHM_STRU_PROD__PROD` (`PRODUCT_ID`),
  KEY `FK__SCHM_STRU_PRUD__SCHM_STRU` (`SCHEMA_STRUCTURE_ID`),
  CONSTRAINT `FK__SCHM_STRU_PROD__PROD` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `rm_product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__SCHM_STRU_PRUD__SCHM_STRU` FOREIGN KEY (`SCHEMA_STRUCTURE_ID`) REFERENCES `rm_schema_structure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_schema_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_schema_type` (
  `SCHEMA_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`SCHEMA_TYPE_ID`),
  UNIQUE KEY `AK_UK_SCHEMA_TYPE_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_state`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_state` (
  `STATE_ID` int NOT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `TYPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`STATE_ID`),
  KEY `FK_STATE_TYPE_ID_idx` (`TYPE_ID`),
  CONSTRAINT `FK_STATE__TYPE_ID` FOREIGN KEY (`TYPE_ID`) REFERENCES `rm_state_type` (`STATE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_state_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_state_type` (
  `STATE_TYPE_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`STATE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_status_code`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_status_code` (
  `STATUS_CODE_ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`STATUS_CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_system_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_system_variable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `SCHEMA_ID` int NOT NULL,
  `VARIABLE_TYPE_ID` int NOT NULL,
  `PLAN_ID` int NOT NULL,
  `STATUS` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__SYSTEM_VAR__VAR_TYPE` (`VARIABLE_TYPE_ID`),
  CONSTRAINT `FK__SYSTEM_VAR__VAR_TYPE` FOREIGN KEY (`VARIABLE_TYPE_ID`) REFERENCES `rm_variable_type` (`VARIABLE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(400) NOT NULL,
  `MANAGER_PERCENTAGE` int DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `SCHEMA_STRUCTURE_ID` int DEFAULT NULL,
  `DURATION_TYPE_ID` int DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) NOT NULL DEFAULT '0',
  `STATUS_FLAG` tinyint(1) DEFAULT '1',
  `THRESHOLD` int DEFAULT NULL,
  `TARGET_BASE` decimal(10,3) DEFAULT NULL,
  `COMPOSITE_TARGET_SETTING_ID` int DEFAULT NULL,
  `TARGET_TYPE_ID` int DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_TAR_SCHM_STR` (`NAME`,`SCHEMA_STRUCTURE_ID`),
  KEY `FK__SCHM_STRU_TAR__SCHM_STRU_idx` (`SCHEMA_STRUCTURE_ID`),
  KEY `FK_TAR__SCHM_STRU_idx` (`SCHEMA_STRUCTURE_ID`),
  KEY `FK_TAR__DURATION_TYPE_ID_idx` (`DURATION_TYPE_ID`),
  KEY `FK_TAR__TAR_TYP_idx` (`TARGET_TYPE_ID`),
  KEY `FK_TAR__COM_TAR_SET_idx` (`COMPOSITE_TARGET_SETTING_ID`),
  CONSTRAINT `FK_TAR__COM_TAR_SET` FOREIGN KEY (`COMPOSITE_TARGET_SETTING_ID`) REFERENCES `rm_composite_target_setting` (`ID`),
  CONSTRAINT `FK_TAR__DURATION_TYPE_ID` FOREIGN KEY (`DURATION_TYPE_ID`) REFERENCES `rm_duration_type` (`duration_type_id`),
  CONSTRAINT `FK_TAR__SCHM_STRU` FOREIGN KEY (`SCHEMA_STRUCTURE_ID`) REFERENCES `rm_schema_structure` (`ID`),
  CONSTRAINT `FK_TAR__TAR_TYPE` FOREIGN KEY (`TARGET_TYPE_ID`) REFERENCES `rm_target_type` (`TARGET_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_detail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DURATION_DETAIL_ID` int NOT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `VALUE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AGT_TRG_DET_AGT_TRG_ATID` (`TARGET_MEASURE_ID`),
  KEY `FK_AGT_TRG_DET_DUR_DET_DDI` (`DURATION_DETAIL_ID`),
  CONSTRAINT `FK_AGT_TRG_DET_AGT_TRG_ATID` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AGT_TRG_DET_DUR_DET_DDI` FOREIGN KEY (`DURATION_DETAIL_ID`) REFERENCES `rm_duration_detail` (`duration_detail_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_formula`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_formula` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int DEFAULT NULL,
  `TARGET_ID` int DEFAULT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `FORMULA` text,
  `FORMULA_TYPE_ID` int DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TARGET_FORMULA__PLAN_idx` (`PLAN_ID`),
  KEY `FK_TARGET_FORMULA__TARGET_idx` (`TARGET_ID`),
  KEY `FK_TARGET_FORMULA_FRML_TYPE_idx` (`FORMULA_TYPE_ID`),
  CONSTRAINT `FK_TARGET_FORMULA__PLAN` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`id`),
  CONSTRAINT `FK_TARGET_FORMULA__TARGET` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`id`),
  CONSTRAINT `FK_TARGET_FORMULA_FRML_TYPE` FOREIGN KEY (`FORMULA_TYPE_ID`) REFERENCES `rm_formula_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_measure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_measure` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SPLIT_PERCENTAGE` int NOT NULL,
  `MEASURE_AMOUNT` int NOT NULL,
  `DURATION_TYPE_ID` int DEFAULT NULL,
  `MEASURE_ID` int NOT NULL,
  `TARGET_ID` int NOT NULL,
  `MEASURE_SETT_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DOM_TRG_DUR_TP_DTI` (`DURATION_TYPE_ID`),
  KEY `FK_DOM_TRG_TRG_MEASURE_TTI` (`MEASURE_ID`),
  KEY `FK_TGT__DOM_TGT` (`TARGET_ID`),
  KEY `FK_SETTING_TYPE_TARGET_MEASURE_FK` (`MEASURE_SETT_TYPE_ID`),
  CONSTRAINT `FK_DOM_TRG_DUR_TP_DTI` FOREIGN KEY (`DURATION_TYPE_ID`) REFERENCES `rm_duration_type` (`duration_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DOM_TRG_TRG_MEASURE_TTI` FOREIGN KEY (`MEASURE_ID`) REFERENCES `rm_measure` (`MEASURE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SETTING_TYPE_TARGET_MEASURE_FK` FOREIGN KEY (`MEASURE_SETT_TYPE_ID`) REFERENCES `rm_measure_setting_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TGT__DOM_TGT` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_perc_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_perc_detail` (
  `ID` int NOT NULL,
  `TARGET_MEASURE_ID` int DEFAULT NULL,
  `PERCENTAGE` double NOT NULL,
  `FROM_VALUE` int DEFAULT NULL,
  `TO_VALUE` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__TRG_PER_AGT_TRG_MEASURE` (`TARGET_MEASURE_ID`),
  CONSTRAINT `FK__TRG_PER_AGT_TRG_MEASURE` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_product_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_product_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TARGET_ID` int DEFAULT NULL,
  `PRODUCT_ID` int DEFAULT NULL,
  `EVENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__TARGET_PROD_PRODCT` (`PRODUCT_ID`),
  KEY `FK__TARGET_PROD_TARGET` (`TARGET_ID`),
  KEY `FK_TARGET_PROD_EVENT` (`EVENT_ID`),
  CONSTRAINT `FK__TARGET_PROD_PRODCT` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `rm_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TARGET_PROD_TARGET` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TARGET_PROD_EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `rm_event` (`EVENT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_rule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_rule` (
  `ID` int NOT NULL,
  `TARGET_ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  `STATUS_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TRG_RULE__RULE` (`RULE_ID`),
  KEY `FK_TRG_RULE__TRG` (`TARGET_ID`),
  CONSTRAINT `FK_TRG_RULE__RULE` FOREIGN KEY (`RULE_ID`) REFERENCES `rm_rule` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TRG_RULE__TRG` FOREIGN KEY (`TARGET_ID`) REFERENCES `rm_target` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_target_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_target_type` (
  `TARGET_TYPE_ID` int NOT NULL,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`TARGET_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_team`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_team` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(400) NOT NULL,
  `SCHEMA_ID` int DEFAULT NULL,
  `TYPE_ID` int DEFAULT '1',
  `STATUS` tinyint(1) DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_NAME_SCHEMA` (`NAME`,`SCHEMA_ID`),
  KEY `FK__TEAM__SCH_STRUC_idx` (`SCHEMA_ID`),
  KEY `FK__TEAM__TEAM_TYPE` (`TYPE_ID`),
  CONSTRAINT `FK__TEAM__SCH_STRUC` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TEAM__TEAM_TYPE` FOREIGN KEY (`TYPE_ID`) REFERENCES `rm_team_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_team_plan_queue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_team_plan_queue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int NOT NULL,
  `TEAM_ID` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_team_plan_scope`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_team_plan_scope` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TEAM_ID` int DEFAULT NULL,
  `PLAN_SCOPE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__AGT_PROF_SCOP__TEAM` (`TEAM_ID`),
  KEY `FK__TEAM_PROF_SCOP__PROF_SCOP` (`PLAN_SCOPE_ID`),
  CONSTRAINT `FK__AGT_PROF_SCOP__TEAM` FOREIGN KEY (`TEAM_ID`) REFERENCES `rm_team` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TEAM_PROF_SCOP__PROF_SCOP` FOREIGN KEY (`PLAN_SCOPE_ID`) REFERENCES `rm_plan_scope` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_team_target_aggregator`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_team_target_aggregator` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TARGET_MEASURE_ID` int NOT NULL,
  `STATUS_CODE` int DEFAULT NULL,
  `ELIGIBLE_COMMISSION_STATE` int NOT NULL,
  `SALES_MANAGER_ID` int NOT NULL,
  `AMOUNT` varchar(100) NOT NULL,
  `INSERTION_DATE` datetime NOT NULL,
  `LAST_UPDATE_DATE` datetime NOT NULL,
  `TEAM_ID` int DEFAULT NULL,
  `PLAN_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__DOMAIN_AGGREGATOR_STATUS_CODE` (`STATUS_CODE`),
  KEY `FK__TEAM_TEAM_AGG` (`TEAM_ID`),
  KEY `FK_RM_DOMAIN_TARGET_AGGREGATOR_IBFK_2` (`TARGET_MEASURE_ID`),
  KEY `FK_RM_DOMAIN_TARGET_AGGREGATOR_IBFK_3` (`ELIGIBLE_COMMISSION_STATE`),
  KEY `FK_RM_DOMAIN_TARGET_AGGREGATOR_IBFK_4` (`SALES_MANAGER_ID`),
  KEY `FK__TEAM_TAR_AGG__PLAN` (`PLAN_ID`),
  CONSTRAINT `FK__DOMAIN_AGGREGATOR_STATUS_CODE` FOREIGN KEY (`STATUS_CODE`) REFERENCES `rm_status_code` (`status_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__TEAM_TAR_AGG__PLAN` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`),
  CONSTRAINT `FK__TEAM_TEAM_AGG` FOREIGN KEY (`TEAM_ID`) REFERENCES `rm_team` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_DOMAIN_TARGET_AGGREGATOR_IBFK_2` FOREIGN KEY (`TARGET_MEASURE_ID`) REFERENCES `rm_target_measure` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_DOMAIN_TARGET_AGGREGATOR_IBFK_3` FOREIGN KEY (`ELIGIBLE_COMMISSION_STATE`) REFERENCES `rm_reflection_state` (`reflection_state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RM_DOMAIN_TARGET_AGGREGATOR_IBFK_4` FOREIGN KEY (`SALES_MANAGER_ID`) REFERENCES `rm_agent` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rm_team_target_aggregator_ibfk_1` FOREIGN KEY (`PLAN_ID`) REFERENCES `rm_plan` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_team_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_team_type` (
  `ID` int NOT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_translation_mapping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_translation_mapping` (
  `ID` int NOT NULL,
  `REF_TABLE` varchar(50) NOT NULL,
  `REF_VALUE` varchar(50) NOT NULL,
  `MAPPED_TRANSLATION` varchar(1000) NOT NULL,
  `LANGUAGE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_REF_TABLE_COLUMN` (`REF_TABLE`,`REF_VALUE`),
  KEY `FK_LANG__MAPPING_TRANS` (`LANGUAGE_ID`),
  CONSTRAINT `FK_LANG__MAPPING_TRANS` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `rm_language` (`language_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_user_trx`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_user_trx` (
  `ID` int NOT NULL,
  `VALUE` varchar(1000) NOT NULL,
  `USERNAME` varchar(400) NOT NULL,
  `TRX_DATE` datetime NOT NULL,
  `USER_TRX_TYPE_ID` int NOT NULL,
  `SCHEMA_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_UR_TRX_UR_TRX_TP_UTTI` (`USER_TRX_TYPE_ID`),
  KEY `FK_UR_TRX_SCH` (`SCHEMA_ID`),
  CONSTRAINT `FK_UR_TRX_SCH` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_UR_TRX_UR_TRX_TP_UTTI` FOREIGN KEY (`USER_TRX_TYPE_ID`) REFERENCES `rm_user_trx_type` (`user_trx_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_user_trx_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_user_trx_type` (
  `USER_TRX_TYPE_ID` int NOT NULL,
  `NAME` varchar(400) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`USER_TRX_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL,
  `SCHEMA_ID` int NOT NULL,
  `VARIABLE_SOURCE_TYPE_ID` int DEFAULT NULL,
  `VARIABLE_DATA_TYPE_ID` int DEFAULT NULL,
  `VARIABLE_DATA_SOURCE_ID` int DEFAULT NULL,
  `STATIC_VARIABLE_VALUE` varchar(200) DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`,`SCHEMA_ID`),
  KEY `ID_idx` (`SCHEMA_ID`),
  KEY `FK_VAR__SOURCE_TYPE_idx` (`VARIABLE_SOURCE_TYPE_ID`),
  KEY `FK_VAR__DATA_TYPE_idx` (`VARIABLE_DATA_TYPE_ID`),
  KEY `FK_VAR__DATA_SOURCE_idx` (`VARIABLE_DATA_SOURCE_ID`),
  CONSTRAINT `FK_VAR__DATA_SOURCE` FOREIGN KEY (`VARIABLE_DATA_SOURCE_ID`) REFERENCES `rm_variable_data_source` (`variable_data_source_id`),
  CONSTRAINT `FK_VAR__DATA_TYPE` FOREIGN KEY (`VARIABLE_DATA_TYPE_ID`) REFERENCES `rm_variable_data_type` (`variable_data_type_id`),
  CONSTRAINT `FK_VAR__SCHEMA` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `rm_schema` (`id`),
  CONSTRAINT `FK_VAR__SOURCE_TYPE` FOREIGN KEY (`VARIABLE_SOURCE_TYPE_ID`) REFERENCES `rm_variable_source_type` (`variable_source_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_data_source`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_data_source` (
  `variable_data_source_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`variable_data_source_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_data_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_data_type` (
  `variable_data_type_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`variable_data_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_prerequisite`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_prerequisite` (
  `VARIABLE_PREREQUISITE_ID` int NOT NULL AUTO_INCREMENT,
  `VARIABLE_ID` int NOT NULL,
  `VARIABLE_PREREQUISITE_COLUMN_ID` int NOT NULL,
  PRIMARY KEY (`VARIABLE_PREREQUISITE_ID`),
  KEY `FK_VAR_PRE__VAR_idx` (`VARIABLE_ID`),
  KEY `FK_VAR_PRE__PRE_COL_idx` (`VARIABLE_PREREQUISITE_COLUMN_ID`),
  CONSTRAINT `FK_VAR_PRE__PRE_COL` FOREIGN KEY (`VARIABLE_PREREQUISITE_COLUMN_ID`) REFERENCES `rm_variable_prerequisite_column` (`VARIABLE_PREREQUISITE_COLUMN_ID`),
  CONSTRAINT `FK_VAR_PRE__VAR` FOREIGN KEY (`VARIABLE_ID`) REFERENCES `rm_variable` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_prerequisite_column`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_prerequisite_column` (
  `VARIABLE_PREREQUISITE_COLUMN_ID` int NOT NULL,
  `VARIABLE_PREREQUISITE_TABLE_ID` int NOT NULL,
  `COLUMN_NAME` varchar(200) NOT NULL,
  PRIMARY KEY (`VARIABLE_PREREQUISITE_COLUMN_ID`),
  KEY `FK_VAR_PRE_COL__TBL_idx` (`VARIABLE_PREREQUISITE_TABLE_ID`),
  CONSTRAINT `FK_VAR_PRE_COL__TBL` FOREIGN KEY (`VARIABLE_PREREQUISITE_TABLE_ID`) REFERENCES `rm_variable_prerequisite_table` (`variable_prerequisite_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_prerequisite_table`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_prerequisite_table` (
  `variable_prerequisite_table_id` int NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `class` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`variable_prerequisite_table_id`),
  UNIQUE KEY `table_name_UNIQUE` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_source_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_source_type` (
  `variable_source_type_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`variable_source_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_type` (
  `VARIABLE_TYPE_ID` int NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`VARIABLE_TYPE_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_variable_type_details`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_variable_type_details` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VARIABLE_ID` int NOT NULL,
  `VARIABLE_TYPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_VARIABLES` (`VARIABLE_ID`,`VARIABLE_TYPE_ID`),
  KEY `FK_VAR__VAR_idx` (`VARIABLE_ID`),
  KEY `FK_VAR__VAR_TYPE_idx` (`VARIABLE_TYPE_ID`),
  CONSTRAINT `FK_VAR__VAR` FOREIGN KEY (`VARIABLE_ID`) REFERENCES `rm_variable` (`ID`),
  CONSTRAINT `FK_VAR_TYPE` FOREIGN KEY (`VARIABLE_TYPE_ID`) REFERENCES `rm_variable_type` (`VARIABLE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wr_bl_logging`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wr_bl_logging` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TRX_ID` varchar(40) NOT NULL,
  `STATUS_CODE` varchar(20) NOT NULL,
  `EVENT_ID` int NOT NULL,
  `TRX_DATE` date NOT NULL,
  `TRX_INFO` varchar(4000) DEFAULT NULL,
  `SOURCE_CODE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SYS_C0059520` (`TRX_ID`),
  KEY `FK_WR_BL_LO_FK_WR_LOG_WR_EVENT` (`EVENT_ID`),
  KEY `SYS_C0059516` (`SOURCE_CODE`),
  CONSTRAINT `FK_WR_BL_LO_FK_WR_LOG_WR_EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `wr_event` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SYS_C0059516` FOREIGN KEY (`SOURCE_CODE`) REFERENCES `wr_source` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wr_communication_logging`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wr_communication_logging` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TRX_ID` varchar(200) NOT NULL,
  `TRX_DATE` date NOT NULL,
  `REQUEST` blob NOT NULL,
  `RESPONSE` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wr_event`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wr_event` (
  `ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wr_source` (
  `NAME` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
