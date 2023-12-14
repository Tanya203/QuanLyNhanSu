USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Allowance]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[AllowanceDetail]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Authority]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Authorizations]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[CardDetail]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[CardType]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[ContractType]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Interface]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Month]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[MonthSalaryDetail]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[OperateHistory]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Operation]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[ShiftType]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[TimeKeeping]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[TimeKeepingMethod]    Script Date: 14/12/2023 10:54:17 AM ******/
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
/****** Object:  Table [dbo].[WorkSchedule]    Script Date: 14/12/2023 10:54:17 AM ******/
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
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000001', N'AL0000000002', NULL)
GO
INSERT [dbo].[AllowanceDetail] ([StaffID], [AL_ID], [Note]) VALUES (N'S0000000002', N'AL0000000002', NULL)
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
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000013', N'IT0000000004', N'Truy cập chi tiết phụ cấp nhân viên')
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
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000025', N'IT0000000020', N'Thao tác chi tiết phiếu')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000026', N'IT0000000011', N'Thao tác thống kê')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000027', N'IT0000000012', N'Thao tác quản lý loại hợp đồng')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000028', N'IT0000000013', N'Thao tác phân quyền')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000029', N'IT0000000007', N'Truy cập loại ca')
GO
INSERT [dbo].[Authority] ([AU_ID], [IT_ID], [AuthorityName]) VALUES (N'AU0000000030', N'IT0000000019', N'Thao tác quản lý chi tiết phụ cấp nhân viên')
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000013', 1)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000026', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000027', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000028', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000029', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000030', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000031', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000032', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000001', N'AU0000000033', 1)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000002', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000003', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000004', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000005', N'AU0000000030', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000006', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000031', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000032', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000007', N'AU0000000033', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000008', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000009', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000010', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000011', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000004', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000012', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000013', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000019', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000020', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000014', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000005', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000006', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000007', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000008', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000009', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000010', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000011', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000012', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000021', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000022', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000023', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000024', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000025', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000015', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000016', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000017', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000004', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000018', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000019', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000004', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000005', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000013', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000014', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000015', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000016', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000017', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000018', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000019', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000020', N'AU0000000030', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000001', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000002', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000003', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000004', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000013', 0)
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
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000026', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000027', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000028', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000029', 0)
GO
INSERT [dbo].[Authorizations] ([PS_ID], [AU_ID], [Authorize]) VALUES (N'PS0000000021', N'AU0000000030', 0)
GO
INSERT [dbo].[Card] ([CardID], [CT_ID], [StaffID], [DateCreated]) VALUES (N'C0000000001', N'CT0000000001', N'S0000000001', CAST(N'2023-12-06' AS Date))
GO
INSERT [dbo].[Card] ([CardID], [CT_ID], [StaffID], [DateCreated]) VALUES (N'C0000000002', N'CT0000000003', N'S0000000001', CAST(N'2023-12-11' AS Date))
GO
INSERT [dbo].[CardDetail] ([CardID], [StaffID], [Amount], [Deliver], [Note]) VALUES (N'C0000000001', N'S0000000001', CAST(5000000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)), N'')
GO
INSERT [dbo].[CardDetail] ([CardID], [StaffID], [Amount], [Deliver], [Note]) VALUES (N'C0000000002', N'S0000000001', CAST(50000000.000 AS Decimal(38, 3)), CAST(10000000.000 AS Decimal(38, 3)), N'')
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
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000001', CAST(150000.000 AS Decimal(38, 3)), CAST(2500000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[MonthSalaryDetail] ([MonthID], [StaffID], [BasicSalary], [TotalAllowance]) VALUES (N'2023-12', N'S0000000002', CAST(120000.000 AS Decimal(38, 3)), CAST(2000000.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'02:22:31.815275 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'06:24:23.377859 | 2023-12-06', N'S0000000001', N'OP0000000047', N'Nhân viên S0000000001 chấm công lúc 06:24:21 ngày 2023-12-06 cho:
- Giờ vào ca 1')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:38:25.103958 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:40:32.944112 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:41:43.086459 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:49:13.186436 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:51:40.005528 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:52:44.934359 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:53:59.138540 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'07:57:12.283449 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:01:59.409485 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:03:25.400451 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:11:43.931702 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:22:16.805410 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:37:35.251089 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:43:29.512617 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:45:25.853241 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:51:10.647036 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:51:10.888494 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:53:11.680039 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:54:22.363329 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:54:31.787469 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:54:35.239316 | 2023-11-26', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp test ₫:
  - Số tiền: 100000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:55:05.464652 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:57:26.400445 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:58:02.843307 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'08:59:34.397703 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:01:06.104791 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:03:57.724281 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:04:31.403855 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:04:37.940654 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:05:55.800838 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:06:29.053542 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:07:33.040483 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:07:39.572753 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:08:23.977311 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:09:06.521327 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:09:34.143159 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:09:50.830125 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:09:55.500596 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:10:24.927659 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:10:49.958553 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:10:58.395778 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:11:16.640286 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:11:30.464657 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:11:37.980424 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:11:54.413737 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:12:33.610964 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:12:40.233449 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:12:53.962403 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:13:26.660096 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:15:06.168167 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:15:07.577144 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:15:26.018321 | 2023-11-21', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Phạt C0000000001:
