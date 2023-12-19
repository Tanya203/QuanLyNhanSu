USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 7/11/2023 4:31:07 AM ******/
CREATE DATABASE [QuanLyNhanSu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhanSu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu.mdf' , SIZE = 6208KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhanSu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu_log.ldf' , SIZE = 3200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyNhanSu] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhanSu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNhanSu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNhanSu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNhanSu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNhanSu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyNhanSu]
GO
/****** Object:  Table [dbo].[Allowance]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allowance](
	[AL_ID] [varchar](15) NOT NULL,
	[AllowanceName] [nvarchar](50) NULL,
	[Amount] [decimal](38, 3) NOT NULL,
 CONSTRAINT [PK_Allowance] PRIMARY KEY CLUSTERED 
(
	[AL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllowanceDetail]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllowanceDetail](
	[StaffID] [varchar](15) NOT NULL,
	[AL_ID] [varchar](15) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_AllowanceDetail] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC,
	[AL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authority]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authority](
	[AU_ID] [varchar](15) NOT NULL,
	[IT_ID] [varchar](15) NOT NULL,
	[AuthorityName] [nvarchar](100) NULL,
 CONSTRAINT [PK_QuyenHan_1] PRIMARY KEY CLUSTERED 
(
	[AU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorizations]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorizations](
	[PS_ID] [varchar](15) NOT NULL,
	[AU_ID] [varchar](15) NOT NULL,
	[Authorize] [bit] NOT NULL,
 CONSTRAINT [PK_Authorizations] PRIMARY KEY CLUSTERED 
(
	[PS_ID] ASC,
	[AU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardID] [varchar](15) NOT NULL,
	[CT_ID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NULL,
	[DateCreated] [date] NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardDetail]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDetail](
	[CardID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[Amount] [decimal](38, 3) NOT NULL,
	[Deliver] [decimal](38, 3) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_CardDetail] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC,
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CT_ID] [varchar](15) NOT NULL,
	[CardTypeName] [nvarchar](100) NULL,
	[CaculateMethod] [nvarchar](100) NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[CT_ID] [varchar](15) NOT NULL,
	[TKM_ID] [varchar](15) NULL,
	[ContractTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_ContractType] PRIMARY KEY CLUSTERED 
(
	[CT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DP_ID] [varchar](15) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interface]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interface](
	[IT_ID] [varchar](15) NOT NULL,
	[InterfaceName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Interface] PRIMARY KEY CLUSTERED 
(
	[IT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Month]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[MonthID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthSalaryDetail]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthSalaryDetail](
	[MonthID] [varchar](20) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[BasicSalary] [decimal](38, 3) NOT NULL,
	[TotalAllowance] [decimal](38, 3) NOT NULL,
 CONSTRAINT [PK_MonthSalaryDetail] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC,
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperateHistory]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperateHistory](
	[DateTime] [varchar](100) NOT NULL,
	[StaffID] [varchar](15) NULL,
	[OP_ID] [varchar](15) NULL,
	[DetailOperation] [nvarchar](4000) NULL,
 CONSTRAINT [PK_OperateHistory] PRIMARY KEY CLUSTERED 
(
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[OP_ID] [varchar](15) NOT NULL,
	[IT_ID] [varchar](15) NULL,
	[OperationName] [nvarchar](100) NULL,
 CONSTRAINT [PK_OperationHistory] PRIMARY KEY CLUSTERED 
(
	[OP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PS_ID] [varchar](15) NOT NULL,
	[DP_ID] [varchar](15) NULL,
	[PositionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftID] [varchar](15) NOT NULL,
	[ShiftName] [nvarchar](50) NULL,
	[BeginTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftType]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftType](
	[ST_ID] [varchar](15) NOT NULL,
	[ShiftTypeName] [nvarchar](50) NULL,
	[SalaryCoefficient] [decimal](38, 3) NOT NULL,
 CONSTRAINT [PK_ShiftType] PRIMARY KEY CLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [varchar](15) NOT NULL,
	[PS_ID] [varchar](15) NOT NULL,
	[CT_ID] [varchar](15) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[CardID] [varchar](12) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[MiddleName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](20) NULL,
	[Brithday] [date] NOT NULL,
	[HouseNumber] [varchar](20) NULL,
	[Street] [nvarchar](100) NULL,
	[Ward] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[Province_City] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[EducationLevel] [nvarchar](50) NULL,
	[EntryDate] [date] NOT NULL,
	[ContractDuration] [date] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[DayOffAmount] [int] NOT NULL,
	[BasicSalary] [decimal](38, 3) NOT NULL,
	[Picture] [image] NULL,
	[LockDate] [datetime] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeKeeping]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeKeeping](
	[WS_ID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[ShiftID] [varchar](15) NOT NULL,
	[ST_ID] [varchar](15) NOT NULL,
	[AbsenceUse] [bit] NOT NULL,
	[CheckInTime] [time](0) NULL,
	[CheckOutTime] [time](0) NULL,
 CONSTRAINT [PK_TimeKeeping] PRIMARY KEY CLUSTERED 
(
	[WS_ID] ASC,
	[StaffID] ASC,
	[ShiftID] ASC,
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeKeepingMethod]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeKeepingMethod](
	[TKM_ID] [varchar](15) NOT NULL,
	[TimeKeepingMethodName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TimeKeepingMethod] PRIMARY KEY CLUSTERED 
(
	[TKM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkSchedule]    Script Date: 7/11/2023 4:31:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkSchedule](
	[WS_ID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NULL,
	[WorkDate] [date] NOT NULL,
 CONSTRAINT [PK_WorkSchedule] PRIMARY KEY CLUSTERED 
(
	[WS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Allowance] ([AL_ID], [AllowanceName], [Amount]) VALUES (N'AL0000000001', N'Lưu động', CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[Allowance] ([AL_ID], [AllowanceName], [Amount]) VALUES (N'AL0000000002', N'Trưởng phòng', CAST(2000000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[Allowance] ([AL_ID], [AllowanceName], [Amount]) VALUES (N'AL0000000003', N'Phó phòng', CAST(1500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000001', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000002', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000003', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000004', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000005', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000006', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000007', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000008', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000009', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000010', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000011', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000012', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000013', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000014', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000015', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000016', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000017', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000018', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000019', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000020', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000021', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000022', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000023', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000024', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000025', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000026', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000027', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000028', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000029', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000030', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000031', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000032', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000033', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000034', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000035', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000036', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000037', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000038', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000039', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000040', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000041', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000042', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000043', N'AL0000000001', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000044', N'AL0000000001', NULL)
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000001', N'IT0000000003', N'Truy cập nhân viên')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000002', N'IT0000000003', N'Truy cập phòng ban')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000003', N'IT0000000003', N'Truy cập chức vụ')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000004', N'IT0000000003', N'Truy cập ca')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000005', N'IT0000000003', N'Truy cập lịch làm việc')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000006', N'IT0000000003', N'Truy cập phụ cấp')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000007', N'IT0000000003', N'Truy cập phiếu')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000008', N'IT0000000003', N'Truy cập thống kê')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000009', N'IT0000000003', N'Truy cập loại hợp đồng')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000010', N'IT0000000003', N'Truy cập phân quyền')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000011', N'IT0000000003', N'Truy cập lịch sử thao tác')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000012', N'IT0000000004', N'Thao tác quản lý nhân viên')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000014', N'IT0000000005', N'Thao tác quản lý phòng ban')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000015', N'IT0000000006', N'Thao tác quản lý chức vụ')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000016', N'IT0000000007', N'Thao tác quản lý ca')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000017', N'IT0000000016', N'Thao tác quản lý loại ca')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000018', N'IT0000000008', N'Thao tác quản lý lịch làm việc')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000019', N'IT0000000017', N'Thao tác quản lý chi tiết lịch làm việc')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000020', N'IT0000000009', N'Thao tác quản lý phụ cấp')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000021', N'IT0000000009', N'Truy cập chi tiết phụ cấp')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000022', N'IT0000000018', N'Thao tác quản lý chi tiết phụ cấp')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000023', N'IT0000000010', N'Thao tác quản lý phiếu')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000024', N'IT0000000010', N'Truy cập loại phiếu')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000025', N'IT0000000020', N'Thao tác quản lý chi tiết phiếu')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000027', N'IT0000000012', N'Thao tác quản lý loại hợp đồng')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000028', N'IT0000000013', N'Thao tác phân quyền')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000029', N'IT0000000007', N'Truy cập loại ca')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000031', N'IT0000000022', N'Thao tác quản lý loại phiếu')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000032', N'IT0000000003', N'Truy cập thưởng - nợ')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000033', N'IT0000000023', N'Thao tác quản lý thưởng - nợ')
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000002', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000003', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000006', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000007', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000009', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000010', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000011', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000012', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000014', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000015', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000016', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000017', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000020', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000021', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000022', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000023', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000024', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000025', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000027', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000028', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000029', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000031', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000002', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000003', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000006', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000007', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000009', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000010', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000011', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000012', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000014', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000015', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000016', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000017', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000020', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000021', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000022', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000023', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000024', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000025', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000027', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000028', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000029', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000031', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000002', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000003', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000006', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000007', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000009', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000010', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000011', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000012', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000014', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000015', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000016', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000017', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000020', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000021', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000022', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000023', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000024', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000025', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000027', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000028', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000029', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000031', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000011', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000011', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000002', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000003', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000009', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000012', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000014', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000015', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000027', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000002', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000003', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000009', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000012', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000014', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000015', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000027', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000001', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000002', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000003', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000009', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000006', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000007', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000020', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000021', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000022', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000023', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000024', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000025', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000031', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000007', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000022', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000023', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000024', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000025', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000029', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000031', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000006', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000007', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000008', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000021', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000022', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000023', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000025', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000005', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000018', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000019', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000004', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000033', 0)
GO
INSERT [dbo].[CardType] ([CT_ID], [CardTypeName], [CaculateMethod]) VALUES (N'CT0000000001', N'Thưởng', N'Cộng')
GO
INSERT [dbo].[CardType] ([CT_ID], [CardTypeName], [CaculateMethod]) VALUES (N'CT0000000002', N'Phạt', N'Trừ')
GO
INSERT [dbo].[CardType] ([CT_ID], [CardTypeName], [CaculateMethod]) VALUES (N'CT0000000003', N'Ứng lương', N'Trừ')
GO
INSERT [dbo].[ContractType] ([CT_ID], [TKM_ID], [ContractTypeName]) VALUES (N'CT0000000001', N'TKM0000000001', N'Chính thức')
GO
INSERT [dbo].[ContractType] ([CT_ID], [TKM_ID], [ContractTypeName]) VALUES (N'CT0000000002', N'TKM0000000002', N'Ngắn hạn')
GO
INSERT [dbo].[ContractType] ([CT_ID], [TKM_ID], [ContractTypeName]) VALUES (N'CT0000000003', N'TKM0000000002', N'Thực tập')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000007', N'Bảo vệ')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000001', N'Giám đốc')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000004', N'Hành chính')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000002', N'Kỹ thuật')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000003', N'Nhân sự')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000006', N'Sản xuất')
GO
INSERT [dbo].[Department] ([DP_ID], [DepartmentName]) VALUES (N'DP0000000005', N'Tài chính - Kế toán')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000007', N'Ca')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000021', N'Chấm công')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000017', N'Chi tiết lịch làm việc')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000020', N'Chi tiết phiếu')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000018', N'Chi tiết phụ cấp')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000019', N'Chi tiết phụ cấp nhân viên')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000006', N'Chức vụ')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000001', N'Đăng nhập')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000008', N'Lịch làm việc')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000014', N'Lịch sử thao tác')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000016', N'Loại ca')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000012', N'Loại hợp đồng')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000022', N'Loại phiếu')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000003', N'Màn hình chính')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000004', N'Nhân viên')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000013', N'Phân quyền')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000010', N'Phiếu')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000005', N'Phòng ban')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000009', N'Phụ cấp')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000002', N'Quên mật khẩu')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000015', N'Tài khoản')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000011', N'Thống kê')
GO
INSERT [dbo].[Interface] ([IT_ID], [InterfaceName]) VALUES (N'IT0000000023', N'Thưởng - nợ')
GO
INSERT [dbo].[Month] ([MonthID]) VALUES (N'2023-11')
GO
INSERT [dbo].[Month] ([MonthID]) VALUES (N'2023-12')
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000001', CAST(180000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000002', CAST(160000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000003', CAST(120000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000004', CAST(100000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000005', CAST(120000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000006', CAST(120000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000007', CAST(100000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000008', CAST(120000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000009', CAST(90000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000010', CAST(120000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000011', CAST(100000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000012', CAST(80000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000013', CAST(100000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000014', CAST(80000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000015', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000016', CAST(100000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000017', CAST(80000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000018', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000019', CAST(80000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000020', CAST(60000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000021', CAST(30000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000022', CAST(100000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000023', CAST(90000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000024', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000025', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000026', CAST(80000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000027', CAST(80000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000028', CAST(70000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000029', CAST(70000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000030', CAST(60000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000031', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000032', CAST(4000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000033', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000034', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000035', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000036', CAST(40000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000037', CAST(40000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000038', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000039', CAST(40000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000040', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000041', CAST(40000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000042', CAST(50000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000043', CAST(40000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-11', N'S0000000044', CAST(40000.000 AS Decimal(38, 3)), CAST(500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000001', CAST(180000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000002', CAST(160000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000003', CAST(120000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000004', CAST(100000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000005', CAST(120000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000006', CAST(120000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000007', CAST(100000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000008', CAST(120000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000009', CAST(90000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000010', CAST(120000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000011', CAST(100000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000012', CAST(80000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000013', CAST(100000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000014', CAST(80000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000015', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000016', CAST(100000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000017', CAST(80000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000018', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000019', CAST(80000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000020', CAST(60000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000021', CAST(30000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000022', CAST(100000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000023', CAST(90000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000024', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000025', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000026', CAST(80000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000027', CAST(80000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000028', CAST(70000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000029', CAST(70000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000030', CAST(60000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000031', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000032', CAST(4000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000033', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000034', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000035', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000036', CAST(40000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000037', CAST(40000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000038', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000039', CAST(40000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000040', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000041', CAST(40000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000042', CAST(50000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000043', CAST(40000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000044', CAST(40000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:26:33.498888 | 2023-11-07', N'S0000000042', N'OP0000000046', N'Nhân viên S0000000042 chấm công lúc 04:26:32 ngày 2023-11-07 (lịch ngày: 2023-11-06) cho:
- Giờ ra ca 4')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:26:37.163117 | 2023-11-07', N'S0000000044', N'OP0000000046', N'Nhân viên S0000000044 chấm công lúc 04:26:36 ngày 2023-11-07 (lịch ngày: 2023-11-06) cho:
- Giờ ra ca 4')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:27:01.702468 | 2023-11-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:29:33.387389 | 2023-11-07', N'S0000000001', N'OP0000000041', N'Cập nhật chi tiết phụ cấp AL0000000001 - phụ cấp Lưu động:
 - Thêm nhân viên:
  - S0000000002
  - S0000000003
  - S0000000004
  - S0000000001
  - S0000000005
  - S0000000006
  - S0000000022
  - S0000000023
  - S0000000024
  - S0000000007
  - S0000000008
  - S0000000009
  - S0000000026
  - S0000000027
  - S0000000028
  - S0000000029
  - S0000000010
  - S0000000011
  - S0000000012
  - S0000000030
  - S0000000031
  - S0000000013
  - S0000000014
  - S0000000015
  - S0000000033
  - S0000000034
  - S0000000016
  - S0000000017
  - S0000000018
  - S0000000025
  - S0000000032
  - S0000000035
  - S0000000036
  - S0000000037
  - S0000000038
  - S0000000039
  - S0000000040
  - S0000000041
  - S0000000019
  - S0000000020
  - S0000000021
  - S0000000042
  - S0000000043
  - S0000000044
 - Xoá nhân viên:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:30:15.412875 | 2023-11-07', N'S0000000001', N'OP0000000047', N'Thêm phiếu Thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:30:22.998709 | 2023-11-07', N'S0000000001', N'OP0000000048', N'Xoá Thưởng lập ngày 2023-11-07')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:30:28.866943 | 2023-11-07', N'S0000000001', N'OP0000000048', N'Xoá Thưởng lập ngày 2023-11-05')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:30:32.166730 | 2023-11-07', N'S0000000001', N'OP0000000047', N'Thêm phiếu Phạt')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'04:30:38.638399 | 2023-11-07', N'S0000000001', N'OP0000000048', N'Xoá Phạt lập ngày 2023-11-07')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:26:34.708895 | 2023-11-06', N'S0000000001', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:26:33 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:29:53.685151 | 2023-11-06', N'S0000000002', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:29:46 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:06.093867 | 2023-11-06', N'S0000000003', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:05 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:08.384684 | 2023-11-06', N'S0000000004', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:07 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:10.574634 | 2023-11-06', N'S0000000005', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:10 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:12.838054 | 2023-11-06', N'S0000000006', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:12 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:15.085515 | 2023-11-06', N'S0000000007', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:14 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:17.397925 | 2023-11-06', N'S0000000008', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:16 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:20.287974 | 2023-11-06', N'S0000000009', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:19 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:29.364038 | 2023-11-06', N'S0000000010', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:28 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:31.670971 | 2023-11-06', N'S0000000011', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:31 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:34.239609 | 2023-11-06', N'S0000000012', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:33 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:36.688249 | 2023-11-06', N'S0000000013', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:36 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:39.253472 | 2023-11-06', N'S0000000014', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:38 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:41.534715 | 2023-11-06', N'S0000000015', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:41 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:43.769177 | 2023-11-06', N'S0000000016', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:43 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:47.292359 | 2023-11-06', N'S0000000017', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:46 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:49.804737 | 2023-11-06', N'S0000000018', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:49 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:53.388564 | 2023-11-06', N'S0000000019', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:52 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:55.903989 | 2023-11-06', N'S0000000020', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:55 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:30:58.422505 | 2023-11-06', N'S0000000021', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:58 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:00.236180 | 2023-11-06', N'S0000000022', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:30:59 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:01.875493 | 2023-11-06', N'S0000000023', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:01 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:04.156867 | 2023-11-06', N'S0000000024', N'OP0000000046', N'Nhân viên S0000000024 chấm công lúc 07:31:03 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:06.145662 | 2023-11-06', N'S0000000025', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:05 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:09.598514 | 2023-11-06', N'S0000000026', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:09 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:12.447578 | 2023-11-06', N'S0000000027', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:12 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:15.035160 | 2023-11-06', N'S0000000028', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:14 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:17.358117 | 2023-11-06', N'S0000000029', N'OP0000000046', N'Nhân viên S0000000029 chấm công lúc 07:31:17 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:20.535323 | 2023-11-06', N'S0000000030', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:19 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:23.278366 | 2023-11-06', N'S0000000031', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:22 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:25.157156 | 2023-11-06', N'S0000000032', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:24 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:27.215474 | 2023-11-06', N'S0000000033', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:26 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:29.682727 | 2023-11-06', N'S0000000034', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:29 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:31.372024 | 2023-11-06', N'S0000000035', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:31 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:33.270432 | 2023-11-06', N'S0000000036', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:32 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:35.479072 | 2023-11-06', N'S0000000037', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:35 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:37.726634 | 2023-11-06', N'S0000000038', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:37 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:40.758038 | 2023-11-06', N'S0000000039', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:40 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:43.455902 | 2023-11-06', N'S0000000040', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:43 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:45.894977 | 2023-11-06', N'S0000000041', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:45 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:47.926876 | 2023-11-06', N'S0000000042', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:47 ngày 2023-11-06 cho:
- Giờ vào ca 3')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:50.810462 | 2023-11-06', N'S0000000043', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:50 ngày 2023-11-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:31:52.581517 | 2023-11-06', N'S0000000044', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 07:31:52 ngày 2023-11-06 cho:
- Giờ vào ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:33:15.996461 | 2023-11-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:53:34.523447 | 2023-11-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:16:10.455289 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:16:44.867250 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:17:07.976106 | 2023-11-05', N'S0000000001', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Kỹ thuật:
 - Thêm nhân viên:
    - S0000000001 - ca 1 - phép : Không
    - S0000000001 - ca 2 - phép : Không
    - S0000000005 - ca 1 - phép : Không
    - S0000000005 - ca 2 - phép : Không
    - S0000000006 - ca 1 - phép : Không
    - S0000000006 - ca 2 - phép : Không
    - S0000000022 - ca 1 - phép : Không
    - S0000000022 - ca 2 - phép : Không
    - S0000000023 - ca 1 - phép : Không
    - S0000000023 - ca 2 - phép : Không
    - S0000000024 - ca 1 - phép : Không
    - S0000000024 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:17:33.305188 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:17:48.793746 | 2023-11-05', N'S0000000001', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-07 - phòng ban Kỹ thuật:
 - Thêm nhân viên:
    - S0000000001 - ca 1 - phép : Không
    - S0000000001 - ca 2 - phép : Không
    - S0000000005 - ca 1 - phép : Không
    - S0000000005 - ca 2 - phép : Không
    - S0000000006 - ca 1 - phép : Không
    - S0000000006 - ca 2 - phép : Không
    - S0000000022 - ca 1 - phép : Không
    - S0000000022 - ca 2 - phép : Không
    - S0000000023 - ca 1 - phép : Không
    - S0000000023 - ca 2 - phép : Không
    - S0000000024 - ca 1 - phép : Không
    - S0000000024 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:18:01.511219 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:18:51.553658 | 2023-11-05', N'S0000000001', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Kỹ thuật:
 - Thêm nhân viên:
    - S0000000001 - ca 1 - phép : Không
    - S0000000001 - ca 2 - phép : Không
    - S0000000005 - ca 1 - phép : Không
    - S0000000005 - ca 2 - phép : Không
    - S0000000006 - ca 1 - phép : Không
    - S0000000006 - ca 2 - phép : Không
    - S0000000022 - ca 1 - phép : Không
    - S0000000022 - ca 2 - phép : Không
    - S0000000023 - ca 1 - phép : Không
    - S0000000023 - ca 2 - phép : Không
    - S0000000024 - ca 1 - phép : Không
    - S0000000024 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:19:09.137613 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:19:26.928083 | 2023-11-05', N'S0000000001', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Kỹ thuật:
 - Thêm nhân viên:
    - S0000000001 - ca 1 - phép : Không
    - S0000000001 - ca 2 - phép : Không
    - S0000000005 - ca 1 - phép : Không
    - S0000000005 - ca 2 - phép : Không
    - S0000000006 - ca 1 - phép : Không
    - S0000000006 - ca 2 - phép : Không
    - S0000000022 - ca 1 - phép : Không
    - S0000000022 - ca 2 - phép : Không
    - S0000000023 - ca 1 - phép : Không
    - S0000000023 - ca 2 - phép : Không
    - S0000000024 - ca 1 - phép : Không
    - S0000000024 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:20:29.497286 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:21:52.987171 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-11 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:23:33.858099 | 2023-11-05', N'S0000000001', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Kỹ thuật:
 - Thêm nhân viên:
    - S0000000001 - ca 1 - phép : Không
    - S0000000001 - ca 2 - phép : Không
    - S0000000005 - ca 1 - phép : Không
    - S0000000005 - ca 2 - phép : Không
    - S0000000006 - ca 1 - phép : Không
    - S0000000006 - ca 2 - phép : Không
    - S0000000022 - ca 1 - phép : Không
    - S0000000022 - ca 2 - phép : Không
    - S0000000023 - ca 1 - phép : Không
    - S0000000023 - ca 2 - phép : Không
    - S0000000024 - ca 1 - phép : Không
    - S0000000024 - ca 2 - phép : Không
    - S0000000001 - ca 3 - phép : Không
    - S0000000005 - ca 3 - phép : Không
    - S0000000006 - ca 3 - phép : Không
    - S0000000022 - ca 3 - phép : Không
    - S0000000023 - ca 3 - phép : Không
    - S0000000024 - ca 3 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:24:21.149203 | 2023-11-05', N'S0000000001', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-11 - phòng ban Kỹ thuật:
 - Thêm nhân viên:
    - S0000000001 - ca 1 - phép : Không
    - S0000000001 - ca 2 - phép : Không
    - S0000000005 - ca 1 - phép : Không
    - S0000000005 - ca 2 - phép : Không
    - S0000000006 - ca 1 - phép : Không
    - S0000000006 - ca 2 - phép : Không
    - S0000000022 - ca 1 - phép : Không
    - S0000000022 - ca 2 - phép : Không
    - S0000000023 - ca 1 - phép : Không
    - S0000000023 - ca 2 - phép : Không
    - S0000000024 - ca 1 - phép : Không
    - S0000000024 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:25:20.321755 | 2023-11-05', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:25:34.835817 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:25:43.632039 | 2023-11-05', N'S0000000002', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Giám đốc:
 - Thêm nhân viên:
    - S0000000002 - ca 1 - phép : Không
    - S0000000002 - ca 2 - phép : Không
    - S0000000003 - ca 1 - phép : Không
    - S0000000003 - ca 2 - phép : Không
    - S0000000004 - ca 1 - phép : Không
    - S0000000004 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:26:42.931640 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:27:13.577082 | 2023-11-05', N'S0000000002', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Giám đốc:
 - Thêm nhân viên:
    - S0000000002 - ca 1 - phép : Không
    - S0000000002 - ca 2 - phép : Không
    - S0000000003 - ca 1 - phép : Không
    - S0000000003 - ca 2 - phép : Không
    - S0000000004 - ca 1 - phép : Không
    - S0000000004 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:27:23.491811 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:27:40.754091 | 2023-11-05', N'S0000000002', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Giám đốc:
 - Thêm nhân viên:
    - S0000000002 - ca 1 - phép : Không
    - S0000000002 - ca 2 - phép : Không
    - S0000000003 - ca 1 - phép : Không
    - S0000000003 - ca 2 - phép : Không
    - S0000000004 - ca 1 - phép : Không
    - S0000000004 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:27:47.524736 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:27:54.883297 | 2023-11-05', N'S0000000002', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Giám đốc:
 - Thêm nhân viên:
    - S0000000002 - ca 1 - phép : Không
    - S0000000002 - ca 2 - phép : Không
    - S0000000003 - ca 1 - phép : Không
    - S0000000003 - ca 2 - phép : Không
    - S0000000004 - ca 1 - phép : Không
    - S0000000004 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:28:02.834176 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:28:37.322879 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-11 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:28:49.898213 | 2023-11-05', N'S0000000002', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-11 - phòng ban Giám đốc:
 - Thêm nhân viên:
    - S0000000003 - ca 1 - phép : Không
    - S0000000003 - ca 2 - phép : Không
    - S0000000004 - ca 1 - phép : Không
    - S0000000004 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:29:03.164390 | 2023-11-05', N'S0000000007', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:29:09.201337 | 2023-11-05', N'S0000000007', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:29:59.065996 | 2023-11-05', N'S0000000007', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Nhân sự:
 - Thêm nhân viên:
    - S0000000007 - ca 1 - phép : Không
    - S0000000007 - ca 2 - phép : Không
    - S0000000008 - ca 1 - phép : Không
    - S0000000008 - ca 2 - phép : Không
    - S0000000009 - ca 1 - phép : Không
    - S0000000009 - ca 2 - phép : Không
    - S0000000026 - ca 1 - phép : Không
    - S0000000026 - ca 2 - phép : Không
    - S0000000027 - ca 1 - phép : Không
    - S0000000027 - ca 2 - phép : Không
    - S0000000028 - ca 1 - phép : Không
    - S0000000028 - ca 2 - phép : Không
    - S0000000029 - ca 1 - phép : Không
    - S0000000029 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:30:18.516894 | 2023-11-05', N'S0000000007', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:31:23.742686 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:31:53.245041 | 2023-11-05', N'S0000000001', N'OP0000000047', N'Thêm phiếu Thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:37:31.863788 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:38:09.062559 | 2023-11-05', N'S0000000007', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:39:16.201749 | 2023-11-05', N'S0000000007', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:39:34.072024 | 2023-11-05', N'S0000000007', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Nhân sự:
 - Thêm nhân viên:
    - S0000000007 - ca 1 - phép : Không
    - S0000000007 - ca 2 - phép : Không
    - S0000000008 - ca 1 - phép : Không
    - S0000000008 - ca 2 - phép : Không
    - S0000000009 - ca 1 - phép : Không
    - S0000000009 - ca 2 - phép : Không
    - S0000000026 - ca 1 - phép : Không
    - S0000000026 - ca 2 - phép : Không
    - S0000000027 - ca 1 - phép : Không
    - S0000000027 - ca 2 - phép : Không
    - S0000000028 - ca 1 - phép : Không
    - S0000000028 - ca 2 - phép : Không
    - S0000000029 - ca 1 - phép : Không
    - S0000000029 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:39:40.793369 | 2023-11-05', N'S0000000007', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:40:09.006334 | 2023-11-05', N'S0000000007', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Nhân sự:
 - Thêm nhân viên:
    - S0000000007 - ca 1 - phép : Không
    - S0000000007 - ca 2 - phép : Không
    - S0000000008 - ca 1 - phép : Không
    - S0000000008 - ca 2 - phép : Không
    - S0000000009 - ca 1 - phép : Không
    - S0000000009 - ca 2 - phép : Không
    - S0000000026 - ca 1 - phép : Không
    - S0000000026 - ca 2 - phép : Không
    - S0000000027 - ca 1 - phép : Không
    - S0000000027 - ca 2 - phép : Không
    - S0000000028 - ca 1 - phép : Không
    - S0000000028 - ca 2 - phép : Không
    - S0000000029 - ca 1 - phép : Không
    - S0000000029 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:40:48.047999 | 2023-11-05', N'S0000000007', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:41:20.069877 | 2023-11-05', N'S0000000007', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Nhân sự:
 - Thêm nhân viên:
    - S0000000007 - ca 1 - phép : Không
    - S0000000007 - ca 2 - phép : Không
    - S0000000008 - ca 1 - phép : Không
    - S0000000008 - ca 2 - phép : Không
    - S0000000009 - ca 1 - phép : Không
    - S0000000009 - ca 2 - phép : Không
    - S0000000026 - ca 1 - phép : Không
    - S0000000026 - ca 2 - phép : Không
    - S0000000027 - ca 1 - phép : Không
    - S0000000027 - ca 2 - phép : Không
    - S0000000028 - ca 1 - phép : Không
    - S0000000028 - ca 2 - phép : Không
    - S0000000029 - ca 1 - phép : Không
    - S0000000029 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:41:31.282650 | 2023-11-05', N'S0000000010', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:41:45.352870 | 2023-11-05', N'S0000000010', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:41:58.168206 | 2023-11-05', N'S0000000010', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Hành chính:
 - Thêm nhân viên:
    - S0000000010 - ca 1 - phép : Không
    - S0000000010 - ca 2 - phép : Không
    - S0000000011 - ca 1 - phép : Không
    - S0000000011 - ca 2 - phép : Không
    - S0000000012 - ca 1 - phép : Không
    - S0000000012 - ca 2 - phép : Không
    - S0000000030 - ca 1 - phép : Không
    - S0000000030 - ca 2 - phép : Không
    - S0000000031 - ca 1 - phép : Không
    - S0000000031 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:42:04.062355 | 2023-11-05', N'S0000000010', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:42:11.863623 | 2023-11-05', N'S0000000010', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:42:15.775162 | 2023-11-05', N'S0000000010', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:42:22.250548 | 2023-11-05', N'S0000000010', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:42:38.316318 | 2023-11-05', N'S0000000010', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-07 - phòng ban Hành chính:
 - Thêm nhân viên:
    - S0000000010 - ca 1 - phép : Không
    - S0000000010 - ca 2 - phép : Không
    - S0000000011 - ca 1 - phép : Không
    - S0000000011 - ca 2 - phép : Không
    - S0000000012 - ca 1 - phép : Không
    - S0000000012 - ca 2 - phép : Không
    - S0000000030 - ca 1 - phép : Không
    - S0000000030 - ca 2 - phép : Không
    - S0000000031 - ca 1 - phép : Không
    - S0000000031 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:43:24.978326 | 2023-11-05', N'S0000000010', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Hành chính:
 - Thêm nhân viên:
    - S0000000010 - ca 1 - phép : Không
    - S0000000010 - ca 2 - phép : Không
    - S0000000011 - ca 1 - phép : Không
    - S0000000011 - ca 2 - phép : Không
    - S0000000012 - ca 1 - phép : Không
    - S0000000012 - ca 2 - phép : Không
    - S0000000030 - ca 1 - phép : Không
    - S0000000030 - ca 2 - phép : Không
    - S0000000031 - ca 1 - phép : Không
    - S0000000031 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:43:41.146378 | 2023-11-05', N'S0000000010', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Hành chính:
 - Thêm nhân viên:
    - S0000000010 - ca 1 - phép : Không
    - S0000000010 - ca 2 - phép : Không
    - S0000000011 - ca 1 - phép : Không
    - S0000000011 - ca 2 - phép : Không
    - S0000000012 - ca 1 - phép : Không
    - S0000000012 - ca 2 - phép : Không
    - S0000000030 - ca 1 - phép : Không
    - S0000000030 - ca 2 - phép : Không
    - S0000000031 - ca 1 - phép : Không
    - S0000000031 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:02.494379 | 2023-11-05', N'S0000000010', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Hành chính:
 - Thêm nhân viên:
    - S0000000010 - ca 1 - phép : Không
    - S0000000010 - ca 2 - phép : Không
    - S0000000011 - ca 1 - phép : Không
    - S0000000011 - ca 2 - phép : Không
    - S0000000012 - ca 1 - phép : Không
    - S0000000012 - ca 2 - phép : Không
    - S0000000030 - ca 1 - phép : Không
    - S0000000030 - ca 2 - phép : Không
    - S0000000031 - ca 1 - phép : Không
    - S0000000031 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:22.982655 | 2023-11-05', N'S0000000013', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:32.663652 | 2023-11-05', N'S0000000013', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:34.958473 | 2023-11-05', N'S0000000013', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:37.544784 | 2023-11-05', N'S0000000013', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:40.066883 | 2023-11-05', N'S0000000013', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:44:43.783479 | 2023-11-05', N'S0000000013', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:45:12.692645 | 2023-11-05', N'S0000000013', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Tài chính - Kế toán:
 - Thêm nhân viên:
    - S0000000013 - ca 1 - phép : Không
    - S0000000013 - ca 2 - phép : Không
    - S0000000014 - ca 1 - phép : Không
    - S0000000014 - ca 2 - phép : Không
    - S0000000015 - ca 1 - phép : Không
    - S0000000015 - ca 2 - phép : Không
    - S0000000033 - ca 1 - phép : Không
    - S0000000033 - ca 2 - phép : Không
    - S0000000034 - ca 1 - phép : Không
    - S0000000034 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:46:12.242068 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:46:21.128382 | 2023-11-05', N'S0000000013', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:46:47.713741 | 2023-11-05', N'S0000000013', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-07 - phòng ban Tài chính - Kế toán:
 - Thêm nhân viên:
    - S0000000013 - ca 1 - phép : Không
    - S0000000013 - ca 2 - phép : Không
    - S0000000014 - ca 1 - phép : Không
    - S0000000014 - ca 2 - phép : Không
    - S0000000015 - ca 1 - phép : Không
    - S0000000015 - ca 2 - phép : Không
    - S0000000033 - ca 1 - phép : Không
    - S0000000033 - ca 2 - phép : Không
    - S0000000034 - ca 1 - phép : Không
    - S0000000034 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:48:15.479135 | 2023-11-05', N'S0000000013', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Tài chính - Kế toán:
 - Thêm nhân viên:
    - S0000000013 - ca 1 - phép : Không
    - S0000000013 - ca 2 - phép : Không
    - S0000000014 - ca 1 - phép : Không
    - S0000000014 - ca 2 - phép : Không
    - S0000000015 - ca 1 - phép : Không
    - S0000000015 - ca 2 - phép : Không
    - S0000000033 - ca 1 - phép : Không
    - S0000000033 - ca 2 - phép : Không
    - S0000000034 - ca 1 - phép : Không
    - S0000000034 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:48:51.922975 | 2023-11-05', N'S0000000013', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Tài chính - Kế toán:
 - Thêm nhân viên:
    - S0000000013 - ca 1 - phép : Không
    - S0000000013 - ca 2 - phép : Không
    - S0000000014 - ca 1 - phép : Không
    - S0000000014 - ca 2 - phép : Không
    - S0000000015 - ca 1 - phép : Không
    - S0000000015 - ca 2 - phép : Không
    - S0000000033 - ca 1 - phép : Không
    - S0000000033 - ca 2 - phép : Không
    - S0000000034 - ca 1 - phép : Không
    - S0000000034 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:05.147169 | 2023-11-05', N'S0000000013', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Tài chính - Kế toán:
 - Thêm nhân viên:
    - S0000000013 - ca 1 - phép : Không
    - S0000000013 - ca 2 - phép : Không
    - S0000000014 - ca 1 - phép : Không
    - S0000000014 - ca 2 - phép : Không
    - S0000000015 - ca 1 - phép : Không
    - S0000000015 - ca 2 - phép : Không
    - S0000000033 - ca 1 - phép : Không
    - S0000000033 - ca 2 - phép : Không
    - S0000000034 - ca 1 - phép : Không
    - S0000000034 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:20.890861 | 2023-11-05', N'S0000000016', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:27.120604 | 2023-11-05', N'S0000000016', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:29.711946 | 2023-11-05', N'S0000000016', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:33.239234 | 2023-11-05', N'S0000000016', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:36.840777 | 2023-11-05', N'S0000000016', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:40.078499 | 2023-11-05', N'S0000000016', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:52:27.959157 | 2023-11-05', N'S0000000016', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Sản xuất:
 - Thêm nhân viên:
    - S0000000016 - ca 1 - phép : Không
    - S0000000016 - ca 2 - phép : Không
    - S0000000017 - ca 1 - phép : Không
    - S0000000017 - ca 2 - phép : Không
    - S0000000018 - ca 1 - phép : Không
    - S0000000018 - ca 2 - phép : Không
    - S0000000025 - ca 1 - phép : Không
    - S0000000025 - ca 2 - phép : Không
    - S0000000032 - ca 1 - phép : Không
    - S0000000032 - ca 2 - phép : Không
    - S0000000035 - ca 1 - phép : Không
    - S0000000035 - ca 2 - phép : Không
    - S0000000036 - ca 1 - phép : Không
    - S0000000036 - ca 2 - phép : Không
    - S0000000037 - ca 1 - phép : Không
    - S0000000037 - ca 2 - phép : Không
    - S0000000038 - ca 1 - phép : Không
    - S0000000038 - ca 2 - phép : Không
    - S0000000039 - ca 1 - phép : Không
    - S0000000039 - ca 2 - phép : Không
    - S0000000040 - ca 1 - phép : Không
    - S0000000040 - ca 2 - phép : Không
    - S0000000041 - ca 1 - phép : Không
    - S0000000041 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:53:35.673255 | 2023-11-05', N'S0000000016', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-07 - phòng ban Sản xuất:
 - Thêm nhân viên:
    - S0000000016 - ca 1 - phép : Không
    - S0000000016 - ca 2 - phép : Không
    - S0000000017 - ca 1 - phép : Không
    - S0000000017 - ca 2 - phép : Không
    - S0000000018 - ca 1 - phép : Không
    - S0000000018 - ca 2 - phép : Không
    - S0000000025 - ca 1 - phép : Không
    - S0000000025 - ca 2 - phép : Không
    - S0000000032 - ca 1 - phép : Không
    - S0000000032 - ca 2 - phép : Không
    - S0000000035 - ca 1 - phép : Không
    - S0000000035 - ca 2 - phép : Không
    - S0000000036 - ca 1 - phép : Không
    - S0000000036 - ca 2 - phép : Không
    - S0000000037 - ca 1 - phép : Không
    - S0000000037 - ca 2 - phép : Không
    - S0000000038 - ca 1 - phép : Không
    - S0000000038 - ca 2 - phép : Không
    - S0000000039 - ca 1 - phép : Không
    - S0000000039 - ca 2 - phép : Không
    - S0000000040 - ca 1 - phép : Không
    - S0000000040 - ca 2 - phép : Không
    - S0000000041 - ca 1 - phép : Không
    - S0000000041 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:54:25.731911 | 2023-11-05', N'S0000000016', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Sản xuất:
 - Thêm nhân viên:
    - S0000000016 - ca 1 - phép : Không
    - S0000000016 - ca 2 - phép : Không
    - S0000000017 - ca 1 - phép : Không
    - S0000000017 - ca 2 - phép : Không
    - S0000000018 - ca 1 - phép : Không
    - S0000000018 - ca 2 - phép : Không
    - S0000000025 - ca 1 - phép : Không
    - S0000000025 - ca 2 - phép : Không
    - S0000000032 - ca 1 - phép : Không
    - S0000000032 - ca 2 - phép : Không
    - S0000000035 - ca 1 - phép : Không
    - S0000000035 - ca 2 - phép : Không
    - S0000000036 - ca 1 - phép : Không
    - S0000000036 - ca 2 - phép : Không
    - S0000000037 - ca 1 - phép : Không
    - S0000000037 - ca 2 - phép : Không
    - S0000000038 - ca 1 - phép : Không
    - S0000000038 - ca 2 - phép : Không
    - S0000000039 - ca 1 - phép : Không
    - S0000000039 - ca 2 - phép : Không
    - S0000000040 - ca 1 - phép : Không
    - S0000000040 - ca 2 - phép : Không
    - S0000000041 - ca 1 - phép : Không
    - S0000000041 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:55:56.419897 | 2023-11-05', N'S0000000016', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Sản xuất:
 - Thêm nhân viên:
    - S0000000016 - ca 1 - phép : Không
    - S0000000016 - ca 2 - phép : Không
    - S0000000017 - ca 1 - phép : Không
    - S0000000017 - ca 2 - phép : Không
    - S0000000018 - ca 1 - phép : Không
    - S0000000018 - ca 2 - phép : Không
    - S0000000025 - ca 1 - phép : Không
    - S0000000025 - ca 2 - phép : Không
    - S0000000032 - ca 1 - phép : Không
    - S0000000032 - ca 2 - phép : Không
    - S0000000035 - ca 1 - phép : Không
    - S0000000035 - ca 2 - phép : Không
    - S0000000036 - ca 1 - phép : Không
    - S0000000036 - ca 2 - phép : Không
    - S0000000037 - ca 1 - phép : Không
    - S0000000037 - ca 2 - phép : Không
    - S0000000038 - ca 1 - phép : Không
    - S0000000038 - ca 2 - phép : Không
    - S0000000039 - ca 1 - phép : Không
    - S0000000039 - ca 2 - phép : Không
    - S0000000040 - ca 1 - phép : Không
    - S0000000040 - ca 2 - phép : Không
    - S0000000041 - ca 1 - phép : Không
    - S0000000041 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:58:26.068932 | 2023-11-05', N'S0000000016', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Sản xuất:
 - Thêm nhân viên:
    - S0000000016 - ca 1 - phép : Không
    - S0000000016 - ca 2 - phép : Không
    - S0000000017 - ca 1 - phép : Không
    - S0000000017 - ca 2 - phép : Không
    - S0000000018 - ca 1 - phép : Không
    - S0000000018 - ca 2 - phép : Không
    - S0000000025 - ca 1 - phép : Không
    - S0000000025 - ca 2 - phép : Không
    - S0000000032 - ca 1 - phép : Không
    - S0000000032 - ca 2 - phép : Không
    - S0000000035 - ca 1 - phép : Không
    - S0000000035 - ca 2 - phép : Không
    - S0000000036 - ca 1 - phép : Không
    - S0000000036 - ca 2 - phép : Không
    - S0000000037 - ca 1 - phép : Không
    - S0000000037 - ca 2 - phép : Không
    - S0000000038 - ca 1 - phép : Không
    - S0000000038 - ca 2 - phép : Không
    - S0000000039 - ca 1 - phép : Không
    - S0000000039 - ca 2 - phép : Không
    - S0000000040 - ca 1 - phép : Không
    - S0000000040 - ca 2 - phép : Không
    - S0000000041 - ca 1 - phép : Không
    - S0000000041 - ca 2 - phép : Không
    - S0000000016 - ca 3 - phép : Không
    - S0000000017 - ca 3 - phép : Không
    - S0000000018 - ca 3 - phép : Không
    - S0000000025 - ca 3 - phép : Không
    - S0000000032 - ca 3 - phép : Không
    - S0000000035 - ca 3 - phép : Không
    - S0000000036 - ca 3 - phép : Không
    - S0000000037 - ca 3 - phép : Không
    - S0000000038 - ca 3 - phép : Không
    - S0000000039 - ca 3 - phép : Không
    - S0000000040 - ca 3 - phép : Không
    - S0000000041 - ca 3 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:58:55.992287 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:00.536702 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-06 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:03.105695 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-07 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:06.067354 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-08 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:10.362590 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-09 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:14.466635 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-10 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:01:02.884234 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:01:15.087897 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:07:39.131200 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:07:49.827647 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:08:50.541403 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:08:55.793940 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:10:23.442247 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:10:29.743182 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:11:17.710780 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:11:30.748568 | 2023-11-05', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:11:37.745556 | 2023-11-05', N'S0000000002', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-05 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:13:03.622844 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:13:08.748520 | 2023-11-05', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:16:28.366881 | 2023-11-05', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:17:42.011472 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:18:09.892733 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:18:15.946966 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:18:25.323152 | 2023-11-05', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:18:29.625735 | 2023-11-05', N'S0000000002', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-05 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:18:37.833403 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:20:08.770651 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:20:15.130248 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:20:25.015595 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000019 - ca 3 - phép : Không
    - S0000000019 - ca 4 - phép : Không
    - S0000000020 - ca 1 - phép : Không
    - S0000000020 - ca 2 - phép : Không
    - S0000000020 - ca 3 - phép : Không
    - S0000000020 - ca 4 - phép : Không
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000021 - ca 3 - phép : Không
    - S0000000021 - ca 4 - phép : Không
    - S0000000042 - ca 1 - phép : Không
    - S0000000042 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000043 - ca 3 - phép : Không
    - S0000000043 - ca 4 - phép : Không
    - S0000000044 - ca 1 - phép : Không
    - S0000000044 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:20:48.214806 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Bảo vệ:
 - Thêm nhân viên:
 - Xoá nhân viên:
  - S0000000019 - ca 1
  - S0000000019 - ca 2
  - S0000000019 - ca 3
  - S0000000019 - ca 4
  - S0000000020 - ca 1
  - S0000000020 - ca 2
  - S0000000020 - ca 3
  - S0000000020 - ca 4
  - S0000000021 - ca 1
  - S0000000021 - ca 2
  - S0000000021 - ca 3
  - S0000000021 - ca 4
  - S0000000042 - ca 1
  - S0000000042 - ca 2
  - S0000000042 - ca 3
  - S0000000042 - ca 4
  - S0000000043 - ca 1
  - S0000000043 - ca 2
  - S0000000043 - ca 3
  - S0000000043 - ca 4
  - S0000000044 - ca 1
  - S0000000044 - ca 2
  - S0000000044 - ca 3
  - S0000000044 - ca 4
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:24:01.414496 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-06 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000020 - ca 1 - phép : Không
    - S0000000020 - ca 2 - phép : Không
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000044 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:26:54.774903 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:28:04.007731 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:30:38.350448 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:31:09.507406 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:32:55.915414 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:34:43.632342 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:36:05.717326 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:36:13.006099 | 2023-11-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-05 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:36:31.810135 | 2023-11-05', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-05 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:36:50.043680 | 2023-11-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:36:57.006902 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:37:56.317995 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-07 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000020 - ca 1 - phép : Không
    - S0000000020 - ca 2 - phép : Không
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:39:50.706562 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-08 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000021 - ca 3 - phép : Không
    - S0000000021 - ca 4 - phép : Không
    - S0000000042 - ca 1 - phép : Không
    - S0000000042 - ca 2 - phép : Không
    - S0000000043 - ca 3 - phép : Không
    - S0000000044 - ca 1 - phép : Không
    - S0000000044 - ca 2 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:40:39.497547 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-09 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000020 - ca 1 - phép : Không
    - S0000000020 - ca 2 - phép : Không
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:41:19.006425 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-10 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000020 - ca 1 - phép : Không
    - S0000000020 - ca 2 - phép : Không
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:41:31.898670 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-11 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:42:05.378348 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-11 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000019 - ca 1 - phép : Không
    - S0000000019 - ca 2 - phép : Không
    - S0000000020 - ca 1 - phép : Không
    - S0000000020 - ca 2 - phép : Không
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:42:12.270226 | 2023-11-05', N'S0000000019', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-12 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:42:35.739276 | 2023-11-05', N'S0000000019', N'OP0000000024', N'Cập nhật lịch làm việc ngày 2023-11-12 - phòng ban Bảo vệ:
 - Thêm nhân viên:
    - S0000000021 - ca 1 - phép : Không
    - S0000000021 - ca 2 - phép : Không
    - S0000000042 - ca 3 - phép : Không
    - S0000000042 - ca 4 - phép : Không
    - S0000000043 - ca 1 - phép : Không
    - S0000000043 - ca 2 - phép : Không
    - S0000000044 - ca 3 - phép : Không
    - S0000000044 - ca 4 - phép : Không
 - Xoá nhân viên:
 - Cập nhật phép:')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:19:51.086829 | 2023-12-19', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:25:57.293451 | 2023-11-05', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:25:59.525901 | 2023-11-05', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:01.829979 | 2023-11-05', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:04.335073 | 2023-11-05', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:06.999129 | 2023-11-05', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-11 - phòng ban Kỹ thuật')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:30.652155 | 2023-11-05', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:35.950531 | 2023-11-05', N'S0000000002', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:38.406100 | 2023-11-05', N'S0000000002', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:40.975516 | 2023-11-05', N'S0000000002', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:43.330085 | 2023-11-05', N'S0000000002', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:45.399146 | 2023-11-05', N'S0000000002', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-11 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:06.001943 | 2023-11-05', N'S0000000007', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:10.917617 | 2023-11-05', N'S0000000007', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:12.846953 | 2023-11-05', N'S0000000007', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:14.540871 | 2023-11-05', N'S0000000007', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:16.643357 | 2023-11-05', N'S0000000007', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:30.028628 | 2023-11-05', N'S0000000010', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:33.490793 | 2023-11-05', N'S0000000010', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:35.424121 | 2023-11-05', N'S0000000010', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:37.531262 | 2023-11-05', N'S0000000010', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:40.180311 | 2023-11-05', N'S0000000010', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Hành chính')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:47.690579 | 2023-11-05', N'S0000000013', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:52.304350 | 2023-11-05', N'S0000000013', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:54.558906 | 2023-11-05', N'S0000000013', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:56.739510 | 2023-11-05', N'S0000000013', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:28:58.931410 | 2023-11-05', N'S0000000013', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Tài chính - Kế toán')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:29:08.772043 | 2023-11-05', N'S0000000016', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:29:12.598297 | 2023-11-05', N'S0000000016', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:29:14.865888 | 2023-11-05', N'S0000000016', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:29:16.652068 | 2023-11-05', N'S0000000016', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:29:18.816637 | 2023-11-05', N'S0000000016', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Sản xuất')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:29:26.368282 | 2023-11-05', N'S0000000019', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:16.601865 | 2023-11-05', N'S0000000019', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-07 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:18.632841 | 2023-11-05', N'S0000000019', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-08 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:20.772128 | 2023-11-05', N'S0000000019', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-09 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:22.650066 | 2023-11-05', N'S0000000019', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-10 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:24.582154 | 2023-11-05', N'S0000000019', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-11 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:26.668178 | 2023-11-05', N'S0000000019', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-12 - phòng ban Bảo vệ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:40.456399 | 2023-11-05', N'S0000000007', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:00:55.547241 | 2023-11-06', N'S0000000024', N'OP0000000046', N'Nhân viên S0000000024 chấm công lúc 12:00:46 ngày 2023-11-06 cho:
- Giờ vào ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:04:10.052242 | 2023-11-06', N'S0000000024', N'OP0000000046', N'Nhân viên S0000000024 chấm công lúc 12:03:31 ngày 2023-11-06 cho:
- Giờ ra ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:07:37.021134 | 2023-11-06', N'S0000000024', N'OP0000000046', N'Nhân viên S0000000024 chấm công lúc 12:07:33 ngày 2023-11-06 cho:
- Giờ vào ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:29:24.307488 | 2023-11-06', N'S0000000029', N'OP0000000046', N'Nhân viên S0000000029 chấm công lúc 12:29:15 ngày 2023-11-06 cho:
- Giờ ra ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:29:29.128438 | 2023-11-06', N'S0000000029', N'OP0000000046', N'Nhân viên S0000000029 chấm công lúc 12:29:26 ngày 2023-11-06 cho:
- Giờ vào ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:09.938990 | 2023-11-06', N'S0000000001', N'OP0000000046', N'Nhân viên S0000000001 chấm công lúc 17:01:07 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:16.239849 | 2023-11-06', N'S0000000002', N'OP0000000046', N'Nhân viên S0000000002 chấm công lúc 17:01:15 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:18.650396 | 2023-11-06', N'S0000000003', N'OP0000000046', N'Nhân viên S0000000003 chấm công lúc 17:01:18 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:21.455445 | 2023-11-06', N'S0000000004', N'OP0000000046', N'Nhân viên S0000000004 chấm công lúc 17:01:20 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:23.102798 | 2023-11-06', N'S0000000005', N'OP0000000046', N'Nhân viên S0000000005 chấm công lúc 17:01:22 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:25.641705 | 2023-11-06', N'S0000000006', N'OP0000000046', N'Nhân viên S0000000006 chấm công lúc 17:01:24 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:27.457996 | 2023-11-06', N'S0000000007', N'OP0000000046', N'Nhân viên S0000000007 chấm công lúc 17:01:26 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:30.080774 | 2023-11-06', N'S0000000008', N'OP0000000046', N'Nhân viên S0000000008 chấm công lúc 17:01:29 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:32.054374 | 2023-11-06', N'S0000000009', N'OP0000000046', N'Nhân viên S0000000009 chấm công lúc 17:01:31 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:43.745180 | 2023-11-06', N'S0000000010', N'OP0000000046', N'Nhân viên S0000000010 chấm công lúc 17:01:43 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:46.434162 | 2023-11-06', N'S0000000011', N'OP0000000046', N'Nhân viên S0000000011 chấm công lúc 17:01:45 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:48.081196 | 2023-11-06', N'S0000000012', N'OP0000000046', N'Nhân viên S0000000012 chấm công lúc 17:01:47 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:50.623019 | 2023-11-06', N'S0000000013', N'OP0000000046', N'Nhân viên S0000000013 chấm công lúc 17:01:49 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:55.007681 | 2023-11-06', N'S0000000014', N'OP0000000046', N'Nhân viên S0000000014 chấm công lúc 17:01:54 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:56.577123 | 2023-11-06', N'S0000000015', N'OP0000000046', N'Nhân viên S0000000015 chấm công lúc 17:01:56 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:58.529420 | 2023-11-06', N'S0000000016', N'OP0000000046', N'Nhân viên S0000000016 chấm công lúc 17:01:57 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:08.383568 | 2023-11-06', N'S0000000017', N'OP0000000046', N'Nhân viên S0000000017 chấm công lúc 17:02:07 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:10.218263 | 2023-11-06', N'S0000000018', N'OP0000000046', N'Nhân viên S0000000018 chấm công lúc 17:02:09 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:12.006518 | 2023-11-06', N'S0000000019', N'OP0000000046', N'Nhân viên S0000000019 chấm công lúc 17:02:11 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:14.478020 | 2023-11-06', N'S0000000020', N'OP0000000046', N'Nhân viên S0000000020 chấm công lúc 17:02:14 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:16.550151 | 2023-11-06', N'S0000000021', N'OP0000000046', N'Nhân viên S0000000021 chấm công lúc 17:02:16 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:19.338370 | 2023-11-06', N'S0000000022', N'OP0000000046', N'Nhân viên S0000000022 chấm công lúc 17:02:18 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:23.032046 | 2023-11-06', N'S0000000023', N'OP0000000046', N'Nhân viên S0000000023 chấm công lúc 17:02:21 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:25.779103 | 2023-11-06', N'S0000000025', N'OP0000000046', N'Nhân viên S0000000025 chấm công lúc 17:02:25 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:27.850390 | 2023-11-06', N'S0000000026', N'OP0000000046', N'Nhân viên S0000000026 chấm công lúc 17:02:27 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:30.663498 | 2023-11-06', N'S0000000027', N'OP0000000046', N'Nhân viên S0000000027 chấm công lúc 17:02:30 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:32.951904 | 2023-11-06', N'S0000000028', N'OP0000000046', N'Nhân viên S0000000028 chấm công lúc 17:02:32 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:40.551381 | 2023-11-06', N'S0000000030', N'OP0000000046', N'Nhân viên S0000000030 chấm công lúc 17:02:40 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:42.455482 | 2023-11-06', N'S0000000031', N'OP0000000046', N'Nhân viên S0000000031 chấm công lúc 17:02:42 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:44.639930 | 2023-11-06', N'S0000000032', N'OP0000000046', N'Nhân viên S0000000032 chấm công lúc 17:02:44 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:47.293685 | 2023-11-06', N'S0000000033', N'OP0000000046', N'Nhân viên S0000000033 chấm công lúc 17:02:46 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:02:56.953561 | 2023-11-06', N'S0000000034', N'OP0000000046', N'Nhân viên S0000000034 chấm công lúc 17:02:51 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:01.085628 | 2023-11-06', N'S0000000036', N'OP0000000046', N'Nhân viên S0000000036 chấm công lúc 17:03:00 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:04.663106 | 2023-11-06', N'S0000000037', N'OP0000000046', N'Nhân viên S0000000037 chấm công lúc 17:03:04 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:10.426157 | 2023-11-06', N'S0000000038', N'OP0000000046', N'Nhân viên S0000000038 chấm công lúc 17:03:10 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:12.358575 | 2023-11-06', N'S0000000039', N'OP0000000046', N'Nhân viên S0000000039 chấm công lúc 17:03:11 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:19.389777 | 2023-11-06', N'S0000000040', N'OP0000000046', N'Nhân viên S0000000040 chấm công lúc 17:03:18 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:21.106940 | 2023-11-06', N'S0000000041', N'OP0000000046', N'Nhân viên S0000000041 chấm công lúc 17:03:20 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:37.587517 | 2023-11-06', N'S0000000043', N'OP0000000046', N'Nhân viên S0000000043 chấm công lúc 17:03:36 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:03:39.251916 | 2023-11-06', N'S0000000044', N'OP0000000046', N'Nhân viên S0000000044 chấm công lúc 17:03:38 ngày 2023-11-06 cho:
- Giờ ra ca 2
- Giờ vào ca 3')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:04:00.189966 | 2023-11-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:25:07.024438 | 2023-11-06', N'S0000000024', N'OP0000000046', N'Nhân viên S0000000024 chấm công lúc 17:25:05 ngày 2023-11-06 cho:
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:25:43.073850 | 2023-11-06', N'S0000000029', N'OP0000000046', N'Nhân viên S0000000029 chấm công lúc 17:25:28 ngày 2023-11-06 cho:
- Giờ ra ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:33:17.304914 | 2023-11-06', N'S0000000029', N'OP0000000046', N'Nhân viên S0000000029 chấm công lúc 17:33:15 ngày 2023-11-06 cho:
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:40:27.664708 | 2023-11-06', N'S0000000029', N'OP0000000046', N'Nhân viên S0000000029 chấm công lúc 17:40:24 ngày 2023-11-06 cho:
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:42:07.977917 | 2023-11-06', N'S0000000035', N'OP0000000046', N'Nhân viên S0000000035 chấm công lúc 17:42:05 ngày 2023-11-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:44:36.737720 | 2023-11-06', N'S0000000042', N'OP0000000046', N'Nhân viên S0000000042 chấm công lúc 17:44:33 ngày 2023-11-06 cho:
- Giờ vào ca 3')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:44:40.427910 | 2023-11-06', N'S0000000044', N'OP0000000046', N'Nhân viên S0000000044 chấm công lúc 17:44:39 ngày 2023-11-06 cho:
- Giờ vào ca 3')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:26:06.403397 | 2023-11-06', N'S0000000042', N'OP0000000046', N'Nhân viên S0000000042 chấm công lúc 22:26:00 ngày 2023-11-06 cho:
- Giờ ra ca 3
- Giờ vào ca 4')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:26:17.461101 | 2023-11-06', N'S0000000044', N'OP0000000046', N'Nhân viên S0000000044 chấm công lúc 22:26:13 ngày 2023-11-06 cho:
- Giờ ra ca 3
- Giờ vào ca 4')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000001', N'IT0000000001', N'Đăng nhập')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000002', N'IT0000000002', N'Quên mật khẩu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000003', N'IT0000000004', N'Thêm nhân viên')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000004', N'IT0000000004', N'Sửa nhân viên')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000005', N'IT0000000004', N'Xoá nhân viên')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000006', N'IT0000000004', N'Mở khoá tài khoản')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000007', N'IT0000000004', N'Khoá tài khoản')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000008', N'IT0000000019', N'Thêm phụ cấp cho nhân viên')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000009', N'IT0000000019', N'Xoá phụ cấp của nhân viên')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000010', N'IT0000000005', N'Thêm phòng ban')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000011', N'IT0000000005', N'Sửa phòng ban')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000012', N'IT0000000005', N'Xoá phòng ban')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000013', N'IT0000000006', N'Thêm chức vụ')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000014', N'IT0000000006', N'Sửa chức vụ')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000015', N'IT0000000006', N'Xoá chức vụ')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000016', N'IT0000000007', N'Thêm ca')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000017', N'IT0000000007', N'Sửa ca')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000018', N'IT0000000007', N'Xoá ca')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000019', N'IT0000000016', N'Thêm loại ca')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000020', N'IT0000000016', N'Sửa loại ca')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000021', N'IT0000000016', N'Xoá loại ca')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000022', N'IT0000000008', N'Thêm lịch làm việc')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000023', N'IT0000000008', N'Xoá lịch làm việc')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000024', N'IT0000000017', N'Cập nhật chi tiết lịch')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000028', N'IT0000000009', N'Thêm phụ cấp')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000029', N'IT0000000009', N'Sửa phụ cấp')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000030', N'IT0000000009', N'Xoá phụ cấp')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000031', N'IT0000000020', N'Thêm nhân viên vào phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000032', N'IT0000000020', N'Sửa nhân viên trong phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000033', N'IT0000000020', N'Xoá nhân viên khỏi phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000034', N'IT0000000022', N'Thêm loại phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000035', N'IT0000000022', N'Sửa loại phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000036', N'IT0000000022', N'Xoá loại phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000037', N'IT0000000012', N'Thêm loại hợp đồng')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000038', N'IT0000000012', N'Sửa loại hợp đồng')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000039', N'IT0000000012', N'Xoá loại hợp đồng')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000040', N'IT0000000013', N'Cập nhật quyền hạn')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000041', N'IT0000000018', N'Cập nhật chi tiết phụ cấp')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000043', N'IT0000000015', N'Sửa thông tin')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000044', N'IT0000000015', N'Đổi mật khẩu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000045', N'IT0000000001', N'Khoá tài khoản (Sai mật khẩu)')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000046', N'IT0000000021', N'Chấm công')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000047', N'IT0000000010', N'Thêm phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000048', N'IT0000000010', N'Xoá phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000049', N'IT0000000023', N'Cập nhật thưởng - nợ')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000001', N'DP0000000001', N'Trưởng phòng giám đốc')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000002', N'DP0000000001', N'Phó phòng giám đốc')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000003', N'DP0000000001', N'Thư ký giám đốc')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000004', N'DP0000000002', N'Trưởng phòng kỹ thuật')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000005', N'DP0000000002', N'Phó phòng kỹ thuật')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000006', N'DP0000000002', N'Nhân viên phòng kỹ thuật')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000007', N'DP0000000003', N'Trưởng phòng nhân sự')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000008', N'DP0000000003', N'Phó phòng nhân sự')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000009', N'DP0000000003', N'Nhân viên phòng nhân sự')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000010', N'DP0000000004', N'Trưởng phòng hành chính')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000011', N'DP0000000004', N'Phó phòng hành chính')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000012', N'DP0000000004', N'Nhân viên phòng hành chính')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000013', N'DP0000000005', N'Trưởng phòng tài chính - kế toán')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000014', N'DP0000000005', N'Phó phòng tài chính - kế toán')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000015', N'DP0000000005', N'Nhân viên phòng tài chính - kế toán')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000016', N'DP0000000006', N'Trưởng phòng sản xuất')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000017', N'DP0000000006', N'Phó phòng sản xuất')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000018', N'DP0000000006', N'Nhân viên phòng sản xuất')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000019', N'DP0000000007', N'Trưởng phòng bảo vệ')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000020', N'DP0000000007', N'Phó phòng bảo vệ')
GO
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000021', N'DP0000000007', N'Nhân viên phòng bảo vệ')
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'SH0000000001', N'1', CAST(N'07:30:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'SH0000000002', N'2', CAST(N'13:30:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'SH0000000003', N'3', CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'SH0000000004', N'4', CAST(N'23:00:00' AS Time), CAST(N'03:00:00' AS Time))
GO
INSERT [dbo].[ShiftType] ([ST_ID], [ShiftTypeName], [SalaryCoefficient]) VALUES (N'ST0000000001', N'Thường', CAST(1.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[ShiftType] ([ST_ID], [ShiftTypeName], [SalaryCoefficient]) VALUES (N'ST0000000002', N'Tăng ca', CAST(1.500 AS Decimal(38, 3)))
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000001', N'PS0000000004', N'CT0000000001', N'TK001', N'$2a$11$VEE6T7SSK3aStGroj3B45etGi2zCBvQH/AhbZD/vStHs3lmzUbqNy', N'079202007088', N'Nguyễn', N'Gia', N'Huy', CAST(N'2002-04-17' AS Date), N'538/19', N'Đoàn Văn Bơ', N'15', N'4', N'Hồ Chí Minh', N'Nam', N'0906375047', N'nguyengiahuy@gmail.com', N'Cử nhân', CAST(N'2023-11-07' AS Date), CAST(N'2025-01-01' AS Date), N'Bình thường', 15, CAST(180000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000002', N'PS0000000001', N'CT0000000001', N'TK002', N'$2a$11$.7/UWffKM3jWgjzDROTcTeBR/lLtgPtOK0quY0e4PBfV/tUJIgblG', N'017393640008', N'Nguyễn', N'Thị Kim', N'Anh', CAST(N'1995-07-20' AS Date), N'10', N'Nguyễn Đình Chiểu', N'2', N'Ba Đình', N'Hà Nội', N'Nữ', N'0982374687', N'nguyenthikimanh@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(160000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000003', N'PS0000000002', N'CT0000000001', N'TK003', N'$2a$11$GEopin78yPKaooHI7ufKCOMosU9ChFzI7/BISqt6vj8YWnZ0qw0Sq', N'075216204157', N'Trần', N'Văn', N'Đức', CAST(N'2000-03-10' AS Date), N'25', N'Lê Lợi', N'7', N'Hoàn Kiếm', N'Hà Nội', N'Nam', N'0398340928', N'tranvanduc@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000004', N'PS0000000003', N'CT0000000001', N'TK004', N'$2a$11$X9EKRS8OvveiGEUoMwe9xO5mQmFrXX/3mPmSRATOBKlEeRQlW0aDq', N'089056428340', N'Lê', N'Thị Thu ', N'Hà', CAST(N'1996-02-08' AS Date), N'8', N'Nguyễn Công Hoan', N'8', N'Đống Đa', N'Hà Nội', N'Nam', N'0997346287', N'lethithuha@gamil.com', N'Cử nhân', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(100000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000005', N'PS0000000005', N'CT0000000001', N'TK005', N'$2a$11$gqdPUrR8H8v9jl4BixiyBesoSv4kAzdiEvoSPXgIl.Mg/x6Ax6zqO', N'014004907101', N'Nguyễn', N'Văn', N'Anh', CAST(N'2001-12-01' AS Date), N'12', N'Trần Hưng Đạo', N'5', N'1', N'Hồ Chí Minh', N'Nam', N'0923840982', N'nguyenvananh@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2035-01-16' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000006', N'PS0000000006', N'CT0000000001', N'TK006', N'$2a$11$1e7x57PGg7aN59Aznx6iFe4LG8ULux.edAv0HsBl/KFYZAUw1O4KG', N'051022983941', N'Trần', N'Thị', N'Bình', CAST(N'1996-07-11' AS Date), N'23', N'Đường Nguyễn Văn Cừ', N'Hòa Cường Bắc', N'Hải Châu', N'Đà Nẵng', N'Nữ', N'0989462387', N'tranthibinh@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2032-01-16' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000007', N'PS0000000007', N'CT0000000001', N'TK007', N'$2a$11$EkmFytFys9Fi6pb4yh6ZVeCAwpJXZwj9BDTaAnYQjGYkX6ECnjcVe', N'058294664085', N'Lê', N'Minh', N'Cường', CAST(N'2000-07-12' AS Date), N'56', N'Lê Văn Sỹ', N'13', N'3', N'Hồ Chí Minh', N'Nam', N'0972364328', N'leminhcuong@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(100000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000008', N'PS0000000008', N'CT0000000001', N'TK008', N'$2a$11$YypiMxuR6NstD8ZhFo9xU.hm/ESYiF9U8i1PETJY2bJq6rLGx05QS', N'017058728333', N'Hoàng', N'Thị', N'Điệp', CAST(N'1993-07-02' AS Date), N'78', N'Trần Phú', N'Phan Chu Trinh', N'Thanh Khê', N'Đà Nẵng', N'Nữ', N'0934578084', N'hoangthidiep@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000009', N'PS0000000009', N'CT0000000001', N'TK009', N'$2a$11$e16nM65zXPJt5aPIB836o.TAaHkpmnbgFZchs/zlstQ2L3rcUT20e', N'017284516329', N'Võ', N'Văn', N'Dương', CAST(N'2000-06-07' AS Date), N'34', N'Trần Phú', N'Phan Chu Trinh', N'Thanh Khê', N'Đà Nẵng', N'Nam', N'0923983778', N'vovanduong@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2035-12-16' AS Date), N'Bình thường', 15, CAST(90000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000010', N'PS0000000010', N'CT0000000001', N'TK010', N'$2a$11$nEsLKB4fKqxgvyzCNYaZZu3WwFsq4CinE5qcBwhIYhuanh0kXWDnG', N'026068818840', N'Võ', N'Văn', N'Dương', CAST(N'1999-06-10' AS Date), N'34', N'Nguyễn Thị Minh Khai', N'Đa Kao', N'1', N'Hồ Chí Minh', N'Nam', N'0389273898', N'vovanduong1@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2029-12-16' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000011', N'PS0000000011', N'CT0000000001', N'TK011', N'$2a$11$XfUxjmVl8Nkgt4oibyVlOumXo3Tb2TVL.xmwQljHxldV.tdY7N1nm', N'048265197919', N'Đặng', N'Thị', N'Loan', CAST(N'1997-02-20' AS Date), N'45', N'Trần Quốc Toản', N'9', N'3', N'Hồ Chí Minh', N'Nữ', N'0912832981', N'dangthiloan@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2029-10-03' AS Date), N'Bình thường', 15, CAST(100000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000012', N'PS0000000012', N'CT0000000001', N'TK012', N'$2a$11$PL25LxlskLJ50L19xPKxGeuUi6sFBBRx3D6XqqQ17FDHZW8groTJm', N'074239571953', N'Phạm', N'Minh', N'Khánh', CAST(N'1995-03-01' AS Date), N'67', N'Trần Hưng Đạo', N'Hòa Xuân', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0912798126', N'phamminhkhanh@gmail.com', N'Cử nhân', CAST(N'2023-12-16' AS Date), CAST(N'2029-06-20' AS Date), N'Bình thường', 15, CAST(80000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000013', N'PS0000000013', N'CT0000000001', N'TK013', N'$2a$11$6FjmpPYFdZnbgZuQi7ouYuwuZWclXjDvQBigVeg.GEbp7aS2tqyhi', N'035088353904', N'Bùi', N'Thị Ngọc', N'Lan', CAST(N'1989-06-14' AS Date), N'89', N'Lê Lợi', N'Hải Bắc', N'Sơn Trà', N'Đà Nẵng', N'Nữ', N'0971236263', N'buithingoc@gmail.com', N'Tiến sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2035-03-08' AS Date), N'Bình thường', 15, CAST(100000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000014', N'PS0000000014', N'CT0000000001', N'TK014', N'$2a$11$.yeDK1ri5KM06K.Lf3niy.cqCsVJ4FX1gHGH/Ywqn4fZDPJelQ53e', N'064011403202', N'Đỗ', N'Văn', N'Mạnh', CAST(N'1989-07-13' AS Date), N'10', N'Lê Duẩn', N'6', N'1', N'Hồ Chí Minh', N'Nam', N'0983749283', N'dovanmanh@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-02-13' AS Date), N'Bình thường', 15, CAST(80000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000015', N'PS0000000015', N'CT0000000001', N'TK015', N'$2a$11$yBHpJb3ucDnBLFVAP4VT6.Vk92VQ7P84ND20aoNCXlix/Vxp5XPya', N'087235277339', N'Ngô', N'Thị', N'Nga', CAST(N'1994-06-08' AS Date), N'32', N'Nguyễn Thị Định', N'Tân Phong', N'7', N'Hồ Chí Minh', N'Nữ', N'0912832189', N'ngothinga@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000016', N'PS0000000016', N'CT0000000001', N'TK016', N'$2a$11$kcaHm5mYQ7wUgCbrw2PjjOiKqp/49/D9ZPmbALHay2BFz39ARe732', N'064032517309', N'Trịnh', N'Đức', N'Phúc', CAST(N'1984-10-18' AS Date), N'54', N'Hai Bà Trưng', N'Cẩm Sơn', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0924981734', N'trinhducphuc@gmai.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2026-12-16' AS Date), N'Bình thường', 15, CAST(100000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000017', N'PS0000000017', N'CT0000000001', N'TK017', N'$2a$11$0ZlY5k2l/c.zTE4Rna46K.drLOUb548HavzLxV/CVs75ru9/VNFcC', N'062020928900', N'Lương', N'Thị', N'Quỳnh', CAST(N'1990-07-11' AS Date), N'76', N'Trần Cao Vân', N'Phước Mỹ', N'Sơn Trà', N'Đà Nẵng', N'Nam', N'0917239812', N'luongthiquynh@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(80000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000018', N'PS0000000018', N'CT0000000001', N'TK018', N'$2a$11$s2SfW/6gcOZKZkf3Wd/TIuxdgJCV2R3mjTImvLy6ifqHMe7TcGYVG', N'058287310671', N'Hoàng', N'Văn', N'Sơn', CAST(N'1994-12-16' AS Date), N'21', N'Nguyễn Văn Linh', N'Bình Thuận', N'Hải Châu', N'Đà Nẵng', N'Nam', N'0912367936', N'hoangvanson@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-06-12' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000019', N'PS0000000019', N'CT0000000001', N'TK019', N'$2a$11$L3iZDo/U/RvL5t9VchQqRuzbtyaE4EcAoipJp5JxfdPC0BaX6iia2', N'034254242575', N'Đinh', N'Văn', N'Tiến', CAST(N'1994-06-14' AS Date), N'65', N'Trần Hưng Đạo', N'7', N'3', N'Hồ Chí Minh', N'Nam', N'0912830873', N'dinhvantien@gmail.com', N'Cấp 3', CAST(N'2023-12-16' AS Date), CAST(N'2026-06-11' AS Date), N'Bình thường', 15, CAST(80000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000020', N'PS0000000020', N'CT0000000001', N'TK020', N'$2a$11$79yjP.2pmh0NnnGCXZjf5.LqfWgpntzSrb1O9PtMMF6Pj/iXQkckO', N'094274061880', N'Trần', N'Đức', N'Vương', CAST(N'1994-06-09' AS Date), N'14', N'Nguyễn Hữu Thọ', N'Khuê Trung', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0923748927', N'tranducvuong@gmail.com', N'Thạc sĩ', CAST(N'2023-10-01' AS Date), CAST(N'2027-07-22' AS Date), N'Bình thường', 15, CAST(60000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000021', N'PS0000000021', N'CT0000000001', N'TK021', N'$2a$11$yAkQMMiYF/Er1b1cEsbJ8e36RIA4DS9F9prILe8OslCMdA4HEJS6i', N'087263779691', N'Hoàng', N'Văn', N'Yên', CAST(N'1998-07-16' AS Date), N'58', N'Trần Phú', N'Hoà Xuân', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0952798173', N'hoangvanyen@gmail.com', N'Thạc sĩ', CAST(N'2023-10-01' AS Date), CAST(N'2030-07-11' AS Date), N'Bình thường', 15, CAST(30000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000022', N'PS0000000006', N'CT0000000001', N'TK022', N'$2a$11$gOhZTNlBlpqE7s31bANed.qyH45X2dcTECxhiZ6l4BzbkoPl78OUC', N'077056253539', N'Phạm', N'Thị', N'Đan', CAST(N'2000-06-23' AS Date), N'77', N'Lê Duẩn', N'4', N'1', N'Hồ Chí Minh', N'Nam', N'0912377812', N'phamthidan@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-12-16' AS Date), N'Bình thường', 15, CAST(100000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000023', N'PS0000000006', N'CT0000000001', N'TK023', N'$2a$11$CJsQi9ZTkkFaTZOSZZkZ6efPR4C5qTZuX8AMO0XKt7.0G5V2uEeka', N'022314402483', N'Đỗ', N'Văn', N'Cường', CAST(N'1999-02-10' AS Date), N'18', N'Lê Duẩn', N'3', N'1', N'Hồ Chí Minh', N'Nam', N'0982713671', N'dovancuong@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2025-11-07' AS Date), N'Bình thường', 15, CAST(90000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000024', N'PS0000000006', N'CT0000000003', N'TK024', N'$2a$11$k0cOLudO2nvaDjHXfX394upDDHchPl1ZlfzorUeUzz/Ik.SYHA8su', N'022374689884', N'Phạm', N'Minh', N'An', CAST(N'2002-07-06' AS Date), N'12', N'Trần Hưng Đạo', N'An Hải Bắc', N'Sơn Trà', N'Đà Nẵng', N'Nam', N'0982173163', N'phamminhan@gmail.com', N'Đại học (năm 4)', CAST(N'2023-10-16' AS Date), CAST(N'2024-03-16' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000025', N'PS0000000018', N'CT0000000001', N'TK025', N'$2a$11$vD64CR69kVKtmVe.soDlY.QfLDFQPjOtl4KUdSimk6MZJxT6y17nu', N'080337297248', N'Đặng', N'Minh', N'Công', CAST(N'1999-12-08' AS Date), N'56', N'Trần Phú', N'Hòa Thọ Tây', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0912382187', N'dangminhcong@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2030-10-12' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000026', N'PS0000000009', N'CT0000000001', N'TK026', N'$2a$11$yoU6U1NjHtrVyCxtJlbYCeONt3.r5iH8JxXlQTdqkLUgkbF6cmqzC', N'024067364689', N'Trần', N'Đức', N'Duy', CAST(N'1999-06-05' AS Date), N'15', N'Nguyễn Hữu Thọ', N'Khuê Trung', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0912836163', N'tranducvuong1@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2030-05-29' AS Date), N'Bình thường', 15, CAST(80000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000027', N'PS0000000009', N'CT0000000001', N'TK027', N'$2a$11$GHHPziNU5afuZ6zSF/QvMuBu8kr/F3JJMkd7PDsdO4k7.Yw/OBRzO', N'025302013027', N'Lê', N'Thị', N'Xuân', CAST(N'1994-01-14' AS Date), N'37', N'Nguyễn Thị Thập', N'Tân Quy', N'7', N'Hồ Chí Minh', N'Nữ', N'0912880773', N'lethixuan@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2030-02-15' AS Date), N'Bình thường', 15, CAST(80000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000028', N'PS0000000009', N'CT0000000001', N'TK028', N'$2a$11$BB2WriJ36AFuot5zkPOhsehvk6aamawPJSD6T9j9A5vmZN2Dtcx0a', N'025335351096', N'Hoàng', N'Văn', N'Yên', CAST(N'1994-07-22' AS Date), N'59', N'Trần Phú', N'Hoà Xuân', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0921876378', N'hoangvanyen1@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2026-06-06' AS Date), N'Bình thường', 15, CAST(70000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000029', N'PS0000000009', N'CT0000000003', N'TK029', N'$2a$11$o9Fw68gnPEv1dG6FFEWAE.9x06cjJId3YYrP5ffCu70Q.Svf2MkHy', N'077328292683', N'Võ', N'Thị', N'Duyên', CAST(N'1994-07-06' AS Date), N'12', N'Lê Duẩn', N'5', N'1', N'Hồ Chí Minh', N'Nữ', N'0921876381', N'vothiduyen@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2030-08-08' AS Date), N'Bình thường', 15, CAST(70000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000030', N'PS0000000012', N'CT0000000001', N'TK030', N'$2a$11$fWwsJirRkWlgkqJCY4wtrublJCsK8zsT8fZDpRI/UFdo7b/h/MG86', N'020074823586', N'Võ', N'Văn', N'Ích', CAST(N'1989-06-24' AS Date), N'16', N'Nguyễn Văn Linh', N'Hoà Hiệp Nam', N'Liên Chiểu', N'Đà Nẵng', N'Nam', N'0981265318', N'vovanich@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2030-08-22' AS Date), N'Bình thường', 15, CAST(60000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000031', N'PS0000000012', N'CT0000000001', N'TK031', N'$2a$11$7vtSNlG3.CaDf4bflZw/lOsMMe2HqrgjWoxrakL2gz8suNSvpZcBm', N'011288654216', N'Phạm', N'Minh', N'Anh', CAST(N'1994-06-11' AS Date), N'60', N'Trần Phú', N'An Hải Băc', N'Sơn Trà', N'Đà Nẵng', N'Nữ', N'0912732618', N'phamminhanh@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2030-06-08' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000032', N'PS0000000018', N'CT0000000001', N'TK032', N'$2a$11$DVB1yKRDRwPfPfv3MzU8gOYF5n6jGSaB7cse5J8/ReYbkSl/5Pbna', N'035332791190', N'Bùi', N'Thị', N'Bình', CAST(N'1989-01-04' AS Date), N'82', N'Nguyễn Văn Cừ', N'Hoà Cường Bắc', N'Hải Châu', N'Đà Nẵng', N'Nữ', N'0921876426', N'buithibinh@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2025-06-12' AS Date), N'Bình thường', 15, CAST(4000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000033', N'PS0000000015', N'CT0000000001', N'TK033', N'$2a$11$Xtc5rumfdtr1w4V9rs8.bu5ouUqvisK/BQwi4UZv0.BB4zuPJEMMO', N'022314402323', N'Đỗ', N'Văn', N'Cường', CAST(N'1989-06-15' AS Date), N'18', N'Lê Duẩn', N'3', N'1', N'Hồ Chí Minh', N'Nam', N'0981272162', N'dovancuong1@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2026-09-16' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000034', N'PS0000000015', N'CT0000000001', N'TK034', N'$2a$11$jJFFlA3/8kkZxkjz0.bdieEHaQ3.OmSUv5/2t/CKVK15Mth9eJxCS', N'096291293409', N'Trịnh', N'Đức', N'Phát', CAST(N'1998-11-13' AS Date), N'62', N'Hai Bà Trưng', N'Cẩm Sơn', N'Cẩm Lệ', N'Đà Nẵng', N'Nam', N'0921874682', N'trinhducphat@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2029-07-10' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000035', N'PS0000000018', N'CT0000000001', N'TK035', N'$2a$11$7YDVK5Lu3wx/ONvLVxpzkO4G7n6H3JSbzlfvTvrSbIcYmURnVJU0O', N'056391889058', N'Lê', N'Minh', N'Hải', CAST(N'1991-02-07' AS Date), N'64', N'Trần Cao Vân', N'An Hải Tây', N'Sơn Trà', N'Đà Nẵng', N'Nam', N'0929178467', N'leminhhai@gmail.com', N'Thạc sĩ', CAST(N'2023-10-16' AS Date), CAST(N'2028-06-17' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000036', N'PS0000000018', N'CT0000000001', N'TK036', N'$2a$11$ZsX56Ajgkp4FH7lYE5qPveKoQlHAb.eut3tQ9lhDm7283hECuZKJ2', N'036313517887', N'Hoàng', N'Thị', N'Trúc', CAST(N'1998-02-06' AS Date), N'82', N'Lê Hồng Phong', N'9', N'5', N'Hồ Chí Minh', N'Nữ', N'0981723681', N'hoangthitruc@gmail.com', N'Cử nhân', CAST(N'2023-10-16' AS Date), CAST(N'2025-07-25' AS Date), N'Bình thường', 15, CAST(40000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000037', N'PS0000000018', N'CT0000000001', N'TK037', N'$2a$11$voCbZLxkKjKcVisdQOnPQOa.g6mUb7r8VqlILNhwJIKADHiK22ELu', N'074389601091', N'Hoàng', N'Minh', N'Việt', CAST(N'1991-07-13' AS Date), N'17', N'Trần Quốc Toản', N'8', N'3', N'Hồ Chí Minh', N'Nam', N'0982176421', N'hoangminhviet@gmail.com', N'Cử nhân', CAST(N'2023-10-16' AS Date), CAST(N'2030-08-15' AS Date), N'Bình thường', 15, CAST(40000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000038', N'PS0000000018', N'CT0000000001', N'TK038', N'$2a$11$rA5YAJVBLXQcNhlCzEpaiuNw4lXq5Igb4TBZNrh15HR4XjCW0lJwK', N'019000082963', N'Lê', N'Văn', N'Hiếu', CAST(N'1991-03-12' AS Date), N'23', N'Trần Hưng Đạo', N'4', N'1', N'Hồ Chí Minh', N'Nam', N'0912973687', N'levanhieu@gmail.com', N'Thạc sĩ', CAST(N'2023-12-16' AS Date), CAST(N'2030-06-13' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000039', N'PS0000000018', N'CT0000000001', N'TK039', N'$2a$11$Ka2Y3thdsYK0GCsK5V3oBuK8ThjDzEqrFpRfZ1jP6KCobjfvBf41S', N'027203452571', N'Phạm', N'Thị', N'Thu', CAST(N'2000-06-16' AS Date), N'12', N'Lê Lợi', N'2', N'5', N'Hồ Chí Minh', N'Nữ', N'0921838721', N'phamthithu@gmail.com', N'Cử nhân', CAST(N'2023-12-16' AS Date), CAST(N'2025-06-05' AS Date), N'Bình thường', 15, CAST(40000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000040', N'PS0000000018', N'CT0000000001', N'TK040', N'$2a$11$BmGfAKK1klArJ3cViHApqOs2lcjZ3JqN/rWDtXr4cUNHt2Y9z5lVG', N'049319155093', N'Trần', N'Văn', N'An', CAST(N'1995-09-15' AS Date), N'89', N'Võ Văn Kiệt', N'8', N'10', N'Hồ Chí MInh', N'Nam', N'0936182736', N'tranvanan@gmail.com', N'Cử nhân', CAST(N'2023-12-16' AS Date), CAST(N'2025-10-15' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000041', N'PS0000000018', N'CT0000000001', N'TK041', N'$2a$11$Shve.CbmKJpfsLxScOMLYO.KqBhXZ20cfNaXYUCSwG0tGlAgt1Phy', N'046318327408', N'Hoàng', N'Thị', N'Lan', CAST(N'1991-08-02' AS Date), N'56', N'Nguyễn Huệ', N'5', N'1', N'Hồ Chí Minh', N'Nữ', N'0982173621', N'hoangthilan@gmail.com', N'Cử nhân', CAST(N'2023-10-16' AS Date), CAST(N'2025-11-06' AS Date), N'Bình thường', 15, CAST(40000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000042', N'PS0000000021', N'CT0000000001', N'TK042', N'$2a$11$sZf5aEXcuBhHxVkLzBuRkOTY0eruMPrpv9.48j1mBx/zvCqdSpg8.', N'074389601391', N'Nguyễn', N'Văn', N'Hoàng', CAST(N'1989-11-16' AS Date), N'72', N'Tôn Thất Thuyết', N'7', N'4', N'Hồ Chí Minh', N'Nam', N'0981273621', N'nguyenvanhoang@gmail.com', N'Cử nhân', CAST(N'2023-10-16' AS Date), CAST(N'2025-07-18' AS Date), N'Bình thường', 15, CAST(50000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000043', N'PS0000000021', N'CT0000000001', N'TK043', N'$2a$11$/h2SPp3ZRQI5EOwyfGW2Iufnq7/eakZmc3y6/.U6lHkMHWIbwwEeq', N'092256281530', N'Đỗ', N'Văn', N'Khánh', CAST(N'1998-07-07' AS Date), N'18', N'Bùi Viện', N'Phạm Ngũ Lão', N'1', N'Hồ Chí Minh', N'Nam', N'0928137671', N'dovankhanh@gmail.com', N'Cử nhân', CAST(N'2023-10-16' AS Date), CAST(N'2025-07-17' AS Date), N'Bình thường', 15, CAST(40000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000044', N'PS0000000021', N'CT0000000001', N'TK044', N'$2a$11$FloIS84MYR3at.Plipxayuh3yHFFllRewxCcmzmR/03LM35.S984C', N'086234266223', N'Trần', N'Văn', N'Tuấn', CAST(N'1991-03-14' AS Date), N'63', N'Nguyễn Chí Thanh', N'12', N'5', N'Hồ Chí Mịnh', N'Nam', N'0981273623', N'tranvantuan@gmail.com', N'Cử nhân', CAST(N'2023-10-16' AS Date), CAST(N'2025-07-18' AS Date), N'Bình thường', 15, CAST(40000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000000D7000000D70806000000897DC4B50000000467414D410000B18F0BFC6105000000097048597300002E2300002E230178A53F7600000FD049444154785EED9DF96F15D51B87FD1FDC15057751C428C1681415F725C625C6F88B6282C6F88389311A13351AD7C48510FC498D71890B6A8CE212B7C404AC4B90E2AE88A086D2A240D9A45050F4C8E7A4EFFD1EA6D3F6B633EF5DBEF33CC987B9BDB4F7CE9CBE4FCFCCB96766765BBC787158B16245E8EAEA0A2B57AE2484148C5CEAECEC0CBB49AC7FFEF927ECD8B1232E0921C5F2EFBFFF46C176EBEEEEAE3D4108291EF924AFA25CF6240014472E69F710B9004A06B9009C402E0027900BC009E4027002B9009C402E00276A72E91F7DA10FBE00A038C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C004E20178013C805E004720138815C2D82DA5E31D2C7C361DF97FEEEB2AF05CD41BF03E46A014C08B5BF963B76EC888FB76CD912962D5B16E6CF9F1FE6CD9B17E6CE9D1B5E7AE9A5F0CE3BEF844F3EF924AC58B1226CDDBA35FCFDF7DFF1FBFFFAEBAFB8B49F87E6815C2D402AC3E6CD9BC382050BC25D77DD15CE39E79C70D04107857DF6D927668F3DF6087BEDB557CC9E7BEE199FDB7BEFBDC3E1871F1E2EBAE8A2F0D0430F85458B1685FEFEFEF87A0A340FE46A306A635B5AD4EB2C5DBA34DC73CF3D61F2E4C9511E49A3482089645F9B5C2698A2C712CF1E4F993225CC9E3D3B747777D7C4B5F7D2D75A823F6A67E46A2056E496E5CB97871B6EB8218C1B372ECA6382148D5E67C28409B107ECE9E9A9F58CB6047FF4FB45AE066252F5F5F58559B3664501AC47522F9595642C9158FBEEBB6FECCDF4DA471C714478F9E597E3EE223D57E340AE0660EDAAA5061C7EFDF5D770FEF9E79726D350497B41BDD735D75C137A7B7B6B831EB66EE003723500B5A9A5A3A3231C7DF4D1A5EDFE8D36279E786258B264C92EC761E0037235002BE2B7DF7E3B1C7CF0C1B945DFA848EA891327C651450DA420971FC8E584B5A596EA25DE7FFFFD38689157F08D8E04D371D877DF7DB7CB3A6A09E5A1F6442E07D2A2EDECEC0CE3C78F773FC6AA371AE8D0BA1C7BECB1A1ABAB8B11442790CB09136BD5AA55E1B8E38E8B45DD2A726904D13E17BBF0C20BE32C107EEFE5835C4E482C1DD35C7BEDB5B905DE4A79F0C107E3BA42B92097136A4BCDFFCB2BE6568A7A31EDB27EF3CD37719DA13C90CB01B5E3B66DDBC2D4A9535B665770A8D8AC904B2EB984DEAB6490AB64B43BA83CF3CC3351AC667D9E556FB47E5ACFFDF6DB2FCEBC6770A33C90AB64D4869AD97EF2C927C7C2B5A94DAD1AAD5FDA7BE9F7AF6D80E22057C9A8FD3EFCF0C396EFB12C2696969A8FF8E38F3FC6DE0B8A835C25A2F6D371CB8C1933DA46AE345AE7071E78801A2809E42A11B5DF860D1BE2EC8756DF1DCC8BE43AF5D453E3C45E280E729588DA6FE1C285B985DB0EB15D439D6409C541AE1251FB3DF6D8636DD96B59B4EE6FBEF9E6C016411190AB44D47E3A67AA1D8FB72C92EBFEFBEF1FD822280272958846D9A64D9B168BB45D0734B4BCEEBAEB06B6088A805C25A24B9C4D9A34A92D3E3C1E2AEAB92EBEF8E2580B500CE42A914D9B36C5914289D5AEC75D5AEFB3CF3E1BB94A00B94A44C3F0871D76582CD076EDB9B4DED3A74FA70E4A00B94A64E3C68DF1029DED2A96A23F0C679E79263D5709205789E8A4431D73B5B35C5A778EB9CA01B94A44539F345AB8FBEEBBB7A5605A67F55C8C169603729588DA4FF30A55A0E975DDDB29124C6726437190AB44D47E73E6CCC92DDA7689FE28BCF5D65B035B044540AE1251FBB5F3DC4265FFFDF78F578482E22057C9AC5BB72E7ED69557B8ED90D34E3B8DF3B94A02B94A46ED77D55557B5ED80C67DF7DD17EB008A835C25A2F6537426B28A55031BD9026EE5E83A1A3FFCF00317AA2909E42A116B3F7DDED52ED7D04863D7D0A006CA01B99C78EEB9E76A57B5CD2BE45689D64FD149921F7DF451FCFDAB0EA038C8E58466C8EB763D7905DD4A51CFAA5C76D965F1F47E6AA03C90CB09B5A36E19D40EBB85BAA9F9B7DF7E5BBB66A1EA008A835C4EA850D513CC9C393316B0ED7E650BBB19D17A98F47AAC1B9D73519AF2412E27D48E1A75D35D4E74AB9EB4A05B21B63BA8BB9CE822A67CB6553EC8E584DAD176B3346B437794B49EAB599265DFF7F8E38FAFDD9F0BB9CA07B91A800A57773CD1B18D046BF6A45EADC391471E19BEFCF24B7EDF8E205703B09E61DEBC79E190430EA91578B6E8BD63775C39EAA8A3C2679F7DC6719633C8D500AC5D25D8C71F7F1CEFE69FEEA279EE26EAB5D3DDD1934E3A29CEC2D0FA3013C317E46A30EA2D7EFBEDB770DE79E7C59E4405EFBD9B28B9F421F1D5575F1D56AF5ECDF1558340AE06A3C2561B6B84EE91471E09071E78A06BCF65C7572FBEF862FC605B72D3633506E46A306A6343A2FDFCF3CFE1FAEBAF0F071C70C02E42A4CB7AE453EF67DFA7A5A211CA5B6FBD35F6567ADF34E08FDA19B99A80B5B596EA49962F5F1E6EBBEDB6DA9DFF53A14CB26CF47C5640ED6A9E70C209F192D4BAA1825E5F126B098D456D8E5C4DC20ADF7615259976DD34E871CB2DB784B3CE3A2B5EAA4D6707A752A519376E5CDCED3BF7DC73C3BDF7DE1B162F5E1CB66FDF1E77FFB4B4D746AEC6835C2D8CC4D0557C7FF9E597B060C182F0DA6BAF85E79F7F3EBCF0C20BF14E249F7EFA691C1CE9EBEB8BDF0BAD0572B538D6EB6497F698DF57EBA2DF1172B528A94843055A17FD7E90CB19EB61D2E31F7BACA58EB5D6AC5913BEFFFEFB78BCF5DE7BEFC5DD3ECDE878E38D37EA8ABE579744FBE0830F42474747FCA0B8B7B7371E7B9988F69E7A3F7B4E5F830F6A5FE46A006A5B15B58A7DD9B265E1D5575F0D77DC7147B8E0820BC2A1871E1A072734D2675394469B7418DE5E47831D9AEA74E9A597C6C10E9D5FD6D3D3334830F001B94A245BA8F6F5B66DDBE22459DD295FD38F345B42C56F43E9E930BA967ACE2E893D9A98682699BD965ED7A4D352375A983D7B76F8E9A79FA26406A2950B729588B59FA25DB0B56BD786679F7D365EACC68A3B15A05991705A1F5DED493DA7762775FB2389A67557EF0AC541AE1251FBA9303523E2D1471F8D1707552F95F622D9426F46AC37D363AD9B3265CA94F0E4934FC6A17FFD6180E220D718B176529BD95297547BFCF1C7E3718E156E5AD0E9D7AD90547A7BACD91DAFBFFEFA2EBB8BC2B613EA07B9C688B595FECA2B5F7CF14538E38C335AA6771A4B2498D65FBDEDE5975F1E962E5D1AB7CDB695DA181DC83546ACD8343B429780D614A5B427C8166EBB44BB8B76BD459DD8F9F4D34F87FEFE7E6A630C20D72830A12C9A7AA40BBC482AFBABAF02B5AFB385DBEAD1FA67D75DCFE90A56FA1C4EF5910686476D845C75A25D240D58E87864FEFCF9F18CE276EEA5EA8D3E1648CF60B65D45181EE41A0526973E00D6C56654785590CB7A650DD47CFEF9E7B11DA8939141AE11507BA85D14F55873E7CE8D331FF28AB00AD129309AA2A57651D4266A1B180C728D80C9A5A54EF918EEDCAAFFF7A8F75274FED8A2458B6A3D39E4835C23A03651748C357EFCF8DA2E525EF15521B6FDC71C734C58B26449AD7D60306A17E41A06B589AE73A1BFD679C556D548300D72D82822C7618341AE1CD40EB6D49CBBE9D3A757BAB7CA8B0DD75F71C515F17330D50DB5B32BC8350CBA06C58D37DE188BA85526DDB64A4C2E2D358F523D5776CA54D541AE1CD40E2A16CD16D754A06C61915DA36B2F7EF5D557D44E06E4CA41626966BB6EFD93574C6470740561F5F4F03F902B83B5C19D77DEC9AE609DB1DE5DF310D336AC3AC895A0ED577486EE840913E22006031923C7DA48F7FBD200906A48ED5875906B006DB7A25D425D5E9A5E6B7431C11E7EF8E15A3B561DE41AC00A42E7306937C7EE3C62A36264F8D81FA3C9932787F5EBD7D373ED04B91234947CFBEDB72354C13CF5D453F45C3B41AE04FDC5B53B3F92B1E794534E891F2C571DE41A40DBFECA2BAFC45E8B418CB147EDA75D447DEE5575906B00EDC65C79E595C855306A3BC9A5DD6BD593A58A20D7001A42D6099076FD88BCC221F547F719D3C550554FC8B5F39F2ACAA5ED55AFA54B3DABD7B2E4150CA93FBAE0E8D75F7F1D6B0AB976FE5345B96C9B6FBEF9E6B83B23B1BC6F005E953CF1C413F45C2B2B2C9786DF3527EEF4D34FAFED0ED273959319336620D7CA8AF75C3ADE6208BEFC4C9D3AB5D2D7D8A8B45CDA5E45B332F28A83148B2EE4A3CF0EABFA8172A5E512DAE677DF7D975D41A7D8A04615A9B45CDA5E4507DE7985418A45C7B0BA4B2672EDFCA7AA72DD7DF7DDB9C5418A47E77821D7CE7FAA2697D0F1C04D37DDC46EA153E6CC9953B99A322A2F97B659371AC82B0C523C3ABF4B6D5C452A2F97868A757224539ECA8F3E8C9F356B167255552EED166A367C562E7D4D469FF40C6E5DFABBA3A383A1F8AACAA5EDD50453EDBEE8434F9D49ABBB794C9A34898C2113274E8CCB69D3A6C59BADEB5AF2C85561B91415802453541064ECD9BA756B5C6A97DBDAB78A545E2E002F900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B99A88DADBE245FA1E69C01FB533723589B4D81B1DF047ED8C5C4DC20A5D6DEE157B8F6CC01FB53372D5C950C5993E9F265BE88A6E0F9B8D6E6F6AD1ED4EB76FDF1E93DE0AD59ECB26EF7BF4D85E2FFB1E7A9CB75E4ADE362829433D0F83511B21579DA48595265BA48A15B39216BEDD7759E9EFEF8FD13D842D5BB66C097D7D7D317A6CD9BC79F3A064BF27FD397B3D7B0F8BAD87252B62DEB6E46DB302C3A33642AE3A490B2B2D3EEB1DD21EC28A374F2293C124F9F3CF3FC3A64D9B62366CD810D6AF5F1FD3DBDB5B77D6AD5B57FBB98D1B37D65E4FAF9D9531154FEB978A66B2A5DB946E6BDA06303C6A23E41A86B498D2A4059716A20AD37A2A156E2A93F52CA95012C18492206BD7AE0D6BD6AC09AB57AF0E7FFCF147F8FDF7DFC3AA55AB427777F7A0F4F4F4C4FFD3F729FA19FDAC5E23154EEF61C2996CA968269989960A966E6736D616908FDA06B986C10A289BB4C886922B2B98157456B0543209213124492AD970B1EFCD4AA5D753F4DA7AAFA1C4526C5D91AB3CD436C8354AACA8ACBDD2986026595634C50A3ADBABA9F04DBAAC78C3C57A2493C704B2984843F552269325FD6391DDBE74DB6178D446C83506D222CB8BDAD10A342D5C2BE654BA34A97C2681899097F47BECE7F2BE4F49DF3B4FA4BCEDC806EA47ED855C6360A4824BFFDFFEEA2B233DAFC756ECE9FF8F945492BCFF57F2DE3B7D0ECA456D8A5C2DCC48853FD2FF43F3D0EF05B9001C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E4027002B9009C402E0027900BC009E40270A22657575717720194484DAECECECE20C1F40521A478749BA7CECECEF01F3DF788A230E0EA980000000049454E44AE426082, NULL)
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000001', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:26:33' AS Time), CAST(N'17:01:07' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000001', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:07' AS Time), CAST(N'17:01:07' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000005', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:10' AS Time), CAST(N'17:01:22' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000005', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:22' AS Time), CAST(N'17:01:22' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000006', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:12' AS Time), CAST(N'17:01:24' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000006', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:24' AS Time), CAST(N'17:01:24' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000022', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:59' AS Time), CAST(N'17:02:18' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000022', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:18' AS Time), CAST(N'17:02:18' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000023', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:01' AS Time), CAST(N'17:02:21' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000023', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:21' AS Time), CAST(N'17:02:21' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000024', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:03' AS Time), CAST(N'12:03:31' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000024', N'SH0000000002', N'ST0000000001', 0, CAST(N'12:07:33' AS Time), CAST(N'17:25:05' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000007', N'S0000000002', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:29:46' AS Time), CAST(N'17:01:15' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000007', N'S0000000002', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:15' AS Time), CAST(N'17:01:15' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000007', N'S0000000003', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:05' AS Time), CAST(N'17:01:18' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000007', N'S0000000003', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:18' AS Time), CAST(N'17:01:18' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000007', N'S0000000004', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:07' AS Time), CAST(N'17:01:20' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000007', N'S0000000004', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:20' AS Time), CAST(N'17:01:20' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000007', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:14' AS Time), CAST(N'17:01:26' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000007', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:26' AS Time), CAST(N'17:01:26' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000008', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:16' AS Time), CAST(N'17:01:29' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000008', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:29' AS Time), CAST(N'17:01:29' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000009', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:19' AS Time), CAST(N'17:01:31' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000009', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:31' AS Time), CAST(N'17:01:31' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000026', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:09' AS Time), CAST(N'17:02:27' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000026', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:27' AS Time), CAST(N'17:02:27' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000027', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:12' AS Time), CAST(N'17:02:30' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000027', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:30' AS Time), CAST(N'17:02:30' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000028', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:14' AS Time), CAST(N'17:02:32' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000028', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:32' AS Time), CAST(N'17:02:32' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000029', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:17' AS Time), CAST(N'12:29:15' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000013', N'S0000000029', N'SH0000000002', N'ST0000000001', 0, CAST(N'12:29:26' AS Time), CAST(N'17:40:24' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000010', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:28' AS Time), CAST(N'17:01:43' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000010', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:43' AS Time), CAST(N'17:01:43' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000011', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:31' AS Time), CAST(N'17:01:45' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000011', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:45' AS Time), CAST(N'17:01:45' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000012', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:33' AS Time), CAST(N'17:01:47' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000012', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:47' AS Time), CAST(N'17:01:47' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000030', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:19' AS Time), CAST(N'17:02:40' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000030', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:40' AS Time), CAST(N'17:02:40' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000031', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:22' AS Time), CAST(N'17:02:42' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000018', N'S0000000031', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:42' AS Time), CAST(N'17:02:42' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000013', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:36' AS Time), CAST(N'17:01:49' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000013', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:49' AS Time), CAST(N'17:01:49' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000014', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:38' AS Time), CAST(N'17:01:54' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000014', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:54' AS Time), CAST(N'17:01:54' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000015', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:41' AS Time), CAST(N'17:01:56' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000015', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:56' AS Time), CAST(N'17:01:56' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000033', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:26' AS Time), CAST(N'17:02:46' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000033', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:46' AS Time), CAST(N'17:02:46' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000034', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:29' AS Time), CAST(N'17:02:51' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000023', N'S0000000034', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:51' AS Time), CAST(N'17:02:51' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000016', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:43' AS Time), CAST(N'17:01:57' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000016', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:01:57' AS Time), CAST(N'17:01:57' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000017', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:46' AS Time), CAST(N'17:02:07' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000017', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:07' AS Time), CAST(N'17:02:07' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000018', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:49' AS Time), CAST(N'17:02:09' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000018', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:09' AS Time), CAST(N'17:02:09' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000025', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:05' AS Time), CAST(N'17:02:25' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000025', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:25' AS Time), CAST(N'17:02:25' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000032', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:24' AS Time), CAST(N'17:02:44' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000032', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:44' AS Time), CAST(N'17:02:44' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000035', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:31' AS Time), CAST(N'17:42:05' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000035', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:42:05' AS Time), CAST(N'17:42:05' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000036', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:32' AS Time), CAST(N'17:03:00' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000036', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:00' AS Time), CAST(N'17:03:00' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000037', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:35' AS Time), CAST(N'17:03:04' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000037', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:04' AS Time), CAST(N'17:03:04' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000038', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:37' AS Time), CAST(N'17:03:10' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000038', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:10' AS Time), CAST(N'17:03:10' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000039', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:40' AS Time), CAST(N'17:03:11' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000039', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:11' AS Time), CAST(N'17:03:11' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000040', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:43' AS Time), CAST(N'17:03:18' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000040', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:18' AS Time), CAST(N'17:03:18' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000041', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:45' AS Time), CAST(N'17:03:20' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000028', N'S0000000041', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:20' AS Time), CAST(N'17:03:20' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000019', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:52' AS Time), CAST(N'17:02:11' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000019', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:11' AS Time), CAST(N'17:02:11' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000020', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:55' AS Time), CAST(N'17:02:14' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000020', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:14' AS Time), CAST(N'17:02:14' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000021', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:30:58' AS Time), CAST(N'17:02:16' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000021', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:02:16' AS Time), CAST(N'17:02:16' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000042', N'SH0000000003', N'ST0000000001', 0, CAST(N'17:44:33' AS Time), CAST(N'22:26:00' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000042', N'SH0000000004', N'ST0000000001', 0, CAST(N'22:26:00' AS Time), CAST(N'04:26:32' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000043', N'SH0000000001', N'ST0000000001', 0, CAST(N'07:31:50' AS Time), CAST(N'17:03:36' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000043', N'SH0000000002', N'ST0000000001', 0, CAST(N'17:03:36' AS Time), CAST(N'17:03:36' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000044', N'SH0000000002', N'ST0000000001', 0, CAST(N'07:31:52' AS Time), CAST(N'17:03:38' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000044', N'SH0000000003', N'ST0000000001', 0, CAST(N'17:44:39' AS Time), CAST(N'22:26:13' AS Time))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000033', N'S0000000044', N'SH0000000004', N'ST0000000001', 0, CAST(N'22:26:13' AS Time), CAST(N'04:26:36' AS Time))
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000001', N'Liên ca')
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000002', N'Từng ca')
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000001', N'S0000000001', CAST(N'2023-11-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000007', N'S0000000002', CAST(N'2023-11-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000013', N'S0000000007', CAST(N'2023-11-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000018', N'S0000000010', CAST(N'2023-11-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000023', N'S0000000013', CAST(N'2023-11-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000028', N'S0000000016', CAST(N'2023-11-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000033', N'S0000000019', CAST(N'2023-11-06' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AllowanceName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Allowance] ADD  CONSTRAINT [UQ_AllowanceName] UNIQUE NONCLUSTERED 
(
	[AllowanceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardTypeName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[CardType] ADD  CONSTRAINT [UQ_CardTypeName] UNIQUE NONCLUSTERED 
(
	[CardTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ContractTypeName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[ContractType] ADD  CONSTRAINT [UQ_ContractTypeName] UNIQUE NONCLUSTERED 
(
	[ContractTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DepartmentName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UQ_DepartmentName] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_InterfaceName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Interface] ADD  CONSTRAINT [UC_InterfaceName] UNIQUE NONCLUSTERED 
(
	[InterfaceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_OperationName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Operation] ADD  CONSTRAINT [UC_OperationName] UNIQUE NONCLUSTERED 
(
	[OperationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PositionName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [UQ_PositionName] UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_BeginTime]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_BeginTime] UNIQUE NONCLUSTERED 
(
	[BeginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_EndTime]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_EndTime] UNIQUE NONCLUSTERED 
(
	[EndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_ShiftName] UNIQUE NONCLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftTypeName]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[ShiftType] ADD  CONSTRAINT [UQ_ShiftTypeName] UNIQUE NONCLUSTERED 
(
	[ShiftTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Account] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardID]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_CardID] UNIQUE NONCLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CheckWorkSchedule]    Script Date: 7/11/2023 4:31:08 AM ******/
