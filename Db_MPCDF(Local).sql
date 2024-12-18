USE [master]
GO
/****** Object:  Database [Db_MPCDF]    Script Date: 12/13/2024 11:32:44 AM ******/
CREATE DATABASE [Db_MPCDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db_MPCDF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Db_MPCDF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_MPCDF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Db_MPCDF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Db_MPCDF] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_MPCDF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db_MPCDF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db_MPCDF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db_MPCDF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db_MPCDF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db_MPCDF] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db_MPCDF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db_MPCDF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db_MPCDF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db_MPCDF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db_MPCDF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db_MPCDF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db_MPCDF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db_MPCDF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db_MPCDF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db_MPCDF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Db_MPCDF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db_MPCDF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db_MPCDF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db_MPCDF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db_MPCDF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db_MPCDF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db_MPCDF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db_MPCDF] SET RECOVERY FULL 
GO
ALTER DATABASE [Db_MPCDF] SET  MULTI_USER 
GO
ALTER DATABASE [Db_MPCDF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db_MPCDF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db_MPCDF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db_MPCDF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db_MPCDF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db_MPCDF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Db_MPCDF', N'ON'
GO
ALTER DATABASE [Db_MPCDF] SET QUERY_STORE = ON
GO
ALTER DATABASE [Db_MPCDF] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Db_MPCDF]
GO
/****** Object:  Table [dbo].[mst_DugdhSangh]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_DugdhSangh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SanghName] [varchar](50) NOT NULL,
	[SanghCode] [varchar](5) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedByIp] [varchar](15) NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedByIp] [varchar](15) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mst_Item]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemCategory] [varchar](50) NULL,
	[ItemCode] [varchar](5) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedByIp] [varchar](15) NULL,
	[IsDelete] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedByIp] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnFormData]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnFormData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SanghCode] [varchar](5) NOT NULL,
	[ItemCode] [varchar](5) NOT NULL,
	[CurrentYear] [varchar](7) NOT NULL,
	[CurrentMonth] [tinyint] NOT NULL,
	[CurntQty] [decimal](18, 2) NULL,
	[CurntTarget] [decimal](18, 2) NULL,
	[Cumulative] [decimal](18, 2) NULL,
	[LYTarget] [decimal](18, 2) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIp] [varchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedByIp] [varchar](15) NULL,
	[IsDelete] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedByIp] [varchar](15) NULL,
	[CumulativeAchievement] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_DugdhSangh] ON 

INSERT [dbo].[mst_DugdhSangh] ([ID], [SanghName], [SanghCode], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [DeletedOn], [DeletedByIp], [IsActive], [IsDelete]) VALUES (1, N'Bhopal', N'BPL', CAST(N'2024-11-28T18:14:30.460' AS DateTime), N'::1', CAST(N'2024-11-29T16:10:03.347' AS DateTime), N'::1', NULL, NULL, 1, 0)
INSERT [dbo].[mst_DugdhSangh] ([ID], [SanghName], [SanghCode], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [DeletedOn], [DeletedByIp], [IsActive], [IsDelete]) VALUES (2, N'Indore', N'IND', CAST(N'2024-11-28T18:14:30.460' AS DateTime), N'::1', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[mst_DugdhSangh] ([ID], [SanghName], [SanghCode], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [DeletedOn], [DeletedByIp], [IsActive], [IsDelete]) VALUES (3, N'Ujjain', N'UJN', CAST(N'2024-11-28T18:14:30.460' AS DateTime), N'::1', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[mst_DugdhSangh] ([ID], [SanghName], [SanghCode], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [DeletedOn], [DeletedByIp], [IsActive], [IsDelete]) VALUES (4, N'Bundelkhand', N'BK', CAST(N'2024-11-28T18:14:30.460' AS DateTime), N'::1', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[mst_DugdhSangh] ([ID], [SanghName], [SanghCode], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [DeletedOn], [DeletedByIp], [IsActive], [IsDelete]) VALUES (5, N'Jabalpur', N'JBP', CAST(N'2024-11-28T18:14:30.460' AS DateTime), N'::1', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[mst_DugdhSangh] ([ID], [SanghName], [SanghCode], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [DeletedOn], [DeletedByIp], [IsActive], [IsDelete]) VALUES (6, N'Gwalior', N'GWL', CAST(N'2024-11-28T18:14:30.460' AS DateTime), N'::1', CAST(N'2024-11-29T10:12:14.727' AS DateTime), N'::1', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[mst_DugdhSangh] OFF
GO
SET IDENTITY_INSERT [dbo].[mst_Item] ON 

INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (1, N'STD (lit)', N'Milk', N'AB101', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-28T17:56:33.577' AS DateTime), N'::1', 1, CAST(N'2024-11-28T17:58:00.820' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (2, N'DTM (lit)', N'Milk', N'AB102', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:02.873' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (3, N'LITE  (lit)', N'Milk', N'AB103', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:04.520' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (4, N'FCM (lit)', N'Milk', N'AB104', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:05.807' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (5, N'Diamond (lit)', N'Milk', N'AB105', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:06.687' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (6, N'TM (lit)', N'Milk', N'AB106', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:07.637' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (7, N'CHAH (lit)', N'Milk', N'AB107', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:08.683' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (8, N'FCM 1L (lit)', N'Milk', N'AB108', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:09.553' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (9, N'Chai spl. 1000ML (lit)', N'Milk', N'AB109', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:10.720' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (10, N'SMP (kg)', N'Product', N'AB110', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:11.703' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (11, N'Sweeten SMP (kg)', N'Product', N'AB111', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:12.777' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (12, N'WB (kg)', N'Product', N'AB112', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:13.893' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (13, N'Plain curd (kg)', N'Product', N'AB113', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:14.733' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (14, N'Sweet Curd (kg)', N'Product', N'AB114', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:15.667' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (15, N'Salted Butter Milk 200 ML (lit)', N'Product', N'AB115', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:16.960' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (16, N'Plain Butter Milk (lit)', N'Product', N'AB116', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:17.873' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (17, N'Cold Coffee', N'Product', N'AB117', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:18.890' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (18, N'Fl.Milk Pet Bottle (lit)', N'Product', N'AB118', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 1, CAST(N'2024-11-28T17:58:20.503' AS DateTime), N'::1')
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (19, N'S.F.M Glass(Bottles) (lit)', N'Product', N'AB119', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-29T16:11:37.010' AS DateTime), N'::1', 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (20, N'Lassi 200 ML Glass (lit)', N'Product', N'AB120', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (21, N'Lite Lassi 200 ML (lit)', N'Product', N'AB121', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (22, N'Shrikhand (kg)', N'Product', N'AB122', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (23, N'Chena Rabdi (kg)', N'Product', N'AB123', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (24, N'Sabudana Kheer 100 gm (kg)', N'Product', N'AB124', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (25, N'Peda (kg)', N'Product', N'AB125', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (26, N'Milk Cake (kg)', N'Product', N'AB126', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (27, N'Mawa (kg)', N'Product', N'AB127', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (28, N'Paneer (kg)', N'Product', N'AB128', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (29, N'Vaccum Paneer (kg)', N'Product', N'AB129', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (30, N'Rasogulla (kg)', N'Product', N'AB130', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (31, N'Gulabjamun (kg)', N'Product', N'AB131', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (32, N'Shrikhand Lite 100 gms cups (kg)', N'Product', N'AB132', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (33, N'Table Butter (kg)', N'Product', N'AB133', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (34, N'Cookies (kg)', N'Product', N'AB134', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (35, N'Sugar Free Peda (kg)', N'Product', N'AB135', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (36, N'Butter Chiplet (kg)', N'Product', N'AB136', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (37, N'Besan Laddu (kg)', N'Product', N'AB137', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (38, N'Sanchi Neer lit (lit)', N'Product', N'AB138', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (39, N'Misti Doi 100gm  (kg)', N'Product', N'AB139', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (40, N'Braj Peda (kg)', N'Product', N'AB140', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (41, N'Amrakhand 100 gms (kg)', N'Product', N'AB141', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (42, N'Tender Coconut Water 200 ml (lit)', N'Product', N'AB142', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (43, N'WMP (lit)', N'Product', N'AB143', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (44, N'Ghee 200g', N'Product', N'AB144', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (45, N'Ghee 500ml', N'Product', N'AB145', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (46, N'Ghee 1 lit', N'Product', N'AB146', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (47, N'Ghee 5 lit', N'Product', N'AB147', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (48, N'Ghee 15 kg', N'Product', N'AB148', 1, CAST(N'2024-11-27T18:08:12.980' AS DateTime), N'::1', CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL, 0, CAST(N'2024-11-27T18:08:12.980' AS DateTime), NULL)
INSERT [dbo].[mst_Item] ([ItemID], [ItemName], [ItemCategory], [ItemCode], [IsActive], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp]) VALUES (49, N'Packet Milk', N'Milk', N'AB001', 1, CAST(N'2024-11-29T10:58:59.767' AS DateTime), N'::1', CAST(N'2024-11-29T10:58:59.767' AS DateTime), NULL, 0, CAST(N'2024-11-29T10:58:59.767' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[mst_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[trnFormData] ON 

INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (5, N'BPL', N'AB105', N'2017-18', 7, CAST(374.10 AS Decimal(18, 2)), CAST(111.00 AS Decimal(18, 2)), CAST(411.51 AS Decimal(18, 2)), CAST(309.17 AS Decimal(18, 2)), CAST(N'2024-11-28T15:10:52.183' AS DateTime), N'::1', CAST(N'2024-11-28T17:17:20.457' AS DateTime), N'::1', 1, CAST(N'2024-11-29T10:32:38.530' AS DateTime), N'::1', CAST(306.17 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (6, N'BPL', N'AB144', N'2020-21', 7, CAST(113.10 AS Decimal(18, 2)), CAST(124.41 AS Decimal(18, 2)), CAST(124.41 AS Decimal(18, 2)), CAST(62.30 AS Decimal(18, 2)), CAST(N'2024-11-28T15:13:09.793' AS DateTime), N'::1', CAST(N'2024-11-28T15:13:09.793' AS DateTime), NULL, 1, CAST(N'2024-11-29T10:32:36.913' AS DateTime), N'::1', CAST(71.57 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (7, N'BPL', N'AB133', N'2022-23', 7, CAST(0.80 AS Decimal(18, 2)), CAST(0.88 AS Decimal(18, 2)), CAST(0.88 AS Decimal(18, 2)), CAST(0.64 AS Decimal(18, 2)), CAST(N'2024-11-28T15:35:40.850' AS DateTime), N'::1', CAST(N'2024-11-28T15:35:40.850' AS DateTime), NULL, 1, CAST(N'2024-11-29T10:32:40.280' AS DateTime), N'::1', CAST(0.65 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (10, N'BPL', N'AB144', N'2010-11', 1, CAST(374.10 AS Decimal(18, 2)), CAST(411.51 AS Decimal(18, 2)), CAST(411.51 AS Decimal(18, 2)), CAST(309.17 AS Decimal(18, 2)), CAST(N'2024-11-29T10:34:28.677' AS DateTime), N'::1', CAST(N'2024-11-29T10:34:28.677' AS DateTime), NULL, 0, NULL, NULL, CAST(306.17 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (13, N'BPL', N'AB119', N'2011-12', 1, CAST(255.80 AS Decimal(18, 2)), CAST(281.38 AS Decimal(18, 2)), CAST(281.38 AS Decimal(18, 2)), CAST(241.09 AS Decimal(18, 2)), CAST(N'2024-11-29T15:45:04.833' AS DateTime), N'::1', CAST(N'2024-11-29T15:45:04.833' AS DateTime), NULL, 0, NULL, NULL, CAST(226.51 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (17, N'IND', N'AB001', N'2012-13', 2, CAST(4.70 AS Decimal(18, 2)), CAST(5.17 AS Decimal(18, 2)), CAST(5.17 AS Decimal(18, 2)), CAST(3.61 AS Decimal(18, 2)), CAST(N'2024-11-29T16:02:21.133' AS DateTime), N'::1', CAST(N'2024-11-29T16:02:21.133' AS DateTime), NULL, 0, NULL, NULL, CAST(3.71 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (18, N'BPL', N'AB148', N'2010-11', 2, CAST(16.30 AS Decimal(18, 2)), CAST(17.93 AS Decimal(18, 2)), CAST(17.93 AS Decimal(18, 2)), CAST(16.31 AS Decimal(18, 2)), CAST(N'2024-11-29T16:03:30.610' AS DateTime), N'::1', CAST(N'2024-11-29T16:03:30.610' AS DateTime), NULL, 0, NULL, NULL, CAST(16.71 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (19, N'BPL', N'AB121', N'2013-14', 3, CAST(70.10 AS Decimal(18, 2)), CAST(77.11 AS Decimal(18, 2)), CAST(77.11 AS Decimal(18, 2)), CAST(62.69 AS Decimal(18, 2)), CAST(N'2024-11-29T16:04:38.847' AS DateTime), N'::1', CAST(N'2024-11-29T16:04:38.847' AS DateTime), NULL, 0, NULL, NULL, CAST(58.18 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (21, N'BPL', N'AB141', N'2012-13', 3, CAST(5.20 AS Decimal(18, 2)), CAST(5.72 AS Decimal(18, 2)), CAST(5.72 AS Decimal(18, 2)), CAST(5.20 AS Decimal(18, 2)), CAST(N'2024-11-29T16:13:16.313' AS DateTime), N'::1', CAST(N'2024-11-29T16:13:16.313' AS DateTime), NULL, 0, NULL, NULL, CAST(4.70 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (22, N'BPL', N'AB120', N'2010-11', 3, CAST(1.20 AS Decimal(18, 2)), CAST(1.32 AS Decimal(18, 2)), CAST(1.32 AS Decimal(18, 2)), CAST(0.35 AS Decimal(18, 2)), CAST(N'2024-11-29T16:16:59.530' AS DateTime), N'::1', CAST(N'2024-11-29T16:16:59.530' AS DateTime), NULL, 0, NULL, NULL, CAST(0.51 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (24, N'BPL', N'AB141', N'2011-12', 2, CAST(0.07 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)), CAST(0.08 AS Decimal(18, 2)), CAST(0.07 AS Decimal(18, 2)), CAST(N'2024-11-29T16:19:46.047' AS DateTime), N'::1', CAST(N'2024-11-29T18:41:02.053' AS DateTime), N'::1', 0, NULL, NULL, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (8, N'BPL', N'AB123', N'2010-11', 5, CAST(100.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(N'2024-11-29T10:27:01.760' AS DateTime), N'::1', CAST(N'2024-11-29T10:27:01.760' AS DateTime), NULL, 1, CAST(N'2024-11-29T10:32:39.207' AS DateTime), N'::1', CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (9, N'IND', N'AB126', N'2012-13', 2, CAST(374.10 AS Decimal(18, 2)), CAST(411.51 AS Decimal(18, 2)), CAST(411.51 AS Decimal(18, 2)), CAST(309.17 AS Decimal(18, 2)), CAST(N'2024-11-29T10:30:51.240' AS DateTime), N'::1', CAST(N'2024-11-29T10:32:18.823' AS DateTime), N'::1', 1, CAST(N'2024-11-29T10:32:39.820' AS DateTime), N'::1', CAST(306.17 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (11, N'IND', N'AB119', N'2010-11', 1, CAST(113.10 AS Decimal(18, 2)), CAST(124.41 AS Decimal(18, 2)), CAST(124.41 AS Decimal(18, 2)), CAST(62.30 AS Decimal(18, 2)), CAST(N'2024-11-29T10:35:24.557' AS DateTime), N'::1', CAST(N'2024-11-29T10:35:24.557' AS DateTime), NULL, 0, NULL, NULL, CAST(71.57 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (12, N'BPL', N'AB119', N'2010-11', 1, CAST(0.80 AS Decimal(18, 2)), CAST(0.88 AS Decimal(18, 2)), CAST(0.88 AS Decimal(18, 2)), CAST(0.64 AS Decimal(18, 2)), CAST(N'2024-11-29T10:36:06.183' AS DateTime), N'::1', CAST(N'2024-11-29T10:36:06.183' AS DateTime), NULL, 0, NULL, NULL, CAST(0.65 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (14, N'IND', N'AB120', N'2011-12', 2, CAST(6.90 AS Decimal(18, 2)), CAST(7.59 AS Decimal(18, 2)), CAST(7.59 AS Decimal(18, 2)), CAST(2.04 AS Decimal(18, 2)), CAST(N'2024-11-29T15:45:54.683' AS DateTime), N'::1', CAST(N'2024-11-29T15:45:54.683' AS DateTime), NULL, 0, NULL, NULL, CAST(2.28 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (15, N'BPL', N'AB120', N'2011-12', 2, CAST(9.90 AS Decimal(18, 2)), CAST(10.89 AS Decimal(18, 2)), CAST(10.89 AS Decimal(18, 2)), CAST(9.83 AS Decimal(18, 2)), CAST(N'2024-11-29T15:47:25.737' AS DateTime), N'::1', CAST(N'2024-11-29T15:47:25.737' AS DateTime), NULL, 0, NULL, NULL, CAST(8.77 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (16, N'BPL', N'AB119', N'2010-11', 2, CAST(7.40 AS Decimal(18, 2)), CAST(8.14 AS Decimal(18, 2)), CAST(8.14 AS Decimal(18, 2)), CAST(7.35 AS Decimal(18, 2)), CAST(N'2024-11-29T15:49:28.873' AS DateTime), N'::1', CAST(N'2024-11-29T16:17:26.610' AS DateTime), N'::1', 0, NULL, NULL, CAST(5.90 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (20, N'BPL', N'AB145', N'2011-12', 4, CAST(8.60 AS Decimal(18, 2)), CAST(9.46 AS Decimal(18, 2)), CAST(9.46 AS Decimal(18, 2)), CAST(7.17 AS Decimal(18, 2)), CAST(N'2024-11-29T16:06:36.113' AS DateTime), N'::1', CAST(N'2024-11-29T16:06:36.113' AS DateTime), NULL, 0, NULL, NULL, CAST(9.08 AS Decimal(18, 2)))
INSERT [dbo].[trnFormData] ([ID], [SanghCode], [ItemCode], [CurrentYear], [CurrentMonth], [CurntQty], [CurntTarget], [Cumulative], [LYTarget], [CreatedOn], [CreatedByIp], [UpdatedOn], [UpdatedByIp], [IsDelete], [DeletedOn], [DeletedByIp], [CumulativeAchievement]) VALUES (23, N'BPL', N'AB120', N'2024-25', 3, CAST(1.36 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(0.82 AS Decimal(18, 2)), CAST(N'2024-11-29T16:18:29.870' AS DateTime), N'::1', CAST(N'2024-11-29T16:18:29.870' AS DateTime), NULL, 0, NULL, NULL, CAST(0.85 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[trnFormData] OFF
GO
ALTER TABLE [dbo].[mst_DugdhSangh] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[mst_Item] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[mst_Item] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[mst_Item] ADD  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[mst_Item] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[mst_Item] ADD  DEFAULT (getdate()) FOR [DeletedOn]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT ((0)) FOR [CurntQty]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT ((0)) FOR [CurntTarget]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT ((0)) FOR [Cumulative]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT ((0)) FOR [LYTarget]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[trnFormData] ADD  DEFAULT ((0)) FOR [CumulativeAchievement]
GO
ALTER TABLE [dbo].[trnFormData]  WITH CHECK ADD CHECK  (([CurrentMonth]>=(1) AND [CurrentMonth]<=(12)))
GO
/****** Object:  StoredProcedure [dbo].[GetItemsByCategory]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc  [dbo].[GetItemsByCategory]
  @ItemCategory varchar(50) =null
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
        SELECT [ItemName] [Name],ItemCode [Id] FROM [mst_Item] 
        WHERE ([ItemCategory] = @ItemCategory OR @ItemCategory IS NULL  )
		AND IsActive=1 and IsDelete!=1

		SELECT	@status =1 ,@msg='Item Name selected Successfully'	 
		SELECT	@status [status] ,@msg [msg]
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		SELECT	@status [status] ,@msg [msg]
    END CATCH;
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddFormData]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[usp_AddFormData]
	@SanghCode				Varchar(5)  ,
	@ItemCode				Varchar(5),
	@CurrentYear			VARCHAR(7)  ,
	@CurrentMonth			TINYINT ,
	@CurntQty				Decimal(18,2) ,
	@CurntTarget			Decimal(18,2),
	@Cumulative				Decimal(18,2) ,
	@LYTarget				Decimal(18,2) ,
	@CumulativeAchievement  Decimal(18,2) ,
	@CreatedByIp			varchar(15)     
  as
  begin
	declare 
	@status bit=0 ,
	@msg varchar(100)=null
	
	BEGIN TRY
		BEGIN TRANSACTION
		
		insert into trnFormData(
		SanghCode		
		,ItemCode		
		,CurrentYear	
		,CurrentMonth	
		,CurntQty		
		,CurntTarget	
		,Cumulative		
		,LYTarget	
		,CumulativeAchievement
		,CreatedByIp
		,CreatedOn
		)
		values (
		 @SanghCode		
		,@ItemCode		
		,@CurrentYear	
		,@CurrentMonth	
		,@CurntQty		
		,@CurntTarget	
		,@Cumulative		
		,@LYTarget
		,@CumulativeAchievement
		,@CreatedByIp
		,getdate())

		SELECT	@status =1 ,@msg='Record Saved Successfully'	 	
		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end

GO
/****** Object:  StoredProcedure [dbo].[usp_AddItem]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[usp_AddItem]

	@ItemName 				varchar(50),
	@ItemCategory			varchar(50),
	@ItemCode				varchar(5),
	@IsActive				bit,
	@CreatedByIp			varchar(15)     
  as
  begin
	declare 
	@status bit=0 ,
	@msg varchar(100)=null
	
	BEGIN TRY
		BEGIN TRANSACTION
		if not exists(select 1 from mst_Item where ItemCode =@ItemCode)
		begin
		insert into mst_Item(
				 ItemName
				,ItemCategory
				,ItemCode
				,IsActive
				,CreatedByIp		
				)
				values (
				@ItemName 		
				,@ItemCategory	
				,@ItemCode		
				,@IsActive		
				,@CreatedByIp
				)

		SELECT	@status =1 ,@msg='Record Saved Successfully'	 	
		end
		else
		begin
		set @status =0 
		set @msg='Record Already Exists'	
		end
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end

GO
/****** Object:  StoredProcedure [dbo].[usp_AddSangh]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[usp_AddSangh]
	@SanghName  varchar(50),
	@SanghCode	varchar(5),
	@CreatedByIp varchar(15),
	@IsActive   bit
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
		if not exists(select 1 from mst_DugdhSangh where SanghCode =@SanghCode)
		begin

			insert into mst_DugdhSangh(SanghName,SanghCode,IsActive,CreatedByIp,CreatedOn)
			values(@SanghName,@SanghCode,@IsActive,@CreatedByIp,GETDATE())
     

			set 	@status =1 
			set @msg='Record Saved Successfully'	 
			
		end
		else
		begin
			set @status =0 
			set @msg='Record Already Exists'	
		end
	END TRY
    BEGIN CATCH          
		set @status =0 
		set @msg=ERROR_MESSAGE()	 
		
    END CATCH;
	SELECT	@status [status] ,@msg [msg]
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteFormData]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DeleteFormData]
	@Id						int,
    @DeletedByIp            VARCHAR(15)
AS
BEGIN
    DECLARE 
        @status BIT = 0,
        @msg VARCHAR(100) = NULL;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Update statement to update existing records
        UPDATE trnFormData
        SET   
			IsDelete=1,
			DeletedByIp= @DeletedByIp,
			DeletedOn=GETDATE()
        WHERE ID=@Id
                   
            SET @status = 1;
            SET @msg = 'Record Deleted Successfully';
       

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT @status = 0, @msg = ERROR_MESSAGE();
    END CATCH;

    SELECT @status AS [status], @msg AS [msg];
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteItem]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[usp_DeleteItem]
	@ItemID					int,
	@DeletedByIp			varchar(15)     
  as
  begin
	declare 
	@status bit=0 ,
	@msg varchar(100)=null
	
	BEGIN TRY
		BEGIN TRANSACTION
		update  mst_Item
			set IsActive=0
			,IsDelete=1
				,DeletedByIp	=@DeletedByIp
				,DeletedOn	   	=GETDATE()
				where ItemID=@ItemID

		SELECT	@status =1 ,@msg='Record Deleted Successfully'	 	
		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSangh]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[usp_DeleteSangh]
	@id				int,
	@DeletedByIp	varchar(15)
	
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
  update mst_DugdhSangh
 set
 IsActive=0,
  IsDelete		=1
  ,DeletedByIp		=@DeletedByIp
  ,DeletedOn		=GETDATE()
  where ID=@id
  
		SELECT	@status =1 ,@msg='Record Deleted Successfully'	 
		SELECT	@status [status] ,@msg [msg]
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		SELECT	@status [status] ,@msg [msg]
    END CATCH;
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllDugdhSanghs]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc  [dbo].[Usp_GetAllDugdhSanghs]
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
        SELECT  
			ID
			,SanghName
			,SanghCode
			,IsActive
		FROM mst_DugdhSangh 
        WHERE  IsDelete!=1

		SELECT	@status =1 ,@msg='Sangh Name selected Successfully'	 
		SELECT	@status [status] ,@msg [msg]
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		SELECT	@status [status] ,@msg [msg]
    END CATCH;
  end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetDugdhSangh]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  proc  [dbo].[Usp_GetDugdhSangh]
@SanghCode varchar(5) =null
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
        SELECT SanghName [Name],SanghCode [Id] FROM mst_DugdhSangh 
        WHERE (@SanghCode IS NULL OR SanghCode = @SanghCode)
		and IsActive=1 and IsDelete!=1

		SELECT	@status =1 ,@msg='Sangh Name selected Successfully'	 
		SELECT	@status [status] ,@msg [msg]
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		SELECT	@status [status] ,@msg [msg]
    END CATCH;
  end


GO
/****** Object:  StoredProcedure [dbo].[Usp_GetFormData]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[Usp_GetFormData]
	@CurrentYear varchar(7)=null,
	@CurrentMonth tinyint=null
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY
        if (@CurrentYear='')
			BEGIN
			 select @CurrentYear=null;
			END
		if (@CurrentMonth>12or @CurrentMonth<1)
			BEGIN
			 select @CurrentMonth=null;
			END
		SELECT 
			fd.Id,
			fd.ItemCode,
			i.ItemName, 
			fd.SanghCode,
			ds.SanghName,
			CurrentYear,
			DateName(month, DateAdd(month, CurrentMonth, -1)) AS CurrentMonth,
			CurntQty,
			CurntTarget,
			Cumulative,
			CumulativeAchievement,
			convert(decimal(18,2),((CumulativeAchievement / CurntTarget) * 100)) AS Achievement,
			LYTarget,
			convert(decimal(18,2),(((CumulativeAchievement-LYTarget)/LYTarget) * 100)) AS Growth,
			convert(decimal(18,2),((CumulativeAchievement/LYTarget) * 100)-100) AS Growth2
		FROM 
			trnFormData AS fd
		INNER JOIN 
			mst_DugdhSangh AS ds ON ds.SanghCode = fd.SanghCode and ds.IsActive=1 
		INNER JOIN 
			mst_Item AS i ON i.ItemCode = fd.ItemCode and i.IsActive=1 
			where (fd.CurrentYear= @CurrentYear or @CurrentYear is null)and (fd.CurrentMonth=@CurrentMonth or @CurrentMonth is null)
			and fd.IsDelete!=1
			order by fd.CreatedOn


		SELECT	@status =1 ,@msg='Sangh Name selected Successfully'	 
		SELECT	@status [status] ,@msg [msg]
	END TRY
    BEGIN CATCH          
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		SELECT	@status [status] ,@msg [msg]
    END CATCH;
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetItems]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc  [dbo].[usp_GetItems]
  as
  begin
	declare 
	@status bit=0 ,
	@msg varchar(100)=null
	
	BEGIN TRY
		BEGIN TRANSACTION
		select ItemID
			,ItemName
			,ItemCategory
			,ItemCode
			,IsActive 
		from mst_Item 
		where IsDelete!=1

		SELECT	@status =1 ,@msg='Record selected Successfully'	 	
		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateFormData]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[usp_UpdateFormData]
	@Id						int,
    @SanghCode              VARCHAR(5),
    @ItemCode               VARCHAR(5),
    @CurrentYear            VARCHAR(7),
    @CurrentMonth           TINYINT,
    @CurntQty               DECIMAL(18,2),
    @CurntTarget            DECIMAL(18,2),
    @Cumulative             DECIMAL(18,2),
    @LYTarget               DECIMAL(18,2),
    @CumulativeAchievement  DECIMAL(18,2),
    @UpdatedByIp            VARCHAR(15)
AS
BEGIN
    DECLARE 
        @status BIT = 0,
        @msg VARCHAR(100) = NULL;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Update statement to update existing records
        UPDATE trnFormData
        SET   
			SanghCode = @SanghCode,
			ItemCode = @ItemCode,
			CurrentYear = @CurrentYear,
			CurrentMonth = @CurrentMonth,
			CurntQty = @CurntQty,
			CurntTarget = @CurntTarget,
			Cumulative = @Cumulative,
			LYTarget = @LYTarget,
			CumulativeAchievement = @CumulativeAchievement,
			UpdatedByIp = @UpdatedByIp,
			UpdatedOn=GETDATE()
        WHERE ID=@Id
           
        
            SET @status = 1;
            SET @msg = 'Record Updated Successfully';
       

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT @status = 0, @msg = ERROR_MESSAGE();
    END CATCH;

    SELECT @status AS [status], @msg AS [msg];
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateItem]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[usp_UpdateItem]
	@ItemID					int,
	@ItemName 				varchar(50),
	@ItemCategory			varchar(50),
	@ItemCode				varchar(5),
	@IsActive				bit,
	@UpdatedByIp			varchar(15)     
  as
  begin
	declare 
	@status bit=0 ,
	@msg varchar(100)=null
	
	BEGIN TRY
		BEGIN TRANSACTION
		if not exists(select 1 from mst_Item where ItemCode =@ItemCode and ItemID!=@ItemID)
		begin
		update  mst_Item
			set ItemName			=@ItemName 		
				,ItemCategory	    =@ItemCategory	
				,ItemCode		    =@ItemCode		
				,IsActive		    =@IsActive		
				,UpdatedByIp	    =@UpdatedByIp
				,UpdatedOn			=GETDATE()
				where ItemID=@ItemID

		SELECT	@status =1 ,@msg='Record updated Successfully'	 	
		end
		else
		begin
			set @status =0 
			set @msg='Record Already Exists'	
		end
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT	@status =0 ,@msg=ERROR_MESSAGE()	
	END CATCH;
	SELECT @status AS [status], @msg AS [msg];
  end

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSangh]    Script Date: 12/13/2024 11:32:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc  [dbo].[usp_UpdateSangh]
	@id				int,
	@SanghName		varchar(50),
	@SanghCode		varchar(5),
	@UpdatedByIp	varchar(15),
	@IsActive		bit
  as
  begin
  declare @status bit=0 ,@msg varchar(100)=null
  BEGIN TRY

		if not exists(select 1 from mst_DugdhSangh where SanghCode =@SanghCode and ID !=@id)
			begin

				update mst_DugdhSangh
				set  SanghName		=@SanghName
				,SanghCode		=@SanghCode
				,IsActive			=@IsActive
				,UpdatedByIp		=@UpdatedByIp
				,UpdatedOn		=GETDATE()
				where ID=@id
  
				set	@status =1 
				set @msg='Record Updated Successfully'	 
			
			end
		else
			begin
				set @status =0 
				set @msg='Record Already Exists'	
			end
	END TRY
    BEGIN CATCH          
		set	@status =0 
		set @msg=ERROR_MESSAGE()	 
		
    END CATCH;
	SELECT	@status [status] ,@msg [msg]
  end
GO
USE [master]
GO
ALTER DATABASE [Db_MPCDF] SET  READ_WRITE 
GO