- Đã giao: 500.000,000 ₫ -> Đã giao : 500000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:16:03.081955 | 2023-11-21', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Phạt C0000000001:
- Đã giao: 0,000 ₫ -> Đã giao : 0.000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:16:21.160513 | 2023-11-21', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Phạt C0000000001:
- Đã giao: 500.000,000 ₫ -> Đã giao : 500000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:16:56.098560 | 2023-11-21', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-21 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:17:12.294349 | 2023-11-21', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-21 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:17:43.367754 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:18:45.436105 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:21:47.601717 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:22:08.366173 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:23:23.712262 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:23:32.829740 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:23:39.077421 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:23:56.911605 | 2023-11-21', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Phạt C0000000001:
')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:24:30.442068 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:24:41.540423 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:26:38.448841 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:27:48.243155 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:28:05.890319 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:28:37.611010 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:28:45.257719 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:29:04.437489 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:30:20.016048 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:30:44.325993 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:30:55.718493 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:31:39.617481 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:31:52.882905 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:37:08.560948 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:37:27.231603 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:37:37.575587 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:38:01.898626 | 2023-12-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:38:22.845705 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập thống kê của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:38:33.085798 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập thống kê cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:39:08.074131 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:39:15.768520 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:39:24.639179 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:40:17.093163 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:40:58.609271 | 2023-11-28', N'S0000000001', N'OP0000000012', N'Xoá phòng ban test')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:49:23.863288 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:50:19.808098 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:51:10.233273 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:53:21.589829 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:53:33.108105 | 2023-11-28', N'S0000000001', N'OP0000000029', N'Sửa phụ cấp AL0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:56:07.838641 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:57:05.108320 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:57:05.648979 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:58:21.068473 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:58:27.581625 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:58:30.889569 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:58:55.132765 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:19.465111 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:37.936489 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'09:59:38.357278 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:00:06.681131 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:00:30.005964 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:00:51.059335 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:00:55.541956 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:01:36.464131 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:01:58.439820 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:03.845925 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:10.225175 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:13.696206 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:21.590691 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:31.398291 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:31.428467 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:33.791984 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:02:46.537687 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:03:33.154274 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:03:40.948928 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:03:49.533308 | 2023-11-21', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:03:58.498208 | 2023-11-21', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:04:06.442692 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:10:15.009972 | 2023-12-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:10:34.335838 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:11:57.879162 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:12:39.595436 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:12:52.441833 | 2023-12-07', N'S0000000001', N'OP0000000049', N'Xoá Phạt lập ngày 2023-12-06')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:12:56.683517 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:13:45.389375 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:15:11.515458 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:15:13.169317 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:15:16.030020 | 2023-11-28', N'S0000000001', N'OP0000000048', N'Thêm phiếu Thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:15:22.289597 | 2023-11-26', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:15:25.752735 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:16:43.554729 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:18:19.613363 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:19:07.340665 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:19:22.482294 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:23:03.487117 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:23:04.663409 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:24:04.855858 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:24:57.304094 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:26:36.183655 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:29:07.294270 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:30:11.238136 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:30:32.449248 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:30:58.320778 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:32:09.278529 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:32:56.952520 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:33:22.798186 | 2023-11-28', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 1.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:33:28.437503 | 2023-11-28', N'S0000000001', N'OP0000000033', N'Xoá nhân viên S0000000001 khỏi Thưởng C0000000001:
 - Số tiền: 1.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:34:05.604753 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:35:44.134291 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:37:58.175418 | 2023-11-28', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 1.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:39:47.568288 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:39:58.166421 | 2023-11-26', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Số ngày phép: 17 -> Số ngày phép: 15
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:40:18.653651 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:41:44.947294 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:42:06.280278 | 2023-11-29', N'S0000000001', N'OP0000000003', N'Thêm nhân viên Huỳnh Huỳnh Đạt:
- Phòng ban: Giám đốc
- Chức vụ: Phó phòng giám đốc
- Loại hợp đồng: Chính thức
- Tài khoản: TK002
- CCCD: 079202983748
- NTNS: 2002-11-29
- Số nhà: 123/23
- Đường: Trần Xuân Soạn
- Phường/xã: 12
- Quận/huyện: Tân Bình
- Tỉnh/Thành Phố: Hồ Chí Minh
- Giới tính: Nam
- Số điện thoại: 0987678678
- Email: huynhphuocdat@gmail.com
- Trình độ học vấn: Thạc sĩ
- Ngày vào làm: 2023-11-29
- Thời hạn hợp đồng: 2030-11-29
- Tình trạng: Bình thường
- Số ngày phép: 15
- Lương cơ bản: 120.000,000 ₫
')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:42:09.996349 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:43:05.657457 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:43:21.559390 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:45:53.079721 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:47:19.420531 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:47:52.211424 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:48:17.606404 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:48:44.651932 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:49:13.562049 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:49:22.160464 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:50:28.177835 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:50:28.389638 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:50:58.580099 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:52:15.313567 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:52:59.730285 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:54:28.722289 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:55:02.980323 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:55:04.063883 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:55:17.613139 | 2023-11-28', N'S0000000001', N'OP0000000032', N'Sửa nhân viên S0000000001 trong Thưởng C0000000001:
- Đã giao: 0,000 ₫ -> Đã giao: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:55:49.741141 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:56:35.148436 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:57:03.603993 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:57:06.922311 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:57:26.461648 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'10:59:21.252427 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:00:20.038173 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:00:50.973795 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:05:06.059262 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:05:21.286227 | 2023-12-03', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:06:47.011259 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:09:55.146740 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:10:21.874154 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:10:47.907573 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:10:55.367085 | 2023-11-28', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:25:50.752116 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:26:36.505431 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:27:24.260718 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:30:35.219914 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:32:09.803061 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:32:45.194364 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:35:28.069645 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:41:20.072224 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:41:28.772505 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:41:35.185663 | 2023-11-23', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:42:17.153138 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:42:28.548172 | 2023-12-12', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:43:17.182945 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:43:22.684663 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:44:00.251576 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:44:27.103779 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:44:41.231252 | 2023-11-28', NULL, N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:45:28.648065 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:45:38.789203 | 2023-11-23', N'S0000000001', N'OP0000000042', N'Thêm phụ cấp Lưu động cho nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:46:01.862499 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:46:16.017448 | 12/12/2023', N'S0000000002', N'OP0000000046', N'Tài khoản TK002 bị khoá đến 12/12/2023 12:16:15 PM (nhập sai mật khẩu 3 lần)')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:46:22.451238 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:46:47.817194 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:47:25.137039 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:47:55.991431 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:48:43.645140 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:50:29.786638 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:50:41.517389 | 2023-12-12', N'S0000000002', N'OP0000000006', N'Mở khoá tài khoản của nhân viên S0000000002')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:50:51.069865 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:50:54.947453 | 2023-12-12', N'S0000000002', N'OP0000000046', N'Tài khoản TK002 bị khoá đến  (nhập sai mật khẩu 3 lần)')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:51:00.024320 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:51:10.498816 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:52:17.823984 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:52:43.443281 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:52:46.629177 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:54:55.579879 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:56:03.464885 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:56:32.210360 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:57:03.323297 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:59:05.677052 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:59:32.019107 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:00:28.114708 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:01:10.448373 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:03:00.644441 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:03:02.037469 | 2023-12-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:03:10.355090 | 2023-12-05', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-12-05 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:03:46.665718 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:04:04.865868 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:04:18.232584 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:05:01.196486 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:12:36.882546 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:14:25.399474 | 2023-12-03', N'S0000000001', N'OP0000000002', N'Quên mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:14:31.155698 | 2023-12-03', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:15:54.239282 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:16:11.219776 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:18:32.687579 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Số ngày phép: 10 -> Số ngày phép: 15
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:18:48.928012 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:19:51.624465 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:20:03.917251 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:21:11.322769 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:22:27.041559 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:22:46.827185 | 2023-11-20', N'S0000000001', N'OP0000000011', N'Sửa phòng ban DP0000000003')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:22:49.078936 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:22:58.642098 | 2023-11-20', N'S0000000001', N'OP0000000011', N'Sửa phòng ban DP0000000003:
- Tên phòng ban Nhân sự -> Tên phòng ban: Nhân viên')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:23:15.551715 | 2023-11-20', N'S0000000001', N'OP0000000011', N'Sửa phòng ban DP0000000003:
- Tên phòng ban Nhân viên -> Tên phòng ban: Nhân sự')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:24:21.585897 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:26:04.603211 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:28:09.902848 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:28:31.079273 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:28:36.072417 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:29:05.255865 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:29:43.755404 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:30:23.399468 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:30:53.715656 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:31:35.180680 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:32:13.721801 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:32:30.426082 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:32:57.635998 | 2023-11-25', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp test:
  - Số tiền: 1000000')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:33:09.710319 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:33:40.199772 | 2023-11-26', N'S0000000001', N'OP0000000027', N'Xoá phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:34:06.004148 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:34:10.515832 | 2023-11-25', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp test:
  - Số tiền: 100000')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:34:31.597948 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:34:52.795687 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:34:54.794806 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:36:06.247161 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:36:12.818738 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:36:39.164306 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:36:41.938947 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:36:48.285744 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:36:52.150299 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:37:06.219091 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:37:34.876682 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:37:46.181648 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:38:06.494527 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:38:34.146158 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:38:37.234727 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:38:43.207172 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:38:54.422390 | 2023-11-26', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Số ngày phép: 8 -> Số ngày phép: 15
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:38:56.315096 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:07.555483 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:10.420357 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:21.568837 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:21.665059 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:28.511808 | 2023-12-06', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:35.984091 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:39:41.063036 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:40:08.730687 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:40:27.887080 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:40:32.866014 | 2023-11-26', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:42:30.852010 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:42:46.518794 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:42:50.726134 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:43:36.468364 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:43:46.376607 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:43:47.863216 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:43:50.679805 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:44:02.408527 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:47:28.995686 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:47:31.622374 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:47:37.132967 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:48:00.282577 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:49:11.266110 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:49:46.467788 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:50:26.201988 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:50:31.033166 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:50:59.335716 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:51:56.655727 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:52:05.724716 | 2023-11-25', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp test:
  - Số tiền: 1000000')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:52:34.380063 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:52:45.708227 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:53:44.498824 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:53:44.943184 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:55:01.510360 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:55:31.613405 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:55:37.889632 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:55:53.241418 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:56:33.432992 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:58:14.121460 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:59:37.833768 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:59:43.660123 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:59:49.379248 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:59:50.343337 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:00:00.989873 | 2023-11-25', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp test:
  - Số tiền: 1000000')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:00:38.917670 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:00:43.163553 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:00:45.194641 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:00:53.864882 | 2023-11-25', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp test:
  - Số tiền: 10000000')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:01:39.465050 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:02:02.058263 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:02:47.978089 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:03:05.261922 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:03:19.453171 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:03:40.198112 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:04:00.357731 | 2023-12-04', N'S0000000001', N'OP0000000007', N'Khoá tài khoản của nhân viên S0000000002 đến 13:00:46 05/12/2023')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:04:10.335782 | 2023-12-04', N'S0000000002', N'OP0000000006', N'Mở khoá tài khoản của nhân viên S0000000002')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:05:50.865068 | 2023-12-03', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:06:26.541169 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:06:54.593027 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:03.452193 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:06.595952 | 2023-12-06', N'S0000000001', N'OP0000000027', N'Xoá phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:13.239994 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:19.558798 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:38.210495 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:47.570767 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:56.397044 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:07:58.410712 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:08:20.293346 | 2023-11-25', N'S0000000001', N'OP0000000003', N'Thêm nhân viên Nug Nugư:
- Phòng ban: Giám đốc
- Chức vụ: Thư ký giám đốc
- Loại hợp đồng: Chính thức
- Tài khoản: TK003
- CCCD: 079202938478
- NTNS: 2000-11-25
- Số nhà: q1
- Đường: 1
- Phường/xã: 1
- Quận/huyện: 1
- Tỉnh/Thành Phố: 1
- Giới tính: Nam
- Số điện thoại: 0983984724
- Email: dshdhqw@gmail.com
- Trình độ học vấn: ưqe
- Ngày vào làm: 2023-11-25
- Thời hạn hợp đồng: 2050-11-25
- Tình trạng: 1
- Số ngày phép: 15
- Lương cơ bản: 1.000.000,000 ₫
')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:08:33.133994 | 2023-12-03', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:08:42.040145 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:09:36.845929 | 2023-12-03', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:10:54.357729 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:11:24.673566 | 2023-12-03', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:11:36.684513 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:11:50.174610 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:12:13.440599 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:13:08.802249 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:15:08.741174 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:15:19.476277 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:15:24.454052 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:15:51.361571 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:16:14.601468 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:16:33.843852 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:16:35.938442 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:17:04.677965 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:17:16.024501 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:17:59.407997 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:18:15.647216 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:18:19.138943 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:18:30.941754 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:18:33.508410 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:19:05.390887 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:19:15.651449 | 2023-11-26', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-11-24')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:19:40.489685 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:20:21.667984 | 2023-12-05', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:20:53.582566 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:21:14.845030 | 2023-12-06', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:21:40.772951 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:21:55.994315 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:22:00.919483 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:22:05.605683 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:22:07.646089 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:22:18.218018 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:23:26.787287 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:25:12.533495 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:26:01.676057 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:27:29.501770 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:28:25.616992 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:28:50.873023 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:29:30.535083 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:30:12.493682 | 2023-12-11', N'S0000000001', N'OP0000000008', N'Thêm phụ cấp Lưu động cho nhân viên S0000000002')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:30:13.829179 | 2023-12-11', N'S0000000001', N'OP0000000008', N'Thêm phụ cấp Trưởng phòng cho nhân viên S0000000002')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:31:58.751581 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:34:41.058297 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:35:17.053242 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:35:33.983249 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:35:53.433873 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:36:06.126886 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:36:34.846974 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:36:38.294853 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:36:53.723822 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:37:23.567024 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:37:25.928317 | 2023-12-11', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-12-11 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:37:32.249885 | 2023-12-11', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-11 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:37:56.858526 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:38:10.667679 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:38:16.283025 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:38:52.471522 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:39:18.798854 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:39:30.030375 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:39:33.985575 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:39:40.808934 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:13.115180 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:17.115772 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:20.976055 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:24.309403 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:27.743430 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:30.744937 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:33.773695 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:37.271771 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:54.182077 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:40:57.340406 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:41:59.504550 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:42:13.376156 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:42:56.114681 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:43:01.459767 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:43:07.019891 | 2023-12-11', N'S0000000002', N'OP0000000043', N'Xoá phụ cấp Lưu động của nhân viên S0000000002')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:43:15.871002 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:44:16.497269 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:14.143538 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:20.778729 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:27.300299 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:34.641868 | 2023-12-11', N'S0000000001', N'OP0000000032', N'Sửa nhân viên S0000000001 trong Thưởng C0000000001:
- Số tiền: 500.000.000,000 ₫ -> Số tiền: 500.000,000 ₫
- Đã giao: 0,000 ₫ -> Đã giao: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:40.033688 | 2023-12-11', N'S0000000001', N'OP0000000032', N'Sửa nhân viên S0000000001 trong Thưởng C0000000001:
- Số tiền: 500.000,000 ₫ -> Số tiền: 5.000.000,000 ₫
- Đã giao: 0,000 ₫ -> Đã giao: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:42.557935 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:49.861912 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:53.390981 | 2023-12-06', N'S0000000001', N'OP0000000027', N'Xoá phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:46:00.373129 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:46:10.476595 | 2023-12-11', N'S0000000001', N'OP0000000048', N'Thêm phiếu Ứng lương')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:46:25.671201 | 2023-12-11', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Ứng lương C0000000002:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:46:27.836086 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:07.483077 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:12.700848 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:13.895975 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:16.633557 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:20.735391 | 2023-12-06', N'S0000000001', N'OP0000000027', N'Xoá phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:33.524806 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:37.057551 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:44.107597 | 2023-11-23', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Ứng lương C0000000002:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:52.558627 | 2023-11-23', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Phạt C0000000003:
 - Số tiền: 500.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:47:54.875181 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:04.587701 | 2023-12-06', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:19.811125 | 2023-12-06', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:23.253032 | 2023-12-06', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:27.278485 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:27.449775 | 2023-12-06', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:37.190491 | 2023-12-13', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:40.983783 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:43.981619 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:46.606504 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:48:55.241412 | 2023-12-06', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:49:09.015448 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:49:10.784568 | 2023-12-13', N'S0000000001', N'OP0000000018', N'Xoá ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 02:00:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:49:17.955620 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:49:25.132131 | 2023-12-06', N'S0000000001', N'OP0000000008', N'Thêm phụ cấp Lưu động cho nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:49:54.329442 | 2023-12-06', N'S0000000001', N'OP0000000008', N'Thêm phụ cấp Trưởng phòng cho nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:50:45.095804 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:51:33.866957 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:53:28.535435 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:55:50.344422 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:56:07.399031 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:56:09.375018 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:56:43.593859 | 2023-12-06', N'S0000000001', N'OP0000000048', N'Thêm phiếu Thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:56:50.580276 | 2023-12-06', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 500.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:56:58.033049 | 2023-12-06', N'S0000000001', N'OP0000000048', N'Thêm phiếu Phạt')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:57:05.626691 | 2023-12-06', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Phạt C0000000002:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:57:44.705950 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-26 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:57:52.662125 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:58:51.269101 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:59:06.336752 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:59:29.847549 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:59:52.306235 | 2023-11-23', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:59:53.155549 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:00:12.965749 | 2023-11-29', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:00:30.027877 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:01:21.038941 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:01:26.795006 | 2023-11-29', N'S0000000002', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:01:57.943548 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:02:03.342902 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:02:05.111782 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:02:05.245244 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:02:56.985463 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:03:25.377882 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:03:35.848094 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:03:36.637232 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:04:05.471313 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:04:21.496001 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:04:48.072983 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:05:29.353743 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:05:39.841371 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:05:47.909365 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:06:07.212028 | 2023-11-23', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