ALTER TABLE [dbo].[TimeKeeping] ADD  CONSTRAINT [UQ_CheckWorkSchedule] UNIQUE NONCLUSTERED 
(
	[WS_ID] ASC,
	[StaffID] ASC,
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllowanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_AllowanceDetail_Allowance] FOREIGN KEY([AL_ID])
REFERENCES [dbo].[Allowance] ([AL_ID])
GO
ALTER TABLE [dbo].[AllowanceDetail] CHECK CONSTRAINT [FK_AllowanceDetail_Allowance]
GO
ALTER TABLE [dbo].[AllowanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_AllowanceDetail_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AllowanceDetail] CHECK CONSTRAINT [FK_AllowanceDetail_Staff]
GO
ALTER TABLE [dbo].[Authority]  WITH CHECK ADD  CONSTRAINT [FK_QuyenHan_GiaoDien] FOREIGN KEY([IT_ID])
REFERENCES [dbo].[Interface] ([IT_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authority] CHECK CONSTRAINT [FK_QuyenHan_GiaoDien]
GO
ALTER TABLE [dbo].[Authorizations]  WITH CHECK ADD  CONSTRAINT [FK_Authorization_Authority] FOREIGN KEY([AU_ID])
REFERENCES [dbo].[Authority] ([AU_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorizations] CHECK CONSTRAINT [FK_Authorization_Authority]
GO
ALTER TABLE [dbo].[Authorizations]  WITH CHECK ADD  CONSTRAINT [FK_Authorization_Position] FOREIGN KEY([PS_ID])
REFERENCES [dbo].[Position] ([PS_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorizations] CHECK CONSTRAINT [FK_Authorization_Position]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_CardType] FOREIGN KEY([CT_ID])
REFERENCES [dbo].[CardType] ([CT_ID])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_CardType]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Staff]
GO
ALTER TABLE [dbo].[CardDetail]  WITH CHECK ADD  CONSTRAINT [FK_CardDetail_Card] FOREIGN KEY([CardID])
REFERENCES [dbo].[Card] ([CardID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CardDetail] CHECK CONSTRAINT [FK_CardDetail_Card]
GO
ALTER TABLE [dbo].[CardDetail]  WITH CHECK ADD  CONSTRAINT [FK_CardDetail_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CardDetail] CHECK CONSTRAINT [FK_CardDetail_Staff]
GO
ALTER TABLE [dbo].[ContractType]  WITH CHECK ADD  CONSTRAINT [FK_ContractType_TimeKeepingMethod] FOREIGN KEY([TKM_ID])
REFERENCES [dbo].[TimeKeepingMethod] ([TKM_ID])
GO
ALTER TABLE [dbo].[ContractType] CHECK CONSTRAINT [FK_ContractType_TimeKeepingMethod]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [FK_MonthSalaryDetail_MonthSalary] FOREIGN KEY([MonthID])
REFERENCES [dbo].[Month] ([MonthID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [FK_MonthSalaryDetail_MonthSalary]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [FK_MonthSalaryDetail_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [FK_MonthSalaryDetail_Staff]
GO
ALTER TABLE [dbo].[OperateHistory]  WITH CHECK ADD  CONSTRAINT [FK_OperateHistory_Operation] FOREIGN KEY([OP_ID])
REFERENCES [dbo].[Operation] ([OP_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OperateHistory] CHECK CONSTRAINT [FK_OperateHistory_Operation]
GO
ALTER TABLE [dbo].[OperateHistory]  WITH CHECK ADD  CONSTRAINT [FK_OperateHistory_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OperateHistory] CHECK CONSTRAINT [FK_OperateHistory_Staff]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Interface] FOREIGN KEY([IT_ID])
REFERENCES [dbo].[Interface] ([IT_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Interface]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Position_Department] FOREIGN KEY([DP_ID])
REFERENCES [dbo].[Department] ([DP_ID])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Position_Department]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_ContractType] FOREIGN KEY([CT_ID])
REFERENCES [dbo].[ContractType] ([CT_ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_ContractType]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Position] FOREIGN KEY([PS_ID])
REFERENCES [dbo].[Position] ([PS_ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Position]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_Shift1] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shift] ([ShiftID])
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_Shift1]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_ShiftType1] FOREIGN KEY([ST_ID])
REFERENCES [dbo].[ShiftType] ([ST_ID])
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_ShiftType1]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_Staff1] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_Staff1]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_WorkSchedule1] FOREIGN KEY([WS_ID])
REFERENCES [dbo].[WorkSchedule] ([WS_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_WorkSchedule1]
GO
ALTER TABLE [dbo].[WorkSchedule]  WITH CHECK ADD  CONSTRAINT [FK_WorkSchedule_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WorkSchedule] CHECK CONSTRAINT [FK_WorkSchedule_Staff]
GO
ALTER TABLE [dbo].[Allowance]  WITH CHECK ADD  CONSTRAINT [CHECK_AllowanceAmount] CHECK  (([Amount]>(0)))
GO
ALTER TABLE [dbo].[Allowance] CHECK CONSTRAINT [CHECK_AllowanceAmount]
GO
ALTER TABLE [dbo].[CardDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_Amount] CHECK  (([Amount]>(0)))
GO
ALTER TABLE [dbo].[CardDetail] CHECK CONSTRAINT [CHECK_Amount]
GO
ALTER TABLE [dbo].[CardDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_Deliver] CHECK  (([Deliver]<=[Amount]))
GO
ALTER TABLE [dbo].[CardDetail] CHECK CONSTRAINT [CHECK_Deliver]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_Salary] CHECK  (([BasicSalary]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_Salary]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_TotalAllowance] CHECK  (([TotalAllowance]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_TotalAllowance]
GO
ALTER TABLE [dbo].[ShiftType]  WITH CHECK ADD  CONSTRAINT [CHECK_SalaryCoefficient] CHECK  (([SalaryCoefficient]>=(1)))
GO
ALTER TABLE [dbo].[ShiftType] CHECK CONSTRAINT [CHECK_SalaryCoefficient]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_Account] CHECK  ((len([Account])>=(5) AND len([Account])<(20)))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_Account]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_BasicSalary] CHECK  (([BasicSalary]>=(0)))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_BasicSalary]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_Brithday] CHECK  ((datediff(year,[Brithday],getdate())>=(18)))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_Brithday]
GO
ALTER TABLE [dbo].[Staff]  WITH NOCHECK ADD  CONSTRAINT [CHECK_CardID] CHECK  ((len([CardID])=(12) AND [CardID] like '[0-9]%'))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_CardID]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_ContractDuration] CHECK  (([ContractDuration]>[EntryDate]))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_ContractDuration]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_DayOffAmount] CHECK  (([DayOffAmount]>=(0)))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_DayOffAmount]
GO
ALTER TABLE [dbo].[Staff]  WITH NOCHECK ADD  CONSTRAINT [CHECK_EntryDate] CHECK  ((CONVERT([date],[EntryDate])>=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_EntryDate]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_Gender] CHECK  (([Gender]=N'Khác' OR [Gender]=N'Nữ' OR [Gender]=N'Nam'))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_Gender]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_Phone] CHECK  ((len([Phone])=(10) AND [Phone] like '[0-9]%'))
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [CHECK_Phone]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AL_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_AL_ID]
ON [dbo].[Allowance]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewALID VARCHAR(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted ID already follows the desired format (AL + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [AL_ID] LIKE 'AL[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
            )
    BEGIN
        -- Skip the trigger
		SELECT @Count = COUNT(AL_ID) FROM Allowance
		WHERE AL_ID = (SELECT AL_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[Allowance] ([AL_ID], [AllowanceName], [Amount])
			SELECT [AL_ID], [AllowanceName], [Amount]
			FROM inserted;
			RETURN;
		END
    END

    -- Find the maximum used AL_ID value
    DECLARE @MaxALID VARCHAR(15);
    SELECT @MaxALID = MAX(AL_ID) FROM [dbo].[Allowance];

    -- If the table is empty, start with AL0000000001
    IF @MaxALID IS NULL
    BEGIN
        SET @NewALID = 'AL0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available AL_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxALID, 10) AS BIGINT)
        BEGIN
            SET @NewALID = 'AL' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Allowance] WHERE AL_ID = @NewALID)
            BEGIN
                -- Use the first available AL_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available AL_ID values, generate a new one by incrementing the maximum value
        IF @NewALID IS NULL
        BEGIN
            SET @NewALID = 'AL' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxALID, 'AL', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated AL_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Allowance] WHERE AL_ID = @NewALID)
    BEGIN
        -- If it does, generate a new AL_ID value
        SET @NewALID = 'AL' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewALID, 'AL', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated AL_ID value
    INSERT INTO [dbo].[Allowance] ([AL_ID], [AllowanceName], [Amount])
    SELECT @NewALID,
           [AllowanceName],
           [Amount]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Allowance] ENABLE TRIGGER [AUTO_GENERATE_AL_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AU_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_AU_ID]
