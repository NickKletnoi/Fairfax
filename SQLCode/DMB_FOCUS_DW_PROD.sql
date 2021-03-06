USE [master]
GO
/****** Object:  Database [DMB_FOCUS_DW]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE DATABASE [DMB_FOCUS_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMB_FOCUS_DW', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.mdf' , SIZE = 14774272KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DW_ETL.ETL] 
( NAME = N'DW_ETL.ETL', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.DW_ETL.ETL.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DW_MD.MD] 
( NAME = N'DW_MD.MD', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.DW_MD.MD.mdf' , SIZE = 1240064KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DW_MD.SEC] 
( NAME = N'DW_MD.SEC', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.DW_MD.SEC.mdf' , SIZE = 65536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DW_TD.FM] 
( NAME = N'DW_TD.FM', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.DW_TD.FM.mdf' , SIZE = 12882944KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [DW_TD.GM] 
( NAME = N'DW_TD.GM', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.DW_TD.GM.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [MD.SEC] 
( NAME = N'MD.SEC', FILENAME = N'G:\MountPt\FOCUS\SQLData\DMB_FOCUS_DW.MD.SEC.mdf' , SIZE = 66560KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DMB_FOCUS_DW_log', FILENAME = N'G:\MountPt\FOCUS\SQLLog\DMB_FOCUS_DW_log.ldf' , SIZE = 28333632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DMB_FOCUS_DW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMB_FOCUS_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMB_FOCUS_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET  MULTI_USER 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMB_FOCUS_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DMB_FOCUS_DW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMB_FOCUS_DW', N'ON'
GO
USE [DMB_FOCUS_DW]
GO
/****** Object:  User [FOCUS_DS]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FOCUS_DS] FOR LOGIN [FOCUS_DS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FFX\xnkletn]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FFX\xnkletn] FOR LOGIN [FFX\xnkletn] WITH DEFAULT_SCHEMA=[FM]
GO
/****** Object:  User [FFX\SYS-App_FOCUS_DW_FIL]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FFX\SYS-App_FOCUS_DW_FIL] FOR LOGIN [FFX\SYS-App_FOCUS_DW_FIL] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FFX\ERP-FBSG-DW-RPTUSER-DEVL]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FFX\ERP-FBSG-DW-RPTUSER-DEVL] FOR LOGIN [FFX\ERP-FBSG-DW-RPTUSER-DEVL]
GO
/****** Object:  User [FFX\ERP-FBSG-DW-ADMIN-DEVL]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FFX\ERP-FBSG-DW-ADMIN-DEVL] FOR LOGIN [FFX\ERP-FBSG-DW-ADMIN-DEVL]
GO
/****** Object:  User [FFX\DMB_FOCUS_DW_Admin]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FFX\DMB_FOCUS_DW_Admin] FOR LOGIN [FFX\DMB_FOCUS_DW_Admin]
GO
/****** Object:  User [FFD\ffdssasdgc20$]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [FFD\ffdssasdgc20$] FOR LOGIN [FFD\ffdssasdgc20$] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [App_FOCUS_DW_FILO_RptUser]    Script Date: 5/12/2015 9:32:46 AM ******/
CREATE USER [App_FOCUS_DW_FILO_RptUser] FOR LOGIN [App_FOCUS_DW_FILO_RptUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [FOCUS_DS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FOCUS_DS]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [FOCUS_DS]
GO
ALTER ROLE [db_owner] ADD MEMBER [FFX\xnkletn]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FFX\SYS-App_FOCUS_DW_FIL]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FFX\ERP-FBSG-DW-RPTUSER-DEVL]
GO
ALTER ROLE [db_owner] ADD MEMBER [FFX\ERP-FBSG-DW-ADMIN-DEVL]
GO
ALTER ROLE [db_owner] ADD MEMBER [FFX\DMB_FOCUS_DW_Admin]
GO
ALTER ROLE [db_owner] ADD MEMBER [FFD\ffdssasdgc20$]
GO
ALTER ROLE [db_datareader] ADD MEMBER [App_FOCUS_DW_FILO_RptUser]
GO
/****** Object:  Schema [DW]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [DW]
GO
/****** Object:  Schema [DW_RM ]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [DW_RM ]
GO
/****** Object:  Schema [ETL]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [ETL]
GO
/****** Object:  Schema [FM]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [FM]
GO
/****** Object:  Schema [MD]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [MD]
GO
/****** Object:  Schema [MX]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [MX]
GO
/****** Object:  Schema [STG_MD_SYN]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [STG_MD_SYN]
GO
/****** Object:  Schema [STG_TD_SYN]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [STG_TD_SYN]
GO
/****** Object:  Schema [TD]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SCHEMA [TD]
GO
/****** Object:  Synonym [STG_MD_SYN].[AMOUNT_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[AMOUNT_TYPE] FOR [DMB_FOCUS_STG2].[STG_MD].[AMOUNT_TYPE]
GO
/****** Object:  Synonym [STG_MD_SYN].[BCS_VALUE_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[BCS_VALUE_TYPE] FOR [DMB_FOCUS_STG2].[STG_MD].[BCS_VALUE_TYPE]
GO
/****** Object:  Synonym [STG_MD_SYN].[BUDG_PROCESS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[BUDG_PROCESS] FOR [DMB_FOCUS_STG2].[STG_MD].[BUDG_PROCESS]
GO
/****** Object:  Synonym [STG_MD_SYN].[BUDGET_CATEGORY]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[BUDGET_CATEGORY] FOR [DMB_FOCUS_STG2].[STG_MD].[BUDGET_CATEGORY]
GO
/****** Object:  Synonym [STG_MD_SYN].[BUDGET_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[BUDGET_TYPE] FOR [DMB_FOCUS_STG2].[STG_MD].[BUDGET_TYPE]
GO
/****** Object:  Synonym [STG_MD_SYN].[BUSINESS_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[BUSINESS_AREA] FOR [DMB_FOCUS_STG2].[STG_MD].[BUSINESS_AREA]
GO
/****** Object:  Synonym [STG_MD_SYN].[CMMT_ITEM_CAT]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[CMMT_ITEM_CAT] FOR [DMB_FOCUS_STG2].[STG_MD].[CMMT_ITEM_CAT]
GO
/****** Object:  Synonym [STG_MD_SYN].[CMMT_ITEM_SUP]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[CMMT_ITEM_SUP] FOR [DMB_FOCUS_STG2].[STG_MD].[CMMT_ITEM_SUP]
GO
/****** Object:  Synonym [STG_MD_SYN].[COMMITMENT_ITEM]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[COMMITMENT_ITEM] FOR [DMB_FOCUS_STG2].[STG_MD].[COMMITMENT_ITEM]
GO
/****** Object:  Synonym [STG_MD_SYN].[COMMITMENT_ITEM_SET]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[COMMITMENT_ITEM_SET] FOR [DMB_FOCUS_STG2].[STG_MD].[COMMITMENT_ITEM_SET]
GO
/****** Object:  Synonym [STG_MD_SYN].[DOC_CAT]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[DOC_CAT] FOR [DMB_FOCUS_STG2].[STG_MD].[DOC_CAT]
GO
/****** Object:  Synonym [STG_MD_SYN].[DOCUMENT_STATUS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[DOCUMENT_STATUS] FOR [DMB_FOCUS_STG2].[STG_MD].[DOCUMENT_STATUS]
GO
/****** Object:  Synonym [STG_MD_SYN].[DOCUMENT_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[DOCUMENT_TYPE] FOR [DMB_FOCUS_STG2].[STG_MD].[DOCUMENT_TYPE]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUNCTIONAL_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUNCTIONAL_AREA] FOR [DMB_FOCUS_STG2].[STG_MD].[FUNCTIONAL_AREA]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUND]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUND] FOR [DMB_FOCUS_STG2].[STG_MD].[FUND]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUND_SET]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUND_SET] FOR [DMB_FOCUS_STG2].[STG_MD].[FUND_SET]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUNDED_PROGRAM]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUNDED_PROGRAM] FOR [DMB_FOCUS_STG2].[STG_MD].[FUNDED_PROGRAM]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUNDED_PROGRAM_SET]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUNDED_PROGRAM_SET] FOR [DMB_FOCUS_STG2].[STG_MD].[FUNDED_PROGRAM_SET]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUNDS_CENTER]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUNDS_CENTER] FOR [DMB_FOCUS_STG2].[STG_MD].[FUNDS_CENTER]
GO
/****** Object:  Synonym [STG_MD_SYN].[FUNDS_CENTER_SET]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[FUNDS_CENTER_SET] FOR [DMB_FOCUS_STG2].[STG_MD].[FUNDS_CENTER_SET]
GO
/****** Object:  Synonym [STG_MD_SYN].[GRANT]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[GRANT] FOR [DMB_FOCUS_STG2].[STG_MD].[GRANT]
GO
/****** Object:  Synonym [STG_MD_SYN].[ORDER]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[ORDER] FOR [DMB_FOCUS_STG2].[STG_MD].[ORDER]
GO
/****** Object:  Synonym [STG_MD_SYN].[STAT_INDICATOR]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[STAT_INDICATOR] FOR [DMB_FOCUS_STG2].[STG_MD].[STAT_INDICATOR]
GO
/****** Object:  Synonym [STG_MD_SYN].[VALUE_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[VALUE_TYPE] FOR [DMB_FOCUS_STG2].[STG_MD].[VALUE_TYPE]
GO
/****** Object:  Synonym [STG_MD_SYN].[VENDOR]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[VENDOR] FOR [DMB_FOCUS_STG2].[STG_MD].[VENDOR]
GO
/****** Object:  Synonym [STG_MD_SYN].[VERSION]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[VERSION] FOR [DMB_FOCUS_STG2].[STG_MD].[VERSION]
GO
/****** Object:  Synonym [STG_MD_SYN].[WBS_ELEMENT]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[WBS_ELEMENT] FOR [DMB_FOCUS_STG2].[STG_MD].[WBS_ELEMENT]
GO
/****** Object:  Synonym [STG_MD_SYN].[WORKFLOW_STATUS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_MD_SYN].[WORKFLOW_STATUS] FOR [DMB_FOCUS_STG2].[STG_MD].[WORKFLOW_STATUS]
GO
/****** Object:  Synonym [STG_TD_SYN].[CO_CMMT_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[CO_CMMT_LNITMS] FOR [DMB_FOCUS_STG2].[STG_TD].[CO_CMMT_LNITMS]
GO
/****** Object:  Synonym [STG_TD_SYN].[CO_CMMT_LNITMS_ORDER]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[CO_CMMT_LNITMS_ORDER] FOR [DMB_FOCUS_STG2].[STG_TD].[CO_CMMT_LNITMS_ORDER]
GO
/****** Object:  Synonym [STG_TD_SYN].[CO_CMMT_LNITMS_WBS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[CO_CMMT_LNITMS_WBS] FOR [DMB_FOCUS_STG2].[STG_TD].[CO_CMMT_LNITMS_WBS]
GO
/****** Object:  Synonym [STG_TD_SYN].[FM_BDGT_ENTR]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[FM_BDGT_ENTR] FOR [DMB_FOCUS_STG2].[STG_TD].[FM_BDGT_ENTR]
GO
/****** Object:  Synonym [STG_TD_SYN].[FM_BDGT_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[FM_BDGT_LNITMS] FOR [DMB_FOCUS_STG2].[STG_TD].[FM_BDGT_LNITMS]
GO
/****** Object:  Synonym [STG_TD_SYN].[FM_BDGT_TOT]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[FM_BDGT_TOT] FOR [DMB_FOCUS_STG2].[STG_TD].[FM_BDGT_TOT]
GO
/****** Object:  Synonym [STG_TD_SYN].[FM_CMMT_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[FM_CMMT_LNITMS] FOR [DMB_FOCUS_STG2].[STG_TD].[FM_CMMT_LNITMS]
GO
/****** Object:  Synonym [STG_TD_SYN].[FM_FI_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[FM_FI_LNITMS] FOR [DMB_FOCUS_STG2].[STG_TD].[FM_FI_LNITMS]
GO
/****** Object:  Synonym [STG_TD_SYN].[GM_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
CREATE SYNONYM [STG_TD_SYN].[GM_LNITMS] FOR [DMB_FOCUS_STG2].[STG_TD].[GM_LNITMS]
GO
/****** Object:  Table [ETL].[CNTRL]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ETL].[CNTRL](
	[SUBJECT_AREA] [varchar](100) NULL,
	[OBJECT_NAME] [varchar](100) NULL,
	[OBJECT_TYPE] [varchar](100) NULL,
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [char](1) NULL,
	[DW_EXECUTION_ORDER] [int] NULL
) ON [DW_ETL.ETL]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ETL].[CNTRL_ARCHIVE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ETL].[CNTRL_ARCHIVE](
	[SUBJECT_AREA] [varchar](100) NULL,
	[OBJECT_NAME] [varchar](100) NULL,
	[OBJECT_TYPE] [varchar](100) NULL,
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [char](1) NULL,
	[DW_EXECUTION_ORDER] [int] NULL
) ON [DW_ETL.ETL]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ETL].[KEYCHK]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ETL].[KEYCHK](
	[SUBJECT_AREA] [varchar](100) NULL,
	[DATA_AS_OF_DATE] [date] NULL,
	[PK_OBJECT] [varchar](100) NULL,
	[FK_OBJECT] [varchar](100) NULL,
	[CNT_KEY] [int] NULL
) ON [DW_ETL.ETL]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ETL].[LOGGING]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ETL].[LOGGING](
	[LOGGING_ID] [int] IDENTITY(1,1) NOT NULL,
	[SUBJECT_AREA] [varchar](100) NULL,
	[DATA_AS_OF_DATE] [date] NULL,
	[PROCEDURE_NAME] [varchar](150) NULL,
	[DW_OBJECT_NAME] [varchar](150) NULL,
	[STG_OBJECT_NAME] [varchar](150) NULL,
	[SOURCE_TYPE] [varchar](50) NULL,
	[RUN_STATUS] [varchar](100) NULL,
	[ERROR_MSG] [varchar](8000) NULL,
	[START_TIME] [smalldatetime] NULL,
	[END_TIME] [smalldatetime] NULL,
	[CNT_DW] [int] NULL,
	[CNT_STG] [int] NULL,
	[CNT_DIF] [int] NULL,
	[CNT_DUP] [int] NULL
) ON [DW_ETL.ETL]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ETL].[LOGGING_ARCHIVE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ETL].[LOGGING_ARCHIVE](
	[VALID_LOAD_ID] [varchar](150) NULL,
	[LOGGING_ID] [int] NULL,
	[SUBJECT_AREA] [varchar](100) NULL,
	[DATA_AS_OF_DATE] [date] NULL,
	[PROCEDURE_NAME] [varchar](150) NULL,
	[DW_OBJECT_NAME] [varchar](150) NULL,
	[STG_OBJECT_NAME] [varchar](150) NULL,
	[SOURCE_TYPE] [varchar](50) NULL,
	[RUN_STATUS] [varchar](100) NULL,
	[ERROR_MSG] [varchar](8000) NULL,
	[START_TIME] [smalldatetime] NULL,
	[END_TIME] [smalldatetime] NULL,
	[CNT_DW] [int] NULL,
	[CNT_STG] [int] NULL,
	[CNT_DIF] [int] NULL,
	[CNT_DUP] [int] NULL
) ON [DW_ETL.ETL]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[AMOUNT_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[AMOUNT_TYPE](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[AMOUNT_TYPE] [varchar](60) NOT NULL,
	[DESCRIPTION] [varchar](60) NULL,
	[LONG_DESCRIPTION] [varchar](123) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[BCS_VALUE_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[BCS_VALUE_TYPE](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[BCS_VALUE_TYPE] [varchar](2) NOT NULL,
	[DESCRIPTION] [varchar](15) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[BUDG_PROCESS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[BUDG_PROCESS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[BUDG_PROCESS] [varchar](4) NOT NULL,
	[DESCRIPTION] [varchar](15) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[BUDGET_CATEGORY]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[BUDGET_CATEGORY](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[BUDGET_CATEGORY] [varchar](60) NOT NULL,
	[DESCRIPTION] [varchar](60) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[BUDGET_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[BUDGET_TYPE](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[BUDGET_TYPE] [varchar](4) NOT NULL,
	[FM_AREA] [varchar](4) NOT NULL,
	[BCS_VALUE_TYPE] [varchar](2) NOT NULL,
	[DESCRIPTION] [varchar](30) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[BUSINESS_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[BUSINESS_AREA](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[BUSINESS_AREA] [varchar](4) NOT NULL,
	[DESCRIPTION] [varchar](30) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[CMMT_ITEM_CAT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[CMMT_ITEM_CAT](
	[CMMT_ITEM_CAT] [varchar](60) NULL,
	[NAME] [varchar](40) NULL,
	[DESCRIPTION] [varchar](60) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[COMMITMENT_ITEM]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[COMMITMENT_ITEM](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[COMMITMENT_ITEM] [varchar](24) NOT NULL,
	[FM_AREA] [varchar](4) NOT NULL,
	[VALID_TO] [date] NOT NULL,
	[VALID_FROM] [date] NULL,
	[CMMT_ITEM_CAT] [decimal](1, 0) NULL,
	[CMMT_ITEM_SUP] [varchar](24) NULL,
	[FIN_TRANSACTION] [decimal](2, 0) NULL,
	[DIR_POSTABLE] [decimal](1, 0) NULL,
	[ITEM] [varchar](8) NULL,
	[CAR_FWD_ITM_CAT] [varchar](2) NULL,
	[STAT_CMMT_ITEM] [varchar](1) NULL,
	[STAND_VARIANT] [varchar](1) NULL,
	[COMMITMENT_ITEM1] [varchar](14) NULL,
	[NAME] [varchar](40) NULL,
	[DESCRIPTION] [varchar](60) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL,
	[CMMT_ITEM_SUP_NAME] [varchar](100) NULL,
	[CMMT_ITEM_CAT_NAME] [varchar](100) NULL,
	[CMMT_ITEM_SUP_LONG_NAME] [varchar](100) NULL,
	[CMMT_ITEM_CAT_LONG_NAME] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[COMMITMENT_ITEM_SET]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[COMMITMENT_ITEM_SET](
	[PARENT_ID] [varchar](30) NULL,
	[CHILD_ID] [varchar](30) NULL,
	[PARENT_DESC] [varchar](64) NULL,
	[CHILD_DESC] [varchar](64) NULL,
	[ROOT_FLAG] [varchar](1) NULL,
	[LEAF_FLAG] [varchar](1) NULL,
	[CONT_AREA] [varchar](30) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[COST_CENTER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[COST_CENTER](
	[COST_CENTER] [varchar](64) NULL,
	[COST_CENTER_NAME] [varchar](64) NULL,
	[DIVISION] [varchar](64) NULL,
	[AGENCY] [varchar](64) NULL,
	[DEPARTMENT] [varchar](64) NULL,
	[BUSINESS_AREA] [varchar](64) NULL,
	[HIERARCHY] [varchar](64) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[DATE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MD].[DATE](
	[PK_Date] [datetime] NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Date_Name2] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Half_Year] [datetime] NULL,
	[Half_Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Half_Year] [int] NULL,
	[Day_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Day_Of_Week] [int] NULL,
	[Day_Of_Week_Name] [nvarchar](50) NULL,
	[Week_Of_Year] [int] NULL,
	[Week_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Year] [int] NULL,
	[Month_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Half_Year] [int] NULL,
	[Month_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Quarter] [int] NULL,
	[Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_Of_Year] [int] NULL,
	[Quarter_Of_Year_Name] [nvarchar](50) NULL,
	[Quarter_Of_Half_Year] [int] NULL,
	[Quarter_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Half_Year_Of_Year] [int] NULL,
	[Half_Year_Of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Year] [datetime] NULL,
	[Fiscal_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Half_Year] [datetime] NULL,
	[Fiscal_Half_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter] [datetime] NULL,
	[Fiscal_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Month] [datetime] NULL,
	[Fiscal_Month_Name] [nvarchar](50) NULL,
	[Fiscal_Week] [datetime] NULL,
	[Fiscal_Week_Name] [nvarchar](50) NULL,
	[Fiscal_Day] [datetime] NULL,
	[Fiscal_Day_Name] [nvarchar](50) NULL,
	[Fiscal_Day_Of_Year] [int] NULL,
	[Fiscal_Day_Of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Day_Of_Half_Year] [int] NULL,
	[Fiscal_Day_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Day_Of_Quarter] [int] NULL,
	[Fiscal_Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Day_Of_Month] [int] NULL,
	[Fiscal_Day_Of_Month_Name] [nvarchar](50) NULL,
	[Fiscal_Day_Of_Week] [int] NULL,
	[Fiscal_Day_Of_Week_Name] [nvarchar](50) NULL,
	[Fiscal_Week_Of_Year] [int] NULL,
	[Fiscal_Week_Of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Month_Of_Year] [int] NULL,
	[Fiscal_Month_Of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Month_Of_Half_Year] [int] NULL,
	[Fiscal_Month_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Month_Of_Quarter] [int] NULL,
	[Fiscal_Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter_Of_Year] [int] NULL,
	[Fiscal_Quarter_Of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter_Of_Half_Year] [int] NULL,
	[Fiscal_Quarter_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Half_Year_Of_Year] [int] NULL,
	[Fiscal_Half_Year_Of_Year_Name] [nvarchar](50) NULL
) ON [DW_MD.MD]

GO
/****** Object:  Table [MD].[DOCUMENT_NUMBER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[DOCUMENT_NUMBER](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[NUMBER] [varchar](10) NULL,
	[ITEM] [varchar](10) NULL,
	[TEXT] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[DOCUMENT_STATUS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[DOCUMENT_STATUS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_STATUS] [varchar](60) NOT NULL,
	[NAME] [varchar](40) NULL,
	[DESCRIPTION] [varchar](60) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[FUNCTIONAL_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[FUNCTIONAL_AREA](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NOT NULL,
	[DESCRIPTION] [varchar](25) NULL,
	[LONG_DESCRIPTION] [varchar](150) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[FUND]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[FUND](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[FUND] [varchar](10) NOT NULL,
	[FM_AREA] [varchar](4) NOT NULL,
	[VALID_FROM] [datetime2](7) NULL,
	[VALID_TO] [datetime2](7) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[CUSTOMER_FOR_FUND] [varchar](10) NULL,
	[APPLCTN] [varchar](16) NULL,
	[FUND_TYPE] [varchar](6) NULL,
	[EXPIRATION_DATE] [datetime2](7) NULL,
	[CREATED_BY] [varchar](12) NULL,
	[ENTRY_DATE] [datetime2](7) NULL,
	[CHANGED_BY] [varchar](12) NULL,
	[CHANGED_ON] [datetime2](7) NULL,
	[BALANCE_UPDATE] [varchar](1) NULL,
	[SUBDIVISION_ID] [varchar](10) NULL,
	[FD_SUBSTRING1] [varchar](10) NULL,
	[FD_SUBSTRING2] [varchar](10) NULL,
	[NAME] [varchar](20) NULL,
	[DESCRIPTION] [varchar](40) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[FUNDED_PROGRAM]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[FUNDED_PROGRAM](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[FUNDED_PROGRAM] [varchar](24) NOT NULL,
	[FM_AREA] [varchar](4) NOT NULL,
	[VALID_FROM] [date] NULL,
	[VALID_TO] [date] NULL,
	[FUNDED_PROGRAM_CAT] [varchar](3) NULL,
	[FPROGTYPE] [varchar](4) NULL,
	[KEY] [varchar](70) NULL,
	[OBJECT_TYPE] [varchar](10) NULL,
	[NAME] [varchar](20) NULL,
	[DESCRIPTION] [varchar](50) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[FUNDS_CENTER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[FUNDS_CENTER](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[FUNDS_CENTER] [varchar](16) NOT NULL,
	[FM_AREA] [varchar](4) NOT NULL,
	[VALID_TO] [date] NOT NULL,
	[VALID_FROM] [date] NULL,
	[USER_NAME] [varchar](12) NULL,
	[PERSON_RESPONS] [varchar](20) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[ENTRY_DATE] [date] NULL,
	[CREATED_BY] [varchar](12) NULL,
	[CHANGED_ON] [date] NULL,
	[CHANGED_BY] [varchar](12) NULL,
	[FUND] [varchar](10) NULL,
	[AUTHORIZGROUP] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[EXPIRATION_DATE] [date] NULL,
	[CURRENCY] [varchar](5) NULL,
	[NAME] [varchar](20) NULL,
	[DESCRIPTION] [varchar](40) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[FY_PERIOD]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[FY_PERIOD](
	[FY_PERIOD] [decimal](7, 0) NULL,
	[FISCAL_YEAR] [varchar](60) NULL,
	[FISCAL_PERIOD_KEY] [varchar](50) NULL,
	[FISCAL_PERIOD_NAME] [varchar](50) NULL,
	[FISCAL_PERIOD_KEY_NAME] [varchar](50) NULL,
	[REVERSE_SORT] [int] NULL,
	[LAST_REVERSE_SORT] [int] NULL,
	[YEAR_SORT] [int] NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[GRANT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[GRANT](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[GRANT] [varchar](20) NOT NULL,
	[REVISION_NUMBER] [varchar](3) NULL,
	[INTERNAL_REFERENCE] [varchar](24) NULL,
	[EXTERNAL_REFERENCE] [varchar](24) NULL,
	[VALID_FROM_DATE] [date] NULL,
	[VALID_TO_DATE] [date] NULL,
	[GRANT_TYPE] [varchar](2) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[AWARD_TYPE] [varchar](3) NULL,
	[FINAL_BILL_DATE] [date] NULL,
	[BLOCK_ALL_POSTINGS] [varchar](1) NULL,
	[ALLOW_YEAR_SPLIT] [varchar](1) NULL,
	[GRANT_FY_VARIANT] [varchar](2) NULL,
	[GRANT_CURRENCY] [varchar](5) NULL,
	[GRANT_VALUE] [numeric](13, 2) NULL,
	[CFDA_NUMBER] [varchar](10) NULL,
	[SPONSOR] [varchar](10) NULL,
	[WBS_ELEMENT] [numeric](8, 0) NULL,
	[BILLING_RULE] [numeric](4, 0) NULL,
	[TRANSFER_RESTRICTION] [varchar](1) NULL,
	[IDC_CAP] [numeric](12, 2) NULL,
	[TOTALACCUMULATED_IDC] [numeric](12, 2) NULL,
	[COST_SHARING_RULE] [numeric](4, 0) NULL,
	[COST_SHARE_RATE] [numeric](7, 3) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[LIFECYCLE_STATUS] [varchar](5) NULL,
	[USER_STATE] [varchar](5) NULL,
	[CREATED_BY] [varchar](12) NULL,
	[CREATED_ON] [date] NULL,
	[CREATED_AT] [varchar](25) NULL,
	[COPIED_FROM] [varchar](20) NULL,
	[LAST_MODIFIED_BY] [varchar](12) NULL,
	[LAST_MODIFIED_ON] [date] NULL,
	[LAST_MODIFIED_AT] [varchar](25) NULL,
	[AUTHORIZATION_GROUP] [varchar](10) NULL,
	[DELETION_INDICATOR] [varchar](1) NULL,
	[PRE_AWARD_POSTINGS] [varchar](1) NULL,
	[ORDER] [varchar](12) NULL,
	[EXCHANGE_RULE] [varchar](4) NULL,
	[GUID] [varchar](32) NULL,
	[DOCUMENT_CLASS] [varchar](10) NULL,
	[FUNDING_ORIGIN] [varchar](30) NULL,
	[EXCHANGE_RATE] [numeric](9, 5) NULL,
	[INSTALLMENT_AMOUNT] [numeric](12, 2) NULL,
	[TOTAL_BILLING_AMOUNT] [numeric](12, 2) NULL,
	[NAME] [varchar](20) NULL,
	[DESCRIPTION] [varchar](80) NULL,
	[LONG_DESCRIPTION] [varchar](150) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[ORDER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[ORDER](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[ORDER] [varchar](12) NOT NULL,
	[ORDER_TYPE] [varchar](4) NULL,
	[ORDER_CATEGORY] [decimal](2, 0) NULL,
	[ENTERED_BY] [varchar](12) NULL,
	[CREATED_ON] [date] NULL,
	[CHANGED_BY] [varchar](12) NULL,
	[CHANGED_ON] [date] NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[RESP_COST_CNTR] [varchar](10) NULL,
	[STATISTICAL] [varchar](1) NULL,
	[STATUS] [decimal](2, 0) NULL,
	[STATUS_CHANGE] [date] NULL,
	[REACHED_STATUS] [decimal](2, 0) NULL,
	[ORDER_CREATED] [varchar](1) NULL,
	[ORDER_RELEASED] [varchar](1) NULL,
	[ORDER_COMPLETED] [varchar](1) NULL,
	[ORDER_CLOSED] [varchar](1) NULL,
	[PLANNED_RELEASE] [date] NULL,
	[PLANNEDCOMPLTN] [date] NULL,
	[PLANNED_CLO_DAT] [date] NULL,
	[RELEASE_DATE] [date] NULL,
	[TECH_COMPLETION] [date] NULL,
	[CLOSE_DATE] [date] NULL,
	[OBJECT_ID] [varchar](1) NULL,
	[DELETION_FLAG] [varchar](1) NULL,
	[CCTR_TRUE_POST] [varchar](10) NULL,
	[FUND] [varchar](10) NULL,
	[GRANT] [varchar](20) NULL,
	[SPONSOR_PROGRAM] [varchar](20) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[CONTROLLING_AREA] [varchar](4) NULL,
	[DESCRIPTION] [varchar](40) NULL,
	[LONG_DESCRIPTION] [varchar](150) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_DEPARTMENT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_DEPARTMENT](
	[Department] [varchar](10) NOT NULL,
	[Department Name] [varchar](40) NULL,
	[ADDRESS] [varchar](60) NULL,
	[CITY] [varchar](40) NULL,
	[Region] [varchar](3) NULL,
	[ZIP Code] [varchar](10) NULL,
	[Contact Name] [varchar](40) NULL,
	[First Telephone Number] [varchar](30) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_DEPA__0941B88E41FD7990] PRIMARY KEY CLUSTERED 
(
	[Department] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_EMPLOYEE_ATTR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_EMPLOYEE_ATTR](
	[Personnel number] [decimal](8, 0) NOT NULL,
	[Subtype] [varchar](4) NOT NULL,
	[Object Identification] [varchar](2) NOT NULL,
	[Lock Indicator for HR Master Data Record] [varchar](1) NOT NULL,
	[End Date] [date] NOT NULL,
	[Start Date] [date] NOT NULL,
	[Number of Infotype Record with Same Key] [decimal](3, 0) NOT NULL,
	[Changed On] [date] NULL,
	[Name of Person Who Changed Object] [varchar](12) NULL,
	[Historical Record Flag] [varchar](1) NULL,
	[Text Exists for Infotype] [varchar](1) NULL,
	[Reference Fields Exist (Primary/Secondary Costs)] [varchar](1) NULL,
	[Confirmation Fields Exist] [varchar](1) NULL,
	[Infotype Screen Control] [varchar](2) NULL,
	[Reason for Changing Master Data] [varchar](2) NULL,
	[Reserved Field/Unused Field] [varchar](1) NULL,
	[Reserved Field/Unused Field 2] [varchar](1) NULL,
	[Reserved Field/Unused Field 3] [varchar](1) NULL,
	[Reserved Field/Unused Field 4] [varchar](1) NULL,
	[Reserved Field/Unused Field of Length 2] [varchar](2) NULL,
	[Reserved Field/Unused Field 2 of Length 2] [varchar](2) NULL,
	[Grouping Value for Personnel Assignments] [varchar](4) NULL,
	[Company Code] [varchar](4) NULL,
	[Personnel Area] [varchar](4) NULL,
	[Employee Group] [varchar](1) NULL,
	[Employee Subgroup] [varchar](2) NULL,
	[Organizational Key] [varchar](14) NULL,
	[Business Area] [varchar](4) NULL,
	[Personnel Subarea] [varchar](4) NULL,
	[Legal Person] [varchar](4) NULL,
	[Payroll Area] [varchar](2) NULL,
	[Work Contract] [varchar](2) NULL,
	[Cost Center] [varchar](10) NULL,
	[Organizational Unit] [decimal](8, 0) NULL,
	[Position] [decimal](8, 0) NULL,
	[Job] [decimal](8, 0) NULL,
	[Supervisor Area] [varchar](8) NULL,
	[Payroll Administrator] [varchar](3) NULL,
	[Administrator for HR Master Data] [varchar](3) NULL,
	[Administrator for Time Recording] [varchar](3) NULL,
	[Employee's Name (Sortable by LAST NAME FIRST NAME)] [varchar](30) NULL,
	[Formatted Name of Employee or Applicant] [varchar](40) NULL,
	[Object Type] [varchar](2) NULL,
	[Administrator Group] [varchar](4) NULL,
	[Controlling Area] [varchar](4) NULL,
	[Funds Center] [varchar](16) NULL,
	[Fund] [varchar](10) NULL,
	[Functional Area] [varchar](16) NULL,
	[Grant] [varchar](20) NULL,
	[Segment for Segmental Reporting] [varchar](10) NULL,
	[FM: Budget Period] [varchar](10) NULL,
	[Actual FTE] [decimal](5, 2) NULL,
	[Total FTE] [decimal](5, 2) NULL,
 CONSTRAINT [PK__SEC_EMPL__F3AA3ED7EB9EF9CF] PRIMARY KEY CLUSTERED 
(
	[Personnel number] ASC,
	[Subtype] ASC,
	[Object Identification] ASC,
	[Lock Indicator for HR Master Data Record] ASC,
	[End Date] ASC,
	[Start Date] ASC,
	[Number of Infotype Record with Same Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_EMPLOYEE_GROUP]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_EMPLOYEE_GROUP](
	[EMPLOYEE_GROUP] [varchar](1) NOT NULL,
	[DESCRIPTION] [varchar](20) NULL,
 CONSTRAINT [PK__SEC_EMPL__7000FC736FD69601] PRIMARY KEY CLUSTERED 
(
	[EMPLOYEE_GROUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_PERSONNEL_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_PERSONNEL_AREA](
	[PERSONNEL_AREA] [varchar](4) NOT NULL,
	[CTRY_GROUPING] [varchar](2) NULL,
	[DESCRIPTION] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PERSONNEL_AREA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_ROLE_COMP]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_ROLE_COMP](
	[COMPOSITE_ROLE] [varchar](30) NOT NULL,
	[ROLE] [varchar](30) NOT NULL,
	[ACTIVE] [varchar](10) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_ROLE__2C3E340DF2F16CB5] PRIMARY KEY CLUSTERED 
(
	[COMPOSITE_ROLE] ASC,
	[ROLE] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_ROLE_DEFINE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_ROLE_DEFINE](
	[ROLE] [varchar](30) NOT NULL,
	[IMPARTING_ROLE] [varchar](30) NULL,
	[CREATED_BY_USER] [varchar](12) NULL,
	[CREATED_DATE] [date] NULL,
	[CREATED_TIME] [varchar](25) NULL,
	[CREATED_TIMESTAMP] [decimal](15, 0) NULL,
	[CHANGED_BY_USER] [varchar](12) NULL,
	[CHANGED_DATE] [date] NULL,
	[CHANGED_TIME] [varchar](25) NULL,
	[CHANGE_TIMESTAMP] [decimal](15, 0) NULL,
	[ATTRIBUTES] [varchar](10) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_ROLE__52F18C58B2322063] PRIMARY KEY CLUSTERED 
(
	[ROLE] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_ROLE_DESC]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_ROLE_DESC](
	[ROLE] [varchar](30) NOT NULL,
	[LANGUAGE] [varchar](1) NOT NULL,
	[ID] [decimal](5, 0) NOT NULL,
	[NAME] [varchar](80) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_ROLE__0C2A3B75E0D34060] PRIMARY KEY CLUSTERED 
(
	[ROLE] ASC,
	[LANGUAGE] ASC,
	[ID] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_ROLE_TCODES]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_ROLE_TCODES](
	[ROLE] [varchar](30) NOT NULL,
	[REPORT_TYP] [varchar](2) NOT NULL,
	[EXTENDED_NAME] [varchar](48) NOT NULL,
	[EXCLUSIVE] [varchar](1) NULL,
	[DIRECT] [varchar](1) NULL,
	[INHER] [varchar](1) NULL,
	[ID] [decimal](5, 0) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_ROLE__F7C4DD9F5898C55E] PRIMARY KEY CLUSTERED 
(
	[ROLE] ASC,
	[REPORT_TYP] ASC,
	[EXTENDED_NAME] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_ROLE_USER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_ROLE_USER](
	[ROLE] [varchar](30) NOT NULL,
	[USER] [varchar](12) NOT NULL,
	[START_DATE] [date] NOT NULL,
	[END_DATE] [date] NOT NULL,
	[EXCLUSIVE] [varchar](1) NULL,
	[CHANGED_DATE] [date] NULL,
	[CHANGED_TIME] [varchar](25) NULL,
	[CHANGED_TIMESTAMP] [decimal](15, 0) NULL,
	[HR_ORG_MGT] [varchar](1) NULL,
	[COMP_ROLE_ASSIGNMENT] [varchar](1) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_ROLE__7FD838FAC838B8DC] PRIMARY KEY CLUSTERED 
(
	[ROLE] ASC,
	[USER] ASC,
	[START_DATE] ASC,
	[END_DATE] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_TCODE_DESC]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_TCODE_DESC](
	[Language Key] [varchar](1) NOT NULL,
	[Transaction Code] [varchar](20) NOT NULL,
	[Transaction Text] [varchar](36) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_TCOD__A65D1335A71F6659] PRIMARY KEY CLUSTERED 
(
	[Language Key] ASC,
	[Transaction Code] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_USER_ATRBUTE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_USER_ATRBUTE](
	[USER] [varchar](12) NOT NULL,
	[INITIAL_PASSWRD] [varchar](16) NULL,
	[VALID_FROM] [date] NULL,
	[Valid_Through] [date] NULL,
	[USER_TYPE] [varchar](1) NULL,
	[USER_GROUP] [varchar](12) NULL,
	[INCORRECT_LOGONS] [int] NULL,
	[USER_LOCK] [int] NULL,
	[ACCOUNT_NO] [varchar](12) NULL,
	[CREATOR] [varchar](12) NULL,
	[CREATED_ON] [date] NULL,
	[LAST_LOGON_DATE] [date] NULL,
	[LAST_LOGON_TIME] [varchar](25) NULL,
	[INITIAL_PASSWRD_1] [varchar](16) NULL,
	[PASSWORD_CHANGE_1] [date] NULL,
	[CODE_VERSION_1] [varchar](1) NULL,
	[INITIAL_PASSWRD_2] [varchar](16) NULL,
	[PASSWORD_CHANGE_2] [date] NULL,
	[CODE_VERSION_2] [varchar](1) NULL,
	[INITIAL_PASSWRD_3] [varchar](16) NULL,
	[PASSWORD_CHANGE_3] [date] NULL,
	[CODE_VERSION_3] [varchar](1) NULL,
	[INITIAL_PASSWRD_4] [varchar](16) NULL,
	[PASSWORD_CHANGE_4] [date] NULL,
	[CODE_VERSION_4] [varchar](1) NULL,
	[INITIAL_PASSWRD_5] [varchar](16) NULL,
	[PASSWORD_CHANGE_5] [date] NULL,
	[CODE_VERSION_5] [varchar](1) NULL,
	[USER_MASTER_VERSION] [varchar](3) NULL,
	[CODE_VERSION_6] [varchar](1) NULL,
	[TIME_ZONE] [varchar](6) NULL,
	[CUA_USER_TEMPLATE] [varchar](1) NULL,
	[PASSWORD_HASH_VAL] [varchar](40) NULL,
	[PASSWORD_CHANGE] [date] NULL,
	[PASSWORD_CHANGE_MANDATORY] [int] NULL,
	[RESERVED_FOR_FUTURE_EXTENSIONS] [int] NULL,
	[EXTERNAL_HISTORY] [int] NULL,
	[PASSWORD_LOGON] [date] NULL,
	[PASSWORD_RESET] [date] NULL,
	[INITIAL_PASSWORD] [int] NULL,
	[PASSWORD_LOCK] [date] NULL,
 CONSTRAINT [PK__SEC_USER__AA65E05E6DE46EEA] PRIMARY KEY CLUSTERED 
(
	[USER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_USER_DESC]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_USER_DESC](
	[User Name] [varchar](12) NOT NULL,
	[First Name] [varchar](40) NOT NULL,
	[Last Name] [varchar](40) NOT NULL,
	[Full Name] [varchar](80) NOT NULL,
 CONSTRAINT [PK__SEC_USER__44297932116D84CE] PRIMARY KEY CLUSTERED 
(
	[User Name] ASC,
	[First Name] ASC,
	[Last Name] ASC,
	[Full Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[SEC_USR_EMAILADRS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[SEC_USR_EMAILADRS](
	[ADDRESS_NUMBER] [varchar](10) NOT NULL,
	[PERSON_NUMBER] [varchar](10) NOT NULL,
	[SEQUENCE_NUMBER] [decimal](3, 0) NOT NULL,
	[STANDARD_ADDR] [varchar](1) NULL,
	[HOME_ADDRESS] [varchar](1) NULL,
	[EMAIL_ADDRESS] [varchar](1) NULL,
	[EMAIL_ADDRESS_SEARCH] [varchar](241) NULL,
	[STD_RECIPIENT] [varchar](20) NULL,
	[SAP_CONNECTION] [varchar](1) NULL,
	[CODING] [varchar](1) NULL,
	[TNEF] [varchar](1) NULL,
	[VALID_FROM] [varchar](14) NULL,
	[VALID_THRU] [varchar](14) NULL,
	[SOURCE_SYSTEM] [varchar](3) NOT NULL,
 CONSTRAINT [PK__SEC_USR___7F87A25A0EAF69A5] PRIMARY KEY CLUSTERED 
(
	[ADDRESS_NUMBER] ASC,
	[PERSON_NUMBER] ASC,
	[SEQUENCE_NUMBER] ASC,
	[SOURCE_SYSTEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_MD.SEC]
) ON [DW_MD.SEC]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[STAT_INDICATOR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[STAT_INDICATOR](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[STATISTICAL_ID] [char](1) NULL,
	[DESCRIPTION] [varchar](60) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[VALUE_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[VALUE_TYPE](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[NAME] [varchar](40) NULL,
	[DESCRIPTION] [varchar](60) NULL,
	[LONG_DESCRIPTION] [varchar](103) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[VENDOR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[VENDOR](
	[VENDOR] [varchar](10) NULL,
	[COMMON_VENDOR] [varchar](10) NULL,
	[TITLE] [varchar](15) NULL,
	[INDUSTRY] [varchar](4) NULL,
	[CONFIRM_STATUS] [varchar](1) NULL,
	[STATUS_OF_TRANSFER] [varchar](1) NULL,
	[CREATED_ON] [date] NULL,
	[CREATED_BY] [varchar](12) NULL,
	[REP_NAME] [varchar](10) NULL,
	[TYPE_OF_BUSINESS] [varchar](30) NULL,
	[TYPE_OF_INDUSTRY] [varchar](30) NULL,
	[CRED_INFO_NO] [varchar](11) NULL,
	[ACCOUNT_GROUP] [varchar](4) NULL,
	[COUNTRY] [varchar](3) NULL,
	[DELETION_FLAG] [varchar](1) NULL,
	[MATCH_CODE1] [varchar](25) NULL,
	[MATCH_CODE2] [varchar](25) NULL,
	[MATCH_CODE3] [varchar](25) NULL,
	[NAME1] [varchar](35) NULL,
	[NAME2] [varchar](35) NULL,
	[NAME3] [varchar](35) NULL,
	[NAME4] [varchar](35) NULL,
	[CITY] [varchar](35) NULL,
	[PO_BOX] [varchar](10) NULL,
	[PO_BOX_CITY] [varchar](35) NULL,
	[PO_BOX_PCODE] [varchar](10) NULL,
	[POSTAL_CODE] [varchar](10) NULL,
	[QM_SYSTEM_TO] [date] NULL,
	[STATE] [varchar](3) NULL,
	[SEARCH_TERM] [varchar](10) NULL,
	[PURCH_BLOCK] [varchar](1) NULL,
	[POSTING_BLOCK] [varchar](1) NULL,
	[TAX_NUMBER1] [varchar](16) NULL,
	[TAX_NUMBER2] [varchar](11) NULL,
	[TAX_NUMBER3] [varchar](18) NULL,
	[TAX_NUMBER4] [varchar](18) NULL,
	[STREET] [varchar](35) NULL,
	[TELEPHONE1] [varchar](16) NULL,
	[TELEPHONE2] [varchar](16) NULL,
	[FAX_NUMBER] [varchar](31) NULL,
	[TAX_JUR] [varchar](15) NULL,
	[CONFIRM_DATE] [date] NULL,
	[CONFIRM_TIME] [varchar](25) NULL,
	[RECON_ACCOUNT] [varchar](10) NULL,
	[PREV_ACCT_NO] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CERTIFICTN_DATE] [date] NULL,
	[CERTIFIED_BY] [varchar](5) NULL,
	[CONFIRMST_CCD] [varchar](1) NULL,
	[PLANNING_GROUP] [varchar](10) NULL,
	[CR_MEMO_TERMS] [varchar](4) NULL,
	[ALTERNAT_PAYEE] [varchar](10) NULL,
	[CO_CDE_DELETION_FLAG] [varchar](1) NULL,
	[MINORITY_INDIC] [varchar](3) NULL,
	[COCD_DEL_BLOCK] [varchar](1) NULL,
	[PERSONNEL_NO] [decimal](8, 0) NULL,
	[COUNTRY_WHTAX] [varchar](3) NULL,
	[CO_CODE_POST_BLOCK] [varchar](1) NULL,
	[PMT_METH_SUPL] [varchar](2) NULL,
	[ALT_PAYEE_DOC] [varchar](1) NULL,
	[INDIVIDUAL_PMNT] [varchar](1) NULL,
	[PAYMENT_BLOCK] [varchar](1) NULL,
	[GROUPING_KEY] [varchar](2) NULL,
	[PAYT_TERMS] [varchar](4) NULL,
	[SORT_KEY] [varchar](3) NULL,
	[PAYMENT_METHODS] [varchar](10) NULL,
	[PURCHASING_ORG] [varchar](4) NULL,
	[ACC_W_VENDOR] [varchar](12) NULL,
	[PURCH_GROUP] [varchar](3) NULL,
	[INCOTERMS1] [varchar](3) NULL,
	[INCOTERMS2] [varchar](28) NULL,
	[AUTOMATIC_PO] [varchar](1) NULL,
	[DEL_FLAG_PORG] [varchar](1) NULL,
	[MINIMUM_VALUE] [decimal](13, 2) NULL,
	[TELEPHONE] [varchar](16) NULL,
	[B_VOL_COMP_AG] [varchar](1) NULL,
	[SALESPERSON] [varchar](30) NULL,
	[GR_BASED_IV] [varchar](1) NULL,
	[AUT_GRSET_RET] [varchar](1) NULL,
	[ERS] [varchar](1) NULL,
	[DESCRIPTION] [varchar](35) NULL,
	[COMMON_VENDOR_NAME] [varchar](40) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[VERSION]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[VERSION](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[VERSION] [varchar](3) NOT NULL,
	[DESCRIPTION] [varchar](30) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[WBS_ELEMENT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[WBS_ELEMENT](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[WBS_ELEMENT] [varchar](24) NOT NULL,
	[DESCRIPTION] [varchar](40) NULL,
	[CHANGED_ON] [date] NULL,
	[CHANGED_BY] [varchar](12) NULL,
	[REQ_COST_CENTER] [varchar](10) NULL,
	[CREATED_ON] [date] NULL,
	[CREATED_BY] [varchar](12) NULL,
	[RESP_COST_CNTR] [varchar](10) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[INVEST_PROFILE] [varchar](6) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[COST_OBJECT] [varchar](12) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[PROJ_TYPE] [varchar](2) NULL,
	[STATUS_COMB] [decimal](3, 0) NULL,
	[OBJECT_CLASS] [varchar](2) NULL,
	[LEVEL] [decimal](3, 0) NULL,
	[TECH_COMPLETE] [date] NULL,
	[FUND_GRANT] [varchar](20) NULL,
	[SPONSOR_PROGRAM] [varchar](20) NULL,
	[FUND_FUNDED] [varchar](1) NULL,
	[GRANT_FUND] [varchar](1) NULL,
	[PERSON_RESPONS] [varchar](25) NULL,
	[PERSON_RESPONS1] [decimal](8, 0) NULL,
	[LONG_DESCRIPTION] [varchar](150) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MD].[WORKFLOW_STATUS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MD].[WORKFLOW_STATUS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[WORKFLOW_STATUS] [varchar](60) NOT NULL,
	[DESCRIPTION] [varchar](60) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [DW_MD.MD]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_BDGT_ENTR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_BDGT_ENTR](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[ENTRY_DOCUMENT_NO] [varchar](10) NULL,
	[ENTRY_DOCUMENT_LINE] [varchar](6) NULL,
	[DOCUMENT_YEAR] [decimal](4, 0) NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[GRANT] [varchar](20) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[BCS_VALUE_TYPE] [varchar](2) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FM_VALTYPE] [decimal](2, 0) NULL,
	[BUDG_PROCESS] [varchar](4) NULL,
	[BUDGET_TYPE] [varchar](4) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YEC] [decimal](4, 0) NULL,
	[TEXT] [varchar](50) NULL,
	[DOCUMENT_FAMILY] [varchar](10) NULL,
	[BUDGETING_PROCESS] [varchar](4) NULL,
	[VERSION] [varchar](3) NULL,
	[CREATED_BY] [varchar](12) NULL,
	[CREATED_ON] [date] NULL,
	[DOCUMENT_DATE] [date] NULL,
	[POSTING_DATE] [date] NULL,
	[PERSON_RESP] [varchar](20) NULL,
	[HEADER_TEXT] [varchar](50) NULL,
	[LONG_TXT_EXISTS] [varchar](1) NULL,
	[DOCUMENT_STATUS] [varchar](1) NULL,
	[REVERSAL_STATUS] [varchar](1) NULL,
	[REVERSAL_NUMBER] [varchar](10) NULL,
	[DOCUMENT_TYPE] [varchar](4) NULL,
	[REPORTING_YEAR_FOR_COHORT] [varchar](4) NULL,
	[PUBLIC_LAW] [varchar](20) NULL,
	[LEGISLATION] [varchar](1) NULL,
	[FM_CURRENCY] [varchar](5) NOT NULL,
	[FMAC_AMOUNT] [decimal](17, 2) NULL,
	[CARRY_FORWARD_BUDGET_AMOUNT] [decimal](17, 2) NULL,
	[ORIGINAL_BUDGET_AMOUNT] [decimal](17, 2) NULL,
	[CHANGED_BUDGET_AMOUNT] [decimal](17, 2) NULL,
	[CURRENT_BUDGET_AMOUNT] [decimal](17, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[TRANSFER_AGENCY] [varchar](2) NULL,
	[TRANSFER_ACCOUNT] [varchar](4) NULL,
	[TRADING_PARTNER] [varchar](6) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[ORIGINAL_APPLICATION] [varchar](10) NULL,
	[TEXT_NAME] [varchar](32) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[REFERENCE] [varchar](16) NULL,
	[CMMT_ITEM_CAT] [decimal](1, 0) NULL,
	[DISTRIBUTION_KEY] [varchar](4) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_BDGT_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_BDGT_LNITMS](
	[DOC_CAT] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](10) NOT NULL,
	[DOC_ITEM] [varchar](6) NOT NULL,
	[REFERENC_DOC_CAT] [varchar](1) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[REFERENCE_ITEM] [decimal](6, 0) NULL,
	[REF_TRANSACTN] [varchar](4) NULL,
	[REFERENCE_YEAR] [decimal](4, 0) NULL,
	[ENTERED_ON] [date] NULL,
	[ENTERED_AT] [time](7) NULL,
	[USER_NAME] [varchar](12) NULL,
	[FM_AREA] [varchar](4) NOT NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[GRANT] [varchar](20) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[VERSION] [varchar](3) NOT NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[BCS_VALUE_TYPE] [varchar](2) NULL,
	[WORKFLOW_STATUS] [varchar](1) NULL,
	[FM_VALTYPE] [decimal](2, 0) NULL,
	[BUDG_PROCESS] [varchar](4) NULL,
	[BUDGET_TYPE] [varchar](4) NULL,
	[TEXT] [varchar](50) NULL,
	[POSTING_DATE] [date] NULL,
	[FY_VARIANT] [varchar](2) NOT NULL,
	[FY_PERIOD] [decimal](7, 0) NOT NULL,
	[YCE] [decimal](4, 0) NULL,
	[FM_CURRENCY] [varchar](5) NOT NULL,
	[FMAC_AMOUNT] [decimal](17, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_BDGT_TOT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_BDGT_TOT](
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[GRANT] [varchar](20) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[VERSION] [varchar](3) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[BCS_VALUE_TYPE] [varchar](2) NULL,
	[WORKFLOW_STATUS] [varchar](1) NULL,
	[FM_VALTYPE] [decimal](2, 0) NULL,
	[BUDG_PROCESS] [varchar](4) NULL,
	[BUDGET_TYPE] [varchar](4) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[FM_CURRENCY] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](17, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[BUDGET_PD_9] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_CMMT_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_CMMT_LNITMS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[REF_DOCUMENT_NO] [varchar](10) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REF_ITEM] [decimal](5, 0) NULL,
	[ACCT_ASSNMT_NO] [decimal](5, 0) NULL,
	[SCHEDULE_LINE] [decimal](4, 0) NULL,
	[COUNTER] [decimal](5, 0) NULL,
	[LOGICAL_SYSTEM] [varchar](10) NULL,
	[AMOUNT_TYPE] [varchar](4) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[LEVEL_NUMBER] [varchar](16) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[YEAR_OF_CASH_EFF] [decimal](4, 0) NULL,
	[FM_POSTING_DATE] [date] NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[GRANT] [varchar](20) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CHART_OF_ACCTS] [varchar](4) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[ORDER] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[PROFIT_CENTER] [varchar](10) NULL,
	[FM_VALTYPE] [varchar](60) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[BUS_TRANSACTION] [varchar](4) NULL,
	[STATISTICAL_ID] [varchar](1) NULL,
	[COMPLETION_IND] [varchar](1) NULL,
	[CF_LEVEL] [varchar](1) NULL,
	[CARRYFWDPREVYR] [decimal](2, 0) NULL,
	[VENDOR] [varchar](10) NULL,
	[ITEM_TEXT] [varchar](50) NULL,
	[POSTING_DATE] [date] NULL,
	[PRED_DOC_NO] [varchar](10) NULL,
	[PRED_DOC_ITEM] [decimal](5, 0) NULL,
	[PREDECESSOR_AA] [decimal](5, 0) NULL,
	[USER_NAME] [varchar](12) NULL,
	[BL_DOC_DATE] [date] NULL,
	[TRANSACTION_CURRENCY] [varchar](5) NULL,
	[TC_AMOUNT] [decimal](13, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[REF_DOCUMENT_CATG] [decimal](3, 0) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[LEDGER] [varchar](2) NULL,
	[FYC_STATUS] [decimal](2, 0) NULL,
	[TRANSACTION_NO] [varchar](16) NULL,
	[BL_DOCUMENT_TYPE] [varchar](4) NULL,
	[ENTERED_ON] [date] NULL,
	[ENTERED_AT] [varchar](25) NULL,
	[TRANSACTION_CODE] [varchar](20) NULL,
	[QUANT_OPEN] [decimal](13, 3) NULL,
	[QUANT_INV] [decimal](13, 3) NULL,
	[BASE_UNIT] [varchar](3) NULL,
	[OBJECT_NUMBER_1] [varchar](22) NULL,
	[PREDECESSOR_DT] [decimal](3, 0) NULL,
	[PRED_ORG] [varchar](10) NULL,
	[REF_TRANSACTN_1] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](13, 2) NULL,
	[ENCUMBRANCE_AMOUNT] [decimal](13, 2) NULL,
	[PRE_ENCUMBRANCE_AMOUNT] [decimal](13, 2) NULL,
	[FM_AREA_CURR] [varchar](5) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_CMMT_LNITMS_DUPS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_CMMT_LNITMS_DUPS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[REF_DOCUMENT_NO] [varchar](10) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REF_ITEM] [decimal](5, 0) NULL,
	[ACCT_ASSNMT_NO] [decimal](5, 0) NULL,
	[SCHEDULE_LINE] [decimal](4, 0) NULL,
	[COUNTER] [decimal](5, 0) NULL,
	[LOGICAL_SYSTEM] [varchar](10) NULL,
	[AMOUNT_TYPE] [varchar](4) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[LEVEL_NUMBER] [varchar](16) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[YEAR_OF_CASH_EFF] [decimal](4, 0) NULL,
	[FM_POSTING_DATE] [date] NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[GRANT] [varchar](20) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CHART_OF_ACCTS] [varchar](4) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[ORDER] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[PROFIT_CENTER] [varchar](10) NULL,
	[FM_VALTYPE] [varchar](60) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[BUS_TRANSACTION] [varchar](4) NULL,
	[STATISTICAL_ID] [varchar](1) NULL,
	[COMPLETION_IND] [varchar](1) NULL,
	[CF_LEVEL] [varchar](1) NULL,
	[CARRYFWDPREVYR] [decimal](2, 0) NULL,
	[VENDOR] [varchar](10) NULL,
	[ITEM_TEXT] [varchar](50) NULL,
	[POSTING_DATE] [date] NULL,
	[PRED_DOC_NO] [varchar](10) NULL,
	[PRED_DOC_ITEM] [decimal](5, 0) NULL,
	[PREDECESSOR_AA] [decimal](5, 0) NULL,
	[USER_NAME] [varchar](12) NULL,
	[BL_DOC_DATE] [date] NULL,
	[TRANSACTION_CURRENCY] [varchar](5) NULL,
	[TC_AMOUNT] [decimal](13, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[REF_DOCUMENT_CATG] [decimal](3, 0) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[LEDGER] [varchar](2) NULL,
	[FYC_STATUS] [decimal](2, 0) NULL,
	[TRANSACTION_NO] [varchar](16) NULL,
	[BL_DOCUMENT_TYPE] [varchar](4) NULL,
	[ENTERED_ON] [date] NULL,
	[ENTERED_AT] [varchar](25) NULL,
	[TRANSACTION_CODE] [varchar](20) NULL,
	[QUANT_OPEN] [decimal](13, 3) NULL,
	[QUANT_INV] [decimal](13, 3) NULL,
	[BASE_UNIT] [varchar](3) NULL,
	[OBJECT_NUMBER_1] [varchar](22) NULL,
	[PREDECESSOR_DT] [decimal](3, 0) NULL,
	[PRED_ORG] [varchar](10) NULL,
	[REF_TRANSACTN_1] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](13, 2) NULL,
	[ENCUMBRANCE_AMOUNT] [decimal](13, 2) NULL,
	[PRE_ENCUMBRANCE_AMOUNT] [decimal](13, 2) NULL,
	[FM_AREA_CURR] [varchar](5) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_FI_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_FI_LNITMS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[FM_DOC_NO] [varchar](10) NULL,
	[FM_ITEM] [decimal](3, 0) NULL,
	[AMOUNT_TYPE] [varchar](4) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[LEVEL_NUMBER] [varchar](16) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[YEAR_OF_CASH_EFF] [decimal](4, 0) NULL,
	[FM_POSTING_DATE] [date] NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[GRANT] [varchar](20) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CHART_OF_ACCOUNTS] [varchar](4) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[ORDER] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[PROFIT_CENTER] [varchar](10) NULL,
	[FM_VALTYPE] [varchar](60) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[BUS_TRANSACTION] [varchar](4) NULL,
	[STATISTICAL_ID] [varchar](1) NULL,
	[CF_LEVEL] [varchar](1) NULL,
	[CARRYFWDPREVYR] [decimal](2, 0) NULL,
	[VENDOR] [varchar](10) NULL,
	[CUSTOMER] [varchar](10) NULL,
	[TEXT] [varchar](50) NULL,
	[CANCEL_ID] [varchar](1) NULL,
	[DOCUMENT_TYPE] [varchar](2) NULL,
	[POSTING_DATE] [date] NULL,
	[PMNT_DOC_COMP_CODE] [varchar](4) NULL,
	[FY_PMNT_DOC] [decimal](4, 0) NULL,
	[PAYMENT_DOC_NO] [varchar](10) NULL,
	[PMNT_DOC_NO_ITEM] [decimal](3, 0) NULL,
	[FI_DOC_NO_FY] [decimal](4, 0) NULL,
	[FI_DOCUMENT_NO] [varchar](10) NULL,
	[FI_DOCUMENT_ITEM] [decimal](3, 0) NULL,
	[PRED_DOC_NO] [varchar](10) NULL,
	[PRED_DOC_ITEM] [decimal](5, 0) NULL,
	[PRED_ORG] [varchar](10) NULL,
	[PREDECESSOR_AA] [decimal](5, 0) NULL,
	[FM_AREA_CURR] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](13, 2) NULL,
	[EXPENDITURE_AMOUNT] [decimal](13, 2) NULL,
	[TRANS_CURRENCY] [varchar](5) NULL,
	[TC_AMOUNT] [decimal](13, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[PAYMENT_STATUS] [varchar](1) NULL,
	[LEDGER] [varchar](2) NULL,
	[TRANACTION_NO] [varchar](16) NULL,
	[POSTING_DAY] [date] NULL,
	[OBJECT_NUMBER_1] [varchar](22) NULL,
	[BASE_UNIT] [varchar](3) NULL,
	[REFERENCE_KEY_3] [varchar](20) NULL,
	[PREDECESSOR_DT] [decimal](3, 0) NULL,
	[REF_TRANSACTN_1] [varchar](5) NULL,
	[REF_DOCUMENT_NO] [varchar](10) NULL,
	[DOCUMENT_DATE] [date] NULL,
	[DOC_HEADER_TEXT] [varchar](25) NULL,
	[REFFISCALYEAR] [decimal](4, 0) NULL,
	[DELINDICTR] [varchar](1) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REFCOMPANYCODE] [varchar](4) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_FI_LNITMS_DUPS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_FI_LNITMS_DUPS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[FM_DOC_NO] [varchar](10) NULL,
	[FM_ITEM] [decimal](3, 0) NULL,
	[AMOUNT_TYPE] [varchar](4) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[LEVEL_NUMBER] [varchar](16) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[YEAR_OF_CASH_EFF] [decimal](4, 0) NULL,
	[FM_POSTING_DATE] [date] NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[GRANT] [varchar](20) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CHART_OF_ACCOUNTS] [varchar](4) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[ORDER] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[PROFIT_CENTER] [varchar](10) NULL,
	[FM_VALTYPE] [varchar](60) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[BUS_TRANSACTION] [varchar](4) NULL,
	[STATISTICAL_ID] [varchar](1) NULL,
	[CF_LEVEL] [varchar](1) NULL,
	[CARRYFWDPREVYR] [decimal](2, 0) NULL,
	[VENDOR] [varchar](10) NULL,
	[CUSTOMER] [varchar](10) NULL,
	[TEXT] [varchar](50) NULL,
	[CANCEL_ID] [varchar](1) NULL,
	[DOCUMENT_TYPE] [varchar](2) NULL,
	[POSTING_DATE] [date] NULL,
	[PMNT_DOC_COMP_CODE] [varchar](4) NULL,
	[FY_PMNT_DOC] [decimal](4, 0) NULL,
	[PAYMENT_DOC_NO] [varchar](10) NULL,
	[PMNT_DOC_NO_ITEM] [decimal](3, 0) NULL,
	[FI_DOC_NO_FY] [decimal](4, 0) NULL,
	[FI_DOCUMENT_NO] [varchar](10) NULL,
	[FI_DOCUMENT_ITEM] [decimal](3, 0) NULL,
	[PRED_DOC_NO] [varchar](10) NULL,
	[PRED_DOC_ITEM] [decimal](5, 0) NULL,
	[PRED_ORG] [varchar](10) NULL,
	[PREDECESSOR_AA] [decimal](5, 0) NULL,
	[FM_AREA_CURR] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](13, 2) NULL,
	[EXPENDITURE_AMOUNT] [decimal](13, 2) NULL,
	[TRANS_CURRENCY] [varchar](5) NULL,
	[TC_AMOUNT] [decimal](13, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[PAYMENT_STATUS] [varchar](1) NULL,
	[LEDGER] [varchar](2) NULL,
	[TRANACTION_NO] [varchar](16) NULL,
	[POSTING_DAY] [date] NULL,
	[OBJECT_NUMBER_1] [varchar](22) NULL,
	[BASE_UNIT] [varchar](3) NULL,
	[REFERENCE_KEY_3] [varchar](20) NULL,
	[PREDECESSOR_DT] [decimal](3, 0) NULL,
	[REF_TRANSACTN_1] [varchar](5) NULL,
	[REF_DOCUMENT_NO] [varchar](10) NULL,
	[DOCUMENT_DATE] [date] NULL,
	[DOC_HEADER_TEXT] [varchar](25) NULL,
	[REFFISCALYEAR] [decimal](4, 0) NULL,
	[DELINDICTR] [varchar](1) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REFCOMPANYCODE] [varchar](4) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_FI_LNITMS_X]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_FI_LNITMS_X](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[FM_DOC_NO] [varchar](10) NULL,
	[FM_ITEM] [decimal](3, 0) NULL,
	[AMOUNT_TYPE] [varchar](4) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[LEVEL_NUMBER] [varchar](16) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[YEAR_OF_CASH_EFF] [decimal](4, 0) NULL,
	[FM_POSTING_DATE] [date] NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[GRANT] [varchar](20) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CHART_OF_ACCOUNTS] [varchar](4) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[ORDER] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[PROFIT_CENTER] [varchar](10) NULL,
	[FM_VALTYPE] [varchar](60) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[BUS_TRANSACTION] [varchar](4) NULL,
	[STATISTICAL_ID] [varchar](1) NULL,
	[CF_LEVEL] [varchar](1) NULL,
	[CARRYFWDPREVYR] [decimal](2, 0) NULL,
	[VENDOR] [varchar](10) NULL,
	[CUSTOMER] [varchar](10) NULL,
	[TEXT] [varchar](50) NULL,
	[CANCEL_ID] [varchar](1) NULL,
	[DOCUMENT_TYPE] [varchar](2) NULL,
	[POSTING_DATE] [date] NULL,
	[PMNT_DOC_COMP_CODE] [varchar](4) NULL,
	[FY_PMNT_DOC] [decimal](4, 0) NULL,
	[PAYMENT_DOC_NO] [varchar](10) NULL,
	[PMNT_DOC_NO_ITEM] [decimal](3, 0) NULL,
	[FI_DOC_NO_FY] [decimal](4, 0) NULL,
	[FI_DOCUMENT_NO] [varchar](10) NULL,
	[FI_DOCUMENT_ITEM] [decimal](3, 0) NULL,
	[PRED_DOC_NO] [varchar](10) NULL,
	[PRED_DOC_ITEM] [decimal](5, 0) NULL,
	[PRED_ORG] [varchar](10) NULL,
	[PREDECESSOR_AA] [decimal](5, 0) NULL,
	[FM_AREA_CURR] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](13, 2) NULL,
	[EXPENDITURE_AMOUNT] [decimal](13, 2) NULL,
	[TRANS_CURRENCY] [varchar](5) NULL,
	[TC_AMOUNT] [decimal](13, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[PAYMENT_STATUS] [varchar](1) NULL,
	[LEDGER] [varchar](2) NULL,
	[TRANACTION_NO] [varchar](16) NULL,
	[POSTING_DAY] [date] NULL,
	[OBJECT_NUMBER_1] [varchar](22) NULL,
	[BASE_UNIT] [varchar](3) NULL,
	[REFERENCE_KEY_3] [varchar](20) NULL,
	[PREDECESSOR_DT] [decimal](3, 0) NULL,
	[REF_TRANSACTN_1] [varchar](5) NULL,
	[REF_DOCUMENT_NO] [varchar](10) NULL,
	[DOCUMENT_DATE] [date] NULL,
	[DOC_HEADER_TEXT] [varchar](25) NULL,
	[REFFISCALYEAR] [decimal](4, 0) NULL,
	[DELINDICTR] [varchar](1) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REFCOMPANYCODE] [varchar](4) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[FM_PARKED_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[FM_PARKED_LNITMS](
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[DOCUMENT_NUMBER] [varchar](20) NULL,
	[FM_DOC_NO] [varchar](10) NULL,
	[FM_ITEM] [decimal](3, 0) NULL,
	[AMOUNT_TYPE] [varchar](4) NULL,
	[BUDGET_CATEGORY] [decimal](1, 0) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NULL,
	[LEVEL_NUMBER] [varchar](16) NULL,
	[FY_VARIANT] [varchar](2) NULL,
	[FY_PERIOD] [decimal](7, 0) NULL,
	[YCE] [decimal](4, 0) NULL,
	[YEAR_OF_CASH_EFF] [decimal](4, 0) NULL,
	[FM_POSTING_DATE] [date] NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUND] [varchar](10) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[GRANT] [varchar](20) NULL,
	[CUSTOMER_FIELD] [varchar](10) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[CHART_OF_ACCOUNTS] [varchar](4) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[ORDER] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[PROFIT_CENTER] [varchar](10) NULL,
	[FM_VALTYPE] [varchar](60) NULL,
	[VALUE_TYPE] [varchar](60) NULL,
	[BUS_TRANSACTION] [varchar](4) NULL,
	[STATISTICAL_ID] [varchar](1) NULL,
	[CF_LEVEL] [varchar](1) NULL,
	[CARRYFWDPREVYR] [decimal](2, 0) NULL,
	[VENDOR] [varchar](10) NULL,
	[CUSTOMER] [varchar](10) NULL,
	[TEXT] [varchar](50) NULL,
	[CANCEL_ID] [varchar](1) NULL,
	[DOCUMENT_TYPE] [varchar](2) NULL,
	[POSTING_DATE] [date] NULL,
	[PMNT_DOC_COMP_CODE] [varchar](4) NULL,
	[FY_PMNT_DOC] [decimal](4, 0) NULL,
	[PAYMENT_DOC_NO] [varchar](10) NULL,
	[PMNT_DOC_NO_ITEM] [decimal](3, 0) NULL,
	[FI_DOC_NO_FY] [decimal](4, 0) NULL,
	[FI_DOCUMENT_NO] [varchar](10) NULL,
	[FI_DOCUMENT_ITEM] [decimal](3, 0) NULL,
	[PRED_DOC_NO] [varchar](10) NULL,
	[PRED_DOC_ITEM] [decimal](5, 0) NULL,
	[PRED_ORG] [varchar](10) NULL,
	[PREDECESSOR_AA] [decimal](5, 0) NULL,
	[FM_AREA_CURR] [varchar](5) NULL,
	[FMAC_AMOUNT] [decimal](13, 2) NULL,
	[PARKED_DOCS_AMOUNT] [decimal](13, 2) NULL,
	[TRANS_CURRENCY] [varchar](5) NULL,
	[TC_AMOUNT] [decimal](13, 2) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[OBJECT_NUMBER] [varchar](22) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[BUDGET_PERIOD] [varchar](10) NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[PAYMENT_STATUS] [varchar](1) NULL,
	[LEDGER] [varchar](2) NULL,
	[TRANACTION_NO] [varchar](16) NULL,
	[POSTING_DAY] [date] NULL,
	[OBJECT_NUMBER_1] [varchar](22) NULL,
	[BASE_UNIT] [varchar](3) NULL,
	[REFERENCE_KEY_3] [varchar](20) NULL,
	[PREDECESSOR_DT] [decimal](3, 0) NULL,
	[REF_TRANSACTN_1] [varchar](5) NULL,
	[REF_DOCUMENT_NO] [varchar](10) NULL,
	[DOCUMENT_DATE] [date] NULL,
	[DOC_HEADER_TEXT] [varchar](25) NULL,
	[REFFISCALYEAR] [decimal](4, 0) NULL,
	[DELINDICTR] [varchar](1) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REFCOMPANYCODE] [varchar](4) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.FM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TD].[GM_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TD].[GM_LNITMS](
	[DI_SEQUENCE_NUMBER] [int] NULL,
	[DI_OPERATION_TYPE] [varchar](1) NULL,
	[DATA_AS_OF_DATE] [date] NULL,
	[DS_INSERT_DATE] [date] NULL,
	[DS_INSERT_TIME] [datetime2](7) NULL,
	[DW_STATUS_IND] [varchar](1) NULL,
	[BUSINESS_TRANS] [varchar](4) NULL,
	[ASSET] [varchar](12) NULL,
	[SUB-NUMBER] [varchar](4) NULL,
	[REFERENC_ORG_UN] [varchar](10) NULL,
	[REF_TRANSACTN] [varchar](5) NULL,
	[DOCUMENT_NUMBER] [varchar](10) NULL,
	[BILLING_BLOCK] [varchar](1) NULL,
	[BILLING_STATUS] [varchar](1) NULL,
	[POSTING_DATE] [date] NULL,
	[BUSINESS_AREA] [varchar](4) NULL,
	[LINE_ITEM] [decimal](3, 0) NULL,
	[CO_AREA] [varchar](4) NULL,
	[COMMITMENT_ITEM] [varchar](24) NULL,
	[COST_CENTER] [varchar](10) NULL,
	[COUNTER] [decimal](8, 0) NULL,
	[ENTERED_ON] [date] NULL,
	[ENTERED_AT] [varchar](25) NULL,
	[TECHNICAL_ORIGIN] [varchar](1) NULL,
	[DOCUMENT_TYPE] [varchar](1) NOT NULL,
	[DOC_LINE_ITEM] [varchar](6) NOT NULL,
	[ACC_DOC_NUMBER] [varchar](10) NOT NULL,
	[FISL_DOC_TYPE] [varchar](2) NULL,
	[COMPLETION_IND] [varchar](1) NULL,
	[FUNCTIONAL_AREA] [varchar](16) NULL,
	[FM_AREA] [varchar](4) NULL,
	[FUNDS_CENTER] [varchar](16) NULL,
	[GL_ACCOUNT] [varchar](10) NULL,
	[ITEM_CATEGORY] [varchar](5) NULL,
	[DELINDICTR] [varchar](1) NULL,
	[MATERIAL] [varchar](18) NULL,
	[FUNDED_PROGRAM] [varchar](24) NULL,
	[NETWORK] [varchar](12) NULL,
	[PREV_REF_KEY] [varchar](20) NULL,
	[REFERENC_ORG_UN1] [varchar](10) NULL,
	[REFERENCE_ITEM] [varchar](10) NULL,
	[REF_PROCEDURE] [varchar](5) NULL,
	[ORDER] [varchar](12) NULL,
	[POSTING_PERIOD] [decimal](3, 0) NULL,
	[BUDGET_VALIDITY_NO] [varchar](3) NULL,
	[COMPANY_CODE] [varchar](4) NULL,
	[REF_TRANSACTN1] [varchar](4) NULL,
	[REFERENCE_KEY] [varchar](20) NULL,
	[REFERENC_DOC_CAT] [varchar](1) NULL,
	[REFERENCE_ITEM1] [decimal](6, 0) NULL,
	[REF_DOCUMENT] [varchar](10) NULL,
	[REFERENCE_YEAR] [decimal](4, 0) NULL,
	[FUND] [varchar](10) NULL,
	[GRANT] [varchar](20) NULL,
	[GRANTEE_FY] [decimal](4, 0) NULL,
	[PLAN_NO_F_OPER] [decimal](10, 0) NULL,
	[SPONSORED_CLASS] [varchar](20) NULL,
	[SPONSORED_PROGRAM] [varchar](20) NULL,
	[STAT_INDICATOR] [varchar](1) NULL,
	[CURRENCY] [varchar](5) NOT NULL,
	[BUSINESS_TRANS1] [varchar](4) NULL,
	[GM_VALUE_TYPE] [varchar](2) NULL,
	[VERSION] [varchar](3) NULL,
	[OR_TRANS_CURRNY] [varchar](5) NULL,
	[FISCAL_YEAR] [decimal](4, 0) NOT NULL,
	[TEXT] [varchar](50) NULL,
	[USER_NAME] [varchar](12) NULL,
	[WBS_ELEMENT] [varchar](24) NULL,
	[WBS_ELEMENT_SH] [decimal](8, 0) NULL,
	[VALUE_DATE] [date] NULL,
	[CHANGED] [varchar](1) NULL,
	[FY_PERIOD] [decimal](7, 0) NOT NULL,
	[FY_VARIANT] [varchar](2) NOT NULL,
	[QUANTITY] [decimal](15, 3) NULL,
	[AMOUNT] [decimal](17, 2) NULL,
	[ODQ_CHANGEMODE] [varchar](1) NULL,
	[ODQ_ENTITYCNTR] [decimal](19, 0) NULL,
	[SOURCEEFFTIMESTAMP] [datetime] NULL,
	[SOURCEBATCHPROCESSID] [varchar](20) NULL,
	[SOURCERECORDSTATUS] [char](1) NULL
) ON [DW_TD.GM]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [FM].[V_FM_CMMTS_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [FM].[V_FM_CMMTS_LNITMS]
AS
/*
SELECT 
      CMMT.[DATA_AS_OF_DATE]
      ,CMMT.[DS_INSERT_DATE]
      ,CMMT.[DS_INSERT_TIME]
      ,CMMT.[DW_STATUS_IND]
	  ,CMMT.[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),CMMT.[REF_ITEM]) AS DOCUMENT_NUMBER
	  ,CMMT.[REF_DOCUMENT_NO]
      ,CMMT.[REFERENC_ORG_UN]
      ,CMMT.[REF_ITEM]
      ,CMMT.[ACCT_ASSNMT_NO]
      ,CMMT.[SCHEDULE_LINE]
      ,CMMT.[COUNTER]
      ,CMMT.[LOGICAL_SYSTEM]
      ,CMMT.[AMOUNT_TYPE]
      ,CMMT.[BUDGET_CATEGORY]
      ,CMMT.[FISCAL_YEAR]
      ,CMMT.[LEVEL_NUMBER]
      ,CMMT.[FY_VARIANT]
      ,CMMT.[FY_PERIOD]
      ,CMMT.[YCE]
      ,CMMT.[YEAR_OF_CASH_EFF]
      ,CONVERT(VARCHAR(8), CMMT.FM_POSTING_DATE, 112) AS CMMT_POSTING_DATE
      ,CMMT.[FM_AREA]
      ,CMMT.[FUND]
      ,CMMT.[FUNDS_CENTER]
      ,CMMT.[COMMITMENT_ITEM]
      ,CMMT.[FUNCTIONAL_AREA]
      ,CMMT.[FUNDED_PROGRAM]
      ,CMMT.[GRANT]
      ,CMMT.[CUSTOMER_FIELD]
      ,CMMT.[COMPANY_CODE]
      ,CMMT.[CHART_OF_ACCTS]
      ,CMMT.[GL_ACCOUNT]
      ,CMMT.[CO_AREA]
      ,CMMT.[COST_CENTER]
      ,ISNULL(ORD.[ORDER],'--') AS [ORDER]
      ,ISNULL(WBS.WBS_ELEMENT,'--') AS [WBS_ELEMENT]
      ,CMMT.[PROFIT_CENTER]
      ,CMMT.[FM_VALTYPE]
      ,CMMT.[VALUE_TYPE]
      ,CMMT.[BUS_TRANSACTION]
      ,CASE WHEN CMMT.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID]
      ,CMMT.[COMPLETION_IND]
      ,CMMT.[CF_LEVEL]
      ,CMMT.[CARRYFWDPREVYR]
      ,CMMT.[VENDOR]
      ,CMMT.[ITEM_TEXT] 
      ,CONVERT(VARCHAR(8), CMMT.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,CMMT.[PRED_DOC_NO]
      ,CMMT.[PRED_DOC_ITEM]
      ,CMMT.[PREDECESSOR_AA]
      ,CMMT.[USER_NAME]
      ,CONVERT(VARCHAR(8), CMMT.[BL_DOC_DATE], 112) AS [BL_DOC_DATE]
	  ,CMMT.TRANSACTION_CURRENCY
	  ,CMMT.TC_AMOUNT
	  ,CMMT.ARCHIVE
	  ,CMMT.OBJECT_NUMBER
	  ,CMMT.BUDGET_PERIOD
	  ,CMMT.BUSINESS_AREA
	  ,CMMT.REF_DOCUMENT_CATG
	  ,CMMT.REF_TRANSACTN
	  ,CMMT.LEDGER
	  ,CMMT.FYC_STATUS
	  ,CMMT.TRANSACTION_NO
	  ,CMMT.BL_DOCUMENT_TYPE
	  ,CMMT.ENTERED_ON
      ,CMMT.ENTERED_AT
	  ,CMMT.TRANSACTION_CODE
	  ,CMMT.QUANT_OPEN
	  ,CMMT.QUANT_INV
	  ,CMMT.BASE_UNIT
	  ,CMMT.OBJECT_NUMBER_1
	  ,CMMT.PREDECESSOR_DT
	  ,CMMT.PRED_ORG
	  ,CMMT.REF_TRANSACTN_1
	  ,CMMT.FMAC_AMOUNT
	  ,CMMT.FM_AREA_CURR
	  ,CMMT.ODQ_CHANGEMODE
	  ,CMMT.ODQ_ENTITYCNTR

  FROM [STG_TD_SYN].[FM_CMMT_LNITMS] CMMT
  LEFT JOIN 
  (
  SELECT OBJECT_NUMBER, [REF_DOCUMENT_NO], [REF_ITEM],[ACCT_ASSNMT_NO]
  FROM  [STG_TD_SYN].[CO_CMMT_LNITMS] CO
  WHERE  LEFT(CO.OBJECT_NUMBER,2)='PR' OR  LEFT(CO.OBJECT_NUMBER,2)='OR'


  ) CO
  ON CMMT.REF_DOCUMENT_NO=CO.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=CO.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=CO.ACCT_ASSNMT_NO

LEFT JOIN STG_MD_SYN.WBS_ELEMENT WBS ON CO.OBJECT_NUMBER=WBS.OBJECT_NUMBER
LEFT JOIN STG_MD_SYN.[ORDER] ORD ON CO.OBJECT_NUMBER=ORD.OBJECT_NUMBER;

*/

SELECT 
      CMMT.[DATA_AS_OF_DATE]
      ,CMMT.[DS_INSERT_DATE]
      ,CMMT.[DS_INSERT_TIME]
      ,CMMT.[DW_STATUS_IND]
	  ,CMMT.[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),CMMT.[REF_ITEM]) AS DOCUMENT_NUMBER
	  ,CMMT.[REF_DOCUMENT_NO]
      ,CMMT.[REFERENC_ORG_UN]
      ,CMMT.[REF_ITEM]
      ,CMMT.[ACCT_ASSNMT_NO]
      ,CMMT.[SCHEDULE_LINE]
      ,CMMT.[COUNTER]
      ,CMMT.[LOGICAL_SYSTEM]
      ,CMMT.[AMOUNT_TYPE]
      ,CMMT.[BUDGET_CATEGORY]
      ,CMMT.[FISCAL_YEAR]
      ,CMMT.[LEVEL_NUMBER]
      ,CMMT.[FY_VARIANT]
      ,CMMT.[FY_PERIOD]
      ,CMMT.[YCE]
      ,CMMT.[YEAR_OF_CASH_EFF]
      ,CONVERT(VARCHAR(8), CMMT.FM_POSTING_DATE, 112) AS CMMT_POSTING_DATE
      ,CMMT.[FM_AREA]
      ,CMMT.[FUND]
      ,CMMT.[FUNDS_CENTER]
      ,CMMT.[COMMITMENT_ITEM]
      ,CMMT.[FUNCTIONAL_AREA]
      ,CMMT.[FUNDED_PROGRAM]
      ,CMMT.[GRANT]
      ,CMMT.[CUSTOMER_FIELD]
      ,CMMT.[COMPANY_CODE]
      ,CMMT.[CHART_OF_ACCTS]
      ,CMMT.[GL_ACCOUNT]
      ,CMMT.[CO_AREA]
      ,CMMT.[COST_CENTER]
	  ,ISNULL(ORD.[ORDER],'--') AS [ORDER]
      ,ISNULL(LEFT(RTRIM(LTRIM(WBS.WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS.WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS.WBS_ELEMENT)),9,3),'--') AS WBS_ELEMENT
      ,CMMT.[PROFIT_CENTER]
      ,CMMT.[FM_VALTYPE]
      ,CMMT.[VALUE_TYPE]
      ,CMMT.[BUS_TRANSACTION]
      ,CASE WHEN CMMT.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID]
      ,CMMT.[COMPLETION_IND]
      ,CMMT.[CF_LEVEL]
      ,CMMT.[CARRYFWDPREVYR]
      ,CMMT.[VENDOR]
      ,CMMT.[ITEM_TEXT] 
      ,CONVERT(VARCHAR(8), CMMT.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,CMMT.[PRED_DOC_NO]
      ,CMMT.[PRED_DOC_ITEM]
      ,CMMT.[PREDECESSOR_AA]
      ,CMMT.[USER_NAME]
      ,CONVERT(VARCHAR(8), CMMT.[BL_DOC_DATE], 112) AS [BL_DOC_DATE]
	  ,CMMT.TRANSACTION_CURRENCY
	  ,CMMT.TC_AMOUNT
	  ,CMMT.ARCHIVE
	  ,CMMT.OBJECT_NUMBER
	  ,CMMT.BUDGET_PERIOD
	  ,CMMT.BUSINESS_AREA
	  ,CMMT.REF_DOCUMENT_CATG
	  ,CMMT.REF_TRANSACTN
	  ,CMMT.LEDGER
	  ,CMMT.FYC_STATUS
	  ,CMMT.TRANSACTION_NO
	  ,CMMT.BL_DOCUMENT_TYPE
	  ,CMMT.ENTERED_ON
      ,CMMT.ENTERED_AT
	  ,CMMT.TRANSACTION_CODE
	  ,CMMT.QUANT_OPEN
	  ,CMMT.QUANT_INV
	  ,CMMT.BASE_UNIT
	  ,CMMT.OBJECT_NUMBER_1
	  ,CMMT.PREDECESSOR_DT
	  ,CMMT.PRED_ORG
	  ,CMMT.REF_TRANSACTN_1
	  ,CMMT.FMAC_AMOUNT
	  ,CMMT.FM_AREA_CURR
	  ,CMMT.ODQ_CHANGEMODE
	  ,CMMT.ODQ_ENTITYCNTR

  FROM [STG_TD_SYN].[FM_CMMT_LNITMS] CMMT
  LEFT JOIN   [STG_TD_SYN].[CO_CMMT_LNITMS_ORDER] ORD ON 
     CMMT.REF_DOCUMENT_NO=ORD.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=ORD.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=ORD.ACCT_ASSNMT_NO
  LEFT JOIN [STG_TD_SYN].[CO_CMMT_LNITMS_WBS] WBS ON 
     CMMT.REF_DOCUMENT_NO=WBS.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=WBS.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=WBS.ACCT_ASSNMT_NO









GO
/****** Object:  View [FM].[V_FM_CMMT_LNITMS_DUPS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FM].[V_FM_CMMT_LNITMS_DUPS]
AS    
SELECT [REF_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER], COUNT(*) AS CNT
FROM  [FM].[V_FM_CMMTS_LNITMS]	
GROUP BY [REF_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER]
HAVING COUNT(*)>1


GO
/****** Object:  View [FM].[V_FM_CMMT_LNITMS_DUPS_ALL_ATTR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [FM].[V_FM_CMMT_LNITMS_DUPS_ALL_ATTR]
AS   

SELECT 

       CMMT1.[DATA_AS_OF_DATE]
      ,CMMT1.[DS_INSERT_DATE]
      ,CMMT1.[DS_INSERT_TIME]
      ,CMMT1.[DW_STATUS_IND]
	  ,CMMT1.[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),CMMT1.[REF_ITEM]) AS DOCUMENT_NUMBER
	  ,CMMT1.[REF_DOCUMENT_NO]
      ,CMMT1.[REFERENC_ORG_UN]
      ,CMMT1.[REF_ITEM]
      ,CMMT1.[ACCT_ASSNMT_NO]
      ,CMMT1.[SCHEDULE_LINE]
      ,CMMT1.[COUNTER]
      ,CMMT1.[LOGICAL_SYSTEM]
      ,CMMT1.[AMOUNT_TYPE]
      ,CMMT1.[BUDGET_CATEGORY]
      ,CMMT1.[FISCAL_YEAR]
      ,CMMT1.[LEVEL_NUMBER]
      ,CMMT1.[FY_VARIANT]
      ,CMMT1.[FY_PERIOD]
      ,CMMT1.[YCE]
      ,CMMT1.[YEAR_OF_CASH_EFF]
      ,CMMT1.[FM_AREA]
      ,CMMT1.[FUND]
      ,CMMT1.[FUNDS_CENTER]
      ,CMMT1.[COMMITMENT_ITEM]
      ,CMMT1.[FUNCTIONAL_AREA]
      ,CMMT1.[FUNDED_PROGRAM]
      ,CMMT1.[GRANT]
      ,CMMT1.[CUSTOMER_FIELD]
      ,CMMT1.[COMPANY_CODE]
      ,CMMT1.[CHART_OF_ACCTS]
      ,CMMT1.[GL_ACCOUNT]
      ,CMMT1.[CO_AREA]
      ,CMMT1.[COST_CENTER]
	  ,ISNULL(CMMT1.[ORDER],'--') AS [ORDER]
      ,ISNULL(LEFT(RTRIM(LTRIM(CMMT1.WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(CMMT1.WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(CMMT1.WBS_ELEMENT)),9,3),'--') AS WBS_ELEMENT
      ,CMMT1.[PROFIT_CENTER]
      ,CMMT1.[FM_VALTYPE]
      ,CMMT1.[VALUE_TYPE]
      ,CMMT1.[BUS_TRANSACTION]
      ,CASE WHEN CMMT1.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID]
      ,CMMT1.[COMPLETION_IND]
      ,CMMT1.[CF_LEVEL]
      ,CMMT1.[CARRYFWDPREVYR]
      ,CMMT1.[VENDOR]
      ,CMMT1.[ITEM_TEXT] 
      ,CONVERT(VARCHAR(8), CMMT1.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,CMMT1.[PRED_DOC_NO]
      ,CMMT1.[PRED_DOC_ITEM]
      ,CMMT1.[PREDECESSOR_AA]
      ,CMMT1.[USER_NAME]
      ,CONVERT(VARCHAR(8), CMMT1.[BL_DOC_DATE], 112) AS [BL_DOC_DATE]
	  ,CMMT1.TRANSACTION_CURRENCY
	  ,CMMT1.TC_AMOUNT
	  ,CMMT1.ARCHIVE
	  ,CMMT1.OBJECT_NUMBER
	  ,CMMT1.BUDGET_PERIOD
	  ,CMMT1.BUSINESS_AREA
	  ,CMMT1.REF_DOCUMENT_CATG
	  ,CMMT1.REF_TRANSACTN
	  ,CMMT1.LEDGER
	  ,CMMT1.FYC_STATUS
	  ,CMMT1.TRANSACTION_NO
	  ,CMMT1.BL_DOCUMENT_TYPE
	  ,CMMT1.ENTERED_ON
      ,CMMT1.ENTERED_AT
	  ,CMMT1.TRANSACTION_CODE
	  ,CMMT1.QUANT_OPEN
	  ,CMMT1.QUANT_INV
	  ,CMMT1.BASE_UNIT
	  ,CMMT1.OBJECT_NUMBER_1
	  ,CMMT1.PREDECESSOR_DT
	  ,CMMT1.PRED_ORG
	  ,CMMT1.REF_TRANSACTN_1
	  ,CMMT1.FMAC_AMOUNT
	  ,CMMT1.FM_AREA_CURR
	  ,CMMT1.ODQ_CHANGEMODE
	  ,CMMT1.ODQ_ENTITYCNTR
	  ,CMMT2.CNT


FROM  [FM].[V_FM_CMMTS_LNITMS] CMMT1 JOIN  (
SELECT [REF_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER], COUNT(*) AS CNT
FROM  [FM].[V_FM_CMMTS_LNITMS]	
GROUP BY [REF_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER]
HAVING COUNT(*)>1) CMMT2 ON
CMMT1.[REF_DOCUMENT_NO]=CMMT2.[REF_DOCUMENT_NO] AND
CMMT1.[FY_PERIOD]=CMMT2.[FY_PERIOD] AND
CMMT1.[LEVEL_NUMBER]=CMMT2.[LEVEL_NUMBER] 



GO
/****** Object:  View [FM].[V_FM_FI_LNITMS_DUPS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [FM].[V_FM_FI_LNITMS_DUPS]
AS    
SELECT [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER], COUNT(*) AS CNT
FROM  [TD].[FM_FI_LNITMS]	
GROUP BY [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER]
HAVING COUNT(*)>1

GO
/****** Object:  StoredProcedure [DW].[uspFOCUS_FM_MSTR_POST]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DW].[uspFOCUS_FM_MSTR_POST]
AS

GO
/****** Object:  StoredProcedure [DW].[uspFOCUS_FM_MSTR_PREP]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DW].[uspFOCUS_FM_MSTR_PREP]
AS

GO
/****** Object:  StoredProcedure [ETL].[uspFOCUS_ARCH_CNTRL]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[uspFOCUS_ARCH_CNTRL]
AS

INSERT [ETL].[CNTRL_ARCHIVE] (
            [SUBJECT_AREA]
           ,[OBJECT_NAME]
           ,[OBJECT_TYPE]
           ,[DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DW_EXECUTION_ORDER])
SELECT
[SUBJECT_AREA]
           ,[OBJECT_NAME]
           ,[OBJECT_TYPE]
           ,[DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DW_EXECUTION_ORDER]
FROM [ETL].[CNTRL]



GO
/****** Object:  StoredProcedure [ETL].[uspFOCUS_ARCH_LOAD]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[uspFOCUS_ARCH_LOAD]
AS

DECLARE @Load_Error_check INT
DECLARE @Load_Rows_check INT 
DECLARE @Valid_ID varchar(50)
DECLARE @Set INT
DECLARE @Load_Window varchar(50)

SET @Load_Error_check=0
SET @Load_Rows_check=0
SET @Valid_ID=''
SET @Load_Window=''

SELECT @Load_Error_check=COUNT(*) FROM [ETL].[LOGGING] WHERE [ERROR_MSG] IS NOT NULL;

SELECT @Set=COUNT(*) FROM [ETL].[LOGGING]; 

IF ( @Load_Error_check=0 )

BEGIN
SELECT @Load_Window=CONVERT(VARCHAR(40),DATEDIFF(minute, MIN(START_TIME),MAX(END_TIME)))
FROM ETL.LOGGING
SELECT @Valid_ID=CONVERT(VARCHAR(10),MIN(START_TIME),102) +'.'+CONVERT(VARCHAR(10),MAX(END_TIME),108)+'-' +@Load_Window
 FROM ETL.LOGGING

INSERT [ETL].[LOGGING_ARCHIVE] (
            [VALID_LOAD_ID]
           ,[LOGGING_ID]
           ,[SUBJECT_AREA]
           ,[DATA_AS_OF_DATE]
           ,[PROCEDURE_NAME]
		   ,[DW_OBJECT_NAME]
		   ,[STG_OBJECT_NAME]
           ,[SOURCE_TYPE]
           ,[RUN_STATUS]
           ,[ERROR_MSG]
           ,[START_TIME]
           ,[END_TIME]
		   ,[CNT_DW]
           ,[CNT_STG]
           ,[CNT_DIF]
           ,[CNT_DUP])
SELECT
            @Valid_ID
           ,[LOGGING_ID]
           ,[SUBJECT_AREA]
           ,[DATA_AS_OF_DATE]
           ,[PROCEDURE_NAME]
		   ,[DW_OBJECT_NAME]
           ,[STG_OBJECT_NAME]
           ,[SOURCE_TYPE]
           ,[RUN_STATUS]
           ,[ERROR_MSG]
           ,[START_TIME]
           ,[END_TIME]
		   ,[CNT_DW]
           ,[CNT_STG]
           ,[CNT_DIF]
           ,[CNT_DUP]
FROM [ETL].[LOGGING]

 END

IF ( @Load_Error_check>0 )
BEGIN
PRINT 'NO RECORDS HAVE BEEN MOVED - ERRORS FOUND'
RETURN
END



GO
/****** Object:  StoredProcedure [ETL].[uspFOCUS_MSTR_CNTRL]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[uspFOCUS_MSTR_CNTRL]
AS

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------- COLLECT THE LAST MIN VALUE FOR THE DATA_AS_OF_DATE FROM EACH OF THE FACT TABLES SINCE THERE MAY BE MORE THAN ONE IN EACH CASE -------------------------------------
DECLARE @DATA_AS_OF_DATE_BDGT DATE SELECT TOP 1 @DATA_AS_OF_DATE_BDGT=[DATA_AS_OF_DATE] FROM [STG_TD_SYN].[FM_BDGT_ENTR] WHERE [DW_STATUS_IND]='S' ORDER BY [DATA_AS_OF_DATE]
DECLARE @DATA_AS_OF_DATE_FMLI DATE SELECT TOP 1 @DATA_AS_OF_DATE_FMLI=[DATA_AS_OF_DATE] FROM [STG_TD_SYN].[FM_FI_LNITMS] WHERE [DW_STATUS_IND]='S' ORDER BY [DATA_AS_OF_DATE]
DECLARE @DATA_AS_OF_DATE_CMMT DATE SELECT TOP 1 @DATA_AS_OF_DATE_CMMT=[DATA_AS_OF_DATE] FROM [STG_TD_SYN].[FM_CMMT_LNITMS] WHERE [DW_STATUS_IND]='S' ORDER BY [DATA_AS_OF_DATE]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--INSERT ETL.CNTRL_ARCHIVE SELECT * FROM ETL.CNTRL; --- >>  MOVE LAST NIGHT'S LOAD RESULTS INTO AN ARCHIVE AREA OLD CODE 04.09.15 MODIFICATION OF CODE ----------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC  [ETL].[uspFOCUS_ARCH_LOAD];--- >>  MOVE LAST NIGHT'S LOAD RESULTS INTO AN ARCHIVE AREA (32 STEPS IS CURRENTL FULL SET)---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TRUNCATE TABLE [ETL].[LOGGING]; ---------------------->> PREP THE LOGGING AREA FOR TODAY'S RUN; PREVIOUS LOAD SHOULD HAVE BEEN MOVED TO ARCHIVE AREA IF THERE WERE NO ERRORS ------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC [ETL].[uspFOCUS_ARCH_CNTRL]; -------------------->> MOVE THE  PREVIOUS DAY'S MASTER MANIFEST CONTROL RECORDS TO ARCHIVE FOR HISTORICAL REPORTING AND KNOWNING WHAT PARAMS YESTERDAY'S LOAD RAN WITH---
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TRUNCATE TABLE [ETL].[CNTRL]; ----------------------->> ALWAYS START 'FRESH' FOR EACH LOADING DAY----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[AMOUNT_TYPE]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'1' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[AMOUNT_TYPE]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[BCS_VALUE_TYPE]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'2' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[BCS_VALUE_TYPE]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[BUDG_PROCESS]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'3' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[BUDG_PROCESS]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[BUDGET_CATEGORY]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'4' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[BUDGET_CATEGORY]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[BUDGET_TYPE]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'5' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[BUDGET_TYPE]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[BUSINESS_AREA]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'6' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[BUSINESS_AREA]
WHERE [DW_STATUS_IND]='S'


UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[COMMITMENT_ITEM]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'7' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[COMMITMENT_ITEM]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[DOCUMENT_STATUS]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'8' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[DOCUMENT_STATUS]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[FUNCTIONAL_AREA]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'9' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[FUNCTIONAL_AREA]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[FUND]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'10' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[FUND]
WHERE [DW_STATUS_IND]='S'


UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[FUNDED_PROGRAM]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'11' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[FUNDED_PROGRAM]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[FUNDS_CENTER]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'12' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[FUNDS_CENTER]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[GRANT]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'13' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[GRANT]
WHERE [DW_STATUS_IND]='S'

UNION 

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[STAT_INDICATOR]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'14' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[STAT_INDICATOR]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[VALUE_TYPE]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'15' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[VALUE_TYPE]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[VERSION]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'16' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[VERSION]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[WORKFLOW_STATUS]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'17' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[WORKFLOW_STATUS]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[ORDER]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'18' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[WORKFLOW_STATUS]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_MD_SYN].[WBS_ELEMENT]' AS [OBJECT_NAME],
'DIMENSION' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'19' AS [DW_EXECUTION_ORDER]
FROM [STG_MD_SYN].[WORKFLOW_STATUS]
WHERE [DW_STATUS_IND]='S'

UNION

----------------------------------------------------------------------
----------------------------------------------------------------------
----- FACTS START HERE -----------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_TD_SYN].[FM_BDGT_ENTR]' AS [OBJECT_NAME],
'FACT' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'20' AS [DW_EXECUTION_ORDER]
FROM [STG_TD_SYN].[FM_BDGT_ENTR]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_TD_SYN].[FM_CMMT_LNITMS]' AS [OBJECT_NAME],
'FACT' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'21' AS [DW_EXECUTION_ORDER]
FROM [STG_TD_SYN].[FM_CMMT_LNITMS]
WHERE [DW_STATUS_IND]='S'

UNION

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[STG_TD_SYN].[FM_FI_LNITMS]' AS [OBJECT_NAME],
'FACT' AS OBJECT_TYPE, 
[DATA_AS_OF_DATE] AS [DATA_AS_OF_DATE] , 
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
[DW_STATUS_IND] AS [DW_STATUS_IND],
'22' AS [DW_EXECUTION_ORDER]
FROM [STG_TD_SYN].[FM_FI_LNITMS]
WHERE [DW_STATUS_IND]='S'

UNION

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
----- DEGENERATE FACTS START HERE -----------------------------------------------
------ MD.DOCUMENT_NUMBER -------------------------------------------------------
---------------------------------------------------------------------------------

SELECT DISTINCT 
'FM' AS SUBJECT_AREA,
'[MD].[DOCUMENT_NUMBER]' AS [OBJECT_NAME],
'FACT/DIMENSION' AS OBJECT_TYPE,
'1900-01-01' AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120)  AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME],
'F' AS [DW_STATUS_IND],
'23' AS [DW_EXECUTION_ORDER]

----------------------------------------------------------------------
----- SPECIALTY ITEMS START HERE -------------------------------------
----------------------------------------------------------------------

INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','TD.uspFM_FI_LNITMS_QA','PROCEDURE',@DATA_AS_OF_DATE_FMLI,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','24')
----
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','TD.uspFM_PARKED_LNITMS','PROCEDURE',@DATA_AS_OF_DATE_FMLI,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','25')
---
-------------------------------------------------------------------------------------------------------------

INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspEXPENDITURE_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_FMLI,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','26')
--
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspENCUMBRANCE_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_CMMT,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','27')
--
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspPRE_ENCUMBRANCE_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_CMMT,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','28')
--
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspORIGINAL_BUDGET_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_BDGT,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','29')
--
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspCARRY_FORWARD_BUDGET_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_BDGT,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','30')
--
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspCHANGED_BUDGET_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_BDGT,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','31')
--
INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','MX.uspCURRENT_BUDGET_AMOUNT','PROCEDURE',@DATA_AS_OF_DATE_BDGT,CONVERT(DATE,GETDATE(),120),GETDATE(),'S','32')

-----------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------  HANDLE ABSENCE OF VALUES IN THE FACTS ------------------------------------------------
--------------------------  INDICATES 'DEFAULT' HANDLING ---------------------------------------------------------

DECLARE @FM_BDGT_ENTR_CNT INT
DECLARE @FM_CMMT_LNITMS_CNT INT
DECLARE @FM_FI_LNITMS_CNT INT

SELECT @FM_BDGT_ENTR_CNT=COUNT(*) FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_BDGT_ENTR]'
SELECT @FM_CMMT_LNITMS_CNT=COUNT(*) FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_CMMT_LNITMS]'
SELECT @FM_FI_LNITMS_CNT=COUNT(*) FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_FI_LNITMS]'

IF @FM_BDGT_ENTR_CNT=0
BEGIN

INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','[STG_TD_SYN].[FM_BDGT_ENTR]','FACT','1900-01-01',CONVERT(DATE,GETDATE(),120),GETDATE(),'F','20')

END

IF @FM_CMMT_LNITMS_CNT=0
BEGIN

INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','[STG_TD_SYN].[FM_CMMT_LNITMS]','FACT','1900-01-01',CONVERT(DATE,GETDATE(),120),GETDATE(),'F','21')


END

IF @FM_FI_LNITMS_CNT=0
BEGIN

INSERT [ETL].[CNTRL] ([SUBJECT_AREA],[OBJECT_NAME],[OBJECT_TYPE],[DATA_AS_OF_DATE],[DS_INSERT_DATE],[DS_INSERT_TIME],[DW_STATUS_IND],[DW_EXECUTION_ORDER])
VALUES ('FM','[STG_TD_SYN].[FM_FI_LNITMS]','FACT','1900-01-01',CONVERT(DATE,GETDATE(),120),GETDATE(),'F','22')

END

/*
----------------------------------------------------------------------------------------------------------
----------------------- OTHER DEFAULT SCENARIO HANDLING ------------------------------------------------------
----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
DECLARE @FM_AREA_TOTAL_VALID_OBJECT_CNT_02_25_2015 INT
SELECT @FM_AREA_TOTAL_VALID_OBJECT_CNT_02_25_2015=COUNT(*) FROM ETL.CNTRL

 ---- IF NOT 30 - SOMETHING IS WRONG SO REVERT TO DEFAULT
------------------------------------------------------------ CHANGE THIS VALUE AS NEEDED ----------------------
---------------------------------- MEANS EITHER ONE OF THE FOLLOWING IS HAPPENING:
-------- 1. FACT CAME IN EMPTY
-------- 2. FACT CAME FOR MORE THAN ONE DAY (SPANING MULTIPE PERIODS
-------- 3. MASTER ITEM MISSING
-------- 4. MASTER ITEM DUPLICATED
-------- 5. MASTER LOADED FROM SEVERAL PERIODS
--------- ALL OF THE ABOVE ARE NON-STANDARD SCENARIOS WHICH REQUIRE A 'DEFAULT' HANDLING 
---------------------------------------------------------------------------------------------------------------


IF @FM_AREA_TOTAL_VALID_OBJECT_CNT_02_25_2015<>30

BEGIN

UPDATE ETL.CNTRL SET DATA_AS_OF_DATE='1900-01-01' , DW_STATUS_IND='F';


WITH DUPS AS

( SELECT 
[OBJECT_NAME], 
[OBJECT_TYPE],
[DATA_AS_OF_DATE], 
DW_STATUS_IND, 
ROW_NUMBER() OVER (PARTITION BY [OBJECT_NAME], [OBJECT_TYPE],[DATA_AS_OF_DATE], DW_STATUS_IND 
ORDER BY [OBJECT_NAME]) AS RN FROM ETL.CNTRL
)

DELETE FROM DUPS WHERE RN > 1;

END

*/


-------------------------- OTHER DEFAULT SCENARIO SPECIAL HANDLING CASES --------------------------------------------------------------
/*
RESERVED FOR CASES WHEN THERE WAS A PULL OF A FACT TABLE (SOURCE FACT RECORDS) ACCROSS MULTIPE DATA_AS_OF_DATE DAYS  OR
A SCENARIO WHEN A LOAD HAS ALREADY HAPPEND AND WE DO INDEED HAVE ALL THE FLAGS 'FLIPPED' IN STAGE BUT THE RUN WAS INITIATED 
AGAIN FOR SOME ODD REASON; UNDER ALL OF THESE SCENARIOS  ARE 'CODED AROUND' BELOW BY MANIPULATING THE CONTROL TABLE (ETL.CNTRL)
, THE LOAD PARAMETERS IN THIS TABLE BASICALLY REVERT BACK TO A 'FULL LOAD', MEANING THAT ALL OF THE DATA IS TAKEN FROM THE CURRENT 
STAGING AND INSERTED INTO THE ( TD )FACT AND ( MD ) DIM TABLES WITHOUT TRUNCATION THEREOF; DUPLICATE RECORD INSERTION IN THIS CASE
IS HANDLED APPROPRIATELY ON THE CONCRETE OBJECT LOAD PROCEDURE SIDE BY VIRTUE OF THE MERGE STATEMENTS 'ON' CLAUSE THAT IDENTIFIES 
A UNIQUE RECORD COMING IN FROM THE STAGING AREA AND COMPARES THAT ONE TO THE RECORD ALREADY THAT ALREADY EXISTS IN ( MD ) OR ( TD )  
--------------------------------------------------------------------------------------------------------------------------------------
*/
DECLARE @FINAL_ROW_CNT INT
DECLARE @INITIAL_ROW_CNT INT
SELECT @INITIAL_ROW_CNT=COUNT(*) FROM ETL.CNTRL;

WITH DUPS AS

( SELECT [OBJECT_NAME],[DW_EXECUTION_ORDER], ROW_NUMBER() OVER (PARTITION BY  [OBJECT_NAME],[DW_EXECUTION_ORDER] 
                                                                ORDER BY [DW_EXECUTION_ORDER]) AS RN
  FROM [ETL].[CNTRL]
							
)
DELETE FROM DUPS WHERE RN > 1;

SELECT @FINAL_ROW_CNT=COUNT(*) FROM ETL.CNTRL;

IF @FINAL_ROW_CNT<@INITIAL_ROW_CNT
BEGIN
UPDATE ETL.CNTRL SET [DW_STATUS_IND]='F',[DATA_AS_OF_DATE]='1900-01-01';
END 

----------------------------------------------------------------------------------------------------------
DECLARE @CURRENT_DATA_AS_OF_DATE_CNT INT
DECLARE @CURRENT_TOTAL_CNTRL_CNT INT

SELECT @CURRENT_DATA_AS_OF_DATE_CNT=COUNT(DATA_AS_OF_DATE) FROM [ETL].[CNTRL]
SELECT @CURRENT_TOTAL_CNTRL_CNT=COUNT(*) FROM [ETL].[CNTRL]

IF (@CURRENT_DATA_AS_OF_DATE_CNT<@CURRENT_TOTAL_CNTRL_CNT) 
BEGIN
UPDATE ETL.CNTRL SET [DW_STATUS_IND]='F',[DATA_AS_OF_DATE]='1900-01-01';
END















































































GO
/****** Object:  StoredProcedure [ETL].[uspLOG_LOAD]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [ETL].[uspLOG_LOAD]
@batch_control as varchar(20),
@subject_area varchar(50),
@data_as_of_date date,
@procedure_name as varchar(50),
@dw_object_name as varchar(450),
@stg_object_name as varchar(450),
@source_type as varchar(50),
@error varchar(2000) = null,
@cnt_dw int,
@cnt_stg int,
@cnt_dif int,
@cnt_dup int
AS

DECLARE @Start_Time SMALLDATETIME

IF (UPPER(@batch_control)='START')
BEGIN
  set @Start_Time = getdate()
  INSERT INTO ETL.LOGGING (
  
    [SUBJECT_AREA], 
	[DATA_AS_OF_DATE] ,
	[PROCEDURE_NAME] ,
	[DW_OBJECT_NAME],
	[STG_OBJECT_NAME] ,
	[SOURCE_TYPE] ,
	[RUN_STATUS] ,
	[START_TIME] ,
	[CNT_STG] 
	  
  )
              VALUES 
  (
  
  @subject_area,
  @data_as_of_date,
  @procedure_name,
  @dw_object_name,
  @stg_object_name,
  @source_type,
  'IN-PROCESS',
  @Start_Time,
  @cnt_stg
    
  )
 
END
IF (UPPER(@batch_control)='END') 
BEGIN
     UPDATE ETL.LOGGING   
            SET END_TIME=GETDATE(),
                RUN_STATUS='FINISHED',
				CNT_DW=@cnt_dw,
				CNT_DIF=@cnt_dif,
				CNT_DUP=@cnt_dup,
				DATA_AS_OF_DATE=@data_as_of_date
    WHERE 
 LOGGING_ID = (SELECT MAX(LOGGING_ID) FROM ETL.LOGGING WHERE [PROCEDURE_NAME]=@procedure_name  AND END_TIME IS NULL )
 
END
           
 
IF (UPPER(@batch_control)='FAILED') 
BEGIN
     UPDATE ETL.LOGGING   
            SET END_TIME=GETDATE(),
                RUN_STATUS='FAILED',
                ERROR_MSG = @error
				WHERE LOGGING_ID = (SELECT MAX(LOGGING_ID) FROM ETL.LOGGING WHERE [PROCEDURE_NAME]=@procedure_name  )

END  
IF ((UPPER(@batch_control) <> 'FAILED') AND (UPPER(@batch_control) <> 'START') AND (UPPER(@batch_control) <> 'END'))
BEGIN
  RAISERROR ('Invalid Status!', 16, 1)
END




GO
/****** Object:  StoredProcedure [MD].[uspAMOUNT_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

TRUNCATE TABLE [MD].[AMOUNT_TYPE]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[AMOUNT_TYPE]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspAMOUNT_TYPE] 'S','2015-03-24'

EXEC [MD].[uspAMOUNT_TYPE] 'F','1900-01-01'

EXEC [MD].[uspAMOUNT_TYPE] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspAMOUNT_TYPE]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspAMOUNT_TYPE'
DECLARE @dw_object_name varchar(150)='MD.AMOUNT_TYPE'
DECLARE @stg_object_name varchar(150)='STG_MD.AMOUNT_TYPE'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0
 
 --TRUNCATE TABLE [MD].[AMOUNT_TYPE];
 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[AMOUNT_TYPE] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[AMOUNT_TYPE];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[AMOUNT_TYPE] TGT
	 USING 
	 (SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [AMOUNT_TYPE],
	 [DESCRIPTION], 
	 [AMOUNT_TYPE] +' - '+[DESCRIPTION] AS LONG_DESCRIPTION
	 FROM  [STG_MD_SYN].[AMOUNT_TYPE]
--	 WHERE DW_STATUS_IND='S'
			)  SRC

	 ON
TGT.AMOUNT_TYPE=SRC.AMOUNT_TYPE
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[AMOUNT_TYPE],
[DESCRIPTION],
[LONG_DESCRIPTION]
)

VALUES( 

SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[AMOUNT_TYPE],
SRC.[DESCRIPTION],
SRC.LONG_DESCRIPTION

);

/*

IF NOT EXISTS (SELECT * FROM [MD].[AMOUNT_TYPE] where [AMOUNT_TYPE]='-1')
BEGIN 


INSERT [MD].[AMOUNT_TYPE] (
[AMOUNT_TYPE],
[DESCRIPTION],
[LONG_DESCRIPTION]
)
VALUES (
'-1',
'Unknown',
'Unknown'
)


END
*/

SELECT @cnt_dw=COUNT(*) FROM [MD].[AMOUNT_TYPE];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[AMOUNT_TYPE] GROUP BY AMOUNT_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[AMOUNT_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[AMOUNT_TYPE] TGT
	 USING 
	 (SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [AMOUNT_TYPE],
	 [DESCRIPTION], 
	 [AMOUNT_TYPE] +' - '+[DESCRIPTION] AS LONG_DESCRIPTION
	 FROM [STG_MD_SYN].[AMOUNT_TYPE]
		      WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
			)  SRC

	 ON
TGT.AMOUNT_TYPE=SRC.AMOUNT_TYPE
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[AMOUNT_TYPE],
[DESCRIPTION],
[LONG_DESCRIPTION]
)

VALUES( 

SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[AMOUNT_TYPE],
SRC.[DESCRIPTION],
SRC.LONG_DESCRIPTION

);

/*

IF NOT EXISTS (SELECT * FROM [MD].[AMOUNT_TYPE] where [AMOUNT_TYPE]='-1')
BEGIN 


INSERT [MD].[AMOUNT_TYPE] (
[AMOUNT_TYPE],
[DESCRIPTION],
[LONG_DESCRIPTION]
)
VALUES (
'-1',
'Unknown',
'Unknown'
)


END
*/


--Log End

SELECT @cnt_dw=COUNT(*) FROM [MD].[AMOUNT_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[AMOUNT_TYPE] GROUP BY AMOUNT_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------
END CATCH



GO
/****** Object:  StoredProcedure [MD].[uspBCS_VALUE_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


TRUNCATE TABLE [MD].[BCS_VALUE_TYPE]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[BCS_VALUE_TYPE]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].uspBCS_VALUE_TYPE 'S','2015-02-05'

EXEC [MD].uspBCS_VALUE_TYPE 'F','1900-01-01'

EXEC [MD].uspBCS_VALUE_TYPE 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/

CREATE PROCEDURE [MD].[uspBCS_VALUE_TYPE]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspBCS_VALUE_TYPE'
DECLARE @dw_object_name varchar(150)='MD.BCS_VALUE_TYPE'
DECLARE @stg_object_name varchar(150)='STG_MD.BCS_VALUE_TYPE'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 
--TRUNCATE TABLE [MD].[BCS_VALUE_TYPE]

 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
		DELETE FROM [MD].[BCS_VALUE_TYPE] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END


-------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
 
 IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BCS_VALUE_TYPE];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[BCS_VALUE_TYPE] TGT
	 USING (
	 SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [BCS_VALUE_TYPE],
     [DESCRIPTION],
     [BCS_VALUE_TYPE]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM 
	 [STG_MD_SYN].[BCS_VALUE_TYPE]
--	 WHERE DW_STATUS_IND='S' 
	  ) SRC
	 ON
TGT.[BCS_VALUE_TYPE]=SRC.[BCS_VALUE_TYPE]
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
 [DATA_AS_OF_DATE],
 [DS_INSERT_DATE],
 [DS_INSERT_TIME],
 [DW_STATUS_IND],
 [BCS_VALUE_TYPE],
 [DESCRIPTION],
 [LONG_DESCRIPTION]
)

VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BCS_VALUE_TYPE],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]

);

/*

IF NOT EXISTS (SELECT * FROM [MD].[BCS_VALUE_TYPE] where [BCS_VALUE_TYPE]='-1')
BEGIN 


INSERT [MD].[BCS_VALUE_TYPE] (
[BCS_VALUE_TYPE],
[DESCRIPTION] 
)
VALUES (
'-1',
'Uknown'
)


END
*/
SELECT @cnt_dw=COUNT(*) FROM [MD].[BCS_VALUE_TYPE];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BCS_VALUE_TYPE] GROUP BY BCS_VALUE_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BCS_VALUE_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

 MERGE INTO [MD].[BCS_VALUE_TYPE] TGT
	 USING (
	 SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [BCS_VALUE_TYPE],
     [DESCRIPTION],
     [BCS_VALUE_TYPE]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM 
	 [STG_MD_SYN].[BCS_VALUE_TYPE]
                WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE 
	  ) SRC
	 ON
TGT.[BCS_VALUE_TYPE]=SRC.[BCS_VALUE_TYPE]
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
 [DATA_AS_OF_DATE],
 [DS_INSERT_DATE],
 [DS_INSERT_TIME],
 [DW_STATUS_IND],
 [BCS_VALUE_TYPE],
 [DESCRIPTION],
 [LONG_DESCRIPTION]
)

VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BCS_VALUE_TYPE],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]

);

/*

IF NOT EXISTS (SELECT * FROM [MD].[BCS_VALUE_TYPE] where [BCS_VALUE_TYPE]='-1')
BEGIN 


INSERT [MD].[BCS_VALUE_TYPE] (
[BCS_VALUE_TYPE],
[DESCRIPTION] 
)
VALUES (
'-1',
'Uknown'
)


END
*/


--Log End

SELECT @cnt_dw=COUNT(*) FROM [MD].[BCS_VALUE_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BCS_VALUE_TYPE] GROUP BY BCS_VALUE_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------
END CATCH



GO
/****** Object:  StoredProcedure [MD].[uspBUDG_PROCESS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*


TRUNCATE TABLE [MD].[BUDG_PROCESS]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[BUDG_PROCESS]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspBUDG_PROCESS] 'S','2015-03-24'

EXEC [MD].[uspBUDG_PROCESS] 'F','1900-01-01'

EXEC [MD].[uspBUDG_PROCESS] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/



CREATE PROCEDURE [MD].[uspBUDG_PROCESS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspBUDG_PROCESS'
DECLARE @dw_object_name varchar(150)='MD.BUDG_PROCESS'
DECLARE @stg_object_name varchar(150)='STG_MD.BUDG_PROCESS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[BUDG_PROCESS] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

-------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUDG_PROCESS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[BUDG_PROCESS] TGT
	 USING 
	 (
	 SELECT DISTINCT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [BUDG_PROCESS],
     [DESCRIPTION],
	 [BUDG_PROCESS]+' - '+[DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM [STG_MD_SYN].[BUDG_PROCESS]
--	 WHERE DW_STATUS_IND='S'
	 ) SRC
	 ON
TGT.BUDG_PROCESS=SRC.BUDG_PROCESS 
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
 [DATA_AS_OF_DATE],
 [DS_INSERT_DATE],
 [DS_INSERT_TIME],
 [DW_STATUS_IND],
 [BUDG_PROCESS],
 [DESCRIPTION],
 [LONG_DESCRIPTION]
)
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUDG_PROCESS],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]
);

/*

IF NOT EXISTS (SELECT * FROM [MD].[BUDG_PROCESS] where [BUDG_PROCESS]='-1')
BEGIN 

INSERT [MD].[BUDG_PROCESS] (
[BUDG_PROCESS],
[DESCRIPTION]
VALUES (
'-1',
'Unknown'
)


END
*/


SELECT @cnt_dw=COUNT(*) FROM [MD].[BUDG_PROCESS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUDG_PROCESS] GROUP BY BUDG_PROCESS HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END


 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUDG_PROCESS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [MD].[BUDG_PROCESS] TGT
	 USING 
	 (
	 SELECT DISTINCT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [BUDG_PROCESS],
     [DESCRIPTION],
	 [BUDG_PROCESS]+' - '+[DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM [STG_MD_SYN].[BUDG_PROCESS]
				WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	 ) SRC
	 ON
TGT.BUDG_PROCESS=SRC.BUDG_PROCESS 
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
 [DATA_AS_OF_DATE],
 [DS_INSERT_DATE],
 [DS_INSERT_TIME],
 [DW_STATUS_IND],
 [BUDG_PROCESS],
 [DESCRIPTION],
 [LONG_DESCRIPTION]
)
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUDG_PROCESS],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]
);

SELECT @cnt_dw=COUNT(*) FROM [MD].[BUDG_PROCESS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUDG_PROCESS] GROUP BY BUDG_PROCESS HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA-----------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [MD].[uspBUDGET_CATEGORY]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


TRUNCATE TABLE [MD].[BUDGET_CATEGORY]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[BUDGET_CATEGORY]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspBUDGET_CATEGORY] 'S','2015-03-25'

EXEC [MD].[uspBUDGET_CATEGORY] 'F','1900-01-01'

EXEC [MD].[uspBUDGET_CATEGORY] 'D','2015-02-05'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/



CREATE PROCEDURE [MD].[uspBUDGET_CATEGORY]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspBUDGET_CATEGORY'
DECLARE @dw_object_name varchar(150)='MD.BUDGET_CATEGORY'
DECLARE @stg_object_name varchar(150)='STG_MD.BUDGET_CATEGORY'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[BUDGET_CATEGORY] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
 IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUDGET_CATEGORY];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[BUDGET_CATEGORY] TGT
	 USING (
	 SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [BUDGET_CATEGORY],
     [DESCRIPTION]
	 FROM  [STG_MD_SYN].[BUDGET_CATEGORY]
	 --	 WHERE DW_STATUS_IND='S' 
	 ) SRC
	 ON
TGT.BUDGET_CATEGORY=SRC.BUDGET_CATEGORY
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUDGET_CATEGORY],
[DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUDGET_CATEGORY],
SRC.[DESCRIPTION]
);

/*

IF NOT EXISTS (SELECT * FROM [MD].[BUDGET_CATEGORY] where [BUDGET_CATEGORY]='-1')
BEGIN 

INSERT [MD].[BUDGET_CATEGORY] (
[BUDGET_CATEGORY],
[DESCRIPTION]
VALUES (
'-1',
'UKNOWN'
)


END
*/


SELECT @cnt_dw=COUNT(*) FROM [MD].[BUDGET_CATEGORY];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUDGET_CATEGORY] GROUP BY BUDGET_CATEGORY HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUDGET_CATEGORY] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [MD].[BUDGET_CATEGORY] TGT
	 USING (
	 SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [BUDGET_CATEGORY],
     [DESCRIPTION]
	 FROM  [STG_MD_SYN].[BUDGET_CATEGORY]
			WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE 
	 ) SRC
	 ON
TGT.BUDGET_CATEGORY=SRC.BUDGET_CATEGORY
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUDGET_CATEGORY],
[DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUDGET_CATEGORY],
SRC.[DESCRIPTION]
);

SELECT @cnt_dw=COUNT(*) FROM [MD].[BUDGET_CATEGORY] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUDGET_CATEGORY] GROUP BY BUDGET_CATEGORY HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END


END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------
SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 
 ----------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspBUDGET_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

TRUNCATE TABLE [MD].[BUDGET_TYPE]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[BUDGET_TYPE]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspBUDGET_TYPE] 'S','2015-03-24'

EXEC [MD].[uspBUDGET_TYPE] 'F','1900-01-01'

EXEC [MD].[uspBUDGET_TYPE] 'D','2015-02-05'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/

CREATE PROCEDURE [MD].[uspBUDGET_TYPE]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspBUDGET_TYPE'
DECLARE @dw_object_name varchar(150)='MD.BUDGET_TYPE'
DECLARE @stg_object_name varchar(150)='STG_MD.BUDGET_TYPE'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[BUDGET_TYPE] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUDGET_TYPE];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[BUDGET_TYPE] TGT
	 USING  
	 (
	 SELECT 
     [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [BUDGET_TYPE],
     [FM_AREA],
     [BCS_VALUE_TYPE],
     [DESCRIPTION],
	 [BUDGET_TYPE]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM [STG_MD_SYN].[BUDGET_TYPE]
	 --	 WHERE DW_STATUS_IND='S'
	 ) SRC
	 ON
TGT.BUDGET_TYPE=SRC.BUDGET_TYPE 
WHEN MATCHED THEN 
UPDATE SET 
TGT.[FM_AREA] = SRC.[FM_AREA],
TGT.[BCS_VALUE_TYPE] = SRC.[BCS_VALUE_TYPE],
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUDGET_TYPE],
[FM_AREA],
[BCS_VALUE_TYPE],
[DESCRIPTION],
[LONG_DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUDGET_TYPE],
SRC.[FM_AREA],
SRC.[BCS_VALUE_TYPE],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]
);

/*

IF NOT EXISTS (SELECT * FROM [MD].[BUDGET_TYPE] where [BUDGET_TYPE]='-1')
BEGIN 

INSERT [MD].[BUDGET_TYPE] (
[BUDGET_TYPE],
[FM_AREA],
[BCS_VALUE_TYPE],
[DESCRIPTION]
VALUES (
'-1',
'UKN',
'U',
'UNKNOWN'
)


END
*/

SELECT @cnt_dw=COUNT(*) FROM [MD].[BUDGET_TYPE];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUDGET_TYPE] GROUP BY BUDGET_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup



END

 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------
 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUDGET_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

 MERGE INTO [MD].[BUDGET_TYPE] TGT
	 USING  
	 (
	 SELECT 
     [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [BUDGET_TYPE],
     [FM_AREA],
     [BCS_VALUE_TYPE],
     [DESCRIPTION],
	 [BUDGET_TYPE]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM [STG_MD_SYN].[BUDGET_TYPE]
			WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	 ) SRC
	 ON
TGT.BUDGET_TYPE=SRC.BUDGET_TYPE 
WHEN MATCHED THEN 
UPDATE SET 
TGT.[FM_AREA] = SRC.[FM_AREA],
TGT.[BCS_VALUE_TYPE] = SRC.[BCS_VALUE_TYPE],
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUDGET_TYPE],
[FM_AREA],
[BCS_VALUE_TYPE],
[DESCRIPTION],
[LONG_DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUDGET_TYPE],
SRC.[FM_AREA],
SRC.[BCS_VALUE_TYPE],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]
);

--Log End

SELECT @cnt_dw=COUNT(*) FROM [MD].[BUDGET_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUDGET_TYPE] GROUP BY BUDGET_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [MD].[uspBUSINESS_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


TRUNCATE TABLE [MD].[BUSINESS_AREA]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[BUSINESS_AREA]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspBUSINESS_AREA] 'S','2015-03-24'

EXEC [MD].[uspBUSINESS_AREA] 'F','1900-01-01'

EXEC [MD].[uspBUSINESS_AREA] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/

CREATE PROCEDURE [MD].[uspBUSINESS_AREA]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspBUSINESS_AREA'
DECLARE @dw_object_name varchar(150)='MD.BUSINESS_AREA'
DECLARE @stg_object_name varchar(150)='STG_MD.BUSINESS_AREA'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[BUSINESS_AREA] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUSINESS_AREA];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[BUSINESS_AREA] TGT
	 USING 
 (SELECT 
       [DATA_AS_OF_DATE],
       [DS_INSERT_DATE],
       [DS_INSERT_TIME],
       [DW_STATUS_IND],
       [BUSINESS_AREA],
       [DESCRIPTION],
	   [BUSINESS_AREA] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[BUSINESS_AREA]
  --	 WHERE DW_STATUS_IND='S'
  ) SRC
	 ON
TGT.BUSINESS_AREA=SRC.BUSINESS_AREA
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUSINESS_AREA],
[DESCRIPTION],
[LONG_DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUSINESS_AREA],
SRC.[DESCRIPTION],
SRC.LONG_DESCRIPTION
);

IF NOT EXISTS (SELECT * FROM [MD].[BUSINESS_AREA] where [BUSINESS_AREA]=' ')
BEGIN 

INSERT [MD].[BUSINESS_AREA] (

[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUSINESS_AREA],
[DESCRIPTION],
[LONG_DESCRIPTION]
)
VALUES (

'1900-01-01',
'1900-01-01',
'1900-01-01 00:00:00.0000000',
'S',
' ',
'Unknown',
'Unknown'
)

END

SELECT @cnt_dw=COUNT(*) FROM [MD].[BUSINESS_AREA];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUSINESS_AREA] GROUP BY BUSINESS_AREA HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------
 
 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[BUSINESS_AREA] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

 
 MERGE INTO [MD].[BUSINESS_AREA] TGT
	 USING 
 (SELECT 
       [DATA_AS_OF_DATE],
       [DS_INSERT_DATE],
       [DS_INSERT_TIME],
       [DW_STATUS_IND],
       [BUSINESS_AREA],
       [DESCRIPTION],
	   [BUSINESS_AREA] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[BUSINESS_AREA]
			WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
  ) SRC
	 ON
TGT.BUSINESS_AREA=SRC.BUSINESS_AREA
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUSINESS_AREA],
[DESCRIPTION],
[LONG_DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[BUSINESS_AREA],
SRC.[DESCRIPTION],
SRC.LONG_DESCRIPTION
);

IF NOT EXISTS (SELECT * FROM [MD].[BUSINESS_AREA] where [BUSINESS_AREA]=' ')
BEGIN 

INSERT [MD].[BUSINESS_AREA] (
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[BUSINESS_AREA],
[DESCRIPTION],
[LONG_DESCRIPTION]
)
VALUES (

'1900-01-01',
'1900-01-01',
'1900-01-01 00:00:00.0000000',
'S',
' ',
'Unknown',
'Unknown'
)

END;

SELECT @cnt_dw=COUNT(*) FROM [MD].[BUSINESS_AREA] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[BUSINESS_AREA] GROUP BY BUSINESS_AREA HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 --------------------------------------------------------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [MD].[uspCOMMITMENT_ITEM]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

TRUNCATE TABLE ETL.LOGGING
TRUNCATE TABLE [MD].[COMMITMENT_ITEM]
SELECT * FROM [MD].[COMMITMENT_ITEM]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspCOMMITMENT_ITEM] 'S','2015-02-17'

EXEC [MD].[uspCOMMITMENT_ITEM] 'F','1900-01-01'

EXEC [MD].[uspCOMMITMENT_ITEM] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspCOMMITMENT_ITEM]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspCOMMITMENT_ITEM'
DECLARE @dw_object_name varchar(150)='MD.COMMITMENT_ITEM'
DECLARE @stg_object_name varchar(150)='STG_MD.COMMITMENT_ITEM'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--TRUNCATE TABLE [MD].[COMMITMENT_ITEM];
--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[COMMITMENT_ITEM] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[COMMITMENT_ITEM];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[COMMITMENT_ITEM] TGT
	 USING 
  (SELECT 
       CI.[DATA_AS_OF_DATE]
      ,CI.[DS_INSERT_DATE]
	  ,CI.[DS_INSERT_TIME]
	  ,CI.[DW_STATUS_IND]
      , LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.COMMITMENT_ITEM))) AS COMMITMENT_ITEM 
      , CI.[FM_AREA]
      , CI.[VALID_TO]
      , CI.[VALID_FROM]
      , LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_CAT))) AS CMMT_ITEM_CAT
      ,CASE WHEN CONVERT(VARCHAR(100), CI.CMMT_ITEM_SUP)=' ' THEN '-1'  ELSE LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_SUP))) END AS CMMT_ITEM_SUP
      , CI.[FIN_TRANSACTION]
      , CI.[DIR_POSTABLE]
      , CI.[ITEM]
      , CI.[CAR_FWD_ITM_CAT]
      , CI.[STAT_CMMT_ITEM]
      , CI.[STAND_VARIANT]
      , CI.[COMMITMENT_ITEM1]
      ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.[NAME]))) AS NAME
      ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.[DESCRIPTION]))) AS [DESCRIPTION]
	  ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.COMMITMENT_ITEM))) + ' - ' + LTRIM(RTRIM(CI.[NAME])) AS LONG_DESCRIPTION
	  ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CIC.[NAME]))) AS CMMT_ITEM_CAT_NAME
	  ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_CAT))) + ' - ' + LTRIM(RTRIM(CIC.[NAME])) AS CMMT_ITEM_CAT_LONG_NAME
	  ,ISNULL(LTRIM(RTRIM(CONVERT(VARCHAR(100), SUP.CMMT_ITEM_SUP_NAME))),'Statistical') AS CMMT_ITEM_SUP_NAME
	  ,ISNULL(LTRIM(RTRIM(CONVERT(VARCHAR(100), SUP.[CMMT_ITEM_SUP_LONG_NAME]))),'Statistical') AS [CMMT_ITEM_SUP_LONG_NAME]
	  

  FROM  [STG_MD_SYN].[COMMITMENT_ITEM] CI INNER JOIN 
        [STG_MD_SYN].CMMT_ITEM_CAT AS CIC ON CIC.CMMT_ITEM_CAT = CI.CMMT_ITEM_CAT

		LEFT JOIN (
                                                                                                SELECT  
                                                                                                [COMMITMENT_ITEM] AS [CMMT_ITEM_SUP],
                                                                                                [NAME] AS [CMMT_ITEM_SUP_NAME],
                                                                                                [COMMITMENT_ITEM]+' - '+ [NAME] AS [CMMT_ITEM_SUP_LONG_NAME]
                                                                                                FROM [STG_MD_SYN].[COMMITMENT_ITEM] WHERE 
                                                                                                LEN([COMMITMENT_ITEM])<5) SUP 

                                                                                                ON CI.CMMT_ITEM_SUP=SUP.CMMT_ITEM_SUP
--	 WHERE DW_STATUS_IND='S'
    
  ) SRC
	 ON
TGT.[COMMITMENT_ITEM]=SRC.[COMMITMENT_ITEM] 
WHEN MATCHED THEN 
UPDATE SET 
    TGT.[FM_AREA]=SRC.[FM_AREA],
	TGT.[VALID_TO]=SRC.[VALID_TO],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[CMMT_ITEM_CAT]=SRC.[CMMT_ITEM_CAT],
	TGT.[CMMT_ITEM_SUP]=SRC.[CMMT_ITEM_SUP],
	TGT.[FIN_TRANSACTION]=SRC.[FIN_TRANSACTION],
	TGT.[DIR_POSTABLE]=SRC.[DIR_POSTABLE],
	TGT.[ITEM]=SRC.[ITEM],
	TGT.[CAR_FWD_ITM_CAT]=SRC.[CAR_FWD_ITM_CAT],
	TGT.[STAT_CMMT_ITEM]=SRC.[STAT_CMMT_ITEM],
	TGT.[STAND_VARIANT]=SRC.[STAND_VARIANT],
	TGT.[COMMITMENT_ITEM1]=SRC.[COMMITMENT_ITEM1],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION]

WHEN NOT MATCHED THEN
INSERT 
(
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
	  ,[COMMITMENT_ITEM]
      ,[FM_AREA]
      ,[VALID_TO]
      ,[VALID_FROM]
      ,[CMMT_ITEM_CAT]
      ,[CMMT_ITEM_SUP]
      ,[FIN_TRANSACTION]
      ,[DIR_POSTABLE]
      ,[ITEM]
      ,[CAR_FWD_ITM_CAT]
      ,[STAT_CMMT_ITEM]
      ,[STAND_VARIANT]
      ,[COMMITMENT_ITEM1]
      ,[NAME]
      ,[DESCRIPTION]
      ,[LONG_DESCRIPTION]
	  ,[CMMT_ITEM_SUP_NAME]
	  ,[CMMT_ITEM_CAT_NAME]
	  ,[CMMT_ITEM_SUP_LONG_NAME]
	  ,[CMMT_ITEM_CAT_LONG_NAME]

	 )
VALUES( 

       SRC.[DATA_AS_OF_DATE]
      ,SRC.[DS_INSERT_DATE]
      ,SRC.[DS_INSERT_TIME]
      ,SRC.[DW_STATUS_IND]
	  ,SRC.[COMMITMENT_ITEM]
      ,SRC.[FM_AREA]
      ,SRC.[VALID_TO]
      ,SRC.[VALID_FROM]
      ,SRC.[CMMT_ITEM_CAT]
      ,SRC.[CMMT_ITEM_SUP]
      ,SRC.[FIN_TRANSACTION]
      ,SRC.[DIR_POSTABLE]
      ,SRC.[ITEM]
      ,SRC.[CAR_FWD_ITM_CAT]
      ,SRC.[STAT_CMMT_ITEM]
      ,SRC.[STAND_VARIANT]
      ,SRC.[COMMITMENT_ITEM1]
      ,SRC.[NAME]
      ,SRC.[DESCRIPTION]
      ,SRC.[LONG_DESCRIPTION]
	  ,SRC.[CMMT_ITEM_SUP_NAME]
	  ,SRC.[CMMT_ITEM_CAT_NAME]
	  ,SRC.[CMMT_ITEM_SUP_LONG_NAME]
      ,SRC.[CMMT_ITEM_CAT_LONG_NAME]
	   );



SELECT @cnt_dw=COUNT(*) FROM [MD].[COMMITMENT_ITEM];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[COMMITMENT_ITEM] GROUP BY COMMITMENT_ITEM HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup



END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[COMMITMENT_ITEM] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [MD].[COMMITMENT_ITEM] TGT
	 USING 
  (SELECT 
       CI.[DATA_AS_OF_DATE]
      ,CI.[DS_INSERT_DATE]
	  ,CI.[DS_INSERT_TIME]
	  ,CI.[DW_STATUS_IND]
      ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.COMMITMENT_ITEM))) AS COMMITMENT_ITEM 
      , CI.[FM_AREA]
      , CI.[VALID_TO]
      , CI.[VALID_FROM]
      , LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_CAT))) AS CMMT_ITEM_CAT
      ,CASE WHEN CONVERT(VARCHAR(100), CI.CMMT_ITEM_SUP)=' ' THEN '-1'  ELSE LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_SUP))) END AS CMMT_ITEM_SUP
      , CI.[FIN_TRANSACTION]
      , CI.[DIR_POSTABLE]
      , CI.[ITEM]
      , CI.[CAR_FWD_ITM_CAT]
      , CI.[STAT_CMMT_ITEM]
      , CI.[STAND_VARIANT]
      , CI.[COMMITMENT_ITEM1]
      ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.[NAME]))) AS NAME
      ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.[DESCRIPTION]))) AS [DESCRIPTION]
	  ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.COMMITMENT_ITEM))) + ' - ' + LTRIM(RTRIM(CI.[NAME])) AS LONG_DESCRIPTION
	  ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CIC.[NAME]))) AS CMMT_ITEM_CAT_NAME
	  ,LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_CAT))) + ' - ' + LTRIM(RTRIM(CIC.[NAME])) AS CMMT_ITEM_CAT_LONG_NAME
	  ,ISNULL(LTRIM(RTRIM(CONVERT(VARCHAR(100), SUP.CMMT_ITEM_SUP_NAME))),'Statistical') AS CMMT_ITEM_SUP_NAME
	  ,ISNULL(LTRIM(RTRIM(CONVERT(VARCHAR(100), SUP.[CMMT_ITEM_SUP_LONG_NAME]))),'Statistical') AS [CMMT_ITEM_SUP_LONG_NAME]
	  

  FROM  [STG_MD_SYN].[COMMITMENT_ITEM] CI INNER JOIN 
        [STG_MD_SYN].CMMT_ITEM_CAT AS CIC ON CIC.CMMT_ITEM_CAT = CI.CMMT_ITEM_CAT

		LEFT JOIN (
                                                                                                SELECT  
                                                                                                [COMMITMENT_ITEM] AS [CMMT_ITEM_SUP],
                                                                                                [NAME] AS [CMMT_ITEM_SUP_NAME],
                                                                                                [COMMITMENT_ITEM]+' - '+ [NAME] AS [CMMT_ITEM_SUP_LONG_NAME]
                                                                                                FROM [STG_MD_SYN].[COMMITMENT_ITEM] WHERE 
                                                                                                LEN([COMMITMENT_ITEM])<5) SUP 

                                                                                                ON CI.CMMT_ITEM_SUP=SUP.CMMT_ITEM_SUP
 WHERE CI.DW_STATUS_IND=@DW_STATUS_IND AND CI.DATA_AS_OF_DATE=@DATA_AS_OF_DATE
    
  ) SRC
	 ON
TGT.[COMMITMENT_ITEM]=SRC.[COMMITMENT_ITEM] 
WHEN MATCHED THEN 
UPDATE SET 
    TGT.[FM_AREA]=SRC.[FM_AREA],
	TGT.[VALID_TO]=SRC.[VALID_TO],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[CMMT_ITEM_CAT]=SRC.[CMMT_ITEM_CAT],
	TGT.[CMMT_ITEM_SUP]=SRC.[CMMT_ITEM_SUP],
	TGT.[FIN_TRANSACTION]=SRC.[FIN_TRANSACTION],
	TGT.[DIR_POSTABLE]=SRC.[DIR_POSTABLE],
	TGT.[ITEM]=SRC.[ITEM],
	TGT.[CAR_FWD_ITM_CAT]=SRC.[CAR_FWD_ITM_CAT],
	TGT.[STAT_CMMT_ITEM]=SRC.[STAT_CMMT_ITEM],
	TGT.[STAND_VARIANT]=SRC.[STAND_VARIANT],
	TGT.[COMMITMENT_ITEM1]=SRC.[COMMITMENT_ITEM1],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION]

WHEN NOT MATCHED THEN
INSERT 
(
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
      ,[COMMITMENT_ITEM]
      ,[FM_AREA]
      ,[VALID_TO]
      ,[VALID_FROM]
      ,[CMMT_ITEM_CAT]
      ,[CMMT_ITEM_SUP]
      ,[FIN_TRANSACTION]
      ,[DIR_POSTABLE]
      ,[ITEM]
      ,[CAR_FWD_ITM_CAT]
      ,[STAT_CMMT_ITEM]
      ,[STAND_VARIANT]
      ,[COMMITMENT_ITEM1]
      ,[NAME]
      ,[DESCRIPTION]
      ,[LONG_DESCRIPTION]
	  ,[CMMT_ITEM_SUP_NAME]
	  ,[CMMT_ITEM_CAT_NAME]
	  ,[CMMT_ITEM_SUP_LONG_NAME]
	  ,[CMMT_ITEM_CAT_LONG_NAME]

	 )
VALUES( 

       SRC.[DATA_AS_OF_DATE]
      ,SRC.[DS_INSERT_DATE]
      ,SRC.[DS_INSERT_TIME]
      ,SRC.[DW_STATUS_IND]
      ,SRC.[COMMITMENT_ITEM]
      ,SRC.[FM_AREA]
      ,SRC.[VALID_TO]
      ,SRC.[VALID_FROM]
      ,SRC.[CMMT_ITEM_CAT]
      ,SRC.[CMMT_ITEM_SUP]
      ,SRC.[FIN_TRANSACTION]
      ,SRC.[DIR_POSTABLE]
      ,SRC.[ITEM]
      ,SRC.[CAR_FWD_ITM_CAT]
      ,SRC.[STAT_CMMT_ITEM]
      ,SRC.[STAND_VARIANT]
      ,SRC.[COMMITMENT_ITEM1]
      ,SRC.[NAME]
      ,SRC.[DESCRIPTION]
      ,SRC.[LONG_DESCRIPTION]
	  ,SRC.[CMMT_ITEM_SUP_NAME]
	  ,SRC.[CMMT_ITEM_CAT_NAME]
	  ,SRC.[CMMT_ITEM_SUP_LONG_NAME]
      ,SRC.[CMMT_ITEM_CAT_LONG_NAME]
	   );


SELECT @cnt_dw=COUNT(*) FROM [MD].[COMMITMENT_ITEM] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[COMMITMENT_ITEM] GROUP BY COMMITMENT_ITEM HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA-----------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -----------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH





GO
/****** Object:  StoredProcedure [MD].[uspCOST_CENTER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MD].[uspCOST_CENTER]
AS
BEGIN
---------------------------------------------------------------------------------------------------------------------------------------------
------------------------------ THIS STORED PROC DEPENDS ON THE EXISTANCE OF [dbo].[COST_CENTER_HIER1] ---------------------------------------
------------------------------ POPULATED FROM SAP DATA SERVICES TABLE FLATTENING FEATURE THAT COMES OUT-OF-BOX-------------------------------
------------------------------ THE MODIFICATIONS BELOW ARE NEEDED TO BRING IT UP TO PAR FOR SSAS DIM LOAD -----------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @t TABLE (cid VARCHAR(64) , n VARCHAR(64), pid VARCHAR(64))
DECLARE @t2 TABLE (ID VARCHAR(64), Level06 varchar (64) ,Level05 varchar (64),Level04 varchar (64),Level03 varchar (64), Level02 varchar(64), Level01 varchar(64))

INSERT @t (cid,n,pid) SELECT [CHILD_ID],[CHILD_DESCR],[PARENT_ID] FROM 
[FFDSSDBDGC01.FFD.CO.FAIRFAX.VA.US,51963].[DMB_FOCUS_DW].[dbo].[COST_CENTER_HIER1];

WITH 

e AS

(
SELECT *,cid as id, 1 AS l 
    FROM @t a WHERE NOT EXISTS 
	               (SELECT * FROM @t b WHERE a.cid = b.pid)
UNION ALL
SELECT t.*,	e.id, e.l+1 
    FROM @t t INNER JOIN e ON t.cid = e.pid ),

--select * from e  /// check how the raw input is progressing in terms of levels

e2 AS ( SELECT n, l, id FROM e)

INSERT @t2 (ID,Level06,Level05,Level04,Level03,Level02,Level01)
SELECT * FROM e2
PIVOT ( MAX(n) FOR l IN ([1],[2],[3],[4],[5],[6])) P;

TRUNCATE TABLE MD.COST_CENTER
INSERT MD.COST_CENTER (COST_CENTER, COST_CENTER_NAME, DIVISION, AGENCY, DEPARTMENT, BUSINESS_AREA, HIERARCHY)
SELECT ID,Level06,Level05,Level04,Level03,Level02,Level01 from @t2

-------------------------------------------------------------------------------------------------------------------------------------------
END



GO
/****** Object:  StoredProcedure [MD].[uspDATE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MD].[uspDATE]
AS
BEGIN
TRUNCATE TABLE  MD.DATE
INSERT MD.DATE (
PK_Date, 
Date_Name, 
[Year], 
Year_Name, 
Quarter, 
Quarter_Name, 
[Month], 
Month_Name, 
Week, 
Week_Name, 
Fiscal_Year, 
Fiscal_Year_Name, 
Fiscal_Quarter, 
Fiscal_Quarter_Name, 
Fiscal_Month, 
Fiscal_Month_Name, 
Fiscal_Day, 
Fiscal_Day_Name )
SELECT 
CONVERT(VARCHAR(8), PK_Date, 112) AS PK_Date, 
Date_Name, 
[Year], 
Year_Name, 
Quarter, 
Quarter_Name, 
[Month], 
Month_Name, 
Week, 
Week_Name, 
Fiscal_Year, 
Fiscal_Year_Name, 
Fiscal_Quarter, 
Fiscal_Quarter_Name, 
Fiscal_Month, 
Fiscal_Month_Name, 
Fiscal_Day, 
Fiscal_Day_Name
FROM [FFDSSDBDGC01.FFD.CO.FAIRFAX.VA.US,51963].[DMB_FOCUS_DW].[FFX\xnkletn].[DATE]

END



GO
/****** Object:  StoredProcedure [MD].[uspDOCUMENT_NUMBER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MD].[uspDOCUMENT_NUMBER]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspDOCUMENT_NUMBER'
DECLARE @dw_object_name varchar(150)='MD.DOCUMENT_NUMBER'
DECLARE @stg_object_name varchar(150)='STG_MD.DOCUMENT_NUMBER'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 TRUNCATE TABLE [MD].[DOCUMENT_NUMBER];
 --------------------------------------------------------------------------------------------------------------
 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[DOCUMENT_NUMBER] TGT
USING 
     (
SELECT DISTINCT 
CONVERT(DATE,GETDATE(),120) AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
'S' AS [DW_STATUS_IND],
[FI_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),[FI_DOCUMENT_ITEM]) AS DOCUMENT_NUMBER, 
[FI_DOCUMENT_NO] AS NUMBER,
[FI_DOCUMENT_ITEM] AS ITEM, 
CASE WHEN [TEXT] IS NULL THEN ' ' ELSE [TEXT] END AS [TEXT]   
FROM  [TD].[FM_FI_LNITMS] 
UNION
SELECT DISTINCT 
CONVERT(DATE,GETDATE(),120) AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
'S' AS [DW_STATUS_IND],
[FI_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),[FI_DOCUMENT_ITEM]) AS DOCUMENT_NUMBER, 
[FI_DOCUMENT_NO] AS NUMBER,
[FI_DOCUMENT_ITEM] AS ITEM, 
CASE WHEN [TEXT] IS NULL THEN ' ' ELSE [TEXT] END AS [TEXT]   
FROM [TD].[FM_PARKED_LNITMS] 
UNION
SELECT DISTINCT 
CONVERT(DATE,GETDATE(),120) AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
'S' AS [DW_STATUS_IND],
[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),[REF_ITEM]) AS DOCUMENT_NUMBER, 
[REF_DOCUMENT_NO] AS NUMBER,
[REF_ITEM] AS ITEM,
CASE WHEN [ITEM_TEXT] IS NULL THEN ' ' ELSE [ITEM_TEXT] END AS [TEXT] 
FROM [TD].[FM_CMMT_LNITMS]
UNION
SELECT DISTINCT 
CONVERT(DATE,GETDATE(),120) AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
'S' AS [DW_STATUS_IND],
RTRIM(LTRIM([ENTRY_DOCUMENT_NO])) +'-'+ RTRIM(LTRIM([ENTRY_DOCUMENT_LINE])) AS DOCUMENT_NUMBER, 
RTRIM(LTRIM([ENTRY_DOCUMENT_NO])) AS NUMBER,
RTRIM(LTRIM([ENTRY_DOCUMENT_LINE])) AS ITEM,
CASE WHEN [TEXT] IS NULL THEN ' ' ELSE [TEXT] END AS [TEXT] 
FROM [TD].[FM_BDGT_ENTR]

) SRC
ON 
TGT.NUMBER=SRC.NUMBER AND
TGT.ITEM=SRC.ITEM
WHEN MATCHED THEN 
UPDATE SET
TGT.DATA_AS_OF_DATE=SRC.DATA_AS_OF_DATE,
TGT.[DS_INSERT_DATE]=SRC.[DS_INSERT_DATE],
TGT.[DS_INSERT_TIME]=SRC.[DS_INSERT_TIME],
TGT.[DW_STATUS_IND]=SRC.[DW_STATUS_IND],
TGT.[NUMBER]=SRC.[NUMBER],
TGT.[ITEM]=SRC.[ITEM],
TGT.[TEXT]=SRC.[TEXT]
WHEN NOT MATCHED THEN
INSERT 
(		    [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[NUMBER]
           ,[ITEM]
           ,[TEXT]
)
VALUES (
			SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[NUMBER]
           ,SRC.[ITEM]
           ,SRC.[TEXT]
);


---- CLEAN UP THE TEXT VALUES FOR N/A -------------------------------
UPDATE [MD].[DOCUMENT_NUMBER] SET TEXT=' ' WHERE TEXT='N/A';
----- END CLEAN UP THE TEXT VALUES ----------------------------------

---- REMOVE THE DUPS -- START 

WITH DUPS AS

( SELECT [DOCUMENT_NUMBER],[NUMBER],[ITEM], ROW_NUMBER() OVER (PARTITION BY [DOCUMENT_NUMBER],[NUMBER],[ITEM] 
                                                                ORDER BY [DOCUMENT_NUMBER]) AS RN
  FROM [MD].[DOCUMENT_NUMBER]
)

DELETE FROM DUPS WHERE RN > 1;

---- REMOVE THE DUPS --  END

SELECT @cnt_dw=COUNT(*) FROM [MD].[DOCUMENT_NUMBER];
EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL

BEGIN

EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[DOCUMENT_NUMBER] TGT
USING 
     (
SELECT DISTINCT 
@DATA_AS_OF_DATE AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
@DW_STATUS_IND AS [DW_STATUS_IND],
[FI_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),[FI_DOCUMENT_ITEM]) AS DOCUMENT_NUMBER, 
[FI_DOCUMENT_NO] AS NUMBER,
[FI_DOCUMENT_ITEM] AS ITEM, 
CASE WHEN [TEXT] IS NULL THEN ' ' ELSE [TEXT] END AS [TEXT]   
FROM  [TD].[FM_FI_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
UNION
SELECT DISTINCT 
@DATA_AS_OF_DATE AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
@DW_STATUS_IND AS [DW_STATUS_IND],
[FI_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),[FI_DOCUMENT_ITEM]) AS DOCUMENT_NUMBER, 
[FI_DOCUMENT_NO] AS NUMBER,
[FI_DOCUMENT_ITEM] AS ITEM, 
CASE WHEN [TEXT] IS NULL THEN ' ' ELSE [TEXT] END AS [TEXT]   
FROM  [TD].[FM_PARKED_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
UNION
SELECT DISTINCT 
@DATA_AS_OF_DATE AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
@DW_STATUS_IND AS [DW_STATUS_IND],
[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),[REF_ITEM]) AS DOCUMENT_NUMBER, 
[REF_DOCUMENT_NO] AS NUMBER,
[REF_ITEM] AS ITEM,
CASE WHEN [ITEM_TEXT] IS NULL THEN ' ' ELSE [ITEM_TEXT] END AS [TEXT] 
FROM [TD].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
UNION
SELECT DISTINCT 
@DATA_AS_OF_DATE AS [DATA_AS_OF_DATE],
CONVERT(DATE,GETDATE(),120) AS [DS_INSERT_DATE],
GETDATE() AS [DS_INSERT_TIME] ,
@DW_STATUS_IND AS [DW_STATUS_IND],
RTRIM(LTRIM([ENTRY_DOCUMENT_NO])) +'-'+ RTRIM(LTRIM([ENTRY_DOCUMENT_LINE])) AS DOCUMENT_NUMBER, 
RTRIM(LTRIM([ENTRY_DOCUMENT_NO])) AS NUMBER,
RTRIM(LTRIM([ENTRY_DOCUMENT_LINE])) AS ITEM,
CASE WHEN [TEXT] IS NULL THEN ' ' ELSE [TEXT] END AS [TEXT] 
FROM [TD].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
) SRC
ON 
TGT.NUMBER=SRC.NUMBER AND
TGT.ITEM=SRC.ITEM
WHEN MATCHED THEN 
UPDATE SET
TGT.DATA_AS_OF_DATE=SRC.DATA_AS_OF_DATE,
TGT.[DS_INSERT_DATE]=SRC.[DS_INSERT_DATE],
TGT.[DS_INSERT_TIME]=SRC.[DS_INSERT_TIME],
TGT.[DW_STATUS_IND]=SRC.[DW_STATUS_IND],
TGT.[NUMBER]=SRC.[NUMBER],
TGT.[ITEM]=SRC.[ITEM],
TGT.[TEXT]=SRC.[TEXT]
WHEN NOT MATCHED THEN
INSERT 
(		    [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[NUMBER]
           ,[ITEM]
           ,[TEXT]
)
VALUES (
			SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[NUMBER]
           ,SRC.[ITEM]
           ,SRC.[TEXT]
);



---- CLEAN UP THE TEXT VALUES FOR N/A -------------------------------
UPDATE [MD].[DOCUMENT_NUMBER] SET TEXT=' ' WHERE TEXT='N/A'
AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
;

----- END CLEAN UP THE TEXT VALUES ----------------------------------

/*
UPDATE [MD].[DOCUMENT_NUMBER]
SET NUMBER = LEFT(DOCUMENT_NUMBER,10)

UPDATE [MD].[DOCUMENT_NUMBER]
SET ITEM = RIGHT(DOCUMENT_NUMBER,LEN(DOCUMENT_NUMBER)-11)
*/

---- REMOVE THE DUPS -- START 

WITH DUPS AS

( SELECT [DOCUMENT_NUMBER],[NUMBER],[ITEM], ROW_NUMBER() OVER (PARTITION BY [DOCUMENT_NUMBER],[NUMBER],[ITEM] 
                                                                ORDER BY [DOCUMENT_NUMBER]) AS RN
  FROM [MD].[DOCUMENT_NUMBER]
								WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
)

DELETE FROM DUPS WHERE RN > 1;

---- REMOVE THE DUPS --  END


--Log End


SELECT @cnt_dw=COUNT(*) FROM [MD].[DOCUMENT_NUMBER]; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------
END CATCH



GO
/****** Object:  StoredProcedure [MD].[uspDOCUMENT_STATUS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*

TRUNCATE TABLE ETL.LOGGING
TRUNCATE TABLE [MD].[DOCUMENT_STATUS]
SELECT * FROM [MD].[DOCUMENT_STATUS]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspDOCUMENT_STATUS] 'S','2015-03-24'

EXEC [MD].[uspDOCUMENT_STATUS] 'F','1900-01-01'

EXEC [MD].[uspDOCUMENT_STATUS] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/

CREATE PROCEDURE [MD].[uspDOCUMENT_STATUS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspDOCUMENT_STATUS'
DECLARE @dw_object_name varchar(150)='MD.DOCUMENT_STATUS'
DECLARE @stg_object_name varchar(150)='STG_MD.DOCUMENT_STATUS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


-- TRUNCATE TABLE [MD].[DOCUMENT_STATUS];
--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[DOCUMENT_STATUS] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[DOCUMENT_STATUS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[DOCUMENT_STATUS] TGT
	 USING (
	  SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [DOCUMENT_STATUS],
     [NAME],
     [DESCRIPTION],
	 [DOCUMENT_STATUS]+' - '+[DESCRIPTION] AS [LONG_DESCRIPTION]
	  FROM 
	  [STG_MD_SYN].[DOCUMENT_STATUS] ) SRC
	 ON
TGT.DOCUMENT_STATUS=SRC.DOCUMENT_STATUS
WHEN MATCHED THEN 
UPDATE SET 
TGT.[NAME] = SRC.[NAME],
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[DOCUMENT_STATUS],
[NAME],
[DESCRIPTION],
[LONG_DESCRIPTION]
)

VALUES( 

SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[DOCUMENT_STATUS],
SRC.[NAME],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]

);

SELECT @cnt_dw=COUNT(*) FROM [MD].[DOCUMENT_STATUS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[DOCUMENT_STATUS] GROUP BY DOCUMENT_STATUS HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[DOCUMENT_STATUS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [MD].[DOCUMENT_STATUS] TGT
	 USING (
	  SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [DOCUMENT_STATUS],
     [NAME],
     [DESCRIPTION],
	 [DOCUMENT_STATUS]+' - '+[DESCRIPTION] AS [LONG_DESCRIPTION]
	  FROM 
	  [STG_MD_SYN].[DOCUMENT_STATUS]
	                     WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	   ) SRC
	 ON
TGT.DOCUMENT_STATUS=SRC.DOCUMENT_STATUS
WHEN MATCHED THEN 
UPDATE SET 
TGT.[NAME] = SRC.[NAME],
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[DOCUMENT_STATUS],
[NAME],
[DESCRIPTION],
[LONG_DESCRIPTION]
)

VALUES( 

SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[DOCUMENT_STATUS],
SRC.[NAME],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]

);


--Log End
SELECT @cnt_dw=COUNT(*) FROM [MD].[DOCUMENT_STATUS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[DOCUMENT_STATUS] GROUP BY DOCUMENT_STATUS HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [MD].[uspFOCUS_MSTR_DIM]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
SELECT * FROM ETL.CNTRL
TRUNCATE TABLE ETL.CNTRL

SELECT * FROM ETL.LOGGING

EXEC [MD].[uspFOCUS_MSTR_DIMENSION]
*/

CREATE PROCEDURE [MD].[uspFOCUS_MSTR_DIM]
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspFOCUS_MSTR_DIM'
DECLARE @dw_object_name varchar(150)='MULTIPLE TABLES'
DECLARE @stg_object_name varchar(150)='MULTIPLE TABLES'
DECLARE @Source_Type varchar(15)='TABLES'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

DECLARE @CNTRL_ROW_CNT int
DECLARE @DATA_AS_OF_DATE date
DECLARE @ERROR VARCHAR(1500)

SET @DATA_AS_OF_DATE=CONVERT(DATE,GETDATE(),120)
SELECT @CNTRL_ROW_CNT=COUNT(*) FROM [ETL].[CNTRL] WHERE OBJECT_TYPE='DIMENSION'
SET @cnt_dw=@CNTRL_ROW_CNT
--EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

 

 --IF @CNTRL_ROW_CNT>0 ----- IF THE CONTROL TABLE HAS BEEN POPULATED AND HAS VALUES THEN CONTINUE THE LOAD, OTHERWISE ABORT ---
 
	-- BEGIN --- START LOAD IF WE INDEED HAVE DIMENSION DATA TO BE PROCESSED FROM THE MASTER CONTROL TABLE >> ETL.CNTRL
 
 ------------------------------------- LOAD [AMOUNT_TYPE] -----------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_AT INT
DECLARE @DW_STATUS_IND_AT CHAR(1)
DECLARE @DATA_AS_OF_DATE_AT DATE
SELECT TOP 1 @DW_STATUS_IND_AT=[DW_STATUS_IND],@DATA_AS_OF_DATE_AT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[AMOUNT_TYPE]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_AT IS NOT NULL
 BEGIN
     --  BEGIN TRANSACTION AMOUNT_TYPE
										EXEC @RUN_STATUS_AT=[MD].[uspAMOUNT_TYPE] @DW_STATUS_IND_AT,@DATA_AS_OF_DATE_AT;
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[AMOUNT_TYPE]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_AT;
    --   COMMIT TRANSACTION AMOUNT_TYPE

	-- IF @RUN_STATUS_AT<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION AMOUNT_TYPE
	-- END 

END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [BCS_VALUE_TYPE] ---------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_BCS INT
DECLARE @DW_STATUS_IND_BCS CHAR(1)
DECLARE @DATA_AS_OF_DATE_BCS DATE
SELECT TOP 1 @DW_STATUS_IND_BCS=[DW_STATUS_IND],@DATA_AS_OF_DATE_BCS=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[BCS_VALUE_TYPE]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_BCS IS NOT NULL
BEGIN

   --  BEGIN TRANSACTION BCS_VALUE_TYPE
										EXEC @RUN_STATUS_BCS=[MD].[uspBCS_VALUE_TYPE] @DW_STATUS_IND_BCS,@DATA_AS_OF_DATE_BCS;
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[BCS_VALUE_TYPE]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_BCS;
	-- COMMIT TRANSACTION BCS_VALUE_TYPE

	-- IF @RUN_STATUS_BCS<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION BCS_VALUE_TYPE
	-- END 

END

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [BUDG_PROCESS] -------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_BUDG_PRS INT
DECLARE @DW_STATUS_IND_BUDG_PRS CHAR(1)
DECLARE @DATA_AS_OF_DATE_BUDG_PRS DATE
SELECT TOP 1 @DW_STATUS_IND_BUDG_PRS=[DW_STATUS_IND],@DATA_AS_OF_DATE_BUDG_PRS=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUDG_PROCESS]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_BUDG_PRS IS NOT NULL
BEGIN

   --  BEGIN TRANSACTION BUDG_PROCESS

										EXEC @RUN_STATUS_BUDG_PRS=[MD].[uspBUDG_PROCESS] @DW_STATUS_IND_BUDG_PRS,@DATA_AS_OF_DATE_BUDG_PRS;
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUDG_PROCESS]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_BUDG_PRS;
	-- COMMIT TRANSACTION BUDG_PROCESS

	-- IF @RUN_STATUS_BUDG_PRS<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION BUDG_PROCESS
	-- END 


END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [BUDG_CATEGORY] ------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_BUDG_CAT INT
DECLARE @DW_STATUS_IND_BUDG_CAT CHAR(1)
DECLARE @DATA_AS_OF_DATE_BUDG_CAT DATE
SELECT TOP 1 @DW_STATUS_IND_BUDG_CAT=[DW_STATUS_IND],@DATA_AS_OF_DATE_BUDG_CAT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUDGET_CATEGORY]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_BUDG_CAT IS NOT NULL
BEGIN

  --   BEGIN TRANSACTION BUDG_CATEGORY
										EXEC @RUN_STATUS_BUDG_CAT=[MD].[uspBUDGET_CATEGORY] @DW_STATUS_IND_BUDG_CAT,@DATA_AS_OF_DATE_BUDG_CAT;
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUDGET_CATEGORY]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_BUDG_CAT;

	-- COMMIT TRANSACTION BUDG_CATEGORY

	-- IF @RUN_STATUS_BUDG_CAT<>0
--	 BEGIN
	--		ROLLBACK TRANSACTION BUDG_CATEGORY
--	 END 

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [BUDGET_TYPE] ---------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_BUDG_TYP INT
DECLARE @DW_STATUS_IND_BUDG_TYP CHAR(1)
DECLARE @DATA_AS_OF_DATE_BUDG_TYP DATE
SELECT TOP 1 @DW_STATUS_IND_BUDG_TYP=[DW_STATUS_IND],@DATA_AS_OF_DATE_BUDG_TYP=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUDGET_TYPE]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_BUDG_TYP IS NOT NULL
BEGIN

   --  BEGIN TRANSACTION BUDGET_TYPE

										EXEC @RUN_STATUS_BUDG_TYP=[MD].[uspBUDGET_TYPE] @DW_STATUS_IND_BUDG_TYP,@DATA_AS_OF_DATE_BUDG_TYP;
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUDGET_TYPE]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_BUDG_TYP;
	-- COMMIT TRANSACTION BUDGET_TYPE

	-- IF @RUN_STATUS_BUDG_TYP<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION BUDGET_TYPE
	-- END

END
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [BUSINESS_AREA] ---------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_BA INT
DECLARE @DW_STATUS_IND_BA CHAR(1)
DECLARE @DATA_AS_OF_DATE_BA DATE
SELECT TOP 1 @DW_STATUS_IND_BA=[DW_STATUS_IND],@DATA_AS_OF_DATE_BA=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUSINESS_AREA]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_BA IS NOT NULL
BEGIN

   --  BEGIN TRANSACTION BUSINESS_AREA
	 
										EXEC @RUN_STATUS_BA=[MD].[uspBUSINESS_AREA] @DW_STATUS_IND_BA,@DATA_AS_OF_DATE_BA;
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[BUSINESS_AREA]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_BA;
	-- COMMIT TRANSACTION BUSINESS_AREA

	-- IF @RUN_STATUS_BA<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION BUSINESS_AREA
--	 END


END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [COMMITMENT_ITEM] --------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_CI INT
DECLARE @DW_STATUS_IND_CI CHAR(1)
DECLARE @DATA_AS_OF_DATE_CI DATE
SELECT TOP 1 @DW_STATUS_IND_CI=[DW_STATUS_IND],@DATA_AS_OF_DATE_CI=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[COMMITMENT_ITEM]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_CI IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION COMMITMENT_ITEM
	 
	 										EXEC @RUN_STATUS_CI=[MD].[uspCOMMITMENT_ITEM] @DW_STATUS_IND_CI,@DATA_AS_OF_DATE_CI;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[COMMITMENT_ITEM]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_CI;
	-- COMMIT TRANSACTION COMMITMENT_ITEM

	-- IF @RUN_STATUS_CI<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION COMMITMENT_ITEM
	-- END

END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [DOCUMENT_STATUS] -------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_DS INT
DECLARE @DW_STATUS_IND_DS CHAR(1)
DECLARE @DATA_AS_OF_DATE_DS DATE
SELECT TOP 1 @DW_STATUS_IND_DS=[DW_STATUS_IND],@DATA_AS_OF_DATE_DS=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[DOCUMENT_STATUS]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_DS IS NOT NULL
BEGIN

   --  BEGIN TRANSACTION DOCUMENT_STATUS
	 
											EXEC @RUN_STATUS_DS=[MD].[uspDOCUMENT_STATUS] @DW_STATUS_IND_DS,@DATA_AS_OF_DATE_DS;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[DOCUMENT_STATUS]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_DS;
	-- COMMIT TRANSACTION DOCUMENT_STATUS

	-- IF @RUN_STATUS_DS<>0
	-- BEGIN
	---		ROLLBACK TRANSACTION DOCUMENT_STATUS
	-- END

END
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [FUNCTIONAL_AREA] -------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_FA INT
DECLARE @DW_STATUS_IND_FA CHAR(1)
DECLARE @DATA_AS_OF_DATE_FA DATE
SELECT TOP 1 @DW_STATUS_IND_FA=[DW_STATUS_IND],@DATA_AS_OF_DATE_FA=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUNCTIONAL_AREA]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_FA IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION FUNCTIONAL_AREA
	 
											EXEC @RUN_STATUS_FA=[MD].[uspFUNCTIONAL_AREA] @DW_STATUS_IND_FA,@DATA_AS_OF_DATE_FA;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUNCTIONAL_AREA]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FA;
	-- COMMIT TRANSACTION FUNCTIONAL_AREA

	-- IF @RUN_STATUS_FA<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION FUNCTIONAL_AREA
	-- END

END
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [FUND] ------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_FD INT
DECLARE @DW_STATUS_IND_FD CHAR(1)
DECLARE @DATA_AS_OF_DATE_FD DATE
SELECT TOP 1 @DW_STATUS_IND_FD=[DW_STATUS_IND],@DATA_AS_OF_DATE_FD=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUND]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_FD IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION FUND	 

											EXEC @RUN_STATUS_FD=[MD].[uspFUND] @DW_STATUS_IND_FD,@DATA_AS_OF_DATE_FD;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUND]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FD;
	-- COMMIT TRANSACTION FUND

	-- IF @RUN_STATUS_FD<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION FUND
	-- END

END
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [FUNDED_PROGRAM] --------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_FP INT
DECLARE @DW_STATUS_IND_FP CHAR(1)
DECLARE @DATA_AS_OF_DATE_FP DATE
SELECT TOP 1 @DW_STATUS_IND_FP=[DW_STATUS_IND],@DATA_AS_OF_DATE_FP=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUNDED_PROGRAM]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_FP IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION FUNDED_PROGRAM	 

											EXEC @RUN_STATUS_FP=[MD].[uspFUNDED_PROGRAM] @DW_STATUS_IND_FP,@DATA_AS_OF_DATE_FP;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUNDED_PROGRAM]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FP;
	-- COMMIT TRANSACTION FUNDED_PROGRAM
	 
	-- IF @RUN_STATUS_FP<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION FUNDED_PROGRAM
	-- END

END
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [FUNDS_CENTER] ---------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_FC INT
DECLARE @DW_STATUS_IND_FC CHAR(1)
DECLARE @DATA_AS_OF_DATE_FC DATE
SELECT TOP 1 @DW_STATUS_IND_FC=[DW_STATUS_IND],@DATA_AS_OF_DATE_FC=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUNDS_CENTER]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_FC IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION FUNDS_CENTER	 

											EXEC @RUN_STATUS_FC=[MD].[uspFUNDS_CENTER] @DW_STATUS_IND_FC,@DATA_AS_OF_DATE_FC;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[FUNDS_CENTER]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FC;
	-- COMMIT TRANSACTION FUNDS_CENTER

	-- IF @RUN_STATUS_FC<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION FUNDS_CENTER
	-- END


END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------- LOAD [GRANT] ---------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_GT INT
DECLARE @DW_STATUS_IND_GT CHAR(1)
DECLARE @DATA_AS_OF_DATE_GT DATE
SELECT TOP 1 @DW_STATUS_IND_GT=[DW_STATUS_IND],@DATA_AS_OF_DATE_GT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[GRANT]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_GT IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION [GRANT]	 

											EXEC @RUN_STATUS_GT=[MD].[uspGRANT] @DW_STATUS_IND_GT,@DATA_AS_OF_DATE_GT;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[GRANT]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_GT;
	-- COMMIT TRANSACTION [GRANT]

	-- IF @RUN_STATUS_GT<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION [GRANT]
	-- END

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------- LOAD [STAT_INDICATOR]---------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_STAT INT
DECLARE @DW_STATUS_IND_STAT CHAR(1)
DECLARE @DATA_AS_OF_DATE_STAT DATE
SELECT TOP 1 @DW_STATUS_IND_STAT=[DW_STATUS_IND],@DATA_AS_OF_DATE_STAT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[STAT_INDICATOR]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_STAT IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION STAT_INDICATOR 

											EXEC @RUN_STATUS_STAT=[MD].[uspSTAT_INDICATOR] @DW_STATUS_IND_STAT,@DATA_AS_OF_DATE_STAT;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[STAT_INDICATOR]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_STAT;
	-- COMMIT TRANSACTION STAT_INDICATOR

	-- IF @RUN_STATUS_STAT<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION STAT_INDICATOR
	-- END

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ LOAD [VALUE_TYPE]------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_VT INT
DECLARE @DW_STATUS_IND_VT CHAR(1)
DECLARE @DATA_AS_OF_DATE_VT DATE
SELECT TOP 1 @DW_STATUS_IND_VT=[DW_STATUS_IND],@DATA_AS_OF_DATE_VT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[VALUE_TYPE]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_VT IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION VALUE_TYPE 

											EXEC @RUN_STATUS_VT=[MD].[uspVALUE_TYPE] @DW_STATUS_IND_VT,@DATA_AS_OF_DATE_VT;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[VALUE_TYPE]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_VT;
	-- COMMIT TRANSACTION VALUE_TYPE

	-- IF @RUN_STATUS_VT<>0
	-- BEGIN
	---		ROLLBACK TRANSACTION VALUE_TYPE
	-- END

END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ LOAD [VERSION] --------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_VER INT
DECLARE @DW_STATUS_IND_VER CHAR(1)
DECLARE @DATA_AS_OF_DATE_VER DATE
SELECT TOP 1 @DW_STATUS_IND_VER=[DW_STATUS_IND],@DATA_AS_OF_DATE_VER=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[VERSION]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_VER IS NOT NULL
BEGIN

     --BEGIN TRANSACTION [VERSION] 

											EXEC @RUN_STATUS_VER=[MD].[uspVERSION] @DW_STATUS_IND_VER,@DATA_AS_OF_DATE_VER;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[VERSION]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_VER;
	-- COMMIT TRANSACTION [VERSION]

	-- IF @RUN_STATUS_VER<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION [VERSION]
	-- END


END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ LOAD [WORKFLOW_STATUS] ------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_WFS INT
DECLARE @DW_STATUS_IND_WFS CHAR(1)
DECLARE @DATA_AS_OF_DATE_WFS DATE
SELECT TOP 1 @DW_STATUS_IND_WFS=[DW_STATUS_IND],@DATA_AS_OF_DATE_WFS=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[WORKFLOW_STATUS]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_WFS IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION WORKFLOW_STATUS

											EXEC @RUN_STATUS_WFS=[MD].[uspWORKFLOW_STATUS] @DW_STATUS_IND_WFS,@DATA_AS_OF_DATE_WFS;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[WORKFLOW_STATUS]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_WFS;
	-- COMMIT TRANSACTION WORKFLOW_STATUS

	-- IF @RUN_STATUS_WFS<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION WORKFLOW_STATUS
	-- END

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ LOAD [ORDER] ------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_ORD INT
DECLARE @DW_STATUS_IND_ORD CHAR(1)
DECLARE @DATA_AS_OF_DATE_ORD DATE
SELECT TOP 1 @DW_STATUS_IND_ORD=[DW_STATUS_IND],@DATA_AS_OF_DATE_ORD=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[ORDER]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_ORD IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION ORDER

											EXEC @RUN_STATUS_ORD=[MD].[uspORDER] @DW_STATUS_IND_ORD,@DATA_AS_OF_DATE_ORD;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[ORDER]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_ORD;
	-- COMMIT TRANSACTION ORDER

	-- IF @RUN_STATUS_WFS<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION ORDER
	-- END

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ LOAD [WBS_ELEMENT] ------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_WBS INT
DECLARE @DW_STATUS_IND_WBS CHAR(1)
DECLARE @DATA_AS_OF_DATE_WBS DATE
SELECT TOP 1 @DW_STATUS_IND_WBS=[DW_STATUS_IND],@DATA_AS_OF_DATE_WBS=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_MD_SYN].[WBS_ELEMENT]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_WBS IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION WBS_ELEMENT

											EXEC @RUN_STATUS_WBS=[MD].[uspWBS_ELEMENT] @DW_STATUS_IND_WBS,@DATA_AS_OF_DATE_WBS;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_MD_SYN].[WBS_ELEMENT]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_WBS;
	-- COMMIT TRANSACTION WBS_ELEMENT

	-- IF @RUN_STATUS_WFS<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION WBS_ELEMENT
	-- END

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	--END -- ---- END OF THE TEST FOR DIMENSION VALUES PRESENT IN THE CONTROL TABLE >>  ETL.CNTRL

--EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE()
 --EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH




GO
/****** Object:  StoredProcedure [MD].[uspFOCUS_MSTR_FACT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
SELECT * FROM ETL.CNTRL
TRUNCATE TABLE ETL.CNTRL

SELECT * FROM ETL.LOGGING

EXEC [MD].[uspFOCUS_MSTR_DIMENSION]
*/

CREATE PROCEDURE [MD].[uspFOCUS_MSTR_FACT]
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)
DECLARE @File_Name varchar(150)
DECLARE @Source_Type varchar(15)
DECLARE @Error_Message varchar(8000)
DECLARE @rows_loaded int
DECLARE @CNTRL_ROW_CNT int
DECLARE @DATA_AS_OF_DATE date
DECLARE @ERROR VARCHAR(1500)

SET @Proc_Name = '[MD].[uspFOCUS_MSTR_FACT]'
SET @File_Name='FACT LOAD'
SET @Source_Type='FACT'
SET @Error_Message=''
SET @rows_loaded=0
SET @DATA_AS_OF_DATE=CONVERT(DATE,GETDATE(),120)
SELECT @CNTRL_ROW_CNT=COUNT(*) FROM [ETL].[CNTRL] WHERE OBJECT_TYPE='FACT'

--Log Start
 --EXEC ETL.uspLOG_LOAD 'START',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded,@DATA_AS_OF_DATE

-- IF @CNTRL_ROW_CNT>0 ----- IF THE CONTROL TABLE HAS BEEN POPULATED AND HAS VALUES THEN CONTINUE THE LOAD, OTHERWISE ABORT ---
 
	-- BEGIN --- START LOAD IF WE HAVE FRESH FACT DATA TO BE PROCESSED FROM THE MASTER CONTROL TABLE >> ETL.CNTRL
  
----------------------------------- LOAD [FM_BDGT_ENTR] ----------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_BDGT INT
DECLARE @DW_STATUS_IND_BDGT CHAR(1)
DECLARE @DATA_AS_OF_DATE_BDGT DATE
SELECT TOP 1 @DW_STATUS_IND_BDGT=[DW_STATUS_IND],@DATA_AS_OF_DATE_BDGT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_BDGT_ENTR]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_BDGT IS NOT NULL
BEGIN

     --BEGIN TRANSACTION FM_BDGT_ENTR

											EXEC @RUN_STATUS_BDGT=[TD].[uspFM_BDGT_ENTR] @DW_STATUS_IND_BDGT,@DATA_AS_OF_DATE_BDGT;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_BDGT_ENTR]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_BDGT;
	 --COMMIT TRANSACTION FM_BDGT_ENTR

	 --IF @RUN_STATUS_BDGT<>0
	 --BEGIN
	--		ROLLBACK TRANSACTION FM_BDGT_ENTR
	 --END 

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ LOAD [FM_CMMT_LNITMS]--------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_CMMT INT
DECLARE @DW_STATUS_IND_CMMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_CMMT DATE
SELECT TOP 1 @DW_STATUS_IND_CMMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_CMMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_CMMT_LNITMS]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_CMMT IS NOT NULL
BEGIN

     --BEGIN TRANSACTION FM_CMMT_LNITMS

											EXEC @RUN_STATUS_CMMT=[TD].[uspFM_CMMTS_LNITMS] @DW_STATUS_IND_CMMT,@DATA_AS_OF_DATE_CMMT;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_CMMT_LNITMS]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_CMMT;
	 --COMMIT TRANSACTION FM_CMMT_LNITMS

--	 IF @RUN_STATUS_CMMT<>0
	-- BEGIN
		--	ROLLBACK TRANSACTION FM_CMMT_LNITMS
	 --END 

END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------LOAD [FM_FI_LNITMS]-------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_FI INT
DECLARE @DW_STATUS_IND_FI CHAR(1)
DECLARE @DATA_AS_OF_DATE_FI DATE
SELECT TOP 1 @DW_STATUS_IND_FI=[DW_STATUS_IND],@DATA_AS_OF_DATE_FI=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_FI_LNITMS]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_FI IS NOT NULL
BEGIN

    -- BEGIN TRANSACTION FM_FI_LNITMS
	 
							EXEC @RUN_STATUS_FI=[TD].[uspFM_FI_LNITMS] @DW_STATUS_IND_FI,@DATA_AS_OF_DATE_FI;
							UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[STG_TD_SYN].[FM_FI_LNITMS]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FI;
							
							EXEC [TD].[uspFM_FI_LNITMS_QA] @DW_STATUS_IND_FI,@DATA_AS_OF_DATE_FI;
							UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='TD.uspFM_FI_LNITMS_QA' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FI;
							
							EXEC [TD].[uspFM_PARKED_LNITMS] @DW_STATUS_IND_FI,@DATA_AS_OF_DATE_FI;
							UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='TD.uspFM_PARKED_LNITMS' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_FI;
							

	-- COMMIT TRANSACTION FM_FI_LNITMS

	 --IF @RUN_STATUS_FI<>0
	 --BEGIN
	--		ROLLBACK TRANSACTION FM_FI_LNITMS
	 --END 

END
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This is in fact a cube dimension, however, we are treating it as a 'degenerate fact' which it basically is;
-- Also note that there are issues with processing and maintaining a dimension of this size;
-- Processing sequence  after the completion of all of facts is necessary and the only proper why to get correct  and 
-- accurate data since we are 'manufacturing' this dimension (nothing is passed down that is called 'Document_Number' from SAP)
------------------------------------- LOAD [DOCUMENT_NUMBER] --------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_DN INT
DECLARE @DW_STATUS_IND_DN CHAR(1)
DECLARE @DATA_AS_OF_DATE_DN DATE
SELECT TOP 1 @DW_STATUS_IND_DN=[DW_STATUS_IND],@DATA_AS_OF_DATE_DN=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='[MD].[DOCUMENT_NUMBER]' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_DN IS NOT NULL
BEGIN

   --  BEGIN TRANSACTION DOCUMENT_NUMBER
	 
	 										EXEC @RUN_STATUS_DN=[MD].[uspDOCUMENT_NUMBER] @DW_STATUS_IND_DN,@DATA_AS_OF_DATE_DN;
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='[MD].[DOCUMENT_NUMBER]' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_DN;
	-- COMMIT TRANSACTION DOCUMENT_NUMBER

	-- IF @RUN_STATUS_DN<>0
	-- BEGIN
	--		ROLLBACK TRANSACTION DOCUMENT_NUMBER
	-- END

END
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   -- END  ---- END OF THE TEST FOR VALUES PRESENT IN THE CONTROL TABLE >>  ETL.CNTRL

--Log End
--EXEC ETL.uspLOG_LOAD 'END',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded,@DATA_AS_OF_DATE

END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE()
 --EXEC ETL.uspLOG_LOAD 'FAILED',@Proc_Name,@file_name,@Source_Type,@Error_Message,-1,@DATA_AS_OF_DATE
 ------------------------------------------------------------------------------
END CATCH




GO
/****** Object:  StoredProcedure [MD].[uspFOCUS_MSTR_METRIC]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
SELECT * FROM ETL.CNTRL
TRUNCATE TABLE ETL.CNTRL

SELECT * FROM ETL.LOGGING

EXEC [MD].[uspFOCUS_MSTR_DIMENSION]
*/

CREATE PROCEDURE [MD].[uspFOCUS_MSTR_METRIC]
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)
DECLARE @File_Name varchar(150)
DECLARE @Source_Type varchar(15)
DECLARE @Error_Message varchar(8000)
DECLARE @rows_loaded int
DECLARE @CNTRL_ROW_CNT int
DECLARE @DATA_AS_OF_DATE date
DECLARE @ERROR VARCHAR(1500)

SET @Proc_Name = '[MD].[uspFOCUS_MSTR_METRIC]'
SET @File_Name='METRIC LOAD'
SET @Source_Type='METRIC'
SET @Error_Message=''
SET @rows_loaded=0
SET @DATA_AS_OF_DATE=CONVERT(DATE,GETDATE(),120)
SELECT @CNTRL_ROW_CNT=COUNT(*) FROM [ETL].[CNTRL] WHERE OBJECT_TYPE='PROCEDURE'

--Log Start
 --EXEC ETL.uspLOG_LOAD 'START',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded,@DATA_AS_OF_DATE
 
 
 IF @CNTRL_ROW_CNT>0 ----- IF THE CONTROL TABLE HAS BEEN POPULATED AND HAS VALUES THEN CONTINUE PROCESSING, OTHERWISE ABORT ---
 
	 BEGIN --- START PROCESSING IF WE INDEED HAVE PROCEDURES SCHEDULED TO BE RUN IN THE MASTER CONTROL TABLE >> ETL.CNTRL

 --------------------------- RUN uspEXPENDITURE_AMOUNT ------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @RUN_STATUS_EXP_AMT INT
DECLARE @DW_STATUS_IND_EXP_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_EXP_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_EXP_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_EXP_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspEXPENDITURE_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_EXP_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspEXPENDITURE_AMOUNT

											EXEC @RUN_STATUS_EXP_AMT=[MX].[uspEXPENDITURE_AMOUNT] @DW_STATUS_IND_EXP_AMT,@DATA_AS_OF_DATE_EXP_AMT
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspEXPENDITURE_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_EXP_AMT

	 COMMIT TRANSACTION uspEXPENDITURE_AMOUNT

	 IF @RUN_STATUS_EXP_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspEXPENDITURE_AMOUNT
	 END 

END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------- RUN uspENCUMBRANCE_AMOUNT ---------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_ENCBR_AMT INT
DECLARE @DW_STATUS_IND_ENCBR_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_ENCBR_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_ENCBR_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_ENCBR_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspENCUMBRANCE_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_ENCBR_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspENCUMBRANCE_AMOUNT

											EXEC @RUN_STATUS_ENCBR_AMT=[MX].[uspENCUMBRANCE_AMOUNT] @DW_STATUS_IND_ENCBR_AMT,@DATA_AS_OF_DATE_ENCBR_AMT
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspENCUMBRANCE_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_ENCBR_AMT

	 COMMIT TRANSACTION uspENCUMBRANCE_AMOUNT

	  IF @RUN_STATUS_ENCBR_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspENCUMBRANCE_AMOUNT
	 END 

END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------- RUN uspPRE_ENCUMBRANCE_AMOUNT -----------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_PRE_ENCBR_AMT INT
DECLARE @DW_STATUS_IND_PRE_ENCBR_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_PRE_ENCBR_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_PRE_ENCBR_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_PRE_ENCBR_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspPRE_ENCUMBRANCE_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_PRE_ENCBR_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspPRE_ENCUMBRANCE_AMOUNT

											EXEC @RUN_STATUS_PRE_ENCBR_AMT=[MX].[uspPRE_ENCUMBRANCE_AMOUNT] @DW_STATUS_IND_PRE_ENCBR_AMT,@DATA_AS_OF_DATE_PRE_ENCBR_AMT
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspPRE_ENCUMBRANCE_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_PRE_ENCBR_AMT

	 COMMIT TRANSACTION uspPRE_ENCUMBRANCE_AMOUNT

	  IF @RUN_STATUS_PRE_ENCBR_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspPRE_ENCUMBRANCE_AMOUNT
	 END 

END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------- RUN uspORIGINAL_BUDGET_AMOUNT------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_OB_AMT INT
DECLARE @DW_STATUS_IND_OB_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_OB_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_OB_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_OB_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspORIGINAL_BUDGET_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_OB_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspORIGINAL_BUDGET_AMOUNT

											EXEC @RUN_STATUS_OB_AMT=[MX].[uspORIGINAL_BUDGET_AMOUNT] @DW_STATUS_IND_OB_AMT,@DATA_AS_OF_DATE_OB_AMT
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspORIGINAL_BUDGET_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_OB_AMT

	 COMMIT TRANSACTION uspORIGINAL_BUDGET_AMOUNT

	  IF @RUN_STATUS_OB_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspORIGINAL_BUDGET_AMOUNT
	 END 


END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------- RUN uspCARRY_FORWARD_BUDGET_AMOUNT---------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_CFB_AMT INT
DECLARE @DW_STATUS_IND_CFB_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_CFB_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_CFB_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_CFB_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspCARRY_FORWARD_BUDGET_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_CFB_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspCARRY_FORWARD_BUDGET_AMOUNT

											EXEC @RUN_STATUS_CFB_AMT=[MX].[uspCARRY_FORWARD_BUDGET_AMOUNT] @DW_STATUS_IND_CFB_AMT,@DATA_AS_OF_DATE_CFB_AMT
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspCARRY_FORWARD_BUDGET_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_CFB_AMT

	 COMMIT TRANSACTION uspCARRY_FORWARD_BUDGET_AMOUNT

	 IF @RUN_STATUS_CFB_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspCARRY_FORWARD_BUDGET_AMOUNT
	 END 

END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------- RUN uspCHANGED_BUDGET_AMOUNT---------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_CHB_AMT INT
DECLARE @DW_STATUS_IND_CHB_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_CHB_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_CHB_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_CHB_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspCHANGED_BUDGET_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_CHB_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspCHANGED_BUDGET_AMOUNT

											EXEC @RUN_STATUS_CHB_AMT=[MX].[uspCHANGED_BUDGET_AMOUNT] @DW_STATUS_IND_CHB_AMT,@DATA_AS_OF_DATE_CHB_AMT
											UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspCHANGED_BUDGET_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_CHB_AMT

	 COMMIT TRANSACTION uspCHANGED_BUDGET_AMOUNT

	 IF @RUN_STATUS_CHB_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspCHANGED_BUDGET_AMOUNT
	 END 

END
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------- RUN uspCURRENT_BUDGET_AMOUNT---------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @RUN_STATUS_CURB_AMT INT
DECLARE @DW_STATUS_IND_CURB_AMT CHAR(1)
DECLARE @DATA_AS_OF_DATE_CURB_AMT DATE
SELECT TOP 1 @DW_STATUS_IND_CURB_AMT=[DW_STATUS_IND],@DATA_AS_OF_DATE_CURB_AMT=[DATA_AS_OF_DATE] FROM [ETL].[CNTRL] WHERE [OBJECT_NAME]='MX.uspCURRENT_BUDGET_AMOUNT' ORDER BY DATA_AS_OF_DATE
IF @DATA_AS_OF_DATE_CURB_AMT IS NOT NULL
BEGIN

     BEGIN TRANSACTION uspCURRENT_BUDGET_AMOUNT

										EXEC @RUN_STATUS_CURB_AMT=[MX].[uspCURRENT_BUDGET_AMOUNT] @DW_STATUS_IND_CURB_AMT,@DATA_AS_OF_DATE_CURB_AMT
										UPDATE [ETL].[CNTRL] SET [DW_STATUS_IND]='L' WHERE [OBJECT_NAME]='MX.uspCURRENT_BUDGET_AMOUNT' AND DATA_AS_OF_DATE=@DATA_AS_OF_DATE_CURB_AMT

	 COMMIT TRANSACTION uspCURRENT_BUDGET_AMOUNT

	 IF @RUN_STATUS_CURB_AMT<>0
	 BEGIN
			ROLLBACK TRANSACTION uspCURRENT_BUDGET_AMOUNT
	 END 


END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	END -- ---- END OF THE TEST FOR PROCEDURE VALUES PRESENT IN THE CONTROL TABLE >>  ETL.CNTRL

--Log End
--EXEC ETL.uspLOG_LOAD 'END',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded,@DATA_AS_OF_DATE

END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE()
 --EXEC ETL.uspLOG_LOAD 'FAILED',@Proc_Name,@file_name,@Source_Type,@Error_Message,-1,@DATA_AS_OF_DATE
 ------------------------------------------------------------------------------
END CATCH




GO
/****** Object:  StoredProcedure [MD].[uspFUNCTIONAL_AREA]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*


TRUNCATE TABLE [MD].FUNCTIONAL_AREA]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[FUNCTIONAL_AREA]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspFUNCTIONAL_AREA] 'S','2015-03-24'

EXEC [MD].[uspFUNCTIONAL_AREA] 'F','1900-01-01'

EXEC [MD].[uspFUNCTIONAL_AREA] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspFUNCTIONAL_AREA]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspFUNCTIONAL_AREA'
DECLARE @dw_object_name varchar(150)='MD.FUNCTIONAL_AREA'
DECLARE @stg_object_name varchar(150)='STG_MD.FUNCTIONAL_AREA'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0



--TRUNCATE TABLE [MD].[FUNCTIONAL_AREA]
--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM  [MD].[FUNCTIONAL_AREA] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUNCTIONAL_AREA];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[FUNCTIONAL_AREA] TGT
	 USING 
	 (
	 SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [FUNCTIONAL_AREA],
     [DESCRIPTION],
	 [FUNCTIONAL_AREA]+' - '+[DESCRIPTION] AS LONG_DESCRIPTION
	 FROM [STG_MD_SYN].[FUNCTIONAL_AREA] ) SRC
	 ON
TGT.FUNCTIONAL_AREA=SRC.FUNCTIONAL_AREA
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[FUNCTIONAL_AREA],
[DESCRIPTION],
[LONG_DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[FUNCTIONAL_AREA],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]
);

/*

IF NOT EXISTS (SELECT * FROM [MD].[FUNCTIONAL_AREA] where [FUNCTIONAL_AREA]='-1')
BEGIN 

INSERT [MD].[FUNCTIONAL_AREA] (
[FUNCTIONAL_AREA],
[DESCRIPTION]
)
VALUES (
'-1',
'UNKNOWN'
)


END
*/

SELECT @cnt_dw=COUNT(*) FROM [MD].[FUNCTIONAL_AREA];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUNCTIONAL_AREA] GROUP BY FUNCTIONAL_AREA HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUNCTIONAL_AREA] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [MD].[FUNCTIONAL_AREA] TGT
	 USING 
	 (
	 SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [FUNCTIONAL_AREA],
     [DESCRIPTION],
	 [FUNCTIONAL_AREA]+' - '+[DESCRIPTION] AS LONG_DESCRIPTION
	 FROM [STG_MD_SYN].[FUNCTIONAL_AREA]
	                      WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	  ) SRC
	 ON
TGT.FUNCTIONAL_AREA=SRC.FUNCTIONAL_AREA
WHEN MATCHED THEN 
UPDATE SET 
TGT.[DESCRIPTION] = SRC.[DESCRIPTION],
TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
[DATA_AS_OF_DATE],
[DS_INSERT_DATE],
[DS_INSERT_TIME],
[DW_STATUS_IND],
[FUNCTIONAL_AREA],
[DESCRIPTION],
[LONG_DESCRIPTION]
 )
VALUES( 
SRC.[DATA_AS_OF_DATE],
SRC.[DS_INSERT_DATE],
SRC.[DS_INSERT_TIME],
SRC.[DW_STATUS_IND],
SRC.[FUNCTIONAL_AREA],
SRC.[DESCRIPTION],
SRC.[LONG_DESCRIPTION]
);


--Log End
SELECT @cnt_dw=COUNT(*) FROM [MD].[FUNCTIONAL_AREA] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUNCTIONAL_AREA] GROUP BY FUNCTIONAL_AREA HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspFUND]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

TRUNCATE TABLE [MD].[FUND]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[FUND]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspFUND] 'S','2015-03-24'

EXEC [MD].[uspFUND] 'F','1900-01-01'

EXEC [MD].[uspFUND] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspFUND]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspFUND'
DECLARE @dw_object_name varchar(150)='MD.FUND'
DECLARE @stg_object_name varchar(150)='STG_MD.FUND'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


--TRUNCATE TABLE [MD].[FUND]
 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[FUND] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUND];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[FUND] TGT
	 USING 
 (SELECT 
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
      ,[FUND]
      ,[FM_AREA]
      ,[VALID_FROM]
      ,[VALID_TO]
      ,[FY_VARIANT]
      ,[CUSTOMER_FOR_FUND]
      ,[APPLCTN]
      ,[FUND_TYPE]
      ,[EXPIRATION_DATE]
      ,[CREATED_BY]
      ,[ENTRY_DATE]
      ,[CHANGED_BY]
      ,[CHANGED_ON]
      ,[BALANCE_UPDATE]
      ,[SUBDIVISION_ID]
      ,[FD_SUBSTRING1]
      ,[FD_SUBSTRING2]
      ,[NAME]
      ,[DESCRIPTION]
	  ,[FUND] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION 
FROM [STG_MD_SYN].[FUND]
--	 WHERE DW_STATUS_IND='S'
) SRC
	 ON
TGT.[FUND]=SRC.[FUND] 
WHEN MATCHED THEN 
UPDATE SET 
   	TGT.[FM_AREA]=SRC.[FM_AREA],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[VALID_TO]=SRC.[VALID_TO],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[CUSTOMER_FOR_FUND]=SRC.[CUSTOMER_FOR_FUND],
	TGT.[APPLCTN] =SRC.[APPLCTN],
	TGT.[FUND_TYPE]=SRC.[FUND_TYPE],
	TGT.[EXPIRATION_DATE]=SRC.[EXPIRATION_DATE],
	TGT.[CREATED_BY]=SRC.[CREATED_BY],
	TGT.[ENTRY_DATE]=SRC.[ENTRY_DATE],
	TGT.[CHANGED_BY]=SRC.[CHANGED_BY],
	TGT.[CHANGED_ON]=SRC.[CHANGED_ON],
	TGT.[BALANCE_UPDATE]=SRC.[BALANCE_UPDATE],
	TGT.[SUBDIVISION_ID]=SRC.[SUBDIVISION_ID],
	TGT.[FD_SUBSTRING1]=SRC.[FD_SUBSTRING1],
	TGT.[FD_SUBSTRING2]=SRC.[FD_SUBSTRING2],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
	
WHEN NOT MATCHED THEN
INSERT 
(
    
	[DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [FUND],
	[FM_AREA],
	[VALID_FROM] ,
	[VALID_TO] ,
	[FY_VARIANT] ,
	[CUSTOMER_FOR_FUND],
	[APPLCTN] ,
	[FUND_TYPE] ,
	[EXPIRATION_DATE] ,
	[CREATED_BY] ,
	[ENTRY_DATE] ,
	[CHANGED_BY] ,
	[CHANGED_ON] ,
	[BALANCE_UPDATE] ,
	[SUBDIVISION_ID],
	[FD_SUBSTRING1] ,
	[FD_SUBSTRING2] ,
	[NAME],
	[DESCRIPTION] ,
	[LONG_DESCRIPTION]
	 

	 )
VALUES( 

       SRC. [DATA_AS_OF_DATE]
      ,SRC.[DS_INSERT_DATE]
      ,SRC.[DS_INSERT_TIME]
      ,SRC.[DW_STATUS_IND]
	  ,SRC.[FUND]
      ,SRC.[FM_AREA]
      ,SRC.[VALID_FROM]
      ,SRC.[VALID_TO]
      ,SRC.[FY_VARIANT]
      ,SRC.[CUSTOMER_FOR_FUND]
      ,SRC.[APPLCTN]
      ,SRC.[FUND_TYPE]
      ,SRC.[EXPIRATION_DATE]
      ,SRC.[CREATED_BY]
      ,SRC.[ENTRY_DATE]
      ,SRC.[CHANGED_BY]
      ,SRC.[CHANGED_ON]
      ,SRC.[BALANCE_UPDATE]
      ,SRC.[SUBDIVISION_ID]
      ,SRC.[FD_SUBSTRING1]
      ,SRC.[FD_SUBSTRING2]
      ,SRC.[NAME]
      ,SRC.[DESCRIPTION]
	  ,SRC.[LONG_DESCRIPTION]
	

);


/*

IF NOT EXISTS (SELECT * FROM [MD].[FUND] where [FUND]='-1')
BEGIN 

INSERT [MD].[FUND] (

    [FUND],
	[FM_AREA],
	[VALID_FROM] ,
	[VALID_TO] ,
	[FY_VARIANT] ,
	[CUSTOMER_FOR_FUND],
	[APPLCTN] ,
	[FUND_TYPE] ,
	[EXPIRATION_DATE] ,
	[CREATED_BY] ,
	[ENTRY_DATE] ,
	[CHANGED_BY] ,
	[CHANGED_ON] ,
	[BALANCE_UPDATE] ,
	[SUBDIVISION_ID],
	[FD_SUBSTRING1] ,
	[FD_SUBSTRING2] ,
	[NAME],
	[DESCRIPTION] ,
	[LONG_DESCRIPTION]
    
)
VALUES (

'Unknown',
'Unkn',
'1900-01-01',
'1900-01-01',
'U',
'Unknown',
'Unknown',
'Unkn',
'1900-01-01',
'Unknown',
'1900-01-01',
'Unknown',
'1900-01-01',
'U',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown'
)


END
*/

SELECT @cnt_dw=COUNT(*) FROM [MD].[FUND];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUND] GROUP BY FUND HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END 

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUND] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[FUND] TGT
	 USING 
 (SELECT 
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
      ,[FUND]
      ,[FM_AREA]
      ,[VALID_FROM]
      ,[VALID_TO]
      ,[FY_VARIANT]
      ,[CUSTOMER_FOR_FUND]
      ,[APPLCTN]
      ,[FUND_TYPE]
      ,[EXPIRATION_DATE]
      ,[CREATED_BY]
      ,[ENTRY_DATE]
      ,[CHANGED_BY]
      ,[CHANGED_ON]
      ,[BALANCE_UPDATE]
      ,[SUBDIVISION_ID]
      ,[FD_SUBSTRING1]
      ,[FD_SUBSTRING2]
      ,[NAME]
      ,[DESCRIPTION]
	  ,[FUND] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION 
FROM [STG_MD_SYN].[FUND]
					WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
) SRC
	 ON
TGT.[FUND]=SRC.[FUND] 
WHEN MATCHED THEN 
UPDATE SET 
   	TGT.[FM_AREA]=SRC.[FM_AREA],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[VALID_TO]=SRC.[VALID_TO],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[CUSTOMER_FOR_FUND]=SRC.[CUSTOMER_FOR_FUND],
	TGT.[APPLCTN] =SRC.[APPLCTN],
	TGT.[FUND_TYPE]=SRC.[FUND_TYPE],
	TGT.[EXPIRATION_DATE]=SRC.[EXPIRATION_DATE],
	TGT.[CREATED_BY]=SRC.[CREATED_BY],
	TGT.[ENTRY_DATE]=SRC.[ENTRY_DATE],
	TGT.[CHANGED_BY]=SRC.[CHANGED_BY],
	TGT.[CHANGED_ON]=SRC.[CHANGED_ON],
	TGT.[BALANCE_UPDATE]=SRC.[BALANCE_UPDATE],
	TGT.[SUBDIVISION_ID]=SRC.[SUBDIVISION_ID],
	TGT.[FD_SUBSTRING1]=SRC.[FD_SUBSTRING1],
	TGT.[FD_SUBSTRING2]=SRC.[FD_SUBSTRING2],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
	
WHEN NOT MATCHED THEN
INSERT 
(
    
	[DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [FUND],
	[FM_AREA],
	[VALID_FROM] ,
	[VALID_TO] ,
	[FY_VARIANT] ,
	[CUSTOMER_FOR_FUND],
	[APPLCTN] ,
	[FUND_TYPE] ,
	[EXPIRATION_DATE] ,
	[CREATED_BY] ,
	[ENTRY_DATE] ,
	[CHANGED_BY] ,
	[CHANGED_ON] ,
	[BALANCE_UPDATE] ,
	[SUBDIVISION_ID],
	[FD_SUBSTRING1] ,
	[FD_SUBSTRING2] ,
	[NAME],
	[DESCRIPTION] ,
	[LONG_DESCRIPTION]
	 

	 )
VALUES( 

       SRC. [DATA_AS_OF_DATE]
      ,SRC.[DS_INSERT_DATE]
      ,SRC.[DS_INSERT_TIME]
      ,SRC.[DW_STATUS_IND]
	  ,SRC.[FUND]
      ,SRC.[FM_AREA]
      ,SRC.[VALID_FROM]
      ,SRC.[VALID_TO]
      ,SRC.[FY_VARIANT]
      ,SRC.[CUSTOMER_FOR_FUND]
      ,SRC.[APPLCTN]
      ,SRC.[FUND_TYPE]
      ,SRC.[EXPIRATION_DATE]
      ,SRC.[CREATED_BY]
      ,SRC.[ENTRY_DATE]
      ,SRC.[CHANGED_BY]
      ,SRC.[CHANGED_ON]
      ,SRC.[BALANCE_UPDATE]
      ,SRC.[SUBDIVISION_ID]
      ,SRC.[FD_SUBSTRING1]
      ,SRC.[FD_SUBSTRING2]
      ,SRC.[NAME]
      ,SRC.[DESCRIPTION]
	  ,SRC.[LONG_DESCRIPTION]
	

);

SELECT @cnt_dw=COUNT(*) FROM [MD].[FUND] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUND] GROUP BY FUND HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
SET @Error_Message = ERROR_MESSAGE() 
EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [MD].[uspFUNDED_PROGRAM]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


TRUNCATE TABLE [MD].[FUNDED_PROGRAM]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[FUNDED_PROGRAM]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspFUNDED_PROGRAM] 'S','2015-03-24'

EXEC [MD].[uspFUNDED_PROGRAM] 'F','1900-01-01'

EXEC [MD].[uspFUNDED_PROGRAM] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspFUNDED_PROGRAM]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY


DECLARE @Proc_Name varchar(150)='MD.uspFUNDED_PROGRAM'
DECLARE @dw_object_name varchar(150)='MD.FUNDED_PROGRAM'
DECLARE @stg_object_name varchar(150)='STG_MD.FUNDED_PROGRAM'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


--TRUNCATE TABLE [MD].[FUNDED_PROGRAM]
--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[FUNDED_PROGRAM] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUNDED_PROGRAM];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[FUNDED_PROGRAM] TGT
	 USING 
(SELECT 
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
	  ,[FUNDED_PROGRAM]
      ,[FM_AREA]
      ,[VALID_TO]
      ,[VALID_FROM]
      ,[FUNDED_PROGRAM_CAT]
      ,[FPROGTYPE]
      ,[KEY]
      ,[OBJECT_TYPE]
      ,[NAME]
      ,[DESCRIPTION]
	  ,[FUNDED_PROGRAM] + ' - '+ [DESCRIPTION] AS LONG_DESCRIPTION
FROM [STG_MD_SYN].[FUNDED_PROGRAM]) SRC
	 ON
TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM] 
WHEN MATCHED THEN 
UPDATE SET 
   		
	TGT.[FM_AREA]=SRC.[FM_AREA],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[VALID_TO] =SRC.[VALID_TO],
	TGT.[FUNDED_PROGRAM_CAT]=SRC.[FUNDED_PROGRAM_CAT],
	TGT.[FPROGTYPE]=SRC.[FPROGTYPE],
	TGT.[KEY]=SRC.[KEY],
	TGT.[OBJECT_TYPE]=SRC.[OBJECT_TYPE],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [FUNDED_PROGRAM],
	[FM_AREA] ,
	[VALID_FROM],
	[VALID_TO] ,
	[FUNDED_PROGRAM_CAT],
	[FPROGTYPE],
	[KEY],
	[OBJECT_TYPE] ,
	[NAME] ,
	[DESCRIPTION],
	[LONG_DESCRIPTION]

	 )
VALUES( 
     SRC.[DATA_AS_OF_DATE],
     SRC.[DS_INSERT_DATE],
     SRC.[DS_INSERT_TIME],
     SRC.[DW_STATUS_IND],
	 SRC.[FUNDED_PROGRAM],
	 SRC.[FM_AREA] ,
	 SRC.[VALID_FROM],
	 SRC.[VALID_TO] ,
	 SRC.[FUNDED_PROGRAM_CAT],
	 SRC.[FPROGTYPE],
	 SRC.[KEY],
	 SRC.[OBJECT_TYPE] ,
	 SRC.[NAME] ,
	 SRC.[DESCRIPTION],
	 SRC.[LONG_DESCRIPTION]

);

/*

IF NOT EXISTS (SELECT * FROM [MD].[FUNDED_PROGRAM] where [FUNDED_PROGRAM]='-1')
BEGIN 

INSERT [MD].[FUNDED_PROGRAM] (

    [FUNDED_PROGRAM],
	[FM_AREA] ,
	[VALID_FROM],
	[VALID_TO] ,
	[FUNDED_PROGRAM_CAT],
	[FPROGTYPE],
	[KEY],
	[OBJECT_TYPE] ,
	[NAME] ,
	[DESCRIPTION],
	[LONG_DESCRIPTION]
    
)
VALUES (

'Unknown',
'Unkn',
'1900-01-01',
'1900-01-01',
'Ukn',
'Ukn',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown'
)


END

*/

SELECT @cnt_dw=COUNT(*) FROM [MD].[FUNDED_PROGRAM];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUNDED_PROGRAM] GROUP BY FUNDED_PROGRAM HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUNDED_PROGRAM] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[FUNDED_PROGRAM] TGT
	 USING 
(SELECT 
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
	  ,[FUNDED_PROGRAM]
      ,[FM_AREA]
      ,[VALID_TO]
      ,[VALID_FROM]
      ,[FUNDED_PROGRAM_CAT]
      ,[FPROGTYPE]
      ,[KEY]
      ,[OBJECT_TYPE]
      ,[NAME]
      ,[DESCRIPTION]
	  ,[FUNDED_PROGRAM] + ' - '+ [DESCRIPTION] AS LONG_DESCRIPTION
FROM [STG_MD_SYN].[FUNDED_PROGRAM]
							WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
) SRC
	 ON
TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM] 
WHEN MATCHED THEN 
UPDATE SET 
   		
	TGT.[FM_AREA]=SRC.[FM_AREA],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[VALID_TO] =SRC.[VALID_TO],
	TGT.[FUNDED_PROGRAM_CAT]=SRC.[FUNDED_PROGRAM_CAT],
	TGT.[FPROGTYPE]=SRC.[FPROGTYPE],
	TGT.[KEY]=SRC.[KEY],
	TGT.[OBJECT_TYPE]=SRC.[OBJECT_TYPE],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [FUNDED_PROGRAM],
	[FM_AREA] ,
	[VALID_FROM],
	[VALID_TO] ,
	[FUNDED_PROGRAM_CAT],
	[FPROGTYPE],
	[KEY],
	[OBJECT_TYPE] ,
	[NAME] ,
	[DESCRIPTION],
	[LONG_DESCRIPTION]

	 )
VALUES( 
     SRC.[DATA_AS_OF_DATE],
     SRC.[DS_INSERT_DATE],
     SRC.[DS_INSERT_TIME],
     SRC.[DW_STATUS_IND],
	 SRC.[FUNDED_PROGRAM],
	 SRC.[FM_AREA] ,
	 SRC.[VALID_FROM],
	 SRC.[VALID_TO] ,
	 SRC.[FUNDED_PROGRAM_CAT],
	 SRC.[FPROGTYPE],
	 SRC.[KEY],
	 SRC.[OBJECT_TYPE] ,
	 SRC.[NAME] ,
	 SRC.[DESCRIPTION],
	 SRC.[LONG_DESCRIPTION]

);

SELECT @cnt_dw=COUNT(*) FROM [MD].[FUNDED_PROGRAM] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUNDED_PROGRAM] GROUP BY FUNDED_PROGRAM HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END


END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA--------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [MD].[uspFUNDS_CENTER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

TRUNCATE TABLE [MD].[FUNDS_CENTER]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[FUNDS_CENTER]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspFUNDS_CENTER] 'S','2015-03-24'

EXEC [MD].[uspFUNDS_CENTER] 'F','1900-01-01'

EXEC [MD].[uspFUNDS_CENTER] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/

CREATE PROCEDURE [MD].[uspFUNDS_CENTER]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspFUNDS_CENTER'
DECLARE @dw_object_name varchar(150)='MD.FUNDS_CENTER'
DECLARE @stg_object_name varchar(150)='STG_MD.FUNDS_CENTER'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[FUNDS_CENTER] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUNDS_CENTER];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[FUNDS_CENTER] TGT
	 USING 
 (SELECT 
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
	  ,[FUNDS_CENTER]
      ,[FM_AREA]
      ,[VALID_TO]
      ,[VALID_FROM]
      ,[USER_NAME]
      ,[PERSON_RESPONS]
      ,[OBJECT_NUMBER]
      ,[ENTRY_DATE]
      ,[CREATED_BY]
      ,[CHANGED_ON]
      ,[CHANGED_BY]
      ,[FUND]
      ,[AUTHORIZGROUP]
      ,[COMPANY_CODE]
      ,[BUSINESS_AREA]
      ,[EXPIRATION_DATE]
      ,[CURRENCY]
      ,[NAME]
      ,[DESCRIPTION]
	  ,[FUNDS_CENTER] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[FUNDS_CENTER]) SRC
	 ON
TGT.[FUNDS_CENTER]=SRC.[FUNDS_CENTER] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[FM_AREA] =SRC.[FM_AREA],
	TGT.[VALID_TO]=SRC.[VALID_TO],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[USER_NAME]=SRC.[USER_NAME],
	TGT.[PERSON_RESPONS]=SRC.[PERSON_RESPONS],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[ENTRY_DATE]=SRC.[ENTRY_DATE],
	TGT.[CREATED_BY]=SRC.[CREATED_BY],
	TGT.[CHANGED_ON]=SRC.[CHANGED_ON],
	TGT.[CHANGED_BY] =SRC.[CHANGED_BY],
	TGT.[FUND]=SRC.[FUND],
	TGT.[AUTHORIZGROUP]=SRC.[AUTHORIZGROUP],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA],
	TGT.[EXPIRATION_DATE]=SRC.[EXPIRATION_DATE],
	TGT.[CURRENCY]=SRC.[CURRENCY],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [FUNDS_CENTER],
	[FM_AREA],
	[VALID_TO] ,
	[VALID_FROM],
	[USER_NAME] ,
	[PERSON_RESPONS] ,
	[OBJECT_NUMBER] ,
	[ENTRY_DATE] ,
	[CREATED_BY] ,
	[CHANGED_ON] ,
	[CHANGED_BY] ,
	[FUND] ,
	[AUTHORIZGROUP] ,
	[COMPANY_CODE] ,
	[BUSINESS_AREA] ,
	[EXPIRATION_DATE] ,
	[CURRENCY] ,
	[NAME] ,
	[DESCRIPTION],
	[LONG_DESCRIPTION] 

	 )
VALUES( 

    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[FUNDS_CENTER],
	SRC.[FM_AREA],
	SRC.[VALID_TO] ,
	SRC.[VALID_FROM],
	SRC.[USER_NAME] ,
	SRC.[PERSON_RESPONS] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[ENTRY_DATE] ,
	SRC.[CREATED_BY] ,
	SRC.[CHANGED_ON] ,
	SRC.[CHANGED_BY] ,
	SRC.[FUND] ,
	SRC.[AUTHORIZGROUP] ,
	SRC.[COMPANY_CODE] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[EXPIRATION_DATE] ,
	SRC.[CURRENCY] ,
	SRC.[NAME] ,
	SRC.[DESCRIPTION],
	SRC.[LONG_DESCRIPTION] 

);

/*
IF NOT EXISTS (SELECT * FROM [MD].[FUNDS_CENTER] where [FUNDS_CENTER]='-1')
BEGIN 

INSERT [MD].[FUNDS_CENTER] (

    [FUNDS_CENTER],
	[FM_AREA],
	[VALID_TO] ,
	[VALID_FROM],
	[USER_NAME] ,
	[PERSON_RESPONS] ,
	[OBJECT_NUMBER] ,
	[ENTRY_DATE] ,
	[CREATED_BY] ,
	[CHANGED_ON] ,
	[CHANGED_BY] ,
	[FUND] ,
	[AUTHORIZGROUP] ,
	[COMPANY_CODE] ,
	[BUSINESS_AREA] ,
	[EXPIRATION_DATE] ,
	[CURRENCY] ,
	[NAME] ,
	[DESCRIPTION] 
    
)
VALUES (

'Unknown',
'Unkn',
'1900-01-01',
'1900-01-01',
'Unknown',
'Unknown',
'Unknown',
'1900-01-01',
'Unknown',
'1900-01-01',
'Unknown',
'Unknown',
'Unknown',
'Unkn',
'Unkn',
'1900-01-01',
'Unkn',
'Unknown',
'Unknown'
)


END
*/

SELECT @cnt_dw=COUNT(*) FROM [MD].[FUNDS_CENTER];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUNDS_CENTER] GROUP BY FUNDS_CENTER HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[FUNDS_CENTER] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[FUNDS_CENTER] TGT
	 USING 
 (SELECT 
       [DATA_AS_OF_DATE]
      ,[DS_INSERT_DATE]
      ,[DS_INSERT_TIME]
      ,[DW_STATUS_IND]
	  ,[FUNDS_CENTER]
      ,[FM_AREA]
      ,[VALID_TO]
      ,[VALID_FROM]
      ,[USER_NAME]
      ,[PERSON_RESPONS]
      ,[OBJECT_NUMBER]
      ,[ENTRY_DATE]
      ,[CREATED_BY]
      ,[CHANGED_ON]
      ,[CHANGED_BY]
      ,[FUND]
      ,[AUTHORIZGROUP]
      ,[COMPANY_CODE]
      ,[BUSINESS_AREA]
      ,[EXPIRATION_DATE]
      ,[CURRENCY]
      ,[NAME]
      ,[DESCRIPTION]
	  ,[FUNDS_CENTER] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[FUNDS_CENTER]
							WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
  ) SRC
	 ON
TGT.[FUNDS_CENTER]=SRC.[FUNDS_CENTER] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[FM_AREA] =SRC.[FM_AREA],
	TGT.[VALID_TO]=SRC.[VALID_TO],
	TGT.[VALID_FROM]=SRC.[VALID_FROM],
	TGT.[USER_NAME]=SRC.[USER_NAME],
	TGT.[PERSON_RESPONS]=SRC.[PERSON_RESPONS],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[ENTRY_DATE]=SRC.[ENTRY_DATE],
	TGT.[CREATED_BY]=SRC.[CREATED_BY],
	TGT.[CHANGED_ON]=SRC.[CHANGED_ON],
	TGT.[CHANGED_BY] =SRC.[CHANGED_BY],
	TGT.[FUND]=SRC.[FUND],
	TGT.[AUTHORIZGROUP]=SRC.[AUTHORIZGROUP],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA],
	TGT.[EXPIRATION_DATE]=SRC.[EXPIRATION_DATE],
	TGT.[CURRENCY]=SRC.[CURRENCY],
	TGT.[NAME]=SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
	
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [FUNDS_CENTER],
	[FM_AREA],
	[VALID_TO] ,
	[VALID_FROM],
	[USER_NAME] ,
	[PERSON_RESPONS] ,
	[OBJECT_NUMBER] ,
	[ENTRY_DATE] ,
	[CREATED_BY] ,
	[CHANGED_ON] ,
	[CHANGED_BY] ,
	[FUND] ,
	[AUTHORIZGROUP] ,
	[COMPANY_CODE] ,
	[BUSINESS_AREA] ,
	[EXPIRATION_DATE] ,
	[CURRENCY] ,
	[NAME] ,
	[DESCRIPTION],
	[LONG_DESCRIPTION] 

	 )
VALUES( 

    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[FUNDS_CENTER],
	SRC.[FM_AREA],
	SRC.[VALID_TO] ,
	SRC.[VALID_FROM],
	SRC.[USER_NAME] ,
	SRC.[PERSON_RESPONS] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[ENTRY_DATE] ,
	SRC.[CREATED_BY] ,
	SRC.[CHANGED_ON] ,
	SRC.[CHANGED_BY] ,
	SRC.[FUND] ,
	SRC.[AUTHORIZGROUP] ,
	SRC.[COMPANY_CODE] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[EXPIRATION_DATE] ,
	SRC.[CURRENCY] ,
	SRC.[NAME] ,
	SRC.[DESCRIPTION],
	SRC.[LONG_DESCRIPTION] 

);


SELECT @cnt_dw=COUNT(*) FROM [MD].[FUNDS_CENTER] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[FUNDS_CENTER] GROUP BY FUNDS_CENTER HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspFY_PERIOD]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [MD].[uspFY_PERIOD]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspFY_PERIOD'
DECLARE @dw_object_name varchar(150)='MD.FY_PERIOD'
DECLARE @stg_object_name varchar(150)='STG_MD.FY_PERIOD'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 
TRUNCATE TABLE MD.FY_PERIOD

INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2011012 AS Decimal(7, 0)), N'2011', N'12-Jun-11', N'12-Jun', N'FM12 - JUN  FY11', 5, 13, 6)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2011016 AS Decimal(7, 0)), N'2011', N'16-Jun-11', N'16-Jun', N'FM16 - JUN  FY11', 1, 17, 6)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012001 AS Decimal(7, 0)), N'2012', N'1-Jul-12', N'1-Jul', N'FM1 - JUL  FY12', 33, 19, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012002 AS Decimal(7, 0)), N'2012', N'2-Aug-12', N'2-Aug', N'FM2 - AUG  FY12', 32, 20, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012003 AS Decimal(7, 0)), N'2012', N'3-Sep-12', N'3-Sep', N'FM3 - SEP  FY12', 31, 21, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012004 AS Decimal(7, 0)), N'2012', N'4-Oct-12', N'4-Oct', N'FM4 - OCT  FY12', 30, 22, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012005 AS Decimal(7, 0)), N'2012', N'5-Nov-12', N'5-Nov', N'FM5 - NOV  FY12', 29, 23, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012006 AS Decimal(7, 0)), N'2012', N'6-Dec-12', N'6-Dec', N'FM6 - DEC  FY12', 28, 24, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012007 AS Decimal(7, 0)), N'2012', N'7-Jan-12', N'7-Jan', N'FM7 - JAN  FY12', 27, 25, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012008 AS Decimal(7, 0)), N'2012', N'8-Feb-12', N'8-Feb', N'FM8 - FEB  FY12', 26, 26, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012009 AS Decimal(7, 0)), N'2012', N'9-Mar-12', N'9-Mar', N'FM9 - MAR  FY12', 25, 27, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012010 AS Decimal(7, 0)), N'2012', N'10-Apr-12', N'10-Apr', N'FM10 - APR  FY12', 24, 28, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012011 AS Decimal(7, 0)), N'2012', N'11-May-12', N'11-May', N'FM11 - MAY  FY12', 23, 29, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012012 AS Decimal(7, 0)), N'2012', N'12-Jun-12', N'12-Jun', N'FM12 - JUN  FY12', 22, 30, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012013 AS Decimal(7, 0)), N'2012', N'13-Jun-12', N'13-Jun', N'FM13 - JUN  FY12', 21, 31, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012014 AS Decimal(7, 0)), N'2012', N'14-Jun-12', N'14-Jun', N'FM14 - JUN  FY12', 20, 32, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012015 AS Decimal(7, 0)), N'2012', N'15-Jun-12', N'15-Jun', N'FM15 - JUN  FY12', 19, 33, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2012016 AS Decimal(7, 0)), N'2012', N'16-Jun-12', N'16-Jun', N'FM16 - JUN  FY12', 18, 34, 5)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013001 AS Decimal(7, 0)), N'2013', N'1-Jul-13', N'1-Jul', N'FM1 - JUL  FY13', 50, 36, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013002 AS Decimal(7, 0)), N'2013', N'2-Aug-13', N'2-Aug', N'FM2 - AUG  FY13', 49, 37, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013003 AS Decimal(7, 0)), N'2013', N'3-Sep-13', N'3-Sep', N'FM3 - SEP  FY13', 48, 38, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013004 AS Decimal(7, 0)), N'2013', N'4-Oct-13', N'4-Oct', N'FM4 - OCT  FY13', 47, 39, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013005 AS Decimal(7, 0)), N'2013', N'5-Nov-13', N'5-Nov', N'FM5 - NOV  FY13', 46, 40, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013006 AS Decimal(7, 0)), N'2013', N'6-Dec-13', N'6-Dec', N'FM6 - DEC  FY13', 45, 41, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013007 AS Decimal(7, 0)), N'2013', N'7-Jan-13', N'7-Jan', N'FM7 - JAN  FY13', 44, 42, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013008 AS Decimal(7, 0)), N'2013', N'8-Feb-13', N'8-Feb', N'FM8 - FEB  FY13', 43, 43, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013009 AS Decimal(7, 0)), N'2013', N'9-Mar-13', N'9-Mar', N'FM9 - MAR  FY13', 42, 44, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013010 AS Decimal(7, 0)), N'2013', N'10-Apr-13', N'10-Apr', N'FM10 - APR  FY13', 41, 45, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013011 AS Decimal(7, 0)), N'2013', N'11-May-13', N'11-May', N'FM11 - MAY  FY13', 40, 46, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013012 AS Decimal(7, 0)), N'2013', N'12-Jun-13', N'12-Jun', N'FM12 - JUN  FY13', 39, 47, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013013 AS Decimal(7, 0)), N'2013', N'13-Jun-13', N'13-Jun', N'FM13 - JUN  FY13', 38, 48, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013014 AS Decimal(7, 0)), N'2013', N'14-Jun-13', N'14-Jun', N'FM14 - JUN  FY13', 37, 49, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2013016 AS Decimal(7, 0)), N'2013', N'16-Jun-13', N'16-Jun', N'FM16 - JUN  FY13', 35, 51, 4)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014001 AS Decimal(7, 0)), N'2014', N'1-Jul-14', N'1-Jul', N'FM1 - JUL  FY14', 67, 53, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014002 AS Decimal(7, 0)), N'2014', N'2-Aug-14', N'2-Aug', N'FM2 - AUG  FY14', 66, 54, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014003 AS Decimal(7, 0)), N'2014', N'3-Sep-14', N'3-Sep', N'FM3 - SEP  FY14', 65, 55, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014004 AS Decimal(7, 0)), N'2014', N'4-Oct-14', N'4-Oct', N'FM4 - OCT  FY14', 64, 56, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014005 AS Decimal(7, 0)), N'2014', N'5-Nov-14', N'5-Nov', N'FM5 - NOV  FY14', 63, 57, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014006 AS Decimal(7, 0)), N'2014', N'6-Dec-14', N'6-Dec', N'FM6 - DEC  FY14', 62, 58, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014007 AS Decimal(7, 0)), N'2014', N'7-Jan-14', N'7-Jan', N'FM7 - JAN  FY14', 61, 59, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014008 AS Decimal(7, 0)), N'2014', N'8-Feb-14', N'8-Feb', N'FM8 - FEB  FY14', 60, 60, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014009 AS Decimal(7, 0)), N'2014', N'9-Mar-14', N'9-Mar', N'FM9 - MAR  FY14', 59, 61, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014010 AS Decimal(7, 0)), N'2014', N'10-Apr-14', N'10-Apr', N'FM10 - APR  FY14', 58, 62, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014011 AS Decimal(7, 0)), N'2014', N'11-May-14', N'11-May', N'FM11 - MAY  FY14', 57, 63, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014012 AS Decimal(7, 0)), N'2014', N'12-Jun-14', N'12-Jun', N'FM12 - JUN  FY14', 56, 64, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014013 AS Decimal(7, 0)), N'2014', N'13-Jun-14', N'13-Jun', N'FM13 - JUN  FY14', 55, 65, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014014 AS Decimal(7, 0)), N'2014', N'14-Jun-14', N'14-Jun', N'FM14 - JUN  FY14', 54, 66, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014015 AS Decimal(7, 0)), N'2014', N'15-Jun-14', N'15-Jun', N'FM15 - JUN  FY14', 53, 67, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2014016 AS Decimal(7, 0)), N'2014', N'16-Jun-14', N'16-Jun', N'FM16 - JUN  FY14', 52, 68, 3)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015001 AS Decimal(7, 0)), N'2015', N'1-Jul-15', N'1-Jul', N'FM1 - JUL  FY15', 84, 84, 2)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015002 AS Decimal(7, 0)), N'2015', N'2-Aug-15', N'2-Aug', N'FM2 - AUG  FY15', 83, 83, 2)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015003 AS Decimal(7, 0)), N'2015', N'3-Sep-15', N'3-Sep', N'FM3 - SEP  FY15', 82, 82, 2)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015004 AS Decimal(7, 0)), N'2015', N'4-Oct-15', N'4-Oct', N'FM4 - OCT  FY15', 81, 81, 2)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015005 AS Decimal(7, 0)), N'2015', N'5-Nov-15', N'5-Nov', N'FM5 - NOV  FY15', 80, 80, 2)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015006 AS Decimal(7, 0)), N'2015', N'6-Dec-15', N'6-Dec', N'FM6 - DEC  FY15', 79, 79, 2)
INSERT [MD].[FY_PERIOD] ([FY_PERIOD], [FISCAL_YEAR], [FISCAL_PERIOD_KEY], [FISCAL_PERIOD_NAME], [FISCAL_PERIOD_KEY_NAME], [REVERSE_SORT], [LAST_REVERSE_SORT], [YEAR_SORT]) VALUES (CAST(2015011 AS Decimal(7, 0)), N'2015', N'11-May-15', N'11-May', N'FM11 - MAY  FY15', 74, 74, 2)


EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA--------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

























GO
/****** Object:  StoredProcedure [MD].[uspGRANT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

TRUNCATE TABLE [MD].[GRANT]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[GRANT]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspGRANT] 'S','2015-03-25'

EXEC [MD].[uspGRANT] 'F','1900-01-01'

EXEC [MD].[uspGRANT] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspGRANT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspGRANT'
DECLARE @dw_object_name varchar(150)='MD.GRANT'
DECLARE @stg_object_name varchar(150)='STG_MD.GRANT'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0
 
--TRUNCATE TABLE [MD].[GRANT] 

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[GRANT] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END


-------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[GRANT];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[GRANT] TGT
	 USING 
 (SELECT 
            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
		   ,[GRANT]
           ,[REVISION_NUMBER]
           ,[INTERNAL_REFERENCE]
           ,[EXTERNAL_REFERENCE]
           ,[VALID_FROM_DATE]
           ,[VALID_TO_DATE]
           ,[GRANT_TYPE]
           ,[COMPANY_CODE]
           ,[AWARD_TYPE]
           ,[FINAL_BILL_DATE]
           ,[BLOCK_ALL_POSTINGS]
           ,[ALLOW_YEAR_SPLIT]
           ,[GRANT_FY_VARIANT]
           ,[GRANT_CURRENCY]
           ,[GRANT_VALUE]
           ,[CFDA_NUMBER]
           ,[SPONSOR]
           ,[WBS_ELEMENT]
           ,[BILLING_RULE]
           ,[TRANSFER_RESTRICTION]
           ,[IDC_CAP]
           ,[TOTALACCUMULATED_IDC]
           ,[COST_SHARING_RULE]
           ,[COST_SHARE_RATE]
           ,[OBJECT_NUMBER]
           ,[LIFECYCLE_STATUS]
           ,[USER_STATE]
           ,[CREATED_BY]
           ,[CREATED_ON]
           ,[CREATED_AT]
           ,[COPIED_FROM]
           ,[LAST_MODIFIED_BY]
           ,[LAST_MODIFIED_ON]
           ,[LAST_MODIFIED_AT]
           ,[AUTHORIZATION_GROUP]
           ,[DELETION_INDICATOR]
           ,[PRE_AWARD_POSTINGS]
           ,[ORDER]
           ,[EXCHANGE_RULE]
           ,[GUID]
           ,[DOCUMENT_CLASS]
           ,[FUNDING_ORIGIN]
           ,[EXCHANGE_RATE]
           ,[INSTALLMENT_AMOUNT]
           ,[TOTAL_BILLING_AMOUNT]
           ,[NAME]
           ,[DESCRIPTION]
           ,[GRANT] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[GRANT]) SRC
	 ON
TGT.[GRANT]=SRC.[GRANT] 
WHEN MATCHED THEN 
UPDATE SET 
 	    TGT.[GRANT]=SRC.[GRANT]
           ,TGT.[REVISION_NUMBER]=SRC.[REVISION_NUMBER]
           ,TGT.[INTERNAL_REFERENCE]=SRC.[INTERNAL_REFERENCE]
           ,TGT.[EXTERNAL_REFERENCE]=SRC.[EXTERNAL_REFERENCE]
           ,TGT.[VALID_FROM_DATE]=SRC.[VALID_FROM_DATE]
           ,TGT.[VALID_TO_DATE]=SRC.[VALID_TO_DATE]
           ,TGT.[GRANT_TYPE]=SRC.[GRANT_TYPE]
           ,TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE]
           ,TGT.[AWARD_TYPE]=SRC.[AWARD_TYPE]
           ,TGT.[FINAL_BILL_DATE]=SRC.[FINAL_BILL_DATE]
           ,TGT.[BLOCK_ALL_POSTINGS]=SRC.[BLOCK_ALL_POSTINGS]
           ,TGT.[ALLOW_YEAR_SPLIT]=SRC.[ALLOW_YEAR_SPLIT]
           ,TGT.[GRANT_FY_VARIANT]=SRC.[GRANT_FY_VARIANT]
           ,TGT.[GRANT_CURRENCY]=SRC.[GRANT_CURRENCY]
           ,TGT.[GRANT_VALUE]=SRC.[GRANT_VALUE]
           ,TGT.[CFDA_NUMBER]=SRC.[CFDA_NUMBER]
           ,TGT.[SPONSOR]=SRC.[SPONSOR]
           ,TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT]
           ,TGT.[BILLING_RULE]=SRC.[BILLING_RULE]
           ,TGT.[TRANSFER_RESTRICTION]=SRC.[TRANSFER_RESTRICTION]
           ,TGT.[IDC_CAP]=SRC.[IDC_CAP]
           ,TGT.[TOTALACCUMULATED_IDC]=SRC.[TOTALACCUMULATED_IDC]
           ,TGT.[COST_SHARING_RULE]=SRC.[COST_SHARING_RULE]
           ,TGT.[COST_SHARE_RATE]=SRC.[COST_SHARE_RATE]
           ,TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER]
           ,TGT.[LIFECYCLE_STATUS]=SRC.[LIFECYCLE_STATUS]
           ,TGT.[USER_STATE]=SRC.[USER_STATE]
           ,TGT.[CREATED_BY]=SRC.[CREATED_BY]
           ,TGT.[CREATED_ON]=SRC.[CREATED_ON]
           ,TGT.[CREATED_AT]=SRC.[CREATED_AT]
           ,TGT.[COPIED_FROM]=SRC.[COPIED_FROM]
           ,TGT.[LAST_MODIFIED_BY]=SRC.[LAST_MODIFIED_BY]
           ,TGT.[LAST_MODIFIED_ON]=SRC.[LAST_MODIFIED_ON]
           ,TGT.[LAST_MODIFIED_AT]=SRC.[LAST_MODIFIED_AT]
           ,TGT.[AUTHORIZATION_GROUP]=SRC.[AUTHORIZATION_GROUP]
           ,TGT.[DELETION_INDICATOR]=SRC.[DELETION_INDICATOR]
           ,TGT.[PRE_AWARD_POSTINGS]=SRC.[PRE_AWARD_POSTINGS]
           ,TGT.[ORDER]=SRC.[ORDER]
           ,TGT.[EXCHANGE_RULE]=SRC.[EXCHANGE_RULE]
           ,TGT.[GUID]=SRC.[GUID]
           ,TGT.[DOCUMENT_CLASS]=SRC.[DOCUMENT_CLASS]
           ,TGT.[FUNDING_ORIGIN]=SRC.[FUNDING_ORIGIN]
           ,TGT.[EXCHANGE_RATE]=SRC.[EXCHANGE_RATE]
           ,TGT.[INSTALLMENT_AMOUNT]=SRC.[INSTALLMENT_AMOUNT]
           ,TGT.[TOTAL_BILLING_AMOUNT]=SRC.[TOTAL_BILLING_AMOUNT]
           ,TGT.[NAME]=SRC.[NAME]
           ,TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
           ,TGT.[LONG_DESCRIPTION]=SRC.[LONG_DESCRIPTION]
		   ,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]

		   
WHEN NOT MATCHED THEN
INSERT 
(
     
	        [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[GRANT]
           ,[REVISION_NUMBER]
           ,[INTERNAL_REFERENCE]
           ,[EXTERNAL_REFERENCE]
           ,[VALID_FROM_DATE]
           ,[VALID_TO_DATE]
           ,[GRANT_TYPE]
           ,[COMPANY_CODE]
           ,[AWARD_TYPE]
           ,[FINAL_BILL_DATE]
           ,[BLOCK_ALL_POSTINGS]
           ,[ALLOW_YEAR_SPLIT]
           ,[GRANT_FY_VARIANT]
           ,[GRANT_CURRENCY]
           ,[GRANT_VALUE]
           ,[CFDA_NUMBER]
           ,[SPONSOR]
           ,[WBS_ELEMENT]
           ,[BILLING_RULE]
           ,[TRANSFER_RESTRICTION]
           ,[IDC_CAP]
           ,[TOTALACCUMULATED_IDC]
           ,[COST_SHARING_RULE]
           ,[COST_SHARE_RATE]
           ,[OBJECT_NUMBER]
           ,[LIFECYCLE_STATUS]
           ,[USER_STATE]
           ,[CREATED_BY]
           ,[CREATED_ON]
           ,[CREATED_AT]
           ,[COPIED_FROM]
           ,[LAST_MODIFIED_BY]
           ,[LAST_MODIFIED_ON]
           ,[LAST_MODIFIED_AT]
           ,[AUTHORIZATION_GROUP]
           ,[DELETION_INDICATOR]
           ,[PRE_AWARD_POSTINGS]
           ,[ORDER]
           ,[EXCHANGE_RULE]
           ,[GUID]
           ,[DOCUMENT_CLASS]
           ,[FUNDING_ORIGIN]
           ,[EXCHANGE_RATE]
           ,[INSTALLMENT_AMOUNT]
           ,[TOTAL_BILLING_AMOUNT]
           ,[NAME]
           ,[DESCRIPTION]
           ,[LONG_DESCRIPTION]

	 )
VALUES( 

            SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[GRANT]
           ,SRC.[REVISION_NUMBER]
           ,SRC.[INTERNAL_REFERENCE]
           ,SRC.[EXTERNAL_REFERENCE]
           ,SRC.[VALID_FROM_DATE]
           ,SRC.[VALID_TO_DATE]
           ,SRC.[GRANT_TYPE]
           ,SRC.[COMPANY_CODE]
           ,SRC.[AWARD_TYPE]
           ,SRC.[FINAL_BILL_DATE]
           ,SRC.[BLOCK_ALL_POSTINGS]
           ,SRC.[ALLOW_YEAR_SPLIT]
           ,SRC.[GRANT_FY_VARIANT]
           ,SRC.[GRANT_CURRENCY]
           ,SRC.[GRANT_VALUE]
           ,SRC.[CFDA_NUMBER]
           ,SRC.[SPONSOR]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[BILLING_RULE]
           ,SRC.[TRANSFER_RESTRICTION]
           ,SRC.[IDC_CAP]
           ,SRC.[TOTALACCUMULATED_IDC]
           ,SRC.[COST_SHARING_RULE]
           ,SRC.[COST_SHARE_RATE]
           ,SRC.[OBJECT_NUMBER]
           ,SRC.[LIFECYCLE_STATUS]
           ,SRC.[USER_STATE]
           ,SRC.[CREATED_BY]
           ,SRC.[CREATED_ON]
           ,SRC.[CREATED_AT]
           ,SRC.[COPIED_FROM]
           ,SRC.[LAST_MODIFIED_BY]
           ,SRC.[LAST_MODIFIED_ON]
           ,SRC.[LAST_MODIFIED_AT]
           ,SRC.[AUTHORIZATION_GROUP]
           ,SRC.[DELETION_INDICATOR]
           ,SRC.[PRE_AWARD_POSTINGS]
           ,SRC.[ORDER]
           ,SRC.[EXCHANGE_RULE]
           ,SRC.[GUID]
           ,SRC.[DOCUMENT_CLASS]
           ,SRC.[FUNDING_ORIGIN]
           ,SRC.[EXCHANGE_RATE]
           ,SRC.[INSTALLMENT_AMOUNT]
           ,SRC.[TOTAL_BILLING_AMOUNT]
           ,SRC.[NAME]
           ,SRC.[DESCRIPTION]
           ,SRC.[LONG_DESCRIPTION]
);


IF NOT EXISTS (SELECT * FROM [MD].[GRANT] where [GRANT]=' ')
BEGIN 

INSERT [MD].[GRANT] (

            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
 	       ,[GRANT]
           ,[REVISION_NUMBER]
           ,[INTERNAL_REFERENCE]
           ,[EXTERNAL_REFERENCE]
           ,[VALID_FROM_DATE]
           ,[VALID_TO_DATE]
           ,[GRANT_TYPE]
           ,[COMPANY_CODE]
           ,[AWARD_TYPE]
           ,[FINAL_BILL_DATE]
           ,[BLOCK_ALL_POSTINGS]
           ,[ALLOW_YEAR_SPLIT]
           ,[GRANT_FY_VARIANT]
           ,[GRANT_CURRENCY]
           ,[GRANT_VALUE]
           ,[CFDA_NUMBER]
           ,[SPONSOR]
           ,[WBS_ELEMENT]
           ,[BILLING_RULE]
           ,[TRANSFER_RESTRICTION]
           ,[IDC_CAP]
           ,[TOTALACCUMULATED_IDC]
           ,[COST_SHARING_RULE]
           ,[COST_SHARE_RATE]
           ,[OBJECT_NUMBER]
           ,[LIFECYCLE_STATUS]
           ,[USER_STATE]
           ,[CREATED_BY]
           ,[CREATED_ON]
           ,[CREATED_AT]
           ,[COPIED_FROM]
           ,[LAST_MODIFIED_BY]
           ,[LAST_MODIFIED_ON]
           ,[LAST_MODIFIED_AT]
           ,[AUTHORIZATION_GROUP]
           ,[DELETION_INDICATOR]
           ,[PRE_AWARD_POSTINGS]
           ,[ORDER]
           ,[EXCHANGE_RULE]
           ,[GUID]
           ,[DOCUMENT_CLASS]
           ,[FUNDING_ORIGIN]
           ,[EXCHANGE_RATE]
           ,[INSTALLMENT_AMOUNT]
           ,[TOTAL_BILLING_AMOUNT]
           ,[NAME]
           ,[DESCRIPTION]
           ,[LONG_DESCRIPTION]    
)

VALUES (
'2015-02-05',
'2015-02-05',
'2015-02-06 16:21:47.7170000',
'U',
' ',
'Ukn',
'Unknown',
'Unknown',
'1900-01-01',
'1900-01-01',
'U',
'Ukn',
'Ukn',
'1900-01-01',
'U',
'U',
'U',
'Ukn',
'0',
'Unknown',
'Unknown',
'0',
'0',
'U',
'0',
'0',
'0',
'0',
'Unknown',
'Ukn',
'Ukn',
'Unknown',
'1900-01-01',
'Unknown',
'Unknown',
'Unknown',
'1900-01-01',
'Unknown',
'Unknown',
'U',
'U',
'Unknown',
'Ukn',
'Unknown',
'Unknown',
'Unknown',
'0',
'0',
'0',
'Unknown',
'Unknown',
'Unknown'

)


END -- end of the uknown insert 

SELECT @cnt_dw=COUNT(*) FROM [MD].[GRANT];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[GRANT] GROUP BY [GRANT] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END -- end of the full load logic

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[GRANT] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [MD].[GRANT] TGT
	 USING 
 (SELECT 
            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
		   ,[GRANT]
           ,[REVISION_NUMBER]
           ,[INTERNAL_REFERENCE]
           ,[EXTERNAL_REFERENCE]
           ,[VALID_FROM_DATE]
           ,[VALID_TO_DATE]
           ,[GRANT_TYPE]
           ,[COMPANY_CODE]
           ,[AWARD_TYPE]
           ,[FINAL_BILL_DATE]
           ,[BLOCK_ALL_POSTINGS]
           ,[ALLOW_YEAR_SPLIT]
           ,[GRANT_FY_VARIANT]
           ,[GRANT_CURRENCY]
           ,[GRANT_VALUE]
           ,[CFDA_NUMBER]
           ,[SPONSOR]
           ,[WBS_ELEMENT]
           ,[BILLING_RULE]
           ,[TRANSFER_RESTRICTION]
           ,[IDC_CAP]
           ,[TOTALACCUMULATED_IDC]
           ,[COST_SHARING_RULE]
           ,[COST_SHARE_RATE]
           ,[OBJECT_NUMBER]
           ,[LIFECYCLE_STATUS]
           ,[USER_STATE]
           ,[CREATED_BY]
           ,[CREATED_ON]
           ,[CREATED_AT]
           ,[COPIED_FROM]
           ,[LAST_MODIFIED_BY]
           ,[LAST_MODIFIED_ON]
           ,[LAST_MODIFIED_AT]
           ,[AUTHORIZATION_GROUP]
           ,[DELETION_INDICATOR]
           ,[PRE_AWARD_POSTINGS]
           ,[ORDER]
           ,[EXCHANGE_RULE]
           ,[GUID]
           ,[DOCUMENT_CLASS]
           ,[FUNDING_ORIGIN]
           ,[EXCHANGE_RATE]
           ,[INSTALLMENT_AMOUNT]
           ,[TOTAL_BILLING_AMOUNT]
           ,[NAME]
           ,[DESCRIPTION]
           ,[GRANT] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[GRANT]
						WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
  ) SRC
	 ON
TGT.[GRANT]=SRC.[GRANT] 
WHEN MATCHED THEN 
UPDATE SET 
 	    TGT.[GRANT]=SRC.[GRANT]
           ,TGT.[REVISION_NUMBER]=SRC.[REVISION_NUMBER]
           ,TGT.[INTERNAL_REFERENCE]=SRC.[INTERNAL_REFERENCE]
           ,TGT.[EXTERNAL_REFERENCE]=SRC.[EXTERNAL_REFERENCE]
           ,TGT.[VALID_FROM_DATE]=SRC.[VALID_FROM_DATE]
           ,TGT.[VALID_TO_DATE]=SRC.[VALID_TO_DATE]
           ,TGT.[GRANT_TYPE]=SRC.[GRANT_TYPE]
           ,TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE]
           ,TGT.[AWARD_TYPE]=SRC.[AWARD_TYPE]
           ,TGT.[FINAL_BILL_DATE]=SRC.[FINAL_BILL_DATE]
           ,TGT.[BLOCK_ALL_POSTINGS]=SRC.[BLOCK_ALL_POSTINGS]
           ,TGT.[ALLOW_YEAR_SPLIT]=SRC.[ALLOW_YEAR_SPLIT]
           ,TGT.[GRANT_FY_VARIANT]=SRC.[GRANT_FY_VARIANT]
           ,TGT.[GRANT_CURRENCY]=SRC.[GRANT_CURRENCY]
           ,TGT.[GRANT_VALUE]=SRC.[GRANT_VALUE]
           ,TGT.[CFDA_NUMBER]=SRC.[CFDA_NUMBER]
           ,TGT.[SPONSOR]=SRC.[SPONSOR]
           ,TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT]
           ,TGT.[BILLING_RULE]=SRC.[BILLING_RULE]
           ,TGT.[TRANSFER_RESTRICTION]=SRC.[TRANSFER_RESTRICTION]
           ,TGT.[IDC_CAP]=SRC.[IDC_CAP]
           ,TGT.[TOTALACCUMULATED_IDC]=SRC.[TOTALACCUMULATED_IDC]
           ,TGT.[COST_SHARING_RULE]=SRC.[COST_SHARING_RULE]
           ,TGT.[COST_SHARE_RATE]=SRC.[COST_SHARE_RATE]
           ,TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER]
           ,TGT.[LIFECYCLE_STATUS]=SRC.[LIFECYCLE_STATUS]
           ,TGT.[USER_STATE]=SRC.[USER_STATE]
           ,TGT.[CREATED_BY]=SRC.[CREATED_BY]
           ,TGT.[CREATED_ON]=SRC.[CREATED_ON]
           ,TGT.[CREATED_AT]=SRC.[CREATED_AT]
           ,TGT.[COPIED_FROM]=SRC.[COPIED_FROM]
           ,TGT.[LAST_MODIFIED_BY]=SRC.[LAST_MODIFIED_BY]
           ,TGT.[LAST_MODIFIED_ON]=SRC.[LAST_MODIFIED_ON]
           ,TGT.[LAST_MODIFIED_AT]=SRC.[LAST_MODIFIED_AT]
           ,TGT.[AUTHORIZATION_GROUP]=SRC.[AUTHORIZATION_GROUP]
           ,TGT.[DELETION_INDICATOR]=SRC.[DELETION_INDICATOR]
           ,TGT.[PRE_AWARD_POSTINGS]=SRC.[PRE_AWARD_POSTINGS]
           ,TGT.[ORDER]=SRC.[ORDER]
           ,TGT.[EXCHANGE_RULE]=SRC.[EXCHANGE_RULE]
           ,TGT.[GUID]=SRC.[GUID]
           ,TGT.[DOCUMENT_CLASS]=SRC.[DOCUMENT_CLASS]
           ,TGT.[FUNDING_ORIGIN]=SRC.[FUNDING_ORIGIN]
           ,TGT.[EXCHANGE_RATE]=SRC.[EXCHANGE_RATE]
           ,TGT.[INSTALLMENT_AMOUNT]=SRC.[INSTALLMENT_AMOUNT]
           ,TGT.[TOTAL_BILLING_AMOUNT]=SRC.[TOTAL_BILLING_AMOUNT]
           ,TGT.[NAME]=SRC.[NAME]
           ,TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
           ,TGT.[LONG_DESCRIPTION]=SRC.[LONG_DESCRIPTION]
		   ,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]


WHEN NOT MATCHED THEN
INSERT 
(
     
	        [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[GRANT]
           ,[REVISION_NUMBER]
           ,[INTERNAL_REFERENCE]
           ,[EXTERNAL_REFERENCE]
           ,[VALID_FROM_DATE]
           ,[VALID_TO_DATE]
           ,[GRANT_TYPE]
           ,[COMPANY_CODE]
           ,[AWARD_TYPE]
           ,[FINAL_BILL_DATE]
           ,[BLOCK_ALL_POSTINGS]
           ,[ALLOW_YEAR_SPLIT]
           ,[GRANT_FY_VARIANT]
           ,[GRANT_CURRENCY]
           ,[GRANT_VALUE]
           ,[CFDA_NUMBER]
           ,[SPONSOR]
           ,[WBS_ELEMENT]
           ,[BILLING_RULE]
           ,[TRANSFER_RESTRICTION]
           ,[IDC_CAP]
           ,[TOTALACCUMULATED_IDC]
           ,[COST_SHARING_RULE]
           ,[COST_SHARE_RATE]
           ,[OBJECT_NUMBER]
           ,[LIFECYCLE_STATUS]
           ,[USER_STATE]
           ,[CREATED_BY]
           ,[CREATED_ON]
           ,[CREATED_AT]
           ,[COPIED_FROM]
           ,[LAST_MODIFIED_BY]
           ,[LAST_MODIFIED_ON]
           ,[LAST_MODIFIED_AT]
           ,[AUTHORIZATION_GROUP]
           ,[DELETION_INDICATOR]
           ,[PRE_AWARD_POSTINGS]
           ,[ORDER]
           ,[EXCHANGE_RULE]
           ,[GUID]
           ,[DOCUMENT_CLASS]
           ,[FUNDING_ORIGIN]
           ,[EXCHANGE_RATE]
           ,[INSTALLMENT_AMOUNT]
           ,[TOTAL_BILLING_AMOUNT]
           ,[NAME]
           ,[DESCRIPTION]
           ,[LONG_DESCRIPTION]

	 )
VALUES( 

            SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[GRANT]
           ,SRC.[REVISION_NUMBER]
           ,SRC.[INTERNAL_REFERENCE]
           ,SRC.[EXTERNAL_REFERENCE]
           ,SRC.[VALID_FROM_DATE]
           ,SRC.[VALID_TO_DATE]
           ,SRC.[GRANT_TYPE]
           ,SRC.[COMPANY_CODE]
           ,SRC.[AWARD_TYPE]
           ,SRC.[FINAL_BILL_DATE]
           ,SRC.[BLOCK_ALL_POSTINGS]
           ,SRC.[ALLOW_YEAR_SPLIT]
           ,SRC.[GRANT_FY_VARIANT]
           ,SRC.[GRANT_CURRENCY]
           ,SRC.[GRANT_VALUE]
           ,SRC.[CFDA_NUMBER]
           ,SRC.[SPONSOR]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[BILLING_RULE]
           ,SRC.[TRANSFER_RESTRICTION]
           ,SRC.[IDC_CAP]
           ,SRC.[TOTALACCUMULATED_IDC]
           ,SRC.[COST_SHARING_RULE]
           ,SRC.[COST_SHARE_RATE]
           ,SRC.[OBJECT_NUMBER]
           ,SRC.[LIFECYCLE_STATUS]
           ,SRC.[USER_STATE]
           ,SRC.[CREATED_BY]
           ,SRC.[CREATED_ON]
           ,SRC.[CREATED_AT]
           ,SRC.[COPIED_FROM]
           ,SRC.[LAST_MODIFIED_BY]
           ,SRC.[LAST_MODIFIED_ON]
           ,SRC.[LAST_MODIFIED_AT]
           ,SRC.[AUTHORIZATION_GROUP]
           ,SRC.[DELETION_INDICATOR]
           ,SRC.[PRE_AWARD_POSTINGS]
           ,SRC.[ORDER]
           ,SRC.[EXCHANGE_RULE]
           ,SRC.[GUID]
           ,SRC.[DOCUMENT_CLASS]
           ,SRC.[FUNDING_ORIGIN]
           ,SRC.[EXCHANGE_RATE]
           ,SRC.[INSTALLMENT_AMOUNT]
           ,SRC.[TOTAL_BILLING_AMOUNT]
           ,SRC.[NAME]
           ,SRC.[DESCRIPTION]
           ,SRC.[LONG_DESCRIPTION]
);


IF NOT EXISTS (SELECT * FROM [MD].[GRANT] where [GRANT]=' ')
BEGIN 

INSERT [MD].[GRANT] (

            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
 	       ,[GRANT]
           ,[REVISION_NUMBER]
           ,[INTERNAL_REFERENCE]
           ,[EXTERNAL_REFERENCE]
           ,[VALID_FROM_DATE]
           ,[VALID_TO_DATE]
           ,[GRANT_TYPE]
           ,[COMPANY_CODE]
           ,[AWARD_TYPE]
           ,[FINAL_BILL_DATE]
           ,[BLOCK_ALL_POSTINGS]
           ,[ALLOW_YEAR_SPLIT]
           ,[GRANT_FY_VARIANT]
           ,[GRANT_CURRENCY]
           ,[GRANT_VALUE]
           ,[CFDA_NUMBER]
           ,[SPONSOR]
           ,[WBS_ELEMENT]
           ,[BILLING_RULE]
           ,[TRANSFER_RESTRICTION]
           ,[IDC_CAP]
           ,[TOTALACCUMULATED_IDC]
           ,[COST_SHARING_RULE]
           ,[COST_SHARE_RATE]
           ,[OBJECT_NUMBER]
           ,[LIFECYCLE_STATUS]
           ,[USER_STATE]
           ,[CREATED_BY]
           ,[CREATED_ON]
           ,[CREATED_AT]
           ,[COPIED_FROM]
           ,[LAST_MODIFIED_BY]
           ,[LAST_MODIFIED_ON]
           ,[LAST_MODIFIED_AT]
           ,[AUTHORIZATION_GROUP]
           ,[DELETION_INDICATOR]
           ,[PRE_AWARD_POSTINGS]
           ,[ORDER]
           ,[EXCHANGE_RULE]
           ,[GUID]
           ,[DOCUMENT_CLASS]
           ,[FUNDING_ORIGIN]
           ,[EXCHANGE_RATE]
           ,[INSTALLMENT_AMOUNT]
           ,[TOTAL_BILLING_AMOUNT]
           ,[NAME]
           ,[DESCRIPTION]
           ,[LONG_DESCRIPTION]    
)

VALUES (
'2015-02-05',
'2015-02-05',
'2015-02-06 16:21:47.7170000',
'U',
' ',
'Ukn',
'Unknown',
'Unknown',
'1900-01-01',
'1900-01-01',
'U',
'Ukn',
'Ukn',
'1900-01-01',
'U',
'U',
'U',
'Ukn',
'0',
'Unknown',
'Unknown',
'0',
'0',
'U',
'0',
'0',
'0',
'0',
'Unknown',
'Ukn',
'Ukn',
'Unknown',
'1900-01-01',
'Unknown',
'Unknown',
'Unknown',
'1900-01-01',
'Unknown',
'Unknown',
'U',
'U',
'Unknown',
'Ukn',
'Unknown',
'Unknown',
'Unknown',
'0',
'0',
'0',
'Unknown',
'Unknown',
'Unknown'

);


END -- end of the uknown insert 


SELECT @cnt_dw=COUNT(*) FROM [MD].[GRANT] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[GRANT] GROUP BY [GRANT] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END


END TRY


BEGIN CATCH
-------------ERROR HANDLING AREA------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspORDER]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

SELECT * FROM MD.[ORDER] WHERE [ORDER]=''2SFC-P01-077';
SELECT * FROM STG_MY_SYN.[ORDER] WHERE [ORDER]=''2SFC-P01-077';

TRUNCATE TABLE [MD].[ORDER]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[ORDER]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspORDER] 'S','2015-03-24'

EXEC [MD].[uspORDER] 'F','1900-01-01'

EXEC [MD].[uspORDER] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspORDER]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspORDER'
DECLARE @dw_object_name varchar(150)='MD.ORDER'
DECLARE @stg_object_name varchar(150)='STG_MD.ORDER'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0
 
--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[ORDER] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END


-------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[ORDER];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[ORDER] TGT
	 USING 
 (SELECT  
             [DATA_AS_OF_DATE]
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME] 
			,[DW_STATUS_IND] 
			,[ORDER]
			,[ORDER_TYPE] 
			,[ORDER_CATEGORY]
			,[ENTERED_BY]
			,[CREATED_ON]
			,[CHANGED_BY]
			,[CHANGED_ON] 
			,[BUSINESS_AREA] 
			,[RESP_COST_CNTR] 
			,[STATISTICAL] 
			,[STATUS] 
			,[STATUS_CHANGE] 
			,[REACHED_STATUS] 
			,[ORDER_CREATED] 
			,[ORDER_RELEASED] 
			,[ORDER_COMPLETED] 
			,[ORDER_CLOSED] 
			,[PLANNED_RELEASE]
			,[PLANNEDCOMPLTN] 
			,[PLANNED_CLO_DAT] 
			,[RELEASE_DATE] 
			,[TECH_COMPLETION] 
			,[CLOSE_DATE] 
			,[OBJECT_ID] 
			,[DELETION_FLAG] 
			,[CCTR_TRUE_POST] 
			,[FUND]
			,[GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUNDED_PROGRAM]
			,[OBJECT_NUMBER]
			,[FUNCTIONAL_AREA] 
			,[WBS_ELEMENT] 
			,[CONTROLLING_AREA] 
			,[DESCRIPTION] 
			,[ORDER] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[ORDER]) SRC
	 ON
TGT.[ORDER]=SRC.[ORDER] 
WHEN MATCHED THEN 
UPDATE SET 
 	         TGT.[ORDER_TYPE] =SRC.[ORDER_TYPE]
			,TGT.[ORDER_CATEGORY]=SRC.[ORDER_CATEGORY]
			,TGT.[ENTERED_BY]=SRC.[ENTERED_BY]
			,TGT.[CREATED_ON]=SRC.[CREATED_ON]
			,TGT.[CHANGED_BY]=SRC.[CHANGED_BY]
			,TGT.[CHANGED_ON]=SRC.[CHANGED_ON]
			,TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA] 
			,TGT.[RESP_COST_CNTR]=SRC.[RESP_COST_CNTR] 
			,TGT.[STATISTICAL]=SRC.[STATISTICAL]
			,TGT.[STATUS]=SRC.[STATUS]
			,TGT.[STATUS_CHANGE]=SRC.[STATUS_CHANGE]
			,TGT.[REACHED_STATUS]= SRC.[REACHED_STATUS]
			,TGT.[ORDER_CREATED]=SRC.[ORDER_CREATED]
			,TGT.[ORDER_RELEASED]=SRC.[ORDER_RELEASED]
			,TGT.[ORDER_COMPLETED]=SRC.[ORDER_COMPLETED]
			,TGT.[ORDER_CLOSED]=SRC.[ORDER_CLOSED]
			,TGT.[PLANNED_RELEASE]=SRC.[PLANNED_RELEASE]
			,TGT.[PLANNEDCOMPLTN]=SRC.[PLANNEDCOMPLTN]
			,TGT.[PLANNED_CLO_DAT]=SRC.[PLANNED_CLO_DAT]
			,TGT.[RELEASE_DATE]=SRC.[RELEASE_DATE]
			,TGT.[TECH_COMPLETION]=SRC.[TECH_COMPLETION]
			,TGT.[CLOSE_DATE]=SRC.[CLOSE_DATE]
			,TGT.[OBJECT_ID]= SRC.[OBJECT_ID]
			,TGT.[DELETION_FLAG]=SRC.[DELETION_FLAG] 
			,TGT.[CCTR_TRUE_POST]= SRC.[CCTR_TRUE_POST]
			,TGT.[FUND]=SRC.[FUND]
			,TGT.[GRANT]=SRC.[GRANT]
			,TGT.[SPONSOR_PROGRAM]=SRC.[SPONSOR_PROGRAM]
			,TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM]
			,TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER]
			,TGT.[FUNCTIONAL_AREA]=SRC.[FUNCTIONAL_AREA]
			,TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT]
			,TGT.[CONTROLLING_AREA]=SRC.[CONTROLLING_AREA]
			,TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
			,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
     
	         [DATA_AS_OF_DATE]
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME] 
			,[DW_STATUS_IND] 
			,[ORDER]
			,[ORDER_TYPE] 
			,[ORDER_CATEGORY]
			,[ENTERED_BY]
			,[CREATED_ON]
			,[CHANGED_BY]
			,[CHANGED_ON] 
			,[BUSINESS_AREA] 
			,[RESP_COST_CNTR] 
			,[STATISTICAL] 
			,[STATUS] 
			,[STATUS_CHANGE] 
			,[REACHED_STATUS] 
			,[ORDER_CREATED] 
			,[ORDER_RELEASED] 
			,[ORDER_COMPLETED] 
			,[ORDER_CLOSED] 
			,[PLANNED_RELEASE]
			,[PLANNEDCOMPLTN] 
			,[PLANNED_CLO_DAT] 
			,[RELEASE_DATE] 
			,[TECH_COMPLETION] 
			,[CLOSE_DATE] 
			,[OBJECT_ID] 
			,[DELETION_FLAG] 
			,[CCTR_TRUE_POST] 
			,[FUND]
			,[GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUNDED_PROGRAM]
			,[OBJECT_NUMBER]
			,[FUNCTIONAL_AREA] 
			,[WBS_ELEMENT] 
			,[CONTROLLING_AREA] 
			,[DESCRIPTION] 
			,[LONG_DESCRIPTION]

	 )
VALUES( 

             SRC.[DATA_AS_OF_DATE]
			,SRC.[DS_INSERT_DATE]
			,SRC.[DS_INSERT_TIME] 
			,SRC.[DW_STATUS_IND] 
			,SRC.[ORDER]
			,SRC.[ORDER_TYPE] 
			,SRC.[ORDER_CATEGORY]
			,SRC.[ENTERED_BY]
			,SRC.[CREATED_ON]
			,SRC.[CHANGED_BY]
			,SRC.[CHANGED_ON] 
			,SRC.[BUSINESS_AREA] 
			,SRC.[RESP_COST_CNTR] 
			,SRC.[STATISTICAL] 
			,SRC.[STATUS] 
			,SRC.[STATUS_CHANGE] 
			,SRC.[REACHED_STATUS] 
			,SRC.[ORDER_CREATED] 
			,SRC.[ORDER_RELEASED] 
			,SRC.[ORDER_COMPLETED] 
			,SRC.[ORDER_CLOSED] 
			,SRC.[PLANNED_RELEASE]
			,SRC.[PLANNEDCOMPLTN] 
			,SRC.[PLANNED_CLO_DAT] 
			,SRC.[RELEASE_DATE] 
			,SRC.[TECH_COMPLETION] 
			,SRC.[CLOSE_DATE] 
			,SRC.[OBJECT_ID] 
			,SRC.[DELETION_FLAG] 
			,SRC.[CCTR_TRUE_POST] 
			,SRC.[FUND]
			,SRC.[GRANT] 
			,SRC.[SPONSOR_PROGRAM] 
			,SRC.[FUNDED_PROGRAM]
			,SRC.[OBJECT_NUMBER]
			,SRC.[FUNCTIONAL_AREA] 
			,SRC.[WBS_ELEMENT] 
			,SRC.[CONTROLLING_AREA] 
			,SRC.[DESCRIPTION] 
			,SRC.[LONG_DESCRIPTION]
);


IF NOT EXISTS (SELECT * FROM [MD].[ORDER] where [ORDER]='--')
BEGIN 

INSERT [MD].[ORDER] (

            [DATA_AS_OF_DATE]
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME] 
			,[DW_STATUS_IND] 
			,[ORDER]
			,[ORDER_TYPE] 
			,[ORDER_CATEGORY]
			,[ENTERED_BY]
			,[CREATED_ON]
			,[CHANGED_BY]
			,[CHANGED_ON] 
			,[BUSINESS_AREA] 
			,[RESP_COST_CNTR] 
			,[STATISTICAL] 
			,[STATUS] 
			,[STATUS_CHANGE] 
			,[REACHED_STATUS] 
			,[ORDER_CREATED] 
			,[ORDER_RELEASED] 
			,[ORDER_COMPLETED] 
			,[ORDER_CLOSED] 
			,[PLANNED_RELEASE]
			,[PLANNEDCOMPLTN] 
			,[PLANNED_CLO_DAT] 
			,[RELEASE_DATE] 
			,[TECH_COMPLETION] 
			,[CLOSE_DATE] 
			,[OBJECT_ID] 
			,[DELETION_FLAG] 
			,[CCTR_TRUE_POST] 
			,[FUND]
			,[GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUNDED_PROGRAM]
			,[OBJECT_NUMBER]
			,[FUNCTIONAL_AREA] 
			,[WBS_ELEMENT] 
			,[CONTROLLING_AREA] 
			,[DESCRIPTION] 
			,[LONG_DESCRIPTION]    
)

VALUES (
'1900-01-01',
'1900-01-01',
'1900-01-01 00:00:00.0000000',
'U',
'--',
'--',
'-1',
'--',
'1900-01-01',
'--',
'1900-01-01',
'--',
'--',
'U',
'-1',
'1900-01-01',
'-1',
'U',
'U',
'U',
'U',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'U',
'U',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--'
);


END -- end of the uknown insert 


IF NOT EXISTS (SELECT * FROM [MD].[ORDER] where [ORDER]='2SFC-P01-077')
BEGIN 


INSERT INTO [MD].[ORDER]
           ([DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[ORDER]
           )
     VALUES
           (
		   '2015-04-15',
		   '2015-04-16',
		   '1900-01-01 00:00:00.0000000',
		   'S',
		   '2SFC-P01-077'
		   );

END --- END OF '2SFC-P01-077' INSERT 

SELECT @cnt_dw=COUNT(*) FROM [MD].[ORDER];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[ORDER] GROUP BY [ORDER] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END -- end of the full load logic

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[ORDER] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[ORDER] TGT
	 USING 
 (SELECT  
             [DATA_AS_OF_DATE]
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME] 
			,[DW_STATUS_IND] 
			,[ORDER]
			,[ORDER_TYPE] 
			,[ORDER_CATEGORY]
			,[ENTERED_BY]
			,[CREATED_ON]
			,[CHANGED_BY]
			,[CHANGED_ON] 
			,[BUSINESS_AREA] 
			,[RESP_COST_CNTR] 
			,[STATISTICAL] 
			,[STATUS] 
			,[STATUS_CHANGE] 
			,[REACHED_STATUS] 
			,[ORDER_CREATED] 
			,[ORDER_RELEASED] 
			,[ORDER_COMPLETED] 
			,[ORDER_CLOSED] 
			,[PLANNED_RELEASE]
			,[PLANNEDCOMPLTN] 
			,[PLANNED_CLO_DAT] 
			,[RELEASE_DATE] 
			,[TECH_COMPLETION] 
			,[CLOSE_DATE] 
			,[OBJECT_ID] 
			,[DELETION_FLAG] 
			,[CCTR_TRUE_POST] 
			,[FUND]
			,[GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUNDED_PROGRAM]
			,[OBJECT_NUMBER]
			,[FUNCTIONAL_AREA] 
			,[WBS_ELEMENT] 
			,[CONTROLLING_AREA] 
			,[DESCRIPTION] 
			,[ORDER] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[ORDER]
							WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
  ) SRC
	 ON
TGT.[ORDER]=SRC.[ORDER] 
WHEN MATCHED THEN 
UPDATE SET 
 	         TGT.[ORDER_TYPE] =SRC.[ORDER_TYPE]
			,TGT.[ORDER_CATEGORY]=SRC.[ORDER_CATEGORY]
			,TGT.[ENTERED_BY]=SRC.[ENTERED_BY]
			,TGT.[CREATED_ON]=SRC.[CREATED_ON]
			,TGT.[CHANGED_BY]=SRC.[CHANGED_BY]
			,TGT.[CHANGED_ON]=SRC.[CHANGED_ON]
			,TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA] 
			,TGT.[RESP_COST_CNTR]=SRC.[RESP_COST_CNTR] 
			,TGT.[STATISTICAL]=SRC.[STATISTICAL]
			,TGT.[STATUS]=SRC.[STATUS]
			,TGT.[STATUS_CHANGE]=SRC.[STATUS_CHANGE]
			,TGT.[REACHED_STATUS]= SRC.[REACHED_STATUS]
			,TGT.[ORDER_CREATED]=SRC.[ORDER_CREATED]
			,TGT.[ORDER_RELEASED]=SRC.[ORDER_RELEASED]
			,TGT.[ORDER_COMPLETED]=SRC.[ORDER_COMPLETED]
			,TGT.[ORDER_CLOSED]=SRC.[ORDER_CLOSED]
			,TGT.[PLANNED_RELEASE]=SRC.[PLANNED_RELEASE]
			,TGT.[PLANNEDCOMPLTN]=SRC.[PLANNEDCOMPLTN]
			,TGT.[PLANNED_CLO_DAT]=SRC.[PLANNED_CLO_DAT]
			,TGT.[RELEASE_DATE]=SRC.[RELEASE_DATE]
			,TGT.[TECH_COMPLETION]=SRC.[TECH_COMPLETION]
			,TGT.[CLOSE_DATE]=SRC.[CLOSE_DATE]
			,TGT.[OBJECT_ID]= SRC.[OBJECT_ID]
			,TGT.[DELETION_FLAG]=SRC.[DELETION_FLAG] 
			,TGT.[CCTR_TRUE_POST]= SRC.[CCTR_TRUE_POST]
			,TGT.[FUND]=SRC.[FUND]
			,TGT.[GRANT]=SRC.[GRANT]
			,TGT.[SPONSOR_PROGRAM]=SRC.[SPONSOR_PROGRAM]
			,TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM]
			,TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER]
			,TGT.[FUNCTIONAL_AREA]=SRC.[FUNCTIONAL_AREA]
			,TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT]
			,TGT.[CONTROLLING_AREA]=SRC.[CONTROLLING_AREA]
			,TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
			,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
     
	         [DATA_AS_OF_DATE]
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME] 
			,[DW_STATUS_IND] 
			,[ORDER]
			,[ORDER_TYPE] 
			,[ORDER_CATEGORY]
			,[ENTERED_BY]
			,[CREATED_ON]
			,[CHANGED_BY]
			,[CHANGED_ON] 
			,[BUSINESS_AREA] 
			,[RESP_COST_CNTR] 
			,[STATISTICAL] 
			,[STATUS] 
			,[STATUS_CHANGE] 
			,[REACHED_STATUS] 
			,[ORDER_CREATED] 
			,[ORDER_RELEASED] 
			,[ORDER_COMPLETED] 
			,[ORDER_CLOSED] 
			,[PLANNED_RELEASE]
			,[PLANNEDCOMPLTN] 
			,[PLANNED_CLO_DAT] 
			,[RELEASE_DATE] 
			,[TECH_COMPLETION] 
			,[CLOSE_DATE] 
			,[OBJECT_ID] 
			,[DELETION_FLAG] 
			,[CCTR_TRUE_POST] 
			,[FUND]
			,[GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUNDED_PROGRAM]
			,[OBJECT_NUMBER]
			,[FUNCTIONAL_AREA] 
			,[WBS_ELEMENT] 
			,[CONTROLLING_AREA] 
			,[DESCRIPTION] 
			,[LONG_DESCRIPTION]

	 )
VALUES( 

             SRC.[DATA_AS_OF_DATE]
			,SRC.[DS_INSERT_DATE]
			,SRC.[DS_INSERT_TIME] 
			,SRC.[DW_STATUS_IND] 
			,SRC.[ORDER]
			,SRC.[ORDER_TYPE] 
			,SRC.[ORDER_CATEGORY]
			,SRC.[ENTERED_BY]
			,SRC.[CREATED_ON]
			,SRC.[CHANGED_BY]
			,SRC.[CHANGED_ON] 
			,SRC.[BUSINESS_AREA] 
			,SRC.[RESP_COST_CNTR] 
			,SRC.[STATISTICAL] 
			,SRC.[STATUS] 
			,SRC.[STATUS_CHANGE] 
			,SRC.[REACHED_STATUS] 
			,SRC.[ORDER_CREATED] 
			,SRC.[ORDER_RELEASED] 
			,SRC.[ORDER_COMPLETED] 
			,SRC.[ORDER_CLOSED] 
			,SRC.[PLANNED_RELEASE]
			,SRC.[PLANNEDCOMPLTN] 
			,SRC.[PLANNED_CLO_DAT] 
			,SRC.[RELEASE_DATE] 
			,SRC.[TECH_COMPLETION] 
			,SRC.[CLOSE_DATE] 
			,SRC.[OBJECT_ID] 
			,SRC.[DELETION_FLAG] 
			,SRC.[CCTR_TRUE_POST] 
			,SRC.[FUND]
			,SRC.[GRANT] 
			,SRC.[SPONSOR_PROGRAM] 
			,SRC.[FUNDED_PROGRAM]
			,SRC.[OBJECT_NUMBER]
			,SRC.[FUNCTIONAL_AREA] 
			,SRC.[WBS_ELEMENT] 
			,SRC.[CONTROLLING_AREA] 
			,SRC.[DESCRIPTION] 
			,SRC.[LONG_DESCRIPTION]
);


IF NOT EXISTS (SELECT * FROM [MD].[ORDER] where [ORDER]='--')
BEGIN 

INSERT [MD].[ORDER] (

            [DATA_AS_OF_DATE]
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME] 
			,[DW_STATUS_IND] 
			,[ORDER]
			,[ORDER_TYPE] 
			,[ORDER_CATEGORY]
			,[ENTERED_BY]
			,[CREATED_ON]
			,[CHANGED_BY]
			,[CHANGED_ON] 
			,[BUSINESS_AREA] 
			,[RESP_COST_CNTR] 
			,[STATISTICAL] 
			,[STATUS] 
			,[STATUS_CHANGE] 
			,[REACHED_STATUS] 
			,[ORDER_CREATED] 
			,[ORDER_RELEASED] 
			,[ORDER_COMPLETED] 
			,[ORDER_CLOSED] 
			,[PLANNED_RELEASE]
			,[PLANNEDCOMPLTN] 
			,[PLANNED_CLO_DAT] 
			,[RELEASE_DATE] 
			,[TECH_COMPLETION] 
			,[CLOSE_DATE] 
			,[OBJECT_ID] 
			,[DELETION_FLAG] 
			,[CCTR_TRUE_POST] 
			,[FUND]
			,[GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUNDED_PROGRAM]
			,[OBJECT_NUMBER]
			,[FUNCTIONAL_AREA] 
			,[WBS_ELEMENT] 
			,[CONTROLLING_AREA] 
			,[DESCRIPTION] 
			,[LONG_DESCRIPTION]    
)

VALUES (
'1900-01-01',
'1900-01-01',
'1900-01-01 00:00:00.0000000',
'U',
'--',
'--',
'-1',
'--',
'1900-01-01',
'--',
'1900-01-01',
'--',
'--',
'U',
'-1',
'1900-01-01',
'-1',
'U',
'U',
'U',
'U',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'1900-01-01',
'U',
'U',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--'
);

END -- end of the uknown insert 


IF NOT EXISTS (SELECT * FROM [MD].[ORDER] where [ORDER]='2SFC-P01-077')
BEGIN 

INSERT INTO [MD].[ORDER]
           ([DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[ORDER]
           )
     VALUES
           (
		   '2015-04-15',
		   '2015-04-16',
		   '1900-01-01 00:00:00.0000000',
		   'S',
		   '2SFC-P01-077'
		   );

END --- END OF '2SFC-P01-077' INSERT 


SELECT @cnt_dw=COUNT(*) FROM [MD].[ORDER] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[ORDER] GROUP BY [ORDER] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY


BEGIN CATCH
-------------ERROR HANDLING AREA--------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspSTAT_INDICATOR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
TRUNCATE TABLE [MD].[STAT_INDICATOR]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[STAT_INDICATOR]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspSTAT_INDICATOR] 'S','2015-03-24'

EXEC [MD].[uspSTAT_INDICATOR] 'F','1900-01-01'

EXEC [MD].[uspSTAT_INDICATOR] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspSTAT_INDICATOR]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspSTAT_INDICATOR'
DECLARE @dw_object_name varchar(150)='MD.STAT_INDICATOR'
DECLARE @stg_object_name varchar(150)='STG_MD.STAT_INDICATOR'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 -------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[STAT_INDICATOR] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[STAT_INDICATOR];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[STAT_INDICATOR] TGT
	 USING (
	 SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     CASE WHEN [STATISTICAL_ID]=' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID],
     [DESCRIPTION],
	 [STATISTICAL_ID]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM
	 [STG_MD_SYN].[STAT_INDICATOR] ) SRC
	 ON
TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [STATISTICAL_ID],
    [DESCRIPTION],
    [LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[STATISTICAL_ID], 
	SRC.[DESCRIPTION],
    SRC.[LONG_DESCRIPTION]
	
);

SELECT @cnt_dw=COUNT(*) FROM [MD].[STAT_INDICATOR];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[STAT_INDICATOR] GROUP BY [STATISTICAL_ID] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[STAT_INDICATOR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[STAT_INDICATOR] TGT
	 USING (
	 SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     CASE WHEN [STATISTICAL_ID]=' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID],
     [DESCRIPTION],
	 [STATISTICAL_ID]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM
	 [STG_MD_SYN].[STAT_INDICATOR]
							 WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	  ) SRC
	 ON
TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [STATISTICAL_ID],
    [DESCRIPTION],
    [LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[STATISTICAL_ID], 
	SRC.[DESCRIPTION],
    SRC.[LONG_DESCRIPTION]
	
);



SELECT @cnt_dw=COUNT(*) FROM [MD].[STAT_INDICATOR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[STAT_INDICATOR] GROUP BY [STATISTICAL_ID] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspVALUE_TYPE]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


TRUNCATE TABLE [MD].[VALUE_TYPE]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[VALUE_TYPE]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspVALUE_TYPE] 'S','2015-03-24'

EXEC [MD].[uspVALUE_TYPE] 'F','1900-01-01'

EXEC [MD].[uspVALUE_TYPE] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspVALUE_TYPE]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspVALUE_TYPE'
DECLARE @dw_object_name varchar(150)='MD.VALUE_TYPE'
DECLARE @stg_object_name varchar(150)='STG_MD.VALUE_TYPE'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[VALUE_TYPE] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

-------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[VALUE_TYPE];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[VALUE_TYPE] TGT
	 USING 
	(SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [VALUE_TYPE],
	 [NAME],
	 [DESCRIPTION],
	 [VALUE_TYPE] +' - '+ [DESCRIPTION] AS LONG_DESCRIPTION
	 FROM [STG_MD_SYN].[VALUE_TYPE]) SRC
	 ON
TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[NAME] =SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(

    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [VALUE_TYPE],
    [NAME],
    [DESCRIPTION],
	[LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[VALUE_TYPE], 
	SRC.[NAME],
	SRC.[DESCRIPTION],
	SRC.[LONG_DESCRIPTION]
	
);

SELECT @cnt_dw=COUNT(*) FROM [MD].[VALUE_TYPE];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[VALUE_TYPE] GROUP BY VALUE_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[VALUE_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[VALUE_TYPE] TGT
	 USING 
	(SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [VALUE_TYPE],
	 [NAME],
	 [DESCRIPTION],
	 [VALUE_TYPE] +' - '+ [DESCRIPTION] AS LONG_DESCRIPTION
	 FROM [STG_MD_SYN].[VALUE_TYPE]
					WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	 ) SRC
	 ON
TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[NAME] =SRC.[NAME],
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(

    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [VALUE_TYPE],
    [NAME],
    [DESCRIPTION],
	[LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[VALUE_TYPE], 
	SRC.[NAME],
	SRC.[DESCRIPTION],
	SRC.[LONG_DESCRIPTION]
	
);


SELECT @cnt_dw=COUNT(*) FROM [MD].[VALUE_TYPE] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[VALUE_TYPE] GROUP BY VALUE_TYPE HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA-------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [MD].[uspVENDOR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MD].[uspVENDOR]
AS
BEGIN TRY

DECLARE @Proc_Name varchar(150)
DECLARE @File_Name varchar(150)
DECLARE @Source_Type varchar(15)
DECLARE @Error_Message varchar(1500)
DECLARE @rows_loaded int

SET @Proc_Name = 'MD.uspVENDOR'
SET @Source_Type='Table Load'
SET @File_Name='None'
SET @Error_Message=''
SET @rows_loaded=0

--Log Start
 EXEC ETL.uspLOG_LOAD 'START',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded


TRUNCATE TABLE [MD].[VENDOR] ---- COMMENT THIS LINE OUT IF PERFORMING AN INSERT/UPDATE FORK

MERGE INTO [MD].[VENDOR] TGT
	 USING 
 (SELECT 
            CASE WHEN VENDOR='*' OR VENDOR=' ' OR VENDOR IS NULL THEN '-1' ELSE VENDOR END AS VENDOR
           ,[COMMON_VENDOR]
           ,[TITLE]
           ,[INDUSTRY]
           ,[CONFIRM_STATUS]
           ,[STATUS_OF_TRANSFER]
           ,[CREATED_ON]
           ,[CREATED_BY]
           ,[REP_NAME]
           ,[TYPE_OF_BUSINESS]
           ,[TYPE_OF_INDUSTRY]
           ,[CRED_INFO_NO]
           ,[ACCOUNT_GROUP]
           ,[COUNTRY]
           ,[DELETION_FLAG]
           ,[MATCH_CODE1]
           ,[MATCH_CODE2]
           ,[MATCH_CODE3]
           ,[NAME1]
           ,[NAME2]
           ,[NAME3]
           ,[NAME4]
           ,[CITY]
           ,[PO_BOX]
           ,[PO_BOX_CITY]
           ,[PO_BOX_PCODE]
           ,[POSTAL_CODE]
           ,[QM_SYSTEM_TO]
           ,[STATE]
           ,[SEARCH_TERM]
           ,[PURCH_BLOCK]
           ,[POSTING_BLOCK]
           ,[TAX_NUMBER1]
           ,[TAX_NUMBER2]
           ,[TAX_NUMBER3]
           ,[TAX_NUMBER4]
           ,[STREET]
           ,[TELEPHONE1]
           ,[TELEPHONE2]
           ,[FAX_NUMBER]
           ,[TAX_JUR]
           ,[CONFIRM_DATE]
           ,[CONFIRM_TIME]
           ,[RECON_ACCOUNT]
           ,[PREV_ACCT_NO]
           ,[COMPANY_CODE]
           ,[CERTIFICTN_DATE]
           ,[CERTIFIED_BY]
           ,[CONFIRMST_CCD]
           ,[PLANNING_GROUP]
           ,[CR_MEMO_TERMS]
           ,[ALTERNAT_PAYEE]
           ,[CO_CDE_DELETION_FLAG]
           ,[MINORITY_INDIC]
           ,[COCD_DEL_BLOCK]
           ,[PERSONNEL_NO]
           ,[COUNTRY_WHTAX]
           ,[CO_CODE_POST_BLOCK]
           ,[PMT_METH_SUPL]
           ,[ALT_PAYEE_DOC]
           ,[INDIVIDUAL_PMNT]
           ,[PAYMENT_BLOCK]
           ,[GROUPING_KEY]
           ,[PAYT_TERMS]
           ,[SORT_KEY]
           ,[PAYMENT_METHODS]
           ,[PURCHASING_ORG]
           ,[ACC_W_VENDOR]
           ,[PURCH_GROUP]
           ,[INCOTERMS1]
           ,[INCOTERMS2]
           ,[AUTOMATIC_PO]
           ,[DEL_FLAG_PORG]
           ,[MINIMUM_VALUE]
           ,[TELEPHONE]
           ,[B_VOL_COMP_AG]
           ,[SALESPERSON]
           ,[GR_BASED_IV]
           ,[AUT_GRSET_RET]
           ,[ERS]
           ,[DESCRIPTION]
           ,[COMMON_VENDOR_NAME]
           ,[VENDOR] + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[VENDOR]) SRC
	 ON
TGT.[VENDOR]=SRC.[VENDOR] 
WHEN MATCHED THEN 
UPDATE SET 

            TGT.[COMMON_VENDOR]=SRC.[COMMON_VENDOR]
           ,TGT.[TITLE]=SRC.[TITLE]
           ,TGT.[INDUSTRY]=SRC.[INDUSTRY]
           ,TGT.[CONFIRM_STATUS]=SRC.[CONFIRM_STATUS]
           ,TGT.[STATUS_OF_TRANSFER]=SRC.[STATUS_OF_TRANSFER]
           ,TGT.[CREATED_ON]=SRC.[CREATED_ON]
           ,TGT.[CREATED_BY]=SRC.[CREATED_BY]
           ,TGT.[REP_NAME]=SRC.[REP_NAME]
           ,TGT.[TYPE_OF_BUSINESS]=SRC.[TYPE_OF_BUSINESS]
           ,TGT.[TYPE_OF_INDUSTRY]=SRC.[TYPE_OF_INDUSTRY]
           ,TGT.[CRED_INFO_NO]=SRC.[CRED_INFO_NO]
           ,TGT.[ACCOUNT_GROUP]=SRC.[ACCOUNT_GROUP]
           ,TGT.[COUNTRY]=SRC.[COUNTRY]
           ,TGT.[DELETION_FLAG]=SRC.[DELETION_FLAG]
           ,TGT.[MATCH_CODE1]=SRC.[MATCH_CODE1]
           ,TGT.[MATCH_CODE2]=SRC.[MATCH_CODE2]
           ,TGT.[MATCH_CODE3]=SRC.[MATCH_CODE3]
           ,TGT.[NAME1]=SRC.[NAME1]
           ,TGT.[NAME2]=SRC.[NAME2]
           ,TGT.[NAME3]=SRC.[NAME3]
           ,TGT.[NAME4]=SRC.[NAME4]
           ,TGT.[CITY]=SRC.[CITY]
           ,TGT.[PO_BOX]=SRC.[PO_BOX]
           ,TGT.[PO_BOX_CITY]=SRC.[PO_BOX_CITY]
           ,TGT.[PO_BOX_PCODE]=SRC.[PO_BOX_PCODE]
           ,TGT.[POSTAL_CODE]=SRC.[POSTAL_CODE]
           ,TGT.[QM_SYSTEM_TO]=SRC.[QM_SYSTEM_TO]
           ,TGT.[STATE]=SRC.[STATE]
           ,TGT.[SEARCH_TERM]=SRC.[SEARCH_TERM]
           ,TGT.[PURCH_BLOCK]=SRC.[PURCH_BLOCK]
           ,TGT.[POSTING_BLOCK]=SRC.[POSTING_BLOCK]
           ,TGT.[TAX_NUMBER1]=SRC.[TAX_NUMBER1]
           ,TGT.[TAX_NUMBER2]=SRC.[TAX_NUMBER2]
           ,TGT.[TAX_NUMBER3]=SRC.[TAX_NUMBER3]
           ,TGT.[TAX_NUMBER4]=SRC.[TAX_NUMBER4]
           ,TGT.[STREET]=SRC.[STREET]
           ,TGT.[TELEPHONE1]=SRC.[TELEPHONE1]
           ,TGT.[TELEPHONE2]=SRC.[TELEPHONE2]
           ,TGT.[FAX_NUMBER]=SRC.[FAX_NUMBER]
           ,TGT.[TAX_JUR]=SRC.[TAX_JUR]
           ,TGT.[CONFIRM_DATE]=SRC.[CONFIRM_DATE]
           ,TGT.[CONFIRM_TIME]=SRC.[CONFIRM_TIME]
           ,TGT.[RECON_ACCOUNT]=SRC.[RECON_ACCOUNT]
           ,TGT.[PREV_ACCT_NO]=SRC.[PREV_ACCT_NO]
           ,TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE]
           ,TGT.[CERTIFICTN_DATE]=SRC.[CERTIFICTN_DATE]
           ,TGT.[CERTIFIED_BY]=SRC.[CERTIFIED_BY]
           ,TGT.[CONFIRMST_CCD]=SRC.[CONFIRMST_CCD]
           ,TGT.[PLANNING_GROUP]=SRC.[PLANNING_GROUP]
           ,TGT.[CR_MEMO_TERMS]=SRC.[CR_MEMO_TERMS]
           ,TGT.[ALTERNAT_PAYEE]=SRC.[ALTERNAT_PAYEE]
           ,TGT.[CO_CDE_DELETION_FLAG]=SRC.[CO_CDE_DELETION_FLAG]
           ,TGT.[MINORITY_INDIC]=SRC.[MINORITY_INDIC]
           ,TGT.[COCD_DEL_BLOCK]=SRC.[COCD_DEL_BLOCK]
           ,TGT.[PERSONNEL_NO]=SRC.[PERSONNEL_NO]
           ,TGT.[COUNTRY_WHTAX]=SRC.[COUNTRY_WHTAX]
           ,TGT.[CO_CODE_POST_BLOCK]=SRC.[CO_CODE_POST_BLOCK]
           ,TGT.[PMT_METH_SUPL]=SRC.[PMT_METH_SUPL]
           ,TGT.[ALT_PAYEE_DOC]=SRC.[ALT_PAYEE_DOC]
           ,TGT.[INDIVIDUAL_PMNT]=SRC.[INDIVIDUAL_PMNT]
           ,TGT.[PAYMENT_BLOCK]=SRC.[PAYMENT_BLOCK]
           ,TGT.[GROUPING_KEY]=SRC.[GROUPING_KEY]
           ,TGT.[PAYT_TERMS]=SRC.[PAYT_TERMS]
           ,TGT.[SORT_KEY]=SRC.[SORT_KEY]
           ,TGT.[PAYMENT_METHODS]=SRC.[PAYMENT_METHODS]
           ,TGT.[PURCHASING_ORG]=SRC.[PURCHASING_ORG]
           ,TGT.[ACC_W_VENDOR]=SRC.[ACC_W_VENDOR]
           ,TGT.[PURCH_GROUP]=SRC.[PURCH_GROUP]
           ,TGT.[INCOTERMS1]=SRC.[INCOTERMS1]
           ,TGT.[INCOTERMS2]=SRC.[INCOTERMS2]
           ,TGT.[AUTOMATIC_PO]=SRC.[AUTOMATIC_PO]
           ,TGT.[DEL_FLAG_PORG]=SRC.[DEL_FLAG_PORG]
           ,TGT.[MINIMUM_VALUE]=SRC.[MINIMUM_VALUE]
           ,TGT.[TELEPHONE]=SRC.[TELEPHONE]
           ,TGT.[B_VOL_COMP_AG]=SRC.[B_VOL_COMP_AG]
           ,TGT.[SALESPERSON]=SRC.[SALESPERSON]
           ,TGT.[GR_BASED_IV]=SRC.[GR_BASED_IV]
           ,TGT.[AUT_GRSET_RET]=SRC.[AUT_GRSET_RET]
           ,TGT.[ERS]=SRC.[ERS]
           ,TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
           ,TGT.[COMMON_VENDOR_NAME]=SRC.[COMMON_VENDOR_NAME]

WHEN NOT MATCHED THEN
INSERT 
(
    
            [VENDOR]
           ,[COMMON_VENDOR]
           ,[TITLE]
           ,[INDUSTRY]
           ,[CONFIRM_STATUS]
           ,[STATUS_OF_TRANSFER]
           ,[CREATED_ON]
           ,[CREATED_BY]
           ,[REP_NAME]
           ,[TYPE_OF_BUSINESS]
           ,[TYPE_OF_INDUSTRY]
           ,[CRED_INFO_NO]
           ,[ACCOUNT_GROUP]
           ,[COUNTRY]
           ,[DELETION_FLAG]
           ,[MATCH_CODE1]
           ,[MATCH_CODE2]
           ,[MATCH_CODE3]
           ,[NAME1]
           ,[NAME2]
           ,[NAME3]
           ,[NAME4]
           ,[CITY]
           ,[PO_BOX]
           ,[PO_BOX_CITY]
           ,[PO_BOX_PCODE]
           ,[POSTAL_CODE]
           ,[QM_SYSTEM_TO]
           ,[STATE]
           ,[SEARCH_TERM]
           ,[PURCH_BLOCK]
           ,[POSTING_BLOCK]
           ,[TAX_NUMBER1]
           ,[TAX_NUMBER2]
           ,[TAX_NUMBER3]
           ,[TAX_NUMBER4]
           ,[STREET]
           ,[TELEPHONE1]
           ,[TELEPHONE2]
           ,[FAX_NUMBER]
           ,[TAX_JUR]
           ,[CONFIRM_DATE]
           ,[CONFIRM_TIME]
           ,[RECON_ACCOUNT]
           ,[PREV_ACCT_NO]
           ,[COMPANY_CODE]
           ,[CERTIFICTN_DATE]
           ,[CERTIFIED_BY]
           ,[CONFIRMST_CCD]
           ,[PLANNING_GROUP]
           ,[CR_MEMO_TERMS]
           ,[ALTERNAT_PAYEE]
           ,[CO_CDE_DELETION_FLAG]
           ,[MINORITY_INDIC]
           ,[COCD_DEL_BLOCK]
           ,[PERSONNEL_NO]
           ,[COUNTRY_WHTAX]
           ,[CO_CODE_POST_BLOCK]
           ,[PMT_METH_SUPL]
           ,[ALT_PAYEE_DOC]
           ,[INDIVIDUAL_PMNT]
           ,[PAYMENT_BLOCK]
           ,[GROUPING_KEY]
           ,[PAYT_TERMS]
           ,[SORT_KEY]
           ,[PAYMENT_METHODS]
           ,[PURCHASING_ORG]
           ,[ACC_W_VENDOR]
           ,[PURCH_GROUP]
           ,[INCOTERMS1]
           ,[INCOTERMS2]
           ,[AUTOMATIC_PO]
           ,[DEL_FLAG_PORG]
           ,[MINIMUM_VALUE]
           ,[TELEPHONE]
           ,[B_VOL_COMP_AG]
           ,[SALESPERSON]
           ,[GR_BASED_IV]
           ,[AUT_GRSET_RET]
           ,[ERS]
           ,[DESCRIPTION]
           ,[COMMON_VENDOR_NAME]
           ,[LONG_DESCRIPTION]

	 )
VALUES( 

            SRC.[VENDOR]
           ,SRC.[COMMON_VENDOR]
           ,SRC.[TITLE]
           ,SRC.[INDUSTRY]
           ,SRC.[CONFIRM_STATUS]
           ,SRC.[STATUS_OF_TRANSFER]
           ,SRC.[CREATED_ON]
           ,SRC.[CREATED_BY]
           ,SRC.[REP_NAME]
           ,SRC.[TYPE_OF_BUSINESS]
           ,SRC.[TYPE_OF_INDUSTRY]
           ,SRC.[CRED_INFO_NO]
           ,SRC.[ACCOUNT_GROUP]
           ,SRC.[COUNTRY]
           ,SRC.[DELETION_FLAG]
           ,SRC.[MATCH_CODE1]
           ,SRC.[MATCH_CODE2]
           ,SRC.[MATCH_CODE3]
           ,SRC.[NAME1]
           ,SRC.[NAME2]
           ,SRC.[NAME3]
           ,SRC.[NAME4]
           ,SRC.[CITY]
           ,SRC.[PO_BOX]
           ,SRC.[PO_BOX_CITY]
           ,SRC.[PO_BOX_PCODE]
           ,SRC.[POSTAL_CODE]
           ,SRC.[QM_SYSTEM_TO]
           ,SRC.[STATE]
           ,SRC.[SEARCH_TERM]
           ,SRC.[PURCH_BLOCK]
           ,SRC.[POSTING_BLOCK]
           ,SRC.[TAX_NUMBER1]
           ,SRC.[TAX_NUMBER2]
           ,SRC.[TAX_NUMBER3]
           ,SRC.[TAX_NUMBER4]
           ,SRC.[STREET]
           ,SRC.[TELEPHONE1]
           ,SRC.[TELEPHONE2]
           ,SRC.[FAX_NUMBER]
           ,SRC.[TAX_JUR]
           ,SRC.[CONFIRM_DATE]
           ,SRC.[CONFIRM_TIME]
           ,SRC.[RECON_ACCOUNT]
           ,SRC.[PREV_ACCT_NO]
           ,SRC.[COMPANY_CODE]
           ,SRC.[CERTIFICTN_DATE]
           ,SRC.[CERTIFIED_BY]
           ,SRC.[CONFIRMST_CCD]
           ,SRC.[PLANNING_GROUP]
           ,SRC.[CR_MEMO_TERMS]
           ,SRC.[ALTERNAT_PAYEE]
           ,SRC.[CO_CDE_DELETION_FLAG]
           ,SRC.[MINORITY_INDIC]
           ,SRC.[COCD_DEL_BLOCK]
           ,SRC.[PERSONNEL_NO]
           ,SRC.[COUNTRY_WHTAX]
           ,SRC.[CO_CODE_POST_BLOCK]
           ,SRC.[PMT_METH_SUPL]
           ,SRC.[ALT_PAYEE_DOC]
           ,SRC.[INDIVIDUAL_PMNT]
           ,SRC.[PAYMENT_BLOCK]
           ,SRC.[GROUPING_KEY]
           ,SRC.[PAYT_TERMS]
           ,SRC.[SORT_KEY]
           ,SRC.[PAYMENT_METHODS]
           ,SRC.[PURCHASING_ORG]
           ,SRC.[ACC_W_VENDOR]
           ,SRC.[PURCH_GROUP]
           ,SRC.[INCOTERMS1]
           ,SRC.[INCOTERMS2]
           ,SRC.[AUTOMATIC_PO]
           ,SRC.[DEL_FLAG_PORG]
           ,SRC.[MINIMUM_VALUE]
           ,SRC.[TELEPHONE]
           ,SRC.[B_VOL_COMP_AG]
           ,SRC.[SALESPERSON]
           ,SRC.[GR_BASED_IV]
           ,SRC.[AUT_GRSET_RET]
           ,SRC.[ERS]
           ,SRC.[DESCRIPTION]
           ,SRC.[COMMON_VENDOR_NAME]
           ,SRC.[LONG_DESCRIPTION]

);


IF NOT EXISTS (SELECT * FROM [MD].[VENDOR] where [VENDOR]='-1')
BEGIN 

INSERT [MD].[VENDOR] (

 [VENDOR]
           ,[COMMON_VENDOR]
           ,[TITLE]
           ,[INDUSTRY]
           ,[CONFIRM_STATUS]
           ,[STATUS_OF_TRANSFER]
           ,[CREATED_ON]
           ,[CREATED_BY]
           ,[REP_NAME]
           ,[TYPE_OF_BUSINESS]
           ,[TYPE_OF_INDUSTRY]
           ,[CRED_INFO_NO]
           ,[ACCOUNT_GROUP]
           ,[COUNTRY]
           ,[DELETION_FLAG]
           ,[MATCH_CODE1]
           ,[MATCH_CODE2]
           ,[MATCH_CODE3]
           ,[NAME1]
           ,[NAME2]
           ,[NAME3]
           ,[NAME4]
           ,[CITY]
           ,[PO_BOX]
           ,[PO_BOX_CITY]
           ,[PO_BOX_PCODE]
           ,[POSTAL_CODE]
           ,[QM_SYSTEM_TO]
           ,[STATE]
           ,[SEARCH_TERM]
           ,[PURCH_BLOCK]
           ,[POSTING_BLOCK]
           ,[TAX_NUMBER1]
           ,[TAX_NUMBER2]
           ,[TAX_NUMBER3]
           ,[TAX_NUMBER4]
           ,[STREET]
           ,[TELEPHONE1]
           ,[TELEPHONE2]
           ,[FAX_NUMBER]
           ,[TAX_JUR]
           ,[CONFIRM_DATE]
           ,[CONFIRM_TIME]
           ,[RECON_ACCOUNT]
           ,[PREV_ACCT_NO]
           ,[COMPANY_CODE]
           ,[CERTIFICTN_DATE]
           ,[CERTIFIED_BY]
           ,[CONFIRMST_CCD]
           ,[PLANNING_GROUP]
           ,[CR_MEMO_TERMS]
           ,[ALTERNAT_PAYEE]
           ,[CO_CDE_DELETION_FLAG]
           ,[MINORITY_INDIC]
           ,[COCD_DEL_BLOCK]
           ,[PERSONNEL_NO]
           ,[COUNTRY_WHTAX]
           ,[CO_CODE_POST_BLOCK]
           ,[PMT_METH_SUPL]
           ,[ALT_PAYEE_DOC]
           ,[INDIVIDUAL_PMNT]
           ,[PAYMENT_BLOCK]
           ,[GROUPING_KEY]
           ,[PAYT_TERMS]
           ,[SORT_KEY]
           ,[PAYMENT_METHODS]
           ,[PURCHASING_ORG]
           ,[ACC_W_VENDOR]
           ,[PURCH_GROUP]
           ,[INCOTERMS1]
           ,[INCOTERMS2]
           ,[AUTOMATIC_PO]
           ,[DEL_FLAG_PORG]
           ,[MINIMUM_VALUE]
           ,[TELEPHONE]
           ,[B_VOL_COMP_AG]
           ,[SALESPERSON]
           ,[GR_BASED_IV]
           ,[AUT_GRSET_RET]
           ,[ERS]
           ,[DESCRIPTION]
           ,[COMMON_VENDOR_NAME]
           ,[LONG_DESCRIPTION]
    
)

VALUES (

'-1',
'Unknown',
'Unknown',
'Unkn',
'U',
'U',
'1900-01-01',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unkn',
'Ukn',
'U',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'1900-01-01',
'Ukn',
'Unknown',
'U',
'U',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'1900-01-01',
'Unknown',
'Unknown',
'Unknown',
'Unkn',
'1900-01-01',
'Unkn',
'U',
'Unknown',
'Unkn',
'Unknown',
'U',
'Ukn',
'U',
'0',
'Ukn',
'U',
'U',
'U',
'U',
'U',
'U',
'UKN',
'UKN',
'Unknown',
'UKN',
'Unknown',
'UKN',
'UKN',
'Unknown',
'U',
'U',
'0',
'Unknown',
'U',
'Unknown',
'U',
'U',
'U',
'Unknown',
'Unknown',
'Unknown'

)


END



--Log End

SELECT @rows_loaded=COUNT(*) FROM [MD].[VENDOR]
EXEC ETL.uspLOG_LOAD 'END',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded

END TRY


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Proc_Name,@file_name,@Source_Type,@Error_Message,-1
 ------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspVERSION]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

TRUNCATE TABLE [MD].[VERSION]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[VERSION]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspVERSION] 'S','2015-03-24'

EXEC [MD].[uspVERSION] 'F','1900-01-01'

EXEC [MD].[uspVERSION] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspVERSION]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspVERSION'
DECLARE @dw_object_name varchar(150)='MD.VERSION'
DECLARE @stg_object_name varchar(150)='STG_MD.VERSION'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[VERSION]  WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[VERSION];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[VERSION] TGT
	 USING (
	 SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [VERSION],
     [DESCRIPTION],
	 [VERSION]+' - '+[DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM
	 [STG_MD_SYN].[VERSION] ) SRC
	 ON
TGT.[VERSION]=SRC.[VERSION] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(

    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [VERSION],
    [DESCRIPTION],
    [LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[VERSION], 
	SRC.[DESCRIPTION],
    SRC.[LONG_DESCRIPTION]
	
);

SELECT @cnt_dw=COUNT(*) FROM [MD].[VERSION];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[VERSION] GROUP BY [VERSION] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[VERSION] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

 MERGE INTO [MD].[VERSION] TGT
	 USING (
	 SELECT 
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 [VERSION],
     [DESCRIPTION],
	 [VERSION]+' - '+[DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM
	 [STG_MD_SYN].[VERSION]
							WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	  ) SRC
	 ON
TGT.[VERSION]=SRC.[VERSION] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(

    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [VERSION],
    [DESCRIPTION],
    [LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[VERSION], 
	SRC.[DESCRIPTION],
    SRC.[LONG_DESCRIPTION]
	
);




SELECT @cnt_dw=COUNT(*) FROM [MD].[VERSION] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[VERSION] GROUP BY [VERSION] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH



GO
/****** Object:  StoredProcedure [MD].[uspWBS_ELEMENT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

TRUNCATE TABLE [MD].[WBS_ELEMENT]
SELECT * FROM [MD].[WBS_ELEMENT]
TRUNCATE TABLE ETL.LOGGING

SELECT * FROM ETL.LOGGING;

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspWBS_ELEMENT] 'S','2015-03-24'

EXEC [MD].[uspWBS_ELEMENT] 'F','1900-01-01'

EXEC [MD].[uspWBS_ELEMENT] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [MD].[uspWBS_ELEMENT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY

DECLARE @Proc_Name varchar(150)='MD.uspWBS_ELEMENT'
DECLARE @dw_object_name varchar(150)='MD.WBS_ELEMENT'
DECLARE @stg_object_name varchar(150)='STG_MD.WBS_ELEMENT'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[WBS_ELEMENT] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END


-------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[WBS_ELEMENT];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[WBS_ELEMENT] TGT
	 USING 
 (SELECT  
             [DATA_AS_OF_DATE] 
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME]
			,[DW_STATUS_IND] 
			,LEFT(RTRIM(LTRIM(WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),9,3) AS WBS_ELEMENT
			,[DESCRIPTION]
			,[CHANGED_ON] 
			,[CHANGED_BY]
			,[REQ_COST_CENTER] 
			,[CREATED_ON] 
			,[CREATED_BY] 
			,[RESP_COST_CNTR] 
			,[FUNCTIONAL_AREA] 
			,[INVEST_PROFILE] 
			,[COST_CENTER] 
			,[COST_OBJECT]
			,[OBJECT_NUMBER] 
			,[BUSINESS_AREA] 
			,[PROJ_TYPE] 
			,[STATUS_COMB]
			,[OBJECT_CLASS] 
			,[LEVEL] 
			,[TECH_COMPLETE] 
			,[FUND_GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUND_FUNDED] 
			,[GRANT_FUND] 
			,[PERSON_RESPONS] 
			,[PERSON_RESPONS1] 
			,LEFT(RTRIM(LTRIM(WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),9,3) + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[WBS_ELEMENT]) SRC
	 ON
TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT] 
WHEN MATCHED THEN 
UPDATE SET 
 	         TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
			,TGT.[CHANGED_ON]= SRC.[CHANGED_ON]
			,TGT.[CHANGED_BY]=SRC.[CHANGED_BY]
			,TGT.[REQ_COST_CENTER]= SRC.[REQ_COST_CENTER]
			,TGT.[CREATED_ON]= SRC.[CREATED_ON]
			,TGT.[CREATED_BY]= SRC.[CREATED_BY]
			,TGT.[RESP_COST_CNTR]=SRC.[RESP_COST_CNTR]
			,TGT.[FUNCTIONAL_AREA]= SRC.[FUNCTIONAL_AREA]
			,TGT.[INVEST_PROFILE]= SRC.[INVEST_PROFILE]
			,TGT.[COST_CENTER]= SRC.[COST_CENTER]
			,TGT.[COST_OBJECT]=SRC.[COST_OBJECT]
			,TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER]
			,TGT.[BUSINESS_AREA]= SRC.[BUSINESS_AREA]
			,TGT.[PROJ_TYPE]= SRC.[PROJ_TYPE]
			,TGT.[STATUS_COMB]=SRC.[STATUS_COMB]
			,TGT.[OBJECT_CLASS]= SRC.[OBJECT_CLASS]
			,TGT.[LEVEL]= SRC.[LEVEL]
			,TGT.[TECH_COMPLETE]= SRC.[TECH_COMPLETE]
			,TGT.[FUND_GRANT]= SRC.[FUND_GRANT]
			,TGT.[SPONSOR_PROGRAM]= SRC.[SPONSOR_PROGRAM]
			,TGT.[FUND_FUNDED]= SRC.[FUND_FUNDED]
			,TGT.[GRANT_FUND]= SRC.[GRANT_FUND]
			,TGT.[PERSON_RESPONS]= SRC.[PERSON_RESPONS]
			,TGT.[PERSON_RESPONS1]=SRC.[PERSON_RESPONS1]
			,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
     
	         [DATA_AS_OF_DATE] 
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME]
			,[DW_STATUS_IND] 
			,[WBS_ELEMENT]
			,[DESCRIPTION]
			,[CHANGED_ON] 
			,[CHANGED_BY]
			,[REQ_COST_CENTER] 
			,[CREATED_ON] 
			,[CREATED_BY] 
			,[RESP_COST_CNTR] 
			,[FUNCTIONAL_AREA] 
			,[INVEST_PROFILE] 
			,[COST_CENTER] 
			,[COST_OBJECT]
			,[OBJECT_NUMBER] 
			,[BUSINESS_AREA] 
			,[PROJ_TYPE] 
			,[STATUS_COMB]
			,[OBJECT_CLASS] 
			,[LEVEL] 
			,[TECH_COMPLETE] 
			,[FUND_GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUND_FUNDED] 
			,[GRANT_FUND] 
			,[PERSON_RESPONS] 
			,[PERSON_RESPONS1] 
			,LONG_DESCRIPTION

	 )
VALUES( 

             SRC.[DATA_AS_OF_DATE] 
			,SRC.[DS_INSERT_DATE]
			,SRC.[DS_INSERT_TIME]
			,SRC.[DW_STATUS_IND] 
			,SRC.[WBS_ELEMENT]
			,SRC.[DESCRIPTION]
			,SRC.[CHANGED_ON] 
			,SRC.[CHANGED_BY]
			,SRC.[REQ_COST_CENTER] 
			,SRC.[CREATED_ON] 
			,SRC.[CREATED_BY] 
			,SRC.[RESP_COST_CNTR] 
			,SRC.[FUNCTIONAL_AREA] 
			,SRC.[INVEST_PROFILE] 
			,SRC.[COST_CENTER] 
			,SRC.[COST_OBJECT]
			,SRC.[OBJECT_NUMBER] 
			,SRC.[BUSINESS_AREA] 
			,SRC.[PROJ_TYPE] 
			,SRC.[STATUS_COMB]
			,SRC.[OBJECT_CLASS] 
			,SRC.[LEVEL] 
			,SRC.[TECH_COMPLETE] 
			,SRC.[FUND_GRANT] 
			,SRC.[SPONSOR_PROGRAM] 
			,SRC.[FUND_FUNDED] 
			,SRC.[GRANT_FUND] 
			,SRC.[PERSON_RESPONS] 
			,SRC.[PERSON_RESPONS1] 
			,SRC.[LONG_DESCRIPTION]
);


IF NOT EXISTS (SELECT * FROM [MD].[WBS_ELEMENT] where [WBS_ELEMENT]='--')
BEGIN 

INSERT [MD].[WBS_ELEMENT] (

             [DATA_AS_OF_DATE] 
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME]
			,[DW_STATUS_IND] 
			,[WBS_ELEMENT]
			,[DESCRIPTION]
			,[CHANGED_ON] 
			,[CHANGED_BY]
			,[REQ_COST_CENTER] 
			,[CREATED_ON] 
			,[CREATED_BY] 
			,[RESP_COST_CNTR] 
			,[FUNCTIONAL_AREA] 
			,[INVEST_PROFILE] 
			,[COST_CENTER] 
			,[COST_OBJECT]
			,[OBJECT_NUMBER] 
			,[BUSINESS_AREA] 
			,[PROJ_TYPE] 
			,[STATUS_COMB]
			,[OBJECT_CLASS] 
			,[LEVEL] 
			,[TECH_COMPLETE] 
			,[FUND_GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUND_FUNDED] 
			,[GRANT_FUND] 
			,[PERSON_RESPONS] 
			,[PERSON_RESPONS1] 
			,[LONG_DESCRIPTION]    
)

VALUES (
'1900-01-01',
'1900-01-01',
'1900-01-01 00:00:00.0000000',
'U',
'--',
'--',
'1900-01-01',
'--',
'--',
'1900-01-01',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'U',
'-1',
'U',
'-1',
'1900-01-01',
'--',
'--',
'U',
'U',
'--',
'-1',
'--'
);


END -- end of the uknown insert 

SELECT @cnt_dw=COUNT(*) FROM [MD].[WBS_ELEMENT];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[WBS_ELEMENT] GROUP BY [WBS_ELEMENT] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END -- end of the full load logic

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[WBS_ELEMENT] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [MD].[WBS_ELEMENT] TGT
	 USING 
 (SELECT  
             [DATA_AS_OF_DATE] 
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME]
			,[DW_STATUS_IND] 
			,LEFT(RTRIM(LTRIM(WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),9,3) AS WBS_ELEMENT
			,[DESCRIPTION]
			,[CHANGED_ON] 
			,[CHANGED_BY]
			,[REQ_COST_CENTER] 
			,[CREATED_ON] 
			,[CREATED_BY] 
			,[RESP_COST_CNTR] 
			,[FUNCTIONAL_AREA] 
			,[INVEST_PROFILE] 
			,[COST_CENTER] 
			,[COST_OBJECT]
			,[OBJECT_NUMBER] 
			,[BUSINESS_AREA] 
			,[PROJ_TYPE] 
			,[STATUS_COMB]
			,[OBJECT_CLASS] 
			,[LEVEL] 
			,[TECH_COMPLETE] 
			,[FUND_GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUND_FUNDED] 
			,[GRANT_FUND] 
			,[PERSON_RESPONS] 
			,[PERSON_RESPONS1] 
			,LEFT(RTRIM(LTRIM(WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS_ELEMENT)),9,3) + ' - ' + [DESCRIPTION] AS LONG_DESCRIPTION
  FROM [STG_MD_SYN].[WBS_ELEMENT]
							   WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
  ) SRC
	 ON
TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT] 
WHEN MATCHED THEN 
UPDATE SET 
 	         TGT.[DESCRIPTION]=SRC.[DESCRIPTION]
			,TGT.[CHANGED_ON]= SRC.[CHANGED_ON]
			,TGT.[CHANGED_BY]=SRC.[CHANGED_BY]
			,TGT.[REQ_COST_CENTER]= SRC.[REQ_COST_CENTER]
			,TGT.[CREATED_ON]= SRC.[CREATED_ON]
			,TGT.[CREATED_BY]= SRC.[CREATED_BY]
			,TGT.[RESP_COST_CNTR]=SRC.[RESP_COST_CNTR]
			,TGT.[FUNCTIONAL_AREA]= SRC.[FUNCTIONAL_AREA]
			,TGT.[INVEST_PROFILE]= SRC.[INVEST_PROFILE]
			,TGT.[COST_CENTER]= SRC.[COST_CENTER]
			,TGT.[COST_OBJECT]=SRC.[COST_OBJECT]
			,TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER]
			,TGT.[BUSINESS_AREA]= SRC.[BUSINESS_AREA]
			,TGT.[PROJ_TYPE]= SRC.[PROJ_TYPE]
			,TGT.[STATUS_COMB]=SRC.[STATUS_COMB]
			,TGT.[OBJECT_CLASS]= SRC.[OBJECT_CLASS]
			,TGT.[LEVEL]= SRC.[LEVEL]
			,TGT.[TECH_COMPLETE]= SRC.[TECH_COMPLETE]
			,TGT.[FUND_GRANT]= SRC.[FUND_GRANT]
			,TGT.[SPONSOR_PROGRAM]= SRC.[SPONSOR_PROGRAM]
			,TGT.[FUND_FUNDED]= SRC.[FUND_FUNDED]
			,TGT.[GRANT_FUND]= SRC.[GRANT_FUND]
			,TGT.[PERSON_RESPONS]= SRC.[PERSON_RESPONS]
			,TGT.[PERSON_RESPONS1]=SRC.[PERSON_RESPONS1]
			,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
WHEN NOT MATCHED THEN
INSERT 
(
     
	         [DATA_AS_OF_DATE] 
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME]
			,[DW_STATUS_IND] 
			,[WBS_ELEMENT]
			,[DESCRIPTION]
			,[CHANGED_ON] 
			,[CHANGED_BY]
			,[REQ_COST_CENTER] 
			,[CREATED_ON] 
			,[CREATED_BY] 
			,[RESP_COST_CNTR] 
			,[FUNCTIONAL_AREA] 
			,[INVEST_PROFILE] 
			,[COST_CENTER] 
			,[COST_OBJECT]
			,[OBJECT_NUMBER] 
			,[BUSINESS_AREA] 
			,[PROJ_TYPE] 
			,[STATUS_COMB]
			,[OBJECT_CLASS] 
			,[LEVEL] 
			,[TECH_COMPLETE] 
			,[FUND_GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUND_FUNDED] 
			,[GRANT_FUND] 
			,[PERSON_RESPONS] 
			,[PERSON_RESPONS1] 
			,LONG_DESCRIPTION

	 )
VALUES( 

             SRC.[DATA_AS_OF_DATE] 
			,SRC.[DS_INSERT_DATE]
			,SRC.[DS_INSERT_TIME]
			,SRC.[DW_STATUS_IND] 
			,SRC.[WBS_ELEMENT]
			,SRC.[DESCRIPTION]
			,SRC.[CHANGED_ON] 
			,SRC.[CHANGED_BY]
			,SRC.[REQ_COST_CENTER] 
			,SRC.[CREATED_ON] 
			,SRC.[CREATED_BY] 
			,SRC.[RESP_COST_CNTR] 
			,SRC.[FUNCTIONAL_AREA] 
			,SRC.[INVEST_PROFILE] 
			,SRC.[COST_CENTER] 
			,SRC.[COST_OBJECT]
			,SRC.[OBJECT_NUMBER] 
			,SRC.[BUSINESS_AREA] 
			,SRC.[PROJ_TYPE] 
			,SRC.[STATUS_COMB]
			,SRC.[OBJECT_CLASS] 
			,SRC.[LEVEL] 
			,SRC.[TECH_COMPLETE] 
			,SRC.[FUND_GRANT] 
			,SRC.[SPONSOR_PROGRAM] 
			,SRC.[FUND_FUNDED] 
			,SRC.[GRANT_FUND] 
			,SRC.[PERSON_RESPONS] 
			,SRC.[PERSON_RESPONS1] 
			,SRC.[LONG_DESCRIPTION]
);


IF NOT EXISTS (SELECT * FROM [MD].[WBS_ELEMENT] where [WBS_ELEMENT]='--')
BEGIN 

INSERT [MD].[WBS_ELEMENT] (

             [DATA_AS_OF_DATE] 
			,[DS_INSERT_DATE]
			,[DS_INSERT_TIME]
			,[DW_STATUS_IND] 
			,[WBS_ELEMENT]
			,[DESCRIPTION]
			,[CHANGED_ON] 
			,[CHANGED_BY]
			,[REQ_COST_CENTER] 
			,[CREATED_ON] 
			,[CREATED_BY] 
			,[RESP_COST_CNTR] 
			,[FUNCTIONAL_AREA] 
			,[INVEST_PROFILE] 
			,[COST_CENTER] 
			,[COST_OBJECT]
			,[OBJECT_NUMBER] 
			,[BUSINESS_AREA] 
			,[PROJ_TYPE] 
			,[STATUS_COMB]
			,[OBJECT_CLASS] 
			,[LEVEL] 
			,[TECH_COMPLETE] 
			,[FUND_GRANT] 
			,[SPONSOR_PROGRAM] 
			,[FUND_FUNDED] 
			,[GRANT_FUND] 
			,[PERSON_RESPONS] 
			,[PERSON_RESPONS1] 
			,[LONG_DESCRIPTION]    
)

VALUES (
'1900-01-01',
'1900-01-01',
'1900-01-01 00:00:00.0000000',
'U',
'--',
'--',
'1900-01-01',
'--',
'--',
'1900-01-01',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'--',
'U',
'-1',
'U',
'-1',
'1900-01-01',
'--',
'--',
'U',
'U',
'--',
'-1',
'--'
);



END -- end of the uknown insert 


SELECT @cnt_dw=COUNT(*) FROM [MD].[WBS_ELEMENT] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[WBS_ELEMENT] GROUP BY WBS_ELEMENT HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY


BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MD].[uspWORKFLOW_STATUS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
TRUNCATE TABLE [MD].[WORKFLOW_STATUS]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [MD].[WORKFLOW_STATUS]

SELECT * FROM ETL.LOGGING;

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [MD].[uspWORKFLOW_STATUS] 'S','2015-03-24'

EXEC [MD].[uspWORKFLOW_STATUS] 'F','1900-01-01'

EXEC [MD].[uspWORKFLOW_STATUS] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/



CREATE PROCEDURE [MD].[uspWORKFLOW_STATUS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MD.uspWORKFLOW_STATUS'
DECLARE @dw_object_name varchar(150)='MD.WORKFLOW_STATUS'
DECLARE @stg_object_name varchar(150)='STG_MD.WORKFLOW_STATUS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 -------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [MD].[WORKFLOW_STATUS]  WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[WORKFLOW_STATUS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [MD].[WORKFLOW_STATUS] TGT
	 USING (
	 SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [WORKFLOW_STATUS],
     [DESCRIPTION],
	 [WORKFLOW_STATUS]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM
	 [STG_MD_SYN].[WORKFLOW_STATUS] ) SRC
	 ON
TGT.[WORKFLOW_STATUS]=SRC.[WORKFLOW_STATUS] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [WORKFLOW_STATUS],
    [DESCRIPTION],
    [LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[WORKFLOW_STATUS], 
	SRC.[DESCRIPTION],
    SRC.[LONG_DESCRIPTION]
	
);

SELECT @cnt_dw=COUNT(*) FROM [MD].[WORKFLOW_STATUS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[WORKFLOW_STATUS] GROUP BY [WORKFLOW_STATUS] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_MD_SYN].[WORKFLOW_STATUS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

 
MERGE INTO [MD].[WORKFLOW_STATUS] TGT
	 USING (
	 SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
     [WORKFLOW_STATUS],
     [DESCRIPTION],
	 [WORKFLOW_STATUS]+' - '+ [DESCRIPTION] AS [LONG_DESCRIPTION]
	 FROM
	 [STG_MD_SYN].[WORKFLOW_STATUS]
								 WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	  ) SRC
	 ON
TGT.[WORKFLOW_STATUS]=SRC.[WORKFLOW_STATUS] 
WHEN MATCHED THEN 
UPDATE SET 
   	
	TGT.[DESCRIPTION]=SRC.[DESCRIPTION],
	TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
		
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [WORKFLOW_STATUS],
    [DESCRIPTION],
    [LONG_DESCRIPTION]

	 )
VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[WORKFLOW_STATUS], 
	SRC.[DESCRIPTION],
    SRC.[LONG_DESCRIPTION]
	
);


SELECT @cnt_dw=COUNT(*) FROM [MD].[WORKFLOW_STATUS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [MD].[WORKFLOW_STATUS] GROUP BY [WORKFLOW_STATUS] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END


END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MX].[uspCARRY_FORWARD_BUDGET_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MX].[uspCARRY_FORWARD_BUDGET_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 


DECLARE @Proc_Name varchar(150)='MX.uspCARRY_FORWARD_BUDGET_AMOUNT'
DECLARE @dw_object_name varchar(150)='[TD].[FM_BDGT_ENTR]'
DECLARE @stg_object_name varchar(150)='STG_TD.[FM_BDGT_ENTR]'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


 IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN 

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


UPDATE [TD].[FM_BDGT_ENTR]
SET [CARRY_FORWARD_BUDGET_AMOUNT] = [FMAC_AMOUNT]
WHERE ([BUDGET_TYPE] IN ('CFSE','CFRE','CRIT') AND [DOCUMENT_STATUS] IN ('1','3') AND [VERSION]='000') 


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] GROUP BY [ENTRY_DOCUMENT_NO], [ENTRY_DOCUMENT_LINE], [FY_PERIOD] HAVING COUNT(*)>1; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END 


IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_BDGT_ENTR]
SET [CARRY_FORWARD_BUDGET_AMOUNT] = [FMAC_AMOUNT]
WHERE ([BUDGET_TYPE] IN ('CFSE','CFRE','CRIT') AND [DOCUMENT_STATUS] IN ('1','3') AND [VERSION]='000') 
AND
			DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] GROUP BY  [ENTRY_DOCUMENT_NO], [ENTRY_DOCUMENT_LINE], [FY_PERIOD] HAVING COUNT(*)>1;  

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [MX].[uspCHANGED_BUDGET_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MX].[uspCHANGED_BUDGET_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 


DECLARE @Proc_Name varchar(150)='MX.uspCHANGED_BUDGET_AMOUNT'
DECLARE @dw_object_name varchar(150)='[TD].[FM_BDGT_ENTR]'
DECLARE @stg_object_name varchar(150)='STG_TD.[FM_BDGT_ENTR]'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0
 


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


UPDATE [TD].[FM_BDGT_ENTR]
SET [CHANGED_BUDGET_AMOUNT] = FMAC_AMOUNT
WHERE ([BUDGET_TYPE] IN ('FYRE','GM01','QUA1','QUA2','QUA3','RIB','TRAN') AND [DOCUMENT_STATUS] IN ('1','3') AND [VERSION]='000') 

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_BDGT_ENTR]
SET [CHANGED_BUDGET_AMOUNT] = FMAC_AMOUNT
WHERE ([BUDGET_TYPE] IN ('FYRE','GM01','QUA1','QUA2','QUA3','RIB','TRAN') AND [DOCUMENT_STATUS] IN ('1','3') AND [VERSION]='000') 
AND
							DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE



SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END


END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MX].[uspCURRENT_BUDGET_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MX].[uspCURRENT_BUDGET_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 


DECLARE @Proc_Name varchar(150)='MX.uspCURRENT_BUDGET_AMOUNT'
DECLARE @dw_object_name varchar(150)='TD.FM_BDGT_ENTR'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_BDGT_ENTR'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_BDGT_ENTR]
SET [CURRENT_BUDGET_AMOUNT] = 
ISNULL([ORIGINAL_BUDGET_AMOUNT],0)+
ISNULL([CHANGED_BUDGET_AMOUNT],0)+
ISNULL([CARRY_FORWARD_BUDGET_AMOUNT],0)

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM  [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_BDGT_ENTR]
SET [CURRENT_BUDGET_AMOUNT] = 
ISNULL([ORIGINAL_BUDGET_AMOUNT],0)+
ISNULL([CHANGED_BUDGET_AMOUNT],0)+
ISNULL([CARRY_FORWARD_BUDGET_AMOUNT],0)

				WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR]  WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA-----------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [MX].[uspENCUMBRANCE_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MX].[uspENCUMBRANCE_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 


DECLARE @Proc_Name varchar(150)='MX.uspENCUMBRANCE_AMOUNT'
DECLARE @dw_object_name varchar(150)=' TD.FM_CMMT_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_CMMT_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_CMMT_LNITMS]
SET ENCUMBRANCE_AMOUNT = FMAC_AMOUNT
WHERE (VALUE_TYPE IN ('51','52','80','81') AND STATISTICAL_ID='Z');

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_CMMT_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_CMMT_LNITMS]  WHERE [SOURCERECORDSTATUS]='U';

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 

END

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_CMMT_LNITMS]
SET ENCUMBRANCE_AMOUNT = FMAC_AMOUNT
WHERE (VALUE_TYPE IN ('51','52','80','81') AND STATISTICAL_ID='Z')  AND

							DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [MX].[uspEXPENDITURE_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MX].[uspEXPENDITURE_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 


DECLARE @Proc_Name varchar(150)='MX.uspEXPENDITURE_AMOUNT'
DECLARE @dw_object_name varchar(150)='TD.FM_FI_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_FI_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_FI_LNITMS]
SET EXPENDITURE_AMOUNT = FMAC_AMOUNT
WHERE ((AMOUNT_TYPE NOT IN ('0350', '0300') OR VALUE_TYPE IN ('54','66')) AND STATISTICAL_ID='Z');

 UPDATE [TD].[FM_PARKED_LNITMS]
SET [PARKED_DOCS_AMOUNT] = FMAC_AMOUNT
WHERE ((AMOUNT_TYPE NOT IN ('0350', '0300') OR VALUE_TYPE IN ('54','66')) AND STATISTICAL_ID='Z');

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_FI_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_FI_LNITMS]
SET EXPENDITURE_AMOUNT = FMAC_AMOUNT
WHERE ((AMOUNT_TYPE NOT IN ('0350', '0300') OR VALUE_TYPE IN ('54','66')) AND STATISTICAL_ID='Z') AND

								DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

UPDATE [TD].[FM_PARKED_LNITMS]
SET [PARKED_DOCS_AMOUNT] = FMAC_AMOUNT
WHERE ((AMOUNT_TYPE NOT IN ('0350', '0300') OR VALUE_TYPE IN ('54','66')) AND STATISTICAL_ID='Z') AND

								DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA--------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
   EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [MX].[uspORIGINAL_BUDGET_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MX].[uspORIGINAL_BUDGET_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MX.uspORIGINAL_BUDGET_AMOUNT'
DECLARE @dw_object_name varchar(150)='TD.FM_BDGT_ENTR'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_BDGT_ENTR'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_BDGT_ENTR]
SET [ORIGINAL_BUDGET_AMOUNT] = FMAC_AMOUNT
WHERE ([BUDGET_TYPE] IN ('ORIG') AND [DOCUMENT_STATUS] IN ('1','3') AND [VERSION]='000' );


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_BDGT_ENTR]
SET [ORIGINAL_BUDGET_AMOUNT] = FMAC_AMOUNT
WHERE ([BUDGET_TYPE] IN ('ORIG') AND [DOCUMENT_STATUS] IN ('1','3') AND [VERSION]='000' ) AND

						DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA-----------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [MX].[uspPRE_ENCUMBRANCE_AMOUNT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MX].[uspPRE_ENCUMBRANCE_AMOUNT]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 

DECLARE @Proc_Name varchar(150)='MX.uspPRE_ENCUMBRANCE_AMOUNT'
DECLARE @dw_object_name varchar(150)='TD.FM_CMMT_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_CMMT_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0


IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_CMMT_LNITMS]
SET PRE_ENCUMBRANCE_AMOUNT = FMAC_AMOUNT
WHERE (VALUE_TYPE IN ('50') AND STATISTICAL_ID='Z'); 

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_CMMT_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

UPDATE [TD].[FM_CMMT_LNITMS]
SET PRE_ENCUMBRANCE_AMOUNT = FMAC_AMOUNT
WHERE (VALUE_TYPE IN ('50') AND STATISTICAL_ID='Z') AND

								(DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE);

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 

BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [TD].[uspFM_BDGT_ENTR]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


TRUNCATE TABLE [TD].[FM_BDGT_ENTR]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [TD].[FM_BDGT_ENTR]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [TD].[uspFM_BDGT_ENTR] 'S','2015-02-08'

EXEC [TD].[uspFM_BDGT_ENTR] 'F','1900-01-01'

EXEC [TD].[uspFM_BDGT_ENTR] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [TD].[uspFM_BDGT_ENTR]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='TD.uspFM_BDGT_ENTR'
DECLARE @dw_object_name varchar(150)='TD.FM_BDGT_ENTR'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_BDGT_ENTR'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [TD].[FM_BDGT_ENTR] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [TD].[FM_BDGT_ENTR] TGT
	 USING  
	 (SELECT
	 [DATA_AS_OF_DATE],
     [DS_INSERT_DATE],
     [DS_INSERT_TIME],
     [DW_STATUS_IND],
	 RTRIM(LTRIM([ENTRY_DOCUMENT_NO])) +'-'+ RTRIM(LTRIM([ENTRY_DOCUMENT_LINE])) AS DOCUMENT_NUMBER ,
    [ENTRY_DOCUMENT_NO] ,
	[ENTRY_DOCUMENT_LINE],
	[DOCUMENT_YEAR],
	[FM_AREA] ,
	[FUND],
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA] ,
	[GRANT] ,
	[FUNDED_PROGRAM] ,
	[CUSTOMER_FIELD] ,
	[BCS_VALUE_TYPE] ,
	[BUDGET_CATEGORY] ,
	[FM_VALTYPE] ,
	[BUDG_PROCESS] ,
	[BUDGET_TYPE] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YEC] ,
	[TEXT]  ,
	[DOCUMENT_FAMILY] ,
	[BUDGETING_PROCESS] ,
	[VERSION] ,
	[CREATED_BY] ,
	[CREATED_ON] ,
	[DOCUMENT_DATE],
	[POSTING_DATE] ,
	[PERSON_RESP] ,
	[HEADER_TEXT] ,
	[LONG_TXT_EXISTS] ,
	[DOCUMENT_STATUS] ,
	[REVERSAL_STATUS] ,
	[REVERSAL_NUMBER] ,
	[DOCUMENT_TYPE] ,
	[REPORTING_YEAR_FOR_COHORT] ,
	[PUBLIC_LAW] ,
	[LEGISLATION] ,
	[FM_CURRENCY] ,
	[FMAC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[TRANSFER_AGENCY] ,
	[TRANSFER_ACCOUNT] ,
	[TRADING_PARTNER] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	FISCAL_YEAR,
	ORIGINAL_APPLICATION,
	TEXT_NAME,
	REF_DOCUMENT,
	REF_TRANSACTN,
	REFERENCE,
	CMMT_ITEM_CAT,
	DISTRIBUTION_KEY,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR

	FROM [STG_TD_SYN].[FM_BDGT_ENTR]) SRC
	ON
	TGT.[ENTRY_DOCUMENT_NO]=SRC.[ENTRY_DOCUMENT_NO] AND
	TGT.[ENTRY_DOCUMENT_LINE]=SRC.[ENTRY_DOCUMENT_LINE] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] 
	WHEN MATCHED THEN 
UPDATE SET 
  
	TGT.[ENTRY_DOCUMENT_NO]=SRC.[ENTRY_DOCUMENT_NO] ,
	TGT.[ENTRY_DOCUMENT_LINE]=SRC.[ENTRY_DOCUMENT_LINE],
	TGT.[DOCUMENT_YEAR]=SRC.[DOCUMENT_YEAR],
	TGT.[GRANT]=SRC.[GRANT] ,
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD] ,
	TGT.[BCS_VALUE_TYPE]=SRC.[BCS_VALUE_TYPE] ,
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY] ,
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE] ,
	TGT.[BUDG_PROCESS]=SRC.[BUDG_PROCESS] ,
	TGT.[BUDGET_TYPE]=SRC.[BUDGET_TYPE] ,
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT] ,
	TGT.[YEC]=SRC.[YEC] ,
	TGT.[TEXT]=SRC.[TEXT] ,
	TGT.[DOCUMENT_FAMILY]=SRC.[DOCUMENT_FAMILY] ,
	TGT.[BUDGETING_PROCESS]=SRC.[BUDGETING_PROCESS] ,
	TGT.[VERSION]=SRC.[VERSION] ,
	TGT.[CREATED_BY]=SRC.[CREATED_BY] ,
	TGT.[CREATED_ON]=SRC.[CREATED_ON] ,
	TGT.[DOCUMENT_DATE]=SRC.[DOCUMENT_DATE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE] ,
	TGT.[PERSON_RESP]=SRC.[PERSON_RESP] ,
	TGT.[HEADER_TEXT]=SRC.[HEADER_TEXT] ,
	TGT.[LONG_TXT_EXISTS]=SRC.[LONG_TXT_EXISTS] ,
	TGT.[DOCUMENT_STATUS]=SRC.[DOCUMENT_STATUS],
	TGT.[REVERSAL_STATUS]=SRC.[REVERSAL_STATUS] ,
	TGT.[REVERSAL_NUMBER]=SRC.[REVERSAL_NUMBER] ,
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE] ,
	TGT.[REPORTING_YEAR_FOR_COHORT]=SRC.[REPORTING_YEAR_FOR_COHORT] ,
	TGT.[PUBLIC_LAW]=SRC.[PUBLIC_LAW] ,
	TGT.[LEGISLATION]=SRC.[LEGISLATION] ,
	TGT.[FM_CURRENCY]=SRC.[FM_CURRENCY],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT] ,
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER] ,
	TGT.[TRANSFER_AGENCY]=SRC.[TRANSFER_AGENCY] ,
	TGT.[TRANSFER_ACCOUNT]=SRC.[TRANSFER_ACCOUNT] ,
	TGT.[TRADING_PARTNER]=SRC.[TRADING_PARTNER],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD] ,
	TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA] ,
	TGT.FISCAL_YEAR=SRC.FISCAL_YEAR,
	TGT.ORIGINAL_APPLICATION=SRC.ORIGINAL_APPLICATION,
	TGT.TEXT_NAME=SRC.TEXT_NAME,
	TGT.REF_DOCUMENT=SRC.REF_DOCUMENT,
	TGT.REF_TRANSACTN=SRC.REF_TRANSACTN,
	TGT.REFERENCE=SRC.REFERENCE,
	TGT.CMMT_ITEM_CAT=SRC.CMMT_ITEM_CAT,
	TGT.DISTRIBUTION_KEY=SRC.DISTRIBUTION_KEY,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'
	
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
	[ENTRY_DOCUMENT_NO] ,
	[ENTRY_DOCUMENT_LINE],
	[DOCUMENT_YEAR],
	[FM_AREA] ,
	[FUND],
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA] ,
	[GRANT] ,
	[FUNDED_PROGRAM] ,
	[CUSTOMER_FIELD] ,
	[BCS_VALUE_TYPE] ,
	[BUDGET_CATEGORY] ,
	[FM_VALTYPE] ,
	[BUDG_PROCESS] ,
	[BUDGET_TYPE] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YEC] ,
	[TEXT] ,
	[DOCUMENT_FAMILY] ,
	[BUDGETING_PROCESS] ,
	[VERSION] ,
	[CREATED_BY] ,
	[CREATED_ON] ,
	[DOCUMENT_DATE],
	[POSTING_DATE] ,
	[PERSON_RESP] ,
	[HEADER_TEXT] ,
	[LONG_TXT_EXISTS] ,
	[DOCUMENT_STATUS] ,
	[REVERSAL_STATUS] ,
	[REVERSAL_NUMBER] ,
	[DOCUMENT_TYPE] ,
	[REPORTING_YEAR_FOR_COHORT] ,
	[PUBLIC_LAW] ,
	[LEGISLATION] ,
	[FM_CURRENCY] ,
	[FMAC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[TRANSFER_AGENCY] ,
	[TRANSFER_ACCOUNT] ,
	[TRADING_PARTNER] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	FISCAL_YEAR,
	ORIGINAL_APPLICATION,
	TEXT_NAME,
	REF_DOCUMENT,
	REF_TRANSACTN,
	REFERENCE,
	CMMT_ITEM_CAT,
	DISTRIBUTION_KEY,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID] ,
	[SOURCERECORDSTATUS] 

	
)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
	SRC.[ENTRY_DOCUMENT_NO] ,
	SRC.[ENTRY_DOCUMENT_LINE],
	SRC.[DOCUMENT_YEAR],
	SRC.[FM_AREA] ,
	SRC.[FUND],
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA] ,
	SRC.[GRANT] ,
	SRC.[FUNDED_PROGRAM] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[BCS_VALUE_TYPE] ,
	SRC.[BUDGET_CATEGORY] ,
	SRC.[FM_VALTYPE] ,
	SRC.[BUDG_PROCESS] ,
	SRC.[BUDGET_TYPE] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YEC] ,
	SRC.[TEXT] ,
	SRC.[DOCUMENT_FAMILY] ,
	SRC.[BUDGETING_PROCESS] ,
	SRC.[VERSION] ,
	SRC.[CREATED_BY] ,
	SRC.[CREATED_ON] ,
	SRC.[DOCUMENT_DATE],
	SRC.[POSTING_DATE] ,
	SRC.[PERSON_RESP] ,
	SRC.[HEADER_TEXT] ,
	SRC.[LONG_TXT_EXISTS] ,
	SRC.[DOCUMENT_STATUS] ,
	SRC.[REVERSAL_STATUS] ,
	SRC.[REVERSAL_NUMBER] ,
	SRC.[DOCUMENT_TYPE] ,
	SRC.[REPORTING_YEAR_FOR_COHORT] ,
	SRC.[PUBLIC_LAW] ,
	SRC.[LEGISLATION] ,
	SRC.[FM_CURRENCY] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[TRANSFER_AGENCY] ,
	SRC.[TRANSFER_ACCOUNT] ,
	SRC.[TRADING_PARTNER] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.FISCAL_YEAR,
	SRC.ORIGINAL_APPLICATION,
	SRC.TEXT_NAME,
	SRC.REF_DOCUMENT,
	SRC.REF_TRANSACTN,
	SRC.REFERENCE,
	SRC.CMMT_ITEM_CAT,
	SRC.DISTRIBUTION_KEY,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L' 

);

UPDATE [STG_TD_SYN].[FM_BDGT_ENTR] SET [DW_STATUS_IND]='L';


SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U';  

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

 -----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [TD].[FM_BDGT_ENTR] TGT
	 USING  
	 (SELECT
	[DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
	RTRIM(LTRIM([ENTRY_DOCUMENT_NO])) +'-'+ RTRIM(LTRIM([ENTRY_DOCUMENT_LINE])) AS DOCUMENT_NUMBER ,
    [ENTRY_DOCUMENT_NO] ,
	[ENTRY_DOCUMENT_LINE],
	[DOCUMENT_YEAR],
	[FM_AREA] ,
	[FUND],
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA] ,
	[GRANT] ,
	[FUNDED_PROGRAM] ,
	[CUSTOMER_FIELD] ,
	[BCS_VALUE_TYPE] ,
	[BUDGET_CATEGORY] ,
	[FM_VALTYPE] ,
	[BUDG_PROCESS] ,
	[BUDGET_TYPE] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YEC] ,
	[TEXT]  ,
	[DOCUMENT_FAMILY] ,
	[BUDGETING_PROCESS] ,
	[VERSION] ,
	[CREATED_BY] ,
	[CREATED_ON] ,
	[DOCUMENT_DATE],
	[POSTING_DATE] ,
	[PERSON_RESP] ,
	[HEADER_TEXT] ,
	[LONG_TXT_EXISTS] ,
	[DOCUMENT_STATUS] ,
	[REVERSAL_STATUS] ,
	[REVERSAL_NUMBER] ,
	[DOCUMENT_TYPE] ,
	[REPORTING_YEAR_FOR_COHORT] ,
	[PUBLIC_LAW] ,
	[LEGISLATION] ,
	[FM_CURRENCY] ,
	[FMAC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[TRANSFER_AGENCY] ,
	[TRANSFER_ACCOUNT] ,
	[TRADING_PARTNER] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	FISCAL_YEAR,
	ORIGINAL_APPLICATION,
	TEXT_NAME,
	REF_DOCUMENT,
	REF_TRANSACTN,
	REFERENCE,
	CMMT_ITEM_CAT,
	DISTRIBUTION_KEY,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR

	FROM [STG_TD_SYN].[FM_BDGT_ENTR]
									WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
	) SRC
	ON
	TGT.[ENTRY_DOCUMENT_NO]=SRC.[ENTRY_DOCUMENT_NO] AND
	TGT.[ENTRY_DOCUMENT_LINE]=SRC.[ENTRY_DOCUMENT_LINE] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] 

WHEN MATCHED THEN 
UPDATE SET 
  
	TGT.[ENTRY_DOCUMENT_NO]=SRC.[ENTRY_DOCUMENT_NO] ,
	TGT.[ENTRY_DOCUMENT_LINE]=SRC.[ENTRY_DOCUMENT_LINE],
	TGT.[DOCUMENT_YEAR]=SRC.[DOCUMENT_YEAR],
	TGT.[GRANT]=SRC.[GRANT] ,
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD] ,
	TGT.[BCS_VALUE_TYPE]=SRC.[BCS_VALUE_TYPE] ,
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY] ,
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE] ,
	TGT.[BUDG_PROCESS]=SRC.[BUDG_PROCESS] ,
	TGT.[BUDGET_TYPE]=SRC.[BUDGET_TYPE] ,
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT] ,
	TGT.[YEC]=SRC.[YEC] ,
	TGT.[TEXT]=SRC.[TEXT] ,
	TGT.[DOCUMENT_FAMILY]=SRC.[DOCUMENT_FAMILY] ,
	TGT.[BUDGETING_PROCESS]=SRC.[BUDGETING_PROCESS] ,
	TGT.[VERSION]=SRC.[VERSION] ,
	TGT.[CREATED_BY]=SRC.[CREATED_BY] ,
	TGT.[CREATED_ON]=SRC.[CREATED_ON] ,
	TGT.[DOCUMENT_DATE]=SRC.[DOCUMENT_DATE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE] ,
	TGT.[PERSON_RESP]=SRC.[PERSON_RESP] ,
	TGT.[HEADER_TEXT]=SRC.[HEADER_TEXT] ,
	TGT.[LONG_TXT_EXISTS]=SRC.[LONG_TXT_EXISTS] ,
	TGT.[DOCUMENT_STATUS]=SRC.[DOCUMENT_STATUS],
	TGT.[REVERSAL_STATUS]=SRC.[REVERSAL_STATUS] ,
	TGT.[REVERSAL_NUMBER]=SRC.[REVERSAL_NUMBER] ,
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE] ,
	TGT.[REPORTING_YEAR_FOR_COHORT]=SRC.[REPORTING_YEAR_FOR_COHORT] ,
	TGT.[PUBLIC_LAW]=SRC.[PUBLIC_LAW] ,
	TGT.[LEGISLATION]=SRC.[LEGISLATION] ,
	TGT.[FM_CURRENCY]=SRC.[FM_CURRENCY],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT] ,
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER] ,
	TGT.[TRANSFER_AGENCY]=SRC.[TRANSFER_AGENCY] ,
	TGT.[TRANSFER_ACCOUNT]=SRC.[TRANSFER_ACCOUNT] ,
	TGT.[TRADING_PARTNER]=SRC.[TRADING_PARTNER],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD] ,
	TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA] ,
	TGT.FISCAL_YEAR=SRC.FISCAL_YEAR,
	TGT.ORIGINAL_APPLICATION=SRC.ORIGINAL_APPLICATION,
	TGT.TEXT_NAME=SRC.TEXT_NAME,
	TGT.REF_DOCUMENT=SRC.REF_DOCUMENT,
	TGT.REF_TRANSACTN=SRC.REF_TRANSACTN,
	TGT.REFERENCE=SRC.REFERENCE,
	TGT.CMMT_ITEM_CAT=SRC.CMMT_ITEM_CAT,
	TGT.DISTRIBUTION_KEY=SRC.DISTRIBUTION_KEY,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'
	
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
	[ENTRY_DOCUMENT_NO] ,
	[ENTRY_DOCUMENT_LINE],
	[DOCUMENT_YEAR],
	[FM_AREA] ,
	[FUND],
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA] ,
	[GRANT] ,
	[FUNDED_PROGRAM] ,
	[CUSTOMER_FIELD] ,
	[BCS_VALUE_TYPE] ,
	[BUDGET_CATEGORY] ,
	[FM_VALTYPE] ,
	[BUDG_PROCESS] ,
	[BUDGET_TYPE] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YEC] ,
	[TEXT] ,
	[DOCUMENT_FAMILY] ,
	[BUDGETING_PROCESS] ,
	[VERSION] ,
	[CREATED_BY] ,
	[CREATED_ON] ,
	[DOCUMENT_DATE],
	[POSTING_DATE] ,
	[PERSON_RESP] ,
	[HEADER_TEXT] ,
	[LONG_TXT_EXISTS] ,
	[DOCUMENT_STATUS] ,
	[REVERSAL_STATUS] ,
	[REVERSAL_NUMBER] ,
	[DOCUMENT_TYPE] ,
	[REPORTING_YEAR_FOR_COHORT] ,
	[PUBLIC_LAW] ,
	[LEGISLATION] ,
	[FM_CURRENCY] ,
	[FMAC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[TRANSFER_AGENCY] ,
	[TRANSFER_ACCOUNT] ,
	[TRADING_PARTNER] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	FISCAL_YEAR,
	ORIGINAL_APPLICATION,
	TEXT_NAME,
	REF_DOCUMENT,
	REF_TRANSACTN,
	REFERENCE,
	CMMT_ITEM_CAT,
	DISTRIBUTION_KEY,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID] ,
	[SOURCERECORDSTATUS] 

	
)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
	SRC.[ENTRY_DOCUMENT_NO] ,
	SRC.[ENTRY_DOCUMENT_LINE],
	SRC.[DOCUMENT_YEAR],
	SRC.[FM_AREA] ,
	SRC.[FUND],
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA] ,
	SRC.[GRANT] ,
	SRC.[FUNDED_PROGRAM] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[BCS_VALUE_TYPE] ,
	SRC.[BUDGET_CATEGORY] ,
	SRC.[FM_VALTYPE] ,
	SRC.[BUDG_PROCESS] ,
	SRC.[BUDGET_TYPE] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YEC] ,
	SRC.[TEXT] ,
	SRC.[DOCUMENT_FAMILY] ,
	SRC.[BUDGETING_PROCESS] ,
	SRC.[VERSION] ,
	SRC.[CREATED_BY] ,
	SRC.[CREATED_ON] ,
	SRC.[DOCUMENT_DATE],
	SRC.[POSTING_DATE] ,
	SRC.[PERSON_RESP] ,
	SRC.[HEADER_TEXT] ,
	SRC.[LONG_TXT_EXISTS] ,
	SRC.[DOCUMENT_STATUS] ,
	SRC.[REVERSAL_STATUS] ,
	SRC.[REVERSAL_NUMBER] ,
	SRC.[DOCUMENT_TYPE] ,
	SRC.[REPORTING_YEAR_FOR_COHORT] ,
	SRC.[PUBLIC_LAW] ,
	SRC.[LEGISLATION] ,
	SRC.[FM_CURRENCY] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[TRANSFER_AGENCY] ,
	SRC.[TRANSFER_ACCOUNT] ,
	SRC.[TRADING_PARTNER] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.FISCAL_YEAR,
	SRC.ORIGINAL_APPLICATION,
	SRC.TEXT_NAME,
	SRC.REF_DOCUMENT,
	SRC.REF_TRANSACTN,
	SRC.REFERENCE,
	SRC.CMMT_ITEM_CAT,
	SRC.DISTRIBUTION_KEY,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L' 

);

UPDATE [STG_TD_SYN].[FM_BDGT_ENTR] SET [DW_STATUS_IND]='L' 
WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE ;

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_BDGT_ENTR] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA-----------------------------------------------------------------------------------------------------------------------------------------
SET @Error_Message = ERROR_MESSAGE() 
EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH



GO
/****** Object:  StoredProcedure [TD].[uspFM_BDGT_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TD].[uspFM_BDGT_LNITMS]
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)
DECLARE @File_Name varchar(150)
DECLARE @Source_Type varchar(15)
DECLARE @Error_Message varchar(1500)
DECLARE @rows_loaded int

SET @Proc_Name = 'MD.uspFM_BDGT_LNITMS'
SET @Source_Type='Table Load'
SET @File_Name='None'
SET @Error_Message=''
SET @rows_loaded=0


--Log Start
 EXEC ETL.uspLOG_LOAD 'START',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded


MERGE INTO [TD].[FM_BDGT_LNITMS] TGT
	 USING  
	 (SELECT 
       [DOC_CAT]
      ,[DOCUMENT_NUMBER]
      ,[DOC_ITEM]
      ,[REFERENC_DOC_CAT]
      ,[REF_DOCUMENT]
      ,[REFERENCE_ITEM]
      ,[REF_TRANSACTN]
      ,[REFERENCE_YEAR]
      ,CONVERT(VARCHAR(8), ENTERED_ON, 112) AS ENTERED_ON
      ,[USER_NAME]
      ,[FM_AREA]
      ,[FUND]
      ,[FUNDS_CENTER]
  --- ,ISNULL((SELECT TOP (1) FUNDS_CENTER FROM  [STG_TD].[FM_BDGT_LNITMS] AS B1 WHERE (FUNDS_CENTER IN (SELECT COST_CENTER FROM [MD].[COST_CENTER] AS CS)) AND (FUNDS_CENTER = B.FUNDS_CENTER)),'-1') AS FUNDS_CENTER
      ,[COMMITMENT_ITEM]
      ,[FUNCTIONAL_AREA]
      ,[GRANT]
      ,[FUNDED_PROGRAM]
      ,[CUSTOMER_FIELD]
      ,[VERSION]
      ,[BUDGET_CATEGORY]
      ,[BCS_VALUE_TYPE]
      ,[WORKFLOW_STATUS]
      ,[FM_VALTYPE]
      ,[BUDG_PROCESS]
      ,[BUDGET_TYPE]
      ,[TEXT]
      ,CONVERT(VARCHAR(8), POSTING_DATE, 112) AS POSTING_DATE
      ,[FY_VARIANT]
      ,[FY_PERIOD]
      ,[YCE]
      ,[FM_CURRENCY]
      ,[FMAC_AMOUNT]
      ,[ARCHIVE]
      ,[OBJECT_NUMBER]
      ,[BUDGET_PERIOD]
	  ,[BUSINESS_AREA]
  FROM [STG_TD_SYN].[FM_BDGT_LNITMS] AS B) SRC

	 ON

	TGT.[FUND]=SRC.[FUND] AND
	TGT.[FM_AREA]=SRC.[FM_AREA] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[FUNDS_CENTER]=SRC.[FUNDS_CENTER] AND
	TGT.[COMMITMENT_ITEM] =SRC.[COMMITMENT_ITEM] AND
	TGT.[FUNCTIONAL_AREA]=SRC.[FUNCTIONAL_AREA] AND
	TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM]

WHEN MATCHED THEN 
UPDATE SET 

    TGT.[DOC_CAT]=SRC.[DOC_CAT],
	TGT.[DOCUMENT_NUMBER]=SRC.[DOCUMENT_NUMBER],
	TGT.[DOC_ITEM] =SRC.[DOC_ITEM],
	TGT.[REFERENC_DOC_CAT]=SRC.[REFERENC_DOC_CAT],
	TGT.[REF_DOCUMENT] =SRC.[REF_DOCUMENT],
	TGT.[REFERENCE_ITEM]=SRC.[REFERENCE_ITEM],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REFERENCE_YEAR]=SRC.[REFERENCE_YEAR],
	TGT.[ENTERED_ON]=SRC.[ENTERED_ON],
	TGT.[USER_NAME]=SRC.[USER_NAME],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[VERSION]=SRC.[VERSION],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[BCS_VALUE_TYPE] =SRC.[BCS_VALUE_TYPE],
	TGT.[WORKFLOW_STATUS]=SRC.[WORKFLOW_STATUS],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[BUDG_PROCESS] =SRC.[BUDG_PROCESS],
	TGT.[BUDGET_TYPE] =SRC.[BUDGET_TYPE],
	TGT.[TEXT] =SRC.[TEXT],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[FY_VARIANT] =SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[FM_CURRENCY]=SRC.[FM_CURRENCY],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[ARCHIVE] =SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[BUDGET_PERIOD] =SRC.[BUDGET_PERIOD],
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'
	
	
WHEN NOT MATCHED THEN
INSERT 
(
 
       [DOC_CAT]
      ,[DOCUMENT_NUMBER]
      ,[DOC_ITEM]
      ,[REFERENC_DOC_CAT]
      ,[REF_DOCUMENT]
      ,[REFERENCE_ITEM]
      ,[REF_TRANSACTN]
      ,[REFERENCE_YEAR]
      ,[ENTERED_ON]
      ,[USER_NAME]
      ,[FM_AREA]
      ,[FUND]
      ,[FUNDS_CENTER]
      ,[COMMITMENT_ITEM]
      ,[FUNCTIONAL_AREA]
      ,[GRANT]
      ,[FUNDED_PROGRAM]
      ,[CUSTOMER_FIELD]
      ,[VERSION]
      ,[BUDGET_CATEGORY]
      ,[BCS_VALUE_TYPE]
      ,[WORKFLOW_STATUS]
      ,[FM_VALTYPE]
      ,[BUDG_PROCESS]
      ,[BUDGET_TYPE]
      ,[TEXT]
      ,[POSTING_DATE]
      ,[FY_VARIANT]
      ,[FY_PERIOD]
      ,[YCE]
      ,[FM_CURRENCY]
      ,[FMAC_AMOUNT]
      ,[ARCHIVE]
      ,[OBJECT_NUMBER]
      ,[BUDGET_PERIOD]
      ,[BUSINESS_AREA] 
	  ,[SOURCEEFFTIMESTAMP]
	  ,[SOURCEBATCHPROCESSID]
	  ,[SOURCERECORDSTATUS]

	
)

VALUES( 

       SRC.[DOC_CAT]
      ,SRC.[DOCUMENT_NUMBER]
      ,SRC.[DOC_ITEM]
      ,SRC.[REFERENC_DOC_CAT]
      ,SRC.[REF_DOCUMENT]
      ,SRC.[REFERENCE_ITEM]
      ,SRC.[REF_TRANSACTN]
      ,SRC.[REFERENCE_YEAR]
      ,SRC.[ENTERED_ON]
      ,SRC.[USER_NAME]
      ,SRC.[FM_AREA]
      ,SRC.[FUND]
      ,SRC.[FUNDS_CENTER]
      ,SRC.[COMMITMENT_ITEM]
      ,SRC.[FUNCTIONAL_AREA]
      ,SRC.[GRANT]
      ,SRC.[FUNDED_PROGRAM]
      ,SRC.[CUSTOMER_FIELD]
      ,SRC.[VERSION]
      ,SRC.[BUDGET_CATEGORY]
      ,SRC.[BCS_VALUE_TYPE]
      ,SRC.[WORKFLOW_STATUS]
      ,SRC.[FM_VALTYPE]
      ,SRC.[BUDG_PROCESS]
      ,SRC.[BUDGET_TYPE]
      ,SRC.[TEXT]
      ,SRC.[POSTING_DATE]
      ,SRC.[FY_VARIANT]
      ,SRC.[FY_PERIOD]
      ,SRC.[YCE]
      ,SRC.[FM_CURRENCY]
      ,SRC.[FMAC_AMOUNT]
      ,SRC.[ARCHIVE]
      ,SRC.[OBJECT_NUMBER]
      ,SRC.[BUDGET_PERIOD]
      ,SRC.[BUSINESS_AREA]
	  ,GETDATE()
	  ,'1'
	  ,'I' 

);

--Log End
SELECT @rows_loaded=COUNT(*) FROM [TD].[FM_BDGT_LNITMS]
EXEC ETL.uspLOG_LOAD 'END',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Proc_Name,@file_name,@Source_Type,@Error_Message,-1
 ------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [TD].[uspFM_BDGT_TOT]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [TD].[uspFM_BDGT_TOT]
AS
BEGIN TRY 


DECLARE @Proc_Name varchar(150)
DECLARE @File_Name varchar(150)
DECLARE @Source_Type varchar(15)
DECLARE @Error_Message varchar(1500)
DECLARE @rows_loaded int

SET @Proc_Name = 'MD.uspFM_BDGT_TOT'
SET @Source_Type='Table Load'
SET @File_Name='None'
SET @Error_Message=''
SET @rows_loaded=0


--Log Start
 EXEC ETL.uspLOG_LOAD 'START',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded

MERGE INTO [TD].[FM_BDGT_TOT] TGT
	 USING  
	 (SELECT 
    [FM_AREA],
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA] ,
	[GRANT] ,
	[FUNDED_PROGRAM] ,
	[CUSTOMER_FIELD] ,
	[VERSION] ,
	[BUDGET_CATEGORY],
	[BCS_VALUE_TYPE] ,
	[WORKFLOW_STATUS],
	[FM_VALTYPE],
	[BUDG_PROCESS] ,
	[BUDGET_TYPE] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[FM_CURRENCY] ,
	[FMAC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[BUDGET_PD_9] ,
	[BUSINESS_AREA]
    FROM [STG_TD_SYN].[FM_BDGT_TOT]) SRC
	ON
	TGT.[FUND]=SRC.[FUND] AND
	TGT.[FM_AREA]=SRC.[FM_AREA] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[FUNDS_CENTER]=SRC.[FUNDS_CENTER] AND
	TGT.[COMMITMENT_ITEM] =SRC.[COMMITMENT_ITEM] AND
	TGT.[FUNCTIONAL_AREA]=SRC.[FUNCTIONAL_AREA] AND
	TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM]

WHEN MATCHED THEN 
UPDATE SET 
  
	TGT.[GRANT]=SRC.[GRANT] ,
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD] ,
	TGT.[VERSION]=SRC.[VERSION] ,
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[BCS_VALUE_TYPE]=SRC.[BCS_VALUE_TYPE] ,
	TGT.[WORKFLOW_STATUS]=SRC.[WORKFLOW_STATUS],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[BUDG_PROCESS]=SRC.[BUDG_PROCESS] ,
	TGT.[BUDGET_TYPE]=SRC.[BUDGET_TYPE] ,
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT] ,
	TGT.[YCE]=SRC.[YCE] ,
	TGT.[FM_CURRENCY]=SRC.[FM_CURRENCY],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT] ,
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER] ,
	TGT.[BUDGET_PD_9]=SRC.[BUDGET_PD_9] ,
	TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA],
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'
	
	
WHEN NOT MATCHED THEN
INSERT 
(
 
    [FM_AREA],
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA] ,
	[GRANT] ,
	[FUNDED_PROGRAM] ,
	[CUSTOMER_FIELD] ,
	[VERSION] ,
	[BUDGET_CATEGORY],
	[BCS_VALUE_TYPE] ,
	[WORKFLOW_STATUS],
	[FM_VALTYPE],
	[BUDG_PROCESS] ,
	[BUDGET_TYPE] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[FM_CURRENCY] ,
	[FMAC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[BUDGET_PD_9] ,
	[BUSINESS_AREA] ,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID] ,
	[SOURCERECORDSTATUS] 

	
)

VALUES( 

    SRC.[FM_AREA],
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA] ,
	SRC.[GRANT] ,
	SRC.[FUNDED_PROGRAM] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[VERSION] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[BCS_VALUE_TYPE] ,
	SRC.[WORKFLOW_STATUS],
	SRC.[FM_VALTYPE],
	SRC.[BUDG_PROCESS] ,
	SRC.[BUDGET_TYPE] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[FM_CURRENCY] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[BUDGET_PD_9] ,
	SRC.[BUSINESS_AREA] ,
	GETDATE(),
	'1',
	'I' 

);


--Log End
SELECT @rows_loaded=COUNT(*) FROM [TD].[FM_BDGT_TOT]
EXEC ETL.uspLOG_LOAD 'END',@Proc_Name,@file_name,@Source_Type,@Error_Message,@rows_loaded

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA----------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Proc_Name,@file_name,@Source_Type,@Error_Message,-1
 ------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [TD].[uspFM_CMMTS_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

TRUNCATE TABLE [TD].[FM_CMMT_LNITMS]
TRUNCATE TABLE ETL.LOGGING
SELECT TOP 1 * FROM [TD].[FM_CMMT_LNITMS]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [TD].[uspFM_CMMTS_LNITMS] 'S','2015-02-05'

EXEC [TD].[uspFM_CMMTS_LNITMS] 'F','1900-01-01'

EXEC [TD].[uspFM_CMMTS_LNITMS] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/


CREATE PROCEDURE [TD].[uspFM_CMMTS_LNITMS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS

BEGIN TRY 


DECLARE @Proc_Name varchar(150)='TD.uspFM_CMMTS_LNITMS'
DECLARE @dw_object_name varchar(150)='TD.FM_CMMT_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_CMMT_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

 --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [TD].[FM_CMMT_LNITMS] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [TD].[FM_CMMT_LNITMS] TGT
	 USING  
	(SELECT 
      CMMT.[DATA_AS_OF_DATE]
      ,CMMT.[DS_INSERT_DATE]
      ,CMMT.[DS_INSERT_TIME]
      ,CMMT.[DW_STATUS_IND]
	  ,CMMT.[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),CMMT.[REF_ITEM]) AS DOCUMENT_NUMBER
	  ,CMMT.[REF_DOCUMENT_NO]
      ,CMMT.[REFERENC_ORG_UN]
      ,CMMT.[REF_ITEM]
      ,CMMT.[ACCT_ASSNMT_NO]
      ,CMMT.[SCHEDULE_LINE]
      ,CMMT.[COUNTER]
      ,CMMT.[LOGICAL_SYSTEM]
      ,CMMT.[AMOUNT_TYPE]
      ,CMMT.[BUDGET_CATEGORY]
      ,CMMT.[FISCAL_YEAR]
      ,CMMT.[LEVEL_NUMBER]
      ,CMMT.[FY_VARIANT]
      ,CMMT.[FY_PERIOD]
      ,CMMT.[YCE]
      ,CMMT.[YEAR_OF_CASH_EFF]
      ,CONVERT(VARCHAR(8), CMMT.FM_POSTING_DATE, 112) AS CMMT_POSTING_DATE
      ,CMMT.[FM_AREA]
      ,CMMT.[FUND]
      ,CMMT.[FUNDS_CENTER]
      ,CMMT.[COMMITMENT_ITEM]
      ,CMMT.[FUNCTIONAL_AREA]
      ,CMMT.[FUNDED_PROGRAM]
      ,CMMT.[GRANT]
      ,CMMT.[CUSTOMER_FIELD]
      ,CMMT.[COMPANY_CODE]
      ,CMMT.[CHART_OF_ACCTS]
      ,CMMT.[GL_ACCOUNT]
      ,CMMT.[CO_AREA]
      ,CMMT.[COST_CENTER]
	  ,ISNULL(ORD.[ORDER],'--') AS [ORDER]
      ,ISNULL(LEFT(RTRIM(LTRIM(WBS.WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS.WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS.WBS_ELEMENT)),9,3),'--') AS WBS_ELEMENT
      ,CMMT.[PROFIT_CENTER]
      ,CMMT.[FM_VALTYPE]
      ,CMMT.[VALUE_TYPE]
      ,CMMT.[BUS_TRANSACTION]
      ,CASE WHEN CMMT.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID]
      ,CMMT.[COMPLETION_IND]
      ,CMMT.[CF_LEVEL]
      ,CMMT.[CARRYFWDPREVYR]
      ,CMMT.[VENDOR]
      ,CMMT.[ITEM_TEXT] 
      ,CONVERT(VARCHAR(8), CMMT.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,CMMT.[PRED_DOC_NO]
      ,CMMT.[PRED_DOC_ITEM]
      ,CMMT.[PREDECESSOR_AA]
      ,CMMT.[USER_NAME]
      ,CONVERT(VARCHAR(8), CMMT.[BL_DOC_DATE], 112) AS [BL_DOC_DATE]
	  ,CMMT.TRANSACTION_CURRENCY
	  ,CMMT.TC_AMOUNT
	  ,CMMT.ARCHIVE
	  ,CMMT.OBJECT_NUMBER
	  ,CMMT.BUDGET_PERIOD
	  ,CMMT.BUSINESS_AREA
	  ,CMMT.REF_DOCUMENT_CATG
	  ,CMMT.REF_TRANSACTN
	  ,CMMT.LEDGER
	  ,CMMT.FYC_STATUS
	  ,CMMT.TRANSACTION_NO
	  ,CMMT.BL_DOCUMENT_TYPE
	  ,CMMT.ENTERED_ON
      ,CMMT.ENTERED_AT
	  ,CMMT.TRANSACTION_CODE
	  ,CMMT.QUANT_OPEN
	  ,CMMT.QUANT_INV
	  ,CMMT.BASE_UNIT
	  ,CMMT.OBJECT_NUMBER_1
	  ,CMMT.PREDECESSOR_DT
	  ,CMMT.PRED_ORG
	  ,CMMT.REF_TRANSACTN_1
	  ,CMMT.FMAC_AMOUNT
	  ,CMMT.FM_AREA_CURR
	  ,CMMT.ODQ_CHANGEMODE
	  ,CMMT.ODQ_ENTITYCNTR

  FROM [STG_TD_SYN].[FM_CMMT_LNITMS] CMMT
  LEFT JOIN   [STG_TD_SYN].[CO_CMMT_LNITMS_ORDER] ORD ON 
     CMMT.REF_DOCUMENT_NO=ORD.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=ORD.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=ORD.ACCT_ASSNMT_NO
  LEFT JOIN [STG_TD_SYN].[CO_CMMT_LNITMS_WBS] WBS ON 
     CMMT.REF_DOCUMENT_NO=WBS.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=WBS.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=WBS.ACCT_ASSNMT_NO
   
   ) SRC
	 ON
    TGT.[REF_DOCUMENT_NO]=SRC.[REF_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET 
    TGT.[REF_DOCUMENT_NO]=SRC.[REF_DOCUMENT_NO],
	TGT.[REFERENC_ORG_UN]=SRC.[REFERENC_ORG_UN],
	TGT.[REF_ITEM] =SRC.[REF_ITEM],
	TGT.[ACCT_ASSNMT_NO]=SRC.[ACCT_ASSNMT_NO],
	TGT.[SCHEDULE_LINE]=SRC.[SCHEDULE_LINE],
	TGT.[COUNTER]=SRC.[COUNTER],
	TGT.[LOGICAL_SYSTEM]=SRC.[LOGICAL_SYSTEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.CMMT_POSTING_DATE,
	TGT.[GRANT] =SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCTS]=SRC.[CHART_OF_ACCTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER] =SRC.[COST_CENTER],
	TGT.[ORDER] =SRC.[ORDER],
	TGT.[WBS_ELEMENT] =SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE] =SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE] =SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION] =SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID] =SRC.[STATISTICAL_ID],
	TGT.[COMPLETION_IND] =SRC.[COMPLETION_IND],
	TGT.[CF_LEVEL] =SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR] =SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR] =SRC.[VENDOR],
	TGT.[ITEM_TEXT]=SRC.[ITEM_TEXT],
	TGT.[POSTING_DATE] =SRC.[POSTING_DATE],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM] =SRC.[PRED_DOC_ITEM],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[USER_NAME]=SRC.[USER_NAME],
	TGT.[BL_DOC_DATE] =SRC.[BL_DOC_DATE],
	TGT.TRANSACTION_CURRENCY=SRC.TRANSACTION_CURRENCY,
	TGT.TC_AMOUNT=SRC.TC_AMOUNT,
	TGT.ARCHIVE= SRC.ARCHIVE,
	TGT.OBJECT_NUMBER= SRC.OBJECT_NUMBER,
	TGT.BUDGET_PERIOD=SRC.BUDGET_PERIOD,
	TGT.BUSINESS_AREA=SRC.BUSINESS_AREA,
	TGT.REF_DOCUMENT_CATG=SRC.REF_DOCUMENT_CATG,
	TGT.REF_TRANSACTN=SRC.REF_TRANSACTN,
	TGT.LEDGER=SRC.LEDGER,
	TGT.FYC_STATUS=SRC.FYC_STATUS,
	TGT.TRANSACTION_NO=SRC.TRANSACTION_NO,
	TGT.BL_DOCUMENT_TYPE=SRC.BL_DOCUMENT_TYPE,
	TGT.ENTERED_ON=SRC.ENTERED_ON,
    TGT.ENTERED_AT=SRC.ENTERED_AT,
	TGT.TRANSACTION_CODE=SRC.TRANSACTION_CODE,
	TGT.QUANT_OPEN=SRC.QUANT_OPEN,
	TGT.QUANT_INV=SRC.QUANT_INV,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.PRED_ORG=SRC.PRED_ORG,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.FMAC_AMOUNT=SRC.FMAC_AMOUNT,
	TGT.FM_AREA_CURR=SRC.FM_AREA_CURR,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'

	
WHEN NOT MATCHED THEN
INSERT 
(

            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[REF_DOCUMENT_NO]
           ,[REFERENC_ORG_UN]
           ,[REF_ITEM]
           ,[ACCT_ASSNMT_NO]
           ,[SCHEDULE_LINE]
           ,[COUNTER]
           ,[LOGICAL_SYSTEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[COMPLETION_IND]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[ITEM_TEXT]
           ,[POSTING_DATE]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PREDECESSOR_AA]
           ,[USER_NAME]
           ,[BL_DOC_DATE]          
		   ,TRANSACTION_CURRENCY
		   ,TC_AMOUNT
		   ,ARCHIVE
		   ,OBJECT_NUMBER
		   ,BUDGET_PERIOD
		   ,BUSINESS_AREA
		   ,REF_DOCUMENT_CATG
		   ,REF_TRANSACTN
		   ,LEDGER
		   ,FYC_STATUS
		   ,TRANSACTION_NO
		   ,BL_DOCUMENT_TYPE
		   ,ENTERED_ON
		   ,ENTERED_AT
		   ,TRANSACTION_CODE
		   ,QUANT_OPEN
		   ,QUANT_INV
		   ,BASE_UNIT
		   ,OBJECT_NUMBER_1
		   ,PREDECESSOR_DT
		   ,PRED_ORG
		   ,REF_TRANSACTN_1
		   ,FMAC_AMOUNT
		   ,FM_AREA_CURR
		   ,ODQ_CHANGEMODE
	       ,ODQ_ENTITYCNTR     
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]
)

VALUES( 
            SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[REF_DOCUMENT_NO]
           ,SRC.[REFERENC_ORG_UN]
           ,SRC.[REF_ITEM]
           ,SRC.[ACCT_ASSNMT_NO]
           ,SRC.[SCHEDULE_LINE]
           ,SRC.[COUNTER]
           ,SRC.[LOGICAL_SYSTEM]
           ,SRC.[AMOUNT_TYPE]
           ,SRC.[BUDGET_CATEGORY]
           ,SRC.[FISCAL_YEAR]
           ,SRC.[LEVEL_NUMBER]
           ,SRC.[FY_VARIANT]
           ,SRC.[FY_PERIOD]
           ,SRC.[YCE]
           ,SRC.[YEAR_OF_CASH_EFF]
           ,SRC.[CMMT_POSTING_DATE]
           ,SRC.[FM_AREA]
           ,SRC.[FUND]
           ,SRC.[FUNDS_CENTER]
           ,SRC.[COMMITMENT_ITEM]
           ,SRC.[FUNCTIONAL_AREA]
           ,SRC.[FUNDED_PROGRAM]
           ,SRC.[GRANT]
           ,SRC.[CUSTOMER_FIELD]
           ,SRC.[COMPANY_CODE]
           ,SRC.[CHART_OF_ACCTS]
           ,SRC.[GL_ACCOUNT]
           ,SRC.[CO_AREA]
           ,SRC.[COST_CENTER]
           ,SRC.[ORDER]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[PROFIT_CENTER]
           ,SRC.[FM_VALTYPE]
           ,SRC.[VALUE_TYPE]
           ,SRC.[BUS_TRANSACTION]
           ,SRC.[STATISTICAL_ID]
           ,SRC.[COMPLETION_IND]
           ,SRC.[CF_LEVEL]
           ,SRC.[CARRYFWDPREVYR]
           ,SRC.[VENDOR]
           ,SRC.[ITEM_TEXT]
           ,SRC.[POSTING_DATE]
           ,SRC.[PRED_DOC_NO]
           ,SRC.[PRED_DOC_ITEM]
           ,SRC.[PREDECESSOR_AA]
           ,SRC.[USER_NAME]
           ,SRC.[BL_DOC_DATE]
		   ,SRC.TRANSACTION_CURRENCY
		   ,SRC.TC_AMOUNT
		   ,SRC.ARCHIVE
		   ,SRC.OBJECT_NUMBER
		   ,SRC.BUDGET_PERIOD
		   ,SRC.BUSINESS_AREA
		   ,SRC.REF_DOCUMENT_CATG
		   ,SRC.REF_TRANSACTN
		   ,SRC.LEDGER
		   ,SRC.FYC_STATUS
		   ,SRC.TRANSACTION_NO
		   ,SRC.BL_DOCUMENT_TYPE
		   ,SRC.ENTERED_ON
		   ,SRC.ENTERED_AT
		   ,SRC.TRANSACTION_CODE
		   ,SRC.QUANT_OPEN
		   ,SRC.QUANT_INV
		   ,SRC.BASE_UNIT
		   ,SRC.OBJECT_NUMBER_1
		   ,SRC.PREDECESSOR_DT
		   ,SRC.PRED_ORG
		   ,SRC.REF_TRANSACTN_1
		   ,SRC.FMAC_AMOUNT
		   ,SRC.FM_AREA_CURR
		   ,SRC.ODQ_CHANGEMODE
	       ,SRC.ODQ_ENTITYCNTR     
		   ,GETDATE()
           ,'1'
		   ,'L'

);

UPDATE  [STG_TD_SYN].[FM_CMMT_LNITMS] SET [DW_STATUS_IND]='L';

UPDATE [TD].[FM_CMMT_LNITMS] SET WBS_ELEMENT='--' WHERE WBS_ELEMENT IS NULL OR WBS_ELEMENT=' '; 
UPDATE [TD].[FM_CMMT_LNITMS] SET [ORDER]='--' WHERE [ORDER] IS NULL OR [ORDER]=' ';

-------------------- EXECUTE THE DUP-REMOVAL ROUTINE ON CMMT_FI_LNITMS -------------------------------------------------------------------------------------------------
EXEC [TD].[uspFOCUS_FM_DUP] 'C','1900-01-01';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_CMMT_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE [SOURCERECORDSTATUS]='U';

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END 

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

MERGE INTO [TD].[FM_CMMT_LNITMS] TGT
	 USING  
	( SELECT 
      CMMT.[DATA_AS_OF_DATE]
      ,CMMT.[DS_INSERT_DATE]
      ,CMMT.[DS_INSERT_TIME]
      ,CMMT.[DW_STATUS_IND]
	  ,CMMT.[REF_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),CMMT.[REF_ITEM]) AS DOCUMENT_NUMBER
	  ,CMMT.[REF_DOCUMENT_NO]
      ,CMMT.[REFERENC_ORG_UN]
      ,CMMT.[REF_ITEM]
      ,CMMT.[ACCT_ASSNMT_NO]
      ,CMMT.[SCHEDULE_LINE]
      ,CMMT.[COUNTER]
      ,CMMT.[LOGICAL_SYSTEM]
      ,CMMT.[AMOUNT_TYPE]
      ,CMMT.[BUDGET_CATEGORY]
      ,CMMT.[FISCAL_YEAR]
      ,CMMT.[LEVEL_NUMBER]
      ,CMMT.[FY_VARIANT]
      ,CMMT.[FY_PERIOD]
      ,CMMT.[YCE]
      ,CMMT.[YEAR_OF_CASH_EFF]
      ,CONVERT(VARCHAR(8), CMMT.FM_POSTING_DATE, 112) AS CMMT_POSTING_DATE
      ,CMMT.[FM_AREA]
      ,CMMT.[FUND]
      ,CMMT.[FUNDS_CENTER]
      ,CMMT.[COMMITMENT_ITEM]
      ,CMMT.[FUNCTIONAL_AREA]
      ,CMMT.[FUNDED_PROGRAM]
      ,CMMT.[GRANT]
      ,CMMT.[CUSTOMER_FIELD]
      ,CMMT.[COMPANY_CODE]
      ,CMMT.[CHART_OF_ACCTS]
      ,CMMT.[GL_ACCOUNT]
      ,CMMT.[CO_AREA]
      ,CMMT.[COST_CENTER]
	  ,ISNULL(ORD.[ORDER],'--') AS [ORDER]
      ,ISNULL(LEFT(RTRIM(LTRIM(WBS.WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(WBS.WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(WBS.WBS_ELEMENT)),9,3),'--') AS WBS_ELEMENT
      ,CMMT.[PROFIT_CENTER]
      ,CMMT.[FM_VALTYPE]
      ,CMMT.[VALUE_TYPE]
      ,CMMT.[BUS_TRANSACTION]
      ,CASE WHEN CMMT.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID]
      ,CMMT.[COMPLETION_IND]
      ,CMMT.[CF_LEVEL]
      ,CMMT.[CARRYFWDPREVYR]
      ,CMMT.[VENDOR]
      ,CMMT.[ITEM_TEXT] 
      ,CONVERT(VARCHAR(8), CMMT.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,CMMT.[PRED_DOC_NO]
      ,CMMT.[PRED_DOC_ITEM]
      ,CMMT.[PREDECESSOR_AA]
      ,CMMT.[USER_NAME]
      ,CONVERT(VARCHAR(8), CMMT.[BL_DOC_DATE], 112) AS [BL_DOC_DATE]
	  ,CMMT.TRANSACTION_CURRENCY
	  ,CMMT.TC_AMOUNT
	  ,CMMT.ARCHIVE
	  ,CMMT.OBJECT_NUMBER
	  ,CMMT.BUDGET_PERIOD
	  ,CMMT.BUSINESS_AREA
	  ,CMMT.REF_DOCUMENT_CATG
	  ,CMMT.REF_TRANSACTN
	  ,CMMT.LEDGER
	  ,CMMT.FYC_STATUS
	  ,CMMT.TRANSACTION_NO
	  ,CMMT.BL_DOCUMENT_TYPE
	  ,CMMT.ENTERED_ON
      ,CMMT.ENTERED_AT
	  ,CMMT.TRANSACTION_CODE
	  ,CMMT.QUANT_OPEN
	  ,CMMT.QUANT_INV
	  ,CMMT.BASE_UNIT
	  ,CMMT.OBJECT_NUMBER_1
	  ,CMMT.PREDECESSOR_DT
	  ,CMMT.PRED_ORG
	  ,CMMT.REF_TRANSACTN_1
	  ,CMMT.FMAC_AMOUNT
	  ,CMMT.FM_AREA_CURR
	  ,CMMT.ODQ_CHANGEMODE
	  ,CMMT.ODQ_ENTITYCNTR

  FROM [STG_TD_SYN].[FM_CMMT_LNITMS] CMMT
  LEFT JOIN   [STG_TD_SYN].[CO_CMMT_LNITMS_ORDER] ORD ON 
     CMMT.REF_DOCUMENT_NO=ORD.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=ORD.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=ORD.ACCT_ASSNMT_NO
  LEFT JOIN [STG_TD_SYN].[CO_CMMT_LNITMS_WBS] WBS ON 
     CMMT.REF_DOCUMENT_NO=WBS.REF_DOCUMENT_NO AND
     CMMT.REF_ITEM=WBS.REF_ITEM AND
	 CMMT.ACCT_ASSNMT_NO=WBS.ACCT_ASSNMT_NO

										WHERE CMMT.DW_STATUS_IND=@DW_STATUS_IND AND CMMT.[DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
   ) SRC
	 ON
    TGT.[REF_DOCUMENT_NO]=SRC.[REF_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET 
    TGT.[REF_DOCUMENT_NO]=SRC.[REF_DOCUMENT_NO],
	TGT.[REFERENC_ORG_UN]=SRC.[REFERENC_ORG_UN],
	TGT.[REF_ITEM] =SRC.[REF_ITEM],
	TGT.[ACCT_ASSNMT_NO]=SRC.[ACCT_ASSNMT_NO],
	TGT.[SCHEDULE_LINE]=SRC.[SCHEDULE_LINE],
	TGT.[COUNTER]=SRC.[COUNTER],
	TGT.[LOGICAL_SYSTEM]=SRC.[LOGICAL_SYSTEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[CMMT_POSTING_DATE],
	TGT.[GRANT] =SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCTS]=SRC.[CHART_OF_ACCTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER] =SRC.[COST_CENTER],
	TGT.[ORDER] =SRC.[ORDER],
	TGT.[WBS_ELEMENT] =SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE] =SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE] =SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION] =SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID] =SRC.[STATISTICAL_ID],
	TGT.[COMPLETION_IND] =SRC.[COMPLETION_IND],
	TGT.[CF_LEVEL] =SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR] =SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR] =SRC.[VENDOR],
	TGT.[ITEM_TEXT]=SRC.[ITEM_TEXT],
	TGT.[POSTING_DATE] =SRC.[POSTING_DATE],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM] =SRC.[PRED_DOC_ITEM],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[USER_NAME]=SRC.[USER_NAME],
	TGT.[BL_DOC_DATE] =SRC.[BL_DOC_DATE],
	TGT.TRANSACTION_CURRENCY=SRC.TRANSACTION_CURRENCY,
	TGT.TC_AMOUNT=SRC.TC_AMOUNT,
	TGT.ARCHIVE= SRC.ARCHIVE,
	TGT.OBJECT_NUMBER= SRC.OBJECT_NUMBER,
	TGT.BUDGET_PERIOD=SRC.BUDGET_PERIOD,
	TGT.BUSINESS_AREA=SRC.BUSINESS_AREA,
	TGT.REF_DOCUMENT_CATG=SRC.REF_DOCUMENT_CATG,
	TGT.REF_TRANSACTN=SRC.REF_TRANSACTN,
	TGT.LEDGER=SRC.LEDGER,
	TGT.FYC_STATUS=SRC.FYC_STATUS,
	TGT.TRANSACTION_NO=SRC.TRANSACTION_NO,
	TGT.BL_DOCUMENT_TYPE=SRC.BL_DOCUMENT_TYPE,
	TGT.ENTERED_ON=SRC.ENTERED_ON,
    TGT.ENTERED_AT=SRC.ENTERED_AT,
	TGT.TRANSACTION_CODE=SRC.TRANSACTION_CODE,
	TGT.QUANT_OPEN=SRC.QUANT_OPEN,
	TGT.QUANT_INV=SRC.QUANT_INV,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.PRED_ORG=SRC.PRED_ORG,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.FMAC_AMOUNT=SRC.FMAC_AMOUNT,
	TGT.FM_AREA_CURR=SRC.FM_AREA_CURR,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'

	
WHEN NOT MATCHED THEN
INSERT 
(

            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[REF_DOCUMENT_NO]
           ,[REFERENC_ORG_UN]
           ,[REF_ITEM]
           ,[ACCT_ASSNMT_NO]
           ,[SCHEDULE_LINE]
           ,[COUNTER]
           ,[LOGICAL_SYSTEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[COMPLETION_IND]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[ITEM_TEXT]
           ,[POSTING_DATE]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PREDECESSOR_AA]
           ,[USER_NAME]
           ,[BL_DOC_DATE]
           ,TRANSACTION_CURRENCY
		   ,TC_AMOUNT
		   ,ARCHIVE
		   ,OBJECT_NUMBER
		   ,BUDGET_PERIOD
		   ,BUSINESS_AREA
		   ,REF_DOCUMENT_CATG
		   ,REF_TRANSACTN
		   ,LEDGER
		   ,FYC_STATUS
		   ,TRANSACTION_NO
		   ,BL_DOCUMENT_TYPE
		   ,ENTERED_ON
		   ,ENTERED_AT
		   ,TRANSACTION_CODE
		   ,QUANT_OPEN
		   ,QUANT_INV
		   ,BASE_UNIT
		   ,OBJECT_NUMBER_1
		   ,PREDECESSOR_DT
		   ,PRED_ORG
		   ,REF_TRANSACTN_1
		   ,FMAC_AMOUNT
		   ,FM_AREA_CURR
		   ,ODQ_CHANGEMODE
	       ,ODQ_ENTITYCNTR     
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]
)

VALUES( 
            SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[REF_DOCUMENT_NO]
           ,SRC.[REFERENC_ORG_UN]
           ,SRC.[REF_ITEM]
           ,SRC.[ACCT_ASSNMT_NO]
           ,SRC.[SCHEDULE_LINE]
           ,SRC.[COUNTER]
           ,SRC.[LOGICAL_SYSTEM]
           ,SRC.[AMOUNT_TYPE]
           ,SRC.[BUDGET_CATEGORY]
           ,SRC.[FISCAL_YEAR]
           ,SRC.[LEVEL_NUMBER]
           ,SRC.[FY_VARIANT]
           ,SRC.[FY_PERIOD]
           ,SRC.[YCE]
           ,SRC.[YEAR_OF_CASH_EFF]
           ,SRC.[CMMT_POSTING_DATE]
           ,SRC.[FM_AREA]
           ,SRC.[FUND]
           ,SRC.[FUNDS_CENTER]
           ,SRC.[COMMITMENT_ITEM]
           ,SRC.[FUNCTIONAL_AREA]
           ,SRC.[FUNDED_PROGRAM]
           ,SRC.[GRANT]
           ,SRC.[CUSTOMER_FIELD]
           ,SRC.[COMPANY_CODE]
           ,SRC.[CHART_OF_ACCTS]
           ,SRC.[GL_ACCOUNT]
           ,SRC.[CO_AREA]
           ,SRC.[COST_CENTER]
           ,SRC.[ORDER]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[PROFIT_CENTER]
           ,SRC.[FM_VALTYPE]
           ,SRC.[VALUE_TYPE]
           ,SRC.[BUS_TRANSACTION]
           ,SRC.[STATISTICAL_ID]
           ,SRC.[COMPLETION_IND]
           ,SRC.[CF_LEVEL]
           ,SRC.[CARRYFWDPREVYR]
           ,SRC.[VENDOR]
           ,SRC.[ITEM_TEXT]
           ,SRC.[POSTING_DATE]
           ,SRC.[PRED_DOC_NO]
           ,SRC.[PRED_DOC_ITEM]
           ,SRC.[PREDECESSOR_AA]
           ,SRC.[USER_NAME]
           ,SRC.[BL_DOC_DATE]
           ,SRC.TRANSACTION_CURRENCY
		   ,SRC.TC_AMOUNT
		   ,SRC.ARCHIVE
		   ,SRC.OBJECT_NUMBER
		   ,SRC.BUDGET_PERIOD
		   ,SRC.BUSINESS_AREA
		   ,SRC.REF_DOCUMENT_CATG
		   ,SRC.REF_TRANSACTN
		   ,SRC.LEDGER
		   ,SRC.FYC_STATUS
		   ,SRC.TRANSACTION_NO
		   ,SRC.BL_DOCUMENT_TYPE
		   ,SRC.ENTERED_ON
		   ,SRC.ENTERED_AT
		   ,SRC.TRANSACTION_CODE
		   ,SRC.QUANT_OPEN
		   ,SRC.QUANT_INV
		   ,SRC.BASE_UNIT
		   ,SRC.OBJECT_NUMBER_1
		   ,SRC.PREDECESSOR_DT
		   ,SRC.PRED_ORG
		   ,SRC.REF_TRANSACTN_1
		   ,SRC.FMAC_AMOUNT
		   ,SRC.FM_AREA_CURR
		   ,SRC.ODQ_CHANGEMODE
	       ,SRC.ODQ_ENTITYCNTR     
		   ,GETDATE()
           ,'1'
		   ,'L'

);

 
 UPDATE  [STG_TD_SYN].[FM_CMMT_LNITMS] SET [DW_STATUS_IND]='L' WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

 UPDATE [TD].[FM_CMMT_LNITMS] SET WBS_ELEMENT='--' WHERE WBS_ELEMENT IS NULL OR WBS_ELEMENT=' ' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
 UPDATE [TD].[FM_CMMT_LNITMS] SET [ORDER]='--' WHERE [ORDER] IS NULL OR [ORDER]=' ' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
 
-------------------- EXECUTE THE DUP-REMOVAL ROUTINE ON CMMT_FI_LNITMS -------------------------------------------------------------------------------------------------
EXEC [TD].[uspFOCUS_FM_DUP] 'C','1900-01-01';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_CMMT_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA--------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
  EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [TD].[uspFM_FI_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

SELECT * FROM ETL.LOGGING
ORDER BY PROCEDURE_NAME

SELECT * FROM [TD].[FM_FI_LNITMS_DUPS]

DELETE FROM ETL.LOGGING WHERE RUN_STATUS='IN-PROCESS'

UPDATE ETL.LOGGING SET PROCEDURE_NAME='TD.uspFM_FI_LNITMS5' WHERE PROCEDURE_NAME='TD.uspFM_FI_LNITMS'

TRUNCATE TABLE [TD].[FM_FI_LNITMS]
TRUNCATE TABLE [TD].[FM_FI_LNITMS_DUPS]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [TD].[FM_FI_LNITMS]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [TD].[uspFM_FI_LNITMS] 'S','2015-02-08'

EXEC [TD].[uspFM_FI_LNITMS] 'F','1900-01-01'

EXEC [TD].[uspFM_FI_LNITMS] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/



CREATE PROCEDURE [TD].[uspFM_FI_LNITMS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='TD.uspFM_FI_LNITMS'
DECLARE @dw_object_name varchar(150)='TD.FM_FI_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_FI_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM  [TD].[FM_FI_LNITMS] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [TD].[FM_FI_LNITMS] TGT
	 USING  
	 (SELECT 
--TOP 5
       FM.[DATA_AS_OF_DATE]
      ,FM.[DS_INSERT_DATE]
      ,FM.[DS_INSERT_TIME]
      ,FM.[DW_STATUS_IND]
      ,FM.[FI_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),FM.[FI_DOCUMENT_ITEM]) AS DOCUMENT_NUMBER
      ,FM.[FM_DOC_NO]
      ,FM.[FM_ITEM]
      ,FM.[AMOUNT_TYPE]
      ,FM.[BUDGET_CATEGORY]
      ,FM.[FISCAL_YEAR]
      ,FM.[LEVEL_NUMBER]
      ,FM.[FY_VARIANT]
      ,FM.[FY_PERIOD]
      ,FM.[YCE]
      ,FM.[YEAR_OF_CASH_EFF]
      ,CONVERT(VARCHAR(8),FM.[FM_POSTING_DATE], 112) AS [FM_POSTING_DATE]
      ,FM.[FM_AREA]
      ,FM.[FUND]
      ,FM.[FUNDS_CENTER]
      ,FM.[COMMITMENT_ITEM]
      ,FM.[FUNCTIONAL_AREA]
      ,FM.[FUNDED_PROGRAM]
      ,FM.[GRANT]
      ,FM.[CUSTOMER_FIELD]
      ,FM.[COMPANY_CODE]
      ,FM.[CHART_OF_ACCOUNTS]
      ,FM.[GL_ACCOUNT]
      ,FM.[CO_AREA]
      ,FM.[COST_CENTER]
      ,GM.[ORDER]
      ,ISNULL(LEFT(RTRIM(LTRIM(GM.WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(GM.WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(GM.WBS_ELEMENT)),9,3),'--') AS WBS_ELEMENT
      ,FM.[PROFIT_CENTER]
      ,FM.[FM_VALTYPE]
      ,FM.[VALUE_TYPE]
      ,FM.[BUS_TRANSACTION]
      ,CASE WHEN FM.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID] 
      ,FM.[CF_LEVEL]
      ,FM.[CARRYFWDPREVYR]
      ,FM.[VENDOR]
      ,FM.[CUSTOMER]
      ,FM.[TEXT] 
      ,FM.[CANCEL_ID]
      ,FM.[DOCUMENT_TYPE]
       ,CONVERT(VARCHAR(8), FM.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,FM.[PMNT_DOC_COMP_CODE]
      ,FM.[FY_PMNT_DOC]
      ,FM.[PAYMENT_DOC_NO]
      ,FM.[PMNT_DOC_NO_ITEM]
      ,FM.[FI_DOC_NO_FY]
      ,FM.[FI_DOCUMENT_NO]
      ,FM.[FI_DOCUMENT_ITEM]
      ,FM.[PRED_DOC_NO]
      ,FM.[PRED_DOC_ITEM]
      ,FM.[PRED_ORG]
      ,FM.[PREDECESSOR_AA]
      ,FM.[FM_AREA_CURR]
      ,FM.[FMAC_AMOUNT]
      ,FM.[TRANS_CURRENCY]
      ,FM.[TC_AMOUNT]
      ,FM.[ARCHIVE]
      ,FM.[OBJECT_NUMBER]
      ,FM.[REF_TRANSACTN]
      ,FM.[REF_DOCUMENT]
      ,FM.[BUDGET_PERIOD]
      ,FM.[BUSINESS_AREA]
      ,FM.[PAYMENT_STATUS] 
      ,FM.LEDGER
      ,FM.TRANACTION_NO
      ,FM.POSTING_DAY
      ,FM.OBJECT_NUMBER_1
      ,FM.BASE_UNIT
      ,FM.REFERENCE_KEY_3
      ,FM.PREDECESSOR_DT
      ,FM.REF_TRANSACTN_1
      ,FM.REF_DOCUMENT_NO
      ,FM.DOCUMENT_DATE
      ,FM.DOC_HEADER_TEXT
      ,FM.REFFISCALYEAR
      ,FM.DELINDICTR
      ,FM.REFERENC_ORG_UN
      ,FM.REFCOMPANYCODE
      ,FM.ODQ_CHANGEMODE
      ,FM.ODQ_ENTITYCNTR
  FROM 
  [STG_TD_SYN].[FM_FI_LNITMS] FM LEFT JOIN 
  
  (
  SELECT [ORDER], WBS_ELEMENT,FY_PERIOD,DOCUMENT_NUMBER,LINE_ITEM
  FROM [STG_TD_SYN].[GM_LNITMS] 
  WHERE (([ORDER] IS NOT NULL) OR (WBS_ELEMENT IS NOT NULL) ) AND  (([ORDER]<>' ') OR (WBS_ELEMENT<>' ') )
  ) GM
  
  ON 
  
    -- FM.[FY_PERIOD]=GM.[FY_PERIOD] AND
     FM.[FI_DOCUMENT_NO]=GM.DOCUMENT_NUMBER AND
     FM.[FI_DOCUMENT_ITEM]=GM.LINE_ITEM 

  --WHERE GM.[WBS_ELEMENT] IS NULL OR GM.[ORDER] IS NULL



	   ) SRC

	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);
  
UPDATE [TD].[FM_FI_LNITMS] SET WBS_ELEMENT='--' WHERE WBS_ELEMENT IS NULL OR WBS_ELEMENT=' ';
UPDATE [TD].[FM_FI_LNITMS] SET [ORDER]='--' WHERE [ORDER] IS NULL OR [ORDER]=' ';

UPDATE [STG_TD_SYN].[FM_FI_LNITMS] SET [DW_STATUS_IND]='L';

-------------------- EXECUTE THE DUP-REMOVAL ROUTINE ON FM_FI_LNITMS ------------------------------
EXEC [TD].[uspFOCUS_FM_DUP] 'F','1900-01-01';
---------------------------------------------------------------------------------------------------

SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_FI_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [TD].[FM_FI_LNITMS] TGT
	 USING  
	 (SELECT 
	   FM.[DATA_AS_OF_DATE]
      ,FM.[DS_INSERT_DATE]
      ,FM.[DS_INSERT_TIME]
      ,FM.[DW_STATUS_IND]
	  ,FM.[FI_DOCUMENT_NO] +'-'+ CONVERT(VARCHAR(3),FM.[FI_DOCUMENT_ITEM]) AS DOCUMENT_NUMBER
	  ,FM.[FM_DOC_NO]
	  ,FM.[FM_ITEM]
      ,FM.[AMOUNT_TYPE]
      ,FM.[BUDGET_CATEGORY]
      ,FM.[FISCAL_YEAR]
      ,FM.[LEVEL_NUMBER]
      ,FM.[FY_VARIANT]
      ,FM.[FY_PERIOD]
      ,FM.[YCE]
      ,FM.[YEAR_OF_CASH_EFF]
      ,CONVERT(VARCHAR(8),FM.[FM_POSTING_DATE], 112) AS [FM_POSTING_DATE]
      ,FM.[FM_AREA]
      ,FM.[FUND]
      ,FM.[FUNDS_CENTER]
      ,FM.[COMMITMENT_ITEM]
      ,FM.[FUNCTIONAL_AREA]
      ,FM.[FUNDED_PROGRAM]
      ,FM.[GRANT]
      ,FM.[CUSTOMER_FIELD]
      ,FM.[COMPANY_CODE]
      ,FM.[CHART_OF_ACCOUNTS]
      ,FM.[GL_ACCOUNT]
      ,FM.[CO_AREA]
      ,FM.[COST_CENTER]
      ,GM.[ORDER]
      ,ISNULL(LEFT(RTRIM(LTRIM(GM.WBS_ELEMENT)),2)+'-'+LEFT(SUBSTRING(RTRIM(LTRIM(GM.WBS_ELEMENT)),3,10),6)+'-'+SUBSTRING(RTRIM(LTRIM(GM.WBS_ELEMENT)),9,3),'--') AS WBS_ELEMENT
      ,FM.[PROFIT_CENTER]
      ,FM.[FM_VALTYPE]
      ,FM.[VALUE_TYPE]
      ,FM.[BUS_TRANSACTION]
      ,CASE WHEN FM.[STATISTICAL_ID]= ' ' THEN 'Z' ELSE [STATISTICAL_ID] END AS [STATISTICAL_ID] 
      ,FM.[CF_LEVEL]
      ,FM.[CARRYFWDPREVYR]
      ,FM.[VENDOR]
      ,FM.[CUSTOMER]
      ,FM.[TEXT] 
      ,FM.[CANCEL_ID]
      ,FM.[DOCUMENT_TYPE]
       ,CONVERT(VARCHAR(8), FM.[POSTING_DATE], 112) AS [POSTING_DATE]
      ,FM.[PMNT_DOC_COMP_CODE]
      ,FM.[FY_PMNT_DOC]
      ,FM.[PAYMENT_DOC_NO]
      ,FM.[PMNT_DOC_NO_ITEM]
      ,FM.[FI_DOC_NO_FY]
      ,FM.[FI_DOCUMENT_NO]
      ,FM.[FI_DOCUMENT_ITEM]
      ,FM.[PRED_DOC_NO]
      ,FM.[PRED_DOC_ITEM]
      ,FM.[PRED_ORG]
      ,FM.[PREDECESSOR_AA]
      ,FM.[FM_AREA_CURR]
      ,FM.[FMAC_AMOUNT]
	  ,FM.[TRANS_CURRENCY]
      ,FM.[TC_AMOUNT]
      ,FM.[ARCHIVE]
      ,FM.[OBJECT_NUMBER]
      ,FM.[REF_TRANSACTN]
      ,FM.[REF_DOCUMENT]
      ,FM.[BUDGET_PERIOD]
      ,FM.[BUSINESS_AREA]
      ,FM.[PAYMENT_STATUS] 
	  ,FM.LEDGER
      ,FM.TRANACTION_NO
	  ,FM.POSTING_DAY
	  ,FM.OBJECT_NUMBER_1
	  ,FM.BASE_UNIT
	  ,FM.REFERENCE_KEY_3
	  ,FM.PREDECESSOR_DT
	  ,FM.REF_TRANSACTN_1
	  ,FM.REF_DOCUMENT_NO
	  ,FM.DOCUMENT_DATE
	  ,FM.DOC_HEADER_TEXT
	  ,FM.REFFISCALYEAR
	  ,FM.DELINDICTR
	  ,FM.REFERENC_ORG_UN
	  ,FM.REFCOMPANYCODE
	  ,FM.ODQ_CHANGEMODE
	  ,FM.ODQ_ENTITYCNTR
  FROM 
  [STG_TD_SYN].[FM_FI_LNITMS] FM LEFT JOIN 
  
  (
  SELECT [ORDER], WBS_ELEMENT,FY_PERIOD,DOCUMENT_NUMBER,LINE_ITEM
  FROM [STG_TD_SYN].[GM_LNITMS] 
  WHERE (([ORDER] IS NOT NULL) OR (WBS_ELEMENT IS NOT NULL) ) AND  (([ORDER]<>' ') OR (WBS_ELEMENT<>' ') )
  ) GM
  
  ON 
  
    -- FM.[FY_PERIOD]=GM.[FY_PERIOD] AND
     FM.[FI_DOCUMENT_NO]=GM.DOCUMENT_NUMBER AND
     FM.[FI_DOCUMENT_ITEM]=GM.LINE_ITEM 

										 WHERE FM.DW_STATUS_IND=@DW_STATUS_IND AND FM.[DATA_AS_OF_DATE]=@DATA_AS_OF_DATE



	   ) SRC
	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);


 UPDATE [TD].[FM_FI_LNITMS] SET WBS_ELEMENT='--' WHERE WBS_ELEMENT IS NULL OR WBS_ELEMENT=' ' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
 UPDATE [TD].[FM_FI_LNITMS] SET [ORDER]='--' WHERE [ORDER] IS NULL OR [ORDER]=' ' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

 UPDATE [STG_TD_SYN].[FM_FI_LNITMS] SET [DW_STATUS_IND]='L' WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

 -------------------- EXECUTE THE DUP-REMOVAL ROUTINE ON FM_FI_LNITMS -------------------------------------------------------------------------------------------------
EXEC [TD].[uspFOCUS_FM_DUP] 'F','1900-01-01';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
SELECT @cnt_dw=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
   EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [TD].[uspFM_FI_LNITMS_QA]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [TD].[uspFM_FI_LNITMS_QA]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='TD.uspFM_FI_LNITMS_QA'
DECLARE @dw_object_name varchar(150)='TD.FM_FI_LNITMS_X'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_FI_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

  --------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM [TD].[FM_FI_LNITMS_X]  WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS] WHERE STATISTICAL_ID='X';
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


BEGIN TRAN

MERGE INTO [TD].[FM_FI_LNITMS_X] TGT
	 USING  
	 (SELECT
	       [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[FM_DOC_NO]
           ,[FM_ITEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCOUNTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[CUSTOMER]
           ,[TEXT]
           ,[CANCEL_ID]
           ,[DOCUMENT_TYPE]
           ,[POSTING_DATE]
           ,[PMNT_DOC_COMP_CODE]
           ,[FY_PMNT_DOC]
           ,[PAYMENT_DOC_NO]
           ,[PMNT_DOC_NO_ITEM]
           ,[FI_DOC_NO_FY]
           ,[FI_DOCUMENT_NO]
           ,[FI_DOCUMENT_ITEM]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PRED_ORG]
           ,[PREDECESSOR_AA]
           ,[FM_AREA_CURR]
           ,[FMAC_AMOUNT]
           ,[EXPENDITURE_AMOUNT]
           ,[TRANS_CURRENCY]
           ,[TC_AMOUNT]
           ,[ARCHIVE]
           ,[OBJECT_NUMBER]
           ,[REF_TRANSACTN]
           ,[REF_DOCUMENT]
           ,[BUDGET_PERIOD]
           ,[BUSINESS_AREA]
           ,[PAYMENT_STATUS]
		   ,LEDGER
		   ,TRANACTION_NO
		   ,POSTING_DAY
		   ,OBJECT_NUMBER_1
		   ,BASE_UNIT
		   ,REFERENCE_KEY_3
		   ,PREDECESSOR_DT
		   ,REF_TRANSACTN_1
		   ,REF_DOCUMENT_NO
		   ,DOCUMENT_DATE
		   ,DOC_HEADER_TEXT
		   ,REFFISCALYEAR
		   ,DELINDICTR
		   ,REFERENC_ORG_UN
		   ,REFCOMPANYCODE
		   ,ODQ_CHANGEMODE
		   ,ODQ_ENTITYCNTR
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]

FROM [TD].[FM_FI_LNITMS]
WHERE STATISTICAL_ID='X') SRC
	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);


DELETE FROM [TD].[FM_FI_LNITMS] WHERE STATISTICAL_ID='X';

COMMIT TRAN

SELECT @cnt_dw=COUNT(*) FROM  [TD].[FM_FI_LNITMS_X];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_FI_LNITMS_X] WHERE [SOURCERECORDSTATUS]='U';

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS] WHERE STATISTICAL_ID='X' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


BEGIN TRAN

MERGE INTO [TD].[FM_FI_LNITMS_X] TGT
	 USING  
	 (SELECT
	       [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[FM_DOC_NO]
           ,[FM_ITEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCOUNTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[CUSTOMER]
           ,[TEXT]
           ,[CANCEL_ID]
           ,[DOCUMENT_TYPE]
           ,[POSTING_DATE]
           ,[PMNT_DOC_COMP_CODE]
           ,[FY_PMNT_DOC]
           ,[PAYMENT_DOC_NO]
           ,[PMNT_DOC_NO_ITEM]
           ,[FI_DOC_NO_FY]
           ,[FI_DOCUMENT_NO]
           ,[FI_DOCUMENT_ITEM]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PRED_ORG]
           ,[PREDECESSOR_AA]
           ,[FM_AREA_CURR]
           ,[FMAC_AMOUNT]
           ,[EXPENDITURE_AMOUNT]
           ,[TRANS_CURRENCY]
           ,[TC_AMOUNT]
           ,[ARCHIVE]
           ,[OBJECT_NUMBER]
           ,[REF_TRANSACTN]
           ,[REF_DOCUMENT]
           ,[BUDGET_PERIOD]
           ,[BUSINESS_AREA]
           ,[PAYMENT_STATUS]
		   ,LEDGER
		   ,TRANACTION_NO
		   ,POSTING_DAY
		   ,OBJECT_NUMBER_1
		   ,BASE_UNIT
		   ,REFERENCE_KEY_3
		   ,PREDECESSOR_DT
		   ,REF_TRANSACTN_1
		   ,REF_DOCUMENT_NO
		   ,DOCUMENT_DATE
		   ,DOC_HEADER_TEXT
		   ,REFFISCALYEAR
		   ,DELINDICTR
		   ,REFERENC_ORG_UN
		   ,REFCOMPANYCODE
		   ,ODQ_CHANGEMODE
		   ,ODQ_ENTITYCNTR
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]

FROM [TD].[FM_FI_LNITMS]
WHERE STATISTICAL_ID='X'
							AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
) SRC
	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);


DELETE FROM [TD].[FM_FI_LNITMS] WHERE STATISTICAL_ID='X' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

COMMIT TRAN

SELECT @cnt_dw=COUNT(*) FROM  [TD].[FM_FI_LNITMS_X] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_FI_LNITMS_X] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END


IF @@ERROR<>0 ROLLBACK

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH


GO
/****** Object:  StoredProcedure [TD].[uspFM_PARKED_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [TD].[uspFM_PARKED_LNITMS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='TD.uspFM_PARKED_LNITMS'
DECLARE @dw_object_name varchar(150)='TD.FM_PARKED_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.FM_FI_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM  [TD].[FM_PARKED_LNITMS] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS] WHERE VALUE_TYPE='60' AND STATISTICAL_ID='Z';
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

BEGIN TRAN

MERGE INTO [TD].[FM_PARKED_LNITMS] TGT
	 USING  
	 (SELECT
	       [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[FM_DOC_NO]
           ,[FM_ITEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCOUNTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[CUSTOMER]
           ,[TEXT]
           ,[CANCEL_ID]
           ,[DOCUMENT_TYPE]
           ,[POSTING_DATE]
           ,[PMNT_DOC_COMP_CODE]
           ,[FY_PMNT_DOC]
           ,[PAYMENT_DOC_NO]
           ,[PMNT_DOC_NO_ITEM]
           ,[FI_DOC_NO_FY]
           ,[FI_DOCUMENT_NO]
           ,[FI_DOCUMENT_ITEM]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PRED_ORG]
           ,[PREDECESSOR_AA]
           ,[FM_AREA_CURR]
           ,[FMAC_AMOUNT]
           ,[EXPENDITURE_AMOUNT]
           ,[TRANS_CURRENCY]
           ,[TC_AMOUNT]
           ,[ARCHIVE]
           ,[OBJECT_NUMBER]
           ,[REF_TRANSACTN]
           ,[REF_DOCUMENT]
           ,[BUDGET_PERIOD]
           ,[BUSINESS_AREA]
           ,[PAYMENT_STATUS]
           ,LEDGER
		   ,TRANACTION_NO
		   ,POSTING_DAY
		   ,OBJECT_NUMBER_1
		   ,BASE_UNIT
		   ,REFERENCE_KEY_3
		   ,PREDECESSOR_DT
		   ,REF_TRANSACTN_1
		   ,REF_DOCUMENT_NO
		   ,DOCUMENT_DATE
		   ,DOC_HEADER_TEXT
		   ,REFFISCALYEAR
		   ,DELINDICTR
		   ,REFERENC_ORG_UN
		   ,REFCOMPANYCODE
		   ,ODQ_CHANGEMODE
		   ,ODQ_ENTITYCNTR
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]

FROM [TD].[FM_FI_LNITMS]
WHERE VALUE_TYPE='60' AND STATISTICAL_ID='Z') SRC
	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[PARKED_DOCS_AMOUNT],
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[EXPENDITURE_AMOUNT],
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);


DELETE FROM [TD].[FM_FI_LNITMS] WHERE VALUE_TYPE='60' AND STATISTICAL_ID='Z';

COMMIT TRAN

SELECT @cnt_dw=COUNT(*) FROM  [TD].[FM_PARKED_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_PARKED_LNITMS] WHERE [SOURCERECORDSTATUS]='U';

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

 IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [TD].[FM_FI_LNITMS] WHERE VALUE_TYPE='60' AND STATISTICAL_ID='Z' AND  DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


BEGIN TRAN

MERGE INTO [TD].[FM_PARKED_LNITMS] TGT
	 USING  
	 (SELECT
	       [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[FM_DOC_NO]
           ,[FM_ITEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCOUNTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[CUSTOMER]
           ,[TEXT]
           ,[CANCEL_ID]
           ,[DOCUMENT_TYPE]
           ,[POSTING_DATE]
           ,[PMNT_DOC_COMP_CODE]
           ,[FY_PMNT_DOC]
           ,[PAYMENT_DOC_NO]
           ,[PMNT_DOC_NO_ITEM]
           ,[FI_DOC_NO_FY]
           ,[FI_DOCUMENT_NO]
           ,[FI_DOCUMENT_ITEM]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PRED_ORG]
           ,[PREDECESSOR_AA]
           ,[FM_AREA_CURR]
           ,[FMAC_AMOUNT]
           ,[EXPENDITURE_AMOUNT]
           ,[TRANS_CURRENCY]
           ,[TC_AMOUNT]
           ,[ARCHIVE]
           ,[OBJECT_NUMBER]
           ,[REF_TRANSACTN]
           ,[REF_DOCUMENT]
           ,[BUDGET_PERIOD]
           ,[BUSINESS_AREA]
           ,[PAYMENT_STATUS]
           ,LEDGER
		   ,TRANACTION_NO
		   ,POSTING_DAY
		   ,OBJECT_NUMBER_1
		   ,BASE_UNIT
		   ,REFERENCE_KEY_3
		   ,PREDECESSOR_DT
		   ,REF_TRANSACTN_1
		   ,REF_DOCUMENT_NO
		   ,DOCUMENT_DATE
		   ,DOC_HEADER_TEXT
		   ,REFFISCALYEAR
		   ,DELINDICTR
		   ,REFERENC_ORG_UN
		   ,REFCOMPANYCODE
		   ,ODQ_CHANGEMODE
		   ,ODQ_ENTITYCNTR
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]

FROM [TD].[FM_FI_LNITMS]
WHERE VALUE_TYPE='60' AND STATISTICAL_ID='Z'
											AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
) SRC
	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[PARKED_DOCS_AMOUNT],
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[EXPENDITURE_AMOUNT],
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);


DELETE FROM [TD].[FM_FI_LNITMS] WHERE VALUE_TYPE='60' AND STATISTICAL_ID='Z' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

COMMIT TRAN

IF @@ERROR<>0 ROLLBACK


SELECT @cnt_dw=COUNT(*) FROM  [TD].[FM_PARKED_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[FM_PARKED_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA-------------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
/****** Object:  StoredProcedure [TD].[uspFOCUS_FM_DUP]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
--- REMOVE THE DUPS -- START 
WITH DUPS AS
( SELECT [DOCUMENT_NUMBER],[NUMBER],[ITEM], ROW_NUMBER() OVER (PARTITION BY [DOCUMENT_NUMBER],[NUMBER],[ITEM] 
                                                                ORDER BY [DOCUMENT_NUMBER]) AS RN
  FROM [MD].[DOCUMENT_NUMBER]
)
DELETE FROM DUPS WHERE RN > 1;
---- REMOVE THE DUPS --  END
*/


/*

TRUNCATE TABLE ETL.LOGGING

SELECT * FROM ETL.LOGGING

EXEC [TD].[uspFOCUS_FM_DUP] 'F','1900-01-01'

SELECT D.[FI_DOCUMENT_NO],D.[FY_PERIOD],D.[LEVEL_NUMBER] FROM 
(
SELECT  [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER] FROM 
[STG_TD_SYN].[FM_FI_LNITMS] WHERE DW_STATUS_IND='S' 
) D
GROUP BY D.[FI_DOCUMENT_NO], D.[FY_PERIOD],D.[LEVEL_NUMBER] HAVING COUNT(*)>1; 



SELECT [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER], COUNT(*) AS CNT
FROM  [STG_TD_SYN].[FM_FI_LNITMS]	
GROUP BY [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER]
HAVING COUNT(*)>1 

SELECT COUNT(*) FROM [TD].[FM_FI_LNITMS]

SELECT * FROM ETL.LOGGING;

*/

--TRUNCATE TABLE [TD].[FM_FI_LNITMS_DUPS]
--SELECT * FROM [TD].[FM_FI_LNITMS_DUPS]
--------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [TD].[uspFOCUS_FM_DUP]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)
DECLARE @dw_object_name varchar(150)
DECLARE @stg_object_name varchar(150)
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SET @dw_object_name='[TD].[FM_FI_LNITMS_DUPS]';
SET @stg_object_name='[STG_TD].[FM_FI_LNITMS]';
SET @Proc_Name='TD.uspFOCUS_FM_DUP (FI)';

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_FI_LNITMS] GROUP BY [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER] HAVING COUNT(*)>1;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup;


MERGE INTO [TD].[FM_FI_LNITMS_DUPS] TGT
	 USING  
	 (SELECT
	        FM.[DATA_AS_OF_DATE]
           ,FM.[DS_INSERT_DATE]
           ,FM.[DS_INSERT_TIME]
           ,FM.[DW_STATUS_IND]
           ,FM.[DOCUMENT_NUMBER]
           ,FM.[FM_DOC_NO]
           ,FM.[FM_ITEM]
           ,FM.[AMOUNT_TYPE]
           ,FM.[BUDGET_CATEGORY]
           ,FM.[FISCAL_YEAR]
           ,DUPS.[LEVEL_NUMBER] --- LEVEL_NUMBER
           ,FM.[FY_VARIANT]
           ,DUPS.[FY_PERIOD] ------- FY_PERIOD
           ,FM.[YCE]
           ,FM.[YEAR_OF_CASH_EFF]
           ,FM.[FM_POSTING_DATE]
           ,FM.[FM_AREA]
           ,FM.[FUND]
           ,FM.[FUNDS_CENTER]
           ,FM.[COMMITMENT_ITEM]
           ,FM.[FUNCTIONAL_AREA]
           ,FM.[FUNDED_PROGRAM]
           ,FM.[GRANT]
           ,FM.[CUSTOMER_FIELD]
           ,FM.[COMPANY_CODE]
           ,FM.[CHART_OF_ACCOUNTS]
           ,FM.[GL_ACCOUNT]
           ,FM.[CO_AREA]
           ,FM.[COST_CENTER]
           ,FM.[ORDER]
           ,FM.[WBS_ELEMENT]
           ,FM.[PROFIT_CENTER]
           ,FM.[FM_VALTYPE]
           ,FM.[VALUE_TYPE]
           ,FM.[BUS_TRANSACTION]
           ,FM.[STATISTICAL_ID]
           ,FM.[CF_LEVEL]
           ,FM.[CARRYFWDPREVYR]
           ,FM.[VENDOR]
           ,FM.[CUSTOMER]
           ,FM.[TEXT]
           ,FM.[CANCEL_ID]
           ,FM.[DOCUMENT_TYPE]
           ,FM.[POSTING_DATE]
           ,FM.[PMNT_DOC_COMP_CODE]
           ,FM.[FY_PMNT_DOC]
           ,FM.[PAYMENT_DOC_NO]
           ,FM.[PMNT_DOC_NO_ITEM]
           ,FM.[FI_DOC_NO_FY]
           ,DUPS.[FI_DOCUMENT_NO] ---FI_DOCUMENT_NO
           ,FM.[FI_DOCUMENT_ITEM]
           ,FM.[PRED_DOC_NO]
           ,FM.[PRED_DOC_ITEM]
           ,FM.[PRED_ORG]
           ,FM.[PREDECESSOR_AA]
           ,FM.[FM_AREA_CURR]
           ,FM.[FMAC_AMOUNT]
           ,FM.[EXPENDITURE_AMOUNT]
           ,FM.[TRANS_CURRENCY]
           ,FM.[TC_AMOUNT]
           ,FM.[ARCHIVE]
           ,FM.[OBJECT_NUMBER]
           ,FM.[REF_TRANSACTN]
           ,FM.[REF_DOCUMENT]
           ,FM.[BUDGET_PERIOD]
           ,FM.[BUSINESS_AREA]
           ,FM.[PAYMENT_STATUS]
           ,FM.LEDGER
		   ,FM.TRANACTION_NO
		   ,FM.POSTING_DAY
		   ,FM.OBJECT_NUMBER_1
		   ,FM.BASE_UNIT
		   ,FM.REFERENCE_KEY_3
		   ,FM.PREDECESSOR_DT
		   ,FM.REF_TRANSACTN_1
		   ,FM.REF_DOCUMENT_NO
		   ,FM.DOCUMENT_DATE
		   ,FM.DOC_HEADER_TEXT
		   ,FM.REFFISCALYEAR
		   ,FM.DELINDICTR
		   ,FM.REFERENC_ORG_UN
		   ,FM.REFCOMPANYCODE
		   ,FM.ODQ_CHANGEMODE
		   ,FM.ODQ_ENTITYCNTR
		   ,FM.[SOURCEEFFTIMESTAMP]
           ,FM.[SOURCEBATCHPROCESSID]
           ,FM.[SOURCERECORDSTATUS]

FROM [TD].[FM_FI_LNITMS] FM JOIN 

(SELECT [FI_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER], 
			ROW_NUMBER() OVER (PARTITION BY [FI_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER]
                                       ORDER BY [FI_DOCUMENT_NO]) AS RN FROM [TD].[FM_FI_LNITMS] 
) DUPS ON
   FM.[FI_DOCUMENT_NO]=DUPS.[FI_DOCUMENT_NO] AND
   FM.[FY_PERIOD]=DUPS.[FY_PERIOD] AND
   FM.[LEVEL_NUMBER]=DUPS.[LEVEL_NUMBER]
WHERE DUPS.RN > 1

) SRC
	 ON
    TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET
    TGT.[FM_DOC_NO]=SRC.[FM_DOC_NO],
   	TGT.[FM_ITEM]=SRC.[FM_ITEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT]=SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCOUNTS]=SRC.[CHART_OF_ACCOUNTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER]=SRC.[COST_CENTER],
	TGT.[ORDER]=SRC.[ORDER],
	TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE]=SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE]=SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION]=SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID]=SRC.[STATISTICAL_ID],
	TGT.[CF_LEVEL]=SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR]=SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR]=SRC.[VENDOR],
	TGT.[CUSTOMER]=SRC.[CUSTOMER],
	TGT.[TEXT]=SRC.[TEXT],
	TGT.[CANCEL_ID]=SRC.[CANCEL_ID],
	TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE],
	TGT.[POSTING_DATE]=SRC.[POSTING_DATE],
	TGT.[PMNT_DOC_COMP_CODE]=SRC.[PMNT_DOC_COMP_CODE],
	TGT.[FY_PMNT_DOC]=SRC.[FY_PMNT_DOC],
	TGT.[PAYMENT_DOC_NO]=SRC.[PAYMENT_DOC_NO],
	TGT.[PMNT_DOC_NO_ITEM]=SRC.[PMNT_DOC_NO_ITEM],
	TGT.[FI_DOC_NO_FY]=SRC.[FI_DOC_NO_FY],
	TGT.[FI_DOCUMENT_NO]=SRC.[FI_DOCUMENT_NO],
	TGT.[FI_DOCUMENT_ITEM]=SRC.[FI_DOCUMENT_ITEM],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM]=SRC.[PRED_DOC_ITEM],
	TGT.[PRED_ORG]=SRC.[PRED_ORG],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[FM_AREA_CURR]=SRC.[FM_AREA_CURR],
	TGT.[FMAC_AMOUNT]=SRC.[FMAC_AMOUNT],
	TGT.[TRANS_CURRENCY]=SRC.[TRANS_CURRENCY],
	TGT.[TC_AMOUNT]=SRC.[TC_AMOUNT],
	TGT.[ARCHIVE]=SRC.[ARCHIVE],
	TGT.[OBJECT_NUMBER]=SRC.[OBJECT_NUMBER],
	TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN],
	TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT],
	TGT.[BUDGET_PERIOD]=SRC.[BUDGET_PERIOD],
	TGT.[PAYMENT_STATUS]=SRC.[PAYMENT_STATUS],
	TGT.LEDGER=SRC.LEDGER,
	TGT.TRANACTION_NO=SRC.TRANACTION_NO,
	TGT.POSTING_DAY=SRC.POSTING_DAY,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.REFERENCE_KEY_3=SRC.REFERENCE_KEY_3,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.REF_DOCUMENT_NO=SRC.REF_DOCUMENT_NO,
	TGT.DOCUMENT_DATE=SRC.DOCUMENT_DATE,
	TGT.DOC_HEADER_TEXT=SRC.DOC_HEADER_TEXT,
	TGT.REFFISCALYEAR=SRC.REFFISCALYEAR,
	TGT.DELINDICTR=SRC.DELINDICTR,
	TGT.REFERENC_ORG_UN=SRC.REFERENC_ORG_UN,
	TGT.REFCOMPANYCODE=SRC.REFCOMPANYCODE,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCERECORDSTATUS]='U', 
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
    [DATA_AS_OF_DATE],
    [DS_INSERT_DATE],
    [DS_INSERT_TIME],
    [DW_STATUS_IND],
    [DOCUMENT_NUMBER],
    [FM_DOC_NO] ,
  	[FM_ITEM],
	[AMOUNT_TYPE] ,
	[BUDGET_CATEGORY],
	[FISCAL_YEAR],
	[LEVEL_NUMBER] ,
	[FY_VARIANT] ,
	[FY_PERIOD] ,
	[YCE] ,
	[YEAR_OF_CASH_EFF] ,
	[FM_POSTING_DATE] ,
	[FM_AREA] ,
	[FUND] ,
	[FUNDS_CENTER] ,
	[COMMITMENT_ITEM] ,
	[FUNCTIONAL_AREA],
	[FUNDED_PROGRAM] ,
	[GRANT] ,
	[CUSTOMER_FIELD] ,
	[COMPANY_CODE] ,
	[CHART_OF_ACCOUNTS] ,
	[GL_ACCOUNT] ,
	[CO_AREA] ,
	[COST_CENTER] ,
	[ORDER],
	[WBS_ELEMENT] ,
	[PROFIT_CENTER] ,
	[FM_VALTYPE] ,
	[VALUE_TYPE] ,
	[BUS_TRANSACTION] ,
	[STATISTICAL_ID] ,
	[CF_LEVEL] ,
	[CARRYFWDPREVYR] ,
	[VENDOR] ,
	[CUSTOMER] ,
	[TEXT] ,
	[CANCEL_ID],
	[DOCUMENT_TYPE] ,
	[POSTING_DATE] ,
	[PMNT_DOC_COMP_CODE] ,
	[FY_PMNT_DOC] ,
	[PAYMENT_DOC_NO] ,
	[PMNT_DOC_NO_ITEM] ,
	[FI_DOC_NO_FY] ,
	[FI_DOCUMENT_NO] ,
	[FI_DOCUMENT_ITEM] ,
	[PRED_DOC_NO],
	[PRED_DOC_ITEM] ,
	[PRED_ORG] ,
	[PREDECESSOR_AA] ,
	[FM_AREA_CURR] ,
	[FMAC_AMOUNT] ,
	[EXPENDITURE_AMOUNT],
	[TRANS_CURRENCY] ,
	[TC_AMOUNT] ,
	[ARCHIVE] ,
	[OBJECT_NUMBER] ,
	[REF_TRANSACTN] ,
	[REF_DOCUMENT] ,
	[BUDGET_PERIOD] ,
	[BUSINESS_AREA] ,
	[PAYMENT_STATUS] ,
	LEDGER,
	TRANACTION_NO,
	POSTING_DAY,
	OBJECT_NUMBER_1,
	BASE_UNIT,
	REFERENCE_KEY_3,
	PREDECESSOR_DT,
	REF_TRANSACTN_1,
	REF_DOCUMENT_NO,
	DOCUMENT_DATE,
	DOC_HEADER_TEXT,
	REFFISCALYEAR,
	DELINDICTR,
	REFERENC_ORG_UN,
	REFCOMPANYCODE,
	ODQ_CHANGEMODE,
	ODQ_ENTITYCNTR,
	[SOURCEEFFTIMESTAMP] ,
	[SOURCEBATCHPROCESSID],
	[SOURCERECORDSTATUS] 

)

VALUES( 
    SRC.[DATA_AS_OF_DATE],
    SRC.[DS_INSERT_DATE],
    SRC.[DS_INSERT_TIME],
    SRC.[DW_STATUS_IND],
    SRC.[DOCUMENT_NUMBER],
    SRC.[FM_DOC_NO],
    SRC.[FM_ITEM],
	SRC.[AMOUNT_TYPE] ,
	SRC.[BUDGET_CATEGORY],
	SRC.[FISCAL_YEAR],
	SRC.[LEVEL_NUMBER] ,
	SRC.[FY_VARIANT] ,
	SRC.[FY_PERIOD] ,
	SRC.[YCE] ,
	SRC.[YEAR_OF_CASH_EFF] ,
	SRC.[FM_POSTING_DATE] ,
	SRC.[FM_AREA] ,
	SRC.[FUND] ,
	SRC.[FUNDS_CENTER] ,
	SRC.[COMMITMENT_ITEM] ,
	SRC.[FUNCTIONAL_AREA],
	SRC.[FUNDED_PROGRAM] ,
	SRC.[GRANT] ,
	SRC.[CUSTOMER_FIELD] ,
	SRC.[COMPANY_CODE] ,
	SRC.[CHART_OF_ACCOUNTS] ,
	SRC.[GL_ACCOUNT] ,
	SRC.[CO_AREA] ,
	SRC.[COST_CENTER] ,
	SRC.[ORDER],
	SRC.[WBS_ELEMENT] ,
	SRC.[PROFIT_CENTER] ,
	SRC.[FM_VALTYPE] ,
	SRC.[VALUE_TYPE] ,
	SRC.[BUS_TRANSACTION] ,
	SRC.[STATISTICAL_ID] ,
	SRC.[CF_LEVEL] ,
	SRC.[CARRYFWDPREVYR] ,
	SRC.[VENDOR] ,
	SRC.[CUSTOMER] ,
	SRC.[TEXT] ,
	SRC.[CANCEL_ID],
	SRC.[DOCUMENT_TYPE] ,
	SRC.[POSTING_DATE] ,
	SRC.[PMNT_DOC_COMP_CODE] ,
	SRC.[FY_PMNT_DOC] ,
	SRC.[PAYMENT_DOC_NO] ,
	SRC.[PMNT_DOC_NO_ITEM] ,
	SRC.[FI_DOC_NO_FY] ,
	SRC.[FI_DOCUMENT_NO] ,
	SRC.[FI_DOCUMENT_ITEM] ,
	SRC.[PRED_DOC_NO],
	SRC.[PRED_DOC_ITEM] ,
	SRC.[PRED_ORG] ,
	SRC.[PREDECESSOR_AA] ,
	SRC.[FM_AREA_CURR] ,
	SRC.[FMAC_AMOUNT] ,
	SRC.[EXPENDITURE_AMOUNT],
	SRC.[TRANS_CURRENCY] ,
	SRC.[TC_AMOUNT] ,
	SRC.[ARCHIVE] ,
	SRC.[OBJECT_NUMBER] ,
	SRC.[REF_TRANSACTN] ,
	SRC.[REF_DOCUMENT] ,
	SRC.[BUDGET_PERIOD] ,
	SRC.[BUSINESS_AREA] ,
	SRC.[PAYMENT_STATUS] ,
	SRC.LEDGER,
	SRC.TRANACTION_NO,
	SRC.POSTING_DAY,
	SRC.OBJECT_NUMBER_1,
	SRC.BASE_UNIT,
	SRC.REFERENCE_KEY_3,
	SRC.PREDECESSOR_DT,
	SRC.REF_TRANSACTN_1,
	SRC.REF_DOCUMENT_NO,
	SRC.DOCUMENT_DATE,
	SRC.DOC_HEADER_TEXT,
	SRC.REFFISCALYEAR,
	SRC.DELINDICTR,
	SRC.REFERENC_ORG_UN,
	SRC.REFCOMPANYCODE,
	SRC.ODQ_CHANGEMODE,
	SRC.ODQ_ENTITYCNTR,
	GETDATE(),
	'1',
	'L'

);
---------------REMOVE DUPS FROM LNITMS-----------------------------------------------------------------------------------------------
WITH DUPS_IN_LNITMS AS
(SELECT [FI_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER], ROW_NUMBER() OVER (PARTITION BY [FI_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER]
                                                                           ORDER BY [FI_DOCUMENT_NO]) AS RN
FROM [TD].[FM_FI_LNITMS] 
)
DELETE FROM DUPS_IN_LNITMS WHERE RN > 1;
---------------REMOVE DUPS FROM DUPS-----------------------------------------------------------------------------------------------
WITH DUPS_IN_DUPS AS
(SELECT [FI_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER], ROW_NUMBER() OVER (PARTITION BY [FI_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER]
                                                                            ORDER BY [FI_DOCUMENT_NO]) AS RN
FROM [TD].[FM_FI_LNITMS_DUPS] 
)
DELETE FROM DUPS_IN_DUPS WHERE RN > 1;
------------------------------------------------------------------------------------------------------------------------------------

SELECT @cnt_dw=COUNT(*) FROM  [TD].[FM_FI_LNITMS_DUPS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw);
SELECT @cnt_dup=COUNT(*) FROM  [TD].[FM_FI_LNITMS_DUPS] WHERE [SOURCERECORDSTATUS]='U';

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup;

END

------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- COMMITMENTS -------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'C' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SET @dw_object_name='[TD].[FM_CMMT_LNITMS_DUPS]';
SET @stg_object_name='[STG_TD].[FM_CMMT_LNITMS]';
SET @Proc_Name='TD.uspFOCUS_FM_DUP (CMMTS)';

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[FM_CMMT_LNITMS] GROUP BY [REF_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER] HAVING COUNT(*)>1;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup;


MERGE INTO [TD].[FM_CMMT_LNITMS_DUPS] TGT
	 USING  
	(SELECT 
       CMMT.[DATA_AS_OF_DATE]
      ,CMMT.[DS_INSERT_DATE]
      ,CMMT.[DS_INSERT_TIME]
      ,CMMT.[DW_STATUS_IND]
      ,CMMT.DOCUMENT_NUMBER
      ,DUPS.[REF_DOCUMENT_NO] ---- [REF_DOCUMENT_NO]
      ,CMMT.[REFERENC_ORG_UN]
      ,CMMT.[REF_ITEM]
      ,CMMT.[ACCT_ASSNMT_NO]
      ,CMMT.[SCHEDULE_LINE]
      ,CMMT.[COUNTER]
      ,CMMT.[LOGICAL_SYSTEM]
      ,CMMT.[AMOUNT_TYPE]
      ,CMMT.[BUDGET_CATEGORY]
      ,CMMT.[FISCAL_YEAR]
      ,DUPS.[LEVEL_NUMBER] ----- [LEVEL_NUMBER]
      ,CMMT.[FY_VARIANT]
      ,DUPS.[FY_PERIOD] ------- [FY_PERIOD]
      ,CMMT.[YCE]
      ,CMMT.[YEAR_OF_CASH_EFF]
      ,CMMT.FM_POSTING_DATE
      ,CMMT.[FM_AREA]
      ,CMMT.[FUND]
      ,CMMT.[FUNDS_CENTER]
      ,CMMT.[COMMITMENT_ITEM]
      ,CMMT.[FUNCTIONAL_AREA]
      ,CMMT.[FUNDED_PROGRAM]
      ,CMMT.[GRANT]
      ,CMMT.[CUSTOMER_FIELD]
      ,CMMT.[COMPANY_CODE]
      ,CMMT.[CHART_OF_ACCTS]
      ,CMMT.[GL_ACCOUNT]
      ,CMMT.[CO_AREA]
      ,CMMT.[COST_CENTER]
      ,CMMT.[ORDER] 
      ,CMMT.WBS_ELEMENT 
      ,CMMT.[PROFIT_CENTER]
      ,CMMT.[FM_VALTYPE]
      ,CMMT.[VALUE_TYPE]
      ,CMMT.[BUS_TRANSACTION]
      ,CMMT.[STATISTICAL_ID]
      ,CMMT.[COMPLETION_IND]
      ,CMMT.[CF_LEVEL]
      ,CMMT.[CARRYFWDPREVYR]
      ,CMMT.[VENDOR]
      ,CMMT.[ITEM_TEXT] 
      ,CMMT.[POSTING_DATE]
      ,CMMT.[PRED_DOC_NO]
      ,CMMT.[PRED_DOC_ITEM]
      ,CMMT.[PREDECESSOR_AA]
      ,CMMT.[USER_NAME]
      ,CMMT.[BL_DOC_DATE]
	  ,CMMT.TRANSACTION_CURRENCY
	  ,CMMT.TC_AMOUNT
	  ,CMMT.ARCHIVE
	  ,CMMT.OBJECT_NUMBER
	  ,CMMT.BUDGET_PERIOD
	  ,CMMT.BUSINESS_AREA
	  ,CMMT.REF_DOCUMENT_CATG
	  ,CMMT.REF_TRANSACTN
	  ,CMMT.LEDGER
	  ,CMMT.FYC_STATUS
	  ,CMMT.TRANSACTION_NO
	  ,CMMT.BL_DOCUMENT_TYPE
	  ,CMMT.ENTERED_ON
      ,CMMT.ENTERED_AT
	  ,CMMT.TRANSACTION_CODE
	  ,CMMT.QUANT_OPEN
	  ,CMMT.QUANT_INV
	  ,CMMT.BASE_UNIT
	  ,CMMT.OBJECT_NUMBER_1
	  ,CMMT.PREDECESSOR_DT
	  ,CMMT.PRED_ORG
	  ,CMMT.REF_TRANSACTN_1
	  ,CMMT.FMAC_AMOUNT
	  ,CMMT.FM_AREA_CURR
	  ,CMMT.ODQ_CHANGEMODE
	  ,CMMT.ODQ_ENTITYCNTR

  FROM [TD].[FM_CMMT_LNITMS] CMMT JOIN 

(SELECT [REF_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER], 
			ROW_NUMBER() OVER (PARTITION BY [REF_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER]
                                       ORDER BY [REF_DOCUMENT_NO]) AS RN FROM [TD].[FM_CMMT_LNITMS]
) DUPS ON
   CMMT.[REF_DOCUMENT_NO]=DUPS.[REF_DOCUMENT_NO] AND
   CMMT.[FY_PERIOD]=DUPS.[FY_PERIOD] AND
   CMMT.[LEVEL_NUMBER]=DUPS.[LEVEL_NUMBER]
WHERE DUPS.RN > 1

   
   ) SRC
	 ON
    TGT.[REF_DOCUMENT_NO]=SRC.[REF_DOCUMENT_NO] AND
	TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER]
WHEN MATCHED THEN 
UPDATE SET 
    TGT.[REF_DOCUMENT_NO]=SRC.[REF_DOCUMENT_NO],
	TGT.[REFERENC_ORG_UN]=SRC.[REFERENC_ORG_UN],
	TGT.[REF_ITEM] =SRC.[REF_ITEM],
	TGT.[ACCT_ASSNMT_NO]=SRC.[ACCT_ASSNMT_NO],
	TGT.[SCHEDULE_LINE]=SRC.[SCHEDULE_LINE],
	TGT.[COUNTER]=SRC.[COUNTER],
	TGT.[LOGICAL_SYSTEM]=SRC.[LOGICAL_SYSTEM],
	TGT.[AMOUNT_TYPE]=SRC.[AMOUNT_TYPE],
	TGT.[BUDGET_CATEGORY]=SRC.[BUDGET_CATEGORY],
	TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR],
	TGT.[LEVEL_NUMBER]=SRC.[LEVEL_NUMBER],
	TGT.[FY_VARIANT]=SRC.[FY_VARIANT],
	TGT.[YCE]=SRC.[YCE],
	TGT.[YEAR_OF_CASH_EFF]=SRC.[YEAR_OF_CASH_EFF],
	TGT.[FM_POSTING_DATE]=SRC.[FM_POSTING_DATE],
	TGT.[GRANT] =SRC.[GRANT],
	TGT.[CUSTOMER_FIELD]=SRC.[CUSTOMER_FIELD],
	TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE],
	TGT.[CHART_OF_ACCTS]=SRC.[CHART_OF_ACCTS],
	TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT],
	TGT.[CO_AREA]=SRC.[CO_AREA],
	TGT.[COST_CENTER] =SRC.[COST_CENTER],
	TGT.[ORDER] =SRC.[ORDER],
	TGT.[WBS_ELEMENT] =SRC.[WBS_ELEMENT],
	TGT.[PROFIT_CENTER]=SRC.[PROFIT_CENTER],
	TGT.[FM_VALTYPE] =SRC.[FM_VALTYPE],
	TGT.[VALUE_TYPE] =SRC.[VALUE_TYPE],
	TGT.[BUS_TRANSACTION] =SRC.[BUS_TRANSACTION],
	TGT.[STATISTICAL_ID] =SRC.[STATISTICAL_ID],
	TGT.[COMPLETION_IND] =SRC.[COMPLETION_IND],
	TGT.[CF_LEVEL] =SRC.[CF_LEVEL],
	TGT.[CARRYFWDPREVYR] =SRC.[CARRYFWDPREVYR],
	TGT.[VENDOR] =SRC.[VENDOR],
	TGT.[ITEM_TEXT]=SRC.[ITEM_TEXT],
	TGT.[POSTING_DATE] =SRC.[POSTING_DATE],
	TGT.[PRED_DOC_NO]=SRC.[PRED_DOC_NO],
	TGT.[PRED_DOC_ITEM] =SRC.[PRED_DOC_ITEM],
	TGT.[PREDECESSOR_AA]=SRC.[PREDECESSOR_AA],
	TGT.[USER_NAME]=SRC.[USER_NAME],
	TGT.[BL_DOC_DATE] =SRC.[BL_DOC_DATE],
	TGT.TRANSACTION_CURRENCY=SRC.TRANSACTION_CURRENCY,
	TGT.TC_AMOUNT=SRC.TC_AMOUNT,
	TGT.ARCHIVE= SRC.ARCHIVE,
	TGT.OBJECT_NUMBER= SRC.OBJECT_NUMBER,
	TGT.BUDGET_PERIOD=SRC.BUDGET_PERIOD,
	TGT.BUSINESS_AREA=SRC.BUSINESS_AREA,
	TGT.REF_DOCUMENT_CATG=SRC.REF_DOCUMENT_CATG,
	TGT.REF_TRANSACTN=SRC.REF_TRANSACTN,
	TGT.LEDGER=SRC.LEDGER,
	TGT.FYC_STATUS=SRC.FYC_STATUS,
	TGT.TRANSACTION_NO=SRC.TRANSACTION_NO,
	TGT.BL_DOCUMENT_TYPE=SRC.BL_DOCUMENT_TYPE,
	TGT.ENTERED_ON=SRC.ENTERED_ON,
    TGT.ENTERED_AT=SRC.ENTERED_AT,
	TGT.TRANSACTION_CODE=SRC.TRANSACTION_CODE,
	TGT.QUANT_OPEN=SRC.QUANT_OPEN,
	TGT.QUANT_INV=SRC.QUANT_INV,
	TGT.BASE_UNIT=SRC.BASE_UNIT,
	TGT.OBJECT_NUMBER_1=SRC.OBJECT_NUMBER_1,
	TGT.PREDECESSOR_DT=SRC.PREDECESSOR_DT,
	TGT.PRED_ORG=SRC.PRED_ORG,
	TGT.REF_TRANSACTN_1=SRC.REF_TRANSACTN_1,
	TGT.FMAC_AMOUNT=SRC.FMAC_AMOUNT,
	TGT.FM_AREA_CURR=SRC.FM_AREA_CURR,
	TGT.ODQ_CHANGEMODE=SRC.ODQ_CHANGEMODE,
	TGT.ODQ_ENTITYCNTR=SRC.ODQ_ENTITYCNTR,
	TGT.[SOURCEEFFTIMESTAMP]=GETDATE(),
	TGT.[SOURCEBATCHPROCESSID]='1',
	TGT.[SOURCERECORDSTATUS]='U'

	
WHEN NOT MATCHED THEN
INSERT 
(

            [DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[DOCUMENT_NUMBER]
           ,[REF_DOCUMENT_NO]
           ,[REFERENC_ORG_UN]
           ,[REF_ITEM]
           ,[ACCT_ASSNMT_NO]
           ,[SCHEDULE_LINE]
           ,[COUNTER]
           ,[LOGICAL_SYSTEM]
           ,[AMOUNT_TYPE]
           ,[BUDGET_CATEGORY]
           ,[FISCAL_YEAR]
           ,[LEVEL_NUMBER]
           ,[FY_VARIANT]
           ,[FY_PERIOD]
           ,[YCE]
           ,[YEAR_OF_CASH_EFF]
           ,[FM_POSTING_DATE]
           ,[FM_AREA]
           ,[FUND]
           ,[FUNDS_CENTER]
           ,[COMMITMENT_ITEM]
           ,[FUNCTIONAL_AREA]
           ,[FUNDED_PROGRAM]
           ,[GRANT]
           ,[CUSTOMER_FIELD]
           ,[COMPANY_CODE]
           ,[CHART_OF_ACCTS]
           ,[GL_ACCOUNT]
           ,[CO_AREA]
           ,[COST_CENTER]
           ,[ORDER]
           ,[WBS_ELEMENT]
           ,[PROFIT_CENTER]
           ,[FM_VALTYPE]
           ,[VALUE_TYPE]
           ,[BUS_TRANSACTION]
           ,[STATISTICAL_ID]
           ,[COMPLETION_IND]
           ,[CF_LEVEL]
           ,[CARRYFWDPREVYR]
           ,[VENDOR]
           ,[ITEM_TEXT]
           ,[POSTING_DATE]
           ,[PRED_DOC_NO]
           ,[PRED_DOC_ITEM]
           ,[PREDECESSOR_AA]
           ,[USER_NAME]
           ,[BL_DOC_DATE]          
		   ,TRANSACTION_CURRENCY
		   ,TC_AMOUNT
		   ,ARCHIVE
		   ,OBJECT_NUMBER
		   ,BUDGET_PERIOD
		   ,BUSINESS_AREA
		   ,REF_DOCUMENT_CATG
		   ,REF_TRANSACTN
		   ,LEDGER
		   ,FYC_STATUS
		   ,TRANSACTION_NO
		   ,BL_DOCUMENT_TYPE
		   ,ENTERED_ON
		   ,ENTERED_AT
		   ,TRANSACTION_CODE
		   ,QUANT_OPEN
		   ,QUANT_INV
		   ,BASE_UNIT
		   ,OBJECT_NUMBER_1
		   ,PREDECESSOR_DT
		   ,PRED_ORG
		   ,REF_TRANSACTN_1
		   ,FMAC_AMOUNT
		   ,FM_AREA_CURR
		   ,ODQ_CHANGEMODE
	       ,ODQ_ENTITYCNTR     
		   ,[SOURCEEFFTIMESTAMP]
           ,[SOURCEBATCHPROCESSID]
           ,[SOURCERECORDSTATUS]
)

VALUES( 
            SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[REF_DOCUMENT_NO]
           ,SRC.[REFERENC_ORG_UN]
           ,SRC.[REF_ITEM]
           ,SRC.[ACCT_ASSNMT_NO]
           ,SRC.[SCHEDULE_LINE]
           ,SRC.[COUNTER]
           ,SRC.[LOGICAL_SYSTEM]
           ,SRC.[AMOUNT_TYPE]
           ,SRC.[BUDGET_CATEGORY]
           ,SRC.[FISCAL_YEAR]
           ,SRC.[LEVEL_NUMBER]
           ,SRC.[FY_VARIANT]
           ,SRC.[FY_PERIOD]
           ,SRC.[YCE]
           ,SRC.[YEAR_OF_CASH_EFF]
           ,SRC.[FM_POSTING_DATE]
           ,SRC.[FM_AREA]
           ,SRC.[FUND]
           ,SRC.[FUNDS_CENTER]
           ,SRC.[COMMITMENT_ITEM]
           ,SRC.[FUNCTIONAL_AREA]
           ,SRC.[FUNDED_PROGRAM]
           ,SRC.[GRANT]
           ,SRC.[CUSTOMER_FIELD]
           ,SRC.[COMPANY_CODE]
           ,SRC.[CHART_OF_ACCTS]
           ,SRC.[GL_ACCOUNT]
           ,SRC.[CO_AREA]
           ,SRC.[COST_CENTER]
           ,SRC.[ORDER]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[PROFIT_CENTER]
           ,SRC.[FM_VALTYPE]
           ,SRC.[VALUE_TYPE]
           ,SRC.[BUS_TRANSACTION]
           ,SRC.[STATISTICAL_ID]
           ,SRC.[COMPLETION_IND]
           ,SRC.[CF_LEVEL]
           ,SRC.[CARRYFWDPREVYR]
           ,SRC.[VENDOR]
           ,SRC.[ITEM_TEXT]
           ,SRC.[POSTING_DATE]
           ,SRC.[PRED_DOC_NO]
           ,SRC.[PRED_DOC_ITEM]
           ,SRC.[PREDECESSOR_AA]
           ,SRC.[USER_NAME]
           ,SRC.[BL_DOC_DATE]
		   ,SRC.TRANSACTION_CURRENCY
		   ,SRC.TC_AMOUNT
		   ,SRC.ARCHIVE
		   ,SRC.OBJECT_NUMBER
		   ,SRC.BUDGET_PERIOD
		   ,SRC.BUSINESS_AREA
		   ,SRC.REF_DOCUMENT_CATG
		   ,SRC.REF_TRANSACTN
		   ,SRC.LEDGER
		   ,SRC.FYC_STATUS
		   ,SRC.TRANSACTION_NO
		   ,SRC.BL_DOCUMENT_TYPE
		   ,SRC.ENTERED_ON
		   ,SRC.ENTERED_AT
		   ,SRC.TRANSACTION_CODE
		   ,SRC.QUANT_OPEN
		   ,SRC.QUANT_INV
		   ,SRC.BASE_UNIT
		   ,SRC.OBJECT_NUMBER_1
		   ,SRC.PREDECESSOR_DT
		   ,SRC.PRED_ORG
		   ,SRC.REF_TRANSACTN_1
		   ,SRC.FMAC_AMOUNT
		   ,SRC.FM_AREA_CURR
		   ,SRC.ODQ_CHANGEMODE
	       ,SRC.ODQ_ENTITYCNTR     
		   ,GETDATE()
           ,'1'
		   ,'L'

);---------------REMOVE DUPS FROM CMMT LNITMS-----------------------------------------------------------------------------------------------
WITH DUPS_IN_CMMT_LNITMS AS
(SELECT [REF_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER], ROW_NUMBER() OVER (PARTITION BY [REF_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER]
                                                                           ORDER BY [REF_DOCUMENT_NO]) AS RN
FROM [TD].[FM_CMMT_LNITMS] 
)
DELETE FROM DUPS_IN_CMMT_LNITMS WHERE RN > 1;
---------------REMOVE DUPS FROM CMMT DUPS-----------------------------------------------------------------------------------------------
WITH DUPS_IN_CMMT_DUPS AS
(SELECT [REF_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER], ROW_NUMBER() OVER (PARTITION BY [REF_DOCUMENT_NO],[FY_PERIOD],[LEVEL_NUMBER]
                                                                            ORDER BY [REF_DOCUMENT_NO]) AS RN
FROM [TD].[FM_CMMT_LNITMS_DUPS] 
)
DELETE FROM DUPS_IN_CMMT_DUPS WHERE RN > 1;
------------------------------------------------------------------------------------------------------------------------------------

SELECT @cnt_dw=COUNT(*) FROM  [TD].[FM_CMMT_LNITMS_DUPS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw);
SELECT @cnt_dup=COUNT(*) FROM  [TD].[FM_CMMT_LNITMS_DUPS] WHERE [SOURCERECORDSTATUS]='U';

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup;

END


END TRY

BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH
GO
/****** Object:  StoredProcedure [TD].[uspGM_LNITMS]    Script Date: 5/12/2015 9:32:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

TRUNCATE TABLE [TD].[GM_LNITMS]
TRUNCATE TABLE ETL.LOGGING
SELECT * FROM [TD].[GM_LNITMS]

S - use as operational parameter for the proc to indicate 'incremental load' with data date as second parameter;
F - use as operational parameter for the proc to indicate 'full load' with data date having the value of '1900-01-01';
D - user as operation parameter for the proc to indicate 'delete rows' with the data date as second parameter;

---------- EXAMPLES OF USE START -------------

EXEC [TD].[uspGM_LNITMS] 'S','2015-02-08'

EXEC [TD].[uspGM_LNITMS] 'F','1900-01-01'

EXEC [TD].[uspGM_LNITMS] 'D','2015-02-09'

-------- EXAMPLES OF USE END ----------------

SELECT * FROM ETL.LOGGING
*/



CREATE PROCEDURE [TD].[uspGM_LNITMS]
@DW_STATUS_IND char(1),
@DATA_AS_OF_DATE DATE
AS
BEGIN TRY 

DECLARE @Proc_Name varchar(150)='TD.uspGM_LNITMS'
DECLARE @dw_object_name varchar(150)='TD.GM_LNITMS'
DECLARE @stg_object_name varchar(150)='STG_TD.GM_LNITMS'
DECLARE @Source_Type varchar(15)='TABLE'
DECLARE @Error_Message varchar(1500)=''
DECLARE @Subject_Area varchar(150)='FM'
DECLARE @cnt_dw int=0
DECLARE @cnt_stg int=0
DECLARE @cnt_dif int=0
DECLARE @cnt_dup int=0

--------------------------------------------------------------------------------------------------------------
--------- REMOVAL LOGIC STARTS HERE---------------------------------------------------------------------------
---------PARAMETER 'D' STANDS FOR 'DELETE' REQUEST -----------------------------------------------------------

 IF @DW_STATUS_IND = 'D'
BEGIN
						DELETE FROM  [TD].[FM_FI_LNITMS] WHERE [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
END

 -------------------------------------------------------------------------------------------------------------------------
 --------  SECTION (FULL LOAD ) STARTS HERE ------------------------------------------------------------------------------
 ---------PARAMETER COMBINATION OF 'F' FOR STATUS TOGETHER WITH '1900-01-01' FOR DATE STANDS FOR 'ALL DATA IN STAGING'----
 -------------------------------------------------------------------------------------------------------------------------
IF @DW_STATUS_IND = 'F' AND @DATA_AS_OF_DATE='1900-01-01'
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[GM_LNITMS];
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


MERGE INTO [TD].[GM_LNITMS] TGT
	 USING  
	 (SELECT 
	        [DI_SEQUENCE_NUMBER]
           ,[DI_OPERATION_TYPE]
           ,[DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[BUSINESS_TRANS]
           ,[ASSET]
           ,[SUB-NUMBER]
           ,[REFERENC_ORG_UN]
           ,[REF_TRANSACTN]
           ,[DOCUMENT_NUMBER]
           ,[BILLING_BLOCK]
           ,[BILLING_STATUS]
           ,[POSTING_DATE]
           ,[BUSINESS_AREA]
           ,[LINE_ITEM]
           ,[CO_AREA]
           ,[COMMITMENT_ITEM]
           ,[COST_CENTER]
           ,[COUNTER]
           ,[ENTERED_ON]
           ,[ENTERED_AT]
           ,[TECHNICAL_ORIGIN]
           ,[DOCUMENT_TYPE]
           ,[DOC_LINE_ITEM]
           ,[ACC_DOC_NUMBER]
           ,[FISL_DOC_TYPE]
           ,[COMPLETION_IND]
           ,[FUNCTIONAL_AREA]
           ,[FM_AREA]
           ,[FUNDS_CENTER]
           ,[GL_ACCOUNT]
           ,[ITEM_CATEGORY]
           ,[DELINDICTR]
           ,[MATERIAL]
           ,[FUNDED_PROGRAM]
           ,[NETWORK]
           ,[PREV_REF_KEY]
           ,[REFERENC_ORG_UN1]
           ,[REFERENCE_ITEM]
           ,[REF_PROCEDURE]
           ,[ORDER]
           ,[POSTING_PERIOD]
           ,[BUDGET_VALIDITY_NO]
           ,[COMPANY_CODE]
           ,[REF_TRANSACTN1]
           ,[REFERENCE_KEY]
           ,[REFERENC_DOC_CAT]
           ,[REFERENCE_ITEM1]
           ,[REF_DOCUMENT]
           ,[REFERENCE_YEAR]
           ,[FUND]
           ,[GRANT]
           ,[GRANTEE_FY]
           ,[PLAN_NO_F_OPER]
           ,[SPONSORED_CLASS]
           ,[SPONSORED_PROGRAM]
           ,[STAT_INDICATOR]
           ,[CURRENCY]
           ,[BUSINESS_TRANS1]
           ,[GM_VALUE_TYPE]
           ,[VERSION]
           ,[OR_TRANS_CURRNY]
           ,[FISCAL_YEAR]
           ,[TEXT]
           ,[USER_NAME]
           ,[WBS_ELEMENT]
           ,[WBS_ELEMENT_SH]
           ,[VALUE_DATE]
           ,[CHANGED]
           ,[FY_PERIOD]
           ,[FY_VARIANT]
           ,[QUANTITY]
           ,[AMOUNT]
           ,[ODQ_CHANGEMODE]
           ,[ODQ_ENTITYCNTR]
  FROM 
  [STG_TD_SYN].[GM_LNITMS] GM ) SRC
	 ON
TGT.[DOC_LINE_ITEM]=SRC.[DOC_LINE_ITEM] AND
TGT.[ACC_DOC_NUMBER]=SRC.[ACC_DOC_NUMBER] AND
TGT.[CURRENCY]=SRC.[CURRENCY] AND
TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR] AND
TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
TGT.[FY_VARIANT]=SRC.[FY_VARIANT]
WHEN MATCHED THEN 
UPDATE SET

           TGT.[DI_SEQUENCE_NUMBER]=SRC.[DI_SEQUENCE_NUMBER]
           ,TGT.[DI_OPERATION_TYPE]=SRC.[DI_OPERATION_TYPE]
           ,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
           ,TGT.[DS_INSERT_DATE]=SRC.[DS_INSERT_DATE]
           ,TGT.[DS_INSERT_TIME]=SRC.[DS_INSERT_TIME]
           ,TGT.[DW_STATUS_IND]=SRC.[DW_STATUS_IND]
           ,TGT.[BUSINESS_TRANS]=SRC.[BUSINESS_TRANS]
           ,TGT.[ASSET]=SRC.[ASSET]
           ,TGT.[SUB-NUMBER]=SRC.[SUB-NUMBER]
           ,TGT.[REFERENC_ORG_UN]=SRC.[REFERENC_ORG_UN]
           ,TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN]
           ,TGT.[DOCUMENT_NUMBER]=SRC.[DOCUMENT_NUMBER]
           ,TGT.[BILLING_BLOCK]=SRC.[BILLING_BLOCK]
           ,TGT.[BILLING_STATUS]=SRC.[BILLING_STATUS]
           ,TGT.[POSTING_DATE]=SRC.[POSTING_DATE]
           ,TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA]
           ,TGT.[LINE_ITEM]=SRC.[LINE_ITEM]
           ,TGT.[CO_AREA]=SRC.[CO_AREA]
           ,TGT.[COMMITMENT_ITEM]=SRC.[COMMITMENT_ITEM]
           ,TGT.[COST_CENTER]=SRC.[COST_CENTER]
           ,TGT.[COUNTER]=SRC.[COUNTER]
           ,TGT.[ENTERED_ON]=SRC.[ENTERED_ON]
           ,TGT.[ENTERED_AT]=SRC.[ENTERED_AT]
           ,TGT.[TECHNICAL_ORIGIN]=SRC.[TECHNICAL_ORIGIN]
           ,TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE]
           ,TGT.[DOC_LINE_ITEM]=SRC.[DOC_LINE_ITEM]
           ,TGT.[ACC_DOC_NUMBER]=SRC.[ACC_DOC_NUMBER]
           ,TGT.[FISL_DOC_TYPE]=SRC.[FISL_DOC_TYPE]
           ,TGT.[COMPLETION_IND]=SRC.[COMPLETION_IND]
           ,TGT.[FUNCTIONAL_AREA]=SRC.[FUNCTIONAL_AREA]
           ,TGT.[FM_AREA]=SRC.[FM_AREA]
           ,TGT.[FUNDS_CENTER]=SRC.[FUNDS_CENTER]
           ,TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT]
           ,TGT.[ITEM_CATEGORY]=SRC.[ITEM_CATEGORY]
           ,TGT.[DELINDICTR]=SRC.[DELINDICTR]
           ,TGT.[MATERIAL]=SRC.[MATERIAL]
           ,TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM]
           ,TGT.[NETWORK]=SRC.[NETWORK]
           ,TGT.[PREV_REF_KEY]=SRC.[PREV_REF_KEY]
           ,TGT.[REFERENC_ORG_UN1]=SRC.[REFERENC_ORG_UN1]
           ,TGT.[REFERENCE_ITEM]=SRC.[REFERENCE_ITEM]
           ,TGT.[REF_PROCEDURE]=SRC.[REF_PROCEDURE]
           ,TGT.[ORDER]=SRC.[ORDER]
           ,TGT.[POSTING_PERIOD]=SRC.[POSTING_PERIOD]
           ,TGT.[BUDGET_VALIDITY_NO]=SRC.[BUDGET_VALIDITY_NO]
           ,TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE]
           ,TGT.[REF_TRANSACTN1]=SRC.[REF_TRANSACTN1]
           ,TGT.[REFERENCE_KEY]=SRC.[REFERENCE_KEY]
           ,TGT.[REFERENC_DOC_CAT]=SRC.[REFERENC_DOC_CAT]
           ,TGT.[REFERENCE_ITEM1]=SRC.[REFERENCE_ITEM1]
           ,TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT]
           ,TGT.[REFERENCE_YEAR]=SRC.[REFERENCE_YEAR]
           ,TGT.[FUND]=SRC.[FUND]
           ,TGT.[GRANT]=SRC.[GRANT]
           ,TGT.[GRANTEE_FY]=SRC.[GRANTEE_FY]
           ,TGT.[PLAN_NO_F_OPER]=SRC.[PLAN_NO_F_OPER]
           ,TGT.[SPONSORED_CLASS]=SRC.[SPONSORED_CLASS]
           ,TGT.[SPONSORED_PROGRAM]=SRC.[SPONSORED_PROGRAM]
           ,TGT.[STAT_INDICATOR]=SRC.[STAT_INDICATOR]
           ,TGT.[CURRENCY]=SRC.[CURRENCY]
           ,TGT.[BUSINESS_TRANS1]=SRC.[BUSINESS_TRANS1]
           ,TGT.[GM_VALUE_TYPE]=SRC.[GM_VALUE_TYPE]
           ,TGT.[VERSION]=SRC.[VERSION]
           ,TGT.[OR_TRANS_CURRNY]=SRC.[OR_TRANS_CURRNY]
           ,TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR]
           ,TGT.[TEXT]=SRC.[TEXT]
           ,TGT.[USER_NAME]=SRC.[USER_NAME]
           ,TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT]
           ,TGT.[WBS_ELEMENT_SH]=SRC.[WBS_ELEMENT_SH]
           ,TGT.[VALUE_DATE]=SRC.[VALUE_DATE]
           ,TGT.[CHANGED]=SRC.[CHANGED]
           ,TGT.[FY_PERIOD]=SRC.[FY_PERIOD]
           ,TGT.[FY_VARIANT]=SRC.[FY_VARIANT]
           ,TGT.[QUANTITY]=SRC.[QUANTITY]
           ,TGT.[AMOUNT]=SRC.[AMOUNT]
           ,TGT.[ODQ_CHANGEMODE]=SRC.[ODQ_CHANGEMODE]
           ,TGT.[ODQ_ENTITYCNTR]=SRC.[ODQ_ENTITYCNTR]
	       ,TGT.[SOURCERECORDSTATUS]='U' 
	       ,TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
            [DI_SEQUENCE_NUMBER]
           ,[DI_OPERATION_TYPE]
           ,[DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[BUSINESS_TRANS]
           ,[ASSET]
           ,[SUB-NUMBER]
           ,[REFERENC_ORG_UN]
           ,[REF_TRANSACTN]
           ,[DOCUMENT_NUMBER]
           ,[BILLING_BLOCK]
           ,[BILLING_STATUS]
           ,[POSTING_DATE]
           ,[BUSINESS_AREA]
           ,[LINE_ITEM]
           ,[CO_AREA]
           ,[COMMITMENT_ITEM]
           ,[COST_CENTER]
           ,[COUNTER]
           ,[ENTERED_ON]
           ,[ENTERED_AT]
           ,[TECHNICAL_ORIGIN]
           ,[DOCUMENT_TYPE]
           ,[DOC_LINE_ITEM]
           ,[ACC_DOC_NUMBER]
           ,[FISL_DOC_TYPE]
           ,[COMPLETION_IND]
           ,[FUNCTIONAL_AREA]
           ,[FM_AREA]
           ,[FUNDS_CENTER]
           ,[GL_ACCOUNT]
           ,[ITEM_CATEGORY]
           ,[DELINDICTR]
           ,[MATERIAL]
           ,[FUNDED_PROGRAM]
           ,[NETWORK]
           ,[PREV_REF_KEY]
           ,[REFERENC_ORG_UN1]
           ,[REFERENCE_ITEM]
           ,[REF_PROCEDURE]
           ,[ORDER]
           ,[POSTING_PERIOD]
           ,[BUDGET_VALIDITY_NO]
           ,[COMPANY_CODE]
           ,[REF_TRANSACTN1]
           ,[REFERENCE_KEY]
           ,[REFERENC_DOC_CAT]
           ,[REFERENCE_ITEM1]
           ,[REF_DOCUMENT]
           ,[REFERENCE_YEAR]
           ,[FUND]
           ,[GRANT]
           ,[GRANTEE_FY]
           ,[PLAN_NO_F_OPER]
           ,[SPONSORED_CLASS]
           ,[SPONSORED_PROGRAM]
           ,[STAT_INDICATOR]
           ,[CURRENCY]
           ,[BUSINESS_TRANS1]
           ,[GM_VALUE_TYPE]
           ,[VERSION]
           ,[OR_TRANS_CURRNY]
           ,[FISCAL_YEAR]
           ,[TEXT]
           ,[USER_NAME]
           ,[WBS_ELEMENT]
           ,[WBS_ELEMENT_SH]
           ,[VALUE_DATE]
           ,[CHANGED]
           ,[FY_PERIOD]
           ,[FY_VARIANT]
           ,[QUANTITY]
           ,[AMOUNT]
           ,[ODQ_CHANGEMODE]
           ,[ODQ_ENTITYCNTR]
		   ,[SOURCEEFFTIMESTAMP] 
	       ,[SOURCEBATCHPROCESSID]
	       ,[SOURCERECORDSTATUS] 

)

VALUES( 
            SRC.[DI_SEQUENCE_NUMBER]
           ,SRC.[DI_OPERATION_TYPE]
           ,SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[BUSINESS_TRANS]
           ,SRC.[ASSET]
           ,SRC.[SUB-NUMBER]
           ,SRC.[REFERENC_ORG_UN]
           ,SRC.[REF_TRANSACTN]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[BILLING_BLOCK]
           ,SRC.[BILLING_STATUS]
           ,SRC.[POSTING_DATE]
           ,SRC.[BUSINESS_AREA]
           ,SRC.[LINE_ITEM]
           ,SRC.[CO_AREA]
           ,SRC.[COMMITMENT_ITEM]
           ,SRC.[COST_CENTER]
           ,SRC.[COUNTER]
           ,SRC.[ENTERED_ON]
           ,SRC.[ENTERED_AT]
           ,SRC.[TECHNICAL_ORIGIN]
           ,SRC.[DOCUMENT_TYPE]
           ,SRC.[DOC_LINE_ITEM]
           ,SRC.[ACC_DOC_NUMBER]
           ,SRC.[FISL_DOC_TYPE]
           ,SRC.[COMPLETION_IND]
           ,SRC.[FUNCTIONAL_AREA]
           ,SRC.[FM_AREA]
           ,SRC.[FUNDS_CENTER]
           ,SRC.[GL_ACCOUNT]
           ,SRC.[ITEM_CATEGORY]
           ,SRC.[DELINDICTR]
           ,SRC.[MATERIAL]
           ,SRC.[FUNDED_PROGRAM]
           ,SRC.[NETWORK]
           ,SRC.[PREV_REF_KEY]
           ,SRC.[REFERENC_ORG_UN1]
           ,SRC.[REFERENCE_ITEM]
           ,SRC.[REF_PROCEDURE]
           ,SRC.[ORDER]
           ,SRC.[POSTING_PERIOD]
           ,SRC.[BUDGET_VALIDITY_NO]
           ,SRC.[COMPANY_CODE]
           ,SRC.[REF_TRANSACTN1]
           ,SRC.[REFERENCE_KEY]
           ,SRC.[REFERENC_DOC_CAT]
           ,SRC.[REFERENCE_ITEM1]
           ,SRC.[REF_DOCUMENT]
           ,SRC.[REFERENCE_YEAR]
           ,SRC.[FUND]
           ,SRC.[GRANT]
           ,SRC.[GRANTEE_FY]
           ,SRC.[PLAN_NO_F_OPER]
           ,SRC.[SPONSORED_CLASS]
           ,SRC.[SPONSORED_PROGRAM]
           ,SRC.[STAT_INDICATOR]
           ,SRC.[CURRENCY]
           ,SRC.[BUSINESS_TRANS1]
           ,SRC.[GM_VALUE_TYPE]
           ,SRC.[VERSION]
           ,SRC.[OR_TRANS_CURRNY]
           ,SRC.[FISCAL_YEAR]
           ,SRC.[TEXT]
           ,SRC.[USER_NAME]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[WBS_ELEMENT_SH]
           ,SRC.[VALUE_DATE]
           ,SRC.[CHANGED]
           ,SRC.[FY_PERIOD]
           ,SRC.[FY_VARIANT]
           ,SRC.[QUANTITY]
           ,SRC.[AMOUNT]
           ,SRC.[ODQ_CHANGEMODE]
           ,SRC.[ODQ_ENTITYCNTR]
		   ,GETDATE()
	       , '1'
	       ,'L'

);

 UPDATE [STG_TD_SYN].[GM_LNITMS] SET [DW_STATUS_IND]='L';

SELECT @cnt_dw=COUNT(*) FROM [TD].[GM_LNITMS];
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[GM_LNITMS] WHERE [SOURCERECORDSTATUS]='U'; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END



-----------------------------------------------------------------------------------------------------------------------
--------------SECTION (INCREMENTAL LOAD ) STARTS HERE ------------------------------------------------------------------ 
 ------------------------------------------------------------------------------------------------------------------------

IF @DW_STATUS_IND = 'S' AND @DATA_AS_OF_DATE IS NOT NULL
BEGIN

SELECT @cnt_stg=COUNT(*) FROM [STG_TD_SYN].[GM_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
EXEC ETL.uspLOG_LOAD 'START',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup


 MERGE INTO [TD].[GM_LNITMS] TGT
	 USING  
	 (SELECT 
	        [DI_SEQUENCE_NUMBER]
           ,[DI_OPERATION_TYPE]
           ,[DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[BUSINESS_TRANS]
           ,[ASSET]
           ,[SUB-NUMBER]
           ,[REFERENC_ORG_UN]
           ,[REF_TRANSACTN]
           ,[DOCUMENT_NUMBER]
           ,[BILLING_BLOCK]
           ,[BILLING_STATUS]
           ,[POSTING_DATE]
           ,[BUSINESS_AREA]
           ,[LINE_ITEM]
           ,[CO_AREA]
           ,[COMMITMENT_ITEM]
           ,[COST_CENTER]
           ,[COUNTER]
           ,[ENTERED_ON]
           ,[ENTERED_AT]
           ,[TECHNICAL_ORIGIN]
           ,[DOCUMENT_TYPE]
           ,[DOC_LINE_ITEM]
           ,[ACC_DOC_NUMBER]
           ,[FISL_DOC_TYPE]
           ,[COMPLETION_IND]
           ,[FUNCTIONAL_AREA]
           ,[FM_AREA]
           ,[FUNDS_CENTER]
           ,[GL_ACCOUNT]
           ,[ITEM_CATEGORY]
           ,[DELINDICTR]
           ,[MATERIAL]
           ,[FUNDED_PROGRAM]
           ,[NETWORK]
           ,[PREV_REF_KEY]
           ,[REFERENC_ORG_UN1]
           ,[REFERENCE_ITEM]
           ,[REF_PROCEDURE]
           ,[ORDER]
           ,[POSTING_PERIOD]
           ,[BUDGET_VALIDITY_NO]
           ,[COMPANY_CODE]
           ,[REF_TRANSACTN1]
           ,[REFERENCE_KEY]
           ,[REFERENC_DOC_CAT]
           ,[REFERENCE_ITEM1]
           ,[REF_DOCUMENT]
           ,[REFERENCE_YEAR]
           ,[FUND]
           ,[GRANT]
           ,[GRANTEE_FY]
           ,[PLAN_NO_F_OPER]
           ,[SPONSORED_CLASS]
           ,[SPONSORED_PROGRAM]
           ,[STAT_INDICATOR]
           ,[CURRENCY]
           ,[BUSINESS_TRANS1]
           ,[GM_VALUE_TYPE]
           ,[VERSION]
           ,[OR_TRANS_CURRNY]
           ,[FISCAL_YEAR]
           ,[TEXT]
           ,[USER_NAME]
           ,[WBS_ELEMENT]
           ,[WBS_ELEMENT_SH]
           ,[VALUE_DATE]
           ,[CHANGED]
           ,[FY_PERIOD]
           ,[FY_VARIANT]
           ,[QUANTITY]
           ,[AMOUNT]
           ,[ODQ_CHANGEMODE]
           ,[ODQ_ENTITYCNTR]
  FROM 
  [STG_TD_SYN].[GM_LNITMS]
								WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE
   ) SRC
	 ON
TGT.[DOC_LINE_ITEM]=SRC.[DOC_LINE_ITEM] AND
TGT.[ACC_DOC_NUMBER]=SRC.[ACC_DOC_NUMBER] AND
TGT.[CURRENCY]=SRC.[CURRENCY] AND
TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR] AND
TGT.[FY_PERIOD]=SRC.[FY_PERIOD] AND
TGT.[FY_VARIANT]=SRC.[FY_VARIANT]
WHEN MATCHED THEN 
UPDATE SET

           TGT.[DI_SEQUENCE_NUMBER]=SRC.[DI_SEQUENCE_NUMBER]
           ,TGT.[DI_OPERATION_TYPE]=SRC.[DI_OPERATION_TYPE]
           ,TGT.[DATA_AS_OF_DATE]=SRC.[DATA_AS_OF_DATE]
           ,TGT.[DS_INSERT_DATE]=SRC.[DS_INSERT_DATE]
           ,TGT.[DS_INSERT_TIME]=SRC.[DS_INSERT_TIME]
           ,TGT.[DW_STATUS_IND]=SRC.[DW_STATUS_IND]
           ,TGT.[BUSINESS_TRANS]=SRC.[BUSINESS_TRANS]
           ,TGT.[ASSET]=SRC.[ASSET]
           ,TGT.[SUB-NUMBER]=SRC.[SUB-NUMBER]
           ,TGT.[REFERENC_ORG_UN]=SRC.[REFERENC_ORG_UN]
           ,TGT.[REF_TRANSACTN]=SRC.[REF_TRANSACTN]
           ,TGT.[DOCUMENT_NUMBER]=SRC.[DOCUMENT_NUMBER]
           ,TGT.[BILLING_BLOCK]=SRC.[BILLING_BLOCK]
           ,TGT.[BILLING_STATUS]=SRC.[BILLING_STATUS]
           ,TGT.[POSTING_DATE]=SRC.[POSTING_DATE]
           ,TGT.[BUSINESS_AREA]=SRC.[BUSINESS_AREA]
           ,TGT.[LINE_ITEM]=SRC.[LINE_ITEM]
           ,TGT.[CO_AREA]=SRC.[CO_AREA]
           ,TGT.[COMMITMENT_ITEM]=SRC.[COMMITMENT_ITEM]
           ,TGT.[COST_CENTER]=SRC.[COST_CENTER]
           ,TGT.[COUNTER]=SRC.[COUNTER]
           ,TGT.[ENTERED_ON]=SRC.[ENTERED_ON]
           ,TGT.[ENTERED_AT]=SRC.[ENTERED_AT]
           ,TGT.[TECHNICAL_ORIGIN]=SRC.[TECHNICAL_ORIGIN]
           ,TGT.[DOCUMENT_TYPE]=SRC.[DOCUMENT_TYPE]
           ,TGT.[DOC_LINE_ITEM]=SRC.[DOC_LINE_ITEM]
           ,TGT.[ACC_DOC_NUMBER]=SRC.[ACC_DOC_NUMBER]
           ,TGT.[FISL_DOC_TYPE]=SRC.[FISL_DOC_TYPE]
           ,TGT.[COMPLETION_IND]=SRC.[COMPLETION_IND]
           ,TGT.[FUNCTIONAL_AREA]=SRC.[FUNCTIONAL_AREA]
           ,TGT.[FM_AREA]=SRC.[FM_AREA]
           ,TGT.[FUNDS_CENTER]=SRC.[FUNDS_CENTER]
           ,TGT.[GL_ACCOUNT]=SRC.[GL_ACCOUNT]
           ,TGT.[ITEM_CATEGORY]=SRC.[ITEM_CATEGORY]
           ,TGT.[DELINDICTR]=SRC.[DELINDICTR]
           ,TGT.[MATERIAL]=SRC.[MATERIAL]
           ,TGT.[FUNDED_PROGRAM]=SRC.[FUNDED_PROGRAM]
           ,TGT.[NETWORK]=SRC.[NETWORK]
           ,TGT.[PREV_REF_KEY]=SRC.[PREV_REF_KEY]
           ,TGT.[REFERENC_ORG_UN1]=SRC.[REFERENC_ORG_UN1]
           ,TGT.[REFERENCE_ITEM]=SRC.[REFERENCE_ITEM]
           ,TGT.[REF_PROCEDURE]=SRC.[REF_PROCEDURE]
           ,TGT.[ORDER]=SRC.[ORDER]
           ,TGT.[POSTING_PERIOD]=SRC.[POSTING_PERIOD]
           ,TGT.[BUDGET_VALIDITY_NO]=SRC.[BUDGET_VALIDITY_NO]
           ,TGT.[COMPANY_CODE]=SRC.[COMPANY_CODE]
           ,TGT.[REF_TRANSACTN1]=SRC.[REF_TRANSACTN1]
           ,TGT.[REFERENCE_KEY]=SRC.[REFERENCE_KEY]
           ,TGT.[REFERENC_DOC_CAT]=SRC.[REFERENC_DOC_CAT]
           ,TGT.[REFERENCE_ITEM1]=SRC.[REFERENCE_ITEM1]
           ,TGT.[REF_DOCUMENT]=SRC.[REF_DOCUMENT]
           ,TGT.[REFERENCE_YEAR]=SRC.[REFERENCE_YEAR]
           ,TGT.[FUND]=SRC.[FUND]
           ,TGT.[GRANT]=SRC.[GRANT]
           ,TGT.[GRANTEE_FY]=SRC.[GRANTEE_FY]
           ,TGT.[PLAN_NO_F_OPER]=SRC.[PLAN_NO_F_OPER]
           ,TGT.[SPONSORED_CLASS]=SRC.[SPONSORED_CLASS]
           ,TGT.[SPONSORED_PROGRAM]=SRC.[SPONSORED_PROGRAM]
           ,TGT.[STAT_INDICATOR]=SRC.[STAT_INDICATOR]
           ,TGT.[CURRENCY]=SRC.[CURRENCY]
           ,TGT.[BUSINESS_TRANS1]=SRC.[BUSINESS_TRANS1]
           ,TGT.[GM_VALUE_TYPE]=SRC.[GM_VALUE_TYPE]
           ,TGT.[VERSION]=SRC.[VERSION]
           ,TGT.[OR_TRANS_CURRNY]=SRC.[OR_TRANS_CURRNY]
           ,TGT.[FISCAL_YEAR]=SRC.[FISCAL_YEAR]
           ,TGT.[TEXT]=SRC.[TEXT]
           ,TGT.[USER_NAME]=SRC.[USER_NAME]
           ,TGT.[WBS_ELEMENT]=SRC.[WBS_ELEMENT]
           ,TGT.[WBS_ELEMENT_SH]=SRC.[WBS_ELEMENT_SH]
           ,TGT.[VALUE_DATE]=SRC.[VALUE_DATE]
           ,TGT.[CHANGED]=SRC.[CHANGED]
           ,TGT.[FY_PERIOD]=SRC.[FY_PERIOD]
           ,TGT.[FY_VARIANT]=SRC.[FY_VARIANT]
           ,TGT.[QUANTITY]=SRC.[QUANTITY]
           ,TGT.[AMOUNT]=SRC.[AMOUNT]
           ,TGT.[ODQ_CHANGEMODE]=SRC.[ODQ_CHANGEMODE]
           ,TGT.[ODQ_ENTITYCNTR]=SRC.[ODQ_ENTITYCNTR]
	       ,TGT.[SOURCERECORDSTATUS]='U' 
	       ,TGT.[SOURCEEFFTIMESTAMP]=GETDATE()
	
WHEN NOT MATCHED THEN
INSERT 
(
            [DI_SEQUENCE_NUMBER]
           ,[DI_OPERATION_TYPE]
           ,[DATA_AS_OF_DATE]
           ,[DS_INSERT_DATE]
           ,[DS_INSERT_TIME]
           ,[DW_STATUS_IND]
           ,[BUSINESS_TRANS]
           ,[ASSET]
           ,[SUB-NUMBER]
           ,[REFERENC_ORG_UN]
           ,[REF_TRANSACTN]
           ,[DOCUMENT_NUMBER]
           ,[BILLING_BLOCK]
           ,[BILLING_STATUS]
           ,[POSTING_DATE]
           ,[BUSINESS_AREA]
           ,[LINE_ITEM]
           ,[CO_AREA]
           ,[COMMITMENT_ITEM]
           ,[COST_CENTER]
           ,[COUNTER]
           ,[ENTERED_ON]
           ,[ENTERED_AT]
           ,[TECHNICAL_ORIGIN]
           ,[DOCUMENT_TYPE]
           ,[DOC_LINE_ITEM]
           ,[ACC_DOC_NUMBER]
           ,[FISL_DOC_TYPE]
           ,[COMPLETION_IND]
           ,[FUNCTIONAL_AREA]
           ,[FM_AREA]
           ,[FUNDS_CENTER]
           ,[GL_ACCOUNT]
           ,[ITEM_CATEGORY]
           ,[DELINDICTR]
           ,[MATERIAL]
           ,[FUNDED_PROGRAM]
           ,[NETWORK]
           ,[PREV_REF_KEY]
           ,[REFERENC_ORG_UN1]
           ,[REFERENCE_ITEM]
           ,[REF_PROCEDURE]
           ,[ORDER]
           ,[POSTING_PERIOD]
           ,[BUDGET_VALIDITY_NO]
           ,[COMPANY_CODE]
           ,[REF_TRANSACTN1]
           ,[REFERENCE_KEY]
           ,[REFERENC_DOC_CAT]
           ,[REFERENCE_ITEM1]
           ,[REF_DOCUMENT]
           ,[REFERENCE_YEAR]
           ,[FUND]
           ,[GRANT]
           ,[GRANTEE_FY]
           ,[PLAN_NO_F_OPER]
           ,[SPONSORED_CLASS]
           ,[SPONSORED_PROGRAM]
           ,[STAT_INDICATOR]
           ,[CURRENCY]
           ,[BUSINESS_TRANS1]
           ,[GM_VALUE_TYPE]
           ,[VERSION]
           ,[OR_TRANS_CURRNY]
           ,[FISCAL_YEAR]
           ,[TEXT]
           ,[USER_NAME]
           ,[WBS_ELEMENT]
           ,[WBS_ELEMENT_SH]
           ,[VALUE_DATE]
           ,[CHANGED]
           ,[FY_PERIOD]
           ,[FY_VARIANT]
           ,[QUANTITY]
           ,[AMOUNT]
           ,[ODQ_CHANGEMODE]
           ,[ODQ_ENTITYCNTR]
		   ,[SOURCEEFFTIMESTAMP] 
	       ,[SOURCEBATCHPROCESSID]
	       ,[SOURCERECORDSTATUS] 

)

VALUES( 
            SRC.[DI_SEQUENCE_NUMBER]
           ,SRC.[DI_OPERATION_TYPE]
           ,SRC.[DATA_AS_OF_DATE]
           ,SRC.[DS_INSERT_DATE]
           ,SRC.[DS_INSERT_TIME]
           ,SRC.[DW_STATUS_IND]
           ,SRC.[BUSINESS_TRANS]
           ,SRC.[ASSET]
           ,SRC.[SUB-NUMBER]
           ,SRC.[REFERENC_ORG_UN]
           ,SRC.[REF_TRANSACTN]
           ,SRC.[DOCUMENT_NUMBER]
           ,SRC.[BILLING_BLOCK]
           ,SRC.[BILLING_STATUS]
           ,SRC.[POSTING_DATE]
           ,SRC.[BUSINESS_AREA]
           ,SRC.[LINE_ITEM]
           ,SRC.[CO_AREA]
           ,SRC.[COMMITMENT_ITEM]
           ,SRC.[COST_CENTER]
           ,SRC.[COUNTER]
           ,SRC.[ENTERED_ON]
           ,SRC.[ENTERED_AT]
           ,SRC.[TECHNICAL_ORIGIN]
           ,SRC.[DOCUMENT_TYPE]
           ,SRC.[DOC_LINE_ITEM]
           ,SRC.[ACC_DOC_NUMBER]
           ,SRC.[FISL_DOC_TYPE]
           ,SRC.[COMPLETION_IND]
           ,SRC.[FUNCTIONAL_AREA]
           ,SRC.[FM_AREA]
           ,SRC.[FUNDS_CENTER]
           ,SRC.[GL_ACCOUNT]
           ,SRC.[ITEM_CATEGORY]
           ,SRC.[DELINDICTR]
           ,SRC.[MATERIAL]
           ,SRC.[FUNDED_PROGRAM]
           ,SRC.[NETWORK]
           ,SRC.[PREV_REF_KEY]
           ,SRC.[REFERENC_ORG_UN1]
           ,SRC.[REFERENCE_ITEM]
           ,SRC.[REF_PROCEDURE]
           ,SRC.[ORDER]
           ,SRC.[POSTING_PERIOD]
           ,SRC.[BUDGET_VALIDITY_NO]
           ,SRC.[COMPANY_CODE]
           ,SRC.[REF_TRANSACTN1]
           ,SRC.[REFERENCE_KEY]
           ,SRC.[REFERENC_DOC_CAT]
           ,SRC.[REFERENCE_ITEM1]
           ,SRC.[REF_DOCUMENT]
           ,SRC.[REFERENCE_YEAR]
           ,SRC.[FUND]
           ,SRC.[GRANT]
           ,SRC.[GRANTEE_FY]
           ,SRC.[PLAN_NO_F_OPER]
           ,SRC.[SPONSORED_CLASS]
           ,SRC.[SPONSORED_PROGRAM]
           ,SRC.[STAT_INDICATOR]
           ,SRC.[CURRENCY]
           ,SRC.[BUSINESS_TRANS1]
           ,SRC.[GM_VALUE_TYPE]
           ,SRC.[VERSION]
           ,SRC.[OR_TRANS_CURRNY]
           ,SRC.[FISCAL_YEAR]
           ,SRC.[TEXT]
           ,SRC.[USER_NAME]
           ,SRC.[WBS_ELEMENT]
           ,SRC.[WBS_ELEMENT_SH]
           ,SRC.[VALUE_DATE]
           ,SRC.[CHANGED]
           ,SRC.[FY_PERIOD]
           ,SRC.[FY_VARIANT]
           ,SRC.[QUANTITY]
           ,SRC.[AMOUNT]
           ,SRC.[ODQ_CHANGEMODE]
           ,SRC.[ODQ_ENTITYCNTR]
		   ,GETDATE()
	       , '1'
	       ,'L'

);

 UPDATE [STG_TD_SYN].[GM_LNITMS] SET [DW_STATUS_IND]='L' WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;

SELECT @cnt_dw=COUNT(*) FROM [TD].[GM_LNITMS] WHERE DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE;
SELECT @cnt_dif=(@cnt_stg-@cnt_dw)
SELECT @cnt_dup=COUNT(*) FROM [TD].[GM_LNITMS] WHERE [SOURCERECORDSTATUS]='U' AND DW_STATUS_IND=@DW_STATUS_IND AND [DATA_AS_OF_DATE]=@DATA_AS_OF_DATE; 

EXEC ETL.uspLOG_LOAD 'END',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup

END

END TRY 


BEGIN CATCH
-------------ERROR HANDLING AREA---------------------------------------------------------------------------------------------------------------------------------------
 SET @Error_Message = ERROR_MESSAGE() 
   EXEC ETL.uspLOG_LOAD 'FAILED',@Subject_Area,@DATA_AS_OF_DATE,@Proc_Name,@dw_object_name,@stg_object_name,@Source_Type,@Error_Message,@cnt_dw,@cnt_stg,@cnt_dif,@cnt_dup
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END CATCH

GO
USE [master]
GO
ALTER DATABASE [DMB_FOCUS_DW] SET  READ_WRITE 
GO