- Đã giao: 5.000.000,000 ₫ -> Đã giao : 5.500.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:06:09.143215 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:06:48.149724 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:06:59.391314 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:07:20.921259 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:07:30.209538 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:07:58.811954 | 2023-11-23', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:08:35.298260 | 2023-11-23', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
- Đã giao: 5.500.000,000 ₫ -> Đã giao : 600.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:09:22.887299 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:09:28.635285 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:09:36.929937 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:09:40.777425 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:09:47.892172 | 2023-11-23', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
- Đã giao: 600.000,000 ₫ -> Đã giao : 700.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:10:04.529547 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Ứng lương lập ngày 2023-11-23')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:10:07.051420 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Phạt lập ngày 2023-11-23')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:10:17.264859 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:10:39.703393 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:11:05.755487 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:11:31.898640 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:11:46.878940 | 2023-11-24', N'S0000000001', N'OP0000000042', N'Thêm phụ cấp Lưu động cho nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:12:28.333772 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:12:36.760749 | 2023-11-24', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:12:41.556761 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:01.669400 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-11-23')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:03.146275 | 2023-11-24', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 500.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:08.258470 | 2023-11-24', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:13.885962 | 2023-11-24', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Phạt C0000000002:
 - Số tiền: 5.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:35.736435 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Phạt C0000000002:
- Đã giao: 0,000 ₫ -> Đã giao : 50.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:41.299921 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:43.102129 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:13:43.803903 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:14:34.705582 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:15:14.502167 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:15:24.825782 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:15:28.521177 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:15:45.717814 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:15:55.667066 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:16:05.085584 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:16:05.542884 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:16:30.516088 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:16:47.864918 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:17:04.593815 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:17:37.217436 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:00.759291 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:15.106342 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:21.824980 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:24.089483 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:26.422776 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:38.797764 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:18:40.416746 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:02.070207 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Thưởng C0000000001:
- Đã giao: 0,000 ₫ -> Đã giao : 50.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:05.483136 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:26.770112 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:43.329511 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:56.065162 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:05.726169 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:32.302874 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:46.529985 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:50.446723 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:59.282685 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:16.399869 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:23.961362 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:32.849953 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:39.858896 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:53.943866 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:53.968817 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:55.888342 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:02.390171 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:13.711244 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:15.259317 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:21.357609 | 2023-12-06', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:57.605993 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:23:06.222972 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:23:49.009746 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:24:04.145144 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:24:08.756460 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:24:17.224619 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:24:27.501942 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:16.799014 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:17.553691 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:34.961516 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:35.966128 | 2023-12-11', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:41.164940 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:50.456889 | 2023-12-11', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:53.618354 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:55.794709 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:03.081907 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:03.890929 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:20.814128 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:20.979600 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:34.289641 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:53.335524 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:27:42.730306 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:27:46.419367 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:28:15.024818 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:28:24.125939 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý phòng ban của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:29:20.106145 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:30:15.749066 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:30:26.216119 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:30:28.036214 | 2023-12-06', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:30:37.088404 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:31:01.047536 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:31:19.240753 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:31:43.172906 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:13.934148 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:14.593921 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:36.057900 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:40.182090 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:44.739688 | 2023-12-11', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý thưởng - nợ của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:57.226233 | 2023-12-11', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý thưởng - nợ cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:57.738242 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:09.939495 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:21.985978 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:43.006936 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:50.288124 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:07.220570 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:08.096575 | 2023-12-11', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:12.813556 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:24.391911 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:50.851329 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:58.700852 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:35:03.836456 | 2023-11-26', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:35:49.901055 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:36:11.303725 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:37:17.093313 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:21.741432 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:29.138855 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:32.677907 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:35.093258 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:39.613888 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:43.695092 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000002 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:45.685634 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:50.875725 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:38:55.054321 | 2023-11-26', NULL, N'OP0000000026', N'Thêm phép cho nhân viên S0000000002 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:39:10.701067 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:39:18.346707 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:39:48.516372 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:39:51.195480 | 2023-11-26', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:39:55.729626 | 2023-11-25', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:39:59.395242 | 2023-11-25', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:40:29.632329 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:02.782438 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:16.748580 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:27.852022 | 2023-11-26', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:31.004386 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:32.750359 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:34.522076 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:37.228571 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:37.744837 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000002 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:39.230365 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:43.315497 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:45.060910 | 2023-11-25', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:41:45.899851 | 2023-11-26', NULL, N'OP0000000026', N'Thêm phép cho nhân viên S0000000002 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:42:05.536891 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:42:33.763472 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:42:39.467421 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:10.314829 | 2023-11-24', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-11-24')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:12.478414 | 2023-11-24', N'S0000000001', N'OP0000000049', N'Xoá Phạt lập ngày 2023-11-24')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:24.149533 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:31.671788 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:42.596502 | 2023-11-24', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:45.533851 | 2023-11-24', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:43:57.298875 | 2023-11-24', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:44:03.316378 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:44:04.676613 | 2023-11-26', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:45:05.874398 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:45:52.676019 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:46:02.760845 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:46:15.985763 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:46:23.665425 | 2023-11-24', N'S0000000001', N'OP0000000009', N'Xoá phụ cấp Lưu động của nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:46:49.790552 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:46:54.257252 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:47:16.874992 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:47:18.228969 | 2023-11-24', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Ứng lương C0000000002:
 - Số tiền: 5.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:47:28.916753 | 2023-11-24', N'S0000000001', N'OP0000000008', N'Thêm phụ cấp Lưu động cho nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:47:42.260230 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:47:47.793557 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:02.255503 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:05.059180 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:12.327956 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:16.686575 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:17.817635 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:20.654584 | 2023-11-26', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:25.152193 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:26.947443 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:28.299238 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:33.397315 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000002 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:35.771900 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:39.117070 | 2023-11-26', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000002 vào lịch làm việc ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:48:43.134010 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:49:03.558863 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:49:27.720134 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:50:00.191967 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:50:12.967328 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:50:22.087194 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:50:44.219977 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:04.547697 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:07.557277 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:12.062943 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:30.520478 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:34.381361 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:50.103290 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:52:13.904862 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:52:19.596547 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