ON [dbo].[Authority]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewAU_ID VARCHAR(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted ID already follows the desired format (AU + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [AU_ID] LIKE 'AU[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
            )
    BEGIN
        -- Skip the trigger
		SELECT @Count = COUNT(AU_ID) FROM Authority
		WHERE AU_ID = (SELECT AU_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName])
			SELECT [AU_ID], [IT_ID], [AuthorityName]
			FROM inserted;
			RETURN;
		END
    END

    -- Find the maximum used AU_ID value
    DECLARE @MaxAU_ID VARCHAR(15);
    SELECT @MaxAU_ID = MAX(AU_ID) FROM [dbo].[Authority];

    -- If the table is empty, start with AU0000000001
    IF @MaxAU_ID IS NULL
    BEGIN
        SET @NewAU_ID = 'AU0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available AU_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxAU_ID, 10) AS BIGINT)
        BEGIN
            SET @NewAU_ID = 'AU' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Authority] WHERE AU_ID = @NewAU_ID)
            BEGIN
                -- Use the first available AU_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available AU_ID values, generate a new one by incrementing the maximum value
        IF @NewAU_ID IS NULL
        BEGIN
            SET @NewAU_ID = 'AU' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxAU_ID, 'AU', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated AU_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Authority] WHERE AU_ID = @NewAU_ID)
    BEGIN
        -- If it does, generate a new AU_ID value
        SET @NewAU_ID = 'AU' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewAU_ID, 'AU', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated AU_ID value
    INSERT INTO [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName])
    SELECT @NewAU_ID,
           [IT_ID],
           [AuthorityName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Authority] ENABLE TRIGGER [AUTO_GENERATE_AU_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CardID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[AUTO_GENERATE_CardID]
ON [dbo].[Card]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewCardID VARCHAR(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted ID already follows the desired format (C + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [CardID] LIKE 'C[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(CardID) FROM Card
		WHERE CardID = (SELECT CardID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[Card] ([CardID], [CT_ID], [StaffID], [DateCreated])
			SELECT [CardID], [CT_ID], [StaffID], [DateCreated]
			FROM inserted;
			RETURN;
		END
    END

    -- Find the maximum used CardID value
    DECLARE @MaxCardID VARCHAR(15);
    SELECT @MaxCardID = MAX(CardID) FROM [dbo].[Card];

    -- If the table is empty, start with C0000000001
    IF @MaxCardID IS NULL
    BEGIN
        SET @NewCardID = 'C0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available CardID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxCardID, 10) AS BIGINT)
        BEGIN
            SET @NewCardID = 'C' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Card] WHERE CardID = @NewCardID)
            BEGIN
                -- Use the first available CardID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available CardID values, generate a new one by incrementing the maximum value
        IF @NewCardID IS NULL
        BEGIN
            SET @NewCardID = 'C' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxCardID, 'C', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated CardID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Card] WHERE CardID = @NewCardID)
    BEGIN
        -- If it does, generate a new CardID value
        SET @NewCardID = 'C' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewCardID, 'C', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new records with the generated CardID values
    INSERT INTO [dbo].[Card] ([CardID], [CT_ID], [StaffID], [DateCreated])
    SELECT @NewCardID,
           [CT_ID], [StaffID], [DateCreated]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Card] ENABLE TRIGGER [AUTO_GENERATE_CardID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CT_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_CT_ID]
ON [dbo].[CardType]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewCT_ID AS VARCHAR(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted CT_ID already follows the desired format (CT + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [CT_ID] LIKE 'CT[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(CT_ID) FROM CardType
		WHERE CT_ID = (SELECT CT_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[CardType] ([CT_ID], [CardTypeName], [CaculateMethod])
			SELECT [CT_ID], [CardTypeName], [CaculateMethod]
			FROM inserted;
			RETURN;
		END
    END

    -- Find the maximum used CT_ID value
    DECLARE @MaxCT_ID AS VARCHAR(15);
    SELECT @MaxCT_ID = MAX(CT_ID) FROM [dbo].[CardType];

    -- If the table is empty, start with CT0000000001
    IF @MaxCT_ID IS NULL
    BEGIN
        SET @NewCT_ID = 'CT0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available CT_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxCT_ID, 10) AS BIGINT)
        BEGIN
            SET @NewCT_ID = 'CT' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[CardType] WHERE CT_ID = @NewCT_ID)
            BEGIN
                -- Use the first available CT_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available CT_ID values, generate a new one by incrementing the maximum value
        IF @NewCT_ID IS NULL
        BEGIN
            SET @NewCT_ID = 'CT' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxCT_ID, 'CT', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated CT_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[CardType] WHERE CT_ID = @NewCT_ID)
    BEGIN
        -- If it does, generate a new CT_ID value
        SET @NewCT_ID = 'CT' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewCT_ID, 'CT', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new records with the generated CT_ID values
    INSERT INTO [dbo].[CardType] ([CT_ID], [CardTypeName], [CaculateMethod])
    SELECT @NewCT_ID,
           [CardTypeName], [CaculateMethod]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[CardType] ENABLE TRIGGER [AUTO_GENERATE_CT_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CoTr_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_CoTr_ID]
ON [dbo].[ContractType]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewCT_ID AS VARCHAR(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted CT_ID already follows the desired format (CT + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [CT_ID] LIKE 'CT[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(CT_ID) FROM ContractType
		WHERE CT_ID = (SELECT CT_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[ContractType] ([CT_ID], [TKM_ID], [ContractTypeName])
			SELECT [CT_ID], [TKM_ID], [ContractTypeName]
			FROM inserted;
			RETURN;
		END
    END

    -- Find the maximum used CT_ID value
    DECLARE @MaxCT_ID AS VARCHAR(15);
    SELECT @MaxCT_ID = MAX(CT_ID) FROM [dbo].[ContractType];

    -- If the table is empty, start with CT0000000001
    IF @MaxCT_ID IS NULL
    BEGIN
        SET @NewCT_ID = 'CT0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available CT_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxCT_ID, 10) AS BIGINT)
        BEGIN
            SET @NewCT_ID = 'CT' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[ContractType] WHERE CT_ID = @NewCT_ID)
            BEGIN
                -- Use the first available CT_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available CT_ID values, generate a new one by incrementing the maximum value
        IF @NewCT_ID IS NULL
        BEGIN
            SET @NewCT_ID = 'CT' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxCT_ID, 'CT', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated CT_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[ContractType] WHERE CT_ID = @NewCT_ID)
    BEGIN
        -- If it does, generate a new CT_ID value
        SET @NewCT_ID = 'CT' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewCT_ID, 'CT', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new records with the generated CT_ID values
    INSERT INTO [dbo].[ContractType] ([CT_ID], [TKM_ID], [ContractTypeName])
    SELECT @NewCT_ID,
           [TKM_ID], [ContractTypeName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[ContractType] ENABLE TRIGGER [AUTO_GENERATE_CoTr_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_DP_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_DP_ID]
ON [dbo].[Department]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewDPID varchar(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted DP_ID already follows the desired format (DP + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [DP_ID] LIKE 'DP[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(DP_ID) FROM Department
		WHERE DP_ID = (SELECT DP_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[Department] ([DP_ID], [DepartmentName])
			SELECT [DP_ID], [DepartmentName]
			FROM inserted;
			RETURN;
		END
    END

    -- Find the maximum used DP_ID value
    DECLARE @MaxDPID varchar(15);
    SELECT @MaxDPID = MAX(DP_ID) FROM [dbo].[Department];

    -- If the table is empty, start with DP0000000001
    IF @MaxDPID IS NULL
    BEGIN
        SET @NewDPID = 'DP0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available DP_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxDPID, 10) AS BIGINT)
        BEGIN
            SET @NewDPID = 'DP' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Department] WHERE DP_ID = @NewDPID)
            BEGIN
                -- Use the first available DP_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available DP_ID values, generate a new one by incrementing the maximum value
        IF @NewDPID IS NULL
        BEGIN
            SET @NewDPID = 'DP' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxDPID, 'DP', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated DP_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Department] WHERE DP_ID = @NewDPID)
    BEGIN
        -- If it does, generate a new DP_ID value
        SET @NewDPID = 'DP' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewDPID, 'DP', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated DP_ID value
    INSERT INTO [dbo].[Department] ([DP_ID], [DepartmentName])
    SELECT @NewDPID,
           [DepartmentName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Department] ENABLE TRIGGER [AUTO_GENERATE_DP_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_IT_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_IT_ID]
ON [dbo].[Interface]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewIT_ID varchar(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted IT_ID already follows the desired format (IT + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [IT_ID] LIKE 'IT[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(IT_ID) FROM Interface
        WHERE IT_ID = (SELECT IT_ID FROM inserted);
        IF(@Count = 0)
        BEGIN
            INSERT INTO [dbo].[Interface] ([IT_ID], [InterfaceName])
            SELECT [IT_ID], [InterfaceName]
            FROM inserted;
            RETURN;
        END
    END

    -- Find the maximum used IT_ID value
    DECLARE @MaxIT_ID varchar(15);
    SELECT @MaxIT_ID = MAX(IT_ID) FROM [dbo].[Interface];

    -- If the table is empty, start with IT0000000001
    IF @MaxIT_ID IS NULL
    BEGIN
        SET @NewIT_ID = 'IT0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available IT_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxIT_ID, 10) AS BIGINT)
        BEGIN
            SET @NewIT_ID = 'IT' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Interface] WHERE IT_ID = @NewIT_ID)
            BEGIN
                -- Use the first available IT_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available IT_ID values, generate a new one by incrementing the maximum value
        IF @NewIT_ID IS NULL
        BEGIN
            SET @NewIT_ID = 'IT' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxIT_ID, 'IT', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated IT_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Interface] WHERE IT_ID = @NewIT_ID)
    BEGIN
        -- If it does, generate a new IT_ID value
        SET @NewIT_ID = 'IT' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewIT_ID, 'IT', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated IT_ID value
    INSERT INTO [dbo].[Interface] ([IT_ID], [InterfaceName])
    SELECT @NewIT_ID,
           [InterfaceName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Interface] ENABLE TRIGGER [AUTO_GENERATE_IT_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_OP_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_OP_ID]