- Đã giao: 0,000 ₫ -> Đã giao : 5.000.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:52:34.947207 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:52:55.073954 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:53:00.956697 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:53:02.527623 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:53:27.275645 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:53:48.411281 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:04.581435 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:13.712435 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:29.529789 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Thưởng C0000000001:
- Đã giao: 50.000,000 ₫ -> Đã giao : 50.000.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:31.691769 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:41.026380 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:49.236557 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:56.393202 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:55:34.385649 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:56:29.412762 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:56:30.549718 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:56:44.434626 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:57:07.369540 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:57:27.440009 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:57:49.907682 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:57:51.458684 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:58:07.008117 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:58:27.470001 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:58:50.190736 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:58:55.537255 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:05.808132 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:11.821239 | 2023-11-25', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:13.714198 | 2023-11-23', N'S0000000001', N'OP0000000008', N'Thêm phụ cấp Lưu động cho nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:15.689756 | 2023-11-25', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:42.316844 | 2023-11-23', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Ứng lương C0000000002:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:43.128133 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:47.983283 | 2023-11-25', N'S0000000001', N'OP0000000025', N'Xoá nhân viên S0000000001 khỏi lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:59:52.199229 | 2023-11-25', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:05.235060 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:09.457049 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:16.584551 | 2023-11-25', N'S0000000001', N'OP0000000023', N'Xoá lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:23.443838 | 2023-11-26', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Số ngày phép: 12 -> Số ngày phép: 15
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:26.524987 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:36.022673 | 2023-11-25', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:00:39.742324 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:01:06.693783 | 2023-11-25', N'S0000000001', N'OP0000000024', N'Thêm nhân viên S0000000001 vào lịch làm việc ngày 2023-11-25 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:01:32.173199 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:01:35.105303 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:01:46.285378 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:22.721022 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:33.257853 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:34.429099 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:47.131370 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:55.303063 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:03:05.886256 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:03:14.373359 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:03:20.921976 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:03:23.702031 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:03:29.479286 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:03:49.462553 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:01.442438 | 2023-11-23', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:03.717872 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:13.361140 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:24.294903 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:24.526127 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:31.291952 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:33.320746 | 2023-11-29', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Phòng ban: Trưởng phòng giám đốc -> Phòng ban: Phó phòng giám đốc
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:53.089061 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:05.178408 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:17.098425 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:33.720187 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:38.300350 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:46.739941 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:52.171298 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:06:24.569680 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:06:28.683490 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:06:36.556315 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:07:06.288836 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:07:21.020004 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý loại ca của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:07:32.762410 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:07:45.981242 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:07:50.455124 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:08:08.560141 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:08:26.775982 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:08:27.692211 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:08:49.992434 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:09:03.679524 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:10:00.165910 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:10:24.942181 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:10:29.507374 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:10:48.315371 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:10:50.292759 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:11:14.669002 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:12:28.685882 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:08.976429 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:24.105844 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:28.390157 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:30.088343 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:40.263844 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:55.242930 | 2023-11-25', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:58.413484 | 2023-11-25', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập phòng ban của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:14:01.046653 | 2023-11-25', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:14:02.909414 | 2023-11-25', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập phòng ban cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:14:19.157090 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:14:30.987809 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Ứng lương lập ngày 2023-11-23')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:14:33.099267 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-11-23')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:15:20.247403 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:15:21.959527 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:15:42.287540 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:16:22.228860 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:16:40.434508 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:17:03.918434 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:17:38.945959 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:17:48.587205 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:17:54.922762 | 2023-11-23', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:17:57.112620 | 2023-12-07', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:18:02.560166 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:18:15.398445 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:18:17.887378 | 2023-12-07', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:18:21.056086 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:18:55.336997 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:19:50.820812 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:20:03.259234 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:20:36.138153 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:20:50.728438 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:20:54.623301 | 2023-11-25', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Thưởng C0000000001:
 - Số tiền: 500.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:21:01.266228 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:21:28.160243 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:21:32.972689 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:22:10.424827 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:22:15.561420 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:24:08.487132 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:24:35.442896 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:25:36.098648 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:26:13.457143 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:26:55.341589 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:27:24.218194 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:30:25.307233 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:32:07.564181 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:34:21.857379 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:36:01.785808 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:40:15.448312 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:40:36.288341 | 2023-12-07', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:40:37.387528 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:42:12.485699 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:42:55.753216 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:44:32.826931 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:45:29.563491 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:46:14.318121 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:47:52.136471 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:49:06.308629 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:49:18.684629 | 2023-12-07', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:50:04.996933 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:50:36.445428 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:50:51.482417 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:52:47.927566 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:54:27.667754 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:54:41.678588 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:55:13.653777 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:56:15.539901 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:57:53.897828 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:58:08.960617 | 2023-12-07', N'S0000000001', N'OP0000000045', N'Đổi mật khẩu')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:58:17.501148 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:58:49.311277 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:03:45.123011 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:04:59.027430 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:05:20.851095 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:05:44.729877 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:05:53.321187 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-11-22')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:05:59.064912 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:07:53.720805 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:08:29.361106 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:08:30.372328 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:09:13.434398 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:09:14.096205 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:12:06.395228 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:12:41.566445 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:12:51.403121 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:12:51.428863 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:12:55.982941 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-11-22')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:13:03.285131 | 2023-11-26', N'S0000000001', N'OP0000000013', N'Thêm chức vụ: tesst
 - Phòng ban: Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:13:09.046573 | 2023-11-26', N'S0000000001', N'OP0000000015', N'Xoá chức vụ tesst:
 - Phòng ban: Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:06.380798 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:08.838885 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:12.041061 | 2023-11-23', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:31.050163 | 2023-11-23', N'S0000000001', N'OP0000000049', N'Xoá Thưởng lập ngày 2023-10-23')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:38.157863 | 2023-11-26', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp tesst ₫:
  - Số tiền: 2313211 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:41.130951 | 2023-11-26', N'S0000000001', N'OP0000000030', N'Xoá phụ cấp tesst:
  - Số tiền: 2.313.211,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:51.283052 | 2023-11-26', N'S0000000001', N'OP0000000028', N'Thêm phụ cấp ssq ₫:
  - Số tiền: 12121 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:14:54.642818 | 2023-11-26', N'S0000000001', N'OP0000000030', N'Xoá phụ cấp ssq:
  - Số tiền: 12.121,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:16:04.412037 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:16:08.300154 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:16:12.916890 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:16:47.473048 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:17:14.777397 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:18:10.097990 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:18:42.960601 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:20:06.505180 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:22:50.799014 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:23:07.366116 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:23:16.474188 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:23:45.623170 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:24:13.516021 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:24:25.083336 | 2023-12-10', N'S0000000001', N'OP0000000016', N'Thêm ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:24:29.247730 | 2023-12-10', N'S0000000001', N'OP0000000018', N'Xoá ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:27:03.356379 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:27:15.221710 | 2023-12-10', N'S0000000001', N'OP0000000016', N'Thêm ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:27:19.145894 | 2023-12-10', N'S0000000001', N'OP0000000018', N'Xoá ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:28:26.420286 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:35:23.951276 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:35:57.426573 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:38:00.206521 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:40:18.694714 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:41:47.712181 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:42:11.648046 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:44:07.876571 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:46:14.445317 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:46:45.297578 | 2023-12-10', N'S0000000001', N'OP0000000016', N'Thêm ca 5:
 - Giờ bắt đầu: 04:30:00
 - Giờ kết thúc: 06:00:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:47:25.529426 | 2023-12-10', N'S0000000001', N'OP0000000017', N'Sửa ca SH0000000005:
- Giờ bắt đầu: 04:30:00 -> Giờ bắt đầu: 22:30:00
- Giờ kết thúc: 06:00:00 -> Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:47:29.280413 | 2023-12-10', N'S0000000001', N'OP0000000018', N'Xoá ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:48:07.122497 | 2023-12-10', N'S0000000001', N'OP0000000016', N'Thêm ca 5:
 - Giờ bắt đầu: 22:30:00
 - Giờ kết thúc: 22:45:00')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'16:49:05.017394 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:01:39.131803 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:05:30.977783 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:11:21.721874 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:14:33.316923 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:15:12.324048 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:16:16.119544 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:17:43.638735 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:18:18.717230 | 2023-12-09', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:18:21.579028 | 2023-12-09', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:22:45.104311 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:23:59.428339 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:26:49.318946 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:34:01.358873 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:35:59.743675 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:37:03.996267 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:39:07.458895 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:39:09.735777 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:39:13.361733 | 2023-11-20', N'S0000000001', N'OP0000000048', N'Thêm phiếu thưởng')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:39:21.342945 | 2023-11-20', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000001 vào Phạt C0000000001:
 - Số tiền: 5.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:39:40.172882 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:42:14.421062 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:43:38.834292 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:49:13.837203 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:54:20.278887 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:55:05.361353 | 2023-11-20', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:56:59.346594 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'17:59:46.283144 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'18:00:13.869843 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'18:10:51.116348 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'18:11:56.297821 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'19:38:32.275659 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'19:39:31.819143 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:05:22.803094 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:06:12.203903 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:10:09.503584 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:14:20.419461 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:16:51.744808 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:18:19.974897 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:20:51.399071 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:21:31.875706 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:23:19.680953 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:25:02.766687 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:34:48.988506 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:35:18.870086 | 2023-12-02', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý phòng ban cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:37:15.199512 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:38:26.559385 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:40:01.907912 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:40:15.907304 | 2023-12-02', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Thao tác quản lý loại ca cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:41:35.448333 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:47:04.723995 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:50:27.964979 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:51:07.480728 | 2023-12-13', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:51:34.890148 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:56:19.747061 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:57:16.499548 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:57:37.256892 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:01:35.381527 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:02:05.297370 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:03:03.128423 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:07:07.731723 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:07:21.549102 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:07:38.253435 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:08:45.370554 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:08:53.375601 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:11:24.116688 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:17:54.500329 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:17:58.542781 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:20:35.146049 | 2023-12-12', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:20:38.827706 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:21:11.308186 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:21:35.407858 | 2023-12-12', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:22:56.069271 | 2023-12-11', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:29:21.172396 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:29:49.713424 | 2023-11-21', N'S0000000001', N'OP0000000031', N'Thêm nhân viên S0000000002 vào Phạt C0000000001:
 - Số tiền: 50.000.000,000 ₫
 - Ghi chú: ')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:37:26.704670 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:43:16.995625 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:50:26.555995 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:52:27.250890 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:53:18.680510 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:56:03.740608 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:59:45.255303 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:00:46.222330 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:06:16.459508 | 2023-11-21', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:10:39.506498 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:17:27.589073 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'22:35:55.161934 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'23:24:46.006726 | 2023-12-06', N'S0000000001', N'OP0000000047', N'Nhân viên S0000000001 chấm công lúc 23:24:44 ngày 2023-12-06 cho:
- Giờ ra ca 1
- Giờ vào ca 2
- Giờ ra ca 2
- Giờ vào ca 3
- Giờ ra ca 3
- Giờ vào ca 4')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'23:25:06.487748 | 2023-12-06', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000024', N'IT0000000017', N'Thêm nhân viên vào lịch')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000025', N'IT0000000017', N'Xoá nhân viên khỏi lịch')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000026', N'IT0000000017', N'Thêm phép cho nhân viên')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000027', N'IT0000000017', N'Xoá phép của nhân viên')
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
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000040', N'IT0000000013', N'Thêm quyền hạn')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000041', N'IT0000000013', N'Xoá quyền hạn')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000042', N'IT0000000018', N'Thêm nhân viên vào phụ cấp')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000043', N'IT0000000018', N'Xoá nhân viên khỏi phụ cấp')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000044', N'IT0000000015', N'Sửa thông tin')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000045', N'IT0000000015', N'Đổi mật khẩu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000046', N'IT0000000001', N'Khoá tài khoản (Sai mật khẩu)')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000047', N'IT0000000021', N'Chấm công')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000048', N'IT0000000010', N'Thêm phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000049', N'IT0000000010', N'Xoá phiếu')
GO
INSERT [dbo].[Operation] ([OP_ID], [IT_ID], [OperationName]) VALUES (N'OP0000000050', N'IT0000000023', N'Cập nhật thưởng - nợ')
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
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000002', N'PS0000000002', N'CT0000000001', N'TK002', N'$2a$11$2PYGtjVB.lIbjWhxRF5QaO/pc7I2zEu5DeaO//6oYqsjXTotfnq4q', N'079202983748', N'Huỳnh', N'Phước', N'Đạt', CAST(N'2002-11-29' AS Date), N'123/23', N'Trần Xuân Soạn', N'12', N'Tân Bình', N'Hồ Chí Minh', N'Nam', N'0987678678', N'huynhphuocdat@gmail.com', N'Thạc sĩ', CAST(N'2023-11-29' AS Date), CAST(N'2030-11-29' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), NULL, CAST(N'2023-12-12T12:20:54.947' AS DateTime))
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000001', N'SH0000000002', N'ST0000000001', 1, NULL, NULL)
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000001', N'SH0000000003', N'ST0000000001', 1, NULL, NULL)
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000002', N'S0000000001', N'SH0000000002', N'ST0000000001', 0, NULL, NULL)
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000001', N'Liên ca')
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000002', N'Từng ca')
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000001', N'S0000000001', CAST(N'2023-12-06' AS Date))
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000002', N'S0000000001', CAST(N'2023-12-11' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AllowanceName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Allowance] ADD  CONSTRAINT [UQ_AllowanceName] UNIQUE NONCLUSTERED 
(
	[AllowanceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardTypeName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[CardType] ADD  CONSTRAINT [UQ_CardTypeName] UNIQUE NONCLUSTERED 
(
	[CardTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ContractTypeName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[ContractType] ADD  CONSTRAINT [UQ_ContractTypeName] UNIQUE NONCLUSTERED 
(
	[ContractTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DepartmentName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UQ_DepartmentName] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_InterfaceName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Interface] ADD  CONSTRAINT [UC_InterfaceName] UNIQUE NONCLUSTERED 
(
	[InterfaceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_OperationName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Operation] ADD  CONSTRAINT [UC_OperationName] UNIQUE NONCLUSTERED 
(
	[OperationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PositionName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [UQ_PositionName] UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_BeginTime]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_BeginTime] UNIQUE NONCLUSTERED 
(
	[BeginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_EndTime]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_EndTime] UNIQUE NONCLUSTERED 
(
	[EndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_ShiftName] UNIQUE NONCLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftTypeName]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[ShiftType] ADD  CONSTRAINT [UQ_ShiftTypeName] UNIQUE NONCLUSTERED 
(
	[ShiftTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Account] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardID]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_CardID] UNIQUE NONCLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 14/12/2023 10:54:18 AM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CheckWorkSchedule]    Script Date: 14/12/2023 10:54:18 AM ******/
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
GO
ALTER TABLE [dbo].[Authority] CHECK CONSTRAINT [FK_QuyenHan_GiaoDien]
GO
ALTER TABLE [dbo].[Authorizations]  WITH CHECK ADD  CONSTRAINT [FK_Authorization_Authority] FOREIGN KEY([AU_ID])
REFERENCES [dbo].[Authority] ([AU_ID])
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AL_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AU_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CardID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CT_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CoTr_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_DP_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_IT_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_OP_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_PS_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ShiftID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[CheckShiftTime]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ST_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_StaffID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_TKM_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_WS_ID]    Script Date: 14/12/2023 10:54:18 AM ******/
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