ON [dbo].[Operation]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewOPID varchar(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted OP_ID already follows the desired format (OP + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [OP_ID] LIKE 'OP[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(OP_ID) FROM Operation
        WHERE OP_ID = (SELECT OP_ID FROM inserted);
        IF(@Count = 0)
        BEGIN
            INSERT INTO [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName])
            SELECT [OP_ID], [IT_ID], [OperationName]
            FROM inserted;
            RETURN;
        END
    END

    -- Find the maximum used OP_ID value
    DECLARE @MaxOPID varchar(15);
    SELECT @MaxOPID = MAX(OP_ID) FROM [dbo].[Operation];

    -- If the table is empty, start with OP0000000001
    IF @MaxOPID IS NULL
    BEGIN
        SET @NewOPID = 'OP0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available OP_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxOPID, 10) AS BIGINT)
        BEGIN
            SET @NewOPID = 'OP' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Operation] WHERE OP_ID = @NewOPID)
            BEGIN
                -- Use the first available OP_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available OP_ID values, generate a new one by incrementing the maximum value
        IF @NewOPID IS NULL
        BEGIN
            SET @NewOPID = 'OP' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxOPID, 'OP', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated OP_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Operation] WHERE OP_ID = @NewOPID)
    BEGIN
        -- If it does, generate a new OP_ID value
        SET @NewOPID = 'OP' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewOPID, 'OP', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated OP_ID value
    INSERT INTO [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName])
    SELECT @NewOPID,
           [IT_ID],
           [OperationName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Operation] ENABLE TRIGGER [AUTO_GENERATE_OP_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_PS_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_PS_ID]
ON [dbo].[Position]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewPS_ID varchar(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted PS_ID already follows the desired format (PS + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [PS_ID] LIKE 'PS[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(PS_ID) FROM Position
        WHERE PS_ID = (SELECT PS_ID FROM inserted);
        IF(@Count = 0)
        BEGIN
            INSERT INTO [dbo].[Position] ([PS_ID], [DP_ID], [PositionName])
            SELECT [PS_ID], [DP_ID], [PositionName]
            FROM inserted;
            RETURN;
        END
    END

    -- Find the maximum used PS_ID value
    DECLARE @MaxPS_ID varchar(15);
    SELECT @MaxPS_ID = MAX(PS_ID) FROM [dbo].[Position];

    -- If the table is empty, start with PS0000000001
    IF @MaxPS_ID IS NULL
    BEGIN
        SET @NewPS_ID = 'PS0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available PS_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxPS_ID, 10) AS BIGINT)
        BEGIN
            SET @NewPS_ID = 'PS' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Position] WHERE PS_ID = @NewPS_ID)
            BEGIN
                -- Use the first available PS_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available PS_ID values, generate a new one by incrementing the maximum value
        IF @NewPS_ID IS NULL
        BEGIN
            SET @NewPS_ID = 'PS' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxPS_ID, 'PS', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated PS_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Position] WHERE PS_ID = @NewPS_ID)
    BEGIN
        -- If it does, generate a new PS_ID value
        SET @NewPS_ID = 'PS' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewPS_ID, 'PS', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated PS_ID value
    INSERT INTO [dbo].[Position] ([PS_ID], [DP_ID], [PositionName])
    SELECT @NewPS_ID,
           [DP_ID],
           [PositionName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Position] ENABLE TRIGGER [AUTO_GENERATE_PS_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ShiftID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_ShiftID]
ON [dbo].[Shift]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewShiftID varchar(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted ShiftID already follows the desired format (SH + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [ShiftID] LIKE 'SH[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(ShiftID) FROM Shift
        WHERE ShiftID = (SELECT ShiftID FROM inserted);
        IF(@Count = 0)
        BEGIN
            INSERT INTO [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime])
            SELECT [ShiftID], [ShiftName], [BeginTime], [EndTime]
            FROM inserted;
            RETURN;
        END
    END

    -- Find the maximum used ShiftID value
    DECLARE @MaxShiftID varchar(15);
    SELECT @MaxShiftID = MAX(ShiftID) FROM [dbo].[Shift];

    -- If the table is empty, start with SH0000000001
    IF @MaxShiftID IS NULL
    BEGIN
        SET @NewShiftID = 'SH0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available ShiftID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxShiftID, 10) AS BIGINT)
        BEGIN
            SET @NewShiftID = 'SH' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[Shift] WHERE ShiftID = @NewShiftID)
            BEGIN
                -- Use the first available ShiftID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available ShiftID values, generate a new one by incrementing the maximum value
        IF @NewShiftID IS NULL
        BEGIN
            SET @NewShiftID = 'SH' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxShiftID, 'SH', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated ShiftID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[Shift] WHERE ShiftID = @NewShiftID)
    BEGIN
        -- If it does, generate a new ShiftID value
        SET @NewShiftID = 'SH' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewShiftID, 'SH', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated ShiftID value
    INSERT INTO [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime])
    SELECT @NewShiftID,
           [ShiftName],
           [BeginTime],
           [EndTime]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Shift] ENABLE TRIGGER [AUTO_GENERATE_ShiftID]
GO
/****** Object:  Trigger [dbo].[CheckShiftTime]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[CheckShiftTime]
ON [dbo].[Shift]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

     IF EXISTS (SELECT 1 FROM inserted i
                    JOIN [dbo].[Shift] c ON i.[ShiftID] != c.[ShiftID]					
                    WHERE (i.BeginTime between c.BeginTime AND c.EndTime)
					OR (i.EndTime between c.BeginTime AND c.EndTime)
					OR (c.BeginTime < c.EndTime AND i.BeginTime < c.BeginTime AND i.EndTime > c.EndTime)
					OR (c.BeginTime > c.EndTime AND
						((i.BeginTime > i.EndTime) OR 
						(i.BeginTime < c.EndTime AND i.EndTime > c.EndTime) OR
						(i.BeginTime < c.EndTime AND i.EndTime < c.EndTime) OR
						(i.BeginTime > c.BeginTime AND i.EndTime > c.BeginTime) OR
						(i.BeginTime < c.BeginTime AND i.EndTime > c.BeginTime))))
    BEGIN
        RAISERROR (N'TIME_CHECK_ERROR', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
ALTER TABLE [dbo].[Shift] ENABLE TRIGGER [CheckShiftTime]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ST_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_ST_ID]
ON [dbo].[ShiftType]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewST_ID varchar(15);
    DECLARE @Count INT = 0;

    -- Check if the inserted ST_ID already follows the desired format (ST + 10 digits)
    IF EXISTS (
            SELECT 1
            FROM inserted
            WHERE [ST_ID] LIKE 'ST[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        )
    BEGIN
        -- Skip the trigger
        SELECT @Count = COUNT(ST_ID) FROM ShiftType
        WHERE ST_ID = (SELECT ST_ID FROM inserted);
        IF(@Count = 0)
        BEGIN
            INSERT INTO [dbo].[ShiftType] ([ST_ID], [ShiftTypeName], [SalaryCoefficient])
            SELECT [ST_ID], [ShiftTypeName], [SalaryCoefficient]
            FROM inserted;
            RETURN;
        END
    END

    -- Find the maximum used ST_ID value
    DECLARE @MaxST_ID varchar(15);
    SELECT @MaxST_ID = MAX(ST_ID) FROM [dbo].[ShiftType];

    -- If the table is empty, start with ST0000000001
    IF @MaxST_ID IS NULL
    BEGIN
        SET @NewST_ID = 'ST0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available ST_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxST_ID, 10) AS BIGINT)
        BEGIN
            SET @NewST_ID = 'ST' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[ShiftType] WHERE ST_ID = @NewST_ID)
            BEGIN
                -- Use the first available ST_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available ST_ID values, generate a new one by incrementing the maximum value
        IF @NewST_ID IS NULL
        BEGIN
            SET @NewST_ID = 'ST' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxST_ID, 'ST', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated ST_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[ShiftType] WHERE ST_ID = @NewST_ID)
    BEGIN
        -- If it does, generate a new ST_ID value
        SET @NewST_ID = 'ST' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewST_ID, 'ST', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated ST_ID value
    INSERT INTO [dbo].[ShiftType] ([ST_ID], [ShiftTypeName], [SalaryCoefficient])
    SELECT @NewST_ID,
           [ShiftTypeName],
           [SalaryCoefficient]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[ShiftType] ENABLE TRIGGER [AUTO_GENERATE_ST_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_StaffID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_StaffID]
	ON [dbo].[Staff]
	INSTEAD OF INSERT
	AS
	BEGIN
		SET NOCOUNT ON;
		DECLARE @NewStaffID varchar(15);
		IF EXISTS (
			SELECT 1
			FROM inserted
			WHERE [StaffID] LIKE 'S[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
		)
		BEGIN
			-- Skip the trigger
			INSERT INTO [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MIddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate])
			SELECT [StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MIddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]
			FROM inserted;
			RETURN;
		END
		-- Find the maximum used StaffID value
		DECLARE @MaxStaffID varchar(15);
		SELECT @MaxStaffID = MAX(StaffID) FROM [dbo].[Staff];



		-- If the table is empty, start with S00000000001
		IF @MaxStaffID IS NULL
		BEGIN
			SET @NewStaffID = 'S0000000001';
		END
		-- Check if any inserted row violates the constraint
	
		ELSE
		BEGIN
			-- Find the first available StaffID value by checking the numbers from 1 to the maximum
			DECLARE @i INT = 1;
			WHILE @i <= CAST(RIGHT(@MaxStaffID, 10) AS INT)
			BEGIN
				SET @NewStaffID = 'S' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
				IF NOT EXISTS (SELECT 1 FROM [dbo].[Staff] WHERE StaffID = @NewStaffID)
				BEGIN
					-- Use the first available StaffID value
					BREAK;
				END
				SET @i = @i + 1;
			END

			-- If there are no available StaffID values, generate a new one by incrementing the maximum value
			IF @NewStaffID IS NULL
			BEGIN
				SET @NewStaffID = 'S' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxStaffID, 'S', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
			END
		END

		-- Check if the generated StaffID value already exists in the table
		WHILE EXISTS (SELECT 1 FROM [dbo].[Staff] WHERE StaffID = @NewStaffID)
		BEGIN
			-- If it does, generate a new StaffID value
			SET @NewStaffID = 'S' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewStaffID, 'S', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
		END
			   
 		-- Insert the new record with the generated StaffID value
		INSERT INTO [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MIddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate])
		SELECT @NewStaffID,
			   [PS_ID],
			   [CT_ID],
			   [Account],
			   [Password],
			   [CardID],
			   [LastName],
			   [MiddleName],
			   [FirstName],
			   [Brithday],
			   [HouseNumber],
			   [Street],
			   [Ward],
			   [District],
			   [Province_City],
			   [Gender],
			   [Phone],
			   [Email],
			   [EducationLevel],
			   [EntryDate],
			   [ContractDuration],
			   [Status],
			   [DayOffAmount],
			   [BasicSalary],
			   [Picture],
			   [LockDate]
		FROM inserted;
	END;
GO
ALTER TABLE [dbo].[Staff] ENABLE TRIGGER [AUTO_GENERATE_StaffID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_TKM_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_TKM_ID]
ON [dbo].[TimeKeepingMethod]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the inserted values meet the condition
    IF EXISTS (
    SELECT 1
    FROM inserted
    WHERE [TKM_ID] LIKE 'TKM[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	)
	BEGIN
		-- Skip the trigger
		DECLARE @Count INT;
		SELECT @Count = COUNT(TKM_ID) FROM [dbo].[TimeKeepingMethod]
		WHERE TKM_ID = (SELECT TKM_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName])
			SELECT [TKM_ID], [TimeKeepingMethodName]
			FROM inserted;
			RETURN;
		END
	END

    DECLARE @NewTKM_ID varchar(15);

    -- Find the maximum used TKM_ID value
    DECLARE @MaxTKM_ID varchar(15);
    SELECT @MaxTKM_ID = MAX(TKM_ID) FROM [dbo].[TimeKeepingMethod];

    -- If the table is empty, start with TKM0000000001
    IF @MaxTKM_ID IS NULL
    BEGIN
        SET @NewTKM_ID = 'TKM0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available TKM_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxTKM_ID, 10) AS BIGINT)
        BEGIN
            SET @NewTKM_ID = 'TKM' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[TimeKeepingMethod] WHERE TKM_ID = @NewTKM_ID)
            BEGIN
                -- Use the first available TKM_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available TKM_ID values, generate a new one by incrementing the maximum value
        IF @NewTKM_ID IS NULL
        BEGIN
            SET @NewTKM_ID = 'TKM' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxTKM_ID, 'TKM', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated TKM_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[TimeKeepingMethod] WHERE TKM_ID = @NewTKM_ID)
    BEGIN
        -- If it does, generate a new TKM_ID value
        SET @NewTKM_ID = 'TKM' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewTKM_ID, 'TKM', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated TKM_ID value
    INSERT INTO [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName])
    SELECT @NewTKM_ID,
           [TimeKeepingMethodName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[TimeKeepingMethod] ENABLE TRIGGER [AUTO_GENERATE_TKM_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_WS_ID]    Script Date: 7/11/2023 4:31:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AUTO_GENERATE_WS_ID]
ON [dbo].[WorkSchedule]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewWS_ID varchar(15);

    -- Check if the inserted values meet the condition
    IF EXISTS (
    SELECT 1
    FROM inserted
    WHERE [WS_ID] LIKE 'WS[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	)
	BEGIN
		-- Skip the trigger
		DECLARE @Count INT;
		SELECT @Count = COUNT(WS_ID) FROM [dbo].[WorkSchedule]
		WHERE WS_ID = (SELECT WS_ID FROM inserted);
		IF(@Count = 0)
		BEGIN
			INSERT INTO [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate])
			SELECT [WS_ID], [StaffID], [WorkDate]
			FROM inserted;
			RETURN;
		END
	END

    -- Find the maximum used WS_ID value
    DECLARE @MaxWS_ID varchar(15);
    SELECT @MaxWS_ID = MAX(WS_ID) FROM [dbo].[WorkSchedule];

    -- If the table is empty, start with WS0000000001
    IF @MaxWS_ID IS NULL
    BEGIN
        SET @NewWS_ID = 'WS0000000001';
    END
    ELSE
    BEGIN
        -- Find the first available WS_ID value by checking the numbers from 1 to the maximum
        DECLARE @i BIGINT = 1;
        WHILE @i <= CAST(RIGHT(@MaxWS_ID, 10) AS BIGINT)
        BEGIN
            SET @NewWS_ID = 'WS' + RIGHT('0000000000' + CAST(@i AS VARCHAR(10)), 10);
            IF NOT EXISTS (SELECT 1 FROM [dbo].[WorkSchedule] WHERE WS_ID = @NewWS_ID)
            BEGIN
                -- Use the first available WS_ID value
                BREAK;
            END
            SET @i = @i + 1;
        END

        -- If there are no available WS_ID values, generate a new one by incrementing the maximum value
        IF @NewWS_ID IS NULL
        BEGIN
            SET @NewWS_ID = 'WS' + RIGHT('0000000000' + CAST(CAST(REPLACE(@MaxWS_ID, 'WS', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
        END
    END

    -- Check if the generated WS_ID value already exists in the table
    WHILE EXISTS (SELECT 1 FROM [dbo].[WorkSchedule] WHERE WS_ID = @NewWS_ID)
    BEGIN
        -- If it does, generate a new WS_ID value
        SET @NewWS_ID = 'WS' + RIGHT('0000000000' + CAST(CAST(REPLACE(@NewWS_ID, 'WS', '') AS BIGINT) + 1 AS VARCHAR(10)), 10);
    END

    -- Insert the new record with the generated WS_ID value
    INSERT INTO [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate])
    SELECT @NewWS_ID,
           [StaffID],
           [WorkDate]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[WorkSchedule] ENABLE TRIGGER [AUTO_GENERATE_WS_ID]
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhanSu] SET  READ_WRITE 
GO
