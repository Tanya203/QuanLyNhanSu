USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Allowance]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[AllowanceDetail]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Authority]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Authorizations]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[CardDetail]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[CardType]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[ContractType]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Interface]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Month]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[MonthSalaryDetail]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[OperateHistory]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Operation]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[ShiftType]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[TimeKeeping]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[TimeKeepingMethod]    Script Date: 10/12/2023 4:51:45 PM ******/
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
/****** Object:  Table [dbo].[WorkSchedule]    Script Date: 10/12/2023 4:51:45 PM ******/
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
INSERT [dbo].[CardDetail] ([CardID], [StaffID], [Amount], [Deliver], [Note]) VALUES (N'C0000000001', N'S0000000001', CAST(500000000.000 AS Decimal(38, 3)), CAST(0.000 AS Decimal(38, 3)), N'')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:10:47.907573 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:10:55.367085 | 2023-11-28', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Đổi hình')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:46:47.817194 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:47:25.137039 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:47:55.991431 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:48:43.645140 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:50:51.069865 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:51:10.498816 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:52:43.443281 | 2023-11-28', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:52:46.629177 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:56:03.464885 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'11:57:03.323297 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:00:28.114708 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:29:43.755404 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:30:23.399468 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:30:53.715656 | 2023-12-10', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'12:58:14.121460 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:42.557935 | 2023-12-06', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:49.861912 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:45:53.390981 | 2023-12-06', N'S0000000001', N'OP0000000027', N'Xoá phép cho nhân viên S0000000001 ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'13:46:00.373129 | 2023-12-07', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:02.070207 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Thưởng C0000000001:
- Đã giao: 0,000 ₫ -> Đã giao : 50.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:43.329511 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:19:56.065162 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:05.726169 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:46.529985 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:20:59.282685 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:23.961362 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:32.849953 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:53.943866 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:53.968817 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:21:55.888342 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:15.259317 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:22:21.357609 | 2023-12-06', N'S0000000001', N'OP0000000022', N'Thêm lịch làm việc ngày 2023-12-06 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:23:49.009746 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:24:08.756460 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:17.553691 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:34.961516 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:25:53.618354 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:26:03.081907 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:13.934148 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:14.593921 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:40.182090 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:32:57.738242 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:09.939495 | 2023-11-29', N'S0000000001', N'OP0000000040', N'Thêm quyền hạn Truy cập nhân viên cho chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:21.985978 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:33:43.006936 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:34:07.220570 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:49:03.558863 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:50:00.191967 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:50:12.967328 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:04.547697 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:07.557277 | 2023-11-24', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:51:34.381361 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:52:19.596547 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Ứng lương C0000000002:
- Đã giao: 0,000 ₫ -> Đã giao : 5.000.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:52:55.073954 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:53:00.956697 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:04.581435 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:29.529789 | 2023-11-24', N'S0000000001', N'OP0000000050', N'Cập nhật số tiền giao nhân viên S0000000001 trong phiếu Thưởng C0000000001:
- Đã giao: 50.000,000 ₫ -> Đã giao : 50.000.000,000 ₫')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:41.026380 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:54:49.236557 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:55:34.385649 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:56:29.412762 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:56:30.549718 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:57:07.369540 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:57:49.907682 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'14:58:50.190736 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:34.429099 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:47.131370 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Truy cập nhân viên của chức vụ Trưởng phòng giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:02:55.303063 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:13.361140 | 2023-11-26', N'S0000000001', N'OP0000000026', N'Thêm phép cho nhân viên S0000000001 ngày 2023-11-27 - phòng ban Giám đốc')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:24.294903 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:24.526127 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:04:33.320746 | 2023-11-29', N'S0000000001', N'OP0000000004', N'Sửa nhân viên S0000000001:
- Phòng ban: Trưởng phòng giám đốc -> Phòng ban: Phó phòng giám đốc
- Đổi hình')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:05.178408 | 2023-11-27', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:38.300350 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:05:46.739941 | 2023-11-26', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:06:24.569680 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:06:28.683490 | 2023-11-22', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:06:36.556315 | 2023-11-25', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:07:21.020004 | 2023-11-29', N'S0000000001', N'OP0000000041', N'Xoá quyền hạn Thao tác quản lý loại ca của chức vụ Trưởng phòng giám đốc')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:24.105844 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:13:28.390157 | 2023-11-23', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:15:21.959527 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:16:22.228860 | 2023-11-29', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'20:56:19.747061 | 2023-12-02', N'S0000000001', N'OP0000000001', N'Đăng nhập')
GO
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'21:11:24.116688 | 2023-12-04', N'S0000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'SH0000000005', N'5', CAST(N'22:30:00' AS Time), CAST(N'22:45:00' AS Time))
GO
INSERT [dbo].[ShiftType] ([ST_ID], [ShiftTypeName], [SalaryCoefficient]) VALUES (N'ST0000000001', N'Thường', CAST(1.000 AS Decimal(38, 3)))
GO
INSERT [dbo].[ShiftType] ([ST_ID], [ShiftTypeName], [SalaryCoefficient]) VALUES (N'ST0000000002', N'Tăng ca', CAST(1.500 AS Decimal(38, 3)))
GO
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate]) VALUES (N'S0000000002', N'PS0000000002', N'CT0000000001', N'TK002', N'$2a$11$2PYGtjVB.lIbjWhxRF5QaO/pc7I2zEu5DeaO//6oYqsjXTotfnq4q', N'079202983748', N'Huỳnh', N'Phước', N'Đạt', CAST(N'2002-11-29' AS Date), N'123/23', N'Trần Xuân Soạn', N'12', N'Tân Bình', N'Hồ Chí Minh', N'Nam', N'0987678678', N'huynhphuocdat@gmail.com', N'Thạc sĩ', CAST(N'2023-11-29' AS Date), CAST(N'2030-11-29' AS Date), N'Bình thường', 15, CAST(120000.000 AS Decimal(38, 3)), 0x89504E470D0A1A0A0000000D49484452000001F4000001F4080200000044B448DD0000000467414D410000B156F4F30B75000000206348524D0000871000008C120000FD590000813F00007D760000E99100003CE7000019CF82E9C3720000014B694343504943432050726F66696C65000028CF6360603C91939C5BCC24C0C0909B575214E4EEA4101119A5C0FE88819941848193818F413631B9B8C037D82D8401088A13CB8B934B8A721850C0B76B0C8C20FAB26E46625ECADC890CB60E0D1B6C1D4A741AE72D55EA63C00F3853528B9381F407208E4F2E282A01BA8907C8E6292F2900B125806C9122A0A3806C1D103B1DC27600B19320EC10B09A902067203B03C84E4847622721B1A17681006B29D0B3C80E2949AD2801D1CECE060CA03080887E0E01FB8D51EC24422C7F010383C5270606E67E8458D2340686ED9D0C0C12B710622A4075FCAD0C0CDB8E2497169541ADD102E21A861F8C73984A999B594EB2F971087149F024F17D113C2FF24D224B464FC159658D66965E9DF16BCBCDF6D7DCC27DCD42CA62C4536473DA4AC3EA7A3B742699CD59BDBC67D3ED7D334F1DBF9EFAA4FCE3CFFFFF01478364E5106DED13000000097048597300000EC300000EC301C76FA8640000FE2F49444154785EEC9D079C13C5DFC60FE9BD1FBD83F42620228A1DC58ABD771115C50A28828052A417A517E9BD5D4DCF5DAE9724975EAF975C7AEF6DDFDF64EEC29103F4EFAB82E73E9F87656FB3D96C92DDEF3C333B998D23489122458A549313097752A448916A8222E14E8A1429524D5024DC49912245AA098A843B2952A4483541917027458A14A9262812EEA4489122D50445C29D142952A49AA048B89322458A541314097752A448916A8222E14E8A1429524D5024DC49912245AA098A843B2952A4483541917027458A14A9262812EEA4489122D50445C29D142952A49AA048B89322458A541314097752A448916A8222E14E8A1429524D5024DC49912245AA098A843B2952A4483541917027458A14A9262812EEA4489122D50445C29D142952A49AA048B89322458A541314097752A448916A8222E14E8A1429524D5024DC49912245AA098A843B2952A4483541917027458A14A9262812EEA4489122D50445C29D142952A49AA048B89322458A541314097752A448916A8222E14E8A1429524D5024DC49912245AA098A843B2952A4483541917027458A14A9262812EEA4489122D50445C29D142952A49AA048B89322458A541314097752A448916A8222E14E8A1429524D5024DC49912245AA098A843B2952A4483541917027458A14A9262812EEA4489122D50445C29DD47F45E1ABA7D87F5231DBFA83D3EBEB0FAD050F37362952D7110977524D4AA1060A86AFB2FFEA29F6FF8CC78660FD738E28660F1BEE5B43638583A180CF1FAA77D88B4C7822D3FA0D9222152312EEA49A94EA70782DB2C7D847A0E9FFCCC628A3FF9CEB15DDC386BB147574B7C120807BD81F0013BE7A7B23869906DB2445AAA148B8936A526A8845700C34B101EBD830DF10BCBFEB2BC27FFCEEB4A11B08FE8AEE5B74671A1A3F0486D5B082FE001823FE2ACA5FBD6552A4A222E14EAA49298AF5283D1BBB214383F0144CDB3F30C5FEFF086F01B6E60B05BDE12B761375333170477BD8A071069B68E8FFE70E916ABA22E14EAAE90840D7108B7FC4C0D94084B67F640AC674FED3C61B0147E10E5807BB225370B4E0694879C477221C1501F58DA84991BA8E48B8936A3A02D4010AA34CBCB171B407CE02B8FFA0FF9F708F921D8CD9EDA9B73B6298C1CB1B1AEF6DC3ED9022F54744C29D54D311800F381883456CDC50D3D020347335737FD70D21FB478CD57009DE4E7427A37CC78E2E075FB5FFD7D90752A4AE2712EEA49A8E0076C0C186586C88F2A8A28DD768FE6A56FEAEFF67357A1A5E10DD43F0F580DED00DE18EDD68C3A4485D2512EEA46E4585C388C7C160D0EFF7C314E661C6ED76BB5C2E98FA7CBEBAF5228295E1518FC7030F797C5E97CF0B53ECA8EA5888DBA98361221042860D07828140003608CF75381C369BCD62B198CD66FCEAF821D832BC2E3CEAB43BEAB6D3C841AF0F8C3AA1FB034420882E75465F0B195E2E080FC10A7E2F6CD18BDF602014F40703BE801F76D5E9F58061C60D336E97CD61B7D8AC46B3C96032EA8D06B3D5027FDA9D0E97C70DEBA326F8C82BC31EC27EA286F8AB05CBF143A8008BA8EE0152FF19917027758B0A7884991E0513CC00B060094C351A8D56AB35180CC062C02EF01717032291482A95AAD5EAAAAA2A93C1E8723881A7C056BFD3EDB53B5D468B45A3D3955656298A4BC572B540A21049E442B1985754945F589095939DC6C960B2D3E9CCB52B7F5CB362D5EA1F56FEB47CC5AAEF97AFF8EEFB1FBE5DBA7CC9772F3EF90CF8A52762A75FCCFBF88BF99F7CFDD1A78B3EFDFCDBCFBE5CFAE537CBBF5AFCC3D74BD292A9E0F4145A068591496566D259590C76262B4D2996AA64F25295BAAAAC5C57A331EA0D56B3C56EB5C1D466B1C20CECB9C7E5866209BF5F98C1650C86BEC962C6D0B7DBED4EA7134A208C785C26E18F024492FDBF2C12EEA46E51612AE9743AABD50AF0C2D802C601E00067151515D5D5D5F85114CCA3028E450C311980EEB6DA01E80EBD298BC64A4FA6D2CF5DBE74F8C4F15FF6EE5BBF75FBCAB59B97FDF8F47D0F3F3EEBC1D977CF7A60DA8C9913A7DC3966C21DB78F99347CD4A0EEBDC003BBC50FE8DAB37F971EFD3A77EFDBA95BFF8EDD8674EB051EDA3576DABB75C7DE6D3BF56DDBB95F87AE033B761FD4A5272C1FD6ADF7E8DE03C7F41934AEDF908903874F1E7CFB94E1A3A7DD3E76EAA871AB167DB7FABBE59B56ADD9B571EBD1DDFBCF1D3D9174F602E56202943150D2A824B2AA9232934EEFB63B50E1043500FCBE42A88E02950C603A946A2693093E0DF8701AE21B978838B647F95EF718A9FF9248B893BA4515617BB8B4B414423AB00C1006CCC20116E886D70178C1425802B8877520F072F3F2217D532F251EDF7F68DB9AF5CBBE5CB4F0BD0F3F7CEDADB79F7EE18D279E7DE591279EBDE7A1C7A6DCFDC0983B660E1F77D790D17D5B76E8DDB27DEFE6ED7ADED6A6475CABAE712DBAC635EF1C775BCFB8D63D9AB5C65358DE3DAE5564DA32BE599B5E71D770FF961DFBB5E880DDB779FB3EB7B5C3EE1DD71A3B3EAE35AC064F07C36B8D00EEC7F79FD87FE8B4E163668D9F327BDACC27673E00250D407FEDF72BB6AFDD7078E7DE4B27CFB053A8791959FCBC027DB5C650ABB5188C0E9BDDEBF6A0DEEE11DCC3DB077CE34F03049F187C50407C803BC9F7FFB848B893BA4585A3BAC3E1B82A98D70B800E99BDAAAA4A2814B2D9EC0B172E1C3E7C78DF9EBD2F3EF3ECB38F3DF1D8BD0FDC3369EAA421B70FEBD107D274CF16ED80CBE09E71AD7AC5B5EA13D7BA5F5CEBFE716DFAC6B519DFADDFF8EEFD27C70F9AD267E8F4FE23EE1E3CFADEA163EF1D36EEA5990FBF74CF232FDFF3084C5FB977F6CBF7CE86299A99F1D035FDDCD459E067A7DCFBCCE4994F4FBAFBA989339E9C70D713E3A73F3D61C693E3A6CF193DF5E1DB27DD3F74DC3D0347CDE837E2CE7EC3611F80F8B033B04B5143F931BC7B9F517D06DE316CD4FD93EF7CF2FE875F7DEAD9F75E7E7DFE1BEF6C5EBDEED78D5B8EEE3D9078FE624E7A865C2CA9A9A8346A75015F5D48878F0B7F62F027263E8864FA7F5924DC49DD1242293D42223C1385147E1453DE603044DBD94F9C3871E0C0818D1B372E5EBCF8EDB7DF9E3367CE8C1933264F9C3428BECFE01EBD8774EB35B86BFCE0CE3D8774EA81DCA1FBB00E3D4675EA35A17BFFBBFA0E7F60C8B839A3A63C3DFEAE6727CD5CF8F4AB5FCC7DFD9B17DE5EFADABC95EF2C58FBE1971B3E59B4E9D32594DD47C1D43DC7687B8FD3F79D60EC3FC93C708A75E0943285734DB3F69E60EE39DED8BF7CB674FB826F377DF4CDDAF716AE7CE3A3EF5F7E7FD10B6F7FFDDC9BF31E99FBDE834FBD31EBB117EEBC1F4A82D9A3EE98356C1C142D9DE39A41BD21528168D5FDB6363D5BB58F6FDDA167DB8EA3FA0F9E387CD47D53EF7A6ECE931FBDFDDEF78B966C58BD76C796AD7AAD0E3E13FCB140D505808E3F3152A448B893BA2504F88E0A631DB7C09495954136A7D168070F1EFCF9E79F57AC58B172E5CA356BD6DC7FFFFDF7DC73CF942953468F1E3D60C0806EDDBAB56BD7AE4D8B966D101C5BF66AD5615897F809FD86CC183EF68131773C3AFECE95F316AE99FF25507BD7A2958797FD7C66CDF6CB1B76276DDE5746CB29A7E756B10A6A397C638ED85A2077F0544EBE5A9F2534648B6089394F6AC997D90A1576AE121EB2E5C9AE6942598BACD020CB6B085935B6B34061CF93597324A64CA12E9DAF61155630F2E015337F3B977EE0346DE79184CD7B4FAED97670D9BADD8B576DFF7AF982675F7BEFA9175E79E8F13977DE73F7C8F163FA0C8222AA4FBBCE1DE26EEBD8AC658F361DFA77ED797BBF41E3878F9C3A76C29D93EED8B2693394709B376FDEBD7BF7D9B367B3B3B3CBCBCBA14E13D32603AAFBA049FD6744C29DD4FF57FF2F6CC0932346CD0B11877CFEA0D717F078FD6E8FCFE53E71E4E8B64D9B3FF970FE03F7CE1A326060F78E9DC1BDBA766FD7A255C716AD3BB76ADBB54DFBEEED3AF6EAD0A577C7AEFD3B769B3DF9AEE7673CF8E1132F2C7F6FC19EA5AB13B61FC83A7691779E224B64AB923915D41C2D9B6BCD127BF395217E292128AF4ACEA94EC9AD49CDD350F26BA9055A5AA18ECED533789549D9F0105E0E0B6189915564620BEC1CC9F56C4B175BD8422383AFA3166A52F2AA9372AA12B3CD0C7ED4F010D8C0440E704B3D85C58E2C99214D5045C92B49C8509C6789CFD24B18F9C2A434D66FE78EAEDDB1F693C50B9E7DE39559739E983A6B748F0123BBF51BD6B977FFF6DD7BB7EEDCBD45FB2ECDDA74886BD1B773F7DE9DBBF5EF1E3F6ED8ED73EE7FE88BF99FFCBA65DBB913A77C0E17B2CB0D1F23183E4FF854FD5E5FF4036FA8E8B298AEF4E0AB57BCA1FE875549FD1322E14EEAFF254C048C8686F605FC607F30008E0AF2B856ABD1E96A8D46BDD56A7639ED018F3BE4F3123E1F110A115E9FD360540B4509A74EAF58B4F8B9D98FDD39665CBFCE5DFB76EAD2B77DA7DE6D3BF46CD5B6478BD63D9AB5EC1ED7A25FABF623BBC4CF1A31F695FB1E59FCFA7BBF2C5A7E6AFDF6E45F0E5433F23574C071BE8E5EA0A717181885263AB28DC9B733F84E06DF4547F6D0B0057EA6F49A0EB064D8F84F1F43821D64CBFF12C336BD912DC3346A0F4B6A658A4C6C643D4BA8630B6BD9821AB6A03A4DC03E70FEF296437BBE5DB7ECCD4FDF7BE8B9C7C6DD7D67DF5163BAF41B705BFB7EA8F9BE25B85F8B76C33A741B1BDF6F62FFC18F4F9FF9F633CFAD5DB234E1C4297921CF56AB255C6EC21F0A7B83414FC0E7F4DB2C7693D166B1D89C2E9F371872F943CE50D045104E22EC200873C86FF0F90C1ED735F81EF982A33F048B9AC05352B78C48B893FAF3C21C6F98F2A20E1161C0BAD3ED429DB223B200486C36F448BD81EC56BDBEBAB4B44C26BF7CF2D4C97D07B6AF59F7EDC79FBEF1E4330FDE316DC2C02123BAC5778B6B1EDFBCF5A0769DC7F4EC7BE7A0110F8C99F4C41D77CD9D76CFD1D59B4EAFDF9EB87D5FDAFE13DC9309CA0466253D5BC72A008E9B6985166AA195C6B547ECA4F1C080722F8DEFA3220728510BC2346998266B6C822EC7C67F86A8526C82A1F84B1C7DA1860ED2651E86D4C9943A18123B53626349CC2CB1892536B0C55A96B0825228BDC8C93D9A4CFDE5C4C9D53B772F5ABBE5D3659FCD79F1C3079F7CEDCEFBE78C9A7C779FA1E33BC50F6FD56960F37613E3FB4F1F7CFB9CA933DE7DFAB9EF3EFE74FBAAD5477FD975F6D0D14A65A9A1DAE0B3FBA25F58284CF8C384C9E5D13B5DB50E47B5DD5EE372D6FABDA608E50391B5AE52E4590DB18E984EC2FDD6130977527F5E98E351B863E385E8279740768B45AFD7EB743A83C160369B11DC311AFC019BC1A492C8D229F413077EDBB571EBECBB67CD1C3779647CFF9E2DDA75896BDEA359EB411DBA8DEED16FDAE091B3464F7AE6AEFBE73FF5D28A0F3EFBF5BB1F4FADFF2561FB010525434DC92CA3E5D4300BF4E97C7396C8962B75E7CAADACBA848E423AB308EC610A901BC0BD01E26F39B807590A5F9AC2CB96BBD972174BE664CB1C69325BBA2C5058E12928731594DAF38A2DD9CADA7471059D579C929B7DE03CEBD7A31756EFD8F9F9B2EF5F7CEF9D7B1E7B7CF4D45903478FEBD47B78DB6EFD6F6BDFBB59DB016DA068EC7FD788B10F4CBA73D7FA6D670F9FE66614682BB490DFC341221C21B32710B6B97DB5367BA5D95C6E36573B1D8680DF010570FD171AF5B5F53B0F93BA0922E14EEACF0B9FCED784BBC3E504BB22A305E09F1D396C769BC52A2CE4E567663312538EEE3DB066E90FF35E7BEB89FB1E9A35716AD7B8569D5007F366DDE35A0EEBD0E3EE61639F9BF9D0FB739EDBB678C5DE1FD69DDAB49379E8B43081599DC9B70B8B838AEA2A56818655A865730D697C4BBAC096217264495CD952075BE066217BD842B09725F4B145019608C8FEAF803B91A60AA6AB02694A7F3AB2274DE14E57B8380A3B5B6A6408B5547E35855B4DE36918451AA6A0965964CB96993384B5AC4275425AC1914B942D078EFFB071EFA255F3673FFBEA8C871F1A31715CD7BEFD9BB5EB19D7A2475C73F86C678C9EF2C4AC473F7DF7E36D6B365F3A7121373D5729515594D700E221BF7B82842310B2F8FC068F47E772E91CF6E8171A35A97F8B48B893FAF3C2677B0CD6EB8CBB6744FE703B5D9AEA1AB958C2CF2BF86EE1570BDFFBF0D5A79E7D60DA8C710386F6EBD03582F56623BBF5993270C49377CC8484FED3475FEE5FB9FEE2B67D94BDC7CAD20A2A395C4DB6C0942FB5F3555E5159585A45C86B20AA03D4CC69452616CF482BD053F2B42939DAA46C8475A600988E0D58C76E0CF7886F2DB88309B60AF80E0EB19560A03C047940BC2985AF4D2CA8BA94537631ABEC5276F9E59C8A84DC8AC41C67A6CC932BF717AA83BC122F57EDC89519384550EC651C3843F9E5B7632B36AEFFE8EB854FBDF2C2D4FB1E1C3A7E5ADF61BD6FEBD4B76DF7215DFB4D1A3C66F68C07E7BDF6DEEAA53FEEDABE5B255503E2CD16872F5437BE3150DEEA763786FB0D4CEA9612097752FF2FC1291D0377AC80CFEF71B9AD465399BA38979379E6D889ADEB37AEFAF6FB3B868D1AD76FC8902EF1FDDB76060FEF1C3FA1D7A0BB068EFCE2A5B77F9CFFC5E11F37A51F3EA7A066D6E6084D5CB98DA7741515BBB8A803A229530839BD9A9A5B9994599EC0D1D30B80E9464A3E724A9E2139176C4CCA71338AC05E7A918F21C0F63385E07F0DDC994A82A50C3315211672802907FB5872074D04B6D3C5A8459E25B5B124269A409FCAB5D0F97656912B43ECCB91FB0B5481423518581F12967BF9C55004962467E41C3C77E6A76D3B3EFD6ED5DB9F3D3BFDE107C64E1F173FB44FCB2E3DE2DA0FECD86BD2B071F74FBB77C3CA9FF7EED89B743199CF15565769AD36A873A1FE4AF83BFDE32675EB88843BA9FF97AE716247FEC8CBCA6650A8270F1FDDB07AEDC2791F3DFFF853F74DBD6BDAE8F1FD5A7719D6217E62EFA18F8CBDF3ED47E62E7FF7B33D4BD79E5AF76BC6D14B05A75315C9199AF4226B81D25B54E61756040415F64CA92D43624E131AE83C4D4A5E4D6276E5A58C8AF3E95E8E0C1CCC5084329544B69AC82D21F2CBC06E2A0FEC89B80EE8007A7AD1F5E01EA44B514B77238718726CFC678026C506ECFE258EBE504323B85F5DA2E017F5C34EB214C8E9AA704631915D1ACE2A0970545EB6CCCD14B918421BBD086C67081C6C919B23F564C9097E05385858EACE559AD882F2E46CE9193AEF78F2E56DBF1D58B965D93B0B5F9CF9D8947EA306B5EDD9BB45E7F8969D678E9D0641FEB5B9AF2CF962C99EED7B522EA7F2F2F80A99B2EE3B6DA086DF78B45C8F96EEA46E1D917027F5D7099FF191BE301B7F5CB3F4F3AFDF7CEEA5FBA64CBFBDEFC0DE6D3B75BDAD75B7B896C3DAF698DE67C44B773DBCE2ED4FCF6DDC234DE278C4154495DD2BAA70718BCD99122D9357432BD0D1B90074D47F9C25046039D3C4C02C5F863C90A50C67A910CDB35421207B9ACCCF147B6802570ACF9154684F2C70A516823DA95C37850B534CF92BA0BFE5E11EA648B143A91270902209A48A7D1431915E8C9AE399723F035D7425D2D5444649C4EA40BACCCD10DA293C30803EC091C3E7634A2D34A61418520B4C54AE8559E4E4487C394A5F41B1BDB0A422AD28FB58D281651B173EF3D6C3A3EE1CD5A95FEFB88EDDE3DAF66CD6614024C83FFBF053DF7EB6E8C0F6BD09A72FA06F137FADD80D8417C4F09DD4AD2312EEA4AE92CF870641F74446D0C53F6E0C44C69B8587E04FA7D36989C81A11CC8402417C967B9D2EB9507CEAC8B1EF167EF5FADC1786F5EA37B0738F9E2DDAF568D67A40BB2E93FB0F7BF48E19AFCC7AF4C0B2F5177EDE9B71F0A2EC12A792C13364486C394A67AEDA942EB1A44BAC69123B1BD9C1427682E92217ADCE9E06F6D325D80186141C62008E6521A6C44BE1810314C4EE20B52840170419C26B3AC014061862807B14E27EAA048C20DB88C5FF8C518B0D55D6D838D1372C6C20CB637BA9222F5D8C1DED8CDFB0E33CB68B8DEC48936A683C7BBEDA92A328A5E497D30A4B6905893B8E7CF7DAC78F8C9E3EA5CFED035A76EB16D7A66B5C9BBE6DBB8FE9336CDAA889EB7EF8E9F0BE03500F336A7541AFCF65B3579696098B042E071C0B48F8CAB9C7E7C577142175EB88843BA9AB0404C7BF360A06AF9CAA30AFD56A753A9DD16874381C98FBB09ACFE3ADADAAAE509788F2B929E72F6D5BB3FEC3D7DE7A70CA5DE3FB0FED12D7BC4F8BF6A3BBF57D68F41DEF3DF6EC4F1F7D79E4A7CD893B7E33E5281C796A7761A93BBFC49EADB467CA9D990A4FA612031D68EE66227B18C8C029E038E25703FB28C8019A043B12BD11DC093AB23FB5C89FCA0BA6A2CE3000F7104D10A6C7621DFB5F0477E4ABAF01446B12E8D3A089B1A3051EFEE11536203EFA5329E07B20B78410D604791556F8E473D53E7E0514B19C0317CE6FD8B76BF19A452FCD7B71C6A333068D1BDAAE57AFB80EDDE3DA8CE937F4813BEFFEECBD0F0FEDDC5398916DA8AC09797C10E7C3FE40D01FF07BEB6E7282EF220288C7070CA95B4124DC495D2588EA80F218B883944A657979B9C9648287E04F78D466B36935B5974E9E39B463D78A2F16BDFAF833778F9E38AC5BEFBE2D3BC4C7B59ED66FF863E3EF5CF0D4CBBF7CFD0375F751594ABA2157EC2D2AB364C81C190A3B476E658A0D14BE2EA9D098CCB3A616B91812375DE2A5497C1163CE827D14D428D1D08154E4E8154E0CBB7AF6C902294581145E38950F7C0F51EAE01EF515AC6347E01E856690829A41D0D61A5CF9FCA71DC3F4A869F23A47FEC4EF3D027771F4B38A123FC09045EDAF9F82BD4C9921B9D090C205EB520AF534BE394D6C608B340CBE5F58A54913E69FA29CFE79F74FEF7FF5FA3D4FDC3360DCD8AEFDBBC5B58E6FDD6164EF018FDC39F3D3773E38B0EDD76C3ABB542C273C7E742B2BA8B485C28078E03B1C1B7ABD1E1F2DA46E05917027759580DAB86506433C2A387581E610D3400683412C1653289493478FBD31F78527673E3079E0F07E6D3AF5BAADEDF08E3DEF1932E6E94977EF5EF2E3E9753B327F3B5742C9B2E448DC5C95AB50E9CA51545ECC02A03B18126FBA3298A106139C6222A3C44BBD02EE60CA55C60B637C3DB887928B4211B883094A51982A40BE3EDCC3B45B0BEE756F0737C55C1FEEA8513EF2F6AF0977A87C34E47B43BB28027B6A11D48D021CA5275D6E678ADD198A705195234B61CA90EAD24515746ED15946CAB623FBBEFD79E3826F1F9B3063EAA0DB07B5EBDAA359EB811DBBCF1A3FE583175F5BF6C537D27C5EA5B2D86DB2E2467908F276B3050AFBBAC385D42D2012EEA4AE5214EE8140A06E51BD6039605D2291242525AD5FBFFE9D77DE797CF6A3833AF5E8D7AA2344F581AD3BDF3374ECFC275FDCB57855D28E8365B41C5D3A1F801E1296878BCADC39323DBDA0E6729629A9D0451347BA7C9401D3436C655D7B488A28902C0A451C4E422612233357833ECAFAC6700F31EAE01E4EE6112957C19DA0FD9BE08EDA85EAA751E39DC4FB098EBE7D549B89567722ADF018EED7B31FAA475451902923328BFD6CB98D52E4624B096E65C999B4F2846C48F11E6E99B7A8C294252B49CD935C66EFF866E537AFBDFFC4E4BB6FEFDC2BBE599B016D3A4FEC3FF49EB193BF9DFFD9F635EB199792AA14C501BB0BDD27D617F0B9DC28CB93BA3544C29D54AC42917B3EC014FF89715F5555251289929393B76EDDFAD1471F3DF8E08343860CE9DABEE3B02EF1137B0E7C70E4A4771E797AE382C5D4DD472B58F95E51992E8D674C2FB2678A5DD9526FA6D4952EB233F8762A1F9223600822244CDDC902FB65AEE362A1EB22379028082620872E231311C3CC9F863B726A111121FB0DE07EAB35CBC4B0181BBFC1E87E82F17B078EA31ACFFF0277D765AEFD42BEE56C8EE95C8EF17C8EF162AE2585E7608AF5C985060ACF962EF5E697780A4A21C557510BD52959169E5A929A7E76D3AEEFDE9AFFF4D47B27F61E3CA055A79E71AD4774EB7DEFB83B3E7EEDEDDD1BB77252E9153295DB6041CDF124DC6F19917027750D85F1BDF9030197CB6532996A6B6B77EDDAB56AD52A48EB0F3CF0C0983163FAF7EFDF13D4B9EBBCB92F2F7BEBA3BDDFADA6ED3D2E4B64D772F8F67C3904763DA3504BADFBD5A83925CF41E7F9D3C4448632F2F3CB5282538EA64C35415711AC1222AD3C98200A5D46262E89888BF5BE240A274B83295739908A1CA2CAC101AA3C48538043742518B12FB98848E211C9BF0F77FFAD07F73053D1B009256A8032BEEA8B2FFC5E05778AD44B9361FB6972EC001D7D265187AF5846A0CBB6727FB20028EFA38888AC5222A70C227C28A7C48306399058D8620353504D292C4FCA2D4DC926AA6C44A9CEC2578A12596736EE04C4CFBDF3BE3B078D84EADAE08EDDC7F51BF2F0B4BB01F1BFACDBC84A4891728B48B8DF3A22E14E2AD25D393A8D0852BBDFEB7339DC46BDA1B2A4422593BFFCEC8B0FDE336BD4A0E1DDDB75ECD2B27DBF2E3DC60EBEFD9E5193CF6DDC937DE07C15353F20A82064B5BE82E29AE45CC5096A3057ED49975A520AB51732B56739A64B39EE547E902983B4EE8BA01900ED4D103A2FF0DCE791039785E0E02561F8521171B1CE30FFBFC23D942C447C4F1120A70A09E017554CD0C4613A7210681E31601DFB56863B701C4F6F0C771F55865D47F6FACF24EA8670F7410D2955E4BECC85F0EE4F1112391544BA4A7F3E3BC45139E9224372A13EA9C090C235D18A1C695277AE3AEFE0654522C756A80AABB42E71859C9295B4F3C8DEE5EB1F1879C7C4DE43FBB4E8D82DAE25A4F8B9F73DF2D357DF1EDBBDBFF1B114152C6B6C527F9F48B837715DEF4442FD94ED0EB7D315F0F9D163A170C0E375D8ECB5B53A87C3054B829E8052A43CBCFBC0FB2FBD7DEF8469A37B0EBEBD6BDF315D06DC3D70CC5BF73DBDFDCB1F328F246858450E565DB745DCD92E3A0C3AEE7E0E067A36B02C821B1536264EDD05438A1439152CB9CA914B8B8D1D83C52B46D71EA531460DEB0C79438799758E7DFACD76B45B2418FFD9F0D1C6C6E86FE8DFF97C1A39FA7278C003EC60C4BE34858D2933B3918D693243BA449F2ED172C4B519E2A4ED47767CB5EA9D07E64EEE39A46F5CBB7ECD3A8CEDDAFFCEA163BF98FFE9E68D5B32D9591693151F73568BB3B4ACC2E70F9BED8E5AA3C560B33983611F41B8C384CDE389392C49FD8522E1DEC485B18E7D95C2442810F43A5D1E87D3EFF6E0FB1FC18CAED6585D592B172918C98C5F7EDEF6EE0B6FDE357CE2C0363D26F5187AFF90496FCD787CE5AB0B4E2CDD9CB3F742D9E52C2B5DE8A7A30809AE63CAD54DC38D1D257B0CDCF1CF32098A2462D115FF8F708F592DEA98D59A8C63DE66D431ABFD3903E5ED74B995816C66CA4D2CA9812DD5A7897569E2326A21F714EDDCFABDAB3FF8FAAD594FCC1A3C6E54BBF8DECDDA3F30F5DE179F7EF187253F9C3D714E5028D46A0C2EA70FC8EEF585EC6E9F19EA824EB7C5E343034FBADC5A9B9584FBDF2712EE4D5C70F2E0DF8583AF427CE4CE7638BF03D3894090F007095F40C8155113A89BD76E7EE7A5B7EE1E7FE7B0EE03FAB6E8D22BAEC31BF73EB9E4E50F8F2FDFCA3B9E5ACB2C3273A47A46516D421E09F79BEB98B71975CC6A7FCE0077075566A5215BE8608989213132457A96C85D58E6E155D80A8A8B2979C9DB0E2D7FFDE33923A70D6FD77340C75E037BF49F307CDC130F3FB1F4EBA509E7132BCB6BE060F3B8E1700BFBC3843B10B6383DB5165B8DC9A2359B49B8FF7D22E1DE94D590EC3170B79A2D76ABCDE372A3F1034261E0BBA95657A12ED9F4E386CFDE5F70FFB47BFB75EAD525AEDDD04E7DEE1F35ED957B1EBFB8E520E7C085E2A46C5B8ED2C72D77662BB5146EC5590E09F79BEB98B71975CC6A7FCE61A6C2912AB553A4562AB285263683E9422343A849E5DAB29461B1262CADD5A50B38FBCFEEFA62C5E297DE9F3268CCA06EFD3AC6B5EDD4BCFDF861633F7CFBC313874E70737946BD05F88E0F48A73760B03A8C36A7CDE526E1FEF789847B53163E97F0F0DCE028E241268311323B0AEC61C265B149F882F3274FEF58BF69C6843B47F51BDEB365E76ECDDA8FED35F48D879FFD75E93AFAFEB3A642B52947A14F136968BCDAD4427D2ABAE666678848B8DF5CC7BCCDA86356FB7306B8BB53A4AE5429203E4279B1950A165A68C2F2F39935C905E634B12D4B61CD92D632B8EA4BE94567A8DFBFBBF095479F9D387054D766ED3BDFD67ECCA091CF3DFACCC20F3EE5E5F04A14A51693DDEB0902E55D6E3F047992EC7FAB48B83765DD00EE10D8F13850D5A5E51C066BEBDAF5AFCE7DFECEB11301EBFDDAF500ACCF9972DFE2373E3EB379BF9296E7125705A5B58E3C75654ABEF2344B7592A94DCCF767AA08BE8684FBCD75CCDB8C3A66B53F6D5FAADC4BA9B3872A05BB6862275DEC62C980F2BAA482EACB399AA41C2383EFCA927BB8259CA309C736EEF9FEFD2F9E9DF9E81D03470FEBD67F7097BE437A0CD8BA7AD3D13D87D914B642ACD46B4D6EA72F4CDE6FF56F1609F7A6AC28DCA358BF9295C284596FE0E6E41DDF7F68C9C22F1FBFEFA1A1BDA036DD1CAAD54F4D7B70C99B9F1C5BBF2BFF2CAD2C8D6FCC55D8F3D5B61CA5255DA2A3F200EBBAC47C3385EF65CBC2196A807BA0FE27EFE0863DF6AE6D12EE7FA963DE66D431ABFD6987284AEC00158CFA59C237EEA34B899C723F5B614EE66ACE6769CE6718530A3CE9D24041892E4B5AC2E6159E679CDB7A70D5FC6F9E9D317B54B7815DE25A3F3C75D64B739EFBFE8B6F4F1F3A292C109A3426AFC3E775933F7AFA1B45C2BD290BC33D96EC9139BFD32D178A8FED39F0E9BBF31EBCF3EE117D06C4B7EED035AEC5FB735EFAF9E36F1907CEE9F21544B1C92FAEA961F2A5A79906A6C091260DE6941005154476899B2E365CC8A93AC126E17E731DF336A38E59EDCF9BAAC20EA329FABE60E3F03D0618320F45644BE29A2FE75B12F29CA93C1F5BE2CB52B80B4B7D929A9042672A54671E4B5C3B7FF1A363670C68D9AD6B5CEBE15DFA3D39F391D54B56B213E8D5CA0AABC66CD199EA0F4A527FBD48B83711F923E338FA7C3E97CB0553BC301CB993A9D7EFD319F435353556AB35E80F781C4E7DB566DFD65F167DB2F0813BA603D33BC5351F1DDFFFF9598F7CFDC6075599220D0759CB11EB396243BAD8141966DDCA14D919223CBA3A1E511D0FC08BC7AB82B33D8A754CF668EFE958338AA326182A64BA028C871608A788C0753F414A1184610A8FC6E086F4DFE010558A7FC305C6033C80FDF0755094442A7264461EA680EB1AE2C07EAA189926F451055EAAC04517E8697C1D535043E755D20A3569C2720697B1FFEC8EAF7FBC237EF8D076BDBAC7B5ED7E5B87BB464E5EFAC937D9548EC7EC70DBD02DD4414EA7D36EB7C3140E637CF492FA7F8A847B135104E344201080F304408F178642A1CACA4A83C1E07238FD5E5FC0E3356AB4DCCC9CCBC74FBFF6C4DC27EEBEFFAE116327F71F76FFE8C91F3CFEFCE6AF979DDBBCBB365DA44F4336A689CD69620B5B8C475A07B263AC5F19513D15B931DC513C27E1FE6FF335E10EC664AFB73CC27754C7C20E51C4418A38441106280230F03D9453122E28F7E797BA72543E6E391E2F3EEB68E2D2D73E7EF38167A6F51BD5AB59C7BE2DBADC3F6EFAA20F16EEDBFC6BA9B244A3D14022C1231AC1D16BB3D92C160B3E8049FD7F44C2BD49099F1EF8C64920A0BC805FA4A9AE2182212244986BB4ACC4D49F967CFFC613CFF66AD16E78E7F859C3C7BFFDF053EB3EFEFAD2D67DFC8BB4AAB442035B64662103D66D2CB19D29C637D000B263AC03D0830D4D910017503BC0D5975263D8113509F75BD3D1301EC3F7C670AFFB2D31762A901DD61106530560E0BB2D890BD53B2B4D509B90579B946F640834349EF27246714A2E65E78915EF7CFEC8D8BB86B6E9D9BF45D7F1BD86CD1C37E5E8C1230C06A3A2A202A713989ACDE6EAEA6A7C0093FAFF88847B93520CDC7D1EAFB6BAC66E34BB4DD672A91202FB37F33E993576F2C0B65D7AC6B598D27BC887B39FDDBF744DEEB14B15AC7C739ED459A000ACDB18C88075170319DF11A921D9117F93916106DDEAF37F817B88AE8E9A40A3C128F130E524DC6FAE63E01EE57BB459E67A708F5808DF1418F19D262138EA70BAD296C23724E49BA945768ECC9A2927D4664B9E2AE778F2F6AF56BD7EDF5377F41ED13BAE63FBB8DB9E99F3D437DF7C93909000F91D1FB410E19D4E279E27F5FF1109F726A268F081B41E6DB504B81341C25AA3CB63A6FFB27A3D04F63B068DE8DFB2637C5CCB57673EB2F8A5774FFEB845749E66CE1603D64D1C8186920B5887E485DAD6197577E644F729A5C1A97E15D6A326E1DE348CBFB518BE8301EE0D5CD7E60EBE26DCD1F7459312696A224DE5A108AD898576AAC0C351F8F24A80EFF67CF45309D1E5F4633FEDF8F8F157EFEC3BAA475CDBF62DDB4E9E3CF9ABAFBE02BE979797475B1449FDFF45C2BD8908C3BDE10C2420B7DDA12FAB4A4F485DB1F09B47A6DE3DB25B9F611D7A4CEF3FE2C909779DDBB093BDEFA42A21CD9A23F1F18A9DD9D25A4A6EE9392660BDEE7A293D725B4EAA18C81EA24AAE41F6A43F0377B259E6D634FED6C0317CFF5FE1EE3C97E73A9F6F3F9F673E936D3C9B0D7C77D084500BAC4ACCB565290899D62FAE5151F3CE6DDCB7ECCD4F5F7BE4E91671B7F5EAD5EBFEFBEF5FB870E1C18307F3F3F3C906F7BF4A24DC9B88A2374EC217A6E04FBBDDAEADAED9BB79FB676FBC77D788B103DB7619DDADEF33D366AD7AFFB3E33F6D512573CA29D95A66A1255D60E308AD2CBE895A6048CEC56DEB916E3088ECE8721955120637243B603D72A72412EE4DC6F85BC3C67CC7888FF673478E0CB38CE15E87F8C6C99DA12452C481CB7C5F52111A8033325E7C30BBD8C210BA72544161B55F58A5CF96899332328F25261F3C356DDCE471E3C68D193366CA942973E7CE5DB56A15954A2D2E2EC60733A9FF8F48B8FFBB05291DDBEDF500D381EC3E9FCFE3723B6C88EC2512F9730F3C3AB1EF902E71CD7AC7B59E3D76EA9AF95F720E9FD36614D5300BAA28791589599597323409D9A6D4420F4B1CCE54463BC360B28311D92370BF8AEFF5FEDFE1AE8A18E01E21FBD570C7F583888114915724E1FECFB8FE8B0347E11E31027A94EC31700FA1AE3288EFC1D4FAEF8BA50E250A6CA7B321C2A387D2542196DC9E5AE449973B581223955F9E90ADBAC0294DCAD173C4667EC9C237DF9FFBE8E3E3878FECD5A9EBA03EFD9E7EECF18D6BD6A526265D39B21B08FF75F53252D71509F77F9B22473CE0DB6030385C4EFC0325BDD90453F8D366B3F9BD3EAFDD999796B1E8938553478CE9DDACF588765DEF1B3276FE9CE7772D5EC5397846999451432F3467886DE952479AD4C5967A58C85E66E44EF9B48627F615373CA51B3A96117FD480F59825F58EB01E85BEBA19D2B782AFFF7D811B7E5F0D1D79147781C5B71F81030C0C471A361C7EFA1C11EBE8999F3EF9E289A9770FEBD4BD578B36237AF69E317E22E5C245517E81515B6BB39A6B6AAA4A4B8B35DA1ABBC701873F1CEA9193E02A5FA5EB3EF0DF1209F77F99C290CE034180BBDD6E47699D20FC44D8E672BAFD3E97C70DCB5D165B9944717CCF81971E7D7250BBAE435A759CD97FF8FB0F3EB5FD8BEF997B8EAB9239468EC891ABA8233B4BE661A1D32C72D6290274859F7AE562DA1FF195339C34E9EB3B5A2D6868747797A2524532FBC2FA5F56BCF3D1CB331E983E70F8C86EBD46748B5FBEF0CB83BFFC5A989D6D351A027EAFCBE5A8D5694A2A4B719AC1BE2EC3AFFBC07F4B24DCFF650AFA033E8FD7EBF6F87C3EAFDFE7F47A00EBBE5010C8EE72B98C5A9D30AFF0C8CEBDF35F7AE38E4123E2E35A3E33E9AE2FE7BE7AF4870D852712ABE879A64CA12D5BE6CA5100D99D28B3D7911D052B3ABA255BB483F31F74CC394C9AF4351D83756C3F534A08ABF45942C9652673FFC97D4BD77CF4D44BD306DEDEEBB6B653878D7EE1B127B7AE5D2FE6D5DD9715D28C4C216FC86DECEBEA771E6EFA22E1FE2F93DFEFC73DD94344D81F0C589D0EC8EF700CBB9DAEDAAAEA0C1A73DDF72B9EBEF7A1897D874CEC3970E68091FB16AFA46C3F50929C61C99158B3C45A66A18E5A68A2F32264AF6F8AC137EA8C8CF4E24F11FD4F8E39874993BEA663B08E0D70B773247A4E512D87AFC9E08B1359C7D66C7DFFB167A7F41FDEF3B63683BBC63F76CFFDDBD66D5049648069A8B0EAF57A380530B4A3BEAE7EE7E1A62F12EEFF3201CA1D2EA7C7E7C587AE2FE047FD64C2446D45552695F9E3D7DFDE337A628FB896435A757E71FA03ABDF5F283A9B5245CB76E6C9C14626B73A394B9F926F670880EC706A61ACD79F6C08EE31C1FC771D730E93267D4D4781DED07004965E482F4BC9D4A7F39D7CB5A3482D494E3BBA7ACBB76FCD1FDF7B509F369DE25B77B8F78E3BD7FDB08A9B93E7345BF1ED0748FD419170FF37090E6C88EA0E8FDBE5F3FA42417C9CBB1C4E6D6575C2C9B36B972C7B74EADDFD9AB51B10D7F6990933767FBD827B2CA19A9A6D601558D28A2C4C9E2135CF48C9F7B225446E4984EC684C1838C7F0B88C0445415015314DEABFEB98739834E96BBA21D3A38683B0F80CB33C8103154A7B9ECC5B54622E90C952D259BF9D59F0EC6B0F8E9FDABB65FBCE712DEF1A3769E5A2EFB2186C434D2D3A07B041784AEA3A22E1FE6F121CCC00774F28E009F89D6E176476BFD7A7144B2F1D3FFDC1F3AF3E3269FAA84EBD2676EEFBCE3D8F1D5EBA4E7E81E1CC965A9885665ABE995260A1163A197C0F5B184A931169F2205D1AA645BA3062B263B823BEC79E813776CC394CFA3FEE2B23C45D6D3C9C5C8C01EEBAC45C238D6B64F07574AE16F24786489729AA48E35DDA7E70CD82C573EEB8A74FCB4EDD6F6B376BE29DABBEF93EF9CC2522540FF76B9A54039170FF37098E5E88ED418280D86EB298ED569B59AB675C4E5EB6E0CBD13DFAF56FD66E705CFB67C7CF38BC644D454A56885F4AF04AFD59120FBBC8C52CF2B145A10C59284DE24CE61ACE6644C82EADC73A7604EEF53DD84893FE138E617AD43158C70E30645EB6CC9721B7B384559733556798A58999B54C1EF05D49C9A6EE3BB9EC9D4FEF1C34BA53DC6DFDDB747DFEC1C7572F5A867AC900DFAF8778520D44C2FD1695CFE7C3A380592C96E840607AA301E00EF605FC3E8FB7425D7262DFA1171E9AD3B76587BB078D7A60F0D84F1E7EF6F2DA5FA19EAB49CDA94DCEB632784E06D74507F33D34642F8DEFA3A2D1FBEAC78A118389E48893A444B2F47A708F4675DCED3DDA2C13ED080F8EAE837ECDD4680BA4FF0B8E61FA8D1D62293C34919B8EC6A773B2244EB6D4CE91D93264962CB9214B56C6E2718E5CDEF8F9F2E7EE7A646CF7C143DAF71ADEA5CF8F8B97D22E27B94D56E0BBBE5A23E4F18B154A8FC3D918EE24ED49B8DFD2C2BF388529FED3E3F1A02E8F1EB7D56A2D55A953CF5DFAEE93CF670C1FDB2D2EEEB9C9F77CFCD0DC5D9F2ECDDF77569B9263A2169869850E661190DD03BE42763E1E7A1BC81E0B7720FB1F863B38CAF728E2A3EB80639E4EFA3FE2187CFFAED12FA269687C3A0F43E261495D6932673AE2BB2D47599B2E925C4ABFBCEDB79F3EF8FAF9E98F4CEC39B46F8B2ECF3FFCC44FDF2ECB63719C06B3CFEA00BE6BCA2B8D5A1D09F7C622E17EEB0A988E470183080F58C7F757827997C3A9962BCE1D3DF1E57BF3EF1F3F6564C7F821CD3A7CFBDCDB47BF5D5B74F8724D6226901DB0EE4E13B9984540762F0D5C47F618B8D78FE81271B214FCBB700737E67B7449749D98A793267D4DE33E577EAAC44F97FA19E827756EB6DC992EF7E49658B395FA744929AD30EB68D28E2F7F7C6ECA436820F8F6DD674E9CB2EC8B6F7299E93EB39DF0875C169BB6BAA621CBF16C8305FF519170BF45E5F7FB9D4E276E9081A95EAFAF1B2D2F14D655D5249DBDF0C95BEF4D1A306C48EB2EB3068E7EE79EC78E2FFD597222C5932575B005A6D47C175BE8E7486CA905D7837BDD3D37F0882E18F1C9D260CAF5871368306E0C384AF328DFA38827E14EFA8F1B1F7BA15474FC046888EF5E26E27B30AFCC9EA1B0662ABCFC4A17BF827B96B17EFEB7CF4C79A04B5CCBCE712DA78E18F3E3E2A5923C6ED8E121DC3ED44BB201CEA3B391BFFEBB22E17E8B0ADF300FA77598371A8D08EE6102C89E41617CFFF9D753868EEA16D77C4297BE8B9F7B2B71FD6EEEC10B56169FE09602D68D29794E9600660C89D90DE15E8F780172DD7DF2AEF45807B207527F07EE8DF95EF7DC46113EF6E9A44937365D1142C3CFA156413C025D34BFFBB38ACD2CB18925F6F12B0995D95E589A79E8F2AE256B670C1FDFB355FB4E712DEE9B327DEB4FEB8AB2F21C7A13110C37C439FE1F8F4FF05F1609F77F873C1E8FCD6673D8EC678F1C5FF9CDB7B3A7CD1CDCBEDBD82E7DE63DFC4CC2C63D3A16B79692EBE68883D90A60BA95C675308B6C749E2939F706708F580CAEE7FB0DE10E6EC47770FD7363F91EFB5CD2A41B9BAE08E3B1A393AEF01D75A161CA5C2C99852634D005F66C55505803F9BD9A2528BAC4FE61FE978FDE794FFFF65D0775E9F9E4BD0FAE5FBE8A9791137679AFF49F690077F07F5924DC6F69417277B95C407648F135353552A1E8B5679E9F3571EAEDDDFB4CEB377CC1532F5F58BFB33439C3952373674A6C4C3E303D942507C4C38C85CE05D037BCA05A77593572A37A3C68BB972A0663C4FB52A5E0D8D32FC68DF81E857B94EF24DC49FF51D31544A2844890A069B29448918529F20055EE67282CC9023B5DEA4A573932D5668E429726056BB2A4F46317567FFDDD9CBB660DEBD107F83EFBEE597B366FAF50A849B8371609F79BAC30116A607C7022F9FDA8B3A3D968AAAEACD2D56ACD7A834C24A65E4ABCBDE780DECDDA0E6CD1F9F969F71DFF715B0523CF9EAB80E4EECD57EBE90566069F282A2784D5D674818959E42F50D998023B03D949AFB30BDF682982F53AB247B0FEFBC91DFB6AB8FB53AEB4ED340CEFB1CF224DBAB121B927881BC33D4057182F1478594A22BFDA97555A9BC22FBD98539DCC3570A4651CDEE5BD47BE7E6BFEF4E163BAC6B51ADC35FEAB799F6633D31AC21D8467A367D37F5324DC6FA600E83EC2E78918667C44C04F0482E1402814B059AC1683D166B0045CBEA0C32BCCE17EFBD9D71307DE7E57FF31F7F61BFDFEAC674EACDA2ABDCCA96416EA32246E4159059D5BC5E2D6B205DA0CA13E536ACC919A7214606B8ECA965D6CCB52DB384A0B4B66A6898DA9025322DF992272258B3CC9627F8A249822275214448A92A028C294BA4673CCEE68548F3D2D4993BEA6A33F78FE834E85634F891CB907773872CBA70055E9A721FBE84A0F5DE966D4D9CE929B3365FA3C19F73C63CDC78BEE1D7147FF365DFB74E839A4F7805279A942A654294A6A6A6A5D4E5F3018F67A8256ABBDEE4CFB4F8A84FBCD14C01DB0EE22BCEE7ABEFB091F863B6476AFDD1976F97D666799487972EFE157E73C3FA47DAF3923A7BF37E389CD1F2C66ED3AAD4ECEA964F16BD285BA5CB93E4F61C8579AB9C596A252BBA8C221AE744AAA9CE26AB7B8D62BD279055A2F5FE32EA872E6943B334ADC69C50EAACC4D91F952E5811479383902F764059C69109D48B893FEF38E61F7EF3AC2F4A8A3706FC8F7A8DD0CB9354D0A7C975DE2FCB662CBFC275EBD7FCC9D237B0DE9D5A1C7A1DD87122F24F1B942ADC6E076FA02BE30D8EFADBBF7E47F5324DC6FA630DC31D92370BF92DC2D263311081141A25A5906647FEFC537260C1CD523AEDD87B35FFCF5B3159C7DE7150999E5B4C2EA3401B894C97589ABDCB21AAFA2D6AFD2058B0DA15213385C62264A6D44898328B6134A2B2133874506A2484714D6BA582A0F5305270C9C3FC15445285501880FA600D649B893FE7F3886DDBFEB0658C764BF26DC21BF839D4CB98D2531A54B2AA805B947934EADDBF5FDBB0BEF1F37BD53B3768FDFFFD8A2858B12CE2796955402DC837EB2BB0C09F79B2A80BB9BF04792BBD70B0EFB216D0483FE50D08F7E511D08B9F456CAF9C40F5E7E6B54BFA17DDBF5B8BD4BFF9D8B56E71C49D472C488E9B482EA0C91264BA26614F894DA28D689724BB8D24A5458894A3B51E5222ADCC8654E426D27E41642622284065F56B93FA32C905E1A641507E82A3F45E14F96F992C524DC49FFBF1CC3EEDF33D4146F8075CC74DC26E3642A1D2CB99529B6B0C5C077438604324DD2EE13EF3FF14ABF763DBAB5EC74EF9499AB96AECA6467590D36D4041F22C23EF85777AEFD0745C2FD660AE00E404764871A6484EC8110C03D180A04036EBF596BCC61647EBF70C99461E3E35B75993468F42B0F3E9D793CA98A2374F0CB2AD3052A6A9E26476AE4AAABB2C43E952E10217BB0DC0C640F57DB882A5BB8CA4E54BB42D59E70953B5CE1224A1D61B50DF33DC0AB0D16D48472AA829C323FABD84B53785265AE64110977D2FF2F37C2F78D1D69064446D751A9723F0DD947977B187237430E511D0C4C07DBB1991267BACC93A30E09AA83D25A252D6FCB572B674FBAA74B5CDBA13D07CE7DE4A95F37EC9015C982AE20E1251C663B097752374770E0F988404C834C381822822187C9969F9EBDF6BB1F1F9E3A6B7097BE40F6F92FBDB37FCDF6D234BE364FAE2F505666082B38027DA1CA26AAB0882B02657558276AEC84C641D43A2376115A6F58E70FD7FAC2355E403CCAEFA889C646C8CC84C848F0B4C1DC2A2FA714C522AACC992282138C843BE93FEF46F8BEB1AF87757094E95636B2250D35B83BD9525FA62A945F16E257060455DA4C0975EFE9F59F2FBB6BE884B17D87430C7AE7C5374F1E385E222BB11BEC5603FADDDF7F5624DC6FA6E0C003A663B247E01E42E3C90409224094CB8BF76FDBF5D8CC870774EC35B6CF88F79F79FDE48E433236B73C4B54CCE296A51719B86AC0BA4958669356F9CA8CA1AA485AC758D7BA08BD9BD0B909BD276CF4878CC1B03148E803807802523C447884780742BCC414E2D57AB2CB9D696A2B4D664B15C10916A049C17850D610438E1D33DE53D4B1E736E9FFB81BE1FB0686F400471AFA552A5DEA8BD8C390BA9952070B19500EB6A4494DE9C8460E9A7A380A22BF1CE06E4D93D4D2F9354CBE9A96CFBFC45EF0EC5B4F4C7B60E2C051778F99FAE9BB1F5F3C7EBE5251EE737848B893BA39C270AF273BC476207B08C80EE667E62FFB7CF1889E833AC6B5BA77F4B48D8B7E2CA2E5B84B8D4A56213F315DCEC8B72B6A829516ABAC0A1CAAB107AB6D418D3D54EB207411B21B9043064FC0E4F79B83015330680840840F69507E477CAFF410254E426E090A74DEBC4A1B476D66CACD5411442712EEA4FFBC1B11FC0606B837C43AD81921BB9D8DB01E65BA8123D56520C3BC2B4B4970AB00EE35C9F992538CD2A41C6BBEDAA7D46E5EB8FCC3275F85FC3E327EF0A3D31FD8B0629D9C2BA9EBFCFE5FD5CD84BBCFE773BBD13DFB9D4E27FC190E876B6A6ACACBCB0D0603BE07B4C3E130994C785815BC0E9EC272AD560B33B5B5B530FD57CB1F0C98AD168DB616DEA6DBE97198EDA58A626E66DEE4E1E3FBB5EFD9B379E74726DFBB6BC556199BAF135654E72BB47CB5455AE92D3500CDC3D19C6EF010663F6189D8DAD081B03D1CB213211B11B4860973983085087D90D00501EE41B5352437437E07BE5B338A81EFC1DC0A6F244C35C43A1883FE9AC6AD378D8DDB761A3B9605F58E797A8CD13A2C154C8314096A234A2BBEF210D96A744BF96A7C471D1D9FAEA103A96277AAD041113A68221B4D64A78B6D0CB18D2531B3253AA610986EC9569A7294861C853647AECF535A0A8A3D79C59E1C3520DE962133B045B5CCA24A06AF94C9B509CB13761E7BE5FEA706B58FEF12D7766CBF11EB96FE64D79981EF4089AAAA2A3C069FD56AD5683440187CF6356DDD34B80783412035401C04B0C663DB9ACD66F80EE021F8136680E9F035C0F701EBF8FD7E58018F8C8847498419403F4CFFD5F2783CF0A680EC0E9BDD63775795543093A8FBB7ED1ADE63E0F0EE03EE1A3EE9E3E7DF39B3FD883CADA8965B5295A7D48BCA2DCA1A5F8539AC7542480FEB81EC6EC2E48DC17AD886A78190231C7010411B11B08643967018E06E88C0BDCA13505B834A0BA1B205843A4B66B1E53A70C7108FFE19E32864631CC3F4A8635950EF98A737347A16E0BB1EEEB0E41A7027F97E8BB811D6B163B08E8DE04E1101D901EBE84A295B66E7C8ED190A4B96C25950EAE25778C5356EA9C621A9B649AB1D728D57AEF5092A7DDC724F41A9234F6DCD561833A5B5E9A29A74A1A5A834FB64CACA0FBF9E3D61E6D04E7D0674887FEBE95728E7136B2B350077200C9C6B40159BCD869182CFBEA6AD9B0677F8B801E578D4439846072E878500EEB2B2328140909595959D9D2D1289E0CFC89308CC7410D010A638C8FFAB05059CC3E684CC1EF206ED265B2E277BDDB2D52F3C3AB7478BCED3474CFEF4E50F0FAFDF9B7D81A54A1354662B2B731516A5C6596E40CD2F460F303D6C82CCEE8DC13A38648F4C6D818023EC77127EFBD57087F05E1D0B7773BA2A90530E7007983684661D4363CEE17AE3471B3B4AF318C73C3DEA98A7470D4FF1250B8102784FEAE699CA86EB447735669BA46F821B611D3B06EBD83E8AD84915DA1822070BF581813CEECE55BBF34B5CDCD2B05C4794985077DE2A5BA8CAEAAFB4405515EAA941951E1E0A48345E61958B5F6E2F2CB114A84D794A43BEB23CBD8876F0DC4F1F2F7E64E2CCDE2D3A8FED3BFCC357DFA12553CBCBCBF1B9069CB1DBED000D48547849D3D64D833B847148ACFE481E874F5CA7D301B86B6A6A8E1D3BB67FFFFE0D1B362C59B2E4B3CF3E5BB46811CC1F3C7810D7AA60357C5B222803608ACB867FB53C2EAFCFE327FC61803BC4F693078FBE34E7B9819D7AF769DDFDA5079F3EBA71BF9851589E2D53A70B4B39D2EA7C95B3D4E0D15811D931CD2D3EC21620ECC186580707EBA657C13D6845708F5C5C0D1235DE60B12DA04270F70975A64CF5AD097788EA9EC42230FE1366BC4902D82BBCB5E86AD1BD8DD92CE97FDA8DB08E1D83756C80BB8326B4B1C48E34D498EEC92B86540ED9DC2BAE264ACD44951D75F7D2B9A1921AD23943463761F412350EA2D246945B4225C68052E795695CE22AA7A8B28A23B48B2AF4852AF6D1CB8BDEFC644C8FC1DDE2DA8EEC3B64EDAA35050505F85CC32DC0B861002F69DABA996DEE2693096A4C9595951C0EE7C89123BFFEFAEBA64D9B1E7EF8E17BEFBD77D2A44943860CE9D7AFDFC89123EFBBEFBEE79F7F5EA95402D6A1000804D04F8A01EE3083E7FFD50AF88288ECEE90A1DAC0A1A4FDF0CDB219E3EEEC10D77AE6E8E9CBE62FCE4FE0D864B54661755986AC3243AEE397B92BCD5EAD1DA57560BA2D0034271C41C20515CE2B5807FB1D781AF03B63E15ED72CA3F101DC432A6B14EEA634A53FBBEC56833BEC0000DD9DC047AB319590DCC13013DD60C33591AFDE2CE97FDA8DB08E1D83756C80BB9D21B2B1858E0CA93B57E9E5960404150169B55FA121CA4D448D8D30B808A32B6474068C8E80D945D8BC84C94718BCE83A538D3D5461099618FD2A9D5FA155D3F29D922ABF5A5F96293CB579DF4BB39EE8DFAA5BE7B8D62F3FF712E445A8E803D3214442A6AC3BF1FE03BA9970178944972E5DDABB77EFC2850B81E993274F1E356A54870E1DDAB76FDFBA75EBB8885AB66CD9BB776F580EF4C71757A1F885E7E2261D1CFCFFD50AFB4290D94D1A53162B6BD38F1B5E98F3EC8421630777EABB74DE3727B7FEA6E40801EE067E654596429B5702F318EE61B317E7F43AB87B8828D631D9EB8DE08EDBDC81EC57B5B96B7CA1123B82BBD2E61768CD196A235BE1CB2ABD1EDCFF5747E11BE35816D43BE6E95103C75D9779CE4B5CB41A4B05B11D25F748E37B749B57AD7FF56649FFD36E8475EC18AC63FB2822274B62E7489CD9727781DA5F541E96D68455DA50899EA8B2105A07617213164FD8E206B2076D1EC2E9C79554749149E70AD5F33D586C286572F1C04A9A5C59511267DBE29F1E187D678FE6EDA74D9CF2E5975F32188CEAEA6A9BCDE6F57A71D5FFBFA09B0677F8AC01EB6FBDF5D6ECD9B36FBFFD76007AAB56AD80E93005BE77EDDAB54B972EB010D4BD7B7788F0EFBFFFBE5C2E87E48E333B801EE0DE049A65026EBFD3E29015C9766FDBFDFC9C67C70D193D71E8B88726DF4B3F915C9094A9E2482A7294E599F29A6C955DA0F597D81C152667ADD56774052D5E649B8F705E05F728D97D4E306A96690877D45BA60EEEFE7003B89B38AA1BC33DD060DCF686C68F367694BC318E6541BD639E1E35BC84E974B6E16426301DE66DE7F3ADE7F220BC03DCAFC9F798CD92FEA7DD08EBD83158C706B87B390A5796DC9BAFF6F3CBC2E26A42A9254A0C4405C4762BA17712660F61F586AC9E80D51DB27B097720EC0C861D0174E41B5C418D3D5869413FDF2B3658F9A5867CA59A51509AC6370A4A73CED33E7FF1BD31F18306F71DF8C0030FAC5EBDBAA0A000923BC441804613A8F1FF11DD34B8B358AC0F3EF860C890219D3B776ED1A205847498E9DFBF7FB76EDD060C183072E4C8D1A347C3A37DFBF6EDD3A70FC0FDEEBBEFCECDCDD56AB53A9D0EEA56371FEEB8D50EA631BE966256891AE4B1BBD13003CCACA59F2F993C646CEFD65DEF1C3AE1ED392F69F8A5153972255320A1142A1845D5B96AA7DC14AE72DBCA0C0E8DC5AF7706CC1E70C8EA43C9DD8DE0DE30BCD71BF5964146700F46BA4206221754FD44AD3F5C660BAAAD84CA1281BBA21EEE8898889211B287EA7BCB785345600F25D60186CCCF9005E80A98891AD6C79DE5A3F00D51EB6FE2F17B37E086E7E229B6FD4241D52146E541BAE56CAEE362A1F658BAE6081BF88EE11EE57BF4E9319B25FD4FBB8EE678E6CA3498228D00FDAA29BA9D40B6DA95AFF2F24A03A2CA905C1321BB99A8B68634D6B0DE01B19D8890DD6775051DDEA0DB1F7405E1C00E58BD906F7C5ABBB7D2EC2933FAE059557623AF987F892DA3E705CBCD5ABE7AF3D72BEFBE7D629F2E3D870F1DF6EEDBEFD0A934A7DD11F407DC4E17BE80D7E475D3E05E5454F4FCF3CF03D33B75EA3468D02008EC6DDAB4993469D2983163468C1801597EDCB871303F78F0E09E3D7B429007E243F5AAB8B8189E0BC52FEEDBF40FC8E974070268F8A150206C353BAA2B6BCA4A2ACB4B2BCC3A8BC960B619ED2EABD3EBF041000F4341E30F870241346451C4C170C0EBF7B8BD2EA7CF6575D92C4EA84F06C1D5266DB9AEDAE8B2DA5CCE9037589096BDECB36FA60F1BD72BAEC35DFDC76CFD6265099357C2E016D30B4B984535390A8B48E32EB17A2B1C9E4A5BA43FBBEF8F3B6CC60E44A788EF261FA1F5062BAC44B99D28B3FA44B5FA74492D4364E7C83DD11B33450CA71F2C019B120A2D493C6B6A918326723024AEC85DEAC176A6CC429798291263AAC0985C04B6A4F0ADC97CB41D9AC44F15072962207B982A0A5325044D4A50A4E1AB8DE9ECA7A2FB2313E9C541A6DC7E990BCF0DB114C6F3B9E587E8E22DE7041B4F03E23D894518E888FEB71ADC233D35A17A01758BBA2B042C15ECD89515220518ECB03F4504358FE83ED7D5901AAC766BB90ED67FD4117083D108A30DA791D1C1F0186157A63EBA5CCF2872092A881273B8D81850EBD1C5529D1BFD7AA3BE6B2F8E2CD1FA28362C81E5A84DB2AE5B81DF24AFF25559CCB22A212D879792519A2514D372120F9E1CDD7F58BB662DDA366FF9DC934FA7D3996834317F4029578483E8078358C1F015D79DF64D42370DEE6AB5FAEDB7DF6EDEBC79BB76ED00DC1D3A74E8D8B123007DD8B06190D94180F8E1C387C39F90DCE1D1F8F87848FA0281003FFD1F6B6D77D83D0178A948D2F6798276ABCB657503CDDD368FC7EEF539FD7E5720E80911100500EE01C2EBF604D178A308EE502260078990CD6D373BAD9161C2FCB55683D66674043D4EAF475FAD3D77E8C4AB8FCD1DD9ADDFC8F67D5EB9EBD1B36B761BB315950C7E059D57C9146A735556A9D6536EF7D7B8BD1AA8A8FE6F70471CAF773DE8237F1A3C812A5B08F85E66F58A6B00EE5A96D099A974D1AE601D931D9638E9627332CF9C5A64A109ED6CA90B55A555EE6C35D89E813AC843EA37326546BAD84415C13A56AA109E0595001F4D0C7C0FD180ECC804550C708FE13BA6330EFB449ACA4F975A2F1702DC8311B8971DA489369F8DC21DADD900EEF8B9600C4AC4CA1836FD838657873DAC833B5349B0D5B02466F7B0A3BB8D1FBAA5F9DE08DF377604E5D77004E8B106B8D732050E61055166469746D57A348486CE1DD2D5C11DF08DEBA000F44833E315B863BE8331DF9D5526BFCEE128D195E48A951C7E799E5499C6E59C4F79FEE1276EEF37A84BCBB6B3A6DD75E0975DB5A5151E9B4357A32122706FCCF7BAD3BE49E8A6C1DD6C362F5AB4A873E7CEF89229C4731000BD5FBF7E1322EADFBF3FCC03E521D7B768D1A27DFBF6CF3CF30C954A856FA26E13FF8834357AB3C9EE7107BC9EA0D3E105077CE856EB0E9B1BDB69F78081F511BB2C26B3D3E98C36EA455B605C1EB7D5E98082C21DF49B9D7698C21A76A7239DC25CF2D1E7E37A0F19D0AACB9C3133367CF46DE1718A9B5B5ECB1256B3043569124341894361F057B9425A5F40877F89DA88E037F0D558AF237B04EEC16A7B14EEE817DE6C11201B41B91EEB51B2DBE9620B4560A58B80EC500078734BFC05E5416EA59F57E929AC76E5573A72CB6D9925368ED296A680751C2C293CCB4D9778E990DFC501BA08F80E2668D7857B98A900B887D94A7869CBA50294DCD94AD385BCD20354E1A63300F7EADF98908B614DCCF46B921D8132864DFF94617F02A962D7659EF55C1E4CD1C24872C757267051D4709FA30BF1FEDFBA7C6F84EF1B3B90826EFFD2D87844DF187B187F19DC09B33764744378B7286BB482926AAEB22C5B244DCFDFBA72DDF38F3DD9BF6BCFC13DFBBCFBCAEB49672FD45654053CDE18B88348B8FF650A87C33B76ECB8FDF6DB01DCB89D1D0B12FA1D11C10CE07EFCF8F190DF71B799E9D3A7EFD9B3A7E14F87E12BA99BFBDBA4AD359A8C36BBCD6DB3BA6006831E686D353B2C66074CAD16A7ED8AED7ABDD16AB57A3C1EA85B80BC5E2FCC7B7C680A288719B7D703A007DCFB83811275F1AAC5CBEE9B34BD6B5CCB49F1437E787B61DAC10B55CC227B5E316A2749176B33E4665EB95B6D0E69BC84211836C241FC17C15D7F557207B81BD8624F4E31D03C8AF528D9F18FC26DE867262A5F7E59805F45886A09A98E90E9C31263406CF00BB41E5E8D3BBFDC955D82E23F4701CF7231246EBA18F8EEA78B80EFE0305D0C34BF26DC09B60AE01E64CADDA942607A14EEC5FB5281ECE09AC32C7F8A08381843C92B58BFA97CC47D3401EB579A65180AD861BC57B09FB0CFF027944FB86727CC8331E2F1BBB8B9FB7F5D37C2F78D1DC3F4A863B08EFD57C2DD1E0C1A5C811A1BF0DDA1D66AF8EAAA7C591557969DCCFC69C9F753478DEBDCA2CD846123977DBD58905B4004C3913BE15C23BCD79DF64D42370DEEA0848484471F7DB4434483070F1E3A7468AF88A64C9982E10E82080F0540F3E6CD5BB56A05EB7CF5D55745454575CF27887FE0AA7764FC5DC2ED09E80D9692D24AA5AAB4ACBCBA566B44EDE86E3FC4799F1F0E8AFA7C4E1016AB1DD81D0CA21BAFC314E0EE8EC8EBF6A02B39F55358B9A6AA3AF1FCC507A6CEECDFBE7BDFE61DDF7EE819CAEE93B5196253A65CC3283265C880EFBA4C85855FE12BB6121A1F610CA1E6F2BF0AEE3A77B0C21A2A351325668FA0CA902E31B1C4BEEC62A07914EB51B25B99624786C291A3F614940504D5618996501809353CD782461F8BDCE6292035FA051A77418533B7D899A582A7D899121703F2BBD8C71001DFC141C68DE0EEA74AFC74A92B4560BE988FE16E3C9FABDA935CB4E114C0BDF6681AA010F0D710EEB164BF7970845D82DD803D047CC33CC476F8134578960A39F2935A7814C8EEB858080500AC0686F200107F15DF1B6DF926BB11BE6F6CE0B82FF51AC677E188B1FB2F84BBD5EFD3DA81ECC07777A941272CAD29546885EA6A81F2DC8123AF3FF96CDF4EDD7AB4E9F0CCC38F9D3F72C2A6359070FF7BC5E3F1162E5CD8B76FDFD6AD5B0F1C3810127AF7EEDD070D1A3479F2E4499326E1203F6EDCB811234600FD3B47F4D4534F5DBA74098F3003FA075ADE81D81E6FB0AA5A9B9D5370EAF4F95DBBF7FFBA73EFEEFD87C472954C55525C5E55550BD8B7DBDD3E6F108DE768B4DA00EE21A899E0A783220790C7E586D220E8F5F91C2EBFD30DD34C56DAE2059FF769D7B54F8B8E0F8E9AB2FBBB35A54CAE835BAA4F1357520A8D1C6914EE5EB505C3FD2F4CEEA15AA7AFD4E4571B420ABD9B5BAE67898C0CA12F538D998EB11E25BB99250664BB0BCB7C455501492DA13222AC97DB880A3B51ED43034C96BB422AAB5FA27317553BF34BECD92A780A847D0713F2BBD8C31401DFC137823B4BE9A340C64770B75C2A405D6E580ADD992CC5AE44FEFA93C24D67B4C7D2D16AF50D2080C2A86F3AD991E1D5D96AC4F1FADD008EEB4F6440480782C30EE3B709288725C07798C20A98EFF0E815BE37DCE6ADE046F8BE8161FF81E35E0AA279CC1450EEA721A0379CFE85700F19DDDE5A14DBBD956680BB455E6D1096D60A545A71711E85B5E9FB550F4EB9AB77DB4E93868F5AB5E8BB1C461AE10F45F94EC2FD2F167C9A555555DBB66D1B33660C0473403CC0BD6BD7AEA3478F1E3F7E3C307D6444F0274EF4B0428B162D20C86FDFBEBDA4A404FF80F81F48EE6E8FAFAA569B9E95BDEDD79DEF7C30EF8147664F9B71F7941933167CF9E5178B177FB762C59A8D1B7FD9BBF7B713274E5EBA782E39492093A9CBCA6B0D469BCBED451D6AE1E8419757BD0E4FD0ED27BCA1A0C3EBB7B8CC55BA23BFEEBF67FCD42E712DC7F618F8F9F36F671CBD8486C8C890D45079C63489812DD6B1455A8ECC5C58E6569A42D51E421F081980D7FF1BDC1B621D1BC33D5065F3161BBC722DC01A70ACA31519A9451E8EB221DC31D921D1C3CE00D93D3C3490935FA10B159B88B2C83DFCAA1D843648D4FA892A4FB8D4E153181C826A5B4189355B09CFB2B0257688FC4CB19B29C27C0F5C1FEE61A6C29B2A82C0EE4E15DA12B841A63CC094D79ECA90FD7AB970FD89A2CD676A4F70827419940110F061CD685FC92B4398DDD42188515A672A71428779A0B6EE3847F1CB65F98E4BA57B53A16402A0E3900E28C70D3860CCF7ABC27BA32DDF643722F80D0CFB0F1CF75011CD63A6F8B67931532753AEF98BE0EED73970B38CABCC803A4756981D4A4D2D4F519A2B2CCEE5334F5DFCE6DDF9E3FA0D19D2ADD78B739EDAB6667D63B863D59DF64D42370DEE9EC86888274E9C98366D5AB366CDE2E3E3870D1BD6A54B17DC1B12231EB7C90C1E3C18E23C203E2E2E0EB2FC8A152B844221EEA9FA77C31D0A10B73F5056559D984A59F2FDB27BEE7FA05BEFDE712D5BC635BF2DAE658B66EDDB75EC153F60E4ED13EE9A7EEFA3B31F7BE1B9675E7FF5229542CFCC28108BD415151AC8F456BBDBEDF57B036E9B8B7007086F386CF3FA8C8E5A45D9C6A53FF66ED1B1675C9BFB464CDAF2C532794AA6315B5E9A94539594EFCB2F3332455A96B0365D6A2A28F5C88DC12A7758E70FEABD7F15DCFD9556B74AE7916A02C21A478E5A47E51B53F99E344543B283218003A6A1320164F708AA7C128D5FA90F959AC3953634F407C05D1F22B40134524D99C3AB34D885D5968262739602CA03803B1A36E48FC11DE8EC491102DC3D14913D9117622900EED527D2A5BF5CFA2370C764BF89700752E3008EC16D3A9DADDE9594F7D361FAA21DD92B0F4AB75DA83D9AE6BCC48D46789887D520BF63B84797C76CF6E6BB11C16FE028DC1B1B68DED87F2DDCD101AF7301DCBDE526D888BFDC04709731736BF8325566E1CE95EB668D9DDCB76DE77BC6DFF1D9BBF3085FE89A7CAF3BF39B846E66B30CA8B8B878C1820510D801EE806FA0FCC0810381F2A322C25D2181EFC0FAE9D3A777ECD8B15DBB762FBCF0427272B2C9640A06D17752B7A1BF47007793CD6E75BB599999CFBDF24AB3D6AD81E9C3C68DBD6FCE632D3A756CDEB9E36D9D3A34EBD83EAE63BBB8F66D90DBB5BEAD4B978EFDFA0D9D30E19ED98FBEF1C187ABD6AE3F71F22C839E663739EC5AABA9526F28AD9566F1372E5DFDC8E47B26F41E3EAC6D8F4D0B97AAA8399A0C818655A4630A80A78E0C85892932A54BAD39C5F6A22AAFC214AC70A25BE519FD11407BFF17FB82464FC0E08629867B50EF0E6A1C2134FA92D52FADB5E6A8CC10B1D9521B4D644AE2BA995217430270B7D251A7462343686008A10E01708795C390D9CB6D4076F474207BAD8B3084085D00857770B53B5862718951783772D03D74EC6C89932589C2DD4F17C5E0000C44408995ADF251C410D811D61932225D6D4FE20BB69F07B267AE3A58BC2F15980E2BD82F7381EC0D691EE35836FD53860C0E68064603AC01F190D381ECBB9FFBFCE89B4B2F7EBC16F85E7180060FE1761B2800603E6AF8130C8807C76CF61F33FE161A3BE6CBBAB1617D4036BEAB35D8CB50F998EA00BB249856EAA4C85C54B99BA680E5B0D0CF2A86E51E8EDA982133738BBD8ADA7099197572D7405DD085C6C5BB0EDCBD362FD86FF5066CBEA0CD17853B61F606F44E145C742E48EEC16A5BA0C25C952FA9CC1155E60A747C79F6B9E40F9E7AB14F8BF650571ED6A3CFC695AB85798561AFDF6EB668AA6BD065B0FA11C59B8C6E66B30C4C6B6A6ABEFFFEFBBE7DFB76EBD60DE279EBD6AD610A4C079A8300EB23468C183972E4D888609DCE9D3B3FFCF0C3BFFDF69B4EA783A7FFDDBF3403B83B3C5E803B85C57AEAA517DB75EFD67BE890675E7DE5AB1F96BD3AEFFD67DF7973F68BCF4D7BE4C111D3EEE83172589B7EBD9AC5778DEBD02EAE73C7663DBAB5EBDBA7F7F0E163EE987AEF838F3CF5F473F3DEFFE8D3799F7E31EFB3659F2E5EF2E117CFCC786474F74163BB0E9C7BC7AC936B7FA94EE71B33C5C634B19523454DD569320B430470B465173BF957E04E18FC70F836C2F78D1D0BF7703DDCC325668FA8DA92A540C549A4F3A22585EF65CA1AF21D953191E4EEE55702DC8912335181327B18AC71423E4270370451788FC03D546A6D0CF7689B7BE0F7E00E5807B8FBE9A8C3BB2D91278CC03DEBC74325FB2951B8A332802E8B617AD431CCFAC78CE18E1B64600AC13C7FF59128DC337FD85FB68F02511DD64404AC873BC67A94EC4D00EE10D29D343970DC45471CF73055C0717F5A892355EAA022BE479703E2DDE92A80BB8557520777A80B02DCE1A0AABF3FC11F877BD8E46908F7508D1DE05E9D27D1E4492AB3F87AAE4C4CE5FCBC70C9FDA3278FE8D67B50A71E5FCEFB382D991AB0A30B6066BD01E01E0E87F1B8554D46370DEEF87374381CBB76ED027077EAD4A94F9F3EC0EEC1830703D361C9B871E380EF90DFC78C19337EFC782800FAF7EFDFAB572F7868F9F2E5A5A5A5F0749BCD16D9D8DF2580BB371CAEB5D88E9DBB30EBB1399DFBF49DFED0433F6DDD7A99CDCE928869DC82334CFA2FA74E2CDBB6E5C365DFBDF4E9C74FCE7B77E8CCBB06DC39A5E7D8D16D07F48FEBDC39AE4DDBB8566D9BB76A3F74C8C889A326DD35EECE87A6CC7A74CA7D93FA8E1CD1B1DFDD03C76DFE6C69C1C96473B6D49421766429BC592A749B31A6E40670474342FE3163B8FB4D1E9FD10DD3867087F41D50199CBC7274333326FAD1A99B2E71508401A61CF8EE6144F8CE944049836F787605EE95F6ABE06E0C37847BB8C40A058623BF04553BD2A40E14DB2538B3E30E91313800D741A41EEE10DE7D344998ADB426708BB69EE56E380911B87C3F158809B9D89DC08719B47E233CDD5C03A961AF60DF80D44079E078C19AA37B5FF8F2D85BDF9F9FBF3AFDFB3DCA5F13F0A809F028403C06EBF0D6B06336FB8F197F0B8D1DF365DDD850E84242B7D164C0719802C79D4CA597A5F6A415DB29522B15F1DD4E477C7730146E86D2CE9247E14E945B10DC6B230795D9F727E16E44038A3584BBBE405E915EA8CB97680B24B443A796BEF3F183E3A7F66DDDF1F199F71FDAB1CB58A521FC418FC3E971B951DF87A63514F04D837BB40644A1501E79E411C07AF7EEDD7BF6EC89E10E649F306102701CF80E5398EFD8B1E3B061C3060C1800EBBCF2CA2B050505F04D98FEE63B31C157ED0B138ACAAAB5DBB60F9D30A155B76E8F3CFFFCE18B1725D5551A9FA7C2E550998D453595592A3955C8BB9C9F7D2E87F3C3C13D4B766DFF64DD4F2F7FB9F091D75F9D3E67CEB4FB1F9C7ACF7D5DBBF51AD867F0905E8387F71834A2EB803ECDBB0C6E13FFC088299CDF2E55B1B8962CA99E5DE4CA52FAB3D4C0591B4D04A919E068CF2E76F1AB7C7F1DDC51F08FC03D586EF14835D61C95912932D385F0A200742F4D026CF547868B89DEAAD8962E3373641E6EB95FAC41CD32F5C99DA881F3D073A55946E3232A9D41B5D925A8B4E5AA23B15D8A623B4382B10E46BF636A44843A88B094DE542800A4C0772F15B5CF982F15F0369FE66D3C55B8F658D521066EF4C00119ADDF084F37D718EE18DC44649862D8ED7D2F7E75FCED65E73EFC89B1F817D1E6B3BAE31C588E4BA918A6C342EC98CDFE63C6DF4263C77C593736C01D123A401C0C70078E03DCDD6CB537BD04FE6C6878086C66A23BA39AB9C51EB9A62EB903DCF59E3F01F7101CE13A4743B8072B2D35F95253A1B28C91ABC9163825651599BC0B3BF6BFFDD8DCDE2DDB8F8CEFBFE8E3CF04D9F9019727EC0F4072C7DD979B926E26DC71A38A5C2E9F376F5E7C7C3C8477980E1A3468C4881118EE3085D88EE1DEBE7D7B80FEC08103DBB4693373E6CCB367CF02D9FF01B87B08A2502AFB6CC9B7ED7BF58A6BDBF6F1575E3943A3AA4C86C2B292C28AD2C2EA726E6D6591BEA6C8582B34EB84567DA6A63CADBA84AA965EE4E51D65D2F65DBEB8EFECD983A7CECC79F2D9C71E7972CAB8A9237A0F1D153FF48EFEA39FBBFBB19FE62F2AA51598B22440F65A6A818B23F76628F1CD24FF56B8876A1C8162A35D5061E048F574818526849CEE8BDC843E1019F00B5DB4A445B23CE477B6D49A2E73E797FA05D561A58128B510E5D6BA3677AD1BC80E3B16AAF6A0FB6E97D97C32BDBDB0D49C298FC476281E20B64B30D6EB47208825421D44584A7C4115F6C19D2A04C41B2FE471379DE26F3ACD5F7FB2E6300BC31DA22EA013E663D874D38D770CDE08EC24FC09ACE7FD7CE2C0CBDF9C7867F9D9793FA67EB905827CC5019AFD4201301DF33DCA74783B5137DCE63F69FC2D3476CC97756323B85365561AB29DA17000D9D38ABD9C525F46998BAD76B254B00496DBE87258C142951AE9E2DA74B1B140E59256874A4D756DEE7FAA592606EE61882F95166D81CC5CA028A3E554A7735D9232BBA8847F99BEFCFD4F47F7E8D7A75587B90FCC3EB6E780A6BC920804FDDEA6307E788C6E1ADC9D4E276E54B15AAD6BD7AE1D3E7C78BB76EDBA76EDDAAF5FBFA1438702D331D9478D1A05E11DE621B0C33AF028C01D96AF59B3462291FCDDC38761B867F18BDE5EB0A045972E711D3A3CF7DEBBE7D84CB941975F569C5751525053CED5550B4C5A91CD20759AC56E0BD765E2B9CD7CB7996BD317EA6B0AAB2BF89515E28A4A0A337DFFBEC3EFBEF1FEF4B1D3A68F983CF79EC77EFCF43BD691CBD5690223470464D7A4E4B9D3E5EE34998D22F0B2E508F1ECBF11EE1E85D69CAFAE650AF4B422284B20A70355E1E404F4E0E60220AC2B3572E76206EAF7827EC1C4AB08C8B441B531546A86E08F3ACCD43883556E7F853350EEF097D8FC4AA3535863C956EA984280BB93298DC47609263B4189B81111EA38C25400DC21B303DF5D2902981ACEE7166C40FD64041B4F6B8FA5C33A188844E44E1D316CBAE9C67007A3F4CD54C2C758B4E1D4A157179F7CF787D3EFAF4CF8747DE60FFB553B13CD6772604DD8FF864CAFFB0480A437AFAB7E741F621CF365DDD870FCB8194A20381868EE492F01AC07B22A423955C1EC4A98813F01F7F028F0DD4C91E8A9C22A66913647661755A0AE3265E630BEEDBBC1FDBFC23D6840834412064F58EBC4700F555931DC6B98059A749E95ABB0F0956A56EE811F373E73F70303DA759934E4F685EFCFCF61A5FB9D6EE07BD30BEF370DEE8140405F7F43D4A3478FDE71C71D406DE07BAF5EBD20BC8F1C3912931DD23AEEED3E6CD8B0C18307E3800FF3EFBFFF3E9D4EFFBB0B5B80BB331866E7E5BF3E7F7E9B1E3D3AF4EDFBEE975F24E7662B8CFA3297BDD86553B9AC72A745E6304B1C26B1DDC8771838C6AA0C8B36C7A6CFB3E8F3759ABC9A2A5E6595A8A23A87273E74E8E48BCFBC3AACCFF051BD47CC99FAD0B2798B92F79CAA62F27591D86EA0F37C992A274B02700F674135F62AB887CAFF62B83B24D5BA2C59358D67A00B80C25EA60CC776CF653ED87599E748E03992F8B694220B4560A60BED190A5741A94F541350EA032A83AFC4087C87FCEE2DB3BB4BAC6EB5D9A530BA24B5B6C27243BA4493CA859D7733A528B6D3D090907564BF21DCDDC9023CAC8D33B908A6BAB3D9793F1F03B88B369FD59FC8807570D4251A8DB6782B18688E6670AD82A5825D8532E9B7D79600DC4FBDB7E2E2C76BD9DFED926EBB006F24DA8053F7C631D3A3BE7AB3FF98A33B13E3982FEBC606B87BD28A5DE9C56E4E8927A3D497551ECCAD0AE7D71085B5044F07D3505E352C84156C4C859926D5D184E5346E4DA6D85254EA51D4068A0D810A73B0DA16D43AFE12B8EB0AE5967C85315368C81669B304951C6E797A21F3C8D91F177C3DA1DF907E1DBADE3765FAD1BD07EC46339CEA2E87D361B3D79DF94D42370DEE208D4683AF60242626CE9C39B375EBD62D5BB684843E60C08011234600D901EB90D67187990991A1C4BA75EB062B40B47FE69967CE9E3D8BB7F3F70976CEE6F13032B35F9FF761C73E7D7ADF7EFBA72B96338A784A8BB1C46D07B24BED269145CF33D6E66BAB7235151C4D19CB58CDB6D672AC5A8EB126ADAA8CA556A6C9E55962D9B964DA860D3B9E7EECB949C3273D3AEDA12F5FFBE4E8867D9294DC4A5AA18EC5D7D3F80E96249453E262889D290222AF128DACCB923AB38A3DBC2ABFDC102AB7A346EDFF11EEC8265FC8E009EADD70DCA3E71A7D44AD9BA872D80515FA74494D4AA1998A2A0A01A6DC1F1972DD79A110ECB8C8B35D2AB426F02D493C538AC04429B2A5299CB9C57E7E4D50AA0DCA0C419521ACB61065F680CA02658F576AF089F5EEA26A7B4E898121D424E64381017087D80E70BF3AB94B23BE42040C9110430E70F7504418EE30A33B9B0B70176C392BDE72CE703213D601626274DEBA706728D0BEB1D5500809379D39FCFAB74076E0FBF9F9AB71B33B54413CF5F783C5FE6BB08E47C9FF23D37A47FB178171F75330BEDCD2D07839501BDC70B7B1A35F1F7680AEF0714A01EBEEAC324F76B92FBFCA575813E46B43453A426C228486305F0B0B9D192516563DDC530B6AD285666EB15B5603E1DD5766F4575A02B5768C6C803BE01BF31D3B00588F18C88EE10E86D5BC0627BAFDA411C11DF573475D06ACFA02A53D5FEEC895D9F3641A5661716A66457AA128997D7ACBEE7B474DEC1AD76A687CDF4DABD618355A04779BDDA8BF326E5513D04D83BBCBE58AF675E1F3F96BD6ACB9FFFEFB219577EDDA15F799193F7E3C301D103F69D2A471E3C6418407BE0F19320456808CDFBD7BF76FBFFD169E8BC711834DC106BD5E2FD406A2713E140AC1BC27229FCF07752E284B743A9DD96C76BBD1C571BC1A08D6842DA8D56AA80DB0582CA3D18897C31AE0956BD70E1C797BCBCE9D864E9EB06EDFAE62BB05C85E505DC137D4CA1C96E280BB3C14C02E26020CA3E64CA9EC42B932D76D15FADD8506BD406FD0788329CCACE7E6BEDEB659A76ECDBA3E7BF79317769CB00A6A08A5599F2636B350D3873D32A88B27329C3A00CE96C8B35385CE74391ACE45528B5ABA6B3C84C1EBD73AFD7A1776C0E0C6C69D1D1B1B981ED6BA886A47B0C21A40BF133179E55A6751852D575D4DE15AD81240301AA23DB9084E5D785DDBF9FC9AA31CCDB18C92034CD9EE64CDA99C10A7249C59017C872AB69BA38E9CB4A5DEBC4A6F61259CB77EAEC6955D869C590A672C5A215DE549534069E161C9506D80290D326521A624CC928209A61453BE6E6C7730BD8E6E5069203825EE14B1F942A19F26F7A44A8A0F32B91BCFF0379DAE384043AD31911F0AA1E4CE56BBEB47E6BA09463B8C1CA641F496466E4252676F52512055E44F11FA9205302DDE9D74EABD1F4EBCB37CFF4B5FA72DDD9DBFFA08E47708EF444619EE13F9D7B84131F9470C08C6A48EA21C758E62C98CC93C5484B324EE0CA52FAF34C4AD0CF3AB098186E0D710DC6A22BF92C82E0D4706648672D795840E188C7BBC29BC352F53A14DE0EBA9521D555A43939873CA896227511D242A7D444D90A80911157E426E7317D458D38A2D2C9595AD34B0A51A46510DA3C890A3F0C86AD1851C83178D47AD73C1511DB4F84290CA2DBE80D90B5314E7CDF5B6F883567FC0E6F7D99183AE10E1061004FD1A7BA00A5D10F22BF5963C9589CD37B3B960531A579FCEADE570AB33B99559DCF71F9F3BBEF780CE71B73D347DC6C51327032E17110ED55457E213BF69E8A6C11D686BB7DB716F77A954FAEBAFBF3EF5D45380EC2E5DBA74E8D001C2FBD8B16301E898E963C68C193870E0E8D1A301FA10DEDBB66DDBBE7DFB77DE79A7ACAC0C5F53753A9D91ADA2918401F15170070201F8B36EE82EAF377AE726586EB55A2B2A2AC462714E4E4E5A5ADAD2A54B3FFFFCF3975F7EF9F5D75F5FBB76EDE5CB978B8A8AA0A8800DFDF0E3AA01C386B5E8D471F894491B0FED2B75DA8A3DF67C4D25DFA49539EDC57E6F592850110E5684C2254498A2AD3C5D2E3F5B2263E8ABF36CA67C833EBFAA9A5F5EBD65E7C17BEE7EA47D5CA7DB7B0CFFE4D90FD847521CA25AAF50636249D1185B91DF8502D901EB0032E0AC3391EF4A15BA009179A54151A49B4A15BA8019D25D457674025CDF28AD6B5CA8F322940D2566426584DCEDE555B8B2D5060A1F360E67355414DCA94208CEF0BAD67379A5FB99F25DA9A25F12157BA9B567F3D10F4F184A6B8AD8C140DDD71C4CA593A5C2F56E003ACA6869C5501307A34E112CA587A9C03D29618AE11E60C9824C093814E17B3DDC23C3FF36803BD41B88F46260BAF512CF4F53DA1384F23D94C20DA7F91BCFFEABE17EFAFD95FB5EFC8ABE680777DDF1D42FB7146D3805D11E35D0C76CF64FBB11BE6FEC46388E1C036C1990DDC41459D365E8E20AB73C20A80E896B0989160DFF89105F1DCA2F0F6416FB5872384AF1156FCC77BC9DBA4D3115FA248189A1D033151A86CC9C57112A71129A60B0CA4BD4046086A8F487153657418D8503E15D6567295187195A9186C6D767CA5CE26A344CA916D53231DC81E000F770A40B6F04E801C20495D72B7007AC7B1D7EB7C3EF7705C31E226C0BF86A6CE82E3495F6A05C67C95198D97C1B936B6521BE1BD2B83A0E5793C1ADCAE2FE387FE1FDA32702DCEFB87DD4EECD5B8C55D584DF6F351A509A6B2ABA99CD3240641CA8CBCBCB2F5EBC386FDEBC41830675ECD8B175EBD6F8A6D8C32202B24384EFD1A3C788112320B9C7C7C703FD9B376F7ECF3DF71C3D7A14F80B5B0052E36D42E876381CB059D838CEF28D2F92C0F2E2E26248E8070E1C58B972E582050BA09C8042058A0D786910BCDC6BAFBD76ECD83188F9FE40E8DB65CB7B0F1C08701F3DE3AEED278E95FB5C6AB7ADA0B6AAC8AC93BB1CC5415F19112C0F83C3C544F852B90AE07E42213CA310D1ABCA726B350CB1F43485F9E2ABEF0DE83BA25BAB1E8FDD397BFBB71B15549E47A2376429A370C7B13D06EEE89A644EB1BFA80A8ED47089198DE30807BD1E457270C8E0B9B111DC6B9C4405FABD52486D0C2B0D70C67A0BCBDDD96A0B4304113B90A6C42F0A75737F8AC8743A5BB133356FDDA9FC0D672A8E722C8942B03949087C37A78A9129E8A64B50A1065BE83230BA7A86B9CF50386952301E54129FF000F74878477007DF00EE9E1421EAEA4E953993849E5499F6546ED1B64B05EB4FFD5BE01E84FA565211303D0AF7923DC9A7DF5F71E1A3357B5FF83269E146C03A67D9DEBC9F0EC3878CDE72CC66FFB41BE1FBC68E49EE51B8A37184D2A48E4C251EF813615DA647637FC254AA03C4877955C19C521F47859E0247697D8B4D0CDC51677676B185ADD6B114D6BCCA304AEE81508587A8F211D57EA2DC1B965921B9DBD24BEC2CD47FC6C694E96945B5149E8E2D7270CB022A74C33CA86EC2711EAAEB331340533C836E155997DC01FA38B663B8C334EC0C4119E0A9B2F84B4D9066FC628D39536665096C4CBE9505F99D0F295E9FCEAFE5F0AB33F9977E3DF8F66373E39BB71DD0A9FB571F7EC2CBCAF5DA9D41AF8F84FB5F23DC6002FC35180C050505AB56AD9A34691244720037447840F9D0A14381E6805A9807F8428A8799FEFDFBC3A371717130F3C1071F68341A48E55AAD16A772C0315408601E123D9EC1AF15159D4E3F7BF6ECE6CD9B81E98F3FFEF8C48913A196002507BC289419AD5AB5822DB76BD76EC68C19870E1D822FDAE2702EFCE69BAE7DFBB4EAD665EAC30F1D4CB85415F44A6CC6427D4D91452FF738D5613F823B112A2310DC4F2BC5A74BA4878585FB7233CE898A98C5EA930CF60F1BB70F1C3AB655F34E237ADDFEF55B9FD37F4B340061C5BA4A2A1F924BC3369928DCA1E68BE10ED5647761995758ED936B3D6A7DDD71AF7385F56E30C2F70DACF78423BF440D28F5503C0424B57E41B53BBFD495A5B23325FE0C75305DE5A345EE6FC75078138AB4C7D265BF2467AC3A0270375DE405D825E6048131A1289C5901E11DF3DD14B1912236A48A8C2922DCA919DB4E11DB5245F65401D84797A2BE9511B80718E2BAF00E7CBF0EDCE1FD420113A02BBC14A93349ACDA4BCB5E7BE25F94DC01EE9E447E14EE10E101EE673E5879F1E3B5075EFE06A6FCF5270BD71ECB58BEAF644F0A1A842066B37FDA8DF07D6337843B18C31DEA70C0771747E1CD2D09722B515A971B089599505BD0C0CE4A84F8B050132CACF06715FBD214A86F5523B847F88E7EB5E4492F73A69598984A7B6E25A17210153EC8EF28C297BA09B53324327972AA6C69C57686CAC5523918A8D2A04BE1427EB7642B3DA2EA40B111420C6A4E84031838DE10EEB63AB8A3B69AFAD88EEDB17A43B600D4655D65469F4A0F95542FBFD2C016D998023B03C27B2CDC8BD979AB3F5B34B247DF4E712DE6DCFBC0F1BD0775E55575EDB04D453713EE405E803BE468A0706565E5C1830767CF9E0D7007BC76EEDC190F2C837FD304F3C05FFC9B265802586FD9B2254630A47ED80E0476D84E2814B2582C8140A0615A87200F1BE7F17880F54B972EBDF0C20BC0F4BBEEBA0BCA09282420A7376BD60C5E1177D1C16DFAB06598DFB871638808576A6ADFFBE8A30E3DE23BF6E9F3F00BCF9F496356870385DAEA027D2DDF66927ADCAA70B084400D326025113A21E11F970B0E727376A6310E67659CCACEDE70F0C85B1F7F7E5BCB4E6D6EEBF4D8F4470FADDB2BA572ED428D83575D9C98F73B70A78B9DE97257B6DA5950EA2CAAB00B2B896A47A8C611D638D10F446B5DBF638D0B4E15BF42E715D778045570B84339E1CC52D9D2D1C91CAC87BB9F8A7EF3E9385F50BE9F2ADE9198F1D35148CDAE54299159694D1201DF89AC4AFC9B436CE0B8852AAD4BF1A962E03EB61D91FD6AB8D3250186340870678881EC04E3BA70879A0A1A3186A50E422DE102AF70C359FAF7FB509BFBBF04EE40F318B897EE4D01B89F9DF7E389779603DCF3571F116E3A03E11DA6B1DBFCFFB811BE6F6CF8A21BB6CC44E1EE4E57783255BEBC52D4D42EC6E3F55B88121B1AFEB3D402AC0C4BB47E5E25D0DFC351C25330CD63F80E7047830D702ADC69A566807B56392181E73A83328B4F6C0C4ACC40763F57EBCC28B3D1954E9A126A842E3AEAFB6B48E2EA53D160A88EFC12B7A4C6ABD4C1718EF86E443D02EA9A6530DC230D35D1D6F628DCDD4657C0EC0DD43A5C2A9D47561B946A5D05A57A1A60BD0EEE38BC1BD2F8BA740477A7ACFCF496DD8F4DB9BB47F3B6E3060C5DF2E917FCEC3C74734C12EEFF7FE11670BFDFEF8CC866B3252727BFF1C61B1D3B7604D4C214E00B02DA461ADE6F877C7DC71D778C193306280C0B6105E03B44FBC2C242DCB00E02B843690164C70DF190E84B4A4A180CC68E1D3B3EFAE8A3471F7D74EAD4A95003E8D4A91384742038142430037FC2C25191710E60CB508AE0BBFABDF6DA6B99D95942A9EC8537DF68DBBD47CF61C35E983F2FB5A810E0CE2A96E7196A793693C4EB5610415504EB6A22242782C744DCDF040507F2B3F666B0F731199BCF9C5DB07CD59CE75E6DD1A2D3E0DE23BE7EF7CBCCB3AC0A8E4C97536CC8549724E4591952DCE00E7007B203D601646077B200C31D8D46C091DBB294E8679F05C5A88D05C278C4E8177DE06A07329E8F71A5DD23D5B80495F6C2527B5EB13D570DDB81DAB7998EEA04018E2AC852A00E2AA8A558643A99A5F8E5327FF385828D6795FB68CE144930AD14FDE03049E485904557A05F93D3E4E8678791291881BE9EECB6540990DD41113B284230BA816A04EE600C7730BA13D3F5E10EC421D8C521A64A7B2A97B5EC40C257DB8BB69CFFB7C01D98EE4EE0E1069928DCCFCE5B75F4CDA5899F6D00A72DDD2DDA7C367BE5C1823547A35D6BFE0237C2F78D8DE11EE57B84C888EF6EB61CC33DC4AB42709763B85BD13871659690DA1890697D45559EDC12A84AC2FAF0AC8670C7F633142176499853E961975AA87288E741BE9E109BBD3CAD2DA7C2955FEDC9AF7167554066B7A4CA1CA9722F4DE1A5C9200A989379C077035D60E6C8ACF9C5567E19516E45BF8286801269600C1B51A7DE86648F5E4A05C3BC536B0FE85CFE4AAB43AE710BAB02C21A8844DAE4023B43E064F0A3E11DC35D93C1F7C82B334E277CFDC607E3FB0EEEDBBECB330F3D7AE9F869AFDD49C2FD2F90D96CC6DD5A2059437207346767672F5CB810323B863B6467DCEC8E6700F477DE7927CCF7E9D30798DEB367CF366DDAF4EDDB17F2BE3ED2432672D1D40DC9BDA6A686C5621D3E7CF8975F7EF9FEFBEFA1C0B8F7DE7B717970DB6DB7C1C69B47EECADDAD5B37D8D4C08103A12A008FC2F6610696F4EAD50B880F6B4E9F3E7DD396CD9CDCDCC79F7BA175F7EE83264EF8E0DB251CB5A2221CBC2CE0E51A6AF3ED46A1DF2D23020A829013615938242542478585FB0BB20EE6661ECDCFD943A52CDABAEDF9F7E63FF0D8DC5E3D073F74D7EC833FEF2DCB9257A44BD529DC2A9AB03A996B63A011BB1AC3DD03B000B853D1AF556D2C890588CC91193364E83EF111A33C850DD9EAFA76F0CB01EBA64CB99183868831B1C4466A913E990BAFE863C981BFAE1401142480CBDAC36CC1C6D3DC8DE7E47B28B5A773ED49224F64603F17556E4914A2819F22B653223354F45B4414E7532560FC90932A0143FD030C158248834FC4F81E4C40F6EBC31D77C020D24A20BC571EE1247CB1EDEC820DA2ED9700EE650769F0B184990A47020F5D774D53434980FBF035762CFBFE72FF31B80729E2B27DA900F7BD2F7C0958A77DB33DF9F34D451BD0500A793F1DB65F2888DDEC9F7514D67FD051BEC7C01D85F70C7477DCBA661959A459A6D8026122506E81FA9F4FAE7517553A738B5D1C0524838670874D6107E88A10B39848ABF0328A4DC9122B4DE1CFAB09166ADDD99506BADCCC52D9D34B80ECE614A92551EC48927A29722F05FD20D99EC4477C4FE1191942C8EF70B846C61FB5A2FC0E9554DC14099437791BC21D1BFE84859E1A5B50E30894999DE26A348229AFD291A1D05CCE75D2052EBA00A640792B4B60620BF469825A8EC058A090D2B20FADDEFAC49DF7F56CD161E2D0D1BFACDD6CA8AC25E1FE17A8B6B616378803DCAD562BD099C7E37DF7DD775DBB7605FE429A06A08F1E3D7A78FD089110AB81B6C0FAEEDDBB630A43B8EEDDBBF7975F7E29168B612390D681F2E5E5E5B9B9B95BB66C81A703B281D4505AE0780E4F8C8F8F87540E6487788EEFFD047502C03A7E15A813F4EBD70F571720CB4F993265E9F7CBA9ACF4879E7A1AE03EECCEA99FFDB42AAFB2AC8C089E2CC8C932D5E6398C3CBF4B44F82544584C84C02222785CC8DD939D7E2837F35C116F4F6AEA47CB573EFCECCBF73FFCD498E193DE78FA4DCAE14493A0BA9421149D4E2F4B28D4A616D901AF912B90B84D2606EE10DED16F4469227C3B2438EE5103A80A5295A9CEC570065EDF6A3390DD12195D5DC74483F7423802B26B2FE743B1012727F017400964775EE2561DA073D71DE76D3A5F792C03C80E765264614E3954B40D177990DFA3B6258BC1F614093205E11ED64463BAD2A46EBA0C67760C773F551C037720FB35E10E054C14EE6587D8E73ED97072FE5AF1AF09FF3AB86363B89FFBF0C71D4F7D92FBE36FECEF765DF8680DEFE713C0F7FCD5478CA7B26237FB671DA5F61F74C3081FE53BC01D78ED4A93FBB28B838515A87B8C544F28E00043838062B87B64B518EECE74B98321B926DC83B408DCD9E53E9ADA9C208278EECFAC0CE6D6B8D24BB5494223450AB88785E8A14B4247A2C4932AF3A54AA1E2E84C2EB225F280EFC6543E1CA270ACA2467F3C0469A4621AAA8D20DE50D77F06808E0DF3A8391E8262A515AAAAA16213ECA4B7B01CDE05BC1DEDC55C174DE4A1D5F1DD86C6D316182270AF4AE39571789483A7DF79E2851ECDDB0FEEDAFBA76FBEAF90159370FF6B146D4EC18DEF8078A03330173235A4ECB66DDB029781D177DC71072C9C3A752AF0175318880C58874701C173E7CE4D484890C96410E1DF7DF7DD071F7C10D681A74309D1AC59334039047CF813CA0C003AE47DD8E035851B7C060C18002507AC09CF85F0DEAD7BCF279E7F71F0D8F12DBBF7B8F799670EA7A4E65657E6E86A845E4781D39A50AE3A26112456956538AC1CBB25B5B6FA72A97A57267B378775283BE352117F7742E2EC57DF6CD3BD4FF3569D7B75EE9F782441C32BE79DE7E8384A675E454542A12DD2C1004E127C9EE033049F8430834FBC68B0425D1AD2658EBC62477E89B3A0D4CD2DF7F22BD17DEF843560D4A521E2B0441B1469E021576119AC0C791F5575D323CF4D8B5C378BF480F4B3A1462C41772BA5888B772797EC4A56FF9A28DE724EBA2B05723A6476C037BEA3822B558AEEAB902201C33CB69B22C3C68887871CC96247B21039890FAE7F2F888075991DC39D1A31227B04EE68850874324A6B4F70DC2962807BE68F4777BFB4F8CC27EBB3D61CCD5B735C7F3A0B76124CB055806F28F6D045824658C78E61DF5FEEBA77D4C8C077E7A5424F221FB00E06BEAB77259E9FFFD3A9F7569C7E7F25C4F6CC1FF6E7AC3A94FEFD9EAC150700F178844882A984296E7442BF20BBC46DF85A0D8D8BFCC6860FC77E998B3F10F87CC0019A14AA41E8E7BEA922580E9F1B1AD7215544B0944446D935E10EC718915B4E145412BC6A42584B887528B9CB8D284968DCB8376D40A98723CA9221C79DBB30DCD10D6FCFE7B92EF360E7E1456B8F67EA4FE5D913C44146498855E6A1AB1D54858B59ECCBA8B0D195761A6A677751951E8AD21B31BAB72A1C5D912F17920DE41BA850C2C6E125DC39C57090BB0495A801BDC41469A27113066F508F7A00D7F506D6B9FC5A27E2BEC6692E2A3315169B7294B62CA53B5B1DC82EF167A803694A6FE416ED60371DDD37C6C6129BD3C47A8E589594ED105756E6487E5DB6FEEEDB27776BD67EF69DF7EFDBBAD350AB0534399DCECACA4A8012CCBB5C2E1C43FF75BAC970C7CDEEC1601037BE9BCDE6993367F6EDDB17880CC11CB236707CE2C489C0EB499326E196139887640D0FE14673983EFEF8E36FBEF9E6B469D380DDB0A465CB96B8EB0B301DE80F6B427E87480EE0C6574DAF29D838AC00A508540EA0E4808D40C1D0B55B8F879E78AADFEDA39A77ED36EBB9678FD2E9F9B535397A4D91DF9158A63A5494BF2B3FEB884C70AE4C7DBA5871442A3C2CE4EFC9CE389C9B752237E76456D64FFB0F4E7BF489961D7A746C1FFFD05DB3D32EB0B48565D2C43C5B6E9933A7BCF272A10B0EBE08DC1B26A028DC1B9E7B18F1806667263A7CEDD92A7453D3FC5208293E2EAA84C23CD895570276E444DAD63315E854ACC77A43B2C3D6DC14918722B25E2C705C2C2CFAF9A464F339B068F3D9B2C3696E9AC2C754434207767B690A407980A96E0877085C51C39F18EE11BE23B8430A03D7BF9708FBA26407A05F0FEE6C95EE54A69F260F3155CCEFF76F7BE67348EED9ABFF35700747E11E48153584FB990F563586BBE56C2EA0F90ADC23E316FC09B8C337081C07A083430C397C44300594E34F09BE0298C23C18E689B4E228DC1BF21DC13DBB349C537685EF222D423CC40574A75CD4E1CA27D14056B0A449AD74919D8A1A5280ECB64B85A6D3D9B6F3F950F983AF49B92BA5FA4886F91CDF475501DF01E28E54B98BAEF2B14B01EB8DC85E077778170DF90EB558E0BB2753057CC7FDC4EAEEEC1849F1C16ABBBFDA56E74A2BEA1C5C819A1F6DDC526B8E0A0E783B1A7D4F158C901D8D5F4D15614384B733A0062C32B344FA345139ADD02DA9AECD93FFB666C7EC49F7C4DFD6F1EED153562F59A9AB4670071CD5D4D4B8DD6E988729902A42AC7F996E26DC81E9F0A9E1DF318100F40E87E3D34F3F1D3B766CAB56AD2098036401C7E8726AE4664CB8D904F80BF40776037F5BB76E0D6BC272102C011C43600701E2FBF4E983878087F5A1308022013682217E4DC116607D98C23AF014A8374009D1BE43A7A9F7DCD765E090665DBA3FFCCAAB673233F86643B65157E0B1EFCFCFD9C2616EE03077E467FD5A98B3392B6D5366FACEDCAC83B9D9E78A78E70A0B762624BEBBF8BBBEA327346FDD6560BFDB577EF3239F56A0C9515730445E6E8D33ABB40602574609C03D8A756C0C3B7CE28131F701F160E0321AEA9D2D015EC3410CA07765A920A778728AAD70D6A549D15DF198913B6CD4BB21D631D931DCAD095C38399D89FCDAA3698C6F76E4FF7858B0EE8474DB05E3056E98538E3B414218C7F7480BA795BA53A4517B5364603833C1500060E223278BC0E8527052F417F6887AF5288FF83A708773DB70269B6017FBA8B2CB9F6F5DFBC8BCA3EFFF98F5D31180BBF154160619EE41E84B16A2CCDB087FFF8CA3286F6CD7656E14EEDEA42280FBB90F7FC4704FF962730CDC8189E8B26A04EE682602F71B5C28C69F4063C3E7860E8FC8509A00C7305B09C66D62C1FADB5AA1F6BDC8586CA8F0BB0EDC110D338B8339A5E1828A30AF0AF59929AA090A6B420A3D6476BFB4D6C3ABB067282C0C9139B5C8965264BA9087461FBA5808A514C01D5C7990CEFBF9947A0F4D732C07C23BE0DB952277244981EF6E9A0AB08EC91E03775F7D72C78EF21D8E5277BA028E6D9460F8957EB10610EF57EA7D2ABD478DA6C8B044A10BCA7541A9D69EAB86DD43A34C33A55EB61C2AA668440D3A6AF341451D05928AC81119491BDE02BA1D7C862C20D31A0AD4977E39FAFA43CFF66FD57D74CF21EF3CFF46990ADD2802A4D7EB71073C807B9451FF2EDD34B887C361803BA8EEEF08EBE1733C71E2C49C397380ECF1F1F1806608E318F12058826378B76EDD708774DC211256EED4A913AC89233F2C87CC8E2F9382208903D901DFB890803FAF2988EDD10129E159F89AEA6DAD5A0F9F30A975CFDEB775EDF1C43BEF26F0B962B73DCBA4CBB69BB667B03771189BB2D3B616646DCC495FC54C5D9DC6D8999F7D382F3751223E939BBB6CD7EE994F3FD7BC4B7CBB8EF1F74E7F28E554AA845554C6166BD8326F41B595ADACBDCCF3A7A9FD70DE5E07EEF8DC6B68E03B1AC68B8A06E9451D28991234FE0C803B4D0E861958080FC10A781D38941B631D0CDBB15E2E847309C8A2DA9978FADD1559CBF717AD3DAEDE95044027B2AB01EEC64B7C7B920892BB9FA122322B31D63DC975640FA4C8C170727A2988EF754E1183714EAC7F0B887A57C80EBE0EDCA13C800A3EC129B35DE61F7BEFC7E5F7BC71E0CD65ECE5FBAF097734DF087FFF8CA3288F31419701DC81E951B8AB762600DC4FBFBF12C31D988EE10E94E7AF3F693899897EA75A0F77FC2178128B625E2E6AFC09C418BE41D4D892AE8643C891C4870A13909D4853A18B373409901DE6610A7F02DC610A87D035E10EC703BABA9EA6F07154FE9C92406EA93FBFCC5F500EF542603A6AC58EFCAAD9C69200D9ADC9A8D90D323BFA2292459ECB7C6F4291EB32AFE200AD60CD71D1D6CB25FB58FA3385C0777BA2C416993A936518EBBF0B776CD85534E274E432803B43092F8D6AA585654E5EB95B58E51254C22E8161DFC050730D145640D001B2DB68222755E48BDC1500C88EB61619E2140E4874F98A22B45285663ABAF88446C193688C85C519275396BEBD706CF7217D5B74BD77FCF4ECF42CFCFB768BC5E2743A217DE2C6997FA36E21B8C3E7089F268FC7FBE8A38F80B6405848D05D2202A0E3EEE710A881E310CC71E774403C8477DC3A0FF8C6ADF35000344CE840762C0CF1EB095E0ECA03A0FFB871E3E04FD820D4039AB56CD56BC8B0B84E5D9BF7ECF3D282852CA54AE1F771745A864E03217D6B0E675B61F6AFC2822D85393FA533D665A5ED292AF82D3727492C3A40A5BDB96849BFF193E35A771C3A74DCBC373F916649A4CCA2625A913E5DE1C82C31D3A48624810B6AD3744594DDF80CBF81611D084D56884E1401548D2189A06E360C741A84B34A207C4166813F6139AA384756C04C6F8875301CFA90E6D06F97E8F2C2B5C7F63EF745EECA43C29F4F96EFA702D089AC4A1F536DB8C873A648024C75985542645563ACFB939101EBC18861C64F51F8A88A48B70774A27A53D0DDABC1788731BEEB80DED08DE00E7508EBC50248EE9A13997B5E5EF2EDF497F7BCFA6DF2D7DBFF45707727F080E9A1489F770CF7B3F35601DCCFCEFB310AF7B4A5BB3396EFE3FD7C427B2CDD9B24C0708777843F04988979B9A8F1271063801791A626324B21A4DB1379C05C4039CCDB12B8F0FD02DD00EE807B98411D5E6F0877371D1D456E3682A9370BD505C1EE9C627BB6CA91A386040D9C45C755E4820A1442007474AF739A3C942A8119A03C5401051BCF16FE7C46FA6B6AD5D12CD379BEEDB20810EF00B8A38E31754CBFDAA8B70C4279A42B01B8E15B83088FF70ADF31C6C6915B32E4E88A6EC488F8B057592A6F0632EC393AF22908E250B0C1B11D253B18E08EBB27C04901A107C3DD5E58AACB55C828B907566EBD7FD49D3DE2DA0FEB3E60DFCEBDF8169E0E870392BBDFEFF7FECDF7F2FCFB74D3E00E351D0C775C4EC2143E4AB3D92C1008162F5E0C98061C431207C802DC81EC10D281E610A631E26106E00BA0875C0FABC114883C61C2049842C69F3265CAD88846476ED407C8C67087601EE1FCB5851F8595610BF0A25072346FDDA6739F7E711D3AB7ED37E8ED25DFE55457AB8910A3A6EA62997A2F2F7F6B5EC696FCCC1DC2FC6DFCFC75D9E9E05F79B907B232CF16E4AF3D7AECBE175E6E1DDFAF7987EE0F3EF8E48E0DBBCBF9A5726651055B62CE50EBA9E877FC4E9ADC70A9F08FC0BDE1D908C7281CC1104FA0EA8A0E7D3ABA831298C82C096714A32B484C193C04EBE01F13C19F8DC90E0E31D0702E9019A95F6FDBF4C8FBBCB5C7251BCF00DC8D17B881F4520F5D09C9DD439587D82541869A482FC781BD21D943A98A60AA224055FA69C880783F05757EC06769DD9EFF61B843790061104E75E59ED46DCF7C0E70DFF9D2A293F37EFAB734CB100C7943B87B12F9CA5F2F9FF900C5F6731FFE94FAE59618B86B8EB071230CBC17A07C888A0A5AF41E1BBD2236FE04628C68C890119C62603AC01D5DEA60CA21A4D79C48379ECF050A03D66105801DA2276479861C1D4894AB8E2838F0E0A8408D210C09D4F05063488612B7F8C1D49A2675A6CBD142C8D1A9E8820A90DD9F240C2609239B92C20CE6BBF94C8E626772EEDA9382AD09A507D374A70B2C1705407617C4F65428FE63B08E1C69F493C24B8331DFE14D055322860A0D15ED363C04850AAA8FD2915147CC7439FA651FD4561BA416D4BC0E613F15711C9E089F27FA7CE050896C0DE6F1A6200C41EDD6CC125BB214D52C4165BA50932B671DB9FCE683CFF6BDAD4BEFD65D3F7CE7838282022012E008B7B69370FF9F0570870F0E5F4D8579F804A11EA4D1682E5DBAB460C102803B20BB6344B8F34CF3E6CD01EE0074C03DB01E964042070AC314D6C4EBC4C7C7F7E8D103E6070C183079F2E48913278E1F3F1E100F7C87088FE18EE37C63C153702777DCEC03E507BA30DBBA4DFB9EBD00EE9D868CF868E58F7CA3B1842052CB4B8F4B85FB8B0AD767B121B06FCCCFDACACB5B9797F16366DAC6CCF43DE96987D9EC2F376E1A3EE39EB8769DBBF71D3AEFFD858CCBEC2A7E5929476A2BAC74E655542570AD705271CAAA8E738234E0053AC7AEE9E84918359CA2A8A3211DFDFE1B919A8946EB0DB21421B6120C33F0273C8ACE55C82911B8C7601D17249019A12A6D3D937BFCCDEF57DDF59278C369D1FA53AA9D899A53391EA60AE06E4914FA192A80BB275586125683D6184C76224581F84E5305E82ACCF70015823CBA8F28B86EFFFF30DC813B6890E14B3CFEE6739B9E58F0FDDDAFFDF2C2D77B5F59FC2F823B00DD970C98BE0AEE10DBA370CF5E7910C39DBBEE78F56FCC867047EF08DFE8A3D12B62E34F20C640434039FEDE1DC945CE14017CCBA68BF9F23D49E54798DA3359B6449E3BD2DC0C06F6FD2EDC7187480028D891816CA5A3FBEB0243D141051B491240482752252198A648820902F785425FA20036058753E56FEC9C3527789B2F29F7326A4EE49A2F14E1CC1EA0175FC5F4A8A972A8BCC6F40306168753E020914181011F08BC28BC2FA8AD1A937960D84354C3C0A6A3FB85C113C161A602D23A841530FA18A932287222BB2A0F53E421AA1C1D9C34B9872177B0E456B65CCB10292E66A9530A1CA21A0583B7E8B505C33BF4EFD5B2EB94F193CF9F3FEFF17880EC0025A01309F7FF59F0A901D9716F191094937ABDBEA2A262D3A64DAFBEFA2A246E8035D01C723AE01BA6AD5BB706B2B76FDF1EE0DBAF5F3F003A901AF00D208619A03C2C816701D3C78D1B074C87E201F31DC31D0773DCF03262244C6205AF02F500607A9B366D00EBCD22ED3EB7356FD9BE7BCF661D3A751B7EFB676BD688ACE66282B85CA63C202CDC232CF8299DB69496B0268BB9859BBB212F73551A7D352375379BB53735F983653FF41A3D36AE65FB21C3C72E5FF29324475C5D585A9BA32464E610AFA6EA7CBE1B4EB39C9AB243CC08DC1B1BCE3A34C5676043C3F909E90C5F2BC357CF70332BA276FD4298E2BC06A734C6BA9F11E993438FB4EFD3505D8160AA2D67733547D277CEFD6CC9A4B9E24D67F9EB4E49B65EAC3A9E0964F7D38B9D299210B3186C4F10DA2E1635843B303D940A270F9A46E08E100F9B85F3070CA7161823BB0EEEC870BA46A691F9ABC918296CD2D40077FD99DCDCB5C737CC99FFC3BDAFEF78FEABED7317E6AD3D7ACDDE3231ECFBC70C3B1CA4A3DD8E99124C852B09C11DF5EB4F15C1FCF5E0CE59B617E05E75880134840DC26715853BCAEFE855AE31AC5843A6D75B0AF524280E034C80BBCA952A7643DA65287467738BB65D50EC4DAD38CA329CCFB527F1018E50D20307E10889399CF0870F4705C22B2D721F5DB6DC93A600A30109D21476AA10E08B0E9E083A0197004DF444E06FAAC47F89EF389BE7B9CC27687278D4782A07E0CEDF7C41B9875A733CCB7C81E74A9640DD0E8E227C79064FA38E26F78664AF833B0DED2ABC166CD69D2C40BF724AE49A120AA18C4140C7AE6FCC41C7065389DE0B7E3A05DD3000950DA8905080E16C42873DBA80A4F030154EB6A23AB150789C017C0F48F5868292351F2D9DD07D78BFD6DD7B75EABE6FCF5EBBD50670073A01A63C3E6F8840CD0B51FF5BF497C11D7F168D2F2BC312586EB7DB4D2693D168C49729F0350A784A69692983C1D8BE7DFB871F7EF8D0430F018B71AB0B10B655AB56283B376F7EDB6DB70169230D27D710701CD88D5339307A4CE4FE7CB0105D4B1D320416C243B01A3C843A3C8E1C397AEC9811A3470D1C3CA873D72EB7B5681ED72CAE4DBBB6DD7BF68082045EB7C56DCD81E99D3A74BCFBAE19B31F7C68D284895DBA74EBDAABD7C373E7EEBF744160D1735D2686B986EE36FEC04ADCC0CF5C979FB6887261192DF1D7A2FC9DFCBC35A989873338DFEFDC71EFB3CFC575EA1C775B9BE79F7E91768E6A10575473A4BA34311E4906D20A3AA029E8E48CB6725C6D6998A284C4D1D8709EE33E7F318653141B4E42741E5251AD16556C29109DEA7E0AD8706A3C571866A828DFECDCFAE4826D4F2DDCFFCA12F1B604C3E9FCC8652EA52F45553713712045E94B9222278BFD2970BE01BF105C604AA49711E9C504BB04760CD804A72254DB11B6D86A14B4994AC426842D099CA8C1489718DBA5027436B29460D8619887F8597E980175EAE2039413F356FEF2FCC29D2F7EF1F3A3F3964C7F2EE3A743C507A98027A891E0620C4E69D3853C007D9D613BF855FE11C3478D4AD0465322B34CB4E3027A5F39159AE3E9954759B96B8E1C7C7DC9EEE716A67EB999B36C4FF2E71B198B77C8B65F906E3B0F33869319501E1019A5501E40CC474DE76C15EE4CE94B415D6EA0CC8850BE0EF4CE4B5CF860E13387108A130041538719C5A84739B3D44755B9E1B061A8C16840CD2D1785DB2E8B775C86C232C850C22786DADF23AD37A8C4ADC77AD4F02DC0BBC086751A1A1F547835FCC41B18D6D11DCF94FF9A54F8F329F1B64B86D3B9708CC1B1810AFE48510453745526624FB2181CDDF80DB68F1FADDB9306C73C38FABDFC41C353E04DF9D90AA80A1045B52696B822B540CB911C5DB9FDB9C90F3E35EDC1AE2DDABFFDEAEB45855CA038844EB3D5E2F279FDE190371C04C30C38180E85232242B734EAFFCAE48E390E191C04F8868F06964472B93F1011CC401D07980E2B9C3A75EAE0C183EBD7AFFFFCF3CFE7CE9D0B411BF238A475003A8474403CE46848E5F1F1F1B85323467963E16BA7407098427207AC8320ADE39F2C41CC87E7E2DE9098F23D7BC5F71F3C68D8C8DB070F1FD623BE67AB36AD81EFE00E1D3A402131EB9E7BE73EFDCCB7DF2CDAB76BF7C6753FBFFBE65B5D3B77E9DBBFDFDCD75E3DC5A4C8DD56AEC74C3555A53A6B7748F276ABF9BFC8B91BB819BF14E51E554B8E2B24FBF3B20F30699FAFF969C2FDF737EFD8B95BF7DE0BDEFD242791ADE315D7A68BE14802B23B1B8CDB0EC73A4279B2F22A47F81E81FB35F81E73B0461D3D4380B0D8100601EE3159296A4855968BFCD3F3D76D7EF2D36DCF7CBEEFD5EFC43B1275A7F30229AA0646588F588EE18EC98E125C7D7EF4452E6FC2EB22C2D6D31CFE84E58D0DA11BCE4FA85200CD2D970A8CE7730DE77280D4D6CB8570CA1199A580F8730BD6EE7AE9CBEDCF7EBA7ECE076B1F7DAF60E3C9E2C374886CD664340672384D05AB11E96AA03CF23F0B770C9428F81A1AD0A9DA978266B2CAB4A7337567B20A379EFCEDEDA5A7DEFB81BE683BC01DA6694B77156D38C95F7F026672561D2CDE9D0488D71D4F07BB2E73717B4E902A040728027F6A11801E706F3B9F0F752CF8F4229F339494CA305515A228C1108A83D49220BDD44751BB9315007AB0EE740186BB687B82EE740E863B7CE6F0A1C1EE458F9318C7BCD32B6E84DA1BDB782AAB787732EFE713C24D673447D8B0DB682391CB09D870F060E34322E6E9BFEF86FBF6BFBAFE5E54F039582E1712DC1A1B4B5295946FCC90A56E3F36EFA1179EBCE3BE9EAD3ABEFEDC8BD9691C0037D0CC62B3BAFD3E1F1172134130CC8001EE28CBFF77E08E1BA76C361B2474B3D9EC703800E5758F45B80FE1BDBCBC9CCBE5D268B40B172ECC9A356BFAF4E990B2070C18D0A54B177CBD140440072EE3B697418306019171E88E348C5F43832382840EEBE0CC0E8887E5D1661958084B60234076580D380E4087D8DEB57B37283F80E95DBB4234EFF5E823B33FF9E8E31D5BB6A6262695AAD4DAEA9AC4F3173F9EF761BB36EDFB0C18F8FABC0F9372B34B435E807B8ABE3CD95ABD99CB599D435FC1A1ACCEA46FCE49DF929DBE259DB58349DF7EE9C2CB0B3EE93D6A54AB4E5DEF983C7DF34F9BC4698555591288ED18EED116C6C8B15E0FF708D01BFA4FC31D1CE5FB0DE00E6497EF4AFDF5F9AF01EEDBE77E017097ED4CB90EDC23BD1EAF901DC7F62BE72ABC10DA0788EA6910E1D57867EC17D0CFA320C247DB1C108223591B4E2DCC77DC7B0F7D140CD471CD9EC8E36F39736AFE8FBFBEF0F99A47DEF9F1C137B7CE5D40FDEED7AC9F8F166E3D93BFF99470C785DAD399A86D21BBFC56833BB8F65406901D186ABE980FEFAB68EBD963EFFF70E29D65A7DF5F7176DEAA18277CFA73D68AFDAA9D09358799B547D9A6D359407608F268E0CCC80FBE00F1FE1421F01D3E43F824E1A38E347641F548EE4F9679132560779204C3DD9BAAC27087140F5FA260EBA5882F684F6563B87B2822A8F7C047D7F03869E898777AC5316CFD3DC3F75E718026D8781AF8AEDE95643E93037B0EDB6978C0DC0A70D79FCB210AAA9CE97280BB355B293AC7FEE9AD2FE68C9FD9B76DD7B98F3E7EF9EC7987C5EAF378ED4E8727E087CC7E4DB823BEDFC2FACBE06EB55A01DFB8C905B00EACC7EF1C886F341AA552697272F2962D5BE6CF9FFFD8638F01D6DBB76F0F09FDB6C8485EA0E6CD9BB76DDB16500B2086048D698E710CA11BB7955F5390CAE15158139E081C1F33660C9407FDFBF7C75D656039AC00EC0682C3C6E12500EECD9ADFD6B2752BF813569B3973E6BBEFBEBBFCFB65C9894985B979E5C525F0A51221C2E7709D3C7CF4A947E7DC16D7BCEFC0211F2CFC9C252CAA24823CB7996AA864B874BB24F9AB33A92B59299BF3393BB9B95B33D336B319BBD3D83FECD93DE389275A76E9D635BEEFCB2FBC9E70E2527981BC84C9436D32ACBAA17D5192AAEBF51581FBB5FCBFC21DD1937EE5D4C570471DC2AE0377C3D902E6F7FB57DEF7F6A627166C79EAB3BDAF7C5B7280A93F931FA17943B2D7C1BD31D9813588DA0056EC4893319CAE184670F6465783E5081FB002435E7D945D73221D38587D3CADE42055FCCB4548B8B9EB8EB27FD84B59B2E3F8072BF6BCF2F5B6B90B96DDF3F292E9CF6D7C72FEF6E73EDBFBE69203EF2CDDFDFAA2631FACC85CFD1B3CDD9D2ABCD5E00E85139455445E151454506EC19FF0BE4E7EB86AD7B39F6D7EEC838DB3DFDBFAF8871B1E7977F95D2F807F7EE86D587EF8F52580F8F4EF7783994B7E01D64BB69EAB38985AF51B557B9C65399705711E111F5E9AA5C29F679022432D1B89124F82180C700F50D5015A09823B1C3657C1FD027FF339CD095416C2F106BB0433FF00DC3D89E8AE00D26D17B8EB8E8B369FAD3C48C79716F0C100BEC9708FF01DBE2FC3F95C22A7CC9BA1D2A4726D392A2D47F2DBD24D4F8C9B39A853FC0377DEBD6BF3B68A9252B7D3E5F2B8BDC1803B58C7F7FF28DC81E900743C0FEF19405F5555A5542A4F9C38B173E7CEA54B97BEF2CA2BC074C8E3C074A0396E5B0701E581BCB01C688E533608F80EE0063403A931DF01F7D7144AEF913B68C3B380EC308F7FFA04ECBEA620DA03D0E7CE9DFBF1FC8FD6AE5E73EECC59914068D61BBC4E1714D3A65A5D7569B9B6AC525CC0FB79C58FD3274F6BD5A2EDB0DBC77EB1745996420E702F741898E6AA5CC27E50C9DB5CC8FE398BBE939FFD9B84BFAF30777766C6A18C8CF7BFFD6EF08489712D5A8F1C357EF9E21FF8EC7C9DB04C45CD8FDC2BB531DCC5C114E0FB351CC3F4A8AF3A581B3A02F718BEDF00EEE5BFA59DF860F5E2692F42725FFBC8BC3D2F2F012898CE731B30FD0AD9A3708F9EA2C1C8082A11A385F85C85900EE736D89DC027B22A20C8C3A310E5A07A0E214EBCE51C6FE329EAE21D00F1E46FB69E5BB0F6D05BDF6D7DE693D50FBFBDFCDE577E98F52AA4F59F1F7B7FFBB39FEE7CF10B88EDDFCD78E1E7391FFC70DF6BEB9F9ABFF5F9CF363FBB60FF1B4B98CBF7541C61422EBED5E00E751154A5C8AD848207C80E53D6F23D50561D78F9EB5F9F59B0E3A98F61BAE9D1F77F98F12278FDC3EF2C9BFE3C507ECDFD6F00FA81F5F0E77753E7AE9CF9F2FE97BF38F2E6E2F31FADA22FDE5AB0E688F2D7CBD5BF31F527320091F0C1E26B1EF07584284A82A62658A508EE74D417A51EEEC550420BB75D06B873379E811214F60A62BB238987C65E665EA1798C63DEE915C7B0F5F70C4782F55C5ED93E8A70D319FEFA93CA5F1320BCA343F126C11D7F65757FD6C31D9640353190A6F467A88D0CA1992373E497A46E3DFAD2F4D923BAF69D3C62F492855FF272F35D3674B71F7F30E0F47B719BFB7F14EEF03E4391E1D4753A9D4824829CBE67CF9E75EBD64D993205900DE13A3E3E1EFF94B44B64BC17DC928EDB5E00E210B4274F9E3C75EA54580E0B216E03D381EFC06BC0F184091330F41B2BDA0E03C500940103060C801782D2A25964D4302842601EB6093B00EB4099B162F90FFBF6EC4D67A795A98B81E990D3DD7687DFE9A624245D3E7576F796EDABBEFD7ED5E2A5CBBF5AFCC29CA786F41ED0B553CFF193A67DBD7C0593CFE7E935C94AD105B590E3D21D90E4EE1164EF2848FB359FF39BA0E0B45474ACB0F02093FDE00B2F75ECD5A7598BB60FCC7A64DF963DA50532B3A8A298926F60A3E1909CF50DEE0DE08EFDFF863BB811DF5103F775E00EE16EE70BDF2C9AFA02C07DE98C5777BFB4D8932AB35D16E0CBA7316487B41871FD3ED7933D4495007180E97096C2723887D10E447606CE5EC07AD52106D4D0198B7F39F5DE8A3DCF7FB1E5C98F00E290CA01DC10CCBFBDEB79F873EDEC77373D391F166E79FAE35F9E5FF8EB0B9FEF7DF51B08EFB01C923BF8D07BCB2E7EB52971F1B6B495FB95FB5210D939C5B7607247FB93AEB65E2E0CB395FAB3D927E6AD84D2EBF28275C99F6FA47CB52569E1860B1FAD8EF49F59757EFE4F47DEF8F6E4BBCBE1CF53EFFDF0DB6B8B77CEFD14280FD0FF7AE2634BA63CB962E60B1B66A3747FF4CDEFCE7DF8D3E5053F97EC4929DF4FD51C49379CCCB69DE3417847704F2BF753547E9ADA93AAC01754C3AC12A89309B75D04B8176C38010521EA094311DA120ABD54D13F0077380CE090309ECA82E21CBE7AC9D6F3B547D3F0E1817D8BC01DCE414B12CF93867ACDEBE9026BB632E7B7C4CF9E7A634CCF8143BBF77EE3D9179949A97633BAF30FC0DDEE763584BBFFBF06F7E2E2E2A2A2A2D4D4D45DBB767DF3CD372FBEF8E2BDF7DE3B69D22408E9C0D9969171023067714B3A08D316F00D648729301A027863B843D97003B8C3736153504E408101DB87F2A363C78EF05AF0BAAD5AB502D0C3D31F7CF0C1975F7EF9A38F3EFAF2F32F44FC22B55C01752EA558CA61B04E1D39F6CBE6AD9B57AF9B73FF43B367DE3765D4B8C13DFB0CEFDDFF8EDBC78C1E30A44BCBF65D3AF6B87DF4A477177CB6EFECD9FDA9093FFCB667D9C9037B7218EB19977ECDA16FE5A4FE9478761B3DF56451E1D19C9C8DA74E8F9C7657F356ED3B75ECFEFA0B6F5CFAED6C55A1D2C22FABA47263AEA65E05F754513DE2AFF86AA6E3261AD44A5377985ECF57F3FD06704FFBE1D0A6271600D6B73CF5D967E39EDCF5E22222038D3100EB3732EAE7801CE973E6A7D6394017056868D0C1BA6E39A922FB65AEFE7456E56166C97E0A73E92E08E9973E5B7FE2FD157B5FFE1AB0BEF6E17756DDF73A84F495F7BF0EE00694EF7F7DF185CF7E66FFB0377FFDF1D4C5DB73D71D4D59B40DF80EAC07B8C374FDE3F3F6BEB628E5BB5F843B2F151FA6579F48B727F1519F995B0FEE60D81FF8668D50DF4F57ABF7A76E7EEAA3DD2F7F05EC667FB733EFA7DF58DFFECA58BC0366208FA72DDD25DE7256738465399B03D3B27DA91507A8A57B53A4DBCE9FFE60F98977971E7E63D1BE973E87B0BFED89F99B1F9BB7E9D10FCE7CB0EAD227EBA85FEFC8587E80FFF359D5AFA99AC31991DE4D723F4D0905337C77F570CF136DBF54B4E57CDECFC7CA0F33020C29C0DD7229DF9DCA87F928CD631CF34EAF3886ADBF67A03694F1C077A8AE01D9A1BA0605BCF312F756833B5468AA8EA7D9A9C24076494D72412DBD487C86B57EFE92F1F183E35BB69F7DF7AC8BC74E59F5C670107509B13A1D31700F1061E03BB80E7FB7A4FE32B89F3B776EE7CE9D9F7FFEF9ECD9B321890361717B3AEEF782077EE9DFBF3FB0BB478F1E40618C75A036BEE6895BCFE151E0356E73C7CD32B84D06042B5F5398ECF07290D3E1159B4704F3F08AB085471E7964E1C285FBF6EDCBCCCCACACAC74DA1D4488306AB4EC14EACA254B1F9DF5C0B0DEFDE3DB77EED9AE53AFF69DFB75EEDEBD757B2816DAC7351BD4A5E7F09E7DE3DB776D735B875EFFC7DE59C0B5B1ECF13EC5DD9D7AA1EEA7EEEEEE546829F5962A2D85520A2D142DD062C5DD3D2481047777487077D70896F7DF6CCBE1D023F7DC77E5BC77CF7E7E9D4E96CD667776F63BBF999D9D919B77F8F4B9971F3EA87DD03D7A5FE5F8B3DB8F6C0C8FA8DF5136797359FFF5BE47AAA75E3E56B7FEAC666A7A4CE596DCBC45180CA79CB8FCA31B0F483ED8E6CCB2BEECEA6652DEB436999FE10E642714B04296FE18EEC88B3CBFA77F0CEE78756BA38377DFED50B638F1F8B6C23E70F1CCAC0E4654D914A64F21FBB7DEC445A09FC9CED27834F22B347C6157405AC5575CCA7B97B0C7269E2A6F75775C7EBFEB2A00DDE4D02DCB130F6CCE3EF97AE1B9C325F57C8B80529BB06AE7A866EF8476FF1440614F4826B8DDDED02C30BFF057603AF87AA0BFD12155BD3DD700EED1EFEC6B3D637BB03983B87C2A6B304BA475FB2F067738182875A0B20F9E1DCA9E02CB4028C6A0A002331E72DF00C80E21B8F84C7DB71C43CFA8171605A6BE7D81E970F0346CDE407026D2F131AE62045F384E2C1A0CCD687089CC3172273CFB04CEDDEAC44380BBE6BAD3BA5B2F991EB86D7FEE85DF4DFDA8E7D669BA1EB92681708D50B80FE34A5870AF44E0FE25185232C3C8A3D69588C2BD27248D0577F40D835F601DD5B433FD59D3D8FA47026AC3B76087C864EB5661459F02A0C2D11F94F997823BBA1E6A81DD11391319758DA1690DD88CF29024174D93D552F344311CDB56ACF57670E96BED608E213D00FB070718E3FF03701F1A1AA2D3E9501F191E1EEEEEEEA652A99D9D9DA9A9A90071B4190438CBCDCD8D029D9F9F7FB227222CE0D9218E766E01DB0EF04511BF62C50AF0F86BD7AE45DB70600D6C306BD62CB4B906E22222221B376E84387C5D5A5A1A4C3ADAC20321941F5024C01A88C01AD8216C063B0F0A0A0A0B0B8B8B8B2B2F2F8763860386B0B5B925C8C7EFC503B58DCB57CB8B488871F30BCEE014E3E29B2D263553500C80AE2825BF72D6828D0B97EF5CB9EEC0FAAD07B7ECFE69F9BA2D5BF69CB978E5E1CB578FDF692ABF7C78E6F18DD3CF550EDEBF74525DF5F8139573EAF71F1AEBDDD6D1DA72EAC4AC652B67B0717363780E6DDDEF67EB519D5ADC9159D1914C6E27E60FC591A931E8B4A2482716F469E4280199B66222AA8015A22AF9A6C85296FE3CDCA70872F06058614F706E8B3710A71E100011207B853DD160DFAD0F7B6E02DC415F4E3F8BD67268F54943B6618D21338C2D1C0CCB473A29A73533E3AAFB43B301437442615F48666F48DA302E07B0CE8C2383266228DD81E9459641912F3FBB5F7F6371FC3E30FDCDE6F3B6E79EBA5C7D1DFCD030F68D5DAEA92F78F976DF64D80FD0BC9F352025301A92020C14835802B0A612C05D66F9DFD77FBDE9ACBD927AD0234320A3D1E15B0607549C6E68911D70502E76876442BD8799548D00F4BF047728C946BFBFEB3B55506633D31B2082803EA132F6ED57BDDD57A1FE617B5A0DCC7B8C86559A9E73AAAE13B878F0EF20A07CA74F12DA1F06B2011A01F232F079A3910568874858D3E39FDAEC06D63E32F0CE073F555D8F6BDA8E175EDA9E7AFEE5D863CB238F3E1D791870D7A8F80B968A2F1EC416F486E43093EA209EFCC125DBD427EDA35B9D1B89194F61269603D687F150F024FDEA1B52A069CC05D1230A40A338E4C525D4708C13909715504D67EE7701D6C1B603CDDBBD12CBADC333F5DD730CBD2032109CC54CA866C65650C3F320E7C32F22254A5CE5F77C3E5DD376FBB358C6052A079342F6F3BD31F057145BFE33DC891454F015302BC8D39138E445AD3E52D1704A457F4A39393471D3CCC5D26CBCF345A55FDE572BC9CC653246C747C700EEF4B1D149BE03D941C0F5BF34DAFF09B8A39D61D0485F5F1FD215B4B7373B3B1BCC38C01DB00E7007A603D981CE60D201E560AE91479F533AA4431C903DD932033806BE838507C44B494901F461BD186B440130FBB0314A79281B608700740101011ED6023F84961FB01EC80E3B3C78F0A0BABABAABAB6B4D4D4D7D7D7D7B7BFBC0C0407F7F7F65652591487475763977F4C4BAC5CBC1A4CF14915828377BE51C0528A54FEED8F7F2D60383E7AF1D8DCCC35DBC128223D2B1C4B4F0A884D0486B132B3363CBCF5F6CED5D9DAD5CBEEA58EA3F337AF5C24CE3DE87A7EA16DA4F4DB51E7F7CFDCC40FBC25D95F96B5672098970CDE091E016553A7816EF1AD4924EE9CDAAEA49A6B445E622E3604423641F25223DD0A7C0BD608298C7E23BAAEF7CFF96CBA7C11D28F6E7E00EA4EE0BCDEF0ECA6126D40D628B2002F63C55DF4B7FAF2AF05D77E7759DEDD700EE316F1CDB7CD3619B91C8B27152E548247928BC808E2F017A8E475306C2B2C1A18361A711F2E891F9A0A188ECCE8084460F529CB61DFE8585DF9DF7AED7341D955E823707D95F7C01163ECBC8ABF8733060BDD53BB1373813EDE40E267D08970F708710F80E348434818F00C7169F44B71B6F5E6D38ED70F965F833B3AF975EE8EFBFF1F1E04DC7EB9A007748BDDEB06C14EEC84B4CFF25B8232F88A125F42F05E7C24CAB8708D22325AE3CFA8DEDBB9D972D4E3EB039F5C847E52DD01CE00E4A7863072E1EF45B701F21E4D371B9C3E159E0DF8742B359C34C222804FF5B6183CD37F14FD476C43E32F7BCF6EEEB19758B636AC607EE3A5D798357FF92F0CEB9C02218E9479454DDE29390FBC93745DFA5EC6BD800360B3C3B8358C84C2423A0FF23B84FF2FD47B84FE5FB74E67E177013BE35149AD3E39F56634FC835F2068185EF0D4847BAC9B206BD00FF0E9B7D43FC14A04FD5B4DD4E0ABE0802A6A377100A77D0D473991482F558E485ED6F7CFF0E77D80F7C17D26A3486428B25F7120B69C91583C9E565A1890716AF9BC525345750FCF1F55BF92919CCD1F1893164DAFD91B151E0FBFFE7701F1D1D457BC5400475C460DE4B4B4BC198036DD9D8D880C8C06500F192254B80E0C06514DFB04004480D21EACD81C5F0D749FF0E9E1D100FE1D6AD5B376FDE0C7F05930E6503EC07B6017B0EF8465F5B8552047C3AFC169425E0D9E117613D5AA2C0C62F5EBC282828408F1616A86790C964777777E425D89DBBF830EC42188E7962D207366EBB79F61230DD544BD7D3D216057A417452794A766D56614376717D56514D5671576D5B795179616E5E61617E7A6E72445C885FA447408CD7D7401BEF280F8F08371BCF2F7A9FF44E5D3E2D3F6F161C86201BDF52A9F9EACA0F3382637A72AA87B36BFB1329ED11D9E8E81C8086C97C09FA0EF71C84EF3F239EC5F76FB97C0ADC096073FE34DC9931D54311006570493560E1C1B643DCFF9E11C0DDE8E05D08DF6EBBFAF9D4D38477AE5D81D9CCF85A04E8B155F02BC36188FF829B1C8E93814CB29A0B8E9219476126948F46E635BA125274ED82EFBFFF74E896D9C15B9647EF395E7801EE3246C33AE3835B9EB10FDAC91DBE0E77F2377B0587145B0E7714DAAED2139209161EA5214AF9B2AF11E0D6D5D79D04B81335AD3D6EBED5DD7D15CCBBFD358D92AF58305983B87C3AB184995C3380CDFD6FC11D1C1F94433F0ACA27664A2DD442E08CE05C2235BEBCDD7EE9D3F17B9F8FDDF354D622AA5BA2704F7A6B8FF67DFC2DB833E3E19295826D07C4C31A803B8A42848C240A5C9436CFA4B22FB8743D4F92BA6D989AB9C9C13BDA5B95DEEDB86A7EFCA1A7AA4E968977AB6F52B3777CD9576C8E9957B97D7857504A5770D240440633B98C9951F75B709FDA6682C21D150AF71FF93E15B85305870ADF02BE83436F718F2B360FCC37F1A57C0905238F361802F76103C854B00D9231A6007DAAA6ED7652B07FF8D6E44D84C6FF09B8C357E80424D721A621B2809E848C92561E927879CBC125C232F25C82D74F9C4B25C6324790A697CECECEFF09B803CDC7C791310620046EA291DADADA5DBB76817D9E316306A016400C105FB366CDCA952B01DF100776C30211C034848060F0E6B0A01F01EEB006DD06220074D8830C6B817202CA0CD82D901DB08E3E9B058602D901F168D746B459064A0B2851E02B376EDC282A2A621D2C32B41B143C407658093FC7819921C527B466EE429553176CF44D089EFE29E191E4E4CC2E4A0DBDB1A3BFA2A1398F5C959A5B9698599594DD9859D4924F2949CE4E8A8C4E2292F2B2D30A0A52E293B15892272ECE3B20D29990E00B71777F6B2313ED33E70E2E59386781BCAC3497D09EA59BAC5E1B56C6E40CE6D5D172EA0693CADAC23291D1BB7E15EE08D601EEA87EE4FBFF35DCE3EB00E840F6B1E84A803BE01B206E75E6F9FBDD2A9F8E3D02BE6B6FBD6279F249CA074F30F8B0597F50F67814DCFF00F75C705B50C546A60C8DA630F079602A414361E9B58ED898D716D6A7EEBE5E77DCE9E20BB72BAFFD6FE945BFB22A34F36F768B05ACC3DD8BDC6F686599351E168A0C30EF900280C2DED02CF0E91D01A910877B0F980861BAA187D121D597EB4F01DC93DE3B873D3545FA411EB96DA3F4A2D026742CA1021D000B9C296293FF4B70875380F2E94721E50DEBC040F031E285B9E6E673A647EF981D5475517A897F6A96F2CE11E09EACE3007C87F0B7E00E252832651514A240F9680AAC1F08CEEAF64B45B3CD08BE841A5E301094D7ED9BD9E691D2E89698ACEBEA7C55CBF4C83DF82DE3C3B7ACCF3DF1BBF73EF48931C52EB4C0D2AFDE9D3884CFEA0D4B053148F9633160967F0FEE3FF27D24E257F80E9A0ADCA982EB0E3B8143850386FC536E1D5E60EA576A19DCE8120DEBE1AF0077C03AEC193218FCD054A04FD5B4DD4E0AF630F50E427F08C96C3F9C11682ADC91F814B83349650077B8258789C57D847C4662C57062597950C2B393D7D6CB2B4861B88F6FD945F00D9A18A603C2DBDADAFE27E00E0B78760881E993EFA0B6B7B7ABA9A9813707F2028567CD9A058C46DF1145E10E1F610194C347802C0A747481382CF02774993973263B6B00480037901D760871E03BEC167C3A2F2F2F701C1CBA306B6C487979F955AB5681C1878FE0F481EF10575252CAC8C88063EBEEEECECFCF777373BB7BF72E1C0C943AB05FA5E3A7B5EEAA05D8399724A6B71496B516957797D58E347602C73B0ACABB8A2A2104AC57C467E4E362D38309F72F5CBD79F6C2F3BBB76DCC0C3C9CCC3F5B68E9EADED17E77D3D4FC99F9677563E3277A7AF79F3D52DABB7DD5C299E2ABE6CD561094BEBAEB64F8178FB634CA50560D2DBD9A9658DE1196890EBD041911D1F7BAED1801B5EDD92C4DE5FBBF0EEEB108D6D106F781F0C289D8EA12AB0893C3F7F576DD00C38E8EBF687E5C2DC3D0170C3EFCB5CB370D6E39C02584DFC88E0C1D5301C4E9F44D2830F38C7C61E2ADF2DAEEEC3DB343D70C765F2AB108845BB7D236026C1ADCB7C86DC67A55158C1B7A0F83603F7027C35F07C1FE1391168C76FF942AA7C8068F5830BC70EFA1888F7A6DF561AFF29BAD17BE5E7A9161E499A0EBF861DF7570EE1667D5B22DFCC7132BC1B6837907A6C33DF957837B5F583633A17208970F9512A891843C3686520A68ABBFF38ADD99C7A10F3EC66BD94E923D55D7E9B7E0DE13903C189A01852833BA04197C8684B0125212D2109214C84EC316D2B1DFBABA8F932AC749E5143B2CA4154EDDC25E49DDE8D04DD0C70337F02F3F115E9997D80480671FC4650E44A4D1A2B28709D97F087710CA77100A7754D3F83E15B85305D91BF680648358C41F547FC543915FF429A0C69E006701EB6125444060029035BF64FAA4A6ED7652E81D044C470F15853B68DAE9A0FA7DB823E71855428B2A1E201420708FA794F9C77E5079B277F11A690CD716C5E56E163643EDDDCCB1898EB67680DE34B88FFD7FE9DCC1B0C3A9C2C2F83E6F6C6F6FAF8787C7E1C38701C122222293CF4261019403C151570EEC46EC3A0BEEE80271803258F5D9B36703D601D6F05DB42323A01C22007700BA949414EC969F35AB2A6C0FFB81CDE02B68990140878DE1AF806F388003070E3839397575751517177B797941A9B373E74EB41459BD7C85B3B955B88B571E31A1299F0C70AF4ACF2B4FCAAA4ECBCB0C8DA2C4A6B5E521882F2126F99BDB692ADFBDB4E3E03C01D1F922223B57AF787253E9BDE6BD670FCFDEB8BAF3FAD5ED4FD58EDDBB7D40E5EACEBB370EA85CD8B36189AC0C3766AE20EF6AA9392FCEDDCAF48DEACBACEA4E4226C3837CD31D9E0D15C0DF843B29F3177CFF66DED196F7FF5BB88F448279AF6526D4F586E431A2CAC0BC073D3405B8EBEEBC6E734E1DF8AEB559092C7C8E692018FCF1988ABEC02CB861905162C077C3FD006427910743B2EA9D0929BAF6CE4A4F01E8867B2FB95E791AA7655164EE0D544241F0ED06638D2282D21C4214EE20F47E063282C0E402D68BBE045738E0818390320047E075D02343FD7DD741B6179E659978E75B047C3A71FFE3C19B46C7EEA41879807307B8F7B03AD5C057FE5B7007BB87DAF369EA0ECE407BCB00E521EE7F5FFFF9DAE386076FBED970C6FCF06D3FD577A4979FD10619E03BB8F8DF823B3AF0001D974BC56653C3735963087F1FDD01194292CCC01553C38A500D630B99E92D5040C22F4292A67D748B78F1C9FBF6BB2F671E7D3E7DFFCB9907B89726158E612DBEA49ED0A491E8BCD198C2DF823BEA82516282D06B8AE83BDCA7F17D2A70A70ABE0B971B2DE32103D43A448273CF37414693868F903DD05C0121D448209CC6F4494DDBEDA42035A61E2A1AFF96443F08613A6B90D45F813B9102878174E125960C45158D25550EC7924BBC89968FB44EAEDB2E8BE1592A39D3F095765359159331DADDD905B803F3CE18FF05DC7F9E69E82FB9FC69B88F8D8D0D0D0D5159831DD3BE4F4035303050585878E7CE1DE02CD86D94D1F35883324E36CB00855194C31AA033FC09980E9BC9CACA8213071B0E5C063A03D081E600F7193366C05F376DDA04DF453D3B84121212B09FE5ACB7A2E6CC99037F425F7D827DC2EF42010007005F01AB1E1717E7EAEAFAF8F1E35DBB76C1F6DBB66D535555FDF8FE434E6C52614C32393103B05E919C5D484ACAC3C582DA72C9CD59C560D8137D421DDF1A3E3C7E71C7DCA5F3B804A56770C872726C5BA2F85CE5A2B9DE63239DDB1FDE5E33FB78CBEAD3FD0F6FAFBC797ED6F4DD6D53EDBBE7F6AE992B889163C36C9BBDD8E0D6CB725CDA40465553644E0FA910E03E1091370977C8B8BF847BF60429FD3BDF7F1BEE40F67F0AEE43E145CC94A6F1982AE479695C4D995D24601D68FE6E87B2FDA5D7D6675F686EBA04FEBDC022140CFE587439B0E3E74A2EA0339AD2E6159B6BEC11F2E083E7F5D70E17D45CAF3CC73D3528B6F0EA0D4C604603D3BFDF5DAC1655B8DFC091A11384A2EB41E80D8F209E35234757507AA52301F05D6C15D2139239D95BC6FBB6AEC991DB16271F589F7B027F856DEC2FBF04F3AEB7FF7ADC7BA791B8322A58FE8054D8F2BF08F7DF6A73EF0C4C1B634D81046784BEC1F464D51183FD379EAF386CB847D9E39A263A2A64EC6B6BE0FBEF34CBA06DEEE0DC01EE43A1D9AC7959111A22C52D32AA2D586C64F80120FB5048C140681E32410AB1049202C2AEA0B48E80148A5D68F8336387CBCFCD4FDC71BAF63CF2F5A7D48FF665F641FDD8D43F843B08852608853B035B009A0A775453813B55F01528C5613F70C070E400F73C639F1C43AF32AB30E4BDE5EF1369C136FF37709F3C48107C44B2DF0F6704FA3DB847210F7E01EE909780EFE3C95583D12545EE04DBA7EFAE6C3F389B5D600E8FC8B31B778AD3B3478769FDBD7D937047FB41FEFF09F7919191FEFE7E740E2A58D095F0B1BBBB5B434303DC34986BB4C55C8EB500C451AB3E0974803E201E7C3AFC157D9B54404000C0CDC1EAA8CEC3C3038006DCC3660F1F3E0C0909F9F0E103C401F7B0080B0BA34505DA651E980E40878FF0135030400100889F336BF6AA152B4D0D8DD4EE3FD8B363E7823973972C50BC74E69CA38D5D7E4A463BB9AA21BB18B00E86BD222113DC7A0929195497969FE81BF6E98536B8F535D27367B10BC860B8A17626CDCE29C3C5B16D99C2EB7B4A2E5FB47D9D7470011F33E26D4BB23D12F11651FE4639D1AED991AE1F9F5CDBA120BD989F7BFFBC155F1EEA34117307D32AEBC3D23A7039A38915C888B5539C3B7A1721FAB9598685F5DF7CA6CA72EE2CFD59B8F787E432D35B4788E50DEE89CCC4FAF48F3E37E7EDB638F118E0EEA0A4697BFEE5EB8D1701EE8596615000A0D3428D23875A3212558C4C1D87CD2E32F70DBAA7677E44D5F58A7ACC6B8B1A87705A440633BA8081CFEA0F4E1908CE049AC35D0AA7037087103C7B6F403A5242B0700FE70BF733DCD843A139A0EEC0F436BFA4325B2CD8CC02CB40003D9011ED42E371F3ADF989FB36E79F7E39A39661EC0556D44D45FBDDDE6B6F775F21E97C65C4528609852DBE495012FC007770B5902CA8A627C2BF568003E4A9E90F61A71F32B82EA476775056BB4FAA97AADE93E5470DF65E7FBC64FFFB1D175D2EBF0857FB487C691EAD6119A76595F8D6F6B7E0DEEC16D3E99B0055255889B489C1E560958E8042566B35149964746C4826B1728C58D61B940DF506665235206C2C86CCCC6818C0E6C4E9D8C6BEB571BBF1FAABD263379557BEF7DEC4BDFB52EF81EFC7A6FF21DC4128347F84FB54BE4FD2769AD06B0D25101445D4F002568719DFEC8F9E942FE108DC632A593846361B0C41EA7693349FA669BB9DD4E411A287C7DA1BB266DAE94C6A12EEC847C890DFE10E3F8166DAF1680A929D92AA8789C585CE11F64F756FEC3A3A8F4B58968DEFD659A58CD844FAC0D0D0C020DAE63E15EEFF7FB6B9FFEA52575767696979E4C8910D1B3680B9066A03E8B76FDF0ECC85385078D5AA556BD7AE5DB66C19901AB80C21101C980EC8E6E4E4046A437900C8BE70E1C29B376F3C3C3CC864727D7D7D4F4F4F6969E9891327601BF0F2B02BE038EC198A0788204DED8A5011500441C90135067151317E6E1E1E0CDB8E9F362E909697E01158337FD1A32B2A7E368ED9517195293995099905D898ECE0480A31B935A7B4B7A4BAB3B0A239BBC44ED7E8B1D28DCD0ACB24D97884311C73842456CF5BB865D94A695E5EE11998FD9B5685FB588FF416D37BB23AAAC3BBEAC2069B0903F578667B12A32E91E86C7879FB8AC53C98651C9C77371FA8F28B63E6370FC6963405A774E2B29919F5435185D4A8425A64213DEAE7F7804063C82403701B7C1772E34D6A6A1E9D24D79F831792A7E36B68046454F789D8CA0EFFF468ADAFB6E75F181FBA6375E669D043E3BB0BF7191DBC0D1F6B5D629889B580CBEEE0F4FEF04CA4CF5C4259857DB8E7CDD7E6C755BF5E54AB75C436BA12DA3DA37BFC12068252A8611923B89CF1C8DF738228DCBFDD7BDFE335F6F85C332FA4DD59DFA9E26B440F02F72206B1B8C92BCEE78EAEE696F346876F25E839758565953BE09D6E68A96F3A6D70F82641CBAA37228799563B1C89F4A16426D78CC7548026A2113149553FEB4F26D19F17EB177F08C723CB5BBD52993135CC94E6042D27EDCD9775365D363F7CEFCB89BB3A9B4F7C3A74CD4FF575D4739342534F50C02DED784DAB368F183A366720288D169E3B4628A263F34670058C6FFAD69C35A91F0E0384FC2E38F711223234185AA1198D2E6DF68ECF32F1CAB7F005C4836D8FD6FE1CFEDCD043F575D833FD9C4F1ECC5864AED7DE8034A81620D92F9A02250A44E047D1F124208492063E42E9021FA74CB7F20F08F84B2C1FC541ADB48C812DEAF5CBEAF3CF6C714DCCD073A75862EBEC89B006CC0A924A24D6558B81EB35EDA4FE48BF64FDEF0BAD837E23FB2F0505033877245BC65620FE9D58DA15909666E615F2C1FAC909A5D56233A5313C7BD76EF275721BEEED07BE81491F056BFBCBD6F60984F07FDDE55F06F7F6F6767F7F7F6565E5D5AB5703B5B9B8B8C04743048C36EBB92932D1DDAC59B3C0D7C37A76D61890E863D23973E66CDCB8F1D4A9532A2A2AF7EFDFCFC9C9A9A8A8686868808463B0E669EAEAEAD2D1D1411BE281E668033DD403A00891909244B0BE10AA060BE72B2C98253F5352544C909B9717C3BE64D6BC7962D28BA5679DDEB1CF545D3BDA2BA83231AB2D97DC9A5ED49492DF9256D891436E4E2FCCC54687DBB9B9185A9CDABA67DB92550B25E515A5E4B7AC5CAB74FCF4F3BB0FDFBD7C252B2C22C08ED9FED3123F37D3E18E1C46776A7B7570576D20B5093B541B36DA14DD47C687596A9EFB496109076635178FC11995FA80C489942A6A4C4977447617368B99524D251503DC41003254803394EFD3F2DCBF5648B68EA904B8C3FD0F706FF14EC6AB7FB138F1487FAF4AE42BEB1C53FF773BAE02EBCD8F3FAC74888202004C3133A9BC3338A9C426205ED726E0A1AECB75F5E047EF533ED877FAC6F504240E85A4D1B1592CACE73389854CB08ABF0177B05428D02132255E04702FFCE493AAE7906DE856ED84EB0FCB4092825452ED1CE976434B63D359E323B763F51CDB82D2C80E3857D5B71A5BCFE91F52097F69DE1E9CC64CAEFA01EE55A0EF640764FC27E03E5DAC5F07B87778A531A36B99710DD12FEDDF6DBEF67EDB0DAB136A6E979FEB6C3E66B8E7BCFF2D0DA2BA718EA153AEA16BE87DBDC4375650528EE0F20683D301EBE38054C02B62E17F5D3F1C0622B8BEC8D457D1C814D8C0779679A7B4F824649B7A177D0900553886D5B9130ABFF81234CCFCEE6B073ED28B7C6156621108B50466421540BCC73F15588FCE1982D2FCFF16EEA40A744CD39188D2FE809CC1A0BC768F941C03DF52F3B06ADBA82EEF74F82B92625115AC6A285AE59A7E5EBFA75FE2FB8F35EDEBDF05498AC01DE231E56816EDF24D4935F608796FF5F4E4E59F24E74861B8B72D5BE36265D7D3D1097C9B843BE89B67877FFF23E3B9D3E9F4A2A2222323A32D5BB6A02D2D288E972F5F0E58979393038EA35D18C180C3222D2D0D767EC78E1DB76FDFB6B0B0080F0F4F4B4BCBCFCFEF652D2D2D2DE3E3E3C3C3C3101F1818F0F5F5853DC0DE383838C0E0A38F5257AE5C3973F62C80FB8245C8CC7960E167CF9C252D2E21C4C3C7378343949317E07E70C3B6778F9E473879159292C09E834F6F4E2DE8CE2DA397350E91EB8AF1F10EEF8CEE1EBF706CFD76310C872C97C0CA590BCEED3FF241E34DA8A76F567C3225376F81AC1CC0FDA725731CAD74BAEA93A91D29ED55A19DD541C38D117D9521FD15E1B5293E8E6FEEEC57905CC486D9222216F2C6A42534AD3F329F165B0A7CEF00871B47198D2F43E18E9A7754FF19B8C3CD0F7087FB1F5058E31CED7FEFA3C1BE9B3ADBAFF8DD35887963FF78C5D18FFB5501F1F9E641BD21395D41E9346241831731CDD02942DD98F4C61228DF179ACA8C2BA145648D107227A20A10A6A38A866AC76FC21D6E1EF04D20944DDFE38500F72273DFAC8FAE80F826CF682A3E772C06F19B859F036D2F3C7DB1FE84E9F13B31BAF68DBE09A5F611BE0F0DDEEEBEFCFEE035BF4706755EB1E3AC64447A942755FF179DFB74A1BF4BACECF6CD84700447C63E327FB7F98AF1DEBB4E175FE19F18BEDB721C047027BD3449D6B14AD7B3273C354AD1B1EDF28983AA0F352C6B140FE9590A649F60CDECFCABFAE13010C1F5454E3FAE0A988EF6209A882B6FF34BCAFDE49B6DEA59E34218C2678DC516F563D3CBEC43A2B52D7CEFBDB5387A2BF89E7EB97518E01BD88D36EB8379FF97C13DA60AA136B112CCFB7048013DBC18DC7AB15948A14950D9E78836F76406B604C83E8A2303FD9139F09034FCC549FD81A682FB1FD1B4AF7F175422BFD58762CAD1BA51BB5762A2814B90EEE7576794B7CA2F94C170FF3477A185BE51535D3DF00D280E7CFF1F853B2C434343C068F0E0F2ACB11E67CE9C092C06AF0D261D22E0D605050581CB6BD6AC01A63F78F0405353D3CECE2E3636B6BEBE7EB25725D0BCAFAFAFB5B515FD88AEAFACACDCB46913EC07F80E2507D400962D5BB676ED5A003A605D61F1A2454B1603E5E7CE9E232D2925C22720C0CEC58DC18079BF7F4939C8DEB5382EB536A3A03EABA82D8F5215970186BD3BBFBC3A29DBDFDC4EF5F09995D273E43805E60A8A6F5CB85CF59CD25733CBECF8E4EE869689411A9331B266D162214ECCA259E2A61F9E3650A2075B92DBABC23AAB43861BF1DD65C12D790159A15F3EDC3CB95E9C7B2927E6E83C45B227AE9B90DB1C980C7067A65603DC878945E38915603951B84FF21D1DAA656A86FB970B6E7EA4834A6411D87606B1A4E873A8E3955740769D1D4A511A365926DE5A9B2F5A9C7C6078E056D9D708461419B6F4BAF336ECB921603DC5C0A1CA194B27E68DC714F587A58D46E68D13BF911D6CFB283E771CB84C00EFF3EB70075B84021D2253E2F9557611C5167E79269E65D6C19D0149C8E834B100A692E40FCE66C7EE3CFBE998E5998771EF1D6B3CA2C90E11111A96FA87AFEBEEBFE27443B3D82E8C462C42CA48422133A1F2D7E18ED2F68783F997EA3BD327F5FDD7FB0272C608653D7E593E37DE03DCAD8E3FF1BDA9976DE06CB0EBACD6FA43DE375EE09F1A44BF324D7E6B13AB610188EFF54F64128BE958A806B19A475092B2AA38BFA2E9878108A999C55631136A80E9C0774816E07BBB7F729EB95F9C8E6DB97D785F781A3532072E222D2AB7D987986FE90DCEDDFB86B6EF4D9DEC8F1E8075665C0570BCDB2FE55F06F7D86A6037331A0981EC28E22BACF07986FE80F846A7385A581198770841E304802F6C3CFDBC7E4F53C1FD8F68DAD7BF0BCACBC9FA108DD5CDB4D92D365ECF21E8AD85F6A55BFB1557CBCFE05B2C29AFF3FC554509198C26507C9445F69FE10ECBFFCE4C4C00E2848484AB57AF027CD16E33C062B0EA60D881C88B162D3A74E8D093274FACACACFCFCFCF2F2F2C86472737333FA2614BA305833D242A4BBBB1B5D333030807EBC7BF72E1418B043A81340B181C27DE1E24520C5258B172F5D0291F973E7C94ACB8809080973F10A73F06C5CB64AF7C9CB546C546301B936AB90929459918CBC9A549190991546F4B5FCAA764179CDCC0512182E310CE713E55B469A3A584FBF8ABC226A470F933AC21C668C0E0CEEDEB8498C9763A6188FB6BA4A796EC4604B4A572DBEBB163B58876F2F0EA84C768F74D27B7474CB126ECC5A01DE5B9B777593B287624B1AFC12C0B63333EB3BC33387A20A51B8237C27144CF2FD3F03772AAE007E0B6EFE016C4E8ABEABC5C9FBDADB2E1A1E54A1D8611B3D638D0FDFB23AABA6BBEB4AA6B167B377429D1BC9FECA73C2EB4FC5D6FE4DDE24E00233A57C8498DFE44904DB3E16950F581F23E48DE07268E1998CF04C5AF86FF69B1E0ECB45810E9129F11CF08CE0DC0BCCBC6B1C22FAC33290D169E2C8F4A882480D8B0F7BAF3C5F77F4EBE567C9462ED51E5115AE7888989DBEABB357C9F2FCC33453F7FE881CE03BA41E331E794A863C28FBDEEAFD0DB2DFE2D30FE65FAAEF3F374DB1558321B90C5C71BD53B4C379F5775B945C945EE39E9855D9867C3E765D7BE311A78B0F026E6B01DFC1B327BEB1CAFCE0D81F98CC8C2E1DC1E52158070F0E21F2BED8B49FFB3D4D853BF25430A172D2B927EAD953EC425B7C635AFD6201F1CC84526642F14044464F40729A9EB39FEABB88C72685667EAD1E71FD4119689FCB7FA573876B1155819874A8CA4494D67E25E57EF42B300EACB38FA6861602DC81F8A0FF22DCA1BC445A0B5911C89F03C159758E51246D9B80379F0CAE3F3AF7D38EF9DC2273F844D5546EE767668F8F8EFD2ADCFF57DADC8787877B7A7A1213139F3D7BB67CF972111111F0E9006270DC7BF7EE555252029FEEEAEA9A9696D6D2D23215E8E8026BDADBDBABABAB210249565B5B0B7B03175F555505150288C377C1EF83FD47E1BE78F1E255AB562D5CB8103CFBC2A54B962C5B0A9105F3E6CBC9C88A0B8B08F3F24B0B896E59F593CE13F5A4F0C8BAFCD2AACCFCE284B4D284F4BEF2FA6C5C8CBDBEE9BDB397372B2C9BC527B248426ED7AAF589D8C8A2B4ACAEBAA6F1012A609DD137D8DBD2DE5E577FF6F02169215E093ECC933BE78BD343875AD3FB1BE3FA1B8803B591CDF9014544471F93E757B62C5B3003B34B4E56EFC2B581F882D194CA96A094E1E862667A6D0F2E874A2A1E89A34CC27D92EFFF29E75EC020168FC590C1D0115E591AECBFAEB7FBCAD74BCFE1FE2FFB8A7DBB1D01FDCBF52713F51C81EC50916F0F4CA093F2994994F1B862A4E75C2299994801F3CEC0E720E6FD3BDC9196776C16B8CEDF82FB6048360A74884C8D179B07E49B7A157EF2A977260C456433E32963312543B89CD02786EF765E7CB5E9A4E76DED2C0BEF1ACFC83AEFE8528730AB4B8FDFECBA00FE9DA863DD15924E271543590566FFB7E13EFD48FED5FAFE73D314578DBE61546211627EF89EEED64B7EAAEF13DED835BBE1DDAF3ED1DF79C6F2A8B2C3F907118F3F00D651B80F04A54C87FB6F0CD908FAE1301021708FA9449B65A06686B6B9A30F540B3FFBD7B945B507C483BA4392C1B98FC6E44338412AEE0D48ABFE8ACB3270C73D3105C497598532E32BFF6570471EA8025591267504EEA42A30EF60D801EEF94601407996612F1B0ACE07B8B39A65FEA4A682FB1FD1B4AF4F11F29C1FD290952D7B03D2ABEC70780DCB004D33F37B2F6FEF3EBE5C48062AF42A672E66C4278D8D8C02C5279B65FEE71EA882E3067F5D5252121010F0F8F16300FAE1C387C16EBBB8B8F8FBFB474747171616363636F6F7F7833D876ACEB7AFB1DE7485EF02D301E56D6D6D838383B01222030303501598B4F045454550278002031679D6B44D4B972E9D376F1E787620FBD2E5CB20A2B84061A69CBCA4A898089F80AC88F89A854B1F28DF0C75F326A7E79467E451D2726AB20B1BF24BFD6C1C554E9C5B355B619680D8EA790BEF29293B7FB669AFAE47DE461B66301963A303C37D1D5DDDADEDBD2DAD2A172FCC141712E2C0DC553E9E9F1C486DCB1E6E4D196E4EECAF263564076687DB3AE93E3CB552613E067362D162A7675A1D9119CCCC3A60FA20B1703CB9B23F321F213BB16888900F9A0A773A01D1D4DCF62F17DCFC507E8C46178F908AEADD89010FDE03408D0EDD087CF8016EFE6A67BCFEBEAB9F4FDF37D87F0D5C1E4016793D1D689E5C0621D876E00258BFFEB0B4B1E8423A2E1BCC3BC01DE53B688200AC477ACBC0AFFCA8BE90AC512232DC0244A6C6F38CBD730C3DC133363813A9F85C803B8358D8179611F848EFED8EB36FB69F097EA25F681B50EF13D51A94D01C10F7F5DA33AD9D67DFEC3A17F6D2B8D51F0A9E42D81E8E93C5F76F3FFD4BCEFE2205FEE5621527C8535C96BEB50B21054C4215549206C373330D3D3FECBEA6B3ED62C823A34C0397762F62F8A3771647AE19EC3A6BB2FF32C0BDC0C423EEB5E5A473674440AA22CD321002DFD1CE453F6ADA61A082731F23968DC720AFECD258E3F300E21B3C62D20DDDCBEDC39BBC62FAB1E974621E5CCA217CD6103E03E03E42C8077C4F104B01F199FA6EC1F7F4E3346DE05AFCABE00E669C1E0EDEBC74145702112609284F697689CB3702B8FBD5D91319D82260FA70481E35349FF54075FA49FD81A6B1FB0FC54AA51FC58CAB800CC98C2D87B03738B3C32F8562131EFEC2CCFFB5A9DD63ED17C72F6F909A27338357E9D0892462CCC408F24EFEFF2EDC61A152A9687339894432333303AC03EB81CE93DDE16181386C000E7D74749446A3C1C7692EBEA1A101C2AEAE2ED81B4480F850188073873D3F79F2041D1512E03E9F3595C7ECD9B381E94076444B9702DC67C9CF941213171110141714569C39E7E2B15300EEBCF8948AEC829AFC92D6B2EA143C49F7D9AB758A4B85301CD2FCC227F71EF477761F68EDEC6FE9A0F5F44F0CD34786A8433D7D035D3DF48121268371EF86F21C295101368CEAE5A3B98981F48E7C7A7B16BD2DBDAF32A63E333823C4CE56F3FED1257301EE1757AF0FD233AD0F4964E6340E918A06A20A18F11440FC5842F9008BEC937047F9FE1F813B65945434165B448F2AA8740AF7547DA3BDFD8CF9893B91AF3F5538601BBD88007793A33734369E4CFAF0B5D133BAC133AA3B3465109F35115FC24C296790F2BB8293FA425301EEC3E119C077A4A99DC577101379B8CA6A2CFEE1CE01C10D83021D2253E3D91F3DC0331698FA36BA9050B8C3B181B50C78A80BC7A6B3EB7CC42B23B26370A37F546758524F44AAE38DE79A3BCEBCDA7A32F0A97EB36F1C23BA080AAAFF2ADC27C93E05EE700C89D5E82B5A29EF9D81EC3ADBCF639F9AE6987A02DCA35F19DB9EBEF576D351DDADA7704FF44B2D7C635E997F833BA904E03EC6EAD20E21F01DEDB9F1A3A61D062AF8DDD128B8C4C8F80DC34815AD04100F35B0540357B26D48AD6BE4B7F1C292CB00F10C522E4446230B0643B2E811F9C0B5A1D06C286BC31F1905DCD6FBD7C01DAE32AE04A83D12510CA285154CC2BDC0D81F047087F5B012B641FEFA9FEA0AF9A3A6C2BD2728A3DD37B9D42A34F49949E06B53A7E7BADA6755B6C92F94C3F09EDF7724014F1C67204FFE00E468CB0CC01DE5FBFF10DCFFAD0B78F9E0E0E0D3A74F0B0808707070CC9C39136CBBA8A828D25B0699491B996D75C1BCF92085B9F3406202429202C24777EDF3B0732C4CCD4C25C646874664C4243CBB7D7FDFA66DC21C3CB3C5A5351E3D4D8F49E8A86DA476F7316923CCB189312A7D844A638E8E0DF70FF4757503DC9D6DAC84B966F0CFC01CDCB12AC4DD9C3958DE59153FDA9133549B5212E3958F737F72FAC04A7EEE752222E757AC2707447693727BA3F2C1B04F0AC80E1A8BA38CC494A2DDFEC662C8089B5883E8FE22E3FEAB0570A7117298C9E4DEB0D4B8775F80E34F56EFFD7CE66EC167AF3A77423F36D5E1CA53FDFD97FC1FBCF3B9AB05FE6E34A69046CC03A18FE040B012F6001A8DCC03A19E7DD2B9B35EC22A1D0330FD20B8618623F291915870052351C8AB2200BE5A6722B8C566B71808CBADC39889E58CA882BEF0B4415C261CD5FBBD174C4FDCC0BF36A23807D57A47547B62EB7CF0D1BA5F2CCFDFD5DA79FAD3995BB1EFACFB115A55F686A64375043446825FFF4553C6B41498D4D49E2753356DB33FD4AFC0FD3B2FE048AA1D09F6979E3E5979C0FAECFD4C23378A6D50AB4724F9B397D7F5E7EFB61C07E7EEA3F22AFAE5A79C8F2E15D64148B30CA964049747C7E621ADED24F27068F6E4817D3B9D3F7AA00ACE9D99580BCE7D22AE9C995C43B60D0F7C68807D6E566C15D8EA1BDFEC138DBCB894530FA57567503C33A1948ECB05B2D358E34DA211607D7F500600FD570587843E0C1881EB88035893E123352C67145F088202092D93263575AAC8A96A708C2E320DCC33F405BE0F05E74219002B913EEF3F9CD41F885436862FA687E733B005E8400810190EC941DEAB8A2E67C65531891488A3AF5CA1FD61262FD05431A0B6945005708738F0BDC6292A5AD3069C7B9086A9EF1B13ED3337F6CC5E3A8B8D7F9E9084CEF357CC51A4A50185FBA410B8A36CFAAB2EFFCFC0BDBFBF9F48245EBB764D5C5C9C9D9D5D565616602E2727076447C45A14E6237C576449909B57945F70CB9A757AAFB470FEC1D161B800170FE72FB66B162F5B327781C2ECB9A78F1EF775F76CAEAD07A033E1DA31E07A3181ECD48141A8853186A983BD7D1374BA979383A4003738F7BD9B57F8399A4CF4567456268D76140C54A516937C52FD1DEF1EDEB99C977BBDA8E4B5F53BCA82A27B63F2FB498560D827351485E847B8030BFE43704F2A851B3B4AD3CCF8C835F5F5876C2F3E28B2F2A971C5F686253B2B3F03B87BDFD174BFF9B22F3C05CCDD34B823FAA7E0DE17920564875B0842B87950B8C32D04B6BDC1990861F5571C33A18C0EE51F361D9CBBF9C99B7A7BCE9A9E5026681A95B904D5F960AB3CC26ABCB0A9A60EB657D400EE26275548DA9F51B8F784A4FD97E00E34FF75B843513D8CCB29B10AB439F7E0F99A83F6971E155878D73985B7B8E3285FBCFD545FE96D3B69BC4FC9FDEA33C25323B0EDD576A183C1A9D3E00ED09C3CB06FA7F347704786688EAF06E73E16833C87C836F571BCF2D2ED8656A6B17B8B4FDCB7C17ED3ABC6E38AE1FA3213C9E0DC27C10DDE1C42E0FB7058CEE4CA696280C78F46461942698E0C37144D819553E1FE33DF0908B27F553FC21DF4CFC03D8A0CD4069A8350BE03CA81F5B01279F5945406C7006B90775C49ACF1067E07EEF1959370AF768C24BDB646E11EF0C654F79CEABEB9CBE7B209CC1310D77EAA3E4E63001CFE86FBBF6B811A504E4E8EBABA3A187680BB8484C442D6329F352E3CBA00DC151728A012E4E59312115BB240F1FCB1939F8D4CC3FD02EDCC2CEF5CBBC181C1C84A4A6DDFBCE5B5FA4B1221B2AAACBCADA919503E4647AE1F834647C691608C8C8F8ED186A9E30C7AB8BFEF5C6931610ECC96D50B9D2D75191D94CE8AB4D1F6E2BEF2F4626200D6D65469CBFAC51C5C9BC4E5D4F69FAA0C4D18882B198A2DA1C6FC2C5A34A2FF16DC195139CC84C2462F7CC813DD8F072F696F3FE17AE359898D4FA553707748BCE7AD971FF69D77B9FED4F1AA5A8B6F142D2A7B12EE937CA747227CFF1DB84F8275AA68D87C1452682777389881E02C74F686EAAFF81C43CF26D7E889D8522A3E17E8D3E019657254F9DDAED36627AF13B54DAB3C42EAFDC22BDD832BDC828AEDFDDCEEBC7CBBE79CC191AB380DE39EF064664A794F68CA37B8B3C43A866F9A7AFA533509CD699AB6D91F09EDF8C87A5B6A7AE71C4A4F4072A6818BD5C93B5A1B8E7AA9BCA8B00D6CF38E6C7409AFB0F10BB9AF6DB0EBACC1AEF3F6E7EE87DED74BD1B16D70C20D87A603DC47F1F90840FF59B80F85178CC754D058D35A510985B16FBF1A1E54313EAC1AF5DAB2DE9D384CC886BA17D876803B9D08C53C659C5834F67D727334C5D07698DF12201B0888021D71EE007720E377B84FE7FB37B8537E5483636C9169709EA17F9D7DF45030B0B874148734D04F3BA33F14501B503E18940502B8A303154088C09D1581BF8210ACC756225EFE873DA0421E63A0A3E3B15E9C863C19FDCA0A6A3CC1AF4C83B4CD0C2EDC39BC60F50276A1797C625A0F9F222DB47FC3FDDFBA343434585B5B6FDEBC99979757484848515171D5AA5500F749BE03D3172A28A29214159B252B375B466EF5D2E54FEE3FF474707EAFA9BDF9A7F5BCDC3CB366CDDAB061C3C58B17355EBED2D3D3B3B1B28E8C8CECEDEE41AED5F8C4405FFFD8085C3B26F07D8C4E4B2446AE549C2BC63D63A5829CB9EE8B8186E2CE8A8C9156723739AD9414EAA8F3FAF0D2C58A3338B749CFD1BF72BF1E9F369C48A1255018F13F6B04B01E47F96FC17D84983B1E9F57EE10E8AEFA5C7FFF05A3234A818FDE9639F897D9077406C704A9E97CD87FCEF6E23DABF3B700F7C384747A742E9D948FC21DE53BC01DF45B7067FE06DCD16780101945078025512647F7267F0EC937F1E9F64B1925150D45640FE2324B6DFDA1E0D1D975D2E28C4AFC078B067F6C7310BED223B0CCD5AFCE0717FCE2FD874397F50E5CF27FA4D3E44B642694F686A5FEC5E00E282137B8E0892FCD2C8EDE78BFF374F003ED5AA790EE80985A87E02ABB00C2337D93FD97DE6F3F6371E4BACF8DD7F19A9FDB3C48746C16C01DD2106DEE8094A485E74E1E189A8CDFC8FEDB70EF0FC91D8B2E07E70E701FC0E6E25F5ABED97A1EE47BF71DD936042E1F83847492198B2D62261403DC2748DFC61840DAD3919E97B07332C4A7317D52484B3AC09D580A05CF640D038E138EF947BEB3DA497E1DEE8D4E71C56621F946013FC0FDCF3D2681F203D83D149C4D0DCD859F43EC39109CD55683C4A3C8B4B03CF813EADC91953FEC011572E963CAD174862C5A61838D7A6119FECC3444DD245CC7C2E4CAC3538BD62B728ACCE11151BFFD60A0BD0B85FBF8DF70FF372DC3C3C3515151972F5F969494E4E3E39B3D7BF654B82B2820861DB0BE48712148525C425A524A888F5F4244F4C881836F5E6A285FBA0C9E7DEEDCB9B2F272C2A2226212E272727210DFB871E343B5477979790CD608C6542A759435603D2C0C3AB5383B73C7FAD5927C1CF3A405DF3EB9D55999D3519EC968A174976696C5E2F4EFAA6E96955B80E1DC3B6BB1CB4B83F69882BF16DC634BC76272476232F32C5DADCEDFD4DB7BC6FA826A949671954B20C5DEAF339804F18F87CE5B9CBEF1E9E4D5822FEED4A86F7007224CF2FD9F833BC223641443648828B4BF47877752B179608945509EB14FB17900351C769B3F109E3984CF4A3374800A04C0DDFAD2AD74539B8E7052279658ED154871F16D0D8E26BE33373FA7FA6EFF39876B4F8A6DFDC081A2031C82BEC19DC4D27F17EE31A5A59FFDFC6F6B991DBE0222BCD06F700DEBF22701D9EB9D4213B52DBE1CBFA1BBF594D1DE4B6E979FC76A58F4FA278EE27301EEE391081C51B883239E3CB09F93F18FE00ECE9D412C01BEF78666853F33D3DC7C566BCB39C72B2F52F49DFAC2D3209520852164A650A05C449DFB28A1087D5E8A26DAEFC19DF5ECF167B8C399124B8743B3D126F849C4FF21DC9B9CE3A7C11D041BFF13701FC521C399218DECACA7A610190EC941DC3A503EB6126DA501B8C396B07EDAD72785A62D601D921A2A97942FA18467E6D8A7A6A1EA26B8779F3FAB3CBBB862EB121EF1399C424F946F75D437FD08F7C93E337FD9E5FF19B8A3C0ADA8A878FBF6EDC2850BD1E17FC1BC23CF52BF2F539D3B905D808F9F1D83E162635FA2B870EFCE5D60E1B939B966CF9DC32B28809981E1E0E21410128408BFA0C0FA8D1BBE3AD8D737221D75464646263BF0D069C34D5515C7F6EE9015E29112607B7CE37C53497A475916BD99D243CEA94E8A7E76F6F4720161050CF751C5B55116EE03A9E57FAD6699D8D2F1D83C3A293DE5A395C1C1733ABB8EBBAA3C86789D476899836F574834C44D8E29991EBF6C7CF45286891D9D94C98881ED11B84FF29D1185E84FC31D0E20A61C984E0DCF03BED3230A9A5C6358A30386667C70237F0E069C816DEF0B4DA546E644699A00DCF5F69E72BCFEB0D0C675283A6980185FE71B4C71F16E0922251B7F7554790A70373A7A2D4ECFAA273469089F01B402FD05E0CE5ACF1AA437EDBD9DFDF9072607956CCFDE8A7F6BDAE81EDAEE8BAFB4F56BF5C0E71A393A5D7CF06107D232E3AAF42C41EB0B352C03E971145D3A11853468A07007564E1ED8B764FC23B80F86E503DCA984C2C188BC76FF9460352380FBDBED176DCEAB05AB19D4BAE121952085E16A3293C91002DC01EB0CD6F064C06E94F253693E4D886D8FAF846343DD3AB07E22AA6420286312EEA09FF9FEBB702FF9140A70AF778801B833B025A07F0EEE20C498132910190CCA6A7422912D82EBEC2311947F6F7387086C037F9DF6F59FC59A681B7226243584E039704FCC00EE212F8C2375ADBEDE7E75EDA7DDCBF9A566B10B3C50BADE505EF5AB7007FD9597FF67E08E767807F3EEE4E4045E9B8B8B0B1D1C18F83EB94C221EA53CC07D060623C82F202F2D830C28C6CB076B44C444798404E4E6CE3E71E6F49D07F7B7EEDC212C2E2622217EEDBA72524A325CBF91B1D181A1C1D1F1B1F1F171807B7F7BEBC51387E545F804D931AAE78FD5E6277594E5D09BCAFBCAF21AD29254F7EF57E0E055C4F09D59BE39D78B3092DBD01B5DF8177AA01A5BCA8C2FA046A5C6E898BED97E447BC751DFFBAF722D9C1ABDB1E58E7EBDE171F99F5DCC4F5D03B21B1EBE906CF06524261BE0CE882E40E18EF2FD9F873B6BF0EE41D664AA10D6D81352DE3941FD37E9AD4399551833B11A6C7B6F480A2D2A37E489AEFEFE0B1FF69F71BFFDACDCD9772C398B1E9FDA14185EEEE653E783CDB470F67BFC56EFE005CD6DC702D4DE36FB106951D9FF6DB8B3F83E05EE7D41A984E786A607AF1A1FB8E476ED71BA8155B36778AB77448D7D606F406C858D9FEFCD9760DB0DF75CF4B8AA9EA6FB750497C31A9F07813BDA1D05521210397960DF92F18FE03E8C854428EF0FCF01B2D7B810BD6FEBBEDA704A67C725EB738FBE5E7A9A6DE60EA934125D00D79199500C161E85FBD40E33A8A6317D52E8B101B8C1AD03DFE123F8F70EAF04A864A0ADF0937047844CE5F1EB706F764900B817180702DC0783F250B88FE24AFE2CDCA1FC409B5C00EED4D0DC1A3B7CA2D6D7E03BFA383553407C7F40062D0C765E806EF03BCE1D04890C9E03FC0784459F02B06A2600F7B0E7C6C4F7364EF7B56E6ED8BF525066261BFFED7397AB4B287FC3FDDFB8343636A291D0D0D0DDBB77A323000B0909A123C5C3320977B4FD7DF3C64D929292FCBC7C7366CD9E29270F9407C9CACAF209F04BC9C902D9FD820273F3F30C0C3F2A2C5484BFAD5FBF3E383878823514654F4F0F987764787EEA30BDAF5BF9ECC999A2FC7C18CC9513FB2B7353DACBF268CD95FD15258D59695776EC9A83E1509CC17F61F5F6B2D07866514B4FD4B7BE8F93427BB803CD47A3BFC17D3C9A3C11F39F803B328C707CC170644A9496E1AB4DFBB5B61D0E7AFCA6C8DABDC927A2D239A03722BED4DEDBF2DC0DC3A3173F1EB990A06F391A970B70071680BEF19D45F6DF813BF0746A2719D6A8B388D0B7258770F93D2199BDA159DDC119143B6CECDBAFE57611B16FEC2836E1CCB4FADED0F4EEE0546A54AEEF03EDF7872EBE3F74C1FDBE7AA567C84466212325AB310447F1F02BF70AC9B2760FD6D07F77F8A2DABABD60E1ABDC23E8D1B9230077B4CD1DE92DC3EA648DF66E9E9602DF3509CD699AB6D91FE987DE3248D70B0A14A22DDED1FEF7B4F5769F313C78D153F559B6995DB34F78B37744B573703F36B9D6352CF0D15B93C3D70C0E2879A868A41B398F10F3C7628BE08BC85920B38443EA95D2229119A950A1C90869880A7D23F7470DE3E162913B83D2EB3D624B6CC25C94359FAF3D863A77D3A3AAF1EFEC00EEE3B1A50077748C20F81546641115973F844526E046450557FE03D641C06B4039E09B1A96D3179036189C0940EF0F4C6F708A9A0AF79FF9FE9B702F05B8979A871418FBD73B9006837218D822100BEED352F80F34F27DCE2F08BBFD52738DBC7D6FBE333F78DBE2D01DE2734BF0EFDD3E2908D359E3B603FD614BD6354234B91354B007744877807BA1997FF8236314EEA40FB62E0FB555371F5C25242B3F834FF5CCA5CA8212B40906C53AFA2AD3E8F7DEEE7FD9E52F077748AC5F159D313A3A863CC4A0D218DE3E7ECB96AFC460D8E62D982F2A2E2637535661E182A5CB9780962C5B0CE1F295CB1414E6CF9D3F878F8F0783C1707171080AF2F3F070C1C7D3A74E18E8BFCFCC48A30E0F0EF4F74660C34E9D3CCECE86111116D4D2D4686B6D8622B9B5A5A9B7A70B79BACAA00EB63525E24280EC423330ABE6CB85B8DB8F75B7F537544F74B4BB999A1C59FDD3DC19DC2B05250CAE3FA084C4B4937268D1C8D8D03FEA1BFB5871C855DF4C1964321449FFB8A2E15BBF261470BF14F859807BAD6B68E0C3375A5B8EBCD97E8CA46DDA1A40ACF5086FF68B8CD3FF52EB1D9162F2F5F5AEE3BA87CE07A8EBA59B3BD3483983D80C667C2933AEA4C33F7E383C839958C6C0E74CC33A2A807B5F58563F3E0FCE7A3CB182995C359E5C399A58CE88A730B31BE88965D478F2447ACD703CB9C4051FF2DAC2E9A656C19740B26D588347CC203E8F1157D2199696FDC53B44C34465F936DDE357C3F53E3560E3988595CC929A81F482266242BA9367916F48B4B98D99F2BDE77B8F6B1D3AE7FFE243634074B507613C9ECC4CAD859B7324A270145B301E51C28CAB9D9E5CDF35109859EF1055698DEDF04C44AAEDAC9E1510A2AF0881603FA8E0EAA0F8F8510820E2ABDBFDD2A0C44246E94AA818211541E1D4159A986EE26478E4F28B0DFB9D55D4528CACC90E5ED55EC135DE21750191395FBD8B9C02922D9C2C2F3F787FFC9ACB5D2D7FF58FA329949154CA4872193D998224540205D26A38AE7424B9622CE9674162A2421EDE2494C19A89946F894C8F2353634A18B164507B705ABAA997E75D5DCB330F0D0EDED0D9A5A4BBEBB2D9B13B40AB460FD228B1848ACF1D0ACB0433810C6A44446617014DCD9CDF2A0A3FA41BD2961D5B01E9031C841C0B35B0128B20A881E59BF8B67B25227998F55812AD5E80AD1E89281EC3968E4790592A99C09522C2170FFA67557C0ECDD5F7A8FC12D6EF973A0A548D408A846929FCFB82F4A7E10BE0A243C9D4E81EC34CAA2EB30DFFB0FBAADB150DAFEB6F82EE7EC835F484120876DBED9B3C1C94C94CAE85C20C4C1508A92EB34C15AAE1B01CE4A90F36AFD73FB5C8CC0FF7D824F0B61E56CD385EDFC1F1CE6BC247DBD727AE2EE61693C6706E54581A1914C6446AF2E32313E30CE6388D252A2B0422FD6597FF67E00E4C47E13E36CE8CC011B66DDFC9C1C93D73F62C1131615979991FE1BE68C9C2F90AF304850566B063B879B944C54556AE5E71F1E2792F4FF7C4D898C6DA1A70E5437DBDD191848B67CFB06330A282022F9F3D6DA8A9668E8F75B7B70DF6F6302710B8533B9BD388E1C2407F76CCD239B2BE4EB6F48ED6FEC6BAD1F6762723E3032BD6CC61E35E2B2A637AE7710536B68394C500CCFDD21BA2426F9EA91FFF53702FAC720AF2BDABA1B5EDA8EE9ED3717A96ED41D1C0F49620528A997DBD3F21C5DC51E7D0799D23179CEFBF8CD4B300E73E8CCB02B203DFC1E851B199CCD892B1A8FC1F9D3B081CFD4452252D81D24F2AECC2E774E0B23BF1395077E98B296A0849A9F08FAB094EEA24E53713B2526CFC9D1FBF373EFF10FBDA3246D7BEC03AB83538B58F985717181F63ECE0ACF6F6D5C18B9F549EE24DED6A70098CC20A6655D344793DBDB822D3DB9F1C8A4D7470B57EF84CFDF019F503A7DCD4B42BBC70F5BEB16371C89B3BC361B9C8FBEED8E2F170404C2533F2D793B4D72F0DAAF0659F43DBDCE3A1DA3E8E74DA43BAEEFD59B88389EE0DCB86926934963C12533C16573C44CCADF38E8CD2F9A47BE09CFA9643AEB79FA59AD994B9F9370486D7054674C5A653FC71E58184145B7743A53B2FF69FF9A4FCD8E1E19B9EF87C50775C41576C7E674C413B29AF8D98DB1E95DB4DCCFF557510723A2373BBA2F240106FC166400AD707268DA5568DA755F746E5E75907053D377150D6B0BEF4CCFAC293B73B2F191E540978A05FE31489767644EC393A29E077B87FAB22FC21DC59239EA3701F08CE42E19E67EC037047BEC2EA5688E667D80C794C3A0DEEF862D0807F3A0BEEEE955F42FBFD9247B1B9631179A3F8FCA9C9FB8782F487BA2F33AD16AA382D3E09CCE4EA2A27C2A7A377DCAF6B395E78EE7B5327F9AD3DD42AA09201D50B5A08F2FA15607D24E61BDC51A170475BA5A0F201C540A1A92FE1A959D85DFD882746B11FECEDEF68100CED344F5E5BC62D0E705F3F7F71845F1073F41BDC27C93EFC37DCFF55CBD0D0103A60242C595959D7AE5D939494949090101111929595069FBE74E962D092258B962D5BB262C5B2E5CB972E58304F42428C35B03C8FA4A4F8850BE74242820607FA00DCFDDD5D40F6E1FEBEDCCC8C07776E0BF1F10AF3F3DDBF7DABB4B080393A027FA20EF4A3701FEDEBCA4F8A9115E012E39EA1202BE9FCC57CA0A91E446D6AB2D17BBF6BD13280FB669939364F5FD74525FF35E15E6AE3EDAAF2146CBBF1D1CBA94676DD61F10D7E84B690985C1B8FA62062C617D74F176FBD3F71F993D26D4FB537C80355226B26E5443284007A7A642EB07E6AE3CCA49016F9A47240796B44665D50526D60622336BD2BBAA03F890CA86A88486F8ECAE94D224318F7D9FBF31D4DCD63375C1EE8866A5AE6DA857443519159D549CA4DB1F1F67865A07DE686E5DD97612636C5C151DD598523E575CCDA1666436B7E5058551429D727D0534BF7ED992B4F761FFD72FD71B6AD4F47581A3877A48B48403A3286099E8CC01D4FFE2DB8777A25555885977C0A6C728E866A3BF2FA226BF6B83F0B775A641132E5266B64F93E7CF6781279302A27DFDAC7E3FE6BCDDD2740DE6AAFB3BE3856FB85B5E3486DF898CED8747220BE3C242AC5DED340E98EDAEE13C6D71E393C7E3B9441010DA6970DA451FA53CAFA922990503D89A503C914D0604A196828B57C38AD02555D786A232E03CA80DE8412584FCBA8A267563332AA07E34B07634B6AFD1388EFEDADAFA91B9DB8637AFABEE53935CDED17C0BFBB28BF2EB60A06B70B58A7E2F2FF09B823EDD731E523F82214EEFD4199459F0200EE39865E6D9E09C8575813B3A0591A520FED06338A23B3843C32653D652DEEF34F879235DBC0BDDC2AB4D73F9911913B82FB67E00E7466A6D64CC4957507A733132B9BBCE29C2EBFF456D5F97CEC9EC735CDA8E7E6F0138DCE445A782E540E80F293709FE43BEADFA1B443CA3C5C419B475C9E9117F18505FE9131FE99498C9E9DC36D8D28A3AF902157F24901DCD7CC560872F7FE11EE7F3BF77FD9323838383992437D7DFD870F1F962D5B262020202424202D2D397FFEDCC58B1702D9418078203B68DEBC39525212807541417E2803AE5EBD9C99990EC806CFDED6D408A20F0D36D5D51AE8E9CE9D292FC0C30D161E4CFD288D8A34B50F0D32C74601EECCA13E4A4E9A82ACB88C20F72C31214B03BD8EAA7270EE3D353566AF3537CD590070DF3B7F89BBB67E5B5CD65F11EE317959260ED6176EBFDD79E2CBF95B799FDD7A70490D0191CDC1A462E780A690E86C3B4F77354DB3CBB7758E5DB4BC7ABF2B3C197DA00A9E949956498BCA45068C650D4EF2A3864979807530E6AD5139C09DEEB82220D4605AC5506615B3BC8B51D040CDAD05D54765614D9DF5AF3D79B4F7BCA5AA86F72B930CFBE0EE84126669CB604679AE1736D0E0CBA343E7F4551F07995A1762491DB945C315B523B54DA3F54DA5F8A8DAD8B8A2106C98B1B9A1F29D7BDB0FE89CB88A7B67D11F993B915C4E25147605A48DE04B98A40AB08AE0DF918106A7A5184BAD6E71648BE04213BF7A87A881C04CB43734847F16EEC864550995601EC1BC7784A68E26947485A792F4BE989FBFA5B1F398C1F1CB219A1FF21D3C9AB1C4A1F8D4BEF8D4FAA8845CEF90D26042BAAB9FD9AD272F8F5F8232CCFDF5C7814C0AA83FA3AC2F9DD2934AE94E2177259782FA52CB40FD69E503E9158319959092C359D5A0F290C46A6C6A635476477C516F0AE5DB5FD32BA124E8892DA2781283352DCC2F3D31BBA0E6FE402F5CEBB3F69ECB1A5BCF7D3EFB28CDC87D009B0368A34721B308D0FE24DC919783580FC6E9AC798BA0282D30F503B8671978B4B8C7A1D918D00F0908F1FF00DC01EBCCA44AF0EC8311B9E3B194AEA0B4904786BEB7753F1DBAE57EF575D8838F2475CBB22F2148EFD2C89276CFF8115209DC9228DC51BE03DC41A3B0413405E05EEF1899F1DE25E6D597E8E716912FCC48EF6CEC6FBD229938E85EB8B5465016E0BE4C66B6A79D237304BCE518637C8C3E3146658E0DB30491BFE1FE2F586834DAB718CBC5070404ECDBB78F9B9B1B8C39E07BEEDCD98B162902DF51C403D901F1B05246464A4E4E06C8CEC5C5B173E77627270770EB60DB81E920E0785F57E717F34F0BE7CFE3E160DFB76B67808F37D8F68911066378689C41678ED098F4C17A72C1DA450B6649084B0A70EBBD7E51535CD85357DB42A6BC7FFC74A5A4FC6C0CCFC965EB438CAC7A520A3AA332FF6A701F89CC8CD136333C8CBC22E4A2F2946CEFD78B4FAEF72700DF2BBCC21B43A3F39C7C89865F1C1FBD7AB1EF84FE19E56287406A743E352A7720329B995D371A5BD41E98C04C29078EFFA881E8BCB6E87C60133DBF7EA2B475ACB8B937A3A2213AB72C22A52A3223278094EC1E1EE71414686CFF41F5F9F59D274E2CDFA6B2EDF8F3A3D72C1F6AE32CDC327C70092E41EE7A66FA779EAA1C38F9E1FE7382B3675D663EBDA985D9D583A8A3AB3A21A9363EA128348264EB60FBF8D583DD871FEF3AEE70F7554744C6582232CE6D7F68363261746CF5048EF23B706F768901DB9E6FE453FB95D01F9001E61D047CFF67E09E58C5CCA8EFC7E7B50426422AD57847F93FD5D33B74516BDF696BE587D1469F4B3DFC3B4909A319B943E93903B925251124323E26CB3FECF3534DF5B3573FDC54337BF82AE28B33F6B353B8857398B953E827E71033A76053C72013876023FB10630750A88963B89933F6930B28C2DCB59694DD109BD79C50D8965CD2914A6E4F2985485B6271436456654852E2171FBB7BDABA276F7DBAFA2CFCAD558E6DB0FEF15BEADBCF7D38AC12A56DD315923E1647819C898C86FF27E10E5C868C0A6407BE430A74FBA5E619FB00DCD3DFBB36B9C6A03919FD2BC4FF037007A0C38930D3EA6891855442417F7876FCDBAF0077CBA377C1B907DFFD807F625AFCC91FE9921F59D2E99D88C21DC249BEFF0CF7D872D88CF2393841CB3656C32AFE9515E1B969D45B2B807BB4A9A3FEE57BEB456701DC178ACA7C35B304B88F8F8E8D7E873BCAF7BFE1FEAF5950DB3ECA5A2092959575E5CA15803B1F1F8FB8B8E89C39B3162E5400BE83D09619081514E6CBCBCB82600376F6193367CA5D387FB6A6BAB2B7B30398DEDDDE3646A741C4E6B3E5B2450BB9D866AC5DB9C2CAC2BCB3B5053C3B3877F0EF08DC1943ED75E53BD6AF5E30534A849B4DFDE19DA28CB4D6AA8ADAFC020DD5DB8A026233315C177FDA1E63ED3A9445EE88CCF8ABC1BD37342158EDADD6B6A3EF769FF27BA855E116D2854B04ACD7F8E1EB82A21AC3630ADC03F3DD0202DF1A3EDE75E4ED71A590D74603C41C5053601C33B76E3C8502110881E33FAA272E6F30ABAA3FBF7628BFAE2BABA2929899E016EA6B686BF3CA40FDFC2DD583E7AFED387E75D789739B0EEC545CBB526CEE1241F9C5BC322B85676F9BBB1256DE3976F1F6D10BA736ECDCB260D9E5FDC7B4EF3F09717425A76576D7D6D2DADB47BBBB99BDBD9D8545754949F9A1D8344FDFC08F9F5E9FBA746FCB4183F3AA458E613DB82CE01432EB1ED29DAE129CFB04AEF4B7E0DEE41C3D15EE807580FB3FE1DC9191756328CCE42A2AA9B83528091227FB8BB7C32DF537FBCFEA9FBAEAFBE25D86AD6BB95F48775CCA4441312DB79059D75C8027A5FA05131CDDDEDF7A746DCF61E55D472E6EDB7F6EC3AED31B769E5DBFFBE44F3B4FADD9757CCDCE13AB76800E2DD9043AB274F3E1A59B8F2EDB7274F9D663A015DB1CB48CDDF42C833F39911C0332FDA38A22922A4899B5B1B9B55159E4E0F8A84F6EE6AAAF348E28EB5F7CE8FBDA2CC1C2EBF3B5171A7B95B4F65E0E7A69D61C983C9250C688250F4515FE59B8239DCA59834920708F29EFF24DC935F24ED67104BE37BA444372C15FA9E179C07734E9FEDD70074CF761B351B8836D1FC2E5651B7B79DD7C6B77E63138F7C0DB7A91CF3EE519798167A785640F042133F4A2709FE43BD23789844C2BC88CAB180AC9CA35F484AF80734FD0B0C63D3526BCF9FC55F565EC2767C36B0F374BCE03B8CF1310FFFCDE9039323E31363E06F5FE29CF54FF6E96F9B3CBF8EF68786860A0BF1722F575354F1E3FE2E3E506898B89CC993D933597AA0268C9E285CB972D01AD5CB16CC1FCB9B23252D25212FC7C3C82027CF0313525A9ADB5994E1B86FD30E8D4BEDE6E0F77D7BD7B76B1CDC0CC9B3BFB9D8E765D6DF5C4F828FC1088394A6732A8DD2D7507776D59347F263F3BE6BE8A72667C5C2385529691F9F8CAB5591C7CF218CE6B9BF7A738FAD3F3AADAF008DCE16EF95170FF80A67E1C47A0FC6F877BAB6F94CB8D274FD6EC02B8873ED7ABF1C27660E34B5D836A0208ADF8848688D862EFD09A8818BC99F5FD5D87348E5D30B978A70B9FD143CC2E75C332B3AA407581B1B4A492BED83C10D07CAA3AE3F3C8B8948C2052E4575F275D73BDDB2FEE9DB8727EEBA143ABB7AF909C3F9B4742062338934B0C22526C8212183E193621390E1188886278E4B8441789CF5C24357B26BFA8308673EDC2A54776EE7DA872D348E79D93F597303F9FD4D8684A4ED64873537366463E165718814F71F735BDA3F670E7B137C72F07BF36A3B8E1FBF1F900F7F128A4B3DD485831ABC1FD379D7BA9795081B16F9D7D24DA2C837688FEB37007B2C38F227DA2E2CBDA43534B9D4209EFBE7CB9A6F6F6F0054BE5FB50072AF20CAC0CC2F626A5338BC9B482E2C24892D53B3D9D7B0FC10A9CD9BA7BC3BC856BE517288A48CB7308C872F0CBB10B4AB3F14B63042431FC9218BE49497F0FA530FC32187E08170AC8AE945AB06BE14F67B71EBA7FF2EAEB1B6A060F5F9B3DD5C90E24A57BE3F196EE76CF3F18DF54B77FFA9E60EA92E51CEEF2E4C39B63375EEEBEE8F9C4A0C62F9E9184F4B719882A1826FE39B84F44224604E03E822F02B877FA24677FF404B827BD75687026A1C9351C960B7C873484382302D1088E8C085F324A284593B737209DF22534CBC0BDCC2AB42720998ECB65E0F346087F1AEEC3F8FC56FF24666A2DD8F646CFD8C188DCE2CF416ECA9A8E179E3B5D7CE1775327FAE5E78CF72E45667E2DCE2430E600773AD45F597047F98EC29D06D63EB6BC2F202D45C721E49E3E49DD32F1B54DB8DAC7484DCBAF2AEA099F5C4CAF3FDE26B54016C3398B4BC858EB1DC0FDC70E3310F91BEE7F6A990EF4A902167776B441A4BBAB434B5343809F9797874B4C5478F62C794585F953E10E64DFB0FEA7C58B1481EC32D29212E2A2C0772141FEE0A00030EF80F5C1813E1A75883A3C1849C0A9DEBC81F4829791527FF1ACB2A26C7C6C04FE3A34D80F709F600CF7B4371ED9BF73A9E21C6E368CCAD54BC9D1C4BA929292B4B407179564315C72188E1BDB0E65BA858C14D4B4E2D2FF14DC21B34EBB97FE58D3983EA91FC80E02B8377844D829DDBBBF6C8BCEEE53E11A06B5BEB896B0D80227BFBA106247746A233EBED82FBC352E2DDACAF1CE8E03EA47CEBDD87BBA1597DA199D9DE510C0C82C67E6D75607C7F6271575B3503EA98E04246C4DCCF331F96AFEEAC3A3732A87D6EE5821BD00382ECB29025A2839479A4B4418C323CE2620C9292C3A835F8C4D4096577CEDFCE5F325678B73098B7208CA0A88CF169591111415E1E4E5C2608478F8E6C8CAAE58B278E7D64DD7942EE8EBBEF570B0630EF4B7E6E7E6E30915B1F12538A283C6DBA707CEBC3E72F1B3F2B35473CFCED0CC215C3E0D578CCC82145CC08C2AFF2DB8B7B8C6922D8201EEF50E51E8985374D65082287A40FF20DC990995F0A30384FC8994AA2E6C4696954FC04B438BAB0FDF1D57B2BBF73CF18B535920B62A14D79392C12CA50C15159BA8BF3AB871D3EAB9F3362C5CA420212DCB2B20C72B2C846197E2E40749720848B0F343128922051E9F088677369FE42C5E8949CDE411472586E195661782BF2E129FBD524EF1A7394B37CC5FB169FECA174A77B4AF3D02BDBA705BFBEA43BB970651565ED95E04AF379FDE9EBAF56CCF05E7477A95BEB1B4E4726A02A58FF8CFC01D5203D88DC2BDC33B29CBC003E09EA86D5FEF449C843B08D2F03F00F7016C4E83572C33B91A3C7BB573247C245B873A5F790564B73DADE6A5AC051E3CF9AD7DE21BBB8ACF212338641A32803B84D3E08ECC1F1B53D6E39712F7DADA5FF55DD4737370EEA10FF509AF2D00EE89E6AE66379EEC905104B84331FCF1E51B26E367B84FF2FD6FB8FFFAD2D4D4844EC7010B4406C091F7F7F7F5F53536D4F574B48ED286BEBD0836C6A00E40E5BC6D843A0882F510F67777D45696A5272710B0A19C3330EC180C373B9BB8B0D0BC593397282A2C5A301F229BD6FDB472E912882F98335B5E5A4A18D0CEC1CECBC971EDEAE5D090A0FEBE9EAECEF6F6B61628278A8B0A6EAA5C07B84325E0F8B123D1A4285809E61DFEDADC54D7D3D9921847D479F3EAD0FE5D5B37AEBB7EF9A28BAD756E7292FECBD7EBE72F5C25397B11AFB8E679D5C1AC8ACEF8829688346A54219D50C4882C068D44954C0A6CC270443EAC04A623C38DC65530E32BFB42B2D0C77A2868A0F68A76BEFE3DFD40705448AF2F7C21E466E45112AC61E17E2CAA3041F7B3EDA5BB3697EE5A9EBD19A169D8181845710F690821D586910A3D832921849EB4BC51727567469EFF47B34B3F6D35517E4830B4AB098DEF8CC9E988CBED4E2C008E3744A515F911AA71493DA9C5D482EAEEF4925C7FBC978EE907D5C773B825E478C56579C400E5921C42E2EC82C071110C9F20865768069F201B9FC00C5E7E0C0F84421C02A2DCC233C5E478305C5C180E216E21291109012E3E0E0C861333838783938B83939B8B8325361E6E76103F179B9AF2950F8F1FBA7CFC186EF79560E7E46B6866A3F6DAF0CABD57FB2F05BC342E7322347B277407643249E5CCE81A4668C1643BC028AE0815242CA8CA2622CFD03BF7A317C01D696A67AD473ABCFF40105428ECA60920D81B96DD1192D147C803230C704F3673B5BBA9FEEED8157F4D83105D139CF117C227AB607D236BB5A71AA74E5FDBBE438A8D5D8C8343949D1D111BA7183B9738072F4810C32E32834B924B50964F548E4F4286470C8A40483D483754907A2061367E545016A212E314420571D87E9EA08CA2A0DC7289797B16AFBF7B54C9E18D495E486C5F5E4DB24BA8B3FA479DB377CC555E2659F97692F27B4805B5FE09F4183233A91A0470874A0F3DAA78303CB7DD37193DC1E9990D145DCEC01502D3C1A7A3AF71863D348248BC961DF973485F6006001DD88DB6DBC01E1804CA14952262DD0B155F71D58E9199861E3926DEFD611934425E4F70EA78CC9F7B898955B822D311232F78C7907B4232FAC3B301EED667D41CCE3FB33FF7D4E78636E1A919D870403CC53C10E933135DCA4CAD01ACF7856581EB8722A12F24934E281C08467AC1979807C05792B4BF22FEFDF6FB28F54FC4375F706FCC71EF3EBB3ED5555EBF772E867FB190F4B9BD87FB5B3A9813C8B47160FAA8230CC03A9535BEE0DF70FF95059209C2898989C1C1C1AEAEAE9E9E1EE03BF865003A10BCA3A5B1A42037260AEFEDEE626DF9C9D450FFE0DE5DA02307F69E3A76F8C29993E74F9F3871E4E0A17DBB67C9CAC84A4A488B8BCD94915E387F1EC05D71DEDCD972B26B562C5FBA5011D680E6C8CB01FA81EC50061C3F7CC8DDCDA5A7BB13F8DED1DE0A070256FDADB61627071B6065EF9E5D61A1C1230C1AC01D2A07B0C1F8183D2737FDBD9EF68EED9B66CF925DB97491D2B9D3EF5EAAAB29AB28884AC28557E4167D75E6464F6A69475C7E57541E35B26812EEA049B803D3E12E02BEC35F214487EC180CC946D10394011E8D7F1F37E3F710FF4BA64F6A9CD5AF0B7D691079659C857B7046B16FCDAD2FDC46E07EE1164EDBB8218848F608A90F25D586478367AFC2C5F4E7148F57D4F5E415877FB6BDB7FF98E6E9AB9E9A86391E6135B8A446627A5B7C6E474A21A82FA7AC2DA5A03C2A39C52BD4DFD8DAF0EE73D5BD270EADD820CF2D26C9232AC52502B81161171062E7078E8384390480E6207E0E7E3E763E0805B90485788585798439315CEC180E5E0E3E016E7E1E766E0ECC0C2E3676203B222E0E1037AC65898F9B6DADC2BCFD6B575E3D74F085F235837B8F8C1F3C31567D6C78EDFEF3BDE79DEF69675BF837FB240E84E68D4582C72C1FC302D67F1DEED5B6B87C231FE07BA313094A53B49F3B681A3E2685C26E9A00EEC384C27E3C32074B774476893336F09591C119D5A7BB4E84EA997969BEB77AF05CE7E2D57BBBF79D58BA7C938484222F8F3427A70817A7303BBB203B9BE00C76013676C1199C0233387930181ECC0C7E0C273F860B508E241A86074A4110DFAF8548193983170A4BA48CE41212E71595E21797119484A2148C3F94AC0A22F2DB17FD74F3C845E327DADE1F6D7C0D6D0D6FBE787C50E9C3E5474433B7A6C8EC9EF8E2166C466B70DA40441E54777A43B3BE3D1C4EAD6726D5A027383DB3B1065904CFDEE9935C62110440F7BFA51774573FE3831BC44B2D83A7C19D499A4AF65FC0BDDC2EA2CA8190F1D13DD7D467203C13853B323CC60F29FF3B42E01E5F0E709F882B036A03DCC1B9536CC250B8837C55DE463EFB447C61012A30F4EAF24902CF0E70878DA118A0B226411B0CCF413A8686E78E4516E77CF408BEFB21F59D6382966D90AA6EF44B0BA2E6E708AD4F113A9693705F24287566F74104EE60F9C6C707FE86FB3FB200D901E81D1D1DE8547C745868C363F4E186EA725C68A0EE1B8DF3A78E6D5CBB72F18239F367C9029B057938209412159C375366A9E2BC954B14572C56549C3367B68C8C8C98989C84C4FC993317CF9FBF70EE5C882C555080F892050B562C5A04E12C6969113E3EE0FBEAE5CB8C0DF45B1AEA47A8C3BD9D1DE30C7A474BB3BFB797A8A00017DB8C75AB57B938D8F7777731C7C7A803FDACF6FDD1524A91A1D1874D9BD77172CD00832F2620B078CEDCD3FB0F8B6238E6F3882FE69302B8B7C7E577C4165293CA00EE7033A09DC3504D56F60782B3FA833241704B2037521C02F7499AA342A18338CA1F6EB36FFA01EBA8C0B003D9C1AA400871603D8450F98DD430FA7CF6A6ADD23D2BA5BB91EFCC9A42A2C95EA160DB6B71B1E561514DF169F4D24A666DD330B932C9DBFFBDEAFD47074E9BDE7C1AFAD13ADD3DA40C1BDF9C98DB935B365854DD5750598A4F08FC64A7A3FAE8F2CE43DB172C5F222C033556A4C9850B71918075400F608817C3CD8DE116E01440C5C70904E7054184975B806B0637847C3C82DC9C7C9CEC5C3C5CBCFCAC317FB839B910B19C3B6ADB797938E09B42EC18195E8E4592E29B14161C5BBBFEEACEBDF7F79F7C76F8DCA3ED273F9EBD83D3B2AAF788A5461421CD32C8CCCBE4DF827BED5742A1895F81B16F93733483350E389AF2D3F031291476D3047087EB4B259500DC6BBD63633F3A3ADCD67877ECDAF33DA7ACEE3D7FAFA4726FD7A1134B576E93935F2528B490837D26DB0C191E1E313E1EE0BB20274276BE196C7C18765E0CBB249F9018AF800827BF20072F249D30A7A0388F8824BFB8188F8808AF0884500A424507EA37225C4210A2A98A242F1B5207826DA404246484A4A01AC48BE1E2C37009637865B845974ACDDBB178DD8975BB35AEDC57D97DEAEC9ADD4F8E5CF1D7FD52119E8C74A04C24F711F247A2C923A4D2BEB06CE03B3877381B81110A0000FFF44944415429301CE8094ECF6CACF703607DB75F6AC29BAFDE37DEBA28BDF253D58DD1B0FE11EE48BB0D0BEEF4C84995226275AE2FFB1A51E1804F3774CF33F71B8C00CEE67505A5FC137007ACA3700733DE1D9C3E18915B661B0E7007DBEE78E139DAC002C23D36497BEB50658B059A03DCC1E94331C07A3BB798862F407BCBB479C603D3A130C8D27703B3EF7FE36DACC6E7480D0BAC866984B685DB53DD1B1BF6CD9F21B05040F2E48E7D08DCC72626C6BEC11DE9F03EFA37DC7F6301AC03D33B3B3BFBFBFB474646464747FBFAFA9A9B1A7C3C5C4D0CF4AE5E3C0BEC16E1E7E69A81E1E39C0111613E2EA8A4F372201F81F202DCECDC6C1864E60D7171615E5E4E0C860B83017CCB4B4ACE91950529CC9E0DDC5FA6A8B876F97210801EDD524A4CF4C19DDB4579B900F7819E6EC6F0D0707F1F7C54983B8787837DC19CD9861FDE37D6D630C746C7E834B0F000774A7989B5EDE7E3278FC8C94B7171B309F3F3CD92903CB66B9F00668622BFD41AF1396F2FDE698BCDEB8C2B62E63652098528DCA7F21D04BE06EE10A8DEB67AC4B779262077426C05801EE10B7A231129100271501E7D5BF9A37EC03AAA51D6A43900773A360FE24076B0F0B4889CD027BA9F4E2ADB5DBE6F77ED61F407CB166C1CC53BAC8605F71A425C4F76E1444D23B3B16DACB6911C13EF6568A676F8ACC669658BFBAF70964E646C5C6B5A617B66494B4651988D8BB5E6FB7B272EEE5AB266B1B8DC1C3ED1593CC2F27C22A85B07AC83AF04F40080B8305C9C184E016E41411E2110709C870BD8CD0702ACB361388505C5A444A511BEB371F1F30A4888884A8A8AF17272B1C4C1C7C5C9C7C5CECFCD0182AB3C535C68B628FF1C11C105A2C22B24A437CACDDE3567F1A1F92BAEFFB44F6DCBF1AFCA1A253661FD6179DD0199FD0139CCA8B2DF827BBD4354B15900F0BDC53516495E566A23E10F044185C26E9A808343F8025A2CB90797936717E2AF6E6471554DE784F2AB43E7AFACDE726AF1EA3DB314364AC8AC16115D2128B454804F41804F969F4F42804F94975B888B43809D03E00E64E7C1B0CD93919F25212D232C21CE270C365C5A5072A698DC5CA9D9D222D252C25220094109710171317E31513E51540074A03C5480A0C8849A102A349D910200EA4933F8C0C8838B9FC32BB96BF1FA8DF24B36CB2E56DA78D0EAF1BB6C2F424F2A6522BFB11FC8185F01861D803B80CD1DC623937A77F8A5A027F88B9CC652B34B0C6454C8BA610F8D3E1FBBFFF5EC53DF9BEF08CFCCE3346DC1CBF706A403DCC1BBD0230A204B037C7F0BEE143B2CF01DE05EF83910C84E8BCC47E01E479E96ECBF2FD83F601AE00EFE1D308DF69629B7C302DCBF9E7DE274F145D09DF7E0D901EEE10F0D635E58661BB8F7866632932AA130806200BE3216C39ADB32B60C6C7BB17900E1A919F01D36C33F310DBCF92EE695254EDD2CECA531F68D39C0FDE6A6030077053EF1E35B760D7C87FBE0E0207D0ADCBFE1EC2FB9FCD7E0DEDEDE0E6407C423AF063018F5F5F5D1D1D16EAECE1BD6AE02572E27292A2AC023232EBC6AE9C223FB775FBB74EEC6958BD72F5F50563A0FF18B674EC0CA4D3FAD5AB6703E187370EE82DCDCC077EE193304B8B8407C1C1C4079580F7C870DD62C5B0621105F5C50909B9DEDD0BEBDD89060203B609D3638304AA376B7B7EDDEBE0DCCBBA4A8C833B547A5850513230CE03B73628CC618AA6EA8C211F106261F6FDD51BD78F1FC35A5CB776EDC543977459647643518A5B9CB3F5E7FD61E57D8155FCC2C6E07B803C741D3F83E1C96DBEE95D8E8125D634FA8738C02A7039915EE19000D0068D2BFA370475E0BFCE136FBA61FB08E6AD2B94FC21D3E52B1D9BE775F1B1D51FA7AE581A3CA9304239B365C42A94F585538A9124BAA8B4E1A2A2907B2339BDA98CD6D1D8525A901A12F2F283F3C725E4BE95680890D2532A926212B23981061EF71EDC089A3EBB6AD99B9608E80980CB7E04C7ED1B9A252F3A5E4907618363ED054B8736038F9B904803BFCBCDFE08E109B930F22F027215E61C0166CC08534CEF008F3F28B8077E7E0E2E7E4E6E7E4040920584724C4C5AE38535A41567C81A4D83C31E10582C28B0445960948ACE6933CADB8E1DC820D5A7BAE4469DBD6BBC5B579A7FC23702F32F507B8C3CA7F1AEEC3C462467C594B504AA4AE9DC5E5C76F0E293DDA76ECDA9A1D47E62EDD3F4B7187ECDC2DD2F2EB25A5568B892D16E09DCDCB25C1CB2DC2C385909D838D45F619007790280FBF10270FDF0C2E1E48040C37A059824F4C56581A082ECC2702BC86F4E1E5E0E366E381BA0E27860B12EDC7959098C8FB79C21292225212C29288EBE71484E2569C4D6016B7B83CBBC8423E99038B36BC51BA1F61EE5A1D9549CFAEADF34B1CC4E58F46232FF7829017B2926A987115E809FE22A7B1D4E61E0FA9D1EC160BB6DDF4802AC03DE0F67B807BEC6B9B6970874CFEFB7027DB86A77D742BB60A66100B01EE9D81C9FF04DC47A34BA951850077B0E19D81A9C3F8FC4A7B9CD5E94776671EBB28BD0CB9A71FFDF233F03DECC147829A0980BBD1337624A6148A042806C0EC23ED39C49289180A353C37E9AD3D940169BA4EA00835E3F07B0691CF4CB1CF4D425E18866B7D727FA6A7BAF9E00236C1053CA287376C43E03E3AC1FC0EF7B1BFE1FE3B0B954AA5D168743A1D9C7B7171B18B8BCBBD7BF70E1ED8C7C586019F3E7F96ECCE2D1B54952F838B0FF0768F8DC235D65434D556B636D474B634B435D656518AB352136322235EBF787AE7C68DE3070F6E5ABB76A982C24C2929003D387A517E7E09212170EBC074B0EDF0A779F2F2B006E0BE6CD14253C38F60CFC1B6A37087F0A6F2B539F27282BC3C37AE5EC94849463AB98F8F3199E300F7EE81AEEA869ACCBC2C520C11478820464625C5C4E96BE8AC98A9B071D6E27D0BD79ADE7A05706F8BCE67E6B74CC27D1ADF0782B3E00E01B253BE8456D8600743B2E19668718FEB0FC8180CCAA285E5017180ECFFB4731F8F2C46CD3BDA2C833A7780BBEBF5A71F0E9C07DBEE72E74592997D676432D9371CE05E1A8403B833CA6B982D1DE38D2DCCD60E7A43534366AEC19DC74F4F5DD1B878D3EBA365BA7F04C1D1CBF499D6A3F3D79648C8CF139290E51290E4E093E21690E61796111091E4430CA320387716E279D9787966F0A0E88110300434077102C3D9A15EC4C3C5C10B90428D276242B9F979D8806E889915E4E0060971700A73720973728044B83845B838C47839C4F9D8A5F8B9E50578E7090A290A082FE5175FC927B14B72E17E89452A4BF6D85E56CF34F269F6481C0E2998DAB11A253B9A98A03AFB4820FBFFBD7367C452A831A5458E587B552DF59D67EF6D3A7479D9D6FDB20B0FCD5EBC7BE6826DB27336C9C8AF97965E2329B1545470BE209F10FB0CC03A3FFB0C446CEC60DED1338553E667E314E2E413E31502A6836757945FB068EEA28573162ACC519C3F6BC11CB9B9B36466CB49CACB88CB4A8BC9406242AAB263385001D9F938F9A1ECE4E4E2E3E51312161217139114151083B2419C47449A5B540CC32B851198C72DB1416EF195AD478CEEBCC25BBA97F8C7F410F2C7E3CA81E9E0D9C1B98F904ABF4D25CA3AC15FE434967AFDD2A8E179C5E6812E4AAFCC0FDF7138FF1CE04E54FF0C708795937087DC0E991C792DE867B2FF02EE40F6529B30803BD9366C341AD61474042431E3591DC67E48FCDF125278108B11B82754D0220B01EE54424195031EE06E73EA11C03DF4BE41CCAB2F24754B8035C01DE2F07383F83C30EC0077E4E16A7C39387750A74F52D40B0BDC6313F4F55488443FB708BDFF21ECA951E053FDD0D7A600F7DB5B0F2BB00BCDE716D9BF76D350F3CF700733FA37DCFF6081346A6B6BCBC8C8B0B2B2BA70E1C2A2458BC44485572E513CB86BCB937B371DADCD1349B8CA92BC8EC6EADEB686E19E3610ADAF6374A887491F181BEE1DEA6EED6E6E28C9C94A898E09F4F0B43231D57AF6FCDAB9F33B376C5C3A6FBE2060828B5B849B47524070AEB4CC92B9F31467CE92111313E6E7037B7E57F566616E0E601DE5FB606F8FAEF69B954B9780BD3C77EA647C34095622C30F8C8F0ED0FA8746878646A83D437DAD5D6D4D2D8D2D4DCD9DCDAD5E762EDB96FDB471D6D23D0B10B8B744E7356033C6D26A901E08AC17F626E18E0A6E03B0ED95B611459F02D06E06B01958F856B7B80ECFC43EFF74B40B07CA7760D3B47BEC67FD80F56F2291D167AA807888A09D67E8B8DCAF4A0F74F79E01B8BBDF7F956AE1D4454AA5F8612BC388793E2135D1892395750077466D03B3A59DD9DD3B5CDBE0A4F3514FE591F6D5BBD6AF741DB43FBEBCAC7A78D5A675B314A5D879C5D978C4D879C4B9F981EC12BC82826C5C5C188C30A7202AA03CDA5000180281910424494BCAC948C94B49CA4988CB80A42464572D5E252F2A2BC92FAE20377FE9BC8572A252C21C3CA25C00416E900807174B1CA29C9C88A034C060F8D930C21C18092E76795EDEB97C028BF9C456F08AAFE192DEC63FFBA4F4EA979BCF863E366B724F18C5916961BFD95BE65FD5E6DE87CB6B094A257D70F870FCD6932D275E1FBAF462DF39A5555B370ACBAC11105FCE2BBC944F7099B0D032511180BBA29890201B06E02EC8C92ECCCD29CAC32BC12F202D242A232CB66BE396433BF79C3B7A4AF5F2F527B7D5349F68E8A86BBF7BFDEEEDABB75A2FDFBC7EA1F9F2E9ABE76A2F9E3C78FAE8AEDAC33B8FF6EDDCBF79DD9645F3174B894A43950852186990E11799C1C6C5CECDC72B28222824262C282626282E2324354B44568A53589E5B6C2E8F2498F7F5920AA756EF7C75EE96ADDABBC1E812A4B74C621590BDDD3FA52B28BD3F34BB27087908049A9ED9A2C843C1D9604AA25F59D99D796275E221C01D2C3CC03D46C31AE0DEE39F066447E10E210A775AD4A44A592A0695D884155B87A61ABA51ECB1E3F1641AB1A03DF09F813B187614EE80F58E8014407CB52301E06E7DF221C01D0C3B903A56C30A79ACFAF41344B24CBCBA42D2C1B3A37007E74EC3170C61736BECF1118F4DA01848D773866FC1F6696F1D7C6E68853EFE18F4F843F86B53CFA77A77B71E59C82634975368CFAAF57FC3FDCF2D7D3DBD85F905EEAE6EB76EAA2E5FBA4C5850889F9BEB9EEA75435D2D7C885F7D4509109C394645390EEA6B6FEC6CAAE96EA91BE86C06CAD3FB3BA93D9DCCF1512695D6D5D854965F1087273859596B3C7E028807B883C02801E2678A4B00DC17CF993B474A5A5A4C988F93EDCCF1236949F1E3F4E151DAD0505F774F47EB17F34F1B7F5ACBCBC971E2C86112013FDCDFC7848B37CAE8E9EBEEA70DD2C719B4317AEF505F5B476B7363536B7D23DE2F74CF9ACD3FC92A6C9FB3CCF0E68B86C8ACAAE0C4A1B8D2217C01F09D862F444527209D67409DFEA9752E248A4D789E995F9165506760DA60786EC5575CAD4364B34B4C977732DAF91A85FBCF0DF13F6A1AD327154D1907A04F993E0D22547CAEF5F97BEFF69CFEAAACE6F9F0759AA54B77741AD92FA2229C98E11958418A6754D503D6876AEAC7DADA9983C3E31D5D41368EE6EA6FB5541F6ADF567B70F6CA36C51533B9856438F9C5309C22184E80BB0CAF909C9018F01DE0CE8D6113E51616E142DA7C85391109700AA25ABD64CD4FCB36AC5FB579C3EA2D10AE5DB5090491D307CFAC5658B95076C1CEB5DB0E6DDDBF4661C51C31D97912F2C26CBCC208DC7900EEE21CDCE29C9C20E0BBB420BF94208F241F8F2437973407971C07F75C363EA82C2FC608AEE795DB27B25079D10EA71B5A0D9E7163C432E014AB9E84743D9A84FB584421A8CE0E5F64EC9B6FE4D3E844A28723A3788F12C0729299A48AEF2A43C2498EFC807508810EB5DEB1858E58BF17869A0794340E5EFC7A5FD3E9B9CE47E5BB3BE4E76F9299B556426AB5B8E42A69C995B2522B652596CA488970710BF1F089F009880B0A4B8B4ACE94929B27334B417EAED97B93AFE6B681EEFE0984B8A28CC2EAE2AAC6F286E6CAA68AE28AF2A272723EB938A7383F233F3B2D272339333D29D3CBDDEF93C9E7BBB71EEED8BA67B6FC7C7E3E1176361EB619DC6C9C7C5C7C827C826242C2E222C21280FED9123317C8CC9D2920354748660EAFA414865712C3B9904702AA9837771CCB7608ABF54DE80CCF6A0D4E6B0D4CED8DC8A54616418E454F10342DBF0D87E592ADC3FC6FE9599E78007CB73BFFCCFDAA2641DD12E05E6881C07D049991B504B23A02F7B88A5F833BC2F7121B6C915548EA47F7327BDC4442398D58D41E98023EFACFC39DD59A145F09BF08F71423B2A8CE31126CBBF58907AE4A2FB1F73FC6BD44DE358D796119FB1C792F294DCFB9C32F19361B8EC81B836A4A6C190D9B37189245F91C0CEE3E5ED326F59D63808A0E6C9FABEFEE7EE565B09A81FFE3F7211A2693709FC72EB87BF94FC34D1DCC9109E6E8F8D0C037B8334647C6FFC7E10EA51B95363A38401B1C1CA60E8FD0688CE1416A7FEF0083462F2F25DB7CB6DCB3633B373B1B5075D7962DEA8F1F8319EF6D6E1C686B19EA68A37675D0BA3B518D0FF6FFAA863B3B46FB07C6060669DD3DC39D5D100EB6777435346A3D7D76E6D061053979013676707F623CBCF3A465562A2C9012E217E0C428CE9679A7A55E4B29A1F677F776B43086FA126349CA972FB2B361A4A5C4F43FE8B534378E8F8DB4B5B54CB05A67E01AA24216F86F9C191514A6202E3B9B43501EC31D6464DB48CA6A20A4F744E78DA5567561B3E831A51349951D21E903847C6666C3584279916D68A14D489913BEC03A18E2A389E5E38915291F5D734C7CC00135B9C68091871A2E5481D1E6F849E30FF70CAC47EE3A12E55B63C22FF5ED9E8CAD6044168F124BC7A32970A332936B47A3C9554E04A323D7CD4FAB181CB94AD2FF52EE85CB75F6AF8D48280EC4B5A4E6F59794D3EA5A18CDAD8CF6AED1EE6E5A67775F534B6460B087EDD707CA3716C9CFE2C76080B3525CBC1051949093E11604BE837F9760E715C5704973090097C1838BF08A0A710B4B09482F9CB968CF867DD7CFAA3CBFFD2A2122251E9B52925E999B586AFCD6EAF4FE2BD7CFDE37D0302F4C287E7DFBF5F95D674D358D03EDFDDF3FD5B97E5CE9F6D9EB77CE5F5753BEAD7CF2C2C6C52B6405452579F9C5B878F83018697E415941E159A2E20BC4A514C5A41485241478C5143945B6C9286C119DB3535CE1F2926D1FCFDE89D0F94276C2360724500979BD216903C1996384225A786E9767429F770A135F526AE29FA3E7566D851B0E81142EA446143108146A58D1048EC28CA020219ECCC4978D13C8139114105C0E24C113AB9871E580864180202E9F1A5D9861E5EDADA16F79F389F1B507BA176E243B7A7567159A3D7A7664C59A03CB576C57545C21233D4780479E9773BE88C06239D9C5F316EFDB7148FB956E524C5A510ED9C2D8EAC625D5170F5F99E97F8EC5275595D45714D5966452524919D161714951C9C1EE8158DFD050EF607F57DF70DFB0E4989482ECA2825C72467A7E7E3E854CAE4B492FB0F8EC7CF8F8A59973970989CDE2139490909493929A2D2428CE8EE1E666E39597905FA5B862C96C85B9E272B23C22D21C7C523378A4313C3339F917F288ED925DF6FAB84AACA57707A96030A9AC27AAA03322A78F903F00EC8B41C6644746DD09CA62E28A99D8A221FF0CC881614F4D3FECBE667CF816F05D7FDF75EB338F495A36C97ACE3966BE8DEEB1805AA49B6F44DE40580E0BBBB5A35046C6D74E46A8F8D2323B7CBE7948CA07F70AFB481AA104D41F9607E128A90CC9B1DF07E4F896C959423FFEA89148F260583E93543E412C1B0ECB873550F7F556D6B63FF5F8CBE1BB3E5734E35E7C8E7D611EF3FC53E2CBCFF12F2C00F479061E8301E94C4271BF5FEA04BE884924D77FC5473FB79854CCB36F22BEF884D7300FD3348BD0B1F478FEFEDEB6A3CB38C5E662F837CC54EC2EAB65F60D33A98C91212A737C0216FA08E37F1DEE08D98718007720FB086302441DA201DC7B3A3AA370F8BB2A2A73E5E4F83838562E5EFCE2C1435F57E7E1CE76603ABDA76BA4AF67B4BF776CA00FD534A64F6AA4AF1F7E03F999FE01888F0F0E4138D4D1890F0CFA6264ACAA7479EB9AB57324A544B97980EFB2C242429C186921EE5D9BD7385899423D6074A867A8B7933931529897A9F6E0363F1F97A000CF83FB7773B2330707FBFBFB7B27B1FEF36584D82FE11E6868D548CA6820A476C5E48C02DCF139B4040A50BE333C7320AA6022A5AA079713F3DE21D9D89DE28C0795BAE0E989658CA4F23433AFDF823B8468F30EDC5DE0467F46FC6FC21D18548CBC70C89AC1879952CB2095963BE200EE66A75501EED1063615DEF85CE7C05A7C62515064634A4E4F7105B5BE05217B572FA41EB5ABBBBBA9391A8F77B6B3BB7DFDFA0A05454834614E2E80AC281B274A76F0EFF23C423379852566708B6238C439F8F967F0CE969DBB6FDBC127B79F5A19DA8478842584A7641073C8E955D93185A5A9B5D9D1A59FDED95F3D71EFEEA597861A5F2AD2ABCD5F7FBA7BFA8EE94B136F0B2FFD67FAB7CFAADE3A73C3D7C69D14808B0D8E74B372F8F0EAEDD3DBF795CF5C38B263D7E29973678B494970F20960D8C4315C0A82929B672F3AB474DD4A41991D328A67976CBCB3E5F0DB13CA8E0FDFC49B3997B9E37A22320723B269843C063E6F28246BC03F0D2154702EC52420F7BD7B8D351EE04EC79650234AC0630E638B2770E5CC0810C0BD8C05F732203B329E012478348589742CA9445A6C09F9BDA1996D2129D8F796C6D7EF6B9DBA6C764BCDE6A946B65F48534AE6873B0FB62F505833535E414478B6009FA294E8B6554B2E1ED977F7DA557FAFC088D0D8ECF4D29E0E7A534D97D527C7AB176E3DBCFDE2A3CE271F97E020AF083B0B177D4D63B59BCFAF9E56B976FAFAF94367AE9EBC74ED94D2E593176F2BA9BE79A665F8CEC4E0BD6944780C212A8514931110427AFBC1E2E4C55BBB0E9D3F72EAEADE83A776EE39BC76ED9699F2F378B805D967208F5E65C5A51567CE9B2321232F202ACB2738935770AEA0F00A59F96D0B96AC975438BB7297AED2A310FDAF855EC4667C7637B10010CF88A58CC7213E1AB2199350C22494327125E3D8C22EDF14BF7B1FDE6EBFF4F1808AD9B1BB7ABBAF9A9FB80FB84FD075CCFDE4D7E4150F40875201BC3F0869C18FAB41981E57031A219643388C2BA1D8120A2C42D33FFA543BC530A2CA20E507B14510198B2E87A4FE53701F23940D8716328995CCA80AB894CCA8B276B7385F656D87938FAD0EDDF5BDA219FFE273DC73F3D8679F92D511B827BDB2CED471EA728F67E28AA881994C7CF158783ED9D47F12E85305708F786D1EAA65867D67E9F64C0FE0BE82436C1E867FE34CC51E4A2DB3779839FC37DCA72C7DFDC3A0A1413A838EBCB7343202A01E6C6FED488A8BD7D17AB37CE1421E36B68573E73EB97F3F3234B8AE8C8CA27C626880393C3829F8388DE9939A181A663246987406601DFC3B93460701AAFA5BDBCAF30B42BD7D5E3F7EB26BC346192161A4F5760666819CE49ECD6BB55E3C4C8D233006BA687D1DDD6D4DCC116A6B53ADF147BDB9336539676076EFDAE1EAE2D4505F3B360635B13F0DF79E486494F3F1B46AA07C3FA97020BAA8D829E2ABCAEB40755388D40724D6F8C651E3C95000647FF6FF2DB8A3E375FC88F8696407A1991E48442714C1DD0562104B98C935746209F96BB8F1D11B9FCEDCFA78F41A02775F42AE6B501D21A93838AA3E29ABBBA89CD1D036D1D9CBEC1F82D41B686B6FAAAC7275B0D378FEE4C8EE3D4BE6CE9312101464E790E0E19B27292DCD232884E110C670C8F208CDE19790E51492E11094E3173BB1EFD8A3DB6AAE366E3949B9CDE5AD6D15ED75F90DE4D4B250E70817330F0FCB004753EFA737B5CFEEBFAE7C5A4DFD8E2ED137DEE8A5E9FD0B8F5EDFD6FCA465AEFFC2E0B9CAB30757EFA713D33AAA5B99C3138C9EA1E68ABAC28CECA8E070172B3BD54B578FEDDEBF629EA22417D23434975F6CEBBCA5C7D76E9DCF26786CF1BA57C7AFBC3BAFAA71E8D2DBE3D75C9FBC4BFBEC09E69D412C64C65386C3B3FA03D347B1F9A361F960DE296681791F3C6A6D08D4D07C14EE001716DC11E7FE1DEE64D4B90371983108E926D00166132B06230B1ABD630AEC831C1E69BE3A76E1F9E1D3DE6F0D525C7D1A92D25BD273CCD535968888CB73728BCFC0CC13133EB26DB3CE8B27C11E2E697131D47E3A7588491F426666ABAD6C37D2FF72FAA892F2A53B77AF3FD678A2034C3F7DE0C29EF507D62A6E5820B56881B4E2DAF92B362D5EBB61E19A95F396AD515CB363DDCEDD9B0F6CDEB0FBD913EDE7EABA1A9A1F1F3FD3BD70F5C1C90B779EBD3672F6C6DABBF9197DB2BAF7F0E9BE83C7162D5E21262AC5C7C9CF3D83535A485C82571079F4CDC32FCDC123C3C9BD504C62D39C053F89CF5D2F326FDFAC556AFB2E78699A15FB907AE38A69C9E5E3C995C3C4225A6421D4549831656390EBC272C1ED165906395E79A5B9F9DC87BDCA26476EEBEC5002CABBDD7813FDC636CFDCBFD53709E00E66021DCC603CB60C65FA446C35085218C2A188E2526B5CA1655896B17FBD5B02A01FD6C34AD8EC3F00F7640D1BF0F2B5D65860FA6858DE4444619F7772AAD6D7695847F537DCFFDCD2D5DDDFDB37343CC4181B658E8D4DF4F70FD6D736141716BD7CF67CE7D66D227CC87022F7555549385C67633DADB79BC5EB8149B8A358FF1DE7FE0DE8541A1876603AE2E259A08795B0A68E4C09F2F05453BDB56DED4F8B66CD5E38535EE9D4D18F6F5FC5E083BB5B6A9823433DADF50D159481EEF631DAA0BF8FFBAE6D9BB9D83072B2D20F1FDC4B4F4B4128FE27E1CE48AEE88DCA47264B4BADEA26E4F6910A1B0293C2B43E6BECBAF8F9CAF35CDB60207E5B78C6604C31703FD72AF0B7E03E149A0342113FC977D034B283D04C0FD55B14EE70B3D1228B9849D5B4A8E2629B1093632AE6676F7F3CAE1C6B6857E91799E7165C1F995C12426C48CE06E73ED2D8CEEC1900B8D3BB7A1ACB2BF252D36E5EBEB4F5A735B3242465844524F8C098B349F20BAC9CAFB0506E3690821F3343924340415C7EE382E5C737EF513E71298990909590599C59529456941891E46DEDF5F1A591BACACBB3BB2EECFFE9F0896D172EEC53DEB3F6F8A6A5FBF66F3A77669FF2D31B5AAAA7EF9FDB7FF5E2A16B772FA9BDBCA3F9F29EE6D35BCFA3C3E2EA290D4C2A9309171080D837D4D9DC5E594A2185E3BC1C5D745F6A5E3E7166FBF2B5CB65E72C14965E2820B98857FCD6DE132EAF0D5C5FE96B9DB8766FF361FDF3B743B53F919DB034620133A9A22F34BDC73F95494466026A77892D370FCE33F0ACB18BA4610B1911A5547C298A98313CD2260302CF8EBC03154906DC4062222F6DC6958FC692C712CA47E3CBA012966F1348D0B33250BAF3FA94D247E53B39BE21438594D1AAFA214A25DEC975B5DCCCA552D26BE6CF397F709FF987779909D103ED4D90E33B5AFB20F35221630E3029C5F5067A16A78E5C523AABB279CDAE63BB4F1FDC766CE7DABD47779CBC7048E9D2912BD74FDF7873FFA5F683572F54D46E9EB976F1F085B3872E1CDC796CC3DA5D1BD6ED5EBF71DF96EDC736EF3CB961FBF1534A0F1C3C718DDD8CFAAE813C4A55303ECAD4D2FACE03B53D7B0FCE9FBB408857906F06075C3BA875CD141094E3E615C360A4D8D815F885D74ACC5EC12FBF92576EFFECD5EA47AF05BFB7A9C7A68DE7D4D312CBBAB0593D619948971212792038B32F208D1E911FF5EA0B58758D8D6700EEA647EFBCDB795977D795CFA71F619F7F02E7DE11900A99ED1BD6A196135F81327D3CA60A4483F48CAE1C082F2CFE8205B8E79A05357926C3FA49B88F92A0A2F0EF857BAAA61DEEBE6191A1372324671C5B0061831D1EFFC0682AD327F567E1FEBFFE40B5BB67006AFC74FAC8E8E8F8E0E07075756D627C427060D0A2050AB292128A73E6A85EBB46C26387FBBA27A8435D4D0DBF4AF6DF813B02F4612A88D1DBF7AD89864607B8D3BA7BD090929BE7E7E2FAFEB5E6B3BBF7D4546F9AE869E302BDAA4B7247FA3B9823C3FD1D4D6D75D5C37D5DE0ACB25213D5EEDF992923C9C53663D7B6ADBE3E5E34DA309CC29F82FB703C199C3B3DA91C28DF4540664DCBB70F333AF7E0B2C2D697BB2FC619B9F622B5E07C807E272E3BE74BC0EFC0FD57CDFB54ACA342333DFAD8166E332AA1102AC800F7614261FEE7009393AA16E7EE189EB81E6BF4B5CA3FAAC023B4212AA53494D496593840A9196BEE6476F78F76F6B45656A7C5C4FABBBA6D5DB37AA684183FFB0C313E1E713E7E5ECC0C116E3E45B9D98B672D9040DE93649F2528BD77EDB667371E78593967442557175666C667F83BFBBF57D7BB7E42F9C0BA7D9B176CFA69D6DA9F66AD5B2EBB6AEBA23DFBD61EDBB070F75A851D5B571ED9B6EAE8961507F76C38B177E3C91D6B0FEDDB74E2FCE16BD7CEDDBE72F6660229A3A6ACA9B76BB8BDA5BBB9A1BDAF6790461DA50ED1067BFBBA5ADAAA8AC94079F3F71F2F1F3DB5527E9E0486F3D08A0D46F75E24BB06C67DF536537D766FC7B1574794ECEE6AA47CF2680F49198929EE0E4EED0E4C433A11E18A9A9D48159F430B0CBDEBEC89F488A2111C19B8037019C6958C7E9FC119B00E1A0141D58754CA4CA905AC53634AA0E2D589CBA4B8E1A33ED8B93CD601DB6E7257CD57DFA4353D87D9D1CB6C6C1D6B68AEC9C87AAE7C5DFDD62D43CDD741EEAEE5F9B9F4BE6E6448D1D1B1B6D65E2A95C9A031FB7A467333296F350DF7EF3C7E70F7C9E50A3F1DDE71E2D2D1AB772EDD37D434F1B6F689F0C02586C617C66417C7E5661352A37C70FE8E016ED61E66FA562F9FE96EDD7478DDFA836B361E5CB3E9C8AA2DC78E293D70F42376D0994350399E6036F5F61754548545910C4C3E5D52BAB275F3365E764E6E0C46949353414262A98CCC3C4181D9BC3C0AFC424B05A45609CAAF119EB54E64F6FE392B5F1CB98CFD68D71091DA175BD049C8EAC56733E24A26E2C8547C6E5F506A4F50BAC7CDB786076FBED97A016CFB97336A1007B88379F7BAF52ECBC4BB3B3803F21B622680EC49D5C89CDD3155F4480A301D1C3A94A090C8BD217940F67CF31050AB4F1ABA01DA2CC388428AD27F2BDC33B41D826FEA66BC75A4066602D9BB3D124A4DFC426FBD9F8675547FC3FDCF2D8343541A7D0C3C3B9D3ED2DCDC9A9898F8D5D64E4B53831D83992923AD74F66C80B7476F472B32A4CC607F5D1919C53A13AAB2A87EB74D06F4CDADB3DADC279B6520D2DFDA867CA433A85DDDE0DF739292632370F8C000F7AF56311141459949CD55A563833D4C6AFFE8601F738CC11CA136D556BA3BD9EFDEBE058E6D8EBC9C81FEFBA6C67A38853F0577A03678736A02652881DC41C8698BCC211A39ABACDEBF4774A1D2E2EDDEEAC6B07230BEB43FBA08FC7BF667FF6CD35F87FB8F58479BDDA7621D159AE9A938A48B0E8009C88E8E1932842FC8FEE4637AEA96C585BB1F4FDD8833B6AF0E20167A86351253C961D1FD4515F4EAA689D6EEF18E9EDEDA86C2A454376BDBD78F9F6C5CB11CEA377222C2D2C282920282429C5C02EC5CA23CFC528262A25C02B3C5E50F6DDDF7564D23C8C1879C5230D0D06DA4FD51FDDEF30B87CE6F5FB165DDFCB53B976E3DB7EDCCAD63379F5F7EFEE29ABACEDD0FEA37B5CFEFBF7168CBB9C3DB2EEDD97476D3AA23BB369DDABDF9F4FAD507D62EDDBD7EF5BE2D1B0E6ED974A030BFBAA3834AA331DB3A07EAEBDB3BBA0786E9E3D49171F00468EA3306872939059E768E4FAFDF3EB57DEFBB7B4FC36D5D6BE2322B084981065FF42EDDD1387EE5C3B95B113A5F8ABE86B405277785A4F68666D2F005C321396DAEB15556E1AC2121490C5C31FAA2CD4834421F803B22422982F548A47901C84E8B2E9948A96224954305AB159B56E28E8B3672747BF2FE93CA53F59317833F7DC90A08ED2B2433DBBAA8D575A3CDADD4A6A68CA8A882A4C4DA92A2C1CE36E608609DDEDFDDD150574FA723AFA87776D232D34BECEDBC4E1E559A2DB37081FCD253FBCF6B3C7863F9DECAE3B3676C505C517C517546657B496B536E6D4771636749537D7E6D4D6E3525AB32253A27C88FA874E9C1E163D777ECBFB471CFB9A51B8FACDA754E55DDC8253CA1A0B1A3BA7FA0076E3426B3B1A72F2123CBDED555EFC37BC5050A503CF36230B2BCBC8B24C517898B298A082E15139BCBC6B7425066BDF8BC5542B22B78A5F7CD5EA671EC9AFB4BFDEAA0F82E62162DA17424B1849954CE4CA2F48565543860ADCEAA01CA0DF6DFB0BDF0CC4559D3FADC13F8F87ECF359BF34F530DDC7A4290513911339150C94CAE81D403AC43C1096407AC833D8774EE0ECA41C90E88EF0CC8026B0F1BC09F00EE340264E97F2FDCB3DE3907DED049D1B41BF44BEBF749A9FA1C0A6BC2EFE84FC33AAABFE1FEE71674566B588686A86432D9DBDBFB89DAE3A3470EF17373EDDAB6D9D2D4A8243F873ED837461B1CE8686DADAD025E4F3A7754A8979F0AF4A902C38E38772A0D508ED09C4A9B181AA6F7F482679FDA1C3FD4D1D950565E989E16EEE3410CF123047AA710233A1BAA998CA109EAE0D850FF707707B5BF3B3723F5E11D55415E1E38BC47F7EEE6E664C191B3D832E53242ECB7E1DE89CF69C7660EC696F4C51435E3321B71197E9A9FF6882FFA894366B7D842F3EB2F6A4392A9496560F03B22B2C0B903DC0B2D021BDC6280CEA3C4D2216CDE7044FE0432CBFBB7D12547A2903184C7D0F1DF21DFFF06DCE18B28DCE1661BC0E6C2CD3688CBCF30F1343B7DDBF2E23DC3D32A71A60E5541A402AFF0C6E834323666A4B291D9D4C96CEF6534B537159646F907BD79F2ECD8AE3D6B141557292A28C8C94A09F0837397111611E517E4C2B0F1B071CD919C75FAE0294B7DF3C8005C4C1031D439D0DBC663CB8A8D9B576CDCB172EB914D07548F297F78F0D6CBC835CA2922DE33262520392D34DBE74BF0D31B6F2E1FBB73F5E4C37347EF1C3D7863EF6EA5ED5BCF6EDC7872DDDA432B56EE59BE62F7CA357BBCFD22B30BAB3BFAC6BA8627DAFB467A68137D0C66C7C070FF3015EE2224D5C7C607BB7B6B4ACBD2487144BF9018DF10724C6A775165673639CB1FE7A66DF44EE9CEF343173C9F1B44BEB72D720C6B0F4D1DC0E5F6846474F9A6747A25555A630B4DFC1A9D6246F0252391E019CB50B87F1BDC0A1445A6134BA8A4126A4CE9506C092DB18C9642013F5BEE174D3275767EA66B7AFDF1872B773E3D7A51159FDC9957D45B5A36D6D832585B37D1D9CD1C18A4B6B5317A7B9874B8F3472646184383FD1D1D6D8D4D2D5406B3BB7734363E5B5FDFF2E2F99B4B147F92975CB06EF9D677EAFAC16EE1D9A41CC07A456A59593299925052975E551A935F935A569F55559359559955559A51111F95E5ED81BFA9FAFAE4B9077B8EAB6E3B7A63D1E693124B76286E3D7350E5B991BB9F6F6252415B470793D9393E5EDDD9994721A767677DF8F0E1D8C17D32428242188C1C0FD71C7EBEF9827C4B44451770F12F1590582B366BBDC4AC8DE27376C82C38B570DDB5353B90A140436286138A7AA23286A2F39829E4269F68ACBAB1D9B13B483F99530F3D5575821E19BAAB685B9C7CF061AFB2D121D5045D4770EE90D9BE4D3D98540D9149C30E290CF61C38DE15989D6B165460115A6215012E9E995007C447EA4CA40A3A329EF0BF17EEB9EFDD02547492346DFB7C535A9C49D9EF5D211EF5C46C6A6F994945A9FF0DF73FB34C62B1BFBF3F2727C7CAEAF385F36757AE58A63077D64DE52BE141FEF555659D2D0DAD0D35501BA7F6744E7692994AF0DF699619EEEC02A603C7C1B94FF696196CEF409ADD59CD3588588F581BCB2BB2131392222348A1FEDE0ED641EE8E5585B923FD5D83EDAD2D35955D4DF54CFA706B43AD81EE5B69515130EF572F5D8C8D214D9EC2CF971162BF0DF7366C664B583A90BD2BBA00C85E8B4D737EAABF8A437A3146640D87CCDB53B7287E31C329E5F4940A2806F2AC837E0BEE28D6914EC49323BFC7963363CAA7911D8466FAC1F05C14EE7083F587E7C0CD361091976AEC617AE6B685D27DC3333727E1DE14934E898865D6B733DB7A991D7DD4FA96CA8C1C7F7BA73B172FAF56583847547491BCFC5C090901B619821C9CB365646649CBF27220AF9BFEB47CDDBBD7BA196096F32A825D43EE5DBCBB79F1A625F28BB7AEDC74E5F0C5770F343D8C9DE2BD224B0879B589E5D5F1E5CD990D0D992D78F79817AA3A978FDFBD71E199F2A5E7E7CE3DDEB6EBCA9AF5A7366C3BB76DF7C5755B4FACD97474FD8E9397549E5A38FA66911B1AFB47BA18CC7E26B383C1ACE9EAED1A1EEAEEEFEBEEEDE9EEEEEE8332BB1FCA6F06933E56975FDA515A3558D53458565F939085B37635B8F5E4DE9E93F66A3ABEEA86A9965E6DE1698391056D01C94D1E713DFE6995B6118566FE0DCE31C071143D00F76102EB154A542CB20F471703D9A16C1E4C281E4C2177C4E5E77B47F8BDFB647AF3E9BB0BB7DE2AA9069A5B315B3BA07ED1575135DADA36DADE8E6430A876B6B70DF5765107FAFB7ABB01EB9DDD5D03D4E15126B37B805E5EDD66EFEC7751E9F6962D07562FDF7268CF29CDC73A8EE6AE3971F95DE55D9DE4F6C69CBAD298C23C6C4649545E1121A722AEA43CA1B430BA20332A3B3A34D9ED6BF07B5D9BEBB7B44E5C50DB7FEEE17EA5676B0EAB882DDF2BB27CDFFCDD674F3ED5D4FCEA18929357DADBD7481F6DA2523BA8D45E3AADB7BFCFC1D666D786F5B2FC7C723C3C73F9F9160A09AD1097582526BD5C486A8D98DC8E590B4F2C5D7772C9BABDF20BD7F34B7FB9F52CC729A02332ADC69FD8181C3B1C939B6F8D54FB8C8FDE323B76F7EBA517810F3FE2D42D021E1880790723AFBBEB4AECDBAF0077C86CA89900F58565A37087E405820F8417421CDC7A8E6920D8768A2DA13FAC8099D400E98F36C7FF079A65F2F53D026FBE4BD6B2EBF549AEB58D00B2C7BFB28A7B89CC98FAA3FE86FB9F5BE0EC8769D4E1E1E1818181F8F8F89B376FC8C94ACFC0604E1F3F626765595749610CF50DF6740CF6B44DD0FA9913F4A99EFD1FD37782FF431AEAACAB2A494FC4FB7904B8DA03E85BAACB18BDDD50A20C75B53369434C06ADBCA450FDF163517E7EC539733EBED76B6C6C44C90E770B9CC5D8D8D838D40618A37949694736EF94C3F0CEC4F0E8DF78349049698BC96616D633522BFBA38B5AB019834994F182A64C97F0FBBBCE2CC1882DC4082B62842E2CDB8137721AC9AC61E63474E0B21BFC128AAD422ABEE2AA1C089DFEA9CC842A665C05301AE9A7F16B62469721EF374D19451284DE1B5036403100771733B18A165904FE7D22BE22FADD57E333B7F58E5DFDAAFA22D9CABD329854164202B88F52EA994DDDE3B5AD60DEBB4A2B9D0CCD362F592ECF2FF493C2A2990282F325C4156464E6484A48F00B08707109F1F18B0A8B2D5BB2F2E4B1B326FAE6E1FE04972F6E37CFDD5EAFB061B1F492BD3FED7A7AE361F057DF0262666542714D5C716B6A4D7F7E5B434225F0BD36B581E419AF7EEBDD8DB36AB7AEBC3A75FCDEEE832A3B0EA9EE3E7A67EFC9BB074EDDDF7BF2F6B643CAEBF65E98BD72C731E547662E41310595C5CDBD153DC30DD4F18E7166179D3E3C31CA608E0F33E8909146192390FE638350571B61F60C21F75BD7D0584367576145948397FA59E5EBEBF61B5E7A80D5B32E700C85E46D0B4AAD768ECA32F28AD3FE0AE93C109A47C7970071003D43F8929ED03C666A4377383244FB444A3533B3A19758D01C9EDE49CAED4B2CAEC3A7253BF859A969DDDB774A75E76193FBCF231D5C11B277B4333BBB98DDDD133D3D137DBD637D7DA3C8BC2EA35D9DED3DB086C91C9918AF6E6CAC686C1818196BEDA15E55555BB769EF895357376DDAB77DEBA1DBD7D56E5EBCFB45DF26293CB9B9A0B136A38A125D58155F5A974029271634A65595C5141711F34BE24A3388057E4E386D0DF3EBD7358E9E7EB8EFCCA39D671F6D3EFB68DD9947AB4E3F5871FAE1B2D3B7047FDA31FFF009157DA390DC02CA20ADAA7FA8A11F6AAC4CA8F1B436B79C397C64E79A350B4445974A4ACCE2E4DCA1A0B84440749DA4FC5A5199455C82CB7945B6CBCCDD2BAFB04544EE8CC22AA747AF634DED0A9CFC7B89E99956EEB6D71EB9DDD6D0DA76DEFCC4FD90C7C631DA76D8E79F00F1F64AEAAF379D05E243BCC2018F3E4A05BE238D332948AF76D49533E36A00E500F44C233F50956334501EBC3C98F7EEA01C8880BA83B2585324FEE24D255468AE1EFB3E830AEBDD3444E391E583C1F9ACC7241404EEC4F236D758CFCBAFBF1E7F64B4FDAAE7C5970077C2838F518F8C525F594198F8CA3A41E357340DEBA850B887BDF9847F6FE5F5D2E0D1AE932B39C5E762F836C82B808D18EBEC67D24601EA6374C638D2F56F823E864CF9F9975DFEFDCD32E36334069D4AA5D6D656DBDBDBEDD9B34B425C585444C0404F871489EDED6819A30D52FB3B4108DC479046F63FA969F8FE5D0D0DF5D6D754E665C48507867A38914203CBF3B2FA5B9A80EFD4AE8E09EA2054ABAB4B8BB5D4D5C50505C1BFDFBBA55A5C5C3C383C3432360A7087B300B88FD2E8E33446616AE6D12DBB00EEE0DCDF2B3FE84D2B6921654EE4D55093CA7A48058DD8F4FE24322DA736CEC6F7C6E6A38A1851D0028CD0D9A5DBC20CBED232AAC673EA3B08398DFE89F91601149BF072BB88369F2464068FD87214D3D3B08E0A32FD9F85BBE129559DA3976D6E3E4BFAE2561144A404131BA3D346C875CCBA7680FB00A5262B82A8F7E8D99645CB14442557CE9E03709F2B2202FE5D929F4F988B5B5A5C6CE5F2557BF71CDCB3FBE0D12367546F3C547FAC7DFBF2837D1B0F6F59B6E3C0FA839FDE9AF8D97A64E3526AD2C88DC96575F1254D0915EDA9B5F5B1E5353194DAA43AA25BACBACA5BE5D30F6F2AA91F3B76E7C0C9477BCE3CDA77EEF1814B4F0F2B3D3F70E9F1AE33F7369F5099B576EFA693D76E6A1A9A788705A7E6A7D4B691FB479AC698ED0CFA207314CCD2C0287D9041830B01CB0895C6648C4D0C50990374663F8DD9D6375CD392838DFEA2AEA3BAFD98C6D1ABD6B735F0FA7605F661156E51158E04B26D78A29E53B563E430B610697E89A4D08965B4284A0F368F9956371055D8199ED54F2AA425960DC697F6C615F624155784262439F9BB691BE95CBBA776E282B6F21DBF4FD645C45816D63BC7BBBBC77B59641FE81B1B1A600C0F8C30685037ED1F1CA08D8F0F8E8D3676F790EBEA8B6BEAC28809074E5E5AFED3F63D074EAF5CBD6DEBE603D795EE5E3C76D5C1CC392934A929B7BE35AF1180DE9651DB95D5D09959DF96D55093545E442A4A8FC80975259AEA393CBCAF775959E3D0B9C7FBCE3FD976E1C9C68B4FD75C78B6FCC29325E79F2E3AFF887FF301B983C7F73E7CF1D62320249F9CDDDA593B40EF1E9DE8A78EF4F6F6DF54BA7A66EF816D4B961D5CF37FD8BB0BE028D2456DC06159DC21EE4E08EE0E091077777777772382047787000971777777774F263319F749FFDF645896B5730FB7CEB9E754FDDBF556D764266437939EA7DFFEDA8E8B6EDD21B665C7816DBB0F6DDF73641BF3D1EDCCA777734AB0F35FE314BEC621A8C8BB2F4CDDF099AD674ED8AD9ED7299981B1518A06F775ED032FE9C4ABD8A7B9C415053C02B8A738C5BC32F6FBB64F155413FA71B76583607903010F4025670CCBD08A8781E3BD0F7380EC4D7149A32F4B80E9E02550E791696D600500824C6BF957E1FE58D1E14F712FF3BC077AFA1FF33BD619F91DEE0E9795FFC6FD1F4D48F432097C2C31A8D2D2623333130E4E1636D6DD674E1FAFAD2A9D1A1FA2E0D134229A805E2262E014EC121105FB83DDFF63FE20F83F08168B9E9E98EBEF6AAD28CA4D7C9FF1FE4D557EF6446F3776719E8858A2FF34026E6A68E05664942007E7969FD65E3C7D3A2F2F6F6C621C8DC500DC090402908588C59130B8DEC656954BD7B8D66CE6645A1F626003AB6C9FC8A926370E021D60792D00777879F75255CF97C8476A872F0B32EDDCBB8E859F69BB92E899C4D07BCB95BD94C631F06D7329354D373EF6DC49E9BD9B3ABD7A2F79B0418A5FBD1DE5EF96F56FF951DC23944D036475EE993897C5BFEC4FCAEBF99237595843EA19A30E4D03DC472A1B9E8445EB4BC95FD877F028AFA0381B07DFD6ED7CDBB6B16EDCB8858969DB860D87F78B5B5A5ADF8EBF1F1A76DDDADA5949415BE282FC99C312178F5C3355B38EF3BBD951D1DA5FDD0E649FACEB9FA91E98AEE89B2D1D982B1B9CC8EF1DCEEF1E291DC97B55E46E1260A06C6BA4E3262B6725AFEB754DCF1B44CAC847CED84FDAD85B52DFF5828EBDE04555912BEAC7548C141CBCBDEEBF7A5DDE5033BB3C4A8166C9442444C14034148D84A212892B54FA4D8A8924D01A685802BDBF6349F40ABF8499EF182879F725CCC8C15D4E0FF8FEC229A434E675C3BDC4FE17B90B4935F531EF27DF9510F37A2885F401774AF110B968109DDB492E1FC0AF1EE0349B5E47DFD75DD903AFE89CC8ADCBBEFDFC9157A88F8EB98B9A5EB88D73E29D473D659598B10968791942216868040DBBBC824583059842C082F602364C091432964C9E47636004C20281D8D83FF02E3DCBD92FE4B484DCD173572F5E533E72ECD2B52B2AE686F65AF2FA59EFB21BB2EB26EA4796DA6616EAC6662A0717AA86971A26169AA606CB076AD31A529E67C5053FB2350FD4D1735737F491D6F190D4F33AAFEF7DDCC0EBA0BECF3E03EFBDFA3EA2FAEE3BAFA9B3CAAA09A8EA5FB475F378F236BDB5B7178E9BC152C016C3220C696D626DA6AE6728A71268E5A072E2FC816D7B8EED66135BB7497CDDD64B6CDC523C22126C3C57D8F85585C41579F69A1E3AED745EFAAEB10D90FDA1A9BDF725852805FD1049DDBB6A8E00F742FF8700F70CB79B9F6CC26F29D9865CD67FA2EB517BFD2D2AA379A574009FDB01CA3B58F0C08A93813B28EF4B5F9ABAEF6735C626B6DE4A997C5B018A3C781E980E3A3B7DFD4A3F66867173F3DF2FE420FF2ADC8B5C6FFF697EB72B9511C60ED5BF71FF67A7C5A5052299303737F3E8D1834387C57F5ACB74F890B89BABC3F2D21C1187A412508075803B098B20A216900B13BF85FB9FC91F04FF07C162B1B353E8A9D1B1CEE68AECD4A4174F81EF6DD595F0C9710A12B1BA23170B9F994A7CF356E2F499AD6BE9D70DBE7FFF7E5D43FD026C11E04E229100EE7834068F448F76F66A5D93E7FD791B07D3BA001D8BD992A6E1F4325C4DCF7251C77C762303F7F1BC8687AE61920247F89876886FE6E063DA2E2D70ECAD6FDC7C511BB16E185ED006CB686888FDD0792BA9E366E2C8931C6256FBCAEABDE4E9C7B3FF6171FF9A1FC43D54C1C84746EBB6B16349FC8B9EC45C80FB444135C09D3C3089EF1FAFFC94EAA8A17751F480E481A397C50F8B31B3F26FDDC6BD71D3AE353F6D6562E26567D754D778F9EA4D474F7F654DF3EDBBCFB4B5CDCF9CB87AEAA084868CC19DF0A7CD85ED335D53A38DBD7D656D03C5AD13A5DDF39503B0F2E1F9928189DCEEE19CCE91E2A19C1705AE467E7A8AD6065A2ED7642DA475BC2EE9785DD0F1BCA4E72961E02D69E475C1C0F58C8E83B882B1E0554DCE4B8A02526A92566EDECF3FA4758FF411699314221C22A3211A8246445257F757422BF4CB7A50A8F4D14F2C11C21056E0180843A22E2C8FD6B5A5C5BF8834767297D1BD6DEE91E2179F1BFAB8E57EF2527A636B7CD2DCA74AFA81D5C583A4C2016AC930B964185BD0B398D9040A3BAEAC7736B37E3AAB76BEB8A527A928EBD6B3181B770F0D632B79357F339BC47B4F866A9B48B3F360F981B0C815DC6A0828B0D14925614167074B386C19418220EC0A34B2B0300647CCE07039D575AE2191575474CE5E55BCA2A8754D41EBE265052D0D53476B4F134DCB96E2D6AED28EF1EAC185867120FB6076CB4046D34841D768F9604D4ACDC77B5FE2FC1F385B06696B3A2A693829EAD3D788170D7D4F19F91F350ED86F1C206A1228641C2868ECCBAA62CAA561CA22A7B34B52E9AC85CBF5CF9915C3737D0B98D159D4E8E8BCA1A689A18AAEB39E79E693B777BD438C2E494B70098AAFDD28BE66C3554E7E05FEBDE776B05EDCC9A62EB45F9D7F9F0C338F12A7909784FC3D239B48451DCF0B32A1D25A6157F5EFA93BA53AC716F83D00B2677BC6A7BBDE78A6EFE57F4E0B109FEB7D7726A19C5ADC07FA3B501E2C7E8CF174003798CF7DACEDBC9BD17CE30B98CF26D400D61907B903FD01FD2038FA6D0EFFBDB8173ADF2CF8B3FC8E7546FEC6FDC7A625040C8D45B5B4363838DAECD8B965D3E675FA7A9AC95F3ED2C8382A090D64C7211749B8251A0949C6C0FE0F70C7CFCF9061B3C889E1F68AE2E457CF3F3E795895432FEFD4AF973A409196112D55D50E66E6DC7B9837FFFCB3ABAB6B5A463A28EF08E4327D448042C1A1D0B865D4DCD098A1829AC0869D00775F4DD3C982BAFEE422746527207B2EAB613AA7015ED9D39D521662E4749C59886FEDAE433B7801F197790E3E72091BCFA9C7D60C200ADB97735A188742B6C67E04E51D9DD208166802E3A6367F58DCBFE607710F9137F496D664E0DE9B94D79B9C3F55544BE99B20F54FCCD4B5BDBD7E4BF9E4F9A39CFCD70E9F0001B80B6CD9C6B57E1DDBBA75022C2CD2121291E111F50D4D1822A5A1B53BFEFE0B0D0D93D327AF5E382963A466F338F65D6B71E758CBC8504D675F71CB6051CB5449F76279FF42F1C04C7ECF644EF77056071DF7E7F92E86BE0CDCAFCA984B68B99FD2723FAEEE7242C3E5A48EFB693DF7537A2E27741C8EE9D81F50B3E093D662BBAC20ACA8ABEA1B7E2BBFA26C7A7194885B8480EF94451A014E2560212A115AA15F900FFC21E8D7B5C0919018FC2202C2D0C767960727FA0B6BDF87DC0AD1B68E36747A6C1DF0D42A20D53BBEF3517AF7C37458721D901D8458D00F70A7948EE08BFAC6932AD1A5DDC49AFEC582E6B1AC6A207B7AF4C330233B67653D67555D20FB9B1B777A2AABA94B708848DF210458A7E111ABB2A3E80345440C901D4F212C221144B09D4AA5F6CECE764CCD348D8DDF4B489433343D70FECA65454D052D6329651D19056D03031B3B0B372B7DFBFEBA81FE8A9ED18ABEF9DA51D0D92700EB59ADA3799D951FCBDEC4BE0F76BC6E6FEC6DACEBAEA5E5A2A0E52AA30B5684BE678C7C8F99048A9B068A9806F39B05F19987F09A0570E8388A9AB9716958AE3B23C77A4D532FF8F6CBFC86F2AEC93924D43730ABA564A82BAFE3A86D519F5A54F331E7894FB8FEB17317F7B01DDFB44D8A8B4F8E5BE0F4C6ED67376E57E214D014103BBF7EBBE45666CB03277D2ECB065E550C95510D97D28CB86A00704F718A018E83FE9EE375073CF86019127841274ACA34C12AB4F7510658DE80EF98AC56446A03209B213B36AB6BEA5D65DBEDD4969BC97D8F72E73FD5812719E7AF826FA0160D81E0E9B739FCF7E25EE07423FFCFF23BD619F91BF71F9BB078CCECFCCCA7CFEF25242FACFD9969AF98D0CD1BD787067B68640C8548AFED2054E23244C580CF0C0E310BE151BFB5FB7FCC1F04FF0759C57D657911F83EDAD69897F811E05EF025A9B7BE0E34773C6C01BBB8B082C5C026261FDDBC7562FF81F54C4C6A6A6ACF5E3CEFEDEF03B8535727D0DC09280C6A66C152434F742B0B27D37A1F0D93F1BC9ADEA482E5B236803B68EEF3052DC89AFEA68F798E8A06629BD805D7331F651102B89F61DF7BCBD66F20B50255D98B2CEEC41676B6DFF902586F8EFE00CA3BFC730D588E498CABA7FE6171FF9A1FC1BD30F497E66EEA5472F7557F72417F7AD16C69C3CAE034A673A8E6535A90898DA4D8A1533C4292E247CE8BEE17DBCD22B0710BC05D68D72EA97367427D7CF373F34626261118C2BDA7AFCD6CDD4F9F953EB4FFC2D9A3D2AAD7F43DAC821F473D6F2E6CEC296B1EABEE99ADE95FA818982FEE99CDEF99CEED9ACEE919CDE91A2B1ECE5D6DEEFA4A3686DAAED7E42D2F6A7B1ED3F238ACEA7248CDE9A8A6EB715DF713FA6EC7F59C4F1AB81E3774DEAF65C523A7CD29AD71C2D4C1F2CEF3DB79250378F40C15BB00116729D845B062852838888AA390C8540A1A8D067F0BB0A2C5CC2FD15038E03B76626EA975B0E275CA538FF01BA66E51DAF6614A16F13AAE9F9CAEF73ECB86A73600D94179C7E7F5928B06417307B84F2657CFE634CEE5368CA655B4BDCFCEBBFD2ADECEDB4E56C35BD734CECDE7CB83671DA595A88949080F961F1C11B144C52D93F170326E99845F26E05178B02810B168221E8EC721C8E4391CBE6F61A16660F07D7E817D48F8190515E193172E2B6B49ABEA49CA6B28A9196A6999E9A899986B59F754F600DCC72AFB01EEA8A66974DDE47C71DF4066CB8BD0A7FEB6A1A6AAF67A2AB6FADA6E9ABA1EF25A6E125AAEE7F4BC8E1BFA82CE2E6216C46F16C2651ECA6E1EC26E1EC461E02662E92D68E8BA5D4A6FC725F513FA4E0E71AF1E24162FE2A0EE9E3903750B6B5D3B472DAB9AA482FE8286F2174911BA66B6672FABF08BCA73095C63E13AB769C7B90DDBA5777128B1F39F5DB3596A1BAB2E9F98A1D0013F09B9BB5A2661D734C224F5EEAA39263B4683CE0E8807B8830A9F641F05640FBF62F458C7BDF6FA5BB0D4D14AFAC15207CA3BE31C25D0CD51E9ED63AF4A81ECADB752869F172D7CAE07CFFF0EF7FF83E65EE472ABF0CFF23BD619F91BF71F9B56205ADF406F70883F1737DB4F6B99E415A4B3325370D865803B68EE80750A0101E6A0B9537130226AE1DF8D3B617E065A8641A825D8705F4D6E56CAABE7D91F131A8A0A897018626A62616C948641AF6071D9495FA42F5E5AC7C474E1C2851BB76EB67776C09711F4BF288D46C4E2C8583C198176D03715DFC9C1C5B401E03E9A53D593988F286D05B82FE4342D957460EA876ADF669A4AA880DA2EBC99ED04E75E9E353B4E300B5D3773EF4E2C5E2EEF469574114A7AFA1E670E3DCA6A894900594CA8642CCA2B057F7D879A1FC43D5CC9C44F4EE78EB94BD9FD374369C54359A58B952DD0E8FC6243E7DB881B7AE7AF5E12D92FB1F7E01981BDE27B3884B6EDE4DFB09967E38663FCFC4EE6A605E919D39353D3F30B5DFDC326D68E17AE2A89899F3E7EECCAB5CB1A4A570D74E52D6DB59D5FC73D2F789BD65FD4B2503FB45839087087170FA22BC666F3FA26F37A264B468B5E157B98061AAAD8811E2AA5687D49CFFB988EE74155E7FDAA0E87349C8FEAB91F37F03C66E87E48CFF1B0BEC3415D5B2135635E453D514DB373B65ECA7E21DD18C43819354BC34D93D0B3240C022261200A8A4C20D1A8007702064B4463718B081A9A3E4483999CC70DCC4C96B7563C4F7AE91919A9E310A8601AA164755BD3A9EF790EC09D523C40C8EFC1647711F2FB884583B8C2DEC5DC96EEF7F9D5F73F16DE7E9D1C76EF9E6340A0AEA59B9AE1E3C08882779F275BDB3153D3F8F979DCC2020EB680832FD24711B13002168EC3C1B1B8650C7E198943C1F1180C8D3AB1BC3C8A408C2CA38A5A3BFDE3EF491B981E9755123F7FE58A9AAEA482E615054D7D633BB0E9237755CD54C3B2ABBC6BAC7668B67664B66A085635325FD2DFFAA63829FCA59781B7B9BAA3BEA2B59E9A9DB6B6AB82BAA384AAFD6935C7133A1E07F57D448D02F84C02384D0259CD82779B85309B05B1187872E8BBF2E8B9F168DB73C899F048EB5F307035F18C6DEE831596B49BE93B4679C706DB04D47C2E1EAFE81ACCAD4E8FBAFDDCDED9F3AA8C86A0E8B53D6C5777B280486EDD7D65CBAEF33F6D5263E7D360E393DBC6127059E69D955388A472C865FA0E55A039E350992C8FDB0077F0E08EAA43C455E39B8A36E0CB85C46AA86C9071F930C6E50770D9DD889416607A535C1228EF4079467367BCCA189407C16675FCBB712F75A75FFBF78FF91DEB8CFC8DFB8F4EB4D6D6660B4B939FD73181E66E666A585F5709D18800F7150A16226301EB24DC1209BD4840CE1290F33F8E3B7635C0EE7F620E9AFBDC3484844158147A7AA2ADBC24E3FD9BCC0FEF2BB3B3708BF3F32343137DBDF45351A894AA827C35195980FBB1A38723A2225BDA5A01EEF4A35B575688780285405CC1109C4D2CC559B83999367A6A9A0CE5557526E6C1CA5A978A5AE7F31AE1E5DDD8A6A1CA37E97AE7653899B6896C673FC1BD8FFBA76DC7760B449838757C2C409475A04BBB49657DC32FF2469EE735C5263444BF9F7F5FFE3FC85E48DFA1FA47D9290574DC2945BFE28EF986BB8AA9BFBCEE3D4BB7AA87EF46324A47B34B97AADBA0F1F9E98AFA587BD7ABC2E292C2FB640F1E3BCACECDBB6E13909D7FFD3AFE8DEB2F888B5D0FF01BECEEA6D2C0F7C2F22AEBE5754C8F5C92133B714D42465F53CF495BDB595DD94647C5DA52CF3E3EF876F997E2918ABEA9F27E8014B6760AEA42CE170C4C178067C60B578F963154773231F0BCA66C775EDFE7808E8FA8BA8BB09AF35E4DB7FDFA9E078C7D0E9A780B69390A6AD90B6AD90A6BDA0A695AF1AB99F32A99F0CBEBB6A1304344EC24853841C04E1170B0153212A2224978F20A0D8341E171180A28D48C13D970E03B16A89330F2F0FC584953C68D67F1963E313A8E719A8E31AA76FD2F7201EEC4E27E4C5ED77266073AAF075B3C802CEA819774553C4A7CE375FDB173709CA58797869987867188A553EECBF7A38DCD10FDB4383C727A7A767870697A02875C246016F198451C1A86C1C0D018F832160EB63717712802040D2C2CF4CC2F8DE3C8598DED865E81FBA5558EC96B9E90D590D135BFACA42BA76162E718A0AB652D7349CD5AC771B07A68BE756EB17976B4B8A72FABAD39A1FC8DEF7D3B694B03190B1D795B5D35577D7D6F156D8F0B0AB647E4AD0EA93A1ED0F51231F0E137F2E7320E603509D9631ABCD32C641798EB7B6C52B1DDA96E2F64E223A8EDBCFBB236CF45CD33CA566F92AB9FBFCC34D5757A15FFE17EC0DD96F4DAA5A67164C350FBBB94921B0F6EE95BE8EF3D22BD875B895D50918DEFEA16E6736B364BAEDB6124B05F8395F7F24F9B8325E5925D7C00EEC117D56E295925D98565B8DDF8621799E97EB3D0F73EC0FD89B67BE43593E86B1619AEB767DF5742A5C350C93029FF2BDF00777872F3E0D382A698C48EDB6993AFCBE7136A09D93D2B45C3F42B2D67D1CF2303A15FBCF74771CFEF03B853E8B8F7ACE2DEF71DEE06ABB8C703DC0B1DE8B88379B9E7BDB23FCBEF586704E09EE3733BC3FF2BEEF612CAFB37ECE163DA7C9C5B18353A4D82A3202285462293FFC69D314D4D4D848604B1B1326FDCB04E5B4BAD202713855880C878320E05B66DC146EE6AE034ECD7AC60967F24A8AF41A3FFC93984411317E77073B360C540822DD6161524BE7A51909A3CDCD1B63431363DD0474122084B8B1DB5D58FE2E2785999599877ABA8287DF8F87E7A760A8D45CDCC4D83DF080187F5777745F8F91FE41510DCB65BF3BCE4439F909A0F291345F50B25CDA89A6E62DBD878717DBC5B10582C7631ADE3D9BCD35441937DCDA68B7CFBF54E4A3E710A061D7F21BB9E5CDE8B486F001BBCED77BE34DFFC541EFC0C9BD94A2BEA5BF854455ABD97D3AF779C58BDBB1008FDC4A55F4EF4009F81AF4749960E900ABA415BA777F69C76445A2326AF6329BDB1FD516AA49A69A8AA61888A41D1AD27035F727B92B2F0CDBD84B6BEC4C81B0A6287CEB171A91E397E9C85456CF3E6D31C1CFBB76D39C9BE5BF7F299BBC1BEBD4D7560B36B6276F1C5974CEFB88787A4348E28189E54B538AD6A0DEC38AB647559C55646C34E41DD4A4DDDD2D126E0E59D0F0D190DA3A5BDF3E54388AA314A3B6230A3ADE45961E2ED9458EF0766DA9EDA6A2EFA56114774BC450D02440C03448C03054D0205CC02F9CDE9E132F2E132F0E6D675E7D674E15671E454B0E392B5E195363DA96D75372D6F10B7B208419364EA2062796C1981592113682412054F21E3A904EC0A1603FEB8100A0532D5DE0D21F0101C3F56DA9012F92052CB2658DEF4A1B1172AA76D31B57E31AD8950360C35C3684DF34B45FD83A97505F712E29D82ACAF696A9DBC6622A91464E19CFCF06557690D84C201D9C18FA56150542C8A82459056431F93C1C349783891882010913832064DC522A944340481FFC33E242EADB1C7E5E6B3E3EA965C1754F82EA91F9233D4710C39A760227E5241CFC05D5FD3D940D9FE79CCC79EE2C1C1B2D191F2B1AEDCEE821745F77C1F3AAABBA89ED7D75776D754F55251F391D3F091D4F43AABED7D4CCF57DC2040D0C08FDB2880DD2488C53484D9347CB71923A13B8DFC7619F9B01879731A7AF3EBBBF3ABDAF05ED1E73BADA26511E4E97DCB5CDF4D4FC6E89E5F7CD397CA9ECCFAC1F45A58611BAEBC7B34B1E8858D9F9ED0F10BEB59AF6DE1D4E01053671755DAC9A7B89D4B7D0FAF06339F2E87B0E3C15311D754EEA998065E50BAAF6A9EEF73A3C8E7F617FBD06CD7D8F2E0A78FD55DE2151D62AF5ADD557629F77F854AED800AC79029EDB4C2218038EC73C3E8F3E29E7B597D77B3469F14CEBCAEA05FE361B56E8330AED4060280FE2BDCE915E7DB72BE7A4E13C37A5AE100EC731DB500149D3EB0A50B7027A436279A063D56B4BF236D96A0E755EE7E13A4CC25AECAE376B9EB8D12B75B256EF17F0C68F47F4CB1C7ED2CF7B84C9F1BD921775F3A079B9CBA26B476BBD056E66B27CF919731F4B35D20084F2460F138203B153C5E3D77FABF76FAB7E35E575BEDE860B76BE7F6EDDBB6589A1A559515E3904B34227615771403F76FB2FF38EE20BFF8FECF05C2A281DDD88539C683FA92A22F6F5EE5A77CE96B6EA40FCB8C0E13E130CCFCEC507B6BC2B327421C6C1C2CCCCACA8AEFDEBD01AC93A9242C1E030A22D81C191B1A7C74EBB6C48953C2CC6C2A672E3DF40FAB4FCA1C29AE992D6E445477625A067B732BA21C3C0F71F0D3AF42BE87C35EC7887BC3F6737C621AC72E3E74F08397B42C64D690CA7AD0B96D39DE779B6E7C6C88FD501DF91A000D6A3832B5F18FB8AFFC017786ECB4925F71A7DF5527B7039ED1047007F38EC769B1DA56818ABA919AA625B79EF67CCA18CF29A5760C8EE516FB6BE89EDACD7A6CFB4E696191C33BB71FDAB14D5290FF343BCB19EE5D4E5A72498FEF8CF57690C9E4BEF199F8B75F4CFDA3F74AEBEE53343DA4667358DDF6B08AF51165EB53EAF617B41C2E2A9B5F51323330720F0FBA9FF838ADE253F9405EE752CDF872EDF4685E77CD87AA849B49414E7106EA2E6ACA4ECA060107757D058D82048C83F84C8379CD82B92D42382D4338AC42D8CC02398C03380DFC3875BCB9D43C7894DC78E55DF8E5EC44E58C025F7CA99E581E2642E3A495212406E08EA29100EE642A8142C65109AB17A8007F59141264A6A79FEEF2EC725B46D14B9FEB416AE6911AB61F5DA3A793AA4016329AB16543E8F2A1D1F4E6AA275969B16F020D1C1D558DED950D03CD9D1E87C665BFFED85FD5889A98A677760C06FC583AEEB86586EC20A08800DC2904C437DC81FD081A1106D1E620A87B199F50D56A127A7FAF8219DB454DFE6B86FBE54D14AD024ECA991D3EAFA567E4AFABE166AAEEF13E3E73B87ABEBB70A4F273D3977B99B7FD9E7899879AA9396AC8DA6A287B2BAAF8CAAAF94B6AF89DD5F23FAAEBB74F3F40D02880CB286855F650003A9D75D34866D348F0608769D04ED3001613D0E8FDF80CBC04341C05A44D05CE6B9EBC6AA463E0A9A968A12B6DF834F4514F4EF36C791FA27A703EB78D5C3B822CEE2CBEFED25F4A4F9DEB90CC7601E92D3CCACC42F2DBB815B671ABEDE253DBCDA3B18BC79C5FDCFBC4A55819AD7009E5A7DA36799E51B91E5199CE1185DEB7CA021E3CD7F678A8EA1277CDFA9EA26B99DF2B7432C07D129BDA45C91FC2A477CCBEAF1E7894D7139F31703F67E655F9F2E7C6EF59FF7A8D65FA3D527ABEBFFBD5F7019A7FEF3B0377723E1DF7C5C43AEAEA69DB74DC0B01EE4D74DC956C01EE9FF43C80EC156E74DC6B80F2AE37CA5CFF1CF762D7DB7F4CA1DBCD1C373AEE39C174DC8D4E5F13FC79BBC07666C953E7E8A746AF9ECC88251256CF3DFE1B77087AFAE49192A2FCA68DEB3939D87C3DDDBADB5B28783443F6FF14EEE465386E719E864602DC5B2ACBD33EBCCB4B4E6AAFA95A9E9E04BE8397C01C363E5A92997E40901FE02E2971E97A54446565F9E060FFF0F0E0E4E4380A89181B18F8F2F69DBE82B2381B97D4A113F77D439A5373878BAAA70BEB61156DF0869EE6E43C1F23EBBDBB39D8376C3B29BA3FD0C10D3C3ECBBB5771FFA9782B8F85C2C6D98C2A7C7127A5ACBF38E8494DD49BAA8857C0777AFBCEE920E575FD28EE8C4B8611F2BB80EF88CC665C41D772564BD7D38C3B060E7E321A71FAD665F1CF3BDEA72C57B7AC740DE6C73F343E7DE12207D7254EEEAB028207B76F3DB26BC7055EEE237B765CDBC71FEFE7DC515EB0343DB18C445777F4F9DF797ECDCC45485A4F54D164BF9AED0175BBFD2A360754AC8EAAD99ED5B03FA7687E49C15859C3CEC6C23FD4FDC6F38897E5EF8A27CA06470A7A26CB873A323BDEDDF8EC6A16ACA3ECA0A2E820A9EA7258D757D83008F8CE6F12CCFD1DEE1C16C15CE6C13CC681BC06FE7C5A3EFCEA5E022A1EC24A4E1C17D44D43E33F54B435CEA2C688B4612C7E6479194E25E1564844FA6D2C71A028ACE0E90A4368BAEFF0D1090883470F4D153C4F88B174F55536BC67E1557EF3DD5C46C37C66232CA76D36BBA5ED755E62D0A33873FF005D47830B8AD6F2BAB14E7E05AF93466ADBE1FD63E49925084DAFEDDFE3FEADB903DC2984A5AFB8935158CA57DC27F1B8191AD40EC73CC82E93730CE196D0E6B8A42BA6687D48D15242DFEDB89CD91969533DE3002D7537735DFF8F8FF3DBCB264A921A9F457FF2B58A325175D291B7D655B6D3D3749757F6B8AAE225A9E6754EDDFBB8267D084B58CF8FCFD08FC33888D53488F917DC77ADFA4E57DE226C8F45305835F29806081AFB8BE8B80B2B5A8B4A1AF21E92919233979732D457307F1BFBB6BFA863B16E84D03E33925E47A81DA6348EF57F287CE510EC724E51857DBFC40676C5DD02725BB91477F06AB00882F2AEB49D438B95CF42F860E039D9EBD7D4DF9A3865BA84A63B851478C555853C2AF6BDFBDE38E0B9B6D74D69DB3BF2CE859E4F97135BA1A22962661F396F7039B965FC6569D79D8CCE9BA9C38FF2E11FEBC9593DFF6DB8173ADFFC63F25DE2FEC6FD07262747FB23870FAEFD8969AFA8F0ADD8EBD3E32310858047C1FF83B83358670CBF7437D465277ECA49FADC505ABC3431869A9D06B57D716C04AC00FA5B9ACE1D39C4BA6BBBA88890A2AC8C8BB3636848507858C8ADD898174F1ED7979527BD796BADADB79799FD149F488C932768EE83059513F9B58BE5ADF3D5EDE56FBED82AEBF06DDE25B09355E9D2D54751378EF38B9EE216B92278F0BA91C34C6EED547A05AAB00DAA1AAE5FEDEC057E0F00EECB698D88E47AA874F04771A714F5E2733B8805DDC07764762BA1A80795D3D6F33CEBBEB1B3F735D5BB260E25B79F747D48A5B50DA0EB5AE3AD1D350F1E51163FA0B4FFC015218193ACCCA7D859CF71731EDEB3C3E0EAD9ACB78F31B3A358D4D2E8D4EC97920AD380EBFBE4F50464F58494CDC4D4EDF7693888A9DAED53B13EA46E7F4AD3F1A286BDA4AA95BCBA9DA6A6A3B1A693BBA9FF8BF097D51FCB1B136BC72A467A8B075EDFF8646F14A0ADE2ACACE47841C1FE77B803D919B8735985F25886823A0F4ABD905E80B0B69FA8A6EF5E757796B32AB276FEA16F5272BB474788D0048932864201DCF110F937B863D10CDCC93004C07DA2B9EB4DD46D1F6D333F55E3379E515DEF7230653DF3D94DBD0945A5B73F3C7608F79437B596D0B295D10F3377BBEB135EF8E6CB7CC70004C340303471660137330F640701B2FF0677DC120D8F60E04E222D337047D370088834B48C98A2428D73CB21AF938F69D9EE3EA3C473C5F0A896CB710DFBD31A76C715ACAE683869190728AA3A991907BD7A90FBE945E983EB9F3C6C637414EDA5250C65AE1AAA29DB69E9794B2ABB5E50F538ABE6714CC3FDA0B6A7A88E9780BE0F97A12FBB49008B69D06EB3905DE6A140F66FB8B35847B25886735884F29907899805891978EF5373D82F67217842F1AA9C999C94A1A9A6FDE77B8903255DD3D5439896C9E1F43A44452FAAB2B7E35DEE7BF7283F691D2DFE639736B22BEE1194DBC1A3B44740876BAF36BB90F24E2ED53D5C06DC222E07CF02DC132CDC521DFD93ED024AFC6ED7473E2FF0BA9D621BF9D6D0EF96AC0DF03DCBE9EEC2FB7AD0DC293983C49CFEA5C4C6A12705AD3792DBE392479F1462925BA1C2E1FF36DCF31DE3FE985CA798BF71FF81494D55998F971BE07EE2F8D1D7CF9FA0E08BD00A19B534FF1FC41DC263498825221C06701F6A6F2D484DCEFC94505D9037DED3057CC72ECC2D8C0E432402E8EF4A572599776CDDB16523205E90976BAF10BF303F8F9810FFF1FDFB9EC6DFBE15166624AFC8BF75FBDEEDBBDD750C8B5EBDEFCF2B07B82F94B74E9737673F78AD775996EDE7CD0778046D0C4C32DF7FBE72F8E4716EE1D31C4281DA16635995A3A9A588BC66D0DCFB9F6637DDF898E214531EFA7CFA43D9F8AB42A86CE84771A716F711F23AC945BDA4C21E742EFDAE6998BC8EBE9739F70C1D7DA5D5EE9AD8E7C5DC1B49CD87BA06BB3EA779C8AB5EE1E25514139716163AC7C5719E9BF33C2FE7391E8E8BC27C614E961DD545100D87C121EBBB7A6EBDFB2463E5CA71495940D14848DD5A4CDB194454DD01287F40D3E9B88E8BA481FB356D67594D4705155B3929637529134FD380A721CFB21E653767B63566B53F89FD68671AA4A3E9A6A2E17A49C5E9E05FE16E13067CE7330F01CF836F10D60B10D5F617D7F2E2B9AA7F52D7C138E4F6EBB2C601FC0A00741C8B81D3C838FA757589142A1E3C5C21A05670483AEE2058020D8E6CCA2D8A71F17256D60BD6B5FA1474A32321B7F37D4EF1ADB7AFDDAF47EA39DA4B681A9F55705331BDE914549B94DB9C5332D5DC0DCD839F40A2CC2FA1C7A690E353BFC11D4BBF2EF4F7B853897006EE38F0DACA57DC272950D9F0B44DEC439E2B5A3B4E2A0A29589D32F03EADE77E54C5E6B49AA3AC91AF82BE8F94B283A149F0F5A80427BB382BF3301D6D2F45253B29394B69454B597507595DB7B3EAAE2735DD8E6A02D9DDF7EA790A1978731BFAB01BFBB29805EC360FDA651EB2C33C74877938088378569B2856AB08768B501EF31061B3207123DF03DA2E87556C45CF699CBB6674F19286A98E63C6EB9CF1869199863154FBD44C69D75C717BE7A7C22FA1F7A3F4ECEDCF2BA8F21FB9B89943814D5876379F128BA00ECF3E2D6E11E5DDDC2A7BB8F4B8852D458E045F9005CD3DD9DE97817B5DC4B33C8F9BD92E37124C836ECA58475D364BB28C997C51BE923F42CB1BC665F62C7CACEB7F980B70EFBA9536F9A2149FD601158FFEB7E19EE710FBC7E43846FF8DFB0F4CF272323CDC9C1B37ACBB7CE942D2C7F7040C12E0BE3437F59FC21D04C0CD38AA1DF83ED1DB5D9A95919EF01EE0DE565D09BE044FC2C647210A097C8F998E16CBB62D9BD7FDB46DDD5ACEDD3B795999F76CD9B49189690313939996968586A6CCF1935CEB3672AF59AF7FF14A62DC9DFEBCD2A9A2DAC58AB6C9D2C6A49B8FE48F9FDFC3B4FEACF8E1089F80C6D24AE58B578F70091ED8C5E9A16230945136945CBC98D3B09CD50C4BAEEB7F92F5C63420CD25AEFB415AFBED24B010FF2F70A7DFF0ACB80FF80E58A7940DE00ABA06DFE4DED0B20855D4BDAD6F9D1E1C0B2FAD2536757EF20FB3B97405E0AEB45FFC320FF7B13DBBCE72B38B6FDF2CB675A3CC11F1F4D78F6747BA21883C8F58CAAAAC71B87EEB90BA318B84AA809A95A0B6C35E030F10111D57516D27715DD763FA1E170CBD2E6A3949AA3B4AA9D85EB96674E582B68E9C859B91DFA390171FEFA57E7E92732BFC8D8375A4B68E9792A69B8496E71F71A78FC9AC063C06CF80E7C1ABC2FA817B7502C475BCF7AAD80ACB199E377189FC98D906270040473158C4EA8156DF7087886085BDBADA06B8E3F1F0D1899467AF5C748DED15B5C3CD1C5FF946E5DE7A7ECFD63B58C3D2E99AA6FD350D5705C31013E78FD71F36A595A006279707C708E3F310020321B1A48525C2DCE20A12F9E7B883FF32617985005FC51D4EA4A019B82F43D4312C6E820665B60FAA7884ED382EB7EBACFA012DB7D3A681678C7C0EAAD89ED7F392350FBAA4E12AA1E6A46B1166E57CEB8AACAD94A29D8CAA93BCB6AB9C8E9BB4B69384A6E3590D7BB0BE3CACE77E40DF739F81A78891B78089378F992FBB853FB3B9DF2E8B801D16413B2CBEFAFE0D77668B3056B3602ED32021D3403163DF03BA6E47D41D04CFA8EE3BA924267E594FD3B628B512D6BF34DB36056B9F1A2D6A6BFB5C9414F1304CDFD1594ACB5E42D9F28C8CFE81B32A3CFB6499F9E5F6F0AB738AA871082AECE65262E6D2E51636E1DFEF7AE8DC0375D31407BF34C7A07CAFE8F2C0BBF99E370ABDE33F5B84C65EB3083AADF75A2F68E07E1E397B809A3BB894D83CF9BABCF77E76FBADD481FB39736FAB4899DDFF85B8FFAEB333029A7B967BCCB71DAA7FE3FE3F4CA0B98B080BEEDCB14D5AEA6ADA97CF241C1AA212E7A7C6FE93B853C93434123474E0F8ECD040655E4EEAFBB73585F940F9EE863AF0D2F2F424FDC2DC78ACA79DCDAE0DEB58B66D3E2C22A4AD286F6B6CA8A7AC78E1D041314E8E932222E7C4C48E71F3F2FCBC819D698D94D881473E8103F965B3A50DF0EACEF1B2C684E8BB57F61FDFC1F4F39553E79EDCBA3BD2D9AB23AB74884B4078F31E0779ADBED4E2BE2F85B359B5630925D492FEF9CF558FB4DD5E1AF95647BEAE08798E4E6FFE51DCC19C54D00D7E14F01DB04E2D1F2414F50CBDCD0B57D48FD13206F9E4150CB5F72F95D5FA29AA01DCE58544358F1D95E0E539C5C67C498087FF6726E14D3F59A8C80EB5D62E2F4DE108E88199A9D7D9796A2E3EBCD2EA9C727AFC3A0E42461E7BCDFC40003A22065EFB8D7C8F9AF81DD7F538AEE67046957E2D3019657B29293315690B2355471FDB283FFBE860CFF8209FFB0E0ED16ADA1ED22A8E92BA3E07F47C858DE87B08F94D03B9CD03392D8338AC82D8AD83582D03D82C0238CD03788CFDF98DFC050DFC4475FDF6E97A8BEB38EF3EAFC221A1667BF349F9C4E2009E3C80422D812D0B88868788641A7E756486813B10194D4620FA1B9A6F0686E85E95B554508BB0728A73F0B865E7E120A56A7949C15551F78E8B7F5AFC8BCA8F99A395ADF8B139DA3C9C303D4B998541CB28088124CE2FD04F462510E8B8FF72170106EEF4601110FE2BEE543282813B1AA29F83374BA102DC3F54B75D34775F7F40924D52FFB849E0698BD01386DEE22A76174D02AE59841C53B2BFA8E5A66E1329ADE77346CEE69CB2DD650DE72BBAAE12FA6E17749D4E69D91FD2B03E6CE8266EEC2166E2296AEA2964E6CD67E1CB6315C0691DB4FBF7B87F1D9C61B68AD86D16B2C73880DDC89FCF2460AF91DF7E3D8F239ACEFBAEEAF31F9161E73DA1A1665D9ADB3437B8D459D1D59855F3E5F69BE7FE37020D1DEC65757D35CD9FB887A444DE4B8DBCA32D765C815B54965540815D40819557762787220B972E9FA8B1C03E13FE7D11D754529C02B23C22D25C42733C63F2BC6F16F9DFFB6415162969EA7954FD819A67DBCD346C7A0F297760FC65F9E0E3FCEEBB9920E3CF8A11ABBB52FFD3B8FF498A5C6EFC3105AE37FEC6FD07263D5DED03FBF7B130EF06153E2325898E3B193F3B31F21FC71D333F0B705F181D069D1DE05E575C98F5F963734519301D3D37433F829E880FF670DBBA86498095594B5EF6D18DD8822F499F9E3E097674345654E4DBB25568DB0ED16D3BF9D66DE4645A73868BEFA693FB5061C55C5923A2A60BE0FE26EAF645B1C3DB99D6CA5D94FCF0FCD5FCC884818AC67E4E7EDE0D3B6C64D43B530BBBBF144C66D5F43CCF82EA26D1992D77541DEEAA3916FA3FCCF3BA0B4BACF951DC4118B88300DC691543C4E2DE9177F9C1529AB7F52CA254F5DFB9F8428353D3394586874FD85FB92AC9C9A57C40FC3C37C7457E6EC52307C4776D3E27C0F9282210B33885C6C01796E1ADA3A3F793332E5938325F56E151B7E4D7771534F511B50C12B50811360D1431F6DB671678C43CE8A0B6BBB892DD511507493D2F45035F450D171515071D0D67733D6F1D3527637D2F17971B368EB10A9A6E9714ED24F57DFF0A77160B7F16333F76533F2E633F1E233F3E7D5F215D5F511D2FB07DB0FEE8B5B5072E6906C664F54F74A2F03DCB481844C3D07127935688BFC11D8BC6CCCDD516167BDBD8CB9E3C6B22AF1262EDE86F62EDA4A2632BA7E6ACA213EFE657939401EF1E248DCFD26F3188C451E617F1B3B3600E219134380233338D9B9BA3A296E9DB017F8D3BDDF755DCF134B04013E110FD48CD8915E84569E3715DFB35E2125C32E667AC224F59841FD2F71151B63F6F1E72D932444CDEFABCBE8FB243EC0915C70B3A9E1774DCCFEAB89DD6713EAEED7844D3FE90A69D9896ED7E53F7BDE69EA216DE4296DE8256BE7CD6BEDC3681DC760CDCFD769903DCE98333DF46DEF75886EF320DD96518C062E8CB6BEC2F62E42BAEE77158D3F99CB6B3C8391566BEE3AA1AD685798D439D33399F0BDFC4BF76D3B7B75134D0BBA86026A571C73DB835B580D83D0E8DCC1B1CBFA0227C508643489E5D408E95476A3787022BB79EA09889A0B8162B9FDF39A95417FF3C9FA8247BFF54E79002DF9B25810F3E5985864B18BA1C50B8ADE0D8189D844AE924E6F4F73DC801AC77C6A7830733AF2B30296D50FE205432F61FC23DF6AF702F76BDF9C714BADDFC1BF71F984061DFBA65D3A68DEB6DAC2DBBDB5B202A698584FB0FEE5005A0539008F2329CB0B448422C01E2FB5B9A0A52933F3E7F9A93F4796E7810BC441F96C1A2C1ABE079BE5D3B77AC613A2CC01FE3EBDB5652325057D79A5FD89493E76B622E7FF484C896ED7C3FAD175CB7E91C8F40B8856D6B4A36B97364A1BC75ACB421DAD14BFEE485BDEC3C229CBC195F52260786333E26EDE716E0DEB05DEED0E9686B3764631FAAA67729A779F14BED5272DDE4BB925CEFBBF12AF6A0100D3FCB854A06C1D24C486FC5A7B59032DB19B803E5A1C2EF3E00BFE00E02D54E10F3BB68A50350F5183AB77D3EB97629BD7129A3EEA35320903D445EFDB1A5033434F1C937584BECA0140FEF556E9ECB3C5C72E27B2FF27372835F9075479C9B7D7755119580C25370082221BFB9C524305C54599757C98847DB8ECFC893DBD897DBC80F848EAFA11FBF819FB09E2F28D78774BC8E6A7B9CD274BDA8EE7245D509F47779653B05051B79796B39106507593567290D570915C7132A4E478C02450C03C0BF0512719AFAB39AFAB15B0672DB87315B0680F2CE6E1EC06516C06B1220604C3F165ECCC0FF985980A09AD5EECBEAA2AAC64EF75F954FCCCF42D01C8DB24425A1A8781C194B2461C0FF33FD4A5E9865B0CE1E6A6B4B7DF7CEDFD1D15455CD4E5B37C8CE21DACD33D6D533E3C98BB28F493DC5E50B5DBD84A9190806073D1D804E3F3A1EBDFC758E064BC8AF4B14437606EE5F835B86080888048788886FCD1DB542005B123008CAEB1E5474F6DF7858824FCEEC8C55F811E390830681070CFC0EEAFB00E28FEA7B1FD3F33EA9EF734A0FC4EBA4AEE7493D8F137A1EC7F43D8E1A7880C27EC8C86DBFB11BB79635AF91A390959788AD9FA0B51FAF950F977500976D209B55200B3DA1CC56A12C96E1AB8900B59DD9320ACCD92CC3B9CCE9BBA3458C03C40D7D8EEAB91F51B5B9ACE5785EDEE49A8271C2C7C2E28246074B4F1FFB00750965475DCBFB41B1250999E3B51DD881C995D105687CA12335274CCFECD43696834C1BA458B995B8052F6DD97984698DECB63DAABB38DC8E9D7F6FE9521C1897EB7D3DD33DA2C8FF76A1DFDDB726FE77551C9EE97827D9C414783FEEBA9385F8D25A15FAB631FA73EFFDECA93715A82F2DA4AC1E3AEE3FBE43152CFC20BF3B89897E14596E0F32AD05280F824D6B06B82FBC294930F47BA6EA70FB9A498A895F8DCFDD3C9BF05CEB30807B91436489F3D7565EE81CC74881532CC8EFAC67A4C8FD16D828F9E418DAF122F5AEB9FB3966014EA6F5ECEBB6783BB840240A954AA5D0A8E4151A909D813BC87FF3F4FF1DEEC06E4000A866C06EF018BB3037D0DA5C989692F8EA455E72D2FCC810A01F3E394E3FC509B15498FC4570F76EE69F7E3A292474D3DFBFB3B46CA4AEA1ABA0B83DB7E07970B8AB868E8CF8A1E3AC9C221BB71EDAC5E2ACA299FFF815B2BE6BBCB0AE37A7DCD7C8FABCE841DEDDACE202C22579057824BAB2A0F8FCE1E31CEBB79EE0147256D5EFCBAD982F6945E4B52EA73781E6BE90585D1CF8F89EBAD36B23BF86E8F7F0CF35A8E406803BA3B63370A7E576FF25EEABF7C1C1E576409523A0B363F33BC9A5FDA4D2EE24D7907079AD5059B567564E504BF7036B3B1541114561E12BDC5C0077D97DC21704380536AEB920C2F338CC7BA8A59A8447614884592C2EADBA41D32B985F5E9B4BD98C5BDB91C7C81B746A2E63FA01D7DC46413C86017C86F4336B80EFE27AF423F680EFA735DD81EF92AA4ED2AA0E67250C4F5FD2073923697C4ED6EA9C82CD6979DB83F2B6870D8384F4E9C51CE00E1C6731F16535F767B309FE863BA7391D773E930050F0450CFD0F9A0608AADBEE92D0145432B2BAF53477606C7C059AA691176924240D8FA57CC59D8647D2B00077445541DE87674F433D3D3DACAC425DDD1E5D8FFEFCF071DAF397634D2DB39D5DC8D151F2FC2C0D0E5F595EA2AD0698BE8281AFCE7F936FB2FF09EEA0A9FF823B8646C71D6C4980554E7A6BEF355BEF758724B865CD4E5884ED370CDA6710BCCF30609FA19F3820DED0FF9081FF6103DF23867E470C7D0E1B78831C3204F13C6804E2B1DFC853CCC443D0C809E0CEA667B753C362B38AC966358B9D3A0E2C461E1CE0CDB10C64B30C66B30C0594D3631141F71DE06E19051E735884F29A050B9980FF1C5897789CD0713AA3617BE48AF6A1F38A01E10F6EDE7A2D734DCB48C7CAC3C623CE3F2AF979426B491DAC6F9C32BD04CD21A159C4605145BCA3BB148FC8910DDB24993964B9F82FEDDC7362CD7AC55D6CCA3BD8ECC48F3FD133CFF50907E53DCB2322CF3B2EC7332EC132F0A186F30375E70F66A125FECF7BEFE7CE27D4D7467C688E4DEA7F983BF3AE0A9DDC4ACEEEFDBFC1FDB99AE39FE17EFD7F877BDBB3E47853D7B37BF8B99836706ED8E6EFE20170A74F7FE3FEFDF4DF863B901DB472F000200E88C7C31686DA5B8B33D252DEBD01C42F8E8D806F404C4D40782CE8F8F949897B59F6B0FFBCF6AC88F0DDC080FEF2F2A986C681A292DEFCC286C4E40F91D10106C6DA67CE1DDEB54768DD06CDD3679FF8054F97360CE554B6A516D82869EF63E5E6DEC97CFAD0D1F6E61688B6D252D7A021ABC8B6711B28EFBA17A56B3F66A06AFBD045F4D38E2845BDC0F786D80FCFF4BD1E6AB824DB5F6F8C7A37F22407970A165FFA550718B8AFE4810FC3AF1F80DFE05E318C486D40ADDEF08C54D24728EAA1940D108A3B337CA202AF2A86C8A802DC17728B7C6514A439B8350F1C90E4E294E0E394DE27745190EB20CB166D8993294F6FCF0F75E2B0C8652261148E7C95532465E5CA25A5C1A562C9A5E3020A3B87711087710808975108B761088F61089F4190A07E8088BEBF989E3FF0FDB8B6E7692DB7F31A2E92EACEB2DA6E521ACED7D49DA4B5DC150C7D15CD82E5CD42AF59841ED40F10D0F1E3D3F1E5330EE2360B6636F6DB6DE2C76C19C4089B4510BB79108F6910AF097DA72BF07D9F4900BFA6FDEE2BBA5C727A5A2137121A3B7B71C409CA6F70A71019B883D53662B2BFB7ABA1BE323FAF282DAD2A3FB7BBA16E7E70003D3D4581AF528E414200681C58127E5DE46858D86FBF64042C96BF219E86A18FD2FC09EE3412C07D8C48FD50D97CD6D8F9A78312DCF296078D83E94773EA87881A058A1A05ECA5131F206E14B8DFD01FE480B1DF7E23DF5FE22D6E0CE209E662269E62165E2216EE4266AE7CC6E03D77E1B7F0DEE71076D8238E1B6CD3580472580483B05B84AE86EE3B0377A03C877938AF69A8A049E05E239F83061EC7F55CF7CB9BECBDA8CE7FF4AA8E8587837BF855692D7B3B9F84979F739373DAAA9BE787A6C93034FD5627CB78088682B7F724C6C51B9D9338C3CC7E610FDB354E5E4966B6F39BB7ABB172AB6C6735E6168D91564D75F42DF4BD9EE71995ED1A95E6109E6217FE52D7F3B69CF54B5D9FAAE097C38FF2C79E1681DADE713B6DF869E17C422D36B59D92D347C7BD60E8FF00F77829D3EF71AF76BBF10BEEB7E8970FFBE560F602A71B20BFDBBFCA0803F704FBE0E6C789370C1D4FEFE205B8F36ED915EAE5F737EE7F32FDB7E14E1F4BC563413107B2832F1947439664A6677CFC00E64B1363E049E4CC14F81EE07EF6C704717656EE0DEB2F8AED7D141C3C5A51B5D0D43252523E5C50B250DBD892949A783D0EF82E2920CCB766AD84904880A1D94451ED58416D7B7A91A9B48AD04E5621362EA9CB92A3C323D00AD4DFDDE3EFE629C6CDCFBC6683F2898B452F3F41030BB8D21E4A711FA8DBC0F7BEC7999F6D23EEA93A823694601A541DF26229A10A2A1A808A07E9E53DAB03CCA182AFA39020B4227AA8C5F4407593D8EC367A73AF18661CE48ECE6D5FCAA82B098D0FB82C172AA3FAC8C4AAE9D10BFD7D07255958F58E1EBDC2CD21C9CF252526785E88E3BC08A7BBB1465D4E226171028341C109A4DE99C5B8F749C7B5CC982FABF2A8D9F01878721B0500D6D98D4341B80CC3B98C42790C42577D0F11300C16D10F14D3F33BACEBCBF0FD82A6EB355D8F2BDA6E129A2E602EA5EF2365E477D5D0FFBC61C02183403E2D1F1E2D6F7E93607E8B5080FB0E43EF5D66FE7BACE8B8B3AEE2CEB58ABB8031F03D40D4D88F5FDB798F9421CB35ED6BAE4177F24A1B60F0510A69618584F803EE540C028F8061600B4BD393534303E3BDDDD383FDCB335324240CBD308D5B9A212117A89845FAE52EF04B0068888CA0E26000F75FF2EB72F8CFE18E04B82FAF00DC57FA51B887B96587342C980E48722BD888E90770AB7A891884AD1E1A142062142C620C940FDC6BBC1A137F31E36FF15D8D3763CEA961CDAF672F6AE6266EE5256EE5B3D7D247D4D24FC43A90DFD48FCF2C80D72C10AC11B9CC434180E6ECBFE21E05ACE7360BE5370D1435F63960E87154DF55504A6FDF351DE1B3F2CAC64E5E61F19E81B149A9851DEDFD23FD63F05938054582882B109E42F71D86A44ECD3524A7071B5BC8088B9DDDCD22C1C675958BFB0A339B369700C05D631797D7F18B6F8CED01EE853E31992E615F6C02339DA3DE9BF8C649993DD170AF0D7B33FAA4B0F74E66DBCD94DEFBD913AFCA96121B09195DD4DC7E3AEEF96001FE0BDC0B06BE2DCFDFE747717FA1EE04704F35F567E09E63150A702FB48FFA51DCF33D6FBDB70D6CB897705DC7E6C4762E6EA68DE0531C1B1CFE37EE7F32FD37E24EC0317007251D083ED8D6029A7B76E2A7B2EC4CFA800C164DC71D87C1CCCFA6BE797D809D8D67E33A0931D127C141E39595B0A6E68992B2D1C2E265A07C4151D5EBB74FBC7DB44E9E12D9B0E1182B8BB1C495C9E2BA99B2E6DEDC0A80BBE81E8E4382A20A5232037DFD0077D8C2626672AACA5519D6755B2E8B1D791A1C8D6D1DC197F7AD940D4255A350D9E04C427971E0E367BA9E71B29637652C536CA306EEA5E3D35A68B9DDA4CC7672461B98FF25EE35E3F8DC0E2AA8F0E04161F772560B9883E6DE70EB6990A45CB89CEA0D4DFD444F7F69167629360E9D8387247939250579AEEDE53B27C82E7B6CEFED00A789B60A0807C362D10802B56D74C6F7CE33C1ABEA3BCE290968390918FB731B05711801D9C341B80C2381EF3C0620A1DC86A1BC8661ABBEFB1FD0F33FA2E37D42DBFD8CB6FB2955FA2134E7D49D2F69BB4BE8F95CD4F53AA9EE7A40C5E99849A880B62FC05DD02C54D02A9CC5C41FE0BEDB3CE01BEEA0BC739AD1CB3BA8F602C601C246FE42069E6C0A163B25348F9A38067E482E1D9BFE1E77C2EAB5A3697804587800EE64F432058F018B161ABE009B1A9F1F1F81CF8E63E1734BF36328F8241E3D47C62F92F130126E0184889B055F52BF05075B0D7C35AB4BE6AFAC33C2C01D0691183B54BFE2BE08AD74C091D1899942F2064C07AEF2AB3889E8F8B329798818850B188580B514980B9A040B1983048A9A0489827ECD50DE38F03BE2C1DC5B58D749DCC4E58895CF516BDF03A65E827ACE5C6A766C2AB622C67E426023C634907ED906D350104039F01DB0FE07DCFDC40DBDCE5AF8892A189FD6B43E24A5A564EC1CF3242121A364680A0143E0D028029948A3CB048227D31018EA021C42A0A61B5BDE8647EB9E397F8699F5323B970CBF801C17AF3E9F88FA2E36E56D2C968207EE28EBE778849505DECAF3BC9E6A1F92EB1E9B60E67F43DAFCB1BA5B75C8ABC187D91D37BFF4DCCB02B57DF67D352A957E79AF9555D9FF6F70BF236DF63DEE55AE7105768C31F71FC3FDADB57FF5AD3761EAE64736B3F1306D02DBDFF7A26FFC8DFB9F4CFF8DC33238FA69E5E465380589C02ECC3176A8E6247D2ECFC96234F7E5E949C6FCF3B3C70077BE0DEB2444459E05074D5454C29B9AA78ACBC60B8A61D57560DEF92535EDC62D1725E563CCCCFBB66C9110141ECA299F2A69ECCA2A35BCA220C6C2755858ECE2E9B35919994B4B4B8BF30BE383C3AE56761C1BB7EF63E6B256D46AFA940370A7EF052D1F5A291D40653477DD4F4D7188BEA36C7F5DD2F8A5AE5799EFA3A10799A0BF63921B49E9ADE4AC8EBF1A9661DC0A875CD40B7C9FFA5431FAAE1893D701D58DF43E498892558D51D4F4BF2A17A7AD7F79FB2E15012125216129415E295181ABA2BC67F859D52F1CFE702F123DD90591E9F7894591A1C6FE09FBF0DBCC27A5B79E52DCABEFB5D7328CDB3084C3289CDD28126415F7481E83486E50E10DC3B98D22F80D43850C02F7E9D32F1D734CC7F3A48E8798B4F951459B8BBA1E729621AA0E310A7651978D03C04BA7ADA28574FD79B57D842DC2456CA3D8CC02E9C332D6C1007786EF0CDC19E59DCF240068B8D7340000B7E5929A909AA9DD83E739FDC36314EAFC0A05E08EA602DC51DFE34E4221C83834FD1E49043AF1641CB01703ADE048041885B20C4168101A0541C0CDA296C7114B2364C23CC83F8B3B9631E6FE27B8B72C2C05BDFECC7545E3A7C3D2429AEE823A7E2C0A6E7BCDA2798D42794D42F88CE9E1370905C4AF2A1F28BC4A3C437931A3AFC48B1BF90A68DAEDD377386CE271D4CCEBA0918798AEB3A0A613BFA6E35E233FA036E36A6B60A3876FD577AEAFB8477FC39D8F71209391D71597C8439A3657CC3C0EC9EA5CD2348F7F9B5658DF333287C291213205A2019668100488C21129CB180A0C0121D184D189D2B709F68ACAE739382F71722B088B28F20B00DC75D9785477B0E9B1F3875E924D75F4AD0A8BAF088ECFF78C05B87F30F5BBAF6C0F16D452BF279DB79241869E1480DA0EFBDC80CBECA2CB5E380C645FC91BF84BDCFF45C3322F359C19B8D7FADE03B8675B86FCAF717F6DE95B1EFB2250C9E8E006665EA6CD87B8049EC5DFFF1BF73F99FEDB7007A033E644380C04353BDDD3589FFB2511043477D8F82863CC1DF47AF0F8FDC37BE2AC2C3CEBD64A8A083F0D0898282B5FAA6F9C282C19CB2D8457D7CF96548CE615D6BC7D1F676B774D54149477B1CD5B9B3F66F4A415D77DCA543F230936E844B9F878D83802FCFC1F3E7C98969636D8DBE7E5E8C2B27E0BD7C6EDD70E9ECC887F892BEB0522930B7B80CEC4FCAEF9CF5555612F5F1BF9DD96B37EA0E2F8DED0BFC8F35ECFED64D8874AD0DCFFC10E556C761B3CA57E39BD69E45541BAE7ED0FB6E155D16FC7138AC6DFA5DD56D3BBA9AA6B7FF48CC705C92B3BF7181C3C28C9CE2A2B2220BB4F585294E7241FB3F6D593D9EF1EAC20C600EE64220947851A7A264CBD23B7885FDA7252E18089FF41FBE8EF70BFCE6508B28ABB4124875124A77104A3BC8B1A04EDD7F33FACEB7D42C7435CCEEA9CAEA786DB0DC7B80F014F737C1F6739DEF86C14FEFA92E3EDBD86C17C3ABEA25691620E319C96217B2C02391C22BEE1FEFDC80C7DB7AA49D001AB507E6DE78D1755D865B50DA3EFA475F68FAFACACE24EFC23EE88D9A9C599C985E9F1A5B92914620E8F592260E158EC220EB740202D5169CB346899425D22106731D8490C7A9C81FBD7D04B3D83F81FC6BD690EE6F3F43DEB05957547E5F7E9FB0AE8F8ED9177DB6715C76314CA6D1CCA6B1C0688A72B6FBA7A969649A09069D0AAEF415F71370AA48FC81BF91E3470BF6017A81C704737EA9966D81319CF1BA72C830F1878891BF8D17D37027603DFE93F04F84EC7DD22FA17DC23C097AB07CCD071BFEC187148D3EE9A95EFDE2B1A4765B51F7ECEADE99BEA189B077F5C1215A2D2567D27AFAC10C9109608A1B02B30380483771514FB191849F0F25DE6E1551413531614D2E31536E611D266E1D1DCC3E571F4FC272BB7BAA8FBCDB1CF6AC21E65BB46BF33F679A9EB99601A94EB76BB21F27DCF9DB4B1172533EFAA96935B48B9A0800F43452350C1102DB7FFDF8DFB2B4D97BB32E6696601DF70AF7489CDB78DF8E131778F9B2FCDBD4BAE3FF593D7DFBF6E37C0FD189FC89B874FFFC6FD4FA6FF36DC4988452AF8AF2FC3F0B03990E5E9F1AEFAEAECC44F0CDC17C74600EBF0C971D0EBE74786DEDEBD2BCEC2CCB3F6270961A1A77EFE132565F0DA8689FCE2B19C027C433BA2AA71B1A2AE2F3DE7554088FA8953C21B367132AD2978F6AEFA435ADE8B04A943A74043E7D9C5B29E89494345F5FCE9330E36B6A539F90EA6963BD7ACE7DCB0EDB2D891CC7B2F31653DF8C26E6C4E3B7DB76A711F30BAFDCE9724DBC8479AAE7715EDEE29D87D300AA8097E31FBBA84CAA8ED7F813B21AF139EDA30F3B1A22CF47990A481B5F8B51845EB1497EB339FB21FE998C6ABEB9B8B1EB23E7C529A99CDF2D499B33B76CAEF1591DF2F765994EF182F8B8ED4D9FCA49710661622A1C1F28B87A0BA9E717DB7907522E7B69C543A681172D4F9169751087D4C66B5B903D0E9857D35407C6EE3301EA3D59119C300E0DA413DCFA37A1E2611CF7D1EA73E2B682D1B427523A15E34D4384B2D18C24ABBDC38601420A8EB79C02A5CDCF13A8F5530BB65308FD3753AEE9621CC9621AC1621ECE6219C66213C740D8384CD820FDA4508E8B96FBCA0B6FBAABA56D8CDA4B6BE8915689EB682A091D114FCB76119FA4E51F4124423D370683C0246402E5209288882A3109771E885C9F1EE99998165F838063B4B02559D0C5BA1C2211AE22BE8BFCC7F57DE01DDBFF8BE9AAFB8C3E9B89390F41DAA54C2F20A6511829A66E19E8FDE319F53DA705C11FC8260EB648F82EB01DB9B3CC6C19C26F470998681F09A027F43418517320D6194F7BD26F4C2BEDFC8FBA091E76143B788949297959D05E3A83A0454388E7958DAE9F8285935F021F07D9FA1CFDED54B2583E2CFC09DDB2C9CCDE25B7307B887F29A050A9A828EEF75C4C25748D9EC928517DF65E503B29AAFF3AABA16F09D53702C0D22D280EA74DFE9E59DB6025128A0CCE3E7E7211466A4BA2ECCD25A524018F8AEB46FBF929088368F90A9E05E5D0E01D55D1CF6FB4FBC3577AA8F79D479EF7D53DCAB7497A857465E6F4DFCBF58476438C65605BF1C789035F5B26C3EA11693D246CB1BA0CB5E3CFA47DCBF11FFA3B8337C47A53501D9C193ABB8F7AEE2EEB38ABB69CA2AEE393661D99641E5AE00F7B01297D8BF385AE6F7B28330707F65EA5514F9D8475677DFDA9D7C6BB69C1414FBF0F4E51F715F593DECFDBF79FAB7E3EE606FBB4F4478F3FA754A72B24579D9643C8684454E8D0E328E2DA37F78E861B0CEC8EFECFE170722A0F00B1398D97108038770CB0BC3BD7585D9991FDE3E898B9E1BE8852864F8D828627C0CC2619B4B4B1D0D0DD9D7FEC4CEC46478E952F9ABD788BA665879DD624935BCB4762EBF7226B77CAEB866B2B0B2E8C96B7F03B3AB6207C599D94E0BEE4D7DF536FBC3A76B274EB3ACDF744850F8A080D0AE751BB6FFF4F38EB5EB0EF20A481C3D7190879F7FDBAEA3DC0272FB4F4E66D5A10A3B96321B6955434BE90DA3EF8AD0D92D3551AFD39D633F9A05259804BCD1F77EA6E69CED1033FBBC002AE88500E8053D849C766C660B2EAB9598DB412DEE85CA07B1B96D20738995B571EFDF59878449199BEDBDACB24BF4A5BE4394A4B2D7F1CBA157940C04F7ABF308D95FB82C027EA33367A4F68A88EFDE2E7BF2F0FB47B711D34310094923E340AD83E1A08FB95597F56CB71E96629332E2D5F2D82C67BB53C7679BAEEF361D7F30DFAEE30BBEDCA3E505B243CD6397BA3BBB8EEF862BA6BBE56C04B55CC13F39A8E3F4AE7E286F08D60AA3F4A06883286882004D93A13112543A86F47891CE236FF2D349796E6D4761CBA05D006E4DE7CDFA5E9BF57C40B6EAF96CD7F3DDA5EFCF6C10C0AEEFCFA2E9B15BC58145D96EB7ACE996F32A22AA66E11FB3A720688E0281128EA7DF2C9B48C42189A8050A7291B1087DBF507D1FE0350D4BB7FBBB3DA8F4309EF9E5F9DFFC93D5307EDAD79FB9C2F85778049980C41371680A1941851669D01006D2F1B9BEEBA4029FA28588A62B8FAA0B8F8617BB8687806508AF75088F6528B74518B77924B76904B76914AF71F85EEB581E5DDF7D668107CD7C58AE69B35FD550F18B8A49CD1BA640C324DA2069A58F08756068557398F4BED9374DC3676D03B995ADF699F8ED56B0DEAE60BBDF3E96D32080CD3088DB269AD32E86C72E96CF3E56C0E1BAB06394987DF801FB90BDA61EDC2AA6A29A96FC32DAFC5794FD1EBF1BC0408B2B101682882B2B24DA0A700A044CC02B884C8608F45BD94070F860457588B9B5F8E66DE26B37EA1C3C2AB387EDFCDAF56AECBC1A9CFC8A7B389F9ADA2DA5174F7FCA6BBBF3FE9981EB279B9092A0C7AF0C7D936CAE8F3E2F8625D4517EB96E3B009D9195BC816FC332DF07F8FE0FAEE7FE575915BF8B96DF4DCA6A2364B45073DB471EA4BDD5737BA1EE7047DAA4D039A6C2FB56A5CFED6AEF9BE9E6BEADA18F8ADD627E8D6BDCB7FCF620C85F712FF48E2F0EBE5F1EFBC2E1BCC2C91DDCFC3F6D3DC8C95F5F52415F11AE6AFE2DFFFDD3BF1D775F1FAF2307F66F58FB9394A444767A0A097C1CF0E8D98991FF10EE7088B04C844D02DF21ECD20A6A61AAB7B532272DEDDD8BCFCF1ECF0FF641781C901D33330D61D0553939E6EAEA1C3FAFE55BF7B3958C4CF5BBF7F0EA465869CD426135BCA81604F83E57503D915751FEE263A49593DCA193A2BB588F08083F8DBFF3EED193ABA7CF726CDB71584804687EE5F8A903DC7C5C5BB60BEE6611E7E4E1DEB46D0FD3CF823BF61C6717A878F81196D38C2C68A7D58E2CE7B44C2556E0F33B1A6E7CC8F7BEFBD93A0CE0FE5CCBEDD635B3575AEEF541CFC71E65A193EB31A98D8075525E27B5B067A5B86FA5B41F0493D30AFE21583D743D4ECFF5BFFFC2D42F42CECCF39482DBA1CB461CA22ADB38AC448FAAB0F2297308385DBA7672EB4E8DA3C72E0B098AB3EC56BE70E6F3CBC7CBF3E310E8C1643CA8750B78E8436EF5253DFB2D87A558A58D78B43D36C9DB6F5673DBA0EEBE1E44C36DA39ADB6635A72DAA4EDB541DB6AB386D91B763D570DD2C6DBE5BDE824BC58A4DC6E892636046FF42D51CAE0F07D12FE54804451B8243D0020DAA9F455D4F2E386EE4B4FDA20A97BA359F91E72E20BBA6D3661D8F8D3A5E1BB43DC17CAB8ECF761D9FDD7A7ECC7ABEBB35DC762AD9ED52B2D92163BAE9AC0A68A3211FB22718B85321FC0A685464501788CBF3007708FDD5F77F3EBF08FECFE617DC9164021A4F24A0C95424055AA44203C8152DCFEB3B8ECBF1C99909A93B732AD973A9BAB0AA3BB3E8BAEFD677DFA9EFB153DF67978EDF2E9D80DDDA41CC5A019CBA41CC2A2EC2FADEFB8D3DB8E5F5C4B58C1DEF3F4B6C6A01EBAD692A75924A1BA5AE0C91A15624A9640A91DA3FAB1C748B55CE984DC96AE315FD9F258D38F4BCC01A77879A1B580BEE3008D86914B0CBD89FD9D88FCDC487C3D49BDBC45DD0C48D4DC55850C39C4B46935B42D9EBE1BB5EF4CA3CF51BEE541086EF74DC29C07702FD6E65CBCB230D8DD14EAE2798390E6DD8AA7DE088F1C1230A6C1CC67B0F581D3A6E2074E0BE81E5C0EB9491F79963EFB2333D638B031FB5DF492A0D7ADE79370DACB7A1AAE96F76FF8FB8AFE6877107CD06C80E15F400DC8999CDB4BC8ED147A90CDC41732F74B90E70AFF0BE51E57BEB17DCAF7F975F892F71BBB19ADFE39EE77D3B3FE86E69F433DBB37227B673F1FDBCED088F507345CD37CE7F95FDBFDEF87F3BEE77EFDC3E7FEECCCF4C4CA78E1DFDF8EE3566997EA78EC5990906EEFF8A61991F0A1D770A6286829805B8131627075B6A8AD31253DE3CABCCCE808D0C52E04BC8C909126C91BC04CB78FF5E4D52926BFDBAC37B76FBE8E8367F4E8255D6CF1556CCE7562CE45460CA9A16F3ABA6732BC673CB1B3FA43DF20AD63E23B17727EB7E2E5E7F67D7485F7F80BBE01ED6C3FC42BAB20A31BE01F63A0612078FEE6566079D7D0FD3DA9D4C4C5CEBB7886CD875DBDC632CB11C57DA0370C714742CA4D5918ABA3BEE2797073F4D758C4EB40879A5EB192B6174E38AC9073D9F0CDBA8BEBB29E3CFF3E05F6A2905DD50C530543902950D80F28ECC6C221474E2F2DA673F5700DF6B62DF01E2BF38853B889DD565169060DAACC546BF1A94EC1E2E9B339724D8B86445F79EE5E13EC4C1AAAF209D93F401B3340D9150540A0170398F87DE33703F72F517DC6DD7293AFEA4E4B40644D971ADA2E33A45DBF50AB61B15ACB729DBAF9134A2FB2B6FC52C6FBE47DA805BC1C430FA71C52CBE03038DD1A0092A340DF88320C4EABD8A3A96496F6ABBD4036F722B19B2289BB068D86E55B5D9A4E1B841D3F5674D1746366AB86FD674DBAEE5B15BCB7D87AAE376059B1D0A56DBA40C379C56125034097A97097EEC77B813FF73B8E3BEE1DE0527ABBB456C3D22CD2565C4A76CCB226BC5A6E8B05BD97E938AED7A35DBF5AA76EB559DD6ABB86C5271DBACECB155D96DA3ACC3866B169CEA4E22BA4EBC4A4617EDDCE3B20A1A96107310340F413380780802EBB0012AD48CA6942FE20312F3B9154DB749EA6C92D45F7BD90094772609C36DAA4EEB949DD7AAB8FCAC06E2B441CD71B3BAFD560DBB1DEA56BC064ECC8A067CAAC6ECD7D4382F29BADF7BDD8DA4CE92FF1A770A71058F8550C8B9AEEEA721E152A2FB4FEC64D6143FA42E207C69F356550E5EF3FD478C440E0549291787DF19789D3A99905716F608D4F6EAC85765C12FFA1FE7E0B3BA9129ADDFE0FE37E10E15F54185BD20E4ECF6DFE17E4FD6ACC835BADCEBE637DC5B421EFE28EEB95EB77203E20BC21F5A9CB876740B3BFFBAEDA784F6F534B67E8FFBD7E96FDCD3529395951400EEA28202776FC5CD4E8E510918246CEE3F863BD83647CE81CE0E021FEF6F29CFCF4D7C0F9AFB485BF3D2E8107A7A0A3B3B4345C01786061FC5C45C3A704070F3E62BA222F12EAEBD99D9F36535D379A5B3D965735965B88A1650DE19B877A71624C5DEB353D038CACE2BB08B595356DE4455E3C2C123C22CECFB38B8EDF40CEBB2F3B3DF26F85AD9C99C387398938F67E336CE759BF937ED1058BBCDE0B044C7F34C4C7117BEAC175BD8B994D908701F7E9507704F778ECD728A4DB7BFFE5CDDE5B694F93D19AB3B3296859E77EA235E8F3CCFC566B640658374DFE987CA742D25D76273DB88855DE8EC96C5D4BAD9A4AA8984D2A1979909E61E7714F54C78F6990A1ED4E41296D8C6AC29B2FFDC1ED6CB3CBCC7D8D94E09F03A9BE8D716E510510BF4B382A8C46FB85FD4B7DFFC1577B78D0AB63F293830293AD2A3E4B046D1EE27459B9F15AD36C85BED50B1673AAFB35DDE9255D59655C97C9B84069FB2A9FBCB947A04A58740C77D94048D13A9B39495050A6D92BCD24F82F2C7175D5F24EED3B7DB29A7BF59C168BD92D9264D879FD51C7E527758A366BF56D57E9D9A03DD2935A7ED6A8E60E5B145D672ABACF996ABFA3F9F90E79337F07F9D3642F96558E67BDC51F3FF87B823BEE24E21D371A741ED8B046597E0CD87AE715C35E092B7DC79D5748F2C5827D9AC57B45AAB6CB556C9FA67650700F13A65978DCAEE9B945C99242CD64A18B1285973A958722AE85FF3087A5ADDD4BF02CD4220D4291A757205022D7E14827A2850331E4AEA9F13D3B3DF71559755D96ABB8C39F8C9EBAE18B3EA78AD91B767A2FF69EC197F94754A56EB952C36299A70E9DAEF94D5E15132609550643B2FE37AE7792782344DFC13DCA95432DD772A897E0D340C1A353696FAF089C105C90B1C3C2AA2E24ADC7C97B76C5366E3B63870D46CDF31A793973E39058C7FCC81A596F73C4EAE8B7E0B706FBDF565FE530D21BB07F1A5F91BDCFF34EEBFB3FB7F4A3198F7813070A7E6B60F3F487EA3EB0A70BF2F670EEC06B89779C656FBDDCEB0F06B0ABAFFA3B8677BDCC8F0BD91157CC7E0F0A5839B580436EC3C2F7E64AC7780E1F86F3CFF1BF7B6D6661B6BCBCD9B36B030EFF672736E6F6EC0A1E1780CE2FB1DAA8CFD575F3F3CBFE7F85F1B388481414001E40269716AA2B3A9322B39E7E3DB82A404CCF4047C7408313A4A5A58202F2EB696967A59598BB3B38BEFDEAD7FE14272DC8DE992F2D9A2CAC9ACA2F9ECF2F9CC324C4923AAA461A1A0662ABF7234973E3213666E2F75E018C7FACD2745F79DDF7FE8309F20805E6827B3AB91D97C57FF745B77E283A71EC616AA672F1FE5E417D9CE2CB275373FD3962B7B449A1FA5C0735B96729A71455D8BE9F58CA1F3D2C0C7A0B9E7BBDFAE0A7A9AEB14F74ECFFBA1BC6DF42583F7467EE90ED1C077D0DF51C9F5C4DC0E525E2721AF63FE73253AB319E08ECFEF00016B0862710F3EBF65E2555A6BDCD3B0CB4A8E87CE1B0B1FB9B879CF35169E533B98C147F73807E795830722BDDCFBDB1A4115A5E091B415121D77C2CAFBBCCA8BFAB6DFE30E8AE76A3DA4671D28A1AA0E1B55EDB628DBEE54B563BAA0B94BC18C5DCD8A43C97CD7150D011513CF57C98D08722F011A21432378CA088E3445A4CC10482338C2200DAAC75023328B0F99BB6C96D2D820A7B75EC964BD86CD5A359B356AB64CAA363FA9DAAC55B159A76AB351D516FCFCADCAB69B652CB6C8986D92D45D7B5C8E4756CFEF55EA10E977B8237E8BFBEFFEE8FF28DF8DA7FF33F993317706EEADF33806EEEC57F4D965CCB64918ED92B6DA2E6F0D70FF5905C86EB34EC51134F7AFE55DC5759DB4F526392B76757B660593DDD29A525E612F1B3A0756DBFA2485384A248C9229E3ABB8F751A17622543C8FDBA76BBB5B4A5740D769B7BC05D894D92C6DCAA6E3B19681BB82FD1A259B9FC07F4BD17C8382E92679432E6DEBEDD21A5C0A7A2C971558CF49BBC53FEB8413A7087F89FB0A998047D10F24A32E2E567F497551D7BE222822CB27A42128A2CECBAFCD270C9ABBB9F871E0FB7D3D9B91F799B3894523AFB3EB63DE5545BC1C795188C96C27E7F5AF140D03AF19A1E5F632B292D707F2EDF9DFE5F776FF8FF9057752561B3EBD919CDD3A782FE9A596D37335FB870A96A51E71659E374A3D6218B83704DCFD51DC33DDE352BD6292FDE234C5CFEC5DBF4B70E3AEABC7CE2C4E4CFF8DFB9F4C8B0B73A12141AC2C7B80EFBA9A6AD9E929B0F9291A19F71FC11D029FFCE5F915E41C0D31879C18ECAC2ACEFBFC36EFF3FBDABCCC95E5A5A591C1A5E1E1150402393E9EF4EC999AE415EE8D9B4E71F3B86B6AD67E4858AE6F9A2D289FCA285CCAAD82E554C2732AB1A54D988A9605D0DF0B6BDB93739F054498492BB1AFDD28B4875578178BE08E3DFCDB76096CDDE5AC67BCD835B0D0D95FF925E3E5F59BBE2656D2078F8BEF6213DAB8839769A302F7A1FE77058B598DD329D5A4B2BEB9941A785A3D26A7B521FA1D68EE392E37EAC25ED6043ECD7688F9A0E77357D6EAA18AC30B1D8F2FD6E165FE8FBA6E27CDBC2946A63600E21793AAB1D9ADA0C23370A794F452CB072825DDE8B48AD90F99D1325A1622C718B85FDECD719195EB220FFF195E3EE573679FDD8859181F5A21618838C41F71679631E4D2A1E3BE49C37583A6FB3A102DD78D9ACE9B341CB768386C57B7DBA366BBE9AA1EAB8A05AB9219BB92099BAC1E9F92A169DCA3A6650AC07D94020D13296304CA0C99364BA60CE3090354A89502DD28AC3C64EEB45E5265A382C126758B9FD52C7E56B75EA36EC5A466FD93AAE55A55CB75AA561B55ACB6A8586F55B6DE2C6BB645C6E457DC5F27FF8AFBEA0ED555DC6729A8B9FF23DC718B34FCD2EF715FC0AAB8866C3D4A6FEE00F7AD97F5774A9B7F8FFBCFCA76BF9477E70DCACE5B941DF668B870EBBAEE9433DA7A59F5AA67F8F3C6EE2E2A344AA58E12710378EC209138428586A85037096AC141091DA36CD2DA3BAE6809E83A6EBEA2B70DBC2152469BE5ADD6CADB02D999146C9914ADD72858AE55305B2F6FB251CE8053CB6AC735756E793DD64BF26C67A5DCE29F02DCA7F110EECF70072111B1A8A5050A6A1942A3BB4BCB43AC6C65F68A4B7070CBB271EA0889A873F16BF2085A1F3AED70FCC23D5DEBE177198B2965F349658D711FCA429E0E3CC905BE0F3F2DC465767D53FBDF857B51DF4A410F54D043C868C1A6D613329AFAE23F3D53B707B83F52B45A953DAEC43DBAC63F1EE05EEF7FE747714F778DF9EC1699E015A52C7C4C78ED76C12D7BE4CE5DC62D2DFF8DFB9F4C341AE5E1C3FB4242023FFDC474F1C299278FEF8F8D82824226E1512064DC3208037786EFBFFBECFD6B0370A7C26757E03394C5A985FE8EFABCF4CCB7CF4ABE7CEAABA9809088A5C1FEE59111B070CF7677DFF0F33B2928BC8B89E9AAA858B48DED707E21A9BD7B36AF6C2ABD005D58872AA89DF952402C6FA1D47523CA9BE64A1A86732BD2E39F049BDAF26ED826B07D37E7BACD5CEBB7F06FD9091ABA83A6FE684DD360455D5B6E714D72E6DBEBB74CAE291C63E315DBBC1B2C3D8E1755960BDA1179AD53C95550CDC8CC972A50DB57CA07663F9415F93D48B38B2AF1B95FE5FFB8D4EB5EAE43EC4723FF78392B90FB4A76AF743DB39CE3DAE23ECE259403DCB1992D94A21E5A491F68F160DD4028E8042D9E90D7064F295D4A2C8CB8AAA1C926AA2770E8D266D6CBBBB8A47844AE0A895D16113390914D7AF11CBFB408518960738ABA42011FFE59C2CADBBCCAF306B61B8F5DF90577EB8DEA2EEB35DC7E06D174D9A0E1B451DD61B3BAFD3635DBDDAA563BE58D3935AC77C8E8B2C8EBF3A99A70CA6A493A7A352C137B882B80A7512AFDF6490B10B4B0028136DA49A03553A0D8C20A3163DBB5928ADBD48CB7695BFDA466FAB396F54F5A563F6958AF5DB57EBDBAF92655F3ADAA16DB546CB6C8996F9535DD7C55E7E713B2BC72FAFE6F5286C9DFE38EFF0EF785D53FF4EF8F7FFD07F9CD918EFF63B0CB2BD8C5EF70C77CC3BD6D11A7EA16BAFDB834979401BBAC09C07D978CC54E45EB0D4AD600F79F94416C7F52B207591D3FB1DBA068B747CB8553D765D3559D75E7142F7B843DA9EF6EC2D3C656C0E60E7188401C22918668F431F70E22D480A585A517AE3B756DD7352D217DE79F2FAAED9033D92667B646D2F06705BB358A0EE007FEA468B356C1F2673AEE461BE5F57FC15D87F5922CFBB96B1EF1CF7AE0A419E25FE28EC7A16073D384E5258848986869BDE1EE25B7FFE0E93D2C526C1C16878FAA71F2C9EE62753C71D1FF8A42BC9645FDED979D0F3F753FFA92E17623C12AA438E069AAD38D249B98A12705AB64D3AF7347CBED666425AF0784F1E41FF307BBFF873076A8D2F2BA70694DA82F35C0F7AE1BEF1F295B03DC1F2B59977BDD2C718F65E09E69E95FE717FFA3B8A7BA4627B886BF710D95E53B0836AC05B7312B494A517084BF71FFD389F6EEDD9B0307C49998980E1DDC171B1339D0DFF557B8AFFAFE1B8EFFB501B89361D3B4A569E2DCF8745773457A62EACB47E5A949632D0D00F7C5FE5ED4D81884C38DB5B4F8585909EFDAB3838949EEC0A107EE1E0B95352BDDFD0CDC71258DB8A286B1842C803BD43288AE6C5D28699C2AAA2D7B9E70C7CD4F74DB1E003AFB9A0D20225B77EFDFCD6EAFA6D3955FD69A553850543555D352F921D94BC7E432BFD8D1DD9CC7B673C6EA3B42CD53E8A2CE99D41AA8690AE03E95500AD58E416583A0BC275B876739C59678DEADF47B54E5FBA8C0F966BCB445CC15E3888B7AB1574D5EEB7995073C9E7A55483F20B2B0072A1F822A8688F99DE8CC66E03B082AA36139AD1C93551521A5A9B4934F9B77FFC52DAC1776714AF1EF95113B7855FCA0998A4AF6C7042A1A09D1483834FCB7B85B03DCF7C8EA0380D62B5AAF5375FA49CD851E75A79FD51CD6A9D1F7136E52B5DCA562C9A26ACEAD65BDF18AEA1E595D012D73162935716D935A04BE03BF028AE7288D3E76BC087087E8D037E348F5A495A8BC724103CB35920A3BB5CD7718D8AE51355AA76DB356DB7AADA6D5CF1AE6EB80ECEA669BD5CDB6A9596E53B1DA2A6FB64DDE64CB35DD7527E5F8E401EE5FE863EE5480FB0A1EA2FE27709FFF0E77229242A38FB9C3B0EA9EA13B4FCA704B1B72C8996E93D4DB2D6BBE4BC966A3327D8869AD0A3DC0F7354A360077D0B299644CB7A9DA336B39ACB9A4C67452FABC6BE8C3DAEE5A34651482C668B4610A6D88B6320C417D2BF43119F0BCE38BCF4C472FB32B19899B79ADBFACC1AA6ACDA266C724A1B75EC96EADB2C35A25DBB54AD68C01F78D0AC65BE40DB834AD76496900DCD92FC9719C65E04E9825FD25EE1834627E7A02075F842824506EE2FD02C0927F6CE72E253E01A7B3E71598398E3131E90BEE07E5DD52FC4CAC8AB1DB0969DF732A7A1CC7B5598F781E57B31094B012BC9A681DF5EFC61DC84EC9EDA4E67662531B9713ABD0C9B51DB16F1F285A02DC9F28DB5478DF02B803C719B8D7FADEFE21DC0B3C6E7D71BDFEDE35ECA573F035DEFDBC4C9B85B6B3A85E9385C8D4BFC4FDD7AFFFEBA67F3BEEC08B86A6FA8020FF43470E6EDEB2FED8F143AF5E3E59A11189043489483FFD047C48C878380895B80C91563F3FBF1599111A1AF1EDF1EA6D195643BFBCDFAFDFF37D203C1AFC13126291BC0C637C09BE7F05055B18EC22CD8FCFF7B5972427A4BD7ADC5C943DDDD90A325057839F9E04B28F34358538391DE4E2E2DCB0E9103B67D1CBD7033979B0CADAC5924A584125B6AC015B58BF98524C286C00C4A38B1B974B1A964A9B16CA9A66CA1A272B1A25440E00D0F9D66FDDB7935568E38E3D4C4C66D24AF38D9DBDF9E523A5B5B3756D1D998551D6CE2799790498365D6217298F7F07CB69A6540FE14A7BA895832BD5C394925E10727E172CB1BAF3E6E75CD79B69D61179CE372ABC1F54FA3C04D07F310F79ADEDF144DDF9968C45E46583476A4EA0C2F73FCA987E5702FA3BE3C8485C4EDB6252F5E4BBC29197A9CD375F5C97D531163E667DE4A2D41EDEA3EB77585C923ACBC9778C83DBCFC666A0B5198F802DCE4DA290302A445BA650C63184E29EE1F00FA9EA41B7CEBB861F768A147188FC59D57EA3AE07B36588B067FC99A8D7720F93B5DFE69B7C2C744DAB704B2DF7482DF54C2DF64E2DF14D2D0C4C2D084EC92B9C41D42EE3BA882B432B1068A380F5712A34024155086CF62CFC7A51956CF8AD83AE7EA782E30EF947EF317761B6F2DE69E1B1DDD47987B1D34E23A75DFA76DBB42CB7A89A326B3BFE7C456FFD55DDCD57B5D79F96DDAB6E1EF82EA57A72719E0621A834602B818C014BCE0A1EB6829DFF07B84338CCBF2078D477B823F024F437DCA721C82C227ED729591E5983BD3A4EBBA58D375DD6DB2667F193AC1993BC1993A2E51A252BFAEE04355BB06A5CAF6ECF246DC26CE0B65ED6788FBAE531A7101665930B6E61F544A89B427F9700EB3D94955E1AD40B4175684AC6F8E23E7D5B517D5B013D7B1E6D3B0E0D1B6635EB5D4A56DB94AC99240C99AE9A32499981DABE49C576BB961D8BAE1DA79E2D878619B7AAD16E49850D07CF1C50D4B9F32577104D9DC451F0F4F352416820D4AFA18080E74079C72197C07B859B99A9484975D2D03CB4759BAAA0F0858D9B0D45C49558B9AE6E61B6D87F428B6B9FEC761ED53D22DAEC072D852FB91F53F43DAD157441FF96BCC36BC300526627FD3A48591D8C7CBBDB0CFD26337F9A3FF0FD8F43CDEB2264B642C5FDA0B943453DB084B277FAEE9F4C7C1E295A7D34F4CA738C007C17BA448294B84495BA5E2F728D62E41BEEBFB0FEE7B837DDFD046A7B46D483BD6B7770AFD97C90933FC4D317B904A7D1BEBD5DE0217D82A8B4152AEDFF6BDC2934726F7FCFBD077725AF4A6CD9BA81978F3324D86F78A8178F43124073272049F865221646C02C829031B07F15EE208075C2D23CF01D3C06DF097E027599BE1F153339D85F575EF0F96D61E23BF000393A889D1C5DE8EBC14C8CC187860A3F7FB6D6D414636515636193397ABCE27DC2707EE15255DD4271052CBF025FDA402C6A446494130B1B80EFD8A246647103BCE457DC6DE5D4AE8A1D16DDB8536CF36E910D3B7898D68367666A5BFB0B2A464B6AE76ADBBAD20AA22D9C4EEDE61666DA2CC92E5A7DFFE3526E0BC01D5BD24DA918A0550D918B7B4048799DC8D486A18719A5BE0FD26D22B3ECA34BDCEF307007D67F3609FC68E4FF58CD295AD2E88694D9736DF79AD017EDB713A7DE16A3D39B48055D20D8EC56744603EC4B71F7830FB10AFA464247ED4F486AEF3D7A91995BE7C4B90B7C42670485C3DCDC267ABBA958D4F2D21C060D274394051C6E781903708F4BCEB17DF0D6E4F147F3F779E64995CE453D0EC57D208EA5BD4E25DD2E255DAE251D1EC56D714D23379B866F378DDC691ABAD73C78BFA9FF5163DF93C69EDC19781502D74EA2774FE03BA8F0C32BD02004B590A1322CF5E3F06C4C756B68755B5CF7586CDF7440CB907146855E72B1FAFB6CA5175F641FBDBF72E3D9B9F03BA7026EEC770CE73170E73374E3D7736497D33F61EA14F629BD6A726E15772AE30CD5FF00EE04D82FB8E39154EAEA983B52C32B64E3C18B2C121A026A3600F76D578D40736733F2DE63E2CD6CEACB62E1CF6615C86E1DC46113CC691B0C9E3CE019C767E12B6CE32F197C57D4CCE38463D09386BE3632D4B75AD83BC82B1D54A8830655A1A969134B276CBD8FD8FA1CB4F6DB67E1236CE6CD6FECC56BE8C169E8BD45957E04E44615870D2AB6EB15AD3628986E9433D82CABB35B5E8F455A73DBD96BEB0F9C3CA4A27B3F356F18479D234284BFC69D804713D008F06B1216E6AB32325C75758FEEDAAD2624726EFD463DC1BDF491999D1CC6A287F5F90FD91FB91C7245335ACEF8A99E47927D6496FB9D02DF47F5511FFB1F6603D9BFE1FE4DF67F17EE85DD8B1F4ADFEAB97D34F606B87F32F2CE778AFC863B901DF8FEA3B8D7DE7CF7CA252429F4B6F0DAED007771369E08DF40141C0134FF1E773AEB8CFCFF8C3B994A9A85CDE515E45A5A5BEC61D9B96EC34FCA2A726FDFBD40C0E7D1A825026199484412B0300C720EBD3C8B599EFD57E14E45C101EB44F80205B9C4F84EF080089B212F4C0E375496247DC87DFFB23E276DB2AD013739BA029B83E04BB0BEDEF2E4945047A7CBFB0F88ECDA2D7DEC84AF89797372DA5471191CE05E58BE9457412869A096B660736B48050DC077DC2FB82F9636CD95354E9737BE0E8EB691533BB4834DE0A7CD423F6F155DB7DD514113B03E905F315152B750D3D695927FDDD4E1D44E2E11A6CDD738C51A9F262F17B403DC31C55DE4F27EE03BB1B00BE04ECCEDC067B72DBC2F6BBEFE2EDB2126D52A3CDFE906C0BDCC933EF80EACCF758A4B340D8A97B38ABCA41F7DC538C13430C331A62AEC45DFC3F4F98F15988C66FA81F0A5BD98CC5A50DE1F68591B0B1FB7387CC1E4F079292E11495E918BFC2212E2076F06062D8C8D4234320183241230A415328C401841A18B7B06E3330ABDDEA6FAA49546D50EDEEC5EBCDE0D0BEB8285742C04B6CEFA374EF8D58DF854F7FB55F6F895B60614B70615B70697B48694348797344516374417D5278F2EE4CD22AB91A466C24A2B81D686A774E0A91D64287978F659FBF0EDDAAEB8FA9EB89691A8D691B0D6D190F6895BE3C898215858E75460D3A06F75A77B51A35D46995552A1F6E32F8A716F556EBE958F7874D1394833F4D6A3E29A6618F23BDC515422FC37B8A3D17F0CFDF4CB3F0DEE47F23DEEC4253C09F90DF7CA91694DEFD03D676405148D0E9B78ED33F21237F53FEC102571FDF5C5D83797E2DE5EBAF94EE2F60789BB1F25EF7DBA7AF793455AAD5FF58063569D5D4A794465B77B5A857D42DEB3B6913204BE1E436AC052AA90F84A14A51A0BE5CDE33F0CCCB97CCA77FC54609B906FF53EDFF46D9ED1EB3C839739FA2FF34EFA3F3EE2735FDCED96A07D38A7990FB3AEC30E55F31D4A86CC8A7A7BA454B79F93DA76FCC2193DF32759C5A338DA02F92BEEDF9C5A0D03770A818821E29010094F422CD5E5E579999A9CE6E05017DD0B70D7E117D1151055E714D2E5DF672E76EAB5956775F4D3C69B6F079E66CD7DAA8025D58360333AA192613AEBD9ED8C50723A40A8ABA328D0EA5ED03FC91FF8FEC7A1E5773370C7A63642055DF3EF8A5F693BBF37F078AC649D68E25BE842171CC80E282F738BFE5FE05E72FDF90BD790D7DE91823F6DE35AB359780F475C58246A19C9C09DB146FC1B77FA047E7102098F23E38747876EDFB975E0D03EA6354C22A2FC1696C6A0BCCF4C8FA1500B0077121E8E432F00DFFF85B88300DF41E8DF4600B50B05A0C7CC8E4FB437947EF9F0F9617C7EC2EB9ECAE2D9AE16D4E82075610622E07B2B2B623CBDAE1C3ACCBD71D301760E677DC3F4C7CFFA730AE6CBAA962BEB160BCA1673CA00EE2BE56DE4C2C66FB8A38A1A968B9B964A9BE64B1B41796F49CE8973F038CF29C4C3B48E8F69C3BE753B1C64D43A53F3470AAAA64AEA17ABDBBA93F3AE1BDB9DDACEB18F698B2CF7FE9E773998926E72D520BAA89358DA0BC238909190D30E74C6A7370F3E482FF6B8936C119A631F0370AFF07E50E872ABD0ED7685EFC37C979BEFF4BCEFC85BDF92B100FDFD9E92DD1B039F74E7D89A8857038F3397926A08B9ADCBA995531F72525C439D8E5FD1163CAC217204E07E6407EB49761E890387EE86852F8E8F412B140A194FA511893412068226F184D2BEE11B29B9CECF129C3FE600BB439BC67D6B47BCEBC7BD1A267C9A27FC9B27825A27C25AC723DAC642EB06C2EBFA22EB0623EBFAA36BFB62EB7A6FD476DFAAE97CDC32F0A67B2C656C3E7B66297F069637BD5838B3543C8FFA3C30175FDD79BDBC35BE75E466C7846779BB6351B37B4D9F5FDBB84FCBA86FC3B07FC36050C340485D6F5065A77F496B5069A77F7E4B50618B477299F9FD773EEF5333FAC687C8343AEE5FAF2DC3C07D610537FB7F843B7E964658F88A3B154BC77D056A5B44B9DD7F71CEC445DA2D5C2BEAB9EECD77260F53CC5EE73A64D6DB6637D9E636DBE7B7DA15B63914773896743A95767855F5C5F42C04D50EB8E5375FAF1B8AAD1F0C2E6A8DA9E8FC3C38933E319F3101FB32329F340A4B9E44BCEB9BBBD3301853D51359D51351D11B5AD11754D6E75FD2E757DCE753D2679BD26891546BF8A144E369A6FCED04C9C8C7E7026E9DF5B97EC4D66B9F81B5B0B2BE9892B69A8BDFFBD29A71026D81F297B8D320329E88011BD3108D0436745A4A4A026CAC2F0B0800DC2F6CDCACC923A82F24A62FB85F834BD8E6E0F98EC71F71F98DF87CFA3E7CA86C805CD0874C6B41A7B593F37ABFE1FEBDECFF7ADC8BFA30290DB4BC8E99D705CF351CDEE8BA3E51B649360FA0DBED1E4B1F93718F2E778FF951DCF33D6F6505DF7BE91176D7C15760CD56AE9FB7F26CDFF3F0663C0E83FD13DCC17BF6FF39EE682C0A6CECA3F0E8BCE27C7D431D16B6DDBB59B61F397E202F3FB3A1B17A6A6A088B5D22939124D23211B744A41F44FC7BA319F951DCE9A0E3D1F410B1E031501E3933313FD4D3569C9BFBEE79EAD307B519C9932DF5F0FE2EECD8306D7E06373E96F6ECA9B6C4159E0D9B38D6AE933B7EF25964F46875DD444905ACA2065156339F53BC9859822FAC5D296D5D296AA6E43700DF09858D98C2066451137D64A6A41194F7F9EAD64FD7E3358F9CDBBB761B1FD33A51A62D36928A0DEF53C70AAA674B1B96AADBBA127322F5AD4F6E611367DAA2C47B68F44B29BEBC0FE08E2AECC01777E38ABA3039AD007750DBA9853DB4BCAED937C575C1CF33EDAE03DCCBBDEE03DF8BDDE241AAFD1E03DF41A94F320BFE64161471512FF2B241CC55933B0A3680F81CD79BF5D7DFF63E4C994E289CFB5CD4F1E0E37D7D073DE1138ABCFB95840E8375CF3166EE2B078FDD0B8F9A1E1CA2E07024229EBE578D444042D44922BE6460382E2DC7EEC93BEB5729CE69152E856D010D633E0D639E0DA31EF5239EB5431ED57D5E95DD5E959D8135BD20C13503C1357D61D53D11353D51D53D31555DA185F5B115AD0F1A7B9FB50EBC6CE90379D336F0AE73F4417D6F504EAD7F4EDD8DC6E19BED333E957D1E157DC1ED33F6655D76A59DC03E97920EAFF22EBFF24EBF92769FC2961BCDE3B79AC6EFB48C871536B9BC498BC92E2B9D868F43F4EB19FC09EE9839FA200C1AFBC74058FC9F07F743C180ED833FC57D9C02DDCB2EB18C7D6AFFF0A3F7C7C290AC86B8F2FED8BAD190DAE180BAD1C0C6F1A026FA1A31A87D32B8632AB463DAA5BC2BA87924B06ED0A3B82DA8BC2BAE692CBA663028BFF16E6DF7B3D6A117EDA38F9A061E340F3DEE188BAF1F0A296E03AF46D60E47D48C84D78C85D48C05D58C06568D81C4B42C4635CE85D68EFB95F57BE6B73967543B7E2976FC9463F9ECA346D46D459F500DDF50EF072FF2DAFBE628D0120522AD5E32EC3BD9695FCF4FA511B078141E3477880CE1B11D5595A1CE8E52FBC414F90524B66E5761E751E7E237143EA8CCCA67B5FFEC627A19B50C549076C600203AA36DE173EDE2A77A745AEB2AEB6D8C5073DBBF05B4EC3FCBFF1E77D4973AF09F987C91FB44D5F685A6E35315DB54CBA032CF1B0CDCCB3C632B3DE38A9D237F14F7249FB8575E1191A68EFC3F6DE5D9B88363F38EF7CF5E928924FA1BF537EEDF4FE0175F402C624938500987C6871F3DB92F23778D93877517F3B6C8A890376F9FD7D797CFCF8F1389080A054523A3E82749FE6B71C7A14018B28F75B777D75534E4A6D7667EA9CF4AEDAF2A85F57610264748D313C4A9F1DCB76F7CCCCD4EF0F2F36FDE7A494CDCDFD2BAE45312A2BB6FA6A266A9B216565C399359309F5E84C9ABA21435D10A9BFE0A77447D57E5ABCFBE9AC612DCA27BD76C1561DA6C2DA150FF2E65B2B086FE6A757BE7E7EC706D8B131B59F6336D5515383A9B554BAE1E22550E200BDAE9B21774A0B2E8E72281E64ECEEF029507F1B9BAF75652A9D7BD02E79BA51E77417307B217B9DEA6EF5FF57B54E279B7C83D1EBC7A4FD1F6B6AC65F4156306F10F541CDE9AF8273B4474DEFFDCF32469E2436E61D83D9773F23AFB4E999F93D23A71F1DABE233A57645EDFB90F70C72210382C9A48C42FA191F304EC28165D3E3C763FBFD4EB43AADB9702EF8246EF8ADE80667A67F76C1AF3A81F76AF1E70ABEC722BEF702B6D75296E752D6A752B6E03487915B7FA1437FB1536071436B9A79705E6D55C2F6DBA59D97AB3BCE54659737C79EB9DEA8EF0BC06CF94728F948AC0928EE09A219FCA01CFEAA1A0B699C0F679BFD629DFC671BFBA9180DAA180CA5EDFE20EAFFCA6C89A81B886A11BF543DE69E5D68F3F5ECF2C2999860D92A85FAF0AB97AC9DFFF34EE6480FB1404BDAF69F57F93E2FB3E3B38B532AEB4EB51F3F4BDF6B9C0AA01BF9A61F04BF9368CFA378D06B48E07B64D80F8360CFA350E5DEF9A89ED9C89AC1F8AEF9CB9D7351756DA1151DC72ABA6FB4E7D5F6C65575C55F7ADFAC1A8CA1EBFBCE6EBF5A3510DE3110D93E18D53E10D33A100F4D5C475C0E3DA17635AE7AEB74C45358C824D28B0728DAE6CBF5DDDEE9798E5F62221F06DE2B3BCB2A669D81204C1A97F893B968441A2E1182C025A2141045C574D75A4BBABDCC103325CDC722C6CCA6CDCD23B9801EE2A6CFC2622C7E15995888C2A584A2522B51E93D582C96C07CD1D9FD50D150FAD16F6DFC80EFA35C81F58FF257FE0FB1F877ED53C807B612F32A99694D532FE2CFBA192D55335BB67AA761936A18CA36500E5F42B1078DDF85FE0FEDE35E29D5FB4AF8E39FFBAED025BF7306FDC9A96F8050298FF8DFBEF26F08B4FCD4FCFC1177064FAE04C734753507820A8ED6BD73329ABC8B97B382526BEEDED6D452267417307B84314FA25B37FC73423FFBB6119FA383B7C81217B635951497A5259F2C7AEB2FCF1A6DA99F626E4502F79667C79B0AFBFAADC5245F9A2D85E911DBB24C40F0458D9A43F7BD1595C36D3D43A5B59BB54563D5F5036959E37975280CA2A27E7D553F31A4080EFC48246EC2FB8C34A1AE74B1B4137EFCF2C7917186D7151F6F40ECEFD6BB73B49A9767DC99D2EAC5D286B5AAE6AEF48C80CD7343BB981F910D3360DA1E3F0C2165ADD28C07D39BF0D5BD889CC6D5DCE68A41FA5BE3AE64ECC6C4527D74F3DCB6B8E78036407A69779DC2D76BD0D7C2FF3BC078A3CBDC57BDC29F3BE9F6A1B09FAFB736DF7DB7256D7258D00F151578D63644C323D62126CFDEBE25ED4DE7A15AE626C7B4EC65351C7EA9A92BB8E7184B347597A166661918041E371181289B0B00C07B88FE3B1B593332F2AEA4252F3FDB22A02CBDAFD6BFAC3BBE6437B16437A17C37A17237B61D7FBE663FAE663FB17A2BAE6AE77CD4577CFC774CDC675CDDEEC9AB9DD3913DF39E599551D58D81055DE1E5BD51153DE06948F2B6BB955D9FEB079FC61EBE49D96C91BCD93B16DF371BD88987E54642F22BC1719D2050B6E9F0F6D9D096B9E086F1809A9EA0F28E90AABEC8DA91B88AEEE734CC8358E7F09702F9F43FC01F7A5FF04EEB0EF711FA3409F1BBB2212737DDF67F97C2A8AC86B8EAF1989AE19F6AFE8F3AE1CF0AEEEF7AE1BF46D18F66D1AF16919F66D1D712C6B33482E712E6A01E5DD39A7C133BF25ACB2DF35B52AB8A029BAB2F3466D6F44796744791728ECE079EFFC76FF923EDFD27EDFF201EFF221EFF211EF8A7146221A67231BA7231BA7221AC701EED1F583B1F50337EB7A5E758F5FCF2D0FFD927D37B734B5A9AB1B8E8543108CFC97B82371CB4B8805240A06D1881001DB595713E9E52E77F8901C0FAFBEA89816AF90E4E61D66FB8EE90BEE37153D319F5A024FAF04B823D31B4173A714F693F27B69854350E50403F7DFC9FEEFC07D39B18698D93CFA24F39EBCF923656B807B965D78956F7CA9471CA0BCD2E7668DCFADFF05EE2F1D43DE07C5B9A91A086ED829B2936DCF862D4539798032FA1BF537EEDF4FE0171F9B1E0759061F018886442F7FF8F856F2EA25A6354CE2FB4535B554EFDFBBD5505FB5B03081C723C864348D4CBFF901C3F7EFE7F407BFE20E8740BF6004F7EBF77CFB4E46488845C2D23C6E7116353B393BD4D7555F5D949E9CFCEA79CAF3C79D65050BBD9D0BDD1D8075C2E4D8585D4DCECB9707F7307332AD11DDB4CD524621EDDEA3A1E28AF18ABAE1823258791DA2A46A21B76C2A357F36397F39A314975343CCA965347706EEA8A206647103A2A8115652BF58DE385FDE50FEE46DB0B6C9356E91C31B767ACA6B8E66977E8F7B8886E9B1F57B00EE9AC22750C5ED50FD08A5620099DB8CCDEF40E63421D21B88F9EDA4BC4E5C462326A5019352077B57D673F353A5CFC342975B8CDA5EE27E07B475F038D7292EC73136DFE56655D0D362EF7BA976512F753D6FCA58849ED7F13BA1EA7542F19EA69DD739C5D7D63E45D71FC5E85A3B5F53F55537B294527A1E1E93F8E8D9505B07FDC63C14328542A2D0C8F328C412449BA6521BE7175F553504A7E478A715FAE4D67814367B57F581C2EE5133E4560B32E85E37E45937E0553BE052DEE356D6E35ED6E551DEED59D6E953DEE55BD6E55FDAE15BD41C52D11153D71FD7D01F53DB73BDBA2BAEA6EB567DBF7F767D44794F5859AF676EAB7B616750C34450E3B44B59BF47CD885BD59047D5B06FED4870E304DDF7C6F188BAE1E8C6915BADE337EA079D3EE598DE7D7D33BFA201810535797E850A705FBD872A8A4282D308F41DAA34CCE22AEEE855D07F335FA59C41FC6FE774B2FFE9397DCCFD57DC0944248E8C4551C8301A6D9CB492D6D2139D92EFF33EDDFD7D7650667574795750513BD83AA10FCB348C04358D05B68C07B7D18765423A27A3FB6136B975E05DBDD1BBE05FD91F523B78BF0F11DD30E697DF1851D975BDA637A4BC1324A27600ACE4BC0ADAC18A30A67D3EBA63F17AE75274173CBA1B19DD8D8EE94185344C87344C86D13301DE2ED0DCA36BFBC05BFDBC63243CB3382429EB414145465B5F271C3BB7024DE3C9AB63EE5F9DFA9A55DC97514B8B4B73CB8845884280F0383AEE9E9EF2478E2A09EDB53B71CE48EC88C4963D36C72E581F3A6FB1FFCCCC97427C51CBEA987B17543104950D12F3BB08D95D94821EF257DC3B5765EF5A959D3E5F1D61079AFF6EFEC3C332DFE34EC8681A799C7157D60294F7E76A8ED9F611D5BEF74ADD6F16B94603E56B7CE28B9DAF83C78CD065FF9323DCFF80BB7DD0A7E09BAE8ABA221B76EDDDCDC1BC6E73455109A08C813B09A2CFBFF94E27FEBF78FAF7E20E26E03B0A839E9C9E9A9A995E5A5A1A1CEC7FFFFEADB3B3231313D3A64D1B8E1C39141414D0D9D9CEB871001E87A260902414828858C22360C4E5453206BE8243404414983302E1E1BF867EE7040C281AA052D170682A1A49412D93910890C5B111CCFC2C79098699991E696BADCCCE4A79FDEAFDFDFB65E929FD0DB5A4B91908019F6E6BFD78FBB6998CEC69761E99BD0794F71DF154D4CC8CBD3B909A37915532575045A8EF4415D5638A6AB185F520F8027A08DF85F10CE355FAF84C71FD604A766F4A5667625ACB87A486379F1BDF26767C4CEB49CE06E88FE59421AA5BAB9F7DD03E70469C69AB02DF01E3231771A51D84D20E624917B1A4835CDC4529EE001F186A51073AA3819CDB023E27F8F47A5C721D3CA1A4F7E6A722B79B8C7118D0D64B7D5787657CEE177ADE29F2BA4BBF048DEB4D9072FF47E0CBF7467EF4811A25AB10691D7F59CD1015836055036F45ED6003F350333B7B351DE2CC02611E86872DE39168020E4F249388540A165A19C5E30788E4E115A87466312829DDF0F663A74F5991559D7EA5AD7ED57DFEF5A35E75231E75631E4D539ECDD31E0DE3211D7321ED33A1AD93212D1321CDE3418DC341F543410D03FE55DD01559D2041951D8C045780745EAF1B09AF1E0EAAE80FA8180CAE1D0D699C08699A0A6E9C0C6AA22700A4798291A0A689E0A611CFA216F00F9D520A74EEBEF04848CD1E9B1986A0210211F4500C44C15389640A8E46C64144343D04341D7786EFFF96F9320D6C1CE06669B8792A8E7E34248188A6EFA8A0D0C6D0F81E24E1416EB9CBD384EBB9955E49F9E62F9222ABBA81DA81007790FA3190A086717A1A47C35AA6435B26429B26431AC7821BC6836B87836A46C09A200C6C24D5F58184D6D313563F18DA00320CDE7C3FF0A3EAC7425BA7A3BAC006D302D8C4F16F9CF2AC1E01F1281F742DEEF62AE90AAD1EB8D1387CA76928A6A4C9E75396CFBB2F2F2A1AEA179093AB27912DD16F33B88283C8F8D51057E821AD90C17A1D8FC752292412068307EB773C113F3F9FF2F295A994BC1CAF9822BB88E981B381B25AC1727AFED7349F5B79B53FFE8C2B6C05211480B4832EC2086824945C46BAA87920DDABD75EA79F53BA52D00B5CFEC3FC870F852465B743C5FD2BF9DD604ECE6E2FF37BF840C1F6BDBED7073D9F0297B84AEF7BB9F6D733ACC20A9DE3CADD6E173A809EFE3DE2DFE72BE8DF07E0FEC621E473F04DF50367F76F6115DACAAC23AD383D340A1463C84E580D837886F25F99FBAF9CFEEDB8838942A1A0D1682C164B2693914864535353424282B0B0303B3B3B2727A7A4A4644444446565E5DCDC1C068DA45FDD048FA1625144241CB334BB3C3FB93433B2383544C52C81D0B0B015DCD2EAAD70101079192221A91804581F8090D1CBF49B23A3568304EB002CC07DACA3BDBEB0202FF173DAEBD7C92F5E80C08686E023230B7D7DDDE51589F71F7A1A185F11D927B26EB3F159090F79F5E74E3EF54FDF4FA717C3F2AA00EB94AAF66FA6FF3301AB01427D3BA6A10555D7B454593B5F520D02AF6C42D7B52F56348CE596C2AB5ABEE12ECFFF15F755D6E9A1CB5EDC016407C165D453F25AA9B9AD848C06425A1D2AB162F8DE974AFF7B807520781E583A7DEE83251BB47506EE0CD30B3CE2C11CBC9A64194A3F0A5EC624405A3B4845FFB685D34307AF5BB6AE0F3CFC1F0746C4B8F990E760F8C5253C1C894763080402C09D44A3E220689448E825928656A08A0558645A8EF9FD67EE1F33A2CA5A024B5B836BFA821B467DEA463DEA26BC9AE73C5BE781EF7E4D13FE4DE3010D2320FEF5C3F4D40D8084340D8184350E7C4B3848C35064D34468ED5860E5907FE56060F530502FA076C4B77A08B475A0398375FF5F12D03CE257D91150D162FB395BE7DE33DFA48C8299F951081A21E01110840525938E3B101E4723E2E8F73D27E0E80AFF1B03A761E8E33F341CFD9E4D140282484063890414853A81210C61492F4BEB5C9F7F084D2FF44DCDB7FF901651D3F50DF72020FB6AE8947F17C6938CEFA1135FDD1B54D31DF85DFC6B7B41FC6AFB41C0DB0B56A2111D3320812D93BE0DA39EB560753B06B678DCCA7ABDCAFBC26B8700EEF1F5032159159EEFD28212D2DED5B5B5207000F7B9D52B4000DCB1105819D2C3F09D813B9188070D1EE04E80830D622279119EF3EEA39DB296ED2545AF2B1A37F5EC13DC23527CE3D2036ED5DFFD309F51FD1DEEADC46FC96F67C8BE8AFBD79B2831EEA9C4A0FC8FF99DDDFF6318B883AD0150DE8999ADE053704FCEFA9D9EF77B5D6FFAB1C2DE0FF21DE3B26CA28A5D6F57B8DF2D74003DFDF782FF8300DCDFDA877C0A8853D9770AE02EB69DCD405E757664FC7BDCF1BF25FEBF7854E6DF8F3B909D4AA5D2B762E8F7A582C083E5E5E5F1F17157575739393980FBE6CD9BC5C4C46C6C6C9292927ABA3B57EF6045A6874200B51DB9303533DA3FD6DF89854DE39666F0F069026286B43C4346D24F3727A3E6C9A825D2321C347D021C865F5AC4C316708BF3848579D8C870475565C6DBB76FEEDCF9F4F8716972726779F948531384C12CF6F7172725C5787A195D93B924BCF7E86EB6435B764518587C088868789E309C92379F5D8E29692496B7E04A1A7F1477785135ACB46AB1A472AEB06C22B7643CA7782ABF62B6A8FA8FB8CB091C30FC6BDC09598DB482F615D086B29AC8998DC0F7D917396DD1AF416DCF72A25F0A1820FE0D77B088832F2B039F803ACF7835DB39EE8DBE77A8842EC03D46DF2A2924B6ECE1EBBC7BCFF21FBF2A7F9794F7E62375014E595A262151442C8644C493A924B0A4E221688244EA27904073AF5D5A8ECF2F757CFED6333123B4B036A4B425A2BE3FAC790C9477EFFA71DFD639BF7618987BD60EFBD40C80F8D60E32580FA81F0489EB9D05B9D933FD2DB77AA66EF54CDFE89CBDDE3A1DDE381E5A3F0A125837EC5BD5EF51DE1DDC3416D43416D04C8F7F0B3DBEADE0F108582BF816D799BD4ED2BFFF2232A7B86A895E424709D865888A592103DCE90771AEE2BE82C7D2F37B8EFFB5F94BDC67B0A471D24A5253A7CFEB4FBE9F32FC81EF992551351DA08903B21909A91B6104FCE201550381D583413543E079F06558C318784FC29B46AFB78E5C6F1D8E6A1D896C198E681E02096D1E06096C1862BCB160DB88BE91D43211D838EA5D370CFE167E4D53BEF513DE9503FE95FD51F543710D8371D59DEEEF33DC5E7E8E4CCE4EEBECEFC591A7216866059AA55019CDFD8FB85328002B2A058DC12FC101EE2B0854E997346F03F3604DF397F60145314FDB5FA68E7C2E9CCFAAC114B791AB7AFFB3B853733B4179C7A6368236132F6DF146C7F39D8E57AE432CC0BDC8E5569E436CA9FB9DFF35EE1F7CA315448E896F6611DFC365AAA6BD303EF5BBE6FE37EE5F27180C063A3BF01D280F1A220E87037350E11B1B1B1F3F7E2C2F2FBF6DDB3626262601010103038398E8A8A9B1E1C59909EC328C4AC040E0438B4712908B68D80C845F0601B59D1E2C0C7CC6A8E8792A7A01C22269682409B1845D98434D4D2E8D8ECC0F0ECCF5F51524267E7EF2E4D5CD9B9F1F3DAACBC959E8E9A5CE2F40700428ECA9CF9E7B1A9B5EDEB77FDF8EDDC75838548F9CB49552480C8B6DFB90B250583D9B5D369F59862F6F01B8C332CA7EC7F73F0EC07DB9A4165151BB5C59072FAF5928AE9A29A4CB3E5F520B2BFF31DC4939CD50512754D849CE6EA66637D3725A509FCA471EA69479DF077667384483C51A500E4C07B88307F9EEB7EBC25E02DFD3ECA2D2EDAF03F43F9905059CD70891D7BF6BE15CF9F8ED4C51CD7851D57051E5746DEB745307B484A4215014149ABEAB9B44009F6DEA0A850008A090060884511AD48AC2BCAC6EF0FF94EC9B94E597591252D278BD6120AA7522B061049477FFD6D9A0AEA580B639CF9A4120BB5FDD1068EE21CDA3F483DFDB2723DAC71F4EA0401E8F2F7FCB9371C493F1E587A3A8F8C1E55B3DB0D8EE85E8CEB9B0D649FFBA218F8A9E6FB2FF06F796A1A896218F9C0AE3671F2C9FBF7B50D5D08CC54F41D018FD641B2A96462451F064120EE04E25ACCAFE9FC01DBF8AFB1C9E324D818A06262212335D5F2706A6174596D44655B58756F73104FF9DEF0062E03B7809C81ED134015678B11D73715DB3E02D026FD4A331C4C351F88391A5FBC3B07B434B778697C25BC6839B4600EE4079C03A78BB408BF7A919F205C5BF653AB879CABF6638B86620A66128A6A62FBCB0CEF6C947F7971FEFE496958ECD8E52E897899FA2D06648442C04B6CFBECACEC01DC84EFD7A67501A158305DB7310960021313599B921960EBECA869F3CA3DA5EA44CA496C1F31B29B5FD50FD10BEACF33F853B31AB0DE0CE38881E99540B3E0B37AF9ABED272FFA0E793631F53E1751FB00E7C2FF7BCF7BFC3FD8D43C86BAF0829BE03621BF71CE110B0D533864FCF01DCC1762D71858A877E0DF8123CF9FF35EEF3F3F368349A7E75A2D53119603D0A8502D08397FAFBFBEFDCB9232323C3C6C606FA3B0707C77E71B1F0E080BBB7E2923F7D68A82E9F1C1900CA43642CB442A4A06164D422797981889821C0A771ABB7CAC32F4C413834844212171710E363333D3DC3CDCDDDD5D5A0A4977CF9529498589192DA595A36D3D139DFD9DD5751559396E1A267A07559F238270FEFCF1BF66FDFAD73E6E25D67CFFCFBCF9ADE25CDE657A2CB9B66334B67D34B1857079BF952F03BBEFF71B085B5A8D23A54653DBAAA015951B75442F77DA1A866A1B40EE03E9EF31577AD8367F6ADF91F70A7E4B54225DD0CDC81EC507E3B39BD61F15D6163D82BE038C01DCC416107C483800A0FE6F5E1AFAA829E02D9C1AB80FB448B90A08B5A11CAC6F7AD5C9BDE24913B87A87D63D8AE41F2C8E4CA0C58CF2DAF209154348A82C7001CE9831B34B0654E5DA05186F1B809DA0AE8EFA91D3D715979815FB23C3F6705E757C7D4F5C6B54E84D40FF9D58D04B7CE84762E06B6CEFA368C026B425BC6223BA6627AE66E0EC08044F746112F67092F6771AFBE06CB0878E6E90CEED114EEC118FAEE28F2F610FC7ACF6C50F388774D2F98839E0EE2DFF235BEAD2341A0B7D6763A7DC9357DFEDE2B29FD53F74017895E42A74878F40A19472110C960CD84A51031A00A00D96938CC1F38FED7E64F71A75FF87781409E22D21AE7E08F8AAADC5E7EF44FCEB951D1145EDA1056DDB37A12C04048ED2023A175432041D5FDE0C9F08691EB2D13606BE64E1FECFE20E2E130E2CD3CE1CD3CFEF51CFD4D7B39837D3E8D7936857E328D8EED99896CA7FB4EC77D35ABB883D5EA4858CB7478CB34584F80AD0450DBAF97B507A4155BDD7FE3FF2EE96D5573CB120AAC0EA7A92B5378F20289047067B0FE7D6D079F4EFA5E55B0598DC1E2166010E6FFB17717F0515CEBDFC083BB06777777B700C1BD062D450AC5DDDD2DB8278484048810D78DBBBBAFBBBBBBCCFBCC4E086990CA4B6FEFFDDF3B9F5F4F67372B6137FB9D67CE9E39A343A4CACCD0A80BDBF6EC99B7CA7BFF85528F107668AA0497AB4D29D3A794CB7079FF24EED567EA2812BD4909DE71E5FAAC0D2FD6ECF7FDF11454EE807BF2E10768D97EF411E01EBFC7A5B6DDBF1B0CF71707CFCFEE3A6850D3F6937A0F3EB8E557955052077758C164FF6FC71D4A75601D5BD7E97432990C70371A8D7051AD56E7E4E43C79F264CB962D13264C7074748412BE7BB72EA3870F59B9C4F9E881BD6E4F1EC4468696E666512A8B655C8682CF500B583A31D728E7A135BB1AFE0A650A264D46A1F02A2A287979E078764464724060BCAF1F353B979C994D4ECBAC4A4CC90C0CF1BAE17274C3C66FA6CF1AD4B20D6464DB0EB3FA0EDCEAB4E8C9A113595E7EFCE46C6674B238013D33AA3022451C91A28CCD52E23285218975F8FE720077092E55129F2A4D4813C6A570A3935811F1ECC8242E2EF5CFE26E8929C6703784E79923F26105892A5207A4931E0443791EB9EF16680EE539D6FF9E720AFD6635E39C5BEAE967D835F0D3B73F9FBEBAE027C0FDC64FBFA63CF13497531096C846E5205C117C74017744AEB02A95160D14EF6AA3410D25B0DE6290D9CC549D9A63B1302CD6041AE35962CAC5C0F0FD9EFEA742136E6694DD29A65FCE269DCA249D2F645F2CE69DCC659C2B605C28625D2DE3B81044E0F553B6FA055FEF2132780AF4108CAA9A780A7580FB338E067C875B3E64AA5C48C20BC58C13D955A8EC85643BEB1FDA73054428DB7FF57EB7F395EF9DA4F404AE9068B670119BD0821E13A1B5688DA66AD921A8EC9ABF1B77398ABB4680CEFA5B7DCA0E15EC8E6A4C2691C14C51EAAA94869032C2312FBFA33E41B792B34F47A55C4CAB389789BF90613FC80B5EB72C02D65ECA225FCEA3DC2C64DD2EE73E26489FD3951E2CBD0757EFCE51BD602B216E2C851B4BE9CA5460FB3D0FA852173CFF7211FA2533FAAD751E05FD92239B7C3C8370A99075B5900D4F7139A3EA6676D5E5989C83AF83F73D7F732D2832AC8C48D41A05B039D41BD85ABDD46CD6BEC7BDB6EC56885E8F982D3695462F102372B5852F49F20F3EFDD3B6A38BBF7FB5F75CA15B80202A4B1E57208BCD57C6156A124BFE59DC8D11C5DA907CAE67BCDF967397A77DE7BA6A6FD0960B317B5DC074A8D9C1770CF784BDB7EBF0FDE500EE9E7BCE3FDD7B7A6AC7BE031AB79D3E60C4C95DFB7552454DB70CD63383ADC035FFFB4215C1FA64A02C8016ACD76834803BAC80F242A1904AA5A6A4A4DCBD7B77CD9A3543860C69D2B8619BD62D7B77EF3276E4B08573677DB766C5AF3FFFB8EFD7CD01DE2F437DBD6383FD32E3222BB253E965054252B98C4ECA898CC80C0B4F090C8A7DEB13F1D233F0E973FFFB8F7CEF3EC0BD7C15F2E4B9C795EBD7F71ED8B372ED8AB1132776E931A859AB018D9ACFECD57FDB8225F70F1C8D7EF0BCD837841695C88D4B9724660BA25345D1696AA8D913F3E451E9AAA80C5362411DBEBF1CC0DD905E68CC42A3CDC85326E74893B2E42979CAF4C2BF887B6CA92E34C718960B2B484C29AC88BD930BAFBF06BBE38EDC8780F2A039988E75B863DFB2420BC5BBE70F47EFADFCF5C2D29F4E2E5F1F78E18E22A71C610A113A0F610B11A10C91C81099CCA640BF7F366AD0E9DBECE78D53AB113343ABE09B41045B2E97F73A33FB5A50F85E57EF637E11D7930BEE1552AE64E2CFA4E32FE4332020CBB97CFAC522C6B572EE1D92E40953E92E30BC96587DE43628D25FF2AB0BF6575CCD2B9E0A02EB4F39CAA75CD53328E1055A68EFD325572BD867F20920FBE942629DF67C3EE197D7815B5C5F1DF50D7E5D5299AFD692CD26B6C528472C2AAB5E67D6DA2716C56457D934F6D4E5F8EBA61A77741282DFE22ED11B2BF862BAC19AC5979DF30DDAEFF1E65A4CF2D160DCE5B4F2F319151733F017322BA1BD985575299300EDF53CEA8D42EADD52CE2382C08DAAF0E468DE0ACC3E62B33B53E1CE92617165CA21CF5968A0847F4015DFA8E05C2C44BBBF2098F2C753CA2FE7D1AEC3DB915E7525B5FC5646D985B0949DCFBD4F7B053E89494AA1B25966446443582A1557AD56D96B4F601D93BD36EE268D063199AB719728744C5EB4E7DB836BD6BBFCBC0F70CF7CF85A129BA74B2D87E25D115B80E490FF29DCB1C353B1E33F58EE316F369EBA3079DDB315BB23765C438FEC7B8F3BB42907EFFF05DC3D769F7BB0FBC4B8763DFA366E336BE8980B078F99941AC01D1CC74CC758C764FF1FEE885EAF07C7A16C8712BEA6DB9DC3E1884422AC8487854C26BBBABA6EDFBE7DF8B0218306F6EFD5B36B67C7B66D5A346DD1B8418B06F59AD777E8DAA655DF2E8E6306F65D3065DCFAE5CE7B37FE7066EF8E6B470E78DFB9FDFAD61D28CC3DAEDE7879F99ADB85CB6E672FBA9EB9F0EBA2E51B66CC5D3878C4A8361DFA3834EA57BFC9D8769D66F71E30BFEFE05DCECBDF5EB88E0F8F55E59529B28BE99189A5AF831449B9DCB04471541A925D8164962B22D2007724975087EF2F077097E3D264B1A9D29814617422373C9E1D16879E7335264D9AFC5770B7C5946882B3F421D9484C09125B0625BC3630B7E2EE3BA8D9B1DEF6F03D37A2F6BB00EE5917DC31EE6105A00FD876F1C537079F7EBBEFECA2F57BE7AE7871F02C27211BA1F1101A1761F0109E10114B11A9D42A97991512935A6AD44A8C1A994E2F879A8EAD928A4C7A298294894401B9F92E81617B9FBA1FF57A772321FB513EE17A66C5B9D4B22B39E48B399463C9656773C8000D54EEB789423BEEBA37528BAF0279C15541A00E75E7283CDE07D69FB115CF786A90DD5D6C803CE1286F1179174BA8670B881FE7627ED586679E9B1E3D3B1B141641A155994C54938163D0A9100B706E306B00777B87CC3F83BB4D2B33EB5406F88B369AA47A632983CB3621951AE3D577A17B9F7B5C0E8F39E4177E25ADF4427A05E46206E05E792913704773239FE25244BF5FCE794A14B9D315AF797A5F91F99DD4EACD537BF1ABE3CDFFB0C703BB4150BFDFAAE25D2EA65F2CA05F28B4279F762CB114DE8B1BB9D44BA965D7924B5C528ACE06C56E7FE076D92FF45572463E4720B421128B852997F3950AA83A6BB35E233B3A4E46A1440C4644A53500EE22B98ACC0C7BEEB173C91AB77D673D769F49B8E9268EC93565E24551D9325C1E52C4FC6771D787152A03B2E9AE51DE3F9E383F69EDD3E5BB707B6E251CBC87C99E74E83EEAFBC1FB89FB3E3DE4F17301DCDD779FBBBFEBF89836DD00F7B923C65F3C7AD2A4D161B8D714EF35B2C382F1F5EFB9FC2B70FF538BA7E7CB3B775CF6EDDBB362F9D2F1A347F5EADAA95DB326807B8B7A0EAD1B39F4EDD47E70D74E1D1AD56FEDE0D0A9A143E7860EBD1A36EADBB02996FE0D9BD5A49B8303983EBC69EB291DBB3BF71BBA6EF4A48D53E76C9DB580141E478D4A64C5A6F21233058959C2F84C416C3AD4ECB2984C454CA61297A98E46A3791FECE21F0D2E5D894B57C4A4428078596CBA14F609E23245F19994E0186B19191F84CB7CF1766CB30E431C5A8C6BD9F9F18EA39FC3DD1A5B828D9681A0B2437068AB0BCA33459608BC9340F088BD37A14ECF3CFF024CC786CDC41CBA0B811528EDA1A20FDE77EDF8FC6F76CF5E76F3E7DD856F432D783AE06EA5B111F8000BC43691D02C111AA47CBD8CAF57F08C2A915E235668E54A0B3A238FCC661658CCE552994F7AF67177EF935EFEA7DE455E884CBD9C987F35ADE26A16016ACF9B858C73D90410E73947F35268F41299BD44C6574203D4EC2FB96A88275709A67BB2151E2C29E4055BEEC6533FE5281EB3648F98D2276C39E42143728F2A3C965172BE9008399A5E7C38B5F0647639AC1C884EF9F9B9E7F990089FB2CA1C991C2BDBD93A155F25511B94B02932E91516BDD206D12AB0F3697CC47175AC2A45CD3AA25155E74FF7D1CB11B508A9A9DC35529356A9D7A9B4F09FC922D01939461BC5684D66F11EC6279F78FBEE884FC895B4E28BE9E597322AAEE5106EE491A03D9F5A7A2AA10056EE96309E93442FE972883B4DE6C15078B2542F99B2974C09C49D0591B9A15140BCC406378EF2094D7A9724389F4F3E9454742CADEC5A31E35A2E05DE0B971CD28302CA9DB4B23341F1FB5FF8EC79F82296C42C9128587A1347A713EB610368D25BCD2A83466BD2E98D680C06344683CEACD759743A44A787B2DD2894D8BBECD484E4CCA7A72F1DFFF6E7C3CEDF26DE7A21C2E540E52E8F2B50251643E50EF91CEE3503D8EBA48ED135A973B39AD4B9594D0C11C532FF4C5B4C8525BA2CE5D4D31BF336DE76DAE4F3D329F450EDDF4A9D7C004DED6B6A073600586AAE4938701777F876FAC3B73F4D5D30AFDFC8EEF59AAF9C31AF202583CF641B0C060CF7DA353BB654B3F56FB9FCDBE14EA5924B4A8A1212E27C7CDE3C7EF4E0C695CB174E9F3873E4D0CA05F3C7434DDFB953DFF66D7AB56C3EB473C7A983FB4F1B38604AF7DED3BAA199DEBDCFCC6E686675EF0B19DFBAE38CCEBD560D19F3EB6CE70BDFFDFC6CDF31FF0B37C26F3EE0C4A6A1031313B2244939D2A41C496236E02B4645AE961D335D1B559D3FE73B2E1DF53D261562273E1DF53D36139E826AC79DF05BDC1FEDFCD3B85B224A8C11C5A23729A52EBE50B043E04F1C644FB41FCD04B2633D3635B85F58BE71DFBC9557D66F4F7FE1A32F23214C01C2B457EE42A155C43389794609C720E31A145CA382AF570BF40685DEA6D7D90F0A02DFE96A554C59F9FD90F0A36EAF8E7B079C0F89BF9954703F9774AF80762B9B7831ADE2420EDE05CF07DCA166473BD985865722FD7BDC95EF71974100F7976CE94BBEEA3957FE84297BC2923C65C99FB2A58FE892FB54FE853CFC85BCCA8BF904684F67961D49CADD8BCBD81F1EBFC7CBF756746C081E5FA490D32D269E552FD0AB846AB1D620D7EBE5669D0264470F1CFD57E2AE16D9A06CB74F7207B81BB52AD82B55EA8C428D8EA9311094DA1416C72323FB7260E8A1D7EF4EE3D24EC6E75E482EB99A5DE99247BE9147B89C567E2A21EF562EE94139D39D2CF164CABD184A0F86CC9BA9F2E6A83C18A8ECEF7DB7F7CF30EDB80BF5AE6C05E0FE8024BC54443B9252723CBDFC4609FD527AE5ED5CF2E362FABDECAAB3C1097BDD7D4EBC7A772B242A9DC1AB5228F946B3109D565B0B053B3AB8D8888E79458F46B6C762468B7804F69EA16687FA54A9310B24884489889555F1694F4F5C38B16EE3C925EB53EE7840D98EE1AE4E2AF9677137469628037390B82A2871924E3CBEE9F4F3BD855BFD7E3EF355708F3A723BE99ED7FA49F300F79E0D5AAE9E35BF302D4BC0E2188D1F260EC37087E57F47A8FEE9C5668F013D9C422D97492402BE90CD1630687E1E2F7F5EB70670EFDEA2C5F8BEBD7F5CE47C6CCBE6A33FFDB464D8E86543472F1F327AC5D03158560F1D0B7971E894F7C98BA1D7EFA53E7F55F92E0240D7E496598B89003A66BA2C215B169705F242CD2EC765D4C88E99AE8F44F3D77057E3522176DFBF3EEE486C9536245FE293C6F58CAFBA1F08F53B380EB2D7C11D02B887ECBF7E77C39EA38BBF3FB36663F8AD2792EC62842D4238421B938BF0053621CF2CE41A456C8398A597320D328E5EC9359914669BD660D569CC1A3562965A2DA53C7E5861C9598FD7273DFD4EFB86DF8CCD7C9A4F742D67DECB21825997B2F177F13C37B6CADD3EB40358F7E46BB19A1DF28A039163B8BF624BD0FA9DAF70E3489F3125CF98A2E72CE97396F8195DFC88C2BD57C9BC94537639B7F26E05ED7A3E616F58C256DFC8FDC1B88BE1D1EE1919090C065EABE6DACC428B4E6254C9B4528D5EA6D74BCD7A99552703D9110D6A776DC1EBE4EBE12EB6FB5E8DBB45A33461B86B7562AD9EAED4968964596C7E249EFC2431F9E89B77FBFD230F84269C8ECDB99A597AB7807CA7907823ABF2626AE1BD42CAD32A96175DF696AB7CCB56BD66CB7D386A5FBE1A70F7608A6AF95E5DBFC3ABEACA943FA14B1E5284D78A6927524B4E6794DF2AA65F4A2D7958407A5E42BF9190B7CBCD67EBDD67D703A3C2CB0925421953A79759ACE8801E83C68A9810C46C32EB30D3B1603D34D5B8ABB58802FD1E1511CA11BEB4343AF1C1E1D347576FB8B07A73E6C3D7B2F802695CBE22BE107057C615FE83B89BA3CBB4A105483C1E3E05F0477E7BE19627CB76066C39FFB5708FBAF67CEDB899B3FB0EEFDDA8F5B74E8B4BB3F2C45CBEC964FA1FEEFFBF0BB0AED2693506BDD16C42A7E441C7195911D8F73199195595C776EDEAD3B66D8F962DBF739AEF76ED6AEC9BD7E1CF5D533DDE64B8A3C97AF91692EDE193F3120D3E308A1C84A385C6B1A39205B1E8F7A5E8179B6905E0AC2426034A756154AA2832551A9506B22BA23380E63AB263F9B3B86BA221A910D4777487201D361E18EE48E907DC0739B418DBA213E0AE49FE93B8C7E115EFB200774D701EF89E7ED63572DFADF8A30F007768417608D61D8FE1FE72D7D9336B361D59F69DDB91F3A4A84484C147786213958EF0B85601DB2C6099844C8388AE17D30D12864EC634E9C446A35CAB9329D412704B835860BFBE90CB77C3C55F7F177ADCD3FF846FD8CDB89CC7B9F88779C45B999517B32AEF130598EC505A02EEAF043AA8D9B16F5041762C18EE9E6CC92B9EE20547EAC61041EC7249DC68C26764DE0BAAF04A5619E4099EED928FDFF6366CBD9BCFA18048B7ACDCB0CACA7CB1886AD209118BC4AA9719954ABD54AB971875E84977D1192950D9E580EFBF1277D4777535EE7A9D46A3D52B0C2696525321949448E4F952797069F995B0E8ED9E7EBFBE0D3F1C96742129DF25B7EA5E2109DAEB99658F4A692F88BC372CB93F5FE3C753FB7255D0BE13685F3144B571B7FB8ED6EF5E3C14F7677429F8EE52C13E9B5509B9554CBB9D8DBF975D7127B5F86C50FCCE27AF0E3C7FE59E945D209492D57A91C5A2860F9441A7D5AB6C8811414C5674E4287A5803168B418F0E92D1A1B1C955D5B80B6416A6A030047767DFB183CBBFBBB5617781EB3B6552B13CA1509950047FAEAAF822F0FD6FC73D0EFFC958632A4C51A5480241E69711B1F7E61DE7AD6EABF7056FBBF4B5707F77FACED2611367F519D6B779FB1F16ADC01794488522333A20A47AECA3FDACB316ABD98260F9371E0BF96F873B83C365F30562894CA946E73C41A3546A25523691B06FCB96CE4D9A0EEAD4E9CC8E9D4571F1C2F24A72529ABAA8525788C6505885C55C888700EB8CB0786678023B32891F9522C4A58962D251D6A3D2C0744178B2283C591C91228B4C03947531D9B565374454E76BE10EC53B3DE8EBE06E8B2A93FAA6438C11C5D0E65D79853B7827E1D843EC8026AC6C8715085C0FB8FB1CBD71EDC75D0716ADBDB27167AAFB1B6D05192A7703998A7039163ECBC46718F8549D80AA159275228A5642D5CAD95A254F2E81378121518AB536A3DC6A6568B42944AA4762DA71F7B7DB1FB8ED7FF9EE5244EADDB4927BB9F8CB59558FA992371293DD74F56BB1D1576A7C2DD47A71555E5C050464F7E24821803BC49B27F7E048DC19420828864246E5BB91382FC9BC2B6985171373EEE5575D4ECCDDE2EEB7F1F99B53C1B111646A2697632FDB4D629B4966464F86ADD6497550C1DB079BA3D3516864E8087495CC3EBB5C1D8EABF337E16E55A363490177ADCEA03259F85A1D45A1A4EA0D548B2D9DCB73CFC9DFE9E9FFEBEBE03D7E11C7C213E15F7723A3F85656E9CDCC9267E5340F12D78F230F14A803F82A7FAE02DA00A106C3BDFA95A955BFBF15EB6193E9CE51C18BFC9822BA5A884EED70A784F1A8907C3D3EF7E4BB98A3AF43CFF8863E884E8AA82097C9947C934D85205AC4A6D02AD5F0FA98D101EEE869A30C5A301D0BC85E8DBB566F912A1099CAC697223C8991CCCEF60BBDBEE3C0BE456B1F6F3B5AE115AE4D2B572416A9128B75A9E5EA84E27F16770BAE1C2A778E479CFFD6F350B97B7C732864FBE5AF85FBCB83979CFA8F9AD67BC880561D37ADFC865A56859D630FC3FDFD29C5FF87FB9F5FE08592289452B51A7672EDD39D180DC0BB52A1114BB212E2D72F5BD6D6A1DEC47E039E5CBCC42B293332D8ACCCDC12BFD0325F34153EA195BE6110BC5F3844149F298DCF9225642B13735549799A94026D6AA13EB5084A7549642A441A912A8F4A0791F5B139E839956AD5EC98EC267BFBA77007D9B551E9DAE85488DD77ECFBD5DFE09EE1FE1EF75668B7CC9FC5DD14860E025307E51AC28BA084273E0AC10E4C05DCB1EF5421D8581AC03DF4C08D805377EE6D3B0CB81F5CFAADCFC59B9C8C5C84CED19188360EDBCA63987874038FA2E311357CBC5640D008080A0159256188F914168BC017B1D546AD1AB1F28D46B25A1B5349BE1518B5F381EB96BBAE7B5FFA9F0B49BC9A587031A3E2295DE6A7B0BD959ABD847A5FB9355065F39118BC794A0C773476DCB1BCE6C981F8970CA1275DE8C5147BD1459E540130F7A49402A69F8A4C391B95762C2076C7CB8043BE51779372B224F24AB592653142D92EB6E8247AB94C2B556B457AADD05CFDAD26202BC570B72861A50EC7D5F9BB70477B665446AD46A552C9B55A9156CFD5EBB9B039B4D98A14CA683AF36C78DCA1E0D8DDBEE190834131A7A2532F25E55E4B2BC470F765CBC0F4773C25E00E7927507F1277889FCCE42D40F78A60F3E9C652DC2A635C2E2003EE77B22BCF04C5C3DB71C62FC22DAD200ACFC8E28ACAC4722982E810446D314AE522995460D2496D7AB94129B6FE1677AC6C47347AB358568D3B47ACC5D353BCFC2F6DDEB56BFE4A8FFDE749BE3186CC2A28DED54925FAB40A4D620914EF7F3BEE1FDD128B39BA0C9D862CA682F438D4F387A3B7E66F7AF5DD91AF88FBC3EDC767F4183CB5D7E0C1EDBB6EFF66030B4FD628944013D62D032DA4BA43E6BF7CCADF3FBBC00B6546EC3B9036C40A810DA611F6233506B9E2ED0BF78593A7B57170983D6294FB8D9BCCFC425169457178B4282D4F968246919A8F459D5A001144A70AA35205912950A443F86149105E6822D609035145A1410B765C961E975D87752CFF86B81B420AE02F1BA20F2B04E561E794EE1A5578FDF5C7B8C71CBA0BB8079EBEFB64F7C9438BBFDB3A73D1DD9D074BC3A20D042A86BB854B3772697A2E59CB25A8795568F878259FAC1633647C2A8749E0F1994A83528398251633CF662B9628828A2A6F86C41C70F3F9F589F7DE9701FB7C228EC7E5DD270A40766F91C183A7811560081DC6C753A2E1CAB0A0ACB32590B7709125F6A40B5ED105DE4CD11B86C88BCAF724726E67955E4DCA3D159AB0EF4DE85EAFE053C1F18F732A03C9EC4A838961350B109B18310B4D2AA1562C5109944ABE412334A98516ECBB4D547609C8FE0FE22E1289B862315FA511592C803B51A72996CB72946AAF2ADA9DECB213E1893B5F07430E05E2CEC5A45F4BC97F564AF120B07D999200309D23F76349FDD9B2773C851743F8EAFD3E4D6DE2DF8874F6B1A42AF0FD195D7AAD887236ABF26A0EE16458D241EFD0C35EC1F7E3332288AC5C89AA54A6AA90C8E468D98EA80C1A81902DE233340ABE41295489D906B542AF561954684C4A3466A5CA2657A1E364244AC0DDC61629CBC9F1EE6FCEFDB47DE7DC656F8F5D630425997388AAE412C0DD905EF9CFE26E8828467B66224B4A6EF93C59B9FBFADC9F00F7A05F2E7E2DDC6F6EDC3FB173DFC93D060EEDD07DD70F3FF3C8749D4A0D34FD0FF7FFDF055E28A3D5A6375B7426F4D0721D3A8458AB51C85512C9E35B2E33C68C6BEBD060C1D8F12FAEDEC027A51193D2933C5E3370C99C2834BCC8447E540A3F2A49189D0C1147A74064D1A9725C9A3236431D9BA989CB8228A2D101EC58D4D046A6ABC2D3203565BB9DF82C2CFAC82C4D54961DEE3FD4A29B8AA8747D5435EE60FDC7B8D774CB605FA86A928BF549C5864434B58937C7A1B87FE47B19988EA45221B0A209CEB3E2CAA17EAFBA1F9872BC1AF7F8A3F7E261E5D83DDCE1DB21076F049DBAE3BAEFFCB1A53F6E9CE87461FDB69CB7819A0AA2814441D82C0B9B6E6253F56C92968DD7B22BB5DC2A347C9241C2500BE9421641C4A7E9F44A83CDA4B49A6508C233DB8AC5F290C24AA8DF0F3CF5DC71DF6DEB23CF4341F12EC5146F8ECA932975A74900F4373CD50BAAF0355709453AA406777BECB8B3855E0C3EE40D43F09621784D617B1319B75373EFA6E45E0C8DD9E7F6FAD04B9F4749D9D14C518152CFB6DA24885585D89456A344AB10C90552194F25E799D462B34A0CA6D72EDBFF25B84BEDB2430BCF65EFE8B7F7CC70990C3A93C1934894668BC860C08B0415023E51AFCF50EAFCA8EC9B4919077D027779F91C7E17723126F1767ADEB312BC079EE6C3E4BFE34AFDD8621FA6D08725F2E14AEAC85E1D86045E5E57321FF2922E7E5CC5B9945176323EF76262CEDE97BE075E785FF20F7D935B9CC1155528D404858A2293A15376D84C2A8D5CC0A5095924B588A993B0143CAA56C2D748445A311A9D088D5128320B4466BE1091C8119E1861F19525C484E7DEE7D6FFB263D692C093B7B8C1A9B66C9236A914624CAB4457128A35EF7DAF1D7D6C8939BED21257F5716C0904481DA921EF35C7563EB4483C0989232071755B7D78B105570E6DFE55AFFB4BB65F9BF323E01EB8F5023A0FF66F7CC746B87FA2B58B7FC72EFB5D68130EA1E7488036EEE0DD88A3B7AFACDF31AE432FC07D44C79E7B7FDC22A4B18C6A2DC0048526263BB6A0B863F91FEE7F7C81D7AA76AA171BE2EDEABE66E192B60E8D8676E87AE7C8294E56919EC010A4E757F8845AF2CA6D0595BC88384E48AC2C365593906948C9D5C4A7E9E2D2F471A9580CB1D5D1C766E863B37E1B746676405C5B93C89C9AE863F2F531B97FBC35C4649962320CE8B3A04F049B13757C8E323E479190A34A2FA485C667BD783BA179A7092D3BCFEF3178F36427454A813AB940938446975804D1271419138A4CF12510735C9935168D2D064B8521BA0C628A2A43CF441C516A8928358717434AAE79155CF6483DFD24FAD0CDD0FDD703F75EF2DC74D465CDB6E7BF9C7AB8F5F8F955BFEC98B1FCE0C2EFBC4F5EA744A722548E89443792A9060A5947256A690435BDCA9E0A15A342C94423635589D9040187CCE552D95C064F2EE128646CB59AAED215F3C521398557BDDE6EBD767B9FA7CFE6675E077C429F165405F194508442250E55F9C352D2E30ADA633CE30981F984C87A46E57A70246F044A570A2B48A60A956B5E33D8AF69AC30813890CE7A9E9377CCFBEDD1979E27DD3D5CDE05F965E564B3793483516AFF3E50AFD318B5501DAB4C68405225D4CB10BBAD35F9E0EFBF30D54F6A1F85A9422772407F4FF86D35F03B43E44603D9A82FD4AB53C5C24062D593F4D4D381FEBF3E7FB2FEB6CBB5D83897F4B4E765E53E2C76A8441A2291FA09045E2CDE7332FB199903796E8F1B89F382C8794162BFA60A5E91B87E4C49284FE15E463B1188FBE5F9EBDD6EDEBBEEDCBBEDE71F5D524C50CAC4885589D8543693DAA2E70A983C1E4DC8A548D8241993A064544114F44A258BAC6451211A164DCBA2E9D874239369623011AE505349D2E32908954D8B4D7D79F4DC89553F9C5DF923CB3F411991A38B299445644BC3B374F1C5A6D40A7D5229924F3367E00DA91550CBEBD32A5489C5EA945253261129E421793C248B654DA59AE209DA68F40CAB8A90427D7405C4105537C6E84A7BF0D09AA3F0E6E84A4B14DE1285B6B6C84A5B24DE1A51610BAFB2411B56690D2F47D1CF60B03C93FC7FB9787FE98EC72BF7F86E3A9770149D64097C8F07A9ABE352BBB5CBEE927CE04EF24197147B0BEBD8293BE20FBBC41EBE1373C425FAE89DB0132E377FDEEB3C785C778726D3078C70BF794FC2E02006B34A2637EA0DB0188D4613B6188C10B8123B3613530AD047BBE3FF6D06BFFFBBE30EC1AE8D080AD9F2DD868E0D9BF76CDAE6C80F5BF28370F222A232B7821F9386145659F34A25B129A2A84451783C3F345A1E9DA88BB79B1E970C31C5A231C726426B67F7D3B8DB032B35C983D8C9FEE3C9357D84BB26AE1A77655A01233421DBDD6762B34E935A7601DC374D9A07B8AB52F2C1F71AE20177D4F7F81208E05ECBF70AD82185CF037C4850DCA3CA40763461C510D6F308C2BD77E9679F04EDBCE0F1D3E1A7DFEF7559B5E582F3FAF34B379F5DB1E590D3775B2639EF9DB7F6C5A10B65EFA214851516228ABB914C3650883A2A017CD7D2AAB4F40A889A5106CA83EF722641C2228AD8643E87CE86F0793CB94C6230888D26924496564178979E7DDCE3EDE6FBCF21A7FC23EE26E53CCC287C5A58F18AC88252D48F23F31728FD04CA377CC56BBEE2AD50E52B51BFA0B0FC04A250A922442C09E10B42586CEFB2B2C729C9C73D5E5E78E579E79DDFDBA4F8B4AA4AA24424341A34560B705963E81F4B1D7FBF7AEA3CDD97A2D3AB38460DDEA02C548892D89477A5054F9363AF86049CF4F33EE8ED71EC9DCFC598A87BD9596E15955E54AA179DE641A385AACDA16A0B245C658E505AA294E6688519A730BE05E20BAB9E64163F4E2FBC1A96B0D7D57BF753CFD3AF7CDE2425C615E75572593CAD426C500A5422BE84271032853CBA984392B2490A161158873714DD72D3CA354C923D641D936260A0B130E81084C5D554E08D15642B814E0C8B753D70E2C48AEF2FADD9C87D97A48DCE37C615AB227341797D428939AD52978C4E1F268F2B40C7BF27144078B86C7E4C8E2CB184E697C2F04B67FB6570FC33B9EFB2F801D982C01C883EA6D2105B05DC5B13484832EC7AD291742692CEB2B35E1D1477547634C03A0489C083EC0896D04A2BF81E8347926914D798D79BCEDF5BF2EB93557B7D7E3E8B0D12B3FB7EC7EE3B98FE9BA0B2A3AC7F085CB4E3EE02B883EC51C7D0849C70B9F6D3EE8583C6F670683A7BE028CFDB0F154C1E62B0A824328BC168369AD06133F60540878BE03BAC639399634BEDF57F7CF9B7C31D5B6A64AF7EA96C484941E1B9A3270676EADED6A1C1B271D3BD2EDFA1C467698A88F2D47C5D46A12C315D1A97AA4ACEE287C7B102C214B824C0BDDAF7D8540C777BE062DA47C57B6DDCEB12FF11DF5FCE677197C76763B8E7BCF49DD4BC33E0EED47DD0CF13E7DA714765B7E35E04F932EE50E0187095B571B78697407441399C17D1A9A71FB96F387863F1C6CB0BD65F72FEE1D2E21FCF2CFEF1C2EA6D50B91F5BB2E1D2773BFC2FDCAD0C8A11E714D7C1DDEE7B35EE5A3A8A3B5AC23308322651CC220BD8740E9BCEE6727822B14C6740BFA94310B1D14255E93D9273CEFB86EC79ECBEEB890788B3EFE5DB93EFC26EC667DCCB2A7C5450F9BC9CEC56457B8E673CC3335C892C90DD9D487B545C723727EF5E66F6D598F803AFBC7FB9FF60AB8BCB555FBFC7E1E1C15959391432552E97984CF01406DB7F36EE7A9D8A6B5051CD6A825E59A21465F09931D4AAC0F2A2B7457927BC5F1DF6F2DCEFE979E08DF7D1808033911197E3E3AE26A7DECC2CBC99596C4FE1AD8C62978CC2BB6985F7D3F2EF24669F0D8C3CF2CAFF88A7DF41D7D7079FBDBAEC17E6959C5DC2E5512442BE5A29D428B8322193C760B0A82C1649C4A543CD2E6791544CA20AC51D7D7335B472AD1D772D830CC17037D36980BB8DC654975719CA4990229FE0BBDBF71D5FFEDDCD0DDB0521F07929322796A9630A94D17986E432ABBD60470A68A66C822EABCA904BD465E32529C5C2C40269528926A54A974230A692CCE9146B260DC96620B92C248F6D48A8D2C7576A63CB3551258AB0026970AE38305BE49F6DC0E16B5243FC2771472BF730F8CBAF30C7E0CBEF87BC5C7FF2EEE2ED4F57EFF3D974266A3F54DF803B2A7B1DDC31C1D152FD3DEE69FBBF84FBC5EFB73B0D1CDDDDA1D9BCE1E3DF3C78A6E60811A34521915AD1D352A05539569EA3C083F54653ED2B417C28EDE127701173EB9F5DFE637017F305DEAEEE0B264DEF58BFE930C7EE07BED918E7F6969F5E284ACEE1E192A9C191A2D8647D56810897C409C199D2EDDD3235BEBF2FDED16E99B87F0677696CA622359F199698EBE137A565D7C9ADBA02EE1B27CCF90BB8A33BB0D1E580BB3512F51DC31DC195315F44451DBC7177F9D6F373BEB9B2F8A727EBF778FC7AEAF5A1AB81171E845D7D1A74F941948B6BA97FA438ABC85049369130D97F8B3BAD4A47ABD0D1CAD0FA9D5EA5A2C3EE3C51C6248B5954855820E073391C0E8F2F14481522959627D7D065EA0AB92E1ACF704BC8BC1E18890E94BCFB14B2C7D5F3E89BC05301E1172312AEC4A65E4FCABC99967B37BBE4617E995B69C585E898C36FFC8EFBFA1F7EF57ADBDDFB3BEFDD3FEFE5ED9F9D9D505151CEE7F1F53A605D6F0FFA15D69F9E2EA68EC55F3D759EEE4B316A555C8D9C6950318C6A9A5143D1AB2A35F212B9284F2A7C9B9BFD2431E1C23BFFBDAE6E5B1F3CD8FCE0D12F8F9F6E7FF662FF9BC07D6F8221B072F075E021EFC0C3DE81C7BCDEED7FE6B5E3EEB3DDF75D4FB9FB5CF70B7B1C951452882FE449F17C3E5DC46389056C216C7BD91C2E43C8634A052C29878AC9AE661051D9EDEFAC965AAE818B0C2286BB9E4E36DA7187C0DF83AAAC525F41521556A4BA7A5D5ABF05707FBCFDA0303CD390586A49ADD4C41729E12F3CA5DC9489D7A75548E3F2053139A2F87C65668526072F4E2DE6C6E77263F3843185A2E84241643E2F3C971B92CD09CE6205663003D20D29447D32419F58A5892B57E24A649185D2B07C4928EC1957EA63F090CFF9FE1BDCC3CBF5E1A59AB092DC6B6F9FAE3B00B8BB7D7308700FDF730364AFC6FDF007D9BF803B04AE871BD4E01E79CC25F8A4CBA9759BE7F41BD1BD5EF385A327FB3F75D7082480BB4C2446D0B30D552F6037863BDA3963071D9B324B6D5F6045A783FAE79F5FFE6370376A755989294776EC19DB6750EFE6ED9C474EBAB3FF64BA7780382D4F9890CE8A4A8056935928C0253283A3D44919EA8434CCF70F1DEE71B571AFC6B7261AFB414C1F13FF11DF5FCE677197C46460B8E7BF7A37B55537C07D5EB7813F8D9F5D8D7B5211E43DEE2510637C19C41C5B0101D32175708700EE109BDD77535841D96D1FEF8D47AF2EDC706BD9E6D73BCE245F7B56E41A407C97C089CD13A794F212F2F84905B0AF8350B9084BF029DCA1AD32502B8C940A03B50AD6E11A159DA8A493650CAA4E249271791C1A834AA6D1A82C0693CB60F2882C3ECF88544835990C611C9EEE9B51E0121871E6A5CF89976F77DD77DDFDE8C5EEA79E3B9F786C7BECBEEDE9CB9DAEAFF77ABCDDE7E1FDE3CDDB1BAFBB1CF378752338E45E44844F6676269355219130542AA9193DD59FCE86E82CE897EAF0E9F98FC61D763BA09A66ABA45C9D8267D40ACC7A9EC5C8351B99665385529EC9E5049794BA2624DD08083AE3FDF6E80B8F03AE2F773F7BB5F3F92B68217B9EBDDAF7D463FF138F438F5F9E70F53EE7EE732F30D2372D3FB6949C46609772652CB589C4E230D90CB46133D92C1A8F4D9370984A1E4BC1A6AA9824705C4787F717DED62A785BF59472B808BEEB682490DD600F86BB1E4F42BB65AA2892DCE288BB4F8EADFEFEC4AA1F5E1D3D2F8CCCD2259799D2AB940945B2D87C4D6A1954EBEAF47259325AAACB32CA8C25346B054B5B401265940A534A048925C28452717CA928AE04228C2D16D9C30CCA608764F1C372C551858AB8326D32DE908656F79A5828E7AB8376DDE0D0D8FFC22B2D5195B6C84AB4CFDD1E90DD125EAE0B2B910664A79C737BB072F7FDA53B5E6D38EEBFF57CE8AE6BD5B81F46B1B6B37E134B1DDC41F63AB8C71E76893EFA01F783CB7F98D67B488FFA2D964C9C11E4EEAD13CB1193052ACB1ADC31D9B151DA7AAD0EBB683018C077586AFAE531B7FED9E53F047704C59D43A685BCF6DDB66EFD88CEBD86B4EBBA7EF6A23BFB8E91A3136599F9F2AC02714AB62C35871D99407E17CA0A895626A4D5F5FD1FC55D149D264FC96385271578054C6BDD7D4AEB6E73BB0ED83076E69FC4BDD282AB32E1AA30DC6D51A8EF28EE91A522AF84F8A3F7EE2ED97CCDF9C7373BCF163EF61584A769524BB4B90484C043E85284C8B15431ABA7FC65716BFA64EAE06EA4549928E03BCA0176A59A4656D2A96A365BC660F028547817B87436148A428E88C7975431F9254C4105574A926A2A04F234223D3CBFEC5D66C1B3C884C7E1712E41D1E75E071C71F5DAF3C80DE5FEA12B1076F4B9DBA5373E6E094961C5A50904623E9B4B962BE4E8B99BD1D17B5AB359A9D529D52A2882F43A8D55FD1F8CBB45A31449F87C8558A49649F4F6B937CD0689C924349BF96613DB801E3D502E51E4B1F909044A5861A96F56FEDDD0D8DB6171B7C36261E55E68EC8390D88721B847C1B8C0F4FCC89CD24C029D285231E5068A484DE4C9687C8940249408B8623E4FC4650918543E8D282413C414BC9A45D6D04940B99E46B4CB8EBEAD067225BCA718EE100C77138D0A01DC215612439855E07FC565DFE255A7D7FE187CE52E372A53935CAACFA894C517086373E52925AAF472696A0982E702E8E2CC327E6A11252623E74D68C4C39741379F45DD7D1577FF4DF213FFCC172185DED1E57E0984A0544A48063332971399C7C71582F8F2A40A552A5E9B41D2659295F195AAB8EA60D0DB6B79EC5B56D477736405F80E01D9613F551F5E2CF2CB883DFEE8EEB21D8F57EEF6DD722E78C795909D97EDB8A3B2DB71AF96FD0BB8C345B8BE76D91E7EDC25E894CB0EE73513BB0FE8DEB0E5F2697342BD7C8C3215623473D91CB453C6DE1B037083E0509B6BD51AB55255C3FABF09E8B5977F53DCB1A5B6EF72B144AF54B3099417B71F388D99D4B57EF3511D7A7E3775EEDB4B37F1E1B1D2CC42767C3A273E95179FC68C8CA58544291233EAF8FE3E691FF241F90CFB91A590BAC47FC4F797F359DC8551A918EE85DE81D3DBF4C0705F3F668622A548958CCA8EE29E5802D12794417E8BBB7DD2541CDA62B85B701518EE76DF51DC89F7037CB69C3E3773EDED155B53AEBBC963F291020A524CD5151010320F614A100AC74604DCD1297F2D940F1DEE76DCB110400113B9CA42AE801662A4100C14828E4256D3A81A06534567CAE92C39832B67F3E51C918C2D04E209445A19914EA07399223957A1A34B54789EB48C2DA2AB4D14B591A0D4158964E90C5E1C9186AB22C7E049192C4E91485CA55042E81AADD06A11592C1C954A6343D416B3C66054C1474609B62B0C1AB545A7FB8FC6DDAA56AA1562A54AAA52CBD45A9552A752E83472AD5AACD588743A91C12835DBE436448A207C13C2D49848720D496D22D8032B649581AA34D09406BAC240E0CB40739658255418840A1D5B20A33105740647261028F95C058F2BE7B0E44C868C4E9153C90A2ADAF1A2A7918C54A209627F372DE42A0C77D860C38FB0D4E06E20A03D75088D03B87B9FBFBA63C1D2B3DF6F8A7BF882199501453A802E8CCB63E3B284C98592B412417261FEDBF0A8072FDD4F5FBBB5F3C891753FAF9FB6C069E0E8693D868C68D97D4CEB5E933A0C98D97DB873BFF12B864E5B377ACEF7639D22EF78C63D789DEE1658F416470E4DE7C517C933F09A6CB234B15C668F22A15C195FAE8A2BD7D8A38F4163C4956363C3CC91D5C3C30C1125029FD4A8C3776F2FD9F67CEDFEE09D57C3F75C0BDD75A516EEEF653F7CFD63DCB160B2D794ED207BD809B4C3FDDD69972DF3968FEED2A75BA396CB67CC0B7BEB6F54A8AD4613ECA8A2DD2F6693C1F4BE0746A952C8E472A98C46A3D1E9740E8723954A017ABB55FF2ECB7F0CEE1C161B3DAEC96849088D5CE7B4B89D430347878613BAF6F975D18AB0074F29B1C9556131745CB222BB509E912F884F9127657CC6F77F18F7A2D74133DAF6FCFFC71D5283BB39AAB4E886F78BEF0E1C9BBCECFE373BCB5C03917C2A52C9311792E4D925263C0DA1722D44BA094FB5D19808836DA2D040F64FE04E2160B8030410139960F79D08BE9BD96C239BAB87B0F86A06474266F22AC9B452825C00AAF0E9541693C1E570452CAE88C115537962B64CC35519047A8BC064E31A6C2CBD856DB0728C169A4A2D466C0293A94A202089840A9B4D872002A542A5D303EB2A950A58D7AB55669D1AD11B10B3F10B133D7E26752CFEEAA9F3745F0AFCF266B5C2A455420C5AF87729E05FA750C8640AB95CAD91AAB452954E824E8166519A10A50591991196DA04CA430B8117900FAFA112D55C205573F83216EC32B104F082B3185C1E932FE50805148A9842945028B077A565320C5CA685CF41F86C50DB482581EC660A117B3721465225BAB54677D4A0A2FF80BB994A359028562A0336FC82CC7CCF3397B63B2D3EFFE3D664376F5A54BA28A5489A5ECA8ECB61E0323949F9BCB4224672DE9D3DC78F7EB369C34CE74523274DED357848AB4EDD1C9A757668DCD9A169578716DD1D5AF5ACD7A65F83F6031B771CDCB4F3D0665D7A39B41AD9A2BBF3C0893B167E7B6FD7E95017F7BCB7D1C4F00C61723944945C2E4E2AC7A0AFADBC36B65C872BD3E3D0E1BFC6C8528821BA94FF3625E2E06DC0DDED9B83E1FBAE47EDBF19B61B2A7797D8233741F66ADC41762CEF7DAF21FE93B2079F44CB76DFB32E3FCD5E3CA273AF2E8D5A2C9FE514E11B60526A2C062383C1D01B0D109D41AF8192DD2EBB4C229588C4A9A9A9191919050505241249281462672282C58ED63FBCFCFBE18E1E998A795E2DBB151D5F64B39A2D3693195E6B019599161173EBF8D96593670D68E538BE4BCF7DABBF8D7CF282189B448E49AA088DA446C68992B3A44919E0BB32A1BAF31DF53DEE3723DF3F405F8D3B7AD8911697610FDA4B831EE2149101646BA272541159EAC86C6D74AE0E97071795E199BF35BD269FC55D1E9FAD48CD57A616E67AF81D765E37C4A1F9D07A2DBF1F354D1497A74A468FEA861852AB8C6978734A9521B1DC185F0131C5A001D0B12E48686DB1046B1C1164D7851599C28A115CA525BA4C1B921FBCE3D293757B5C966F893C7D579D508C94B1CDF9444B29D982A719893433015A0A043EC3F6906A3ADC6BE10EEB0420C04AAAB600C3DD4886EBC906325547A16BD130206A0A0BA2A471A0909730D188595C219B2F60F3791C3E97CB178A647C899C2F5709D55AB10E1D3D29D49B043ABDC46090187452BD4E6640A7A25519746ABD4E0B1F19FBC070A35663D2A203C6D1C1EC6AD59F971D52C7E2AF9E3A4F571DAB0A3D51FBC7874AA14757A9D1983532801E3DE99546093B254674DE240344A735697566885A6756E9AD5A0BECC1204AB3556E34CB3506895C239628444219972DE0B37802164FC4E48961E30A353B9D033B522A1A5D4D4377ADB454B23DD8FB88067DEFD0AD35FA9ED6BCADF6AD35BAC1AE09B699D7E28936064B595A551E11F3FAF28DBDCBD79CFD716BBE5F48D2F3B7A50131828C1255118999981BFDE4D5D56D077E59B86A7CC7DE007AF77ACD3B3834EAE4D0A44793D6FD5B771CD4AE4BA77ACD7B356B3FA85DB7218E3D06B5E9DABF65A77E2D3A0E6CD1A957C336DD1D5A747268DCC5A1E9C0268E53BA0D5A3A72EAF7531705DD7E99E21142C1E5AA0AE9E60ABE369FCE8B2F2607A7732272F91179A2F07C79549126A6CC988847522948061D49A3E65CF37AB1FED083553B5CBFD917F0EB85F8A3F7620EDD8ADA7F3DEAC0D59803D7620E5C893D7025EEE0552C415B4F45EDBE9278F836681EB3E75AF49EAB4947EE649E7D02B70F3F783DF8C0559FBD173C769E76DB75CA7DEF59D7C3179C868EEBD7A6E3C00EDD76FEB4393D264129960A78FCB2B2B24A7C555A46FA1B9FB757AE5DDDB1FDD7A58B974C1833B65F9FBE03060CE8DB176DA74D9BF6EBAFBFFAF8F8B0D9EC6ABE6C36A8E5D56A356CCF251209D0CFE7F3B1EF5DE17A58C18A7DABD50A2BD85DBEEEF29F813BC4629FACC7AA372AF8A2F28C5CAFFB4FF7AEDFB464E28CDE8D5B2E1B3BE9EEC16369AFFDA989699CD46C4E42063B2E4562F7DD5EBCBFFF72F58BB86B7169105D4C26E403EE91E9E035980EB283E9203B088E5DFCADE935F92CEED2D84C745ACAD4C2FC57EF8E2EFE76A8438B210E2DBE1D3145189B8BE1AE4D29D325A3BE7F01778835068FE16E082B86BD540C777550EEDBCDA700F787EB76265E79A64B2D47CA58863CBCA9846426D82947592761AC570795FD13B8D758008175D477327CFE5102C07703998E4547664050E8996C8D3D2A165BC9E2CAD95C19872BE5702502A14820148BA532B952A1D12AF57A85D620D76A153A8D52877650A8F46A8D0E1D09AED7A1B11FA3841EEA693F20084D8D927F32752CFEEAA9F374D5F90CEE0A442541542288552541E74800E8550AB35A69516B4C1A1DC4A831D863D26B4D00BDD1643318AD7A8349A3D5AB541AB95421178AE53CA198C9923058323A0B4057D2182A7BD4543A806E7FE3AADF4A2CE8FBF55EF6DA6F28E473B8AB2AAA10265B5E5C91FEDAEFE1A1E3BB97AE3AB4FA7BF7D3974E7EBFF5CAD67D0F0E9E797AECE2AD3DC70EADDBB876CADCD9034781E9BD9BB79BD07BD0F26973B6AEF9FED8B6DD17F61FBD7CE4647C6044ECBBB09057BEAEB71E9CDE75E8A765EB9C27CD9A356CFCDC9193A60D1C35AA6BBF7EAD3AF568D4A65B83563D1BB7EDDDB4FDCCFE63D64C5E786CFD4E8F4B0F327DA25929A5BA523642108B532A64A955EA34822E8DA84DC643212F8D2A9284E622C9C4CCCB1E6E3F1C7CB87AA7DBB7FB03779C8F3F7A07770895DD8EFB955AB85F893D7815B7FF2AEEE0CDB823B7D11CBA8576DD1CBD9378F27EF0DECB2107AF851CBB1970E2A6CFF1EBAF4F5E7F73FAA6F7C5DB6B67CC1FD37BE0E02E3D573A395F3D73DEEDE933979BB78E9F3CB171D3CF6BD6AD9D336FEEE8B163FAF7EDD7D1B143B3468DEB3938406069D8B061870E1DC68E1DFBDD77DF9D3E7DFAC18307743A1D94178BC550CB9B4CE8884968F57A3D2ADCFB819266B3195B01FDB195AFBBFC07E06EB6E30E7B3A169319315BE0F320A432B363123DEE3CBA7CE05847874683DB765A3D65C6FDA3A78AC2A265C515B2FC5276422A14EFE03BD639A38E47A389CF788F7BF2C7C4EB62D26B02C5BB263A5D15995A1B77680DB105A6F8226831E53F95CFE22EC6A5CB927301F7A2D7412797AF1F5EAFD56087E66B864C10C4E4A892CBF46955EAA4327542A93EA5D2924234265619E32A21A6EA4E180C77747C1856BCDB709520BB39B20C89A9324795AA0273E00FFDF1BA3D2F361DC979F0C69C43444A999A9C4A6329CABA9E4C00CDA1D593B1164DED8F77AD601CA05DB4F660178968482801F69E7A7B487408286F62308D4CF428473D8BA96331B56CA69ACD5671D852364BCA654BF97C8544AC5629A05E8152055A8D56A1D5C8213AADC2A05518756897C587E34E5116AB194554686AACFCC3A9BEFBDF963A4F579D4FE3AE56204A905D680F4A3C6ABD5286DDCCBE6BA2B1A8751093063847831E2CA337A0F329C1E64F26D788C42A1E4FC581229DAEA443910E153A1A1D0552B379B66F80ED9A6379FFC67D22D5B7A9DE606341DF59455905C2E64A0ACB82EE3E3AFDE3E6BD2BD6FEBA68C58F339DC63AF69CD0A9CFC46EFD27751F30B6739FE1EDBAF56DDEBE7BE3561DEA3519DB6710B0FEFCE6DD745C3CAB8AA4E28BED5F3F5A110B82182D5A899C5149CC494CC5058686BCF67D78EDD6ADD3178EEFD8BB71E5BA0513A68DEAD9BF478B76EDEB356BE5D0D8B141AB018E3DE78C98BC75F90FB70F9D0F7EF82AE36D241197CD4A2C926711F405747D1E4D9E52C189C8A1FBA7687125C9E79E3EFF6EFFE3B5BB5FFE702078D745C03AFAE0353BEE97DFE37E1964C7708F3F7E3BEAC8ADB003D7220FDF8C3D7137FED4FD98E377C20EDF08397223F4E4ED880B0F822F3DF03B7FE7D5991BEEA7AF3D3F7B6D15FC93FB0DEED9AEE3E01E7D268C1A3366D46828CC3B77ED52BF6103147248FD7ACD9B366BDBBA8D639BB6D08E1E396AF0E0C13D7AF47074746CD3A60DB45DBB76EDD5ABD7630AB9780000FFF449444154A953A75C5C5CFCFCFCF2F2F20402410DE860BD4C864E33895DC416B8B27AEDAB2EFF19B843D45AD873D7998D26C46431C9D53C12AD20312DCE3F6462BF417D5AB4EDD5BCE58A29D3BDAEB930D273546578714E913025C7DE3983FA8E16EF76DCDF77BE7F0277435C26167B155F8DBB32224D1B9D0DB2AB22B20077635CA139A118F3FD23D6B17C167741648A24315B955654EA137A76F5C6910DDA0C7268B6BCFF682E3CB81D7765428922B6088AF72FE36E8AAAC07007D9ADD115482CDE1459227F9705850CE0EEFDEBE922D7004B01C55ACA506697EBCBD022BD06F4DAF9ADE91F62FFF07F1AF7F7A1D60494B731683626D5CAA49959680C6C0843C761C81954298B26E7B094429E4E2636A8E5E814023AA5412D3568C410F4ACAD5A89458BCEC96ED540E4D0DAF5C4DAFF2BB803EB4A3EA282D88947AD477DC71E0AF3BD86788855A3457BA5540AA35CAA97887402BE9AC3D4B01858C78B1DF46A94EDEFCB07B5BF1C4CFC6AD93F873B4F00B591C7F92BBB96AE02DFF7ADFC66449B0E1D1D1A74746808753AA4A343E30E60B143E3760E8DBB366F3369F0882DDFAE7F74E37652048E5E45D4491588D92AE0705532B9153EA7F64FAFCD64B6196067C424A0B3980472456E616278F4AB27AE978E9FDEF1E3A6EF97AF1E3B6464BFEEFD3A346FDFB25E33C7C66D86771BE03C7ED6FA792BDDCEDD0EBCE39EF526921E972FCB26AA72C9F20CBC2CB144189C1173FCDED36FF63EFD66B7D74F47C2F65E893FE612B9FF0AC85E8DFBC1CB35B8E30E5D4D3C733FFCC8CD80BD97420F5D4F38F728F5F2F3D8730F838FDE8838773FF4C2FD77E7EEB81FBB7C6BE791931BB6ED59B3E19795DF0EEFD6A7738B362D1C1AB66CD0B845A326F51DEAC1D2B86993BE0307F41F3C68E4E851B3E7CEF976DD373B7FDD71ECD0E153C78E07BE0B70757505CABFF9E61BA8DC3B76ECD8A04103A8E55BB76EDDAF5FBF050B161C3E7CD8DBDB3B2727070A79B95C1E1A1A1A1C1C5C50505003BACD66C32AFAAFBEFCC7E02E53C8D1B36C6BB4F0E78218CC502348696C4669D5F15F77CD1D3BA1BD43831E4D5A6E5AB23CE4B12B3D254B56542E48C911A6D88BF7C42C65021ABBEF35B863F940BC39290B4D628E29211B88D7E2D2D45169E8B46211198A3034E03BF00DB2FF35DC39A109A2F84C757A71E5BBC84BDF6E1DD3B8FD0087268B7A0D6386A62B934AF5A904455CA90C57A44D82CA9D644800DCF1906ADCA3093587657F0EF727EBF63CFE76AFE7F69379CFFC8C792414F7DC0A7D0519AA752D05FFDB1020EFFB616AA7BA0CB48F9CAB05813DD5C4DB95B7D40A42A7220C32C2A002F110330B8212AFA491647492824951F2187A89C0A49498353270DCA4466773849835A20F73F662D3F6D66EABF3594C3F9F1A85FFA6D479BAEA7C097715D71E3EA2C688477DFFF0502A1504231E0DFA2032AB5C62968A0C428E9ECBD4B268E8A0467BA799FD8D205848D55F8DD47C3B82A5D62E173AF6D19EEAB70FBB2F163BF7E85B591B7775251EE1F29565F8E727CF6D9EBFE8CE812397B7EFEEE6D0B04BBD663D9AB41ED8B6F3B0CE3D8777E935B043B75E6D3A007FAD1B34E9D2AADDE05E7DA78C9BB0DC79F12F9B369F3E7EE2C6B5EBE9E9E9F98505040281C964F2783C8944A251A98DE877E316C462850FAF5EAD11B038E585C5C9B1F16141C1870F1FFDF1A79FA74F9FD9A35BCF964D5AB46AD8AC73F3767DDB779D3F66EA7AA7E5E7B7EEF7BDF924D73F9A9552A42C249B8B19B4D7B1A1FBAF3E5EBBD3F5FB7D3E5B4E461EB80AB887EFBD548DFB413476DC2F417087AE645C778D39FF30F4F8ADA833F752AEBB65B878C45F79167AF6AEC7FEF34F769FBCB271F7EEA5DFAE9A386B4ADFA1F00FECDFBE4B7387FA4D80E6064DBA3A76ECD7ABF7E08183A64C99B274F9B26BB76EDEBC73FBC9B3A77EEFFC5392922BCACA19142A87C1B498CC2A958A46A32527273F7BF66CF7EEDD00FAE8D1A3C17750BE6DDBB650D7C3355BB66C3979F2E4B56BD7D6AC59B376EDDAEBD7AF17151541090FC41B0C86BF6918E5BF2BEE76DE6BE3AE5029E54A05BC8E269D1E319A119DC92C57EBF892A490F00B078F4C1C38C4D1A1E1C8AEDDF77FBB3EECB12B0197C44B05DC73EC3DEF590ABBEF5FC6DD929C0DC170079735D1A950B92BC253A5C1C9E24034F2D0744D540EB0FE79D9219FC59D19142B884DD76494108270D737EC18DFAC637F87C64E5D0792DF252A124B8CE924C05D1A5D08B89B9389DAD8F2CFE1FEC96E1965608ED7A6134FBEDBF770C3BE241777754685B59CA92D24E8F114705C43AD2D3BE4F77147DBBA22BCC79D4CAC853B11A110104A15C446ADB25009661AC1442718E824150DAFA4A107B8AAD814BD886594092C4AB1452DB2A80466351A8B4608B16A45364DF52949EBE62FFA5EA3F0DF943A4F579D4FE3AE91D941C770E7A2EBEF7DFFCD3FEDBDEFE88A426A5588AC32A145CC310A983A3655474337CFF6F70255DB42AE00D3115205162BA9A2D6E8A63AB2A3B8D7BC95583E87BBA68A60A13114A55580FB4F73E6BF3877E9E585ABFD9BB602D98774EC3E7DC828E74933964C9D3D7BCCC451FD06F5EBDCBD5BBB0E8EADDAB46CDCB451BDFA90664D9A3AB66BDFAD5BB7CDDB7ED97BF0C0C5AB579EBBBF88C045975756C027173EC5140A054A57A9548A9ED744A355C8E450E3D3E9F42A0A25293BCBEDD5AB7D870E3B2F5A3274F0B02EED3BB56BDCB26D83E67DDB76993574DC2F4BBE71D97F3AEC916751703C273EBFCC35D07FC7B987AB7F7DB1FEC0BBEDA771876F241CBF1DBAFBC26F71BF58837BEEDD57C9B7DC71971E479E7F00093B73D7EFE835907DFF82B55B672E59396AEAA4EE03FA366FDFB161F30E8D9A776CD66A48CFBE23FB0D9A3D69EA0F6BBFD9BB731794E4F71F3EF0F5F72BABAA8410C9240E8F0B9B2B3B53284F685FF1FB050A73A8D03D3D3DAF5CB9327CF870A8DCA1906FD9B265F3E6CDA190777474ECDCB933D675F3DD77DFC5C4C4F0F97CF05DABD5D6E9A5F95ACB7F0CEE3A93111D84A4561BA078379810BD19D11AAD4AAD9CCD4F0DC71DD9B66374EF7E9DEA351EDFA3DF911F36FADFBACF4DCB81E21DEB99F92DEEC9FAF8C45ABE5713AF8D4981D84D4F9687254882638501317CFF18817F1CCF378EEF170FBE2BC333B5EF07CC7CC43A96CFE24E0FC0F170A9803B3934EED6C6DD135B74EEE7D06876C7BE556F6364B037904156C69761B89B92086A5CE97BDC09906ADC238980BB0D8747628950B3635FA8A2257C749922383764FFF5C73FECBFBA6273F0E9DBA2A4425B255B5F4A3191E876DC2BDF075F03FD6F71C77A6F51DCEDE3E43EE4030A7608DEE35E138285586E219542CCA45223B9DC402ED753CAB5944A2DAD0A7C57D0F14A364927A09BA45CAB426051096D2A9EC51EAB9A0FB16904F660C4D7A4B6EF9FF5F433A951F86F4A9DA7ABCE977057B3DF07F5DDAA165AD518EED8BFAEFA31B111FD76D9F93629CF0C5B441E5DC7226B69040D193DACCC44411DB792CB50D6896558DEE38E066E801D808605DB48D779436BE38EA506776579A5B0A0E4F9E9F3DF4D9BE571F16AC8C36713BAF6EAD2A0F9A08EDDE78C9EB86EC1920DCB56AF74729E396ED298C1C3268F1A3B6EC4A81143860EE8D7BF47B7EE50A2366EDCD8A19E439356CDDA75761C306CD0ACF97336FFBAF5F6833BB88498327C794A5A726E7E4E15A192C361492422997D20A14024342288D26A668A4559C5456FDEBD3B7FE1D2C61F7F5EEEBCB46BDB8EDD5B7704DFC7F618B864FCCCBD6B37DE3D74CEF7F283BC076FDE6C3D797FE5B6973F1E0ADA792EF6E8AD84E3B782779EF924EED187AFA45C7F1E73F5297C283CF79CBDB37EF7E9A51B0ECE5BB37BF68AD99D068C6FDF7348F30E3D1BB7EED3CA714CDF41CED3677FBF7CF5B5D3E76F9CBDF8ECEE83908040A8D0016BD83ED1D92CA952219249856291582A812D9352AE50C29A4008FF0EB158CCE5722B2B2B1312123C3C3C2E5EBC78E0C0811123460C1830A04B972EAD5AB56AD2A40954F1F5EBD747BB78EAD56BD8B0E1CA952B939292D081BF6AF5DFD42703CBBF35EEB0C0FFAD76DC61C56431C3560E36FB1683112E207A934D6B404C563689EAFDECC5F2B90BDA3A346AE750DF79CCA4F3BFEC64A5E7BEF71D3D23B63C11231E7C4F05DFA17EAF35F21D8D240427098A16074609DF45F07C4359AF0359AF02691E819CB7D1EC3738CE5B503E018A776CD8CC1746CB1862B240760C771D2A7BF594BF54FF2841348A3B2D34FEF6A6BD935A76E9E7D07056FBDEE5AF2364B185E62C923A01ED963124559992F0EAC862B4C33D16ADDC2DF6CA1D2BDB21088E04B8235155FAD012F01DC35D159A1F7BF2C193F5FBCE2CF8DE7BFF395E4C2652C9B296536D44868104757AE5FB9ABD26F03947714743417B723FA4E6FAF7C1360035551E2A02A9BA05DF4DF87213BE14622494EA09E53A221A2DA91C1C810D0914EF6A1659CFA39BC41C300B7CB72981783476E3849F00BDDAF49A7CD6D3CF04E3F2EF4B9DA7ABCE6771873ADD6E7A4DD9FE79DCEDAD4C08B25B255CB38069E4D00D4C32BC5FBA8F7127D97127956105FB6FCB7654F0F75BE5EA77B0E6ADAC8BBBFD7B142399AA2E2708F38AB95905CF4F9E5F3B61DACB735770CF5FCD1E30BCBD43833E1D3ACD1C3BF19BC5CB37AEFD0EF85B3CC769FAC4C9B3A64C739A3D67A9F3A2E54B97392F58387EFCF8AE5DBB376AD2B88D63FBE66D5B366AD1A47ED386CDDBB4E83DA0CFB4D9D357AC5D999C919293975D5155CE60D18542BE542A868824E2F482DC522887655295D9A43218385C7E5151496A42CAE4B11347F41FD2B36DE7CE4DDBF46BDD79DAA0D1DF3B2D3BB4E6E7B47BAF3C371FBBBB6A9BFBC6C3EFF69EC79D70893979FBDDEE336187AE861DBA1C71F80A24EAD065601D127AECAADFA9EBAF4E5D7FB6EFCC996FB76E9CE834AFC7D049ED7B8D6BD7A3B743F36E0E4D3B3934E9D9BCEDC441C37F5AFDCDADF3977D3DBC48A515E585C5E44ABC4C24D66B75E840469552A9D540652953C8F9420187C36132995432055F5E51525008FB22C5C5C52F5FBEDCBE7DFBE4C993BB76ED0A753AF06D1F44E300ACC3660F7668A08A1F3468D0E0C183C17AA8E2376CD850585808BE99EC0B66DD575FFEFD70FFD4F29EFAF70B5C7E1F8D4A6BD019B90C8E8FD7DBEF56ACEDDFB97BAF568EA3BAF672397422F6C56B5E6691B2A892199B561110C18C4E36E496CB6253856171C2509C34325E119920098D9186C6A8A212A91E3E740F1FC64B342C77346CF7370C775FA65718D93D08FFDC1F5AAE0F4E119606821BE350C73F91D81CA8D6ED353BC8FE1BDCF5E9C5DC88245E749A38310777F3E986D13346D56F33B959A7E4DB2F085E91CC778996F42A4B1A411E9987A4934C711510736CF5B14B68B51E8D055827A26D24C11689374756D88FD92BD6461491DCC23DB61E3FBFF0BBA79BF6653F79A5CF2CB115E3D9B189B03F8C7688D3A94612414FC49B2824339D62A051CD4C868985856560A3D1DB5BF0BD5621FF51ECC7B5DA07CCA02DB860A35011321962A3902D14F47018087AC4238441D332A86A064545276BD974AB186893225A25A2FB3381DB7F2AB5B4FD433148855A114F27E65B94E8EF605648646C3A0B5FCE255589E864258F053F32CA4456950CD1AB1193AECEDDFF3F52E75B849AD4B9191AF43B64A91891082C42AE89CBD0B3E8F63E1982DA7EF011568FDB89C73A67D015001ADDE2568F65FA10EC8DC0DE0BACC5562C54F49D8277AD3A64BA8DCCB45098089523CE2BCF7A1B7AF6C75F772FFE2EEEB94FD4A3D713BA0CE8D0A8A963EB1613468D5AB978F16227A77933662C765AB064A133B08E66E1122C8B9D21CBA01D3366CCF09123060E1ED4A3574FC78E1D5AB46AD9B071A37A0DEA0F183470C68C195BB66CB97DFB767878784949099BCD96C1A2900B24628E80CF1380F852B492D5EA4C3A7D6E7A667860F0AD8B57BE5BB66A68AF7EED1A356B5DBF71D7FACDA7B4EEF1F3889957566F79BEED98D7BEF37E87AF061CBBE17FE44A8ACBCBC8F3F76025E0D8B5A80BF7632E3F0A3DEDE279F8C299CDBB7E5DB77EC5D439E37A0FECDDBC5DC7FA4D3BD46BD2A941B34E8D5A8CEB3B78D3EA6F1FDFB89D199B28A0326D6A3D62415432A95C2681C8D08A5C281209D0E1E9421E1499168BC968D4EB741A3A9D1A19197EF78ECBE9D327070D1AD0BB6FAF2EDD3AB7EFD0AE75DB56CD5B366BDCB451FD86F560A54DBBD6DD7A741D326CF0B809632143870FE9DBBF0F54EE1D3B763C76EC1814FBA864361BE06EF87B0E6DFDCFC0FD0B8B5CA1D11B2C0AB9263B33EFDAC5ABCEB39CFA74E8E258BFE99A99F3AFEC3A9CF626909F53222F28E7A5E602F12C5C8A29A75C979AAF4FCEB166162159C596943C5352962D35F73DEE6F58EE6F8075CE0B883710CFF40C22BD08AC7AE6072DE02E0F4DD54643D9FE11EB58DEE36E973DC32E7B35EEDAD4427658023F2A551C9F0DB8FF347AC6088756139B7488BEF880E01DCE094832A7555A522BE59139481AD114577D6CAA5DF64A040BE67B14194D2409C3DD105102D14416B05FC7FBED3D7F6DE94F0F7FD881BB78971B1E6FCD2B5767E4D9F004844A8198087823BECA4C2159E97474AEA86ADC3FC88E4547A1DAC7B3FFA1A0A365C8740405028D85423753D198A874038D6E6030F4F6D17B2A1A55C7625A4402142FADFA4FA62EEB58EAB0F8BBD14B04E8F7BA7231F00D8E53CB8AE242023C1FDFF77874EF8DEB93301FEFAC781C5C09CAA3FAEB5475EEFEAF4935EE62915500B8B38C4CC01DFDD6444DAAFE16A4DAF7EA6ADD3E4B84BDEEFE38D81BF15130D3DFE35EFDC6B12008992BC8284AF3083CBF61E7C1653FA5BA07C53DF19DD46D48BB464DDAB76E317EF488154B9C17CD779A3B73C6A2F91FE3BE0C0BE0BEC069E1DCB973A74F9F0EB5FCF0E1C3070C18D0AB57AFEEDDBB4331DBBE7D7BB806B6113B76ECB87AF52A54BBEFDEBD239148500B83E9C01CD46AB05F2EE0702904A24EA112B0380559396F3C5E1DDF7710761706F6E80D22F77768B1A0EB905DB3965F5BBFD375EF99B7276FF89EBEF5FAF835FFB3B77D4EDD7C73E23A5C032DFCE8FA865D87576E98377AE2B8C1C30776EBD5A35DC75E8E9D87F5EE3F7DCC8485D367BF717D19E6F32E3B2185568E5770854699CAA2D49A555A3A8D2210F04070B4CB00B1DA6C168D46259188180C5A61613E0E17F5FAB5D7E5CB17BFFFFEDB2953268D1831AC45ABE6CD5A3405CA41F64E5D3AF6ECDDA34FBFDE90B94E739C16CC735EBC70D98AA510589F30693C400FB843217FF6EC598140007C59EDF38EFD4DC5FBFF05DC757A787910B954959D9675E5F48569A3C7B774A8DFB571CB79C3C75FDD7530F75DB8B68C68253024D9C594887865729E0897C20F8F13472408426319BEA1644F5F8AA76F4DE58ED5EC98EFB04E737F4770F3AF7AEE4B7E19C8F58D9687A568B0D3AEA28E7F329FC65D9594C7088EE54624D7E03EDCA1E5B886EDDE1EB800B8F383530DC96580BB222AD79682FF7DDCA3AA2BF71ADCD511F909171F3D59BFE7EE37BFB86F3F9CFDD05D9D928B94E28DA5655622D146A2E82BAB7415954622093EE1462AE593B8DB2BF7BA827F2180C8E77037D219B571D7321928EE4AD94776FF6EEAB28EA50E8BBF1BA8CAA15A478F2AD22A155C667642CCFDAB17776E5CBFF5FB75DB377C777CCF8E17F76FE724C642150F1B00FBE9FAEA3EC2BF207F0077ACD31CC31D5AC2D7C2DD46E23012B2621E7B03EEA7BED99EF7363AE545D08C3EA300F776AD9A8F1B351CC37DDEAC998B172CAC96FD53B8AF5EB966C58A1520F8FCF9F367CD9A3565CA940913268C1D3BB67EFDFAE07BB366CDDAB56BD7B367CF51A346CD993367E9D2A5AEAEAE1111110402019D26D78618747A2E9B83AFAC42F7CB2D56A35A2BE2F00A33B2DD1F3DDDF6E3CF0B264CEBE9D07474E30EF3BB0FFD79D2FC73DF6C7DBEFFECDB33B77CCEBABC397D135A58773B78FECA869D3B662F5F3170FC942EFD1D1D1AB769D8B44BAB76C3FB0C5832DB69FF2F3B1E5E77F179E149282C05D6A16057F2447A89C2245783EF7A9992CFE3A8540A4C76885C2EADAC2CCFC848BB7AF5F29E3DBB56AD5A316DDA94FEFDFBB668D1AC5E3D87060DEAB56AD3125887B2BD47AFEE509B83E0D3664C9D316B3AB4D3674E9B336FF602E7F910B866E4E81150B9C3EB001BBC5BB76E6147A5A2C766DAE782C734FBBACB7F36EEF007A0D69BA07607DF2D6644295124C5241CDEB167DAF0316DD1C191ADE70F1D7363D7A1929068139E6626D0E5D9C53C5C2A3D289AE41B4C7D1746F50B25BCF22F777B5DE9EAF55BDF3FE04E72F3C3BBFA01EE148F20BE7F0CE05E7DE4EA6F40AF093AC1E427715724E4D002719CF024C03DD6E5F9CF63670D736831BA5EEBBB3FECC47B8589C33335F14580BB323ACF9C58618C2FB3C45542D09349C6BC0F8E8006648F46714747CEA0B897E92201F722248D54FEE45DC0814B8FD6EFBCB9EAE7B7FBCFD0FCA290C22A556EA1A98A00B81B2AAAB4A5E52602DACDAA2310AC4C06F86E66B2C0F71AE2FF26DC95540AE06E16F21185F423BB7F377559C75287C5DF0DCA3A44A742F40006AF2C3BDDEBE9C33307F71EDBFDEB919DDBCE1F39E0FDEC5169569A5AC001D9614B50E7EEFF9A7C1A7732C98E3BF16FC5DD4A645784C6055C7F02B85FDB7CA82A2C2DE77594D3E0896D1B36C6705FBE78E11FC17DE9E2658B162D5AB060C1BC79F300F769D3A64D9E3C79D2A449A0F9D0A143FBF4E9D3B163C756AD5A356FDEBC65CB96AD5BB786DBFCF0C30F972E5D0A080828C8CB67D219328954A352CBC512A950A410A1D30582B94C02393E3CCAEBE1B3551367CDE93D6C78F38E90F9FD47ED5ABCEEE68EC3CF8F5F7A79E6BAEB0974C4FABEE5DF2F1B3E694C9B6E7D1D5A7471683CB44B2FA8DC97CF5B7870FBAE17F71F67C426728854D09C4DA0F0290C0993ABE28B31DCB1CADD6AEF7B512AE5341A252525C9DDDDEDD4A913DBB7FF02A0B76BD70634AF5FDFA161C3FACD9A35E9D2A5D3B061A8E6E3268C1D3F71DCE4A99366CE9E0105FBBCF973A105D9E122AC2F5EBA68E9F225F3173AC10D868F1C06B88F1933C6CDCD0D765640B0BFAFC31D96FF78DC4D3644AAD4084532B54A6F3298794C6E7450E8ED0B57668E1837A05DE76EF59ACCEC37F4FAAEFD054111B2C20A7D19B1F25D4491A76FBEAB77D92B7FA24F08E16D20C93B80F63610ABDF6B8A77AC7EAFC19DF8E21DC33B4C1C9400ACFF35DCE5F1D9D48068A8DC65497989F7DCB74C980B95FB288756C7E6AE06DCA5D1B9325C9E39AD521D53804D195683FB07DF31DC41F64FE29E4161BE8E49BBFEC27BE7A98B8BBEBBB16653FCD547ACD078496A8EA99C805098663CD95849B49268F079D655A1138958EDA9F11DCBDF84BB864137097836B9E423BB7F377559C75287C5DF0DB06E55C9A078C72EAAF86C62515E665C747A4C645C4800A4283D59CAA2618FAC1172B19BFD8B530B77BE89CB313299BFC5BDEEA4025F11770B8195F326F8E5C9EBE7D6EF78B8F71C3BA9B8343069C9A819807BDB96CD6AE3BE64A1F3B2458B3F87BBD35CB06D2E54E5A0F68C1933007728DEC17728E7A14E07F4E19A112346F4EAD50B946FDB161EBE51EBB66DFA0DE83FD769DEDEBD7B5FBD7A555652AA90C95532B990CBE330981281D0AC45473F6BE54AB018E7ED7F63DFF185232676AFD7BC9343A3511D7AAE9C386BDBD2757BD7FEB8D979D5E2D153463AF6E8E6D0AC8B4393412D3B8EEB39E0F2F1D30F6EB80478BFCD4D496711296A91D4A2D6213AA34D6BB06AF4A0396C399402B188C9E19069340289C5A41715150404F85FB870EEDB6FD74D9830AE478F6E6DDBB66ED5AA05C80E69DDBA65F7EE5D070D1A3075EAE4E5CB972E817FF4E2856037042BD241F6597366C2F590652B96AE58B51C709F3D771654EE7DFAF506DC67CE9C095B3260FDEF3B7C095BFE2FE02E516AD87C91402845CF82A2D00819F0B92DBB7EE2ECDA798B7A366DD5C9A1C1BCC123AEFCBA27EAA97BFEBBB052BFD06CF7D799CF3D0B3C7D2ADE0655BD09AAF2F2277ABD23BEF205DFA91EB57D7F032BE417FE24F700AA6730CF0FA7084FD5C56443C0F78F58C782CAFEB9CA9D1E14C38F4A55A515A53FF1FE75EAC251F5DB00EE3F0F9B06B82B620B44115928EE71859AD86214F7842A6B7C15128747136B4F0C114D34D1164DB6DAC7CF98A26A702F36C757F2FD53881E91C9579EDF59B7ED8CD39A175B0EE32EDF67842768F24B11120B21506D780AC2E02074B6094F46E82CF01D231E7CAF491DBEBF1C40E477715751290A0A594DA719F95CAB4CFC91DDBF9BBAAC63A9C3E2EF06CA76A8C7A166374885E823987450C2A35F9F6A953A315FC165C28FD0EB8D5AA8DC81FE3A77FFD7E453B8D350DC89E8B817147772CD7097BF88BBE533B89BAA1809CFBDEFEF3905B8BF3C7153964B224666AD9EE8D4A64123C07DECC86118EE4EB36701EECB172FF91CEE0B9C16CEB72F4E4E4E50BC03F4D8B278F1E265CB96AD5CB9129487D21EF49F3A75EAC489139B346B5AAF417D877A0E0D1A35ECD7AFDFEAD5ABAF5EBEF2F6F51B99480CB8F3D91CA8DF4D1A1D62B1A1319811A30D9F5570F7ECE595B3E60FEAD8BD73E396DD9BB71DD8A1DB90CE3D7BB5726C5FAF491B8786BD5B7798337AE2B675EBCFEE3B4C2DABE252E898E9A0B94EAA00C7613FC0205719156A085C23E7094176526945594191CBAD1B870F1F5CB162D9E0C1035BB66C8E0D7A8105941F356AC49831A3A64C9904193F7E2CB44E4E73E7CC9B0D94436005F3DD69C13C58C702953B5C032D94ED03070FE8D2AD73BD7AF5E09F1F1717077C198D46AC7EFF9B96FF78DC953AA3426B90AAB412855A2653A8146AF44F416FCA4F4E7F7CF5D6B2A9337B376FD3BB59CB5903876E5AB0E4E8F73FBD3E77F5D5890B7EE7AF273C7A51F236901818410B8A60064711A0907F8575BE57FB8EC61D2EFA533D0399AF43C541715A5C862921D7189F032BEF8BF48FF369DC554979CC9038514C863EBB3CC7CD77CFACA5631BB51F53BFCDB2AE432A5F85AA128BF9A1E980BB26BE48852B34259403EE76DFF190F7C41321361C1AC0DDFC5BDC55E105E2A00C657401DB2F21E0C0954B8BD75F5FB1F9F1CFFB735DDF7262D34CC5444B29C9564E414FC344E51A2BC8088D05BEBF279E616556A70EDF5F0E20F205DCD10967DEE3AEA2510D3C8E452AFAC8EEDFCD6F4CAF491D16FF484C72D8011700EED88019B48B065ABBF2585F3C760D54F770B33AF7FDD7C48EBB14114BAC7CA189C3FB2DEEE46ADCD1218C76DC49D0A29D6CB54DAF492DD06B07C5DD4245C735D983BE651628DBC92C7D153DFC81DB952D07CEACDFF1E6D2436D399B1A5FF0DDF4C5807B9B164D6BE30EA67F017708E0F5F102BE03F7CECECEA0FC92254BA08A5FBE7C39403F7CE4885EFDFAB6EFE0D8A255CB768EEDFBF4EB3B6EDC38A86D1F3F7CE4EFEB979F9D23E0700D1AAD596FD02A550A117AD23B8D504A2A2E0FF70D387DE0C8BCC9D3BBB66EDFCCA17EBBC6CDDB3769D1B37DA7196327EEFA79ABDBBD474911B8E2AC5C1471B5D6A233400C2A0D3ACB238BC3A6D2750A15442D95C3C5AA92B2A498383FEF37AE4F9E8E1E35A27FFFBE8E8EED9A3469D4A85183366D5AF5ECD91DA09F370FDD1B59B0C009AAF5458B16C20EC9A4491360CF64FACC6958F73AD4E680FBC2450B30CDE12294F070118AF7E52B97C19593A64C1C3662286C2756AD5A959595057CE974BABF69CA306CF98FC75D2853AA4C1633BC52669B4CAE148BA546AD0EB1226A8124352AF6C4CE3D53860CEFD6B869A7FA0DFBB6683DC2B1F3D066ADC7B6EEB074D0C8E36B7E7873FA72D223B7222F3F822F5ABF83EFEFBF5C457D47F3D297FE2A80EE15CCF1899085261AE2B2ADC905E6C4BC8F40AF9D4FE3AE4929403B49E2B28CB995051E01FBE7AE18DFA4C3D8066D9DDAF606DC35C9A59C9054A31D7700DA90586E4EFC2CEE561C113BAC0970D7BDC75D1A94A308CF47B219B67462C64DCFBB6B7FBDBC68E395E59B70571E55F9842B538BB5D965A6023C42644115AF2FC623540EEA7B35F10CF01D4B1DBEBF1C40E473B8DB2714ABC65D4E26FDE3B8A3F7D228B09E19F05D23E4CA390C0993AAE4B1601DAE01FAB1A0F46B1475EEFEAF495DDC196C3BEE94F7B883E318EEA8EF5F1DF7A0DB4FCEFFB41B70F7BFFECC441030928A7F98BDAC75FD86FF3FB803E5D802AC631DF1B3ED0B94F6E0FBAA35ABE72D5C3063CEEC4953268F1C3DAAFFC0011D3A75440F867270E8DBBBCFDAD56B5EBABA112BABF46A0DF82E110859347A595131708F0E63319981FE53C78E8F1B35BA55B3E6FD7AF51E3E78C8A2F90BCE9C38898B88E4C26EA87DCE03B01B226473253C01C80ED0A387C858A16C46FB796804526C44D4F58B97572D59D6A75B8F061F6679ACDFBA75CB5EBD7A4085BE70E1FC356B560D1B3664E4C8E160FAD2A58BA1AE872B01FA65CB96382F5E88810EED62607F09AC3901EB53A74F01F467CE9E01CA433B6EC2D8BEFDFB74E8E4080FBE6EDDBA828202E04BA3D1C8E5728CB2BF63F98FC75D6743CFCD06ADC18A18AD36B3A57A7260C46C85BD301E851AEEE37768CBD6294386766BD2ACAD8343170787C14D5B0F6CD8624287AEE07BECC3675501E1B4B098ECA7EEA9B71F93BCDED15F07E4B83C02DFD561F1958F5ED23CDF717CC224C1B1AAC86475540AB4104D746ACD44637582CD0BAFC6A151E2D21531904C594CA63A399F1F95A2CB28E145A79102635F1FBD34BD4D8F510EADD6F41B73FB871D8AF8425D6AB928220BC9A7A9638BE59179D553FEC65562A3DDEDC1434C9155E618A2358E6C892519A32B0D5115E8814E09785D74A939016F4B26C1BD24C1D9A58FDEF9EEBC74D1F9A733CE3FDCFC765BC8993BCCB064A49C89E05940BC2ABBC45A4141D01333B1C1770B89ACA9A8549494CA8B4BF444B29142B331D908978F707856064B4FA2A8AB08B54DAF0920622152AD44B48560538941E0474A3C414D26A33631E86A3A4DCB6418F95CB344881DADF3C75387BFFFDB417197C92C029196CE9213C9B24A821C8FD790C83A0A554F466769B68F61279A292474482B99044C7F0EF7CF840C1B7203116F2492E01D9715959AC93484CE931694F3328B6EEF3E7268D5C6E7C7AE24B907F2332B4B82930FFFB0BD5DA3268DEB3B0C1F3C00705F30778EB3D3BCB52B5755CBFE29DC972C5A5ACDF96F17CC7A201E5B16DA9705CE0B57AE5DB374F5CA058B174D9B3573C498D150C577ECDCA975DB368060DBB66D870D19BA7AE5AA07F7EE979594AAECE7C78068B55AF88C1B8D463E9F5F5454141D1DEDE7E7979F9F0F629694945454541008040A8542A7D3590C269BCE00DCE54231D4E9B04F0F81FA5DAF5443B5EEFFFAED8E2DBF8C1D3EB27DCBD64DEB376CD6A051F3C64DBA75EDDCA74F2FA01C0AF359B3663839CD05C421F3A11CB707BB0801DF214E0BE67D2E50B303F473E6CD5EB26CF1AC39337BF4EADEB47993A64D9BBAB9B959ADE82959B1E1ED66B3F9BF6656C83FB3D4C61DF5DD66437D47471659ECFDF116398F9F9F9AE67EFFFEA1EDDBD72F5BB666F6DC2563272E193D616C87AE439BB7FD61EAAC67474EA53C7F55F92EACD227187C87E29DE11B5AFAE425DDFB9D3C3496F2D287E11DC4F78F94872500D95A5C1A6637ACD431BD269FC35D99985B833B3928CEEFD4F5D98E7DC6D46FB3B2F7C86B6BB788A373A0784771CFA3AA628AE451F9FAF7B8D7F21D6F8EC11BA2EAE26E8CA9B2C4138DB11548320949A5589388EAC86286777CDA658FB73B2F5D5BF9CBE5159B1E6D3C147DF931FE4D9420264B9B596E2B21231554044F4748741B896621902008858630985A3C5147440F5682EADB4C63400BEBE03BA6799D80177F04770D83AE63310177A8DCFF87FB1782A89488540EB8EB186C399182E25E45D490A828EEF01654E34EFE803BE5C36BFEC782E26E84929F44D65656294ACAED675FE2CB8B2AC971E997B7ECDEB76CBDDB896B19DEE1923C525968EAA16F7FF9BB7187B27DA6D3DC39F39DA08487CC5D307FAED3BCD973E73469D2A465CB961D1D3B0C1D3C64D58A95972E5C0CF0F58B8B89A5D0A81C015FA581625E2F95CBC8745A4151614A463A9BCB61F3797CA1402895C8147205DC40A7D5EBF568AF3D5FA896CA217C26BBBCB03811171BE21FF0DDEAB5B3A74EEFDDB57B8B464D8075C7566D7A76EE0AE5FFAA95CBA13607C441F6E9D3A7CE98310D56E6CE855D8D3F873BB0BE74F91258C17087E2BD7BCF6E807BEBD6AD3D3D3D51BBDEE30E58C1E6CAEED9575EFE2FE00E5BBD6ADF119BDD770BF88EFECC6AD3A9943C06A3A2202F392A32E4F56B5F5757D72B372FEF3904C4F76ED86C5CC76EDB172E753F7E2ED3DD9B19199FEFFEA6D8CD9BFC3A90E0EE437CE1C37C1D4CF70AE4FA854A42701A5CB2213E1D82CD0F8C4E116CBFF8713E87BB2C2E0B70D7679672A35269A1896197EF2FEA317462930E4BBA0D39B5E47B4650923CA150189965CB25CB630A95B8C23AB8A3A9C6BDC2148B07CDCD710403AE521F5D8D3B5C694D20D912C928F43155CAB002965772C59350EF1D175CD6ED3CE7BCF1E69A5FBDF69C4BB8F99CE21FA3C92841CA2848250DA9A22255145B25112190112A0DE1700177A8D3951555105801E8A19007E56B9B5E13F0E273B82BAAF07570370978FFC3FDCBA9C69D2F01DC1524AABC8AA4C0933EE06ED719C59D4C8158C994BF80BB8D46371309705F239EA029AD44FBE598026551659E4FE8F1B53FED59F4ADD759979280047D191B1F9E71F09BAD5F177758AA75B7FB0EB843CDBE60E962E7E54B17AD58B664C5F2C5CB97392F5DB270C9E2DE7DFB74EEDA058A77D01088C74AF8C3870FE7151556514820B80E9DB2CBA6B79AD57A9D5CABAE20E02B48043C9944A051280C3A95CD6470D8203E54FA72B144C8E5559595478686DDBC7A6DD38F3F393BCDEFD6A97387B6EDDAB76ED3B563A72103064E1E3F61F6F4197366CCFCE1FB6FD7AE5DBD6CD912E01B4C8760C5FB5FC01D4C9F371FFDC61556A6CF9CD6B57B9726CD1A77EDDAD5C7C707B5EBFD50991AE5BFFAF29F8DBBC5CE3A863BEA3B62B3FB6E01DFD19F9ACC7A9D46AF5619D40AB54C2C623158043CABAC32393074FF869F06B7EBD0DDA1D1B49EFD0EADF9CEFF8A0B353CBEF0956FCE138F52F737C457FEA54F3C4B1E7BD05E058882A21411F1A0363A67645296312103D6B1F693F91CEE92980C21D4FB59659CC81456646AE23DF76F864E9ADAAA9B9363DFBD33979679868A703980BB259B288DCE57C61503EEA8EF1FE10E9A7F12775881E8A2CAB5916510588168224A0B1F04041EBA7567EDEECB8B374315FFF8E78341276EA5DFF79424E4A8328A2CC555482505C193912A92AD0A6FC6E30D248A064F949755488A4BA52565AA4A3C9862A13331CDEB04BCF802EE2A1209C35DCB64E8D92CB3906F9589FF87FB1782E22E9101EE7A264749A629F064881D77BA9E44C35EF0FF4FDC61130EB8DB28543391A42BC763B82B0A2BC2EF3EDFB570D5DEC5DFBDBBF69814956525084951D95FB17287A55AF75ABE03EE2BD6AC5EB666D592552B162E5B02653B14F293A74F9B3065F29C7973C74F9C306CD8B07EFDFAB56FDBAE49A3C6DDBA749D3C79B2CF3BFFC8B898BC92221A8725512934268311B19A11049487A09F7DFB452CA000954C292D2C8A0E8F7870E7EEB6CD5BA64D9ADCD9B143030787362D5A3AB669DBA34BD7E183874C9D3809649F3165EAC4F113B06130B367CF04B8A18487C03F69D1A2857F01F7454B9CB131338B972E9A3A7D4AA72E1D1B376D3468D0A0909010D0C96AB5A2C76DD9979A53327DDDE5FF02EE2ABBEF76E23FE06EB298617BA8D76B2D6663F5CC92668345A3424C560181ECE1726FF9B459FD5BB5EDDBB8C5B291E3AFFFB22BCFCBBFC23FB4C4C3B7E4A50FC32FA2F2856FE183171CBF7059582C94EDC0BA2D35177CFF02EB583E87BB283A4D129769C9AB82CA5D10975DE011B06DEAC2B91DFBCD68D96DE3A819690FBDD911E982A82C53265E1491839E92E93DEE98EF28F1EF7137C6E1CD0944537C0DEE044B3C591F5DA50E2F93071741D4A1A5FAC84A4B2C0949A2A9234B2B5D23A24F3D8612FEE1F7072E2DDD7461F18FD7566F8EB9F630C7F535ECAF68724B4076844041AA0896CA2A1B0D751C4C9795964360056AC6BF56B9D7C6DDC0615B44029B5CF23FDCBF900FB833782A325349A04034449A964CAB853BD54CA641FE62E50E7721E031DCB56555088581D0B892DC9217C72F6E9DBDF8D89A4DB14F5EB3128B10929882CB3DF1E3AEAF883BB6D4F67DE122E759F3E7CD58306FE642A759CEF3E72C4483F6CC2C98BF72F52AE7C58B20B001183B76ACA3A363B366CDDAB76FFFFD8F1BB6EDDC71E2CC69977B775F787AF80506844747C524C447C7C5E2E2E320B00E894D4C80C427263C7EFCF8C2B9F33F6DF871CAA4C9DDBB766BD9BC45E3868D20B0A9E8D3ABF78861C3A74F9DE6BC60E192458BA13A9F3563E6E8D123274C183763C634701C4C877F0FF665F09FC57D81F37CE7C50BB1219280FBA429133B74726CD4A4E1F8F1E371381CD805A0D78C83FCAF99F2F7CF2C1FE36EF7DD02BE6B8D0683C968B198ACB021B7996C5623E06E8FC52C91E727245F3F7E6AC9A429FD9AB51AE3D865CBEC85DEA72E914262E8A131155EEF849149EC80E8AA973ECAA86428DBB53129C03A863BF0AD8B4D85D406BD76BE80BB2229172922F171E9B294427250DC9145DF2CE9357C4263C7D57D47475D7D420F4906DC75E91582B02C5D72852EE113B843CDFE39DCCD7124C05D1654A80829D6869703EE261CC9164F4392E9D2E07CAA477CD1C340DCE9C74F361C3C377FFDD1D92BAFAEDAF47CFBC1A86BF74BDF0408E253347945D6F24A8440B45219460A5042D1124850C243FBB90E770878F1BBB8EB980CB4C39DCBB18A858842FA3FDCBF901ADC0D4CBE9AC25211A91014771256B9D3B197F7FF077730DD50556921914D04A2BAA4C24CA09809746E5AEEF5AD7BB7CC5A747DEBC13C9F487E5AB9A99207B85FDC76F8ABE30E4B8DEF80FBB439B3A6CE9B0DBECF59BC108AF7C52B972F5FBD6AE5DA35603AFC74E9F265ABD6AC5EB870E1A851A3BA74E9D2BA75EB16AD5AB6EFD4B167DF3E43478E183769E2F4D9B3E62F725EB262F9E8F1E3C64C185F2750FB4F9B366DF8D0611DDA3BDA8F2DADD7A655EB01FDFA8F1B3316AC9F316DBAD3DC79CB962C5DBB7ACD376BD7AD5AB112D68172201B1BF83877EE6C5887E27DE5CAE57F017708365A06709F30697C3BC7B60D1B3798356B56525212D805A5A75C2EC758B7A193DE7EFDE5FF08EE98EFB57197AB557AB3C9061B45C4A2D3AB546A9941AF462C4611936592A9546C5E5674ECB99DFBC674EDDDB37E93D9BD066E9FBBA8F04D2054B279CFBD3821B1A2F044B277802626CD8E3B54EE99D6946C5362862E3645834B8218E2D33E952FE1AE4E2D40CA68C2D84C4D563914EF17D66D5E3D70DCE87AAD1776191870DA851C100FB86BD3CAF9A199FA94CA3F82BB3EA65287ABC6DD9A40412BF7C0624D5805B06E882268C32B2150D1CB430B652105B2F002C69BC4B41B1E0107AF7BED3E7DC6F9BB4BAB36DCD9B8C37DFFB1904BD7B35CDDA9A1118294543D1ED51CEB67AFF94215FB8AF5E380177F1C779B44643FBD5C5DBEBF9C3AFCFDDF8E1D7785852F33B2041A2A5B4D62A888F4AF8BBB114FD055A0B350E82BAB1485A5FA0A82B68C488B4F3BF5EDA66D7397BA1EBD4C8ACE10A457A88BE8E4E89C5BFBCE7C2DDC97D8176C1DC31D1628CC9D163BCF5D521D589FBF04AAE5C5CE4B974C9A3675DAAC993367CF82CC9B37CFC9C909981E3972A4433D877A0DEA3768D4104BC3C68D9AB568DEAA4DEB2EDDBA42BA76EF56936E3DBA43D07365346DD6AC49D3D62D5B75EDDC05A09F397DC6A285CE50B063816A7DCEACD9736703E6B3617D196C60163B83DDE03B04C37DC58A657F01F7F90B9DB0F1EF8B96388F9B30B64DBBD6803B6CA8D2D2D2C02EAD562B9148B00E99FFE1FE8905FD42D50EBABDCF1DED93C1BA652042A9042A770C7785422612F3346A2562B3941414AA2432C48C88E9CC97771FCC183AB2BD43BD21ADDA8F6BD705F7D0151F1C1DE3F2B0EA4D103B38A6C2D35F141E2F0B8FD3C4A4181333B13E19A8E25551891070DC18F78968EDB8BFF73DDDEEBBBDCF3D3A5D9F5E8C54D0257159869C0A454AC1ADF5DBBF1F367198438B59ED7BBF3D7E85E01FCB8BCED2A4967143330CA9559AC4B21ADFAB71B777BB03EE75FADC4DB82A6B1CD1164F518796CA030B751115B618C0BD4A1D542C0B2810BFCB13BECB558617232954733251149C4DF6C2113CC3EF7DBFFBFA9A2D67177F7B7CC1AA0B2BBE7BB27D5FD4E5DB592FBC95A555EA2A9289CA44581C84CD3733597A2A0D1B8D87053B4173CD699A01178C754C190C7DB85E5655A5209334F641905A36B37A903B7A4E54B955032D7A3AECDF6D6BD4FB3B03CFF2F7A5CE73FD26E8C0C73A512A6D622954EE28EE34A686CC5493689FC59D44B350D06BB0ADEC1F8C168F575554E860B7AC022F29285595E1E54595C4A8E4C32B7FD8317FD59B0B77B9C945C2B40A452E991C99FDF0F025C786CD9AD477183168D0F2C58B00F705F3E7AD5EB9AADA667459F221CECBA0C5F8FE78A98D3B2CD89D01F739F39D66CD9F0799E93417326BDEDCD94EF3E04AA8CA274E9D3276FCB8A1C3874D9E3C79E5CA95DF7FFF3DB4BDFAF4EED9BB1738DECEB13DB00E9B1E48D3E6CDD001EAF6B35763810D0096162D5A383A3AF6EBD377F4E8D140F9ECD976C741F2193367CC9801D0C3350B9CE6C3EFB672F98A55AB56CD9C391D3B5869D1A28558150FF5FBAC5933FE02EED0D6E03E76FC98D66D5B3568541F9E28232303EC52ABD542A1D06834C2FAFFBA653EBD80EF50BF6381F5DAF9ED52FDF2A127DA36E86D162BDC42CCE587BCF5F969F9AA7EADD1CEF7EFA7CE723F793ECBC3A7CC379410102E884DB5E6956B1232B5F61812B220C6F82C5342B63921DB1897698ECDB4C4A0B1E1AA03EBA698DF1CD3A48B43A389CBB2A415D17CC2849149B69C4AC63B9C2C2E8B1E805BDE6BC8508766D31D7B9C5BB7B1E25DB4B594264B29A48724F32333950945AAF8126D5C892EAEDC600F36C33B36DBCCC7D18797D6C41056DD6AA1C5E1B531F6C456DA536E4F59C9D3E0F49B9E21475DDC361FB9B3EED7AB2B7FBEB172D395755B5C8F9E0F7BEC9A15104A484A65E7145233B259B90566169759902F282F53D2483A8EFDFCD75422B7BC985198CB2BC8171514484A8A5555957A2AC5C8A41B1834358DACA0121534929A49D570197A11C724E59B15222B7AEE5074367380EC8FB4EFA3FC3BA3FAFB82F96E3FF1F78720F6D8946244F151E452442647A4724422B389C456BEC8CCE5C38B6F667260730B3153D0583E848E7ED74D43A7F98498E934138DAA2311D1F7824834904826127ABC928D4647E80C84816EB04D0C363CA089C95154115595242B9D4F4FC97975FED6C1E53F9CDFF06BC0D5C7E4F0345536495F406746E7463D7ADDA795635307871E8E9DE6CF9AB364D1E2B973EDFE4261BB74514DA0DCB667C902A8C417006A7F2AF3E62EFC901A1CA1EC9DEB3407889C377FEE8C59D3C1C7652B964E9B3175C4A8E1DD7B76EBD8B943FF81FD40CC0993C68F9F380E5AB87EF8C861C3460C859591A347C04ADFFE7DBA76EFD2BE433B10166AF0A9D3A7A0523BCD993C79223C38308D3ECB47EDD7CAF295CBB0039A56AC5A0E2BBDFAF404D9DB39B63D7FFEBC4EA733994C203BF80EC5BBC160F8DF38F7AFB080F86ABD410D9B4BAB057685A462494274CC893DFB164E9ADACEC1617A9F81277ED818ECF2A0D43F8C1E9DC4894D01DF9549D99A0434BA841C882121C794906B8ECF35C6669B63B32D31D9365C36125D1D5807DC0D9FF21D7067FB4749229391EC326E508C2A2E931312BB69D4E4210E4DC7B7EE7468C9DA5CAF77FA42A22CAD9815912E88C9B1E35EA401DCE34B6BE15E018E57CF23F6DB98224A3F8E31B2548FC9FE91EFFC804C9A7742F1A3C0F8F3CFFDF75D71DD78E4DEBA5D57566FD93A73C9EEE5DF1CFC76C3F95F76BA9DBF12F2D4AD20225A4E24ABA81403878DC844885A669509654C32AD34179F95ACA351504D08780D8908B25B055C442C40A442D05FCE202BD8540D9FA915718C32815925B6A851DC31DDFE68546809FC37B64A8D4DA5F9DB5A15EC8200EE586AFBFE1BDCE5B52211236209C86E11084176231B85D8C8601B6828EE35BE63C49BA97444C047B81C2B9B0541386C1B8B89F98EF078088703A683EF9A8A4A79718934BF40905740CBCCE19494294854F4DBDA2AAA0A4F2B08C4DDD87178E3B485A7BEDD12E9F2821E9D25CFC0ABB3488C886CDC23AF7EAD3A3575A8D7B37D35EE73E6A1F5F50C67A7B9CB16CD791F588760CACFAD6BF7EFA62E8B583E87FBA42913070F1D04B28F9B30768E7DF216AC5DBA7C097680E892658B611DFB3273F2D449E03BDC00EB21812BE191E141E066B59FEBEF08FC3258F18E1DCA04BF46FD86F51C3BB67FF4E811680E8B42A10087A45229B470B15AA8AFBAFCD7E1AE375BB466B3C16286D25DABD6541697FAB8BFBC7CE4780787FA7D9BB65C3064C4C5CDDBD35EBEE12767F393322821D180BB2A118D36B11A7763622E3AC3CC7BDC31DF31E2BF80BB39B55018120FB8DBB24A856109EAF82C5154F2D9A5EBA0721FD6A8D5CF93E7E0EE3D976796CAD34BF83139B2A4A23F8BBB35BAE2E35870159FC35D155DA2882C1287E430DE24963C0948BCF43CF0E0F597BB4E1F59B161EB82E5CEC3464FE9D96FE998895B162FBFB863F7EB3BF7C859991C28CF6954F47B5199C820E480DD427CB985C382825D89AF9257562889782D836AE4308D3C1694ED0A2645C9A169052C9D986B920B01F73A35EC1F0BD6F3FEB7B52A8D153D33F5DFD4A2B85BB4522CB595879D18A426CA0F8197D7221298857C239F0B5B531D8BA963A2F3AF41D0F39FD0EC533BD803B243CBCECDE114E4094B8B15842A2D99049B58797999A0201F94B730D0F906A08407DC95A565B2A2627161B1AC92A0A13111B11C11C98C34AEB8049FE0EE7BE2FBADF3FB8C38B66663F2531F5E62A128B94C925A410BCB04DC07B4E9D2CCA17E8F761D9D66CE5EECBC08C37D3A54D9FF10EE53A64DC62A74C07AF1D24510201B7E3A73F60CB8066E00378675A8D3C78C1B3D64D8E07E03FAD6DC006EBC70D102588187AAF3747F47E0F787C093C23342CD5EAF8103EC7344444498CDE8E942B10E19C01D2EFEAFCFFD2B2CF0121AAD369DC5A233192D36ABD968920944550585E991B83923470F6CD3BE6783C64B478C7D79EA02059724CB2EE0C5A72992B2C177883A2907F35D9F980BBE1BE2B2EBF8FE65DC0D49798AE83469548A39BD48169D0AB82BE2335FED3B3EA671DBFE0E8D97F61FE17DEA32272E4B91512A492C54A696FE59DC3F19B4BBE633B84B42F3E411856A5C8926A6541691CBF14F267A44163E7FF7FAECADCBDBF62E1B3D61409396BDEB37E9DDB0D9E096EDA6F6E97F63FFA1C7E7CF053C7D9219164ACBCF56D2C936890051C9D073E991498AAA4A6965B9ACAA4282AF105695F12A4AE0064A1655C5A56B846CBD8487F6C9006A5AD96FE1FEDDC8C15F8BE64F046EFF278342FCA762F9E3AD4665D1CA4D3A5476ACAD511E7662C0772CB595378951D94D029E81C7D1B3595A26434DA7A969542D03F5BD86F89A88CB4BE165D75048B09545785C0B8BA92512A4A52550BCEBC92474780C958AF6C93059088B8D707826065B4D4247D0B3730AF34371316EDEF7F69FFA618AD3A8E69D8EAFDE58F826529C56C68D2BE4271403EEB14F5E0F6AD7ADB943FDEE6D3BCC9B31EB03EEF3E7FE53B88F1A33720014EE830740550EB78160953BA80DEBD81DE15E705FD80C80EF43870FC18A7A10168A7A789CD973672D5FB9ACF673FD1DA9992A127EB1899327346BD1B441A3FAB0B1A9A8A80088542A152612E0FE3775B8C3F25F87BBC1568DBBD9DE336335C2874E2667736F9E3CB56AC6ACAE0E0D7A376ABADD7959F4D317FC8C1C7D49A534251B7C87A892732040BC2E29177CD7C7677FEC3BB49FC35D1D9B091B0669548A21255F9390AD8ACB84874ABDF77C4EA73E80FB74C71E77B7EF27852640E52E4B2EFE8AB81B7078F0FD7D2AED298728C20AD491C5BA18ECC14B7531C5EAA80271744EB2ABCFEB2BB7F7AEF87666EFC1235A77EA59BF89A383435787FA633A7505E2574C9AB4FBDB6FEE9F3E15EDED55999624282F31B3D91616DBC2E1207C3E22145A057CF0484E25AB1834159BA1E1B1B5221E7A162415C8AE4074502FCBFF78D0B257A33469FF446A43FF876287F84FC5A4F9C3AD5605BF9251273769E5588B05C487D87B6CD0D4FC7B1195DC24E619455CD831D2F1593A0E43C3A2A999E87968354CF01D8D9EFE9B20128999C705FD65448282405091A07827AB8924442C45042284CD355268EA4ABCB4B8549057C0CDCE8D7AE1E179E5E6ED83C78EFFB879D3BC25DF4E9E3D7FC0E8C18DDB0D6DD4EEC2FA5FC9E169F2AC2A6674AE20B18483CB4F74F51DE2D8A38543836E6D1CE74C9BB1D479117A0A8E79D5B8D7A476CFFBDF8D3BD699DE7F603F10136E007A82DAE035DC0CD661055AB81EEE327EE238A8F121803BDC1DAE01E231DCFF05953B263BACC03F013648207BD3E64DE0F79748240051CD6490D8C5FF7DA1FA1516C01D64575BCC5AB311ED9981D7D46A434C66C4602C4D4FBF77E6DCCCC143BB38D49FD8BDD7D94DBFA4BFF691E6158953B2C1775972B63C254769F75D939C0BBE6BE3B33FF6FD0BB84BC293CCA98592C86428FFF5C97950BCAB12B3C9FEE1DF8E9834AC51AB314DDB9DFBF6E7129F70595AB134A9E82F74CB6027E4AB136B4CE5E770B72412CC097878582D14EFD185203BB4F29842566C76EEBBF04747CEFC3873C1BCFEC3C73A761FDEDA715CE71E5D1D1C3A3B38F4A8DF6858DB7673870EDDB468D1B9EDBFDC3F718C5750C82F2E96545468E834442444940A44A346342A905DC561AA051CF4C4D30AB1452D43CF76ADFF73E72605F80047BD0E7CFC432DE44FFBFE91DD5F0890FDA762D4AAECBF152A7B4D30DFAD3A050436783541ECE78A32CB0416A9008807DF0D3CD4772D9B0EC403EE35C194C702AFB98A4A6116E413D2D3685959A2B23228E7111E1FE1094C54BAB0A0A83C3A26FEA5E7DBEB371F1F3B716BF7811F67CF9F3370D8B88EDD06376FD3DDA1614F87C6FDEBB7EAE1D07052DB9EF7771DE7251602EEB4882C691A943515E99E41C33BF4C2709F3D757A0DEE33E6CD01CD3F89FB4776FF6EEAB288E573B843313E78E820AC5B067E0AB7C46E3675FA9449532682F8D042C64D180B65729F7EBDE19650B043F90CF7C52A776017566A3FD7DF11F8B5E19FE06C9F33127E0787FA0EED1CDBAE5CBD02EB5EAFC15D2C1643FBBFB965BEC202B8AB8D4695D904B8EBD1D3D29AD0092A4C26F0DD249365E27087376F1ED9B55BD7068DE60E19EEB2EF40FA5B5F615AB628351B8897A4E6C852738078554AAE3A2517AAEF3ABE6301D93F893B3700674D2F16472441CD6E4A2B148527CAE332A4F119BBE72E1DD7AAE3F0062D8F2CFB26EF55A024A5509C50F017BE50B544957F1C7374B9311A0FBEBF0F585F6988298718632BF4B8326D54B126B2481359A08D2AD4E38A55F125AA5C3C3E3AF5E9D10BABC74C9FE0D8637C871ECE4346FDE2BCCC69C0B0A93DFA8C68E3D8BF71F37E8D9A0C6BD56662976EB3FAF67F7CEAECC393679E9EBDE07DFB6E828F1F3E3D434EA6584422359BADE6723442BE5E22322964C028A2D72006ED47BD225F0ADC0B70D4E951BBFF480BC1EAF73F918F44FEDD18B57F3C28EEF05B611B1E2CD8F3DA746AC8C7F31BDB94629B5C649509CD123E94F07A015BCF6542D0FAFD7D6A436FE1F30C749692401697550A8A4A397985B48C6C6272DABB3B0FBCAEDC7878F8C4B99F7FD9B168F9DAF153E60F183AAD7B9FD16D3BF57468D4A75E9321CDDAF46FD87260C356239B751CD2B0EDE2FE63BCCFDC04D925E9E5D4F04C4D2E45974FCB79133EB2539FD60E0DBBB56E3F77CAF4250B9D01F73950B9CF9D8D81FEAFC71DABC7478E1E51833BDC00005DBD7615D0B97CE5B215AB9643A048870A7DF2D449B0250061E196705F28E18175C01D7E5AFBB9FE8EC093C273C1EF0C2BB09971A8E7D0B57B972DBF6CC606B663B803F442A11056442211CAD3D75EFEEB7057E8E0E36504DC51DF8D06BD5E6FD6EBAC7A3D6231B3F178B7DB2EF3274C68E3E0D0AD71930D0B17B85DB8C8C9C8E6A767A3C4A7E760BE2B5273C177A8BBEBF88E11FF39DC99BE11B68C12305D199B614E2FE287C44963D274198527567C3FB5438F61F55BEC775E95E5EE274ACA17C6E571A3B0A1907F02F73AE364B018234B3F873BDF374DE89F210DCA5647141A624A6C4955481A09C9A2A872AACAC3135D761D9DD777C488169D160C18797AFDD6B0FBCF8EAEDBF0EBC2E5ABC74E9ADAB5D7E0262D7B39D4EB0EAF9283C3B43EFD2774EF35BE676FD8F9FC75EDBA27972FA70407E3B3B3551CB69267C75D2A362A6556AD0AC5DDA8ABC3F797F31770AFD1F38FE623BB7F37A0F61F6E5598EFB59F11DB63F888752C4A74E8A75282C8C5E0BB55CC370BB9463E1B521BF79A00EEA2D20A59055E8927894ACACB62E203EF3DBAB0F5D7AD0B97CCECD51F289FD4B9C798B61D87356FD3BF41D3BE0E0D7B38D41BD0A0797787FA235B3ACEEB3B64668F8193DAF718DBAAEBA0FAADBF1B3B2BE8FA63751E499C564609CB3016312DA59C02BFE8519DFB62B8CF993CAD06F719736683E31FE3FED786427E325FAEDC814B28CF8169F811046E83ADC30D007D08FC74C4A8E10306F51F346420D61D0F57C22380EFFF1ADCE189601B03DB1B782EF88501F7DE7D7BEDDDBF070A4A8048A954DA6C36680502015CE47038769FBEF2F25F87BB1E3DEE095AAB11B19A6C568BCD6AB39A417613E86335EB24A2E0D75E6BE6CDEBD2B469CF16CDA60D1C10EFF12AC72F801A97C4CFC861C625570545D023E335D945F2C42C45227A2E0E8DDD6E401C631D531EB8AF09E80F819BBD3F774775940959F020AF8E5DF861C28CFE0E0DA73BF678B2FB382B3A5D9B55C58B869F7E9D3E774B2CC91C5713029AF8AA5AA9B4A71C8B3EB19C139B27CB2384B8B82E1B32A1BF438BA91D7B5FDAB8031F9198E0FA2AE4F6A31727CE5FDEB47D97F3F2D5A3264CEFD26B788BB680FBC036ED3AD76BD0A57EC32E0D1B75A85FBF73A346BD5AB7DEBF79D3D55327025E799466674AB92CB44A8597DC66C288474C7AA8E24D2AB942C0E5D3290C42A55E2E81181452884E26D648842A111F7E8A580D880DDE2B8341AFD2AAA46A95D4A457D9AC06A54C2897095572915221D6282570BD4E2DD36BE42AA910A296893472B15621D129A57A95CCA046BB7720669D0A62D1AB6B62D66A3F19C46884D80C06086CFB6B22170A9562B15622D5291466157A77446F805B5A35E8BDA005D32D6A8D51AD869F1AD12F0CD06E77D01C366F5830C72D4A39C40CFB3432A9592A3149C446B1C82416200A994D22B08A78E8F7D54A29A29058845C2D8B661270C07A442A04E8651402BBB4909A9F4DC9CD7C72E6FCF55DFBF6AE5AB772DCA429DD7B0F6BD1B67FC3667DEB37E957BFC98086CD86366B3DAA45BBB1AD3BA069E938A695E3A9EF369EFBE997CB9B7EBDFECBEE13EB362EEA37B29F43B3810E2DCFACDDCC89CFD51552A9911950B3CBD2AB88C1A9BA32C6A25153DB3934EED2ACB5D39419CB162E5AEC8C9E7F63CA8CE9B317386113C2CC5EB460DEA28598EC0B972CFEC8EEDF4D5D166B02A537569BCF9C3D03EA5F08D6D9025E8F1E3B0AFBAE123600B0023F02FDE1C6D002A970FDC4C913E036D82878A01F6E00A6C3E3C00DB011E8B59FE8EF083C1D3C0B04B62B58B70C6C6C5EBC74AB96E85FB2FCF7E25EE3BBD56A06DF350A2962360037394909A70FEC9B3E6654FF8EED073AB63BBB6DDB9313A7E25F7A92E393B86959CCC454614A96A1B0429A84D20C40D7F1FDCFE21E72F5DEF6B98B073B349DD0B2E395F5DBCB7D23956965D2C4C27F0A775E5CBE3C9F1876E7C58A615350DC1DFB5CDCB0A332242ECBC33FD5D53BEEE18BC8DB4F42AEDFF3BB70C3F3F8F9A7874FAE9B3673E1987173868D983362E4D4C1838775E9D2A76DDB7E1D1C47F5EF3B75F4C865F3E66CFEE1DBE3FBF7DCBE7ED9CBFD79B0FF5B5259311D5FC1A391E57C0E208ED6B07AB4BB066DF51AD806007FF02E00F498EF2035180D3A83D118D62032BC7518CD5683C666D442D0B3E541CC7AB35A01C130AD7E64D8961875B0F7000F8B05BB0D16E0F893B16975106CBD76B7BB054057AA202685D22857186472BD5406B162C36354EA3A312950C16B62955747CBE542743C9E81C733F2F910335F00D1D0692A2A494D434794225209027F9612B159C0E19696D00B728AE262C35FB93F387FF6C8968D9B572E879DCBD513A62C1A3A0A76A7C0F1DEF6DABC8F4383FE0E8D073A3419D1A4F5B48E3D960C1CB161FCF41D73161D58B4EAE8F26F1EEF3FFEFCE89967874EC1CAF91F7E593668ECB086EDC6B6E8F278F749516A3154EEE4F0344D2E05702785A4290A488B474F03DC3B376D3577D2B4A50B9C01F7254B964C9D39A30EEE4E8B9DBF3AEEA0761DDCC78E1FF3BBB863E7B403DC478D1909B2FF53B863CF05BF216CA2060E1E50AF8103FCF25EAF5F554BF42F59FE873B14EF66F05DAE101BA08E33A8F92C5A4C68D0B17DBBA78C1ED6A969A3D9C387FDECECFCF4CCD9C2D0707E6E3E2F2B979B9A294ECB91246781EF50BC83D118EE98EF7F16F7EC97BEA7BFDD38AEB9E3B0FA2D76CE5E1A73DB55109BABCBAAFA8AB8D70A014D5C55AD54A2892FC702B8F3E38A54F9D4A87B1EAB874F1BE8D07A6ADB5E17BEDB561E109DF2D43BF19167FC831790A4472F131FBAC7DE7D1E76FBF19353E76F9F3875E3C8B18B7BF7FFB27AED8CA1C37BB56ED3A171E3960E0E2DEBD743D3B07EC7562D06F7EB3D6FE6B46F56AFB87DFDCAC33BB73CDD9E8505FA67A52691ABCA25A0BC526633EA20E8CC6E16637560DD64D0880446B914EBA5312964B06E5129101D48FA9B0E9C9A28F95C9580A716F2E18E5AB11076C5F452B14126813BC2DDB198A1647E9F3A16D7C406BE83ECBF25DBAA546BB8022D4FA8E38BF402B1412831896566891C8228D4BF89123D88098D5C811E718A1D742A96DA4412AB508C862FC282F0C58840628F14114A10AEC0CAE6A087A432984A02999E9D9D15141AFED27DC79A755B962FFB66F65CF8831CDAB153D7460DDB3B3874404F2BD66A70C316031D9A0EAAD76C44933693DB779BDF63E0B20123F72F58796CD9B717BFDB7C6FDBFE9787CEF89EB9167CF94ED8F50701976F075EBFE77BFE86DBA1D367D6FDBCA8CFF0518D1C6776E887BBEBAEC8AE946556124353E459040835324B9859BE7CFC2CC7FA4D3B35693967C294A5F316A0F3C92C5D3A6DD6CC59F3815E27741247E7054ECE0BE72F72C62671FCC8EEDF4D5D166B52077780F20BB843B02F3097AD806DD07CA8D90177A8F4FF29DCB1AE24786AD8CCF4ECDDA341A3FAD3674E0B0C0EA896E85FB2FCD7E18ECD45A3432CD8FC6210A3CD64B69AD45A855A23473B6D0D6A01971112E8BBF9C76F87F4EED6AF6DEB9943871CDDF473B487072D359D999E498C8EAB0C8B12256781EFB53B6730E241F33F853B233AE5C981134EDD070C7468BC62C018D7BDA74801F1E67CF257C11D628BF913B81B12CB45F1C5DA2246DCE3D7DF8C9E35D8A1F5A4563DCFACD954FC36A2C03B34F7E5BB4C579F8CA75E698F3D93EEBAC5DC780CBB1DA93E01F1BEFEB16F7D7D1F3F3DBD63D7DCB1E3BAB76AD5BA7EFD815DBB0EECDEAD4F974E1DDAB46CD1B841F346F51DDBB4ECD9B5D3B891C326C12773FA94954B9C7FF9F9C7D3C70EDF77B9F1E2E9A382EC8C92FC1C7C5931934214F3D81AB904ED2833E8F4E87463A0B90E31E811950AEDC4108BCD528951283488840681402F1460AD9ECFD709F8E88D554A44AD4207ED6835880EF609D0FB9A24622C705F2CF050109B5CF5E558654A2C16A9026213CB218818C85622521522572372405C6BE6894D7C31D65AF812B34062154821885C85C894E841434229EA38476865F12D4C1EC297203CF422C2E4DBE85C0B956D26318D24063E260952854B2C0E8DC6B979DE3F7CE2E7F98B670F400771757168D0D5A161278706909E4D9A0F69DF7162B7DE4B878C5E3564EC37C3276E9C306BF7DCA5A7576F70D9B4EBF1CEC34F771C76DD7DECE5FE53AF0E9D7D73E402E4F5E1F35E87CFC15B167AE3C1DBB3D7EE6EDFBF73EEB2A9ED7A8C68D0CEB9D788CAC038C09D9F54440A4B15A75528B289DC84225E5AC9EAC9F33A3568D6A9518B59E3262D993B1F705FB66CD9AC39B3673BA113C260BEFF1DB8D7F4B9C33AA00C8E43B0E3923E893BAC83A4D02EB59FFF084C1F316A386C0CFE41DC972C5B0CBFDBB011431D3BB66FDCB4115C4C4C4EA896E85FB2FC97E2AE452C90F7BE9BC07713625469E40AB5C462D5DBAC0612B1E2E9A3DB1B7F58DBB149C301EDDB2E9F3AC5E5F8B1143FBFAAD8783C2E0E1F19234CC902DF6B8A77CCF7BF80BB2AA72CE8C6FDF5E3A643E53EBD5DCF33AB7ECA71F537E410BE22EE1F124BB007ADE8DFA7124D5C3916C05D92586A2EE3A43CF3DF306EFE508736139A753BB1ECA73C8FA07CCFE03C77FF1C37DF5C57DF3C37BFFCE7BED94FBCA0848F71F30E7FE91DE4E6E17AEDD69E1F7E9A366CE4808E5D0674E9F6CBF7EB776FDE72E0D71DBF6CDCB8DCD979FCE8517D7BF6E8D6A96363078746F634AD5FBF4DB366DD3A7418D0ABD7F081037FFEE187ED9B361DDEBBF7F2D9B34FEFDFF7F5F28A0C0E4E8A8CA8CAC8601515AB2834138F6FE50BD1BE0B2EDA8381C814D5D3B060AD5406A531B43A0E47C3E1603D1EC03DB80F9B019348846E12ECB1482458AC522904C5F78BB1C99410AB540141240A44204378122B4B6864F0746496924093579025E544B8C6C206B885568EC8C616612D04618B11A6D046E79BC86C3D81A1ADA0AA4A49CA12222339871E9F49C6A5E2C3124A03A2F3DF86E67A05667ABE7B72F0F4D343679E1E3DF7F8F099ABBFECDD367FF9CC5E83FA356831A869DBC12D1D87B5E934BC7D97511DBB4FEE3560FEF0B1ABC74FBFFEF3AE5B1B773FD87AE0F9AEE3DE472E065FB8137BF359F2BD974FB71E7ABEEDC8CB1D275EED3EEDBDF72C9A3D673CF79C0EBEE002BE7B1DBF7875C3B69FC6CF9ED0BCD394D63DB64C5928482A10A514B16273695199FCA412A8DCA5195580FBB7339CBB346AD1A141B3E9A3C72F9A3D0F705FB16CF99C791F66F89ABB60FEFC850B16382F7476765EB4E8ABE10EAC03DC8035AC63B8C3355FC01DBB3DB46028680E35FBF091C3E0F6FF14EEF0742B562D9F3D7756EFBEBD5AB46ADEB2758B0D3FAD2F2D2FA996E85FB2FC9776CBE8102BE47DE78C196241CC6A834AAE121BCC1A04312994E2ACECE4375E6E837B74E9D1AAF9808EEDBF9D3FEFF1F973A9BE7EA484244166AE20B51A77AC78C77CFF0BB89B4A48A9EE6F8E2CFB664ADBAEE39A76D8367561E4D5275FABCF1DF2A7703725944B93CA6C95FC4CF7E08D139D01F7714DBA1C76FE3EE3B97F895758B16748E1CB80528FA0F25721159E21A52FDFE5BCF40D7BF4E2F5DD470FCF5F3EF4F356A7F193FA3B761ADAADE7AC71137041C1A931B1F969E919494941FE7E776FDD3CBC7FDFB6CD9BC60C1B0694F7EFD9B3ABA363DBE6CD9B376C08DC3774706852AF5ECBC68D3BB56D0BD68F1F3972EEF4E9B049F876D9D2DB274E79DF7089F77A538A8BA3A667B1730BF88525A292724420FE4484122317EDC5862D814920B00A4556B17DAA168904D55F86EA8FC8EDDB038502ED3081166A7020FBE356A1857ABCBA85DA5CA141646A44AA46B852341C09C21281DA084300705B693CF41A2CA03916B8014BC449C963257D70BC2C1057EA1F59EC1BFEF6EC8DD7A7AFBD3A76E9C5C1B34F771D7FB0EDD09DCDFB6E6DDA736FFB11976D876E6E3D70F5E73DA7D66DDE3A7BE9C27EA346B7EEEAD47FD4921193BE993CF7A7794B7F5DF6CDE1EF375FDCBEFFEEBE935EC72FFB1CBBE27BFC6AE0C91B21675C222EDC8BBEF820E6F2A3B7FBCFFB1DBA1478EC5AC42997A83377A2CFDE8536E2EC9DA0B33743AFDEF33E71E9F20F5BD78F9901F5C4EAC1136FFEBC579651468F4A67C6E440F1CE8E2B10A596AB72C980FB86B9CBBA3569E558BFE994116316CE9C03B8AF5CBE622EB06EC71D521B77583EB2FB775397452CC0345689C33AA00C172160FAE770874A1F56E0C68B972E822B81752899E166FF14EEF03BACFB762DE0DEA55BE7464D1A76E8E4B877FF1E2EFF6F1915F3B9E57FB843CC102362D498352ABD4267D6581003102F10B328948A3D5B37CE1937BA67EB16A37A74FB65E58A17972F67F90750135378695950BCD7F4CCD414EF7F16777329B9C83FECD696DD8BFB0E1BDBC4F1DB6193BD0F5FA68724FF53B8CB532A902A51AE47D896C94B863BB41FDBB0CB21A76FD21EBDE54567B123D299C189CCC00446403CDD3F96F426BCC43B28C5FB9DDFA3E7D70E1FFF61E192E1DD7BF569EB387FE29403BF6C173198520E57CEE30BD96C1A8958565498939D99919EFAF4E18307776E5FBB74F1F8E14360FDDA952BE6CF993D7DF2A4B62D5BB469D1BC75F36658601DAEE9D8A2F9AA6933772E5B7575C71EF7F397FD6FDF0F7EF024E4E1D3D047CF8AC2A220C5E1D19092085C69640CA4382AC6C44165B7F0041681D02610D94462442401DF3534869ACE8056C3606AE94C2D93A563B0A03530F97A16FFCBADFEFFB1F717606DA4EDFBF89D0AC5DD5DDA52A0485B5A8A6B819696EAD6DDDDDDA93BC5DDDD5D02047787901034C1DDDD79AF6158B64BDBDDA7CFBB4FF7FB3F7EBD8FF398BD13C24268F2C93993C90C94F4DAA6214AE308A511289FAE6E9EAE6A9A97EA98D42A6C0A085E1195541E99480A8F879486E1A23FDB457EB2097D67E1FFC2D8FBF13BB0D8E9C653876B8FDF1C3CF7FAC0D9B707CEBED97FE6EDBE336FF69E7EBDE7D4ABBDA79C6FBF70B9FBC6FDC17BD77B6F4DCFDDBBACBF4747507AF902E68B9BF6DEDD7BEADDF93BB60FDF78BDB508B3708977F6CFF40AF5BEFFDAEFEE6BFF7B6F02EEBEF1BFF3DAF7D64BDF9B2F8075DF6BCFFC6FBC08BAFD3AF4CE5B48F0ADD781375EFA5D7FEE75E779C0B30F2EB79F3EFDEDC8DE958A9A1CA2A79437FA3CF9D89152440A8C6B88CBEDCD2AA3446581EF807B4352C1910DDB046899D916502B4ACAEA2AAB6FD1DBB87DEB36ED0D20E91FE51D8CFEC77107B8E77057555701D9816FD95532DFC31D6E0692C212E0866B0077C99512E87BAAFF0AEEF00BEF3FB80F7E3D764EB6858B17F009F03E7AF27070F87F72F4C7EF8DFFE7701F9DF1FDF7CE8E0669EE83634343E3832393C363134846C787462706C7C706234302AE9D39252924C0CF48A7252777F7C471CF0F1F533CBC1A5332D0F23ECF7770FC4BD3D10CCEE03E673A1AF816F8C6D1A2B2D2A028EBAB777F935EBB868E7DEB3259E87104AFF09EF8BC5E5C1EF83E882B9CF1BD782C16FFDFE08E82FE87ECDFC21DF53D86388623F62520B8E739879F52DC2483615BB388F39AD6AE6453D702A7A05C7BDF1C6BAF5C6B8F5C2BAF1C2BF77453279CA97DAA4FA08FA5F5B32BD7B66B6AC9080A29AC90BA75FA5CA8A7777365754D2989545088CFCEC1E7E5559596B635340C7475753435B5D4D551CACB8B72727051519ECECEA61F3EBC3632829EAEAFA5A5AAA0202B2121C2C7C7C1C404459E01B350454C7CC79AF5E70DB63F3C74FCD9F1334F8E9CBCBFFFC8BDDD074D2EDF34BD74D3ECF22DCBCBB7ADAEDCB1BE76DBE6DA3DABEBF73C5F7FF07CFB11E2FDDED8E7C367783DF0FB640A2127A7A3A1A464406A52336792D547AC4042A89AB7AC4BCBAB4BCF81656D5A766D6A2E2C6B5272EA92B3725C02721CBC532DDDE23ED984BD34F57BF4C6E3CE0B971B8F1DAF3E72BCFAC0FEF203BB4B776D2EDCB53A77D3F2EC2D8B3337ADCFDEB63C7DD3E4D8950F07CFBFDE75E2D9D6C38F37EE7BA8B7C7F4D025B3C397AD8E5DB33B75CBF5DC7DCF4B8F7DAE1A795F7FE675F365C44B8B1C3B3F8267648A9527F8FE9BAC9AC462B667472F83EC16B79ED93C786D75EFA5E9CDA79FAF3F36BFFAD8F7C1FBA0FBEF821FBC4772FF1D5475301D640FB9FD26ECEEBBA8879F629E98C41B9941704F4DB14F4D1CAE3C74BFFFCAFAF2FD3B5BF66D5B2EAFCA26725E7D5BF85BDBF6C4A2126F6C2BAE6834AF861C9A4109CBEC4BAF68C4151CD7DD2148C3CC8E59B25E426683921AE0BE63DB76401964FF13EED0DD75F536EA81C1F3ECFEDBCC6711CD8FE20E3706DC51C7E11AB801E02E2327FD6FE10E3FE2F0D143F0A359D959300B314222822F5FBF98FAFDC0E33F67FCBF853B0CF0FDFB999CF9EBFF2983BD5DD969C946F7EEAC9759C9494D2DC1C37372DB76CB474F9B73F23AF20A7BF20ADA5332EAA3E22861D1CDD884BEC40CF4934D73818BC89164E23351CDD180E9683A1332AA42B11DE939992E9ED70DB6ADA261915DC27455775BAC895D4F4A7E677C3634E586A084F114E2740A692CAE683A91341D0729FB81CC2A3F37F94E6288B09C88254EE7D44EE7D7D40426991CBEA2C1202C87613CAFA0EF7BFF4D8153407B5C26C93B3CCDD2B93A30A63A089B63EF59E81D9C131AF1E6EE5DADD5ABE931183A0C66FFE6CD115E5EA55959F544622D12D24CCAD1D4404A49946F253F2D3D1D179F9B929A9D941CEAE36BFEFEC3B5B3E70CD5B5B8314BB4974BBD3E7BD5FFBDA9CDED472F8E9CF970F2A2D5E5DB7697EED85DBC6D77F69ACDC9CBD6472F581E3A6DBEFFF4E703A7ACCEDD303B77C3F4EC75589A9FBF09938F272EBD397CF6C3F18B10E353572C2EDCB2BA7407FD12DCC6F6EA7DDB6BF79C6E3D71BEF3C4E4CCB567FB8EBD3F76C1E9F6639B2BF7E0A7C0CD8C4F5F866BDE1E3DFBEEE879E36317EC4F5C773A7ECDE9F875C763571D8F5D83A5C351C815CB7DE7ACF69FB33E70C1E6E005DB4397EC0E5FB23F7205BE64B5FFA2CDE1AB8E276E399FBAE376FAAEC7D9FB7E179F045D7D8E7B6C12FFC434F18959EA73ABEC5776851F5C08269E24739F66AFD872BB40B27B647368729289D3559D9D6B18784531F4B77E3BFAE8F885F7571E98DC3232BDF10C6275E795D383B79667EEB85C7CEC7BEB75D0FD0FC1F73E04DD7D1F7CE71D24E2A171C8DDF781375EFB5D7D1178F565D8AD77310F4DB0CF2C7C1F1B07BEB1B2BCF468B7B4EA0A0C9336B784E585C79541299DF1255DF1253D71C4DE99F4C542485D38E2DDDD27C599B9D93154EBC4576AAF57D9B84177E7CE9D863BB6CF9DEF14D926A3AB0BD71B6CD083FC5347459FFB28E996AD9B41F0ADDB0D77ECDA0E64CBCA4A8B8A0AC3127E10F2B374B4F466CE8AB771A31ECCD1936C6868A8C10D2424C46564562A2B2BA2576ACD9C6C495F5F17BD25FAED5F67DEAFF1B78117B36F8ECD9B376B6B6BABAAAA0A09092D5EBC585D5D3D3C3C7CD6A09F35FE9FC3FD47476F4F57715181BDB5C5E17DBBD74A49AE59B6CC5045E5FCAEDDB12EAE0521610D29A91D5939E07B4B424A7B726A7F5A0E7270E0DF4D9F93FD4BDCE7584797F531F1C305F8B2D08897878FAD67E75E8659BC6F95A2D39D27DD69F9FDE985CDD1A9CDE149A349C553C925A3B1F9D389C4FF16F7FF2808EEE9E4E9DC9A86E064ABE33737308BAEC2309D91D7F6BCF1ACC825A03E3C91E0199C65E751EE1F49F00AC9B473C5078561DDDDAE9F3CB64A4C980983116163BD71EA6472783831331370474220CDA41C0DE27B29E99B292F2C22E51754E14BCA0A0AB31212A302023F3E7FB147DF806F11AD96B8CCBB8B37B1B6AEC11FCD5DEE3DF37EF23AE2B589DBB587EE971F785CB8E371E6A6DBC92B6EC72EB91EBEE078F8A2D3B9DB76E76ED99EBD094BFBF3B7616271E2CAE7C3E7616976EC12C4FCF865B8F86EEFC937BB8FBFDF77EAF3E1739627AFD89CB96E71E2B2F1A1B39F0E9E313F7EC9F6EC0D74FE61FFA9777B4FBCDF77122EC20DEC4FDFB0DE7BD66EF759FB3DE7E6C5E5E06588EBA12B6E87AF7A1CBDEE79EC86D7F19B9E276EC6DC7E1FF7C018104F36B24833B2CC786E9DFBDABEF0BD738F7F52976F42A7675CAB6B74934378835D689D4D70AD75509B5B5495B55F8D4B6873202EFEADCD793503395A2E04F73DC79E9EBE6276EF85CB6B53DF4FF611961EC9AE21057E58F75BAF03EEBF0F7BFC39FC8949C8C34F807BC0EDB710C03DECFE47F03DF8D6DBA09B6F60197EFB7DC8FD8FFE46A63E2F2CDE9FBCBD79998204867593C81AA7EBAFEBC3B3C17144F65812988E1E437438BA1C947FB4EF8C2433CF1CEEFA3A1BB6EFDCB179C736905D5D7F1677BD0DBA9B7474B7E8FCC3B8A3451B7087260E757BFBCE6DD0DC416D313111393919D462F44C78DFC35D5A5A6A1EEE70E39F83BBA1A1217A6A407E7E7E2A2A2A78FD8B89899935E5678D5FB8FFCDE8E9EE6CA8AFCD4E4F71B0B6B874E2B8AE9292FCD2A572FC022F2F5DF2FD684C8CC4F616E0870AF15DE9D9AD89A96D71C8E1C0E6D576D4F72F9B3B4A3C2C0177F8AEE9B22AF876B7874FB648480B63306A9C820F761E684FCA1ECD25F6A7167660D387E20BC6E20B87B1B9D30984FF35EE132915D37935AD11194EE71F1A704BACC6301F9351B53977A7C43D186A7B915B40B17B20C9373CDBC93BD3C1BD2C32C6EEF52B436D751E465A6E061A3D1525BBCF9F4A323321BF77F63F35F7D9F2FE9D3457D5B451EA6B4B2BAAF1A5101F47D77D9BB6F22FA65313937C7BE1469A6760B6576082AD6BA69317DE23A8D0D1A7C8CEBBD8DA1D6FE15A6CE658FCD9BEE8A36DC147BBB07BAF03EFBEF4BFFD3CE0CE0B74E27DFD89DBA5FB56C72E9B1FBE6076E83CE4D3DE536F771E35DE77DAE6C455B8D2F5E23D88E5D14BD6C7AFF8DC78EA7BD3C8EED475B899C981B370CBF7BF1DFFB8E724DCCCE1CC4DAF4B0FBCCEDCF13D85C4EFF45DFF33F7200167EF43F2DED8E6BFB52B7807703B147D702CFEE884FFE48CFF8CF4F1524BDF0ADBC04ABBA06ADB208A7D48837344B35B34C9CCBBCCDCA7CAC2AFDAD29F621950631588A6C929ACCCD2BBDA29B8C63B2AF4C9A7A3F29A528B59C51632EA48AC369457DDAF61704C6FC7A98D7BCE1B1EBCB3F7CC8BA3979D6FBEF4BA83F80EF1BFF7CEFFCEDBC07BEF831F7C04C7431F7C0A7B681CFEE053E8BD0F81B7DE4085F7B8FA2CF0A585D3A3F7F7769DD2E0915AB990639F9C56A0912552DB51DC673AFB2CEE58125C7C76F8E24A563EC05D6185B48EA2AAAE96F6D6EDDB366D33FC69B86F3634D098398EE3B61D5B65E4A451DC57AD9205B2C168147798402547C99EC37DC58AE573B86FDAA40FB8C3F53F0DF76DDBB6C1524141818383839A9A1A5677D2D3D3674DF959E317EE7F33BABB3B0707FA7A7B3A4825459E8EF627F7EF93111462C46076AAAA3F3D7D06E7E4D29C993384277467E5D6C5C45705477C1377C8975BDBE702C437C7264E11CB478B08C9360E97F5364B2CA6915ECC7068AD2A29286A38BB6422AFAC373EA73F367730366F109B3399503285FBDFE23E84234CE752BA63F3604D7F97C86A790CEB1EF1B5EF0F9C03D9F39C7C41F6CA9018A25F7896B377BE9B6F6978F49D13C7578A08D06330B24B856F9D3F9B8A8D6A2C2F276667FF28EEA0794B752DE05E554C04DF3BEB9AC2BCFD77EA6CE45D48B39A4BF0DE811349AEBEF8506CA15F18FC656AC270655EA1E5EE2195AE81554EFE64079F6A5B2FB2B567A5B547A1A94B8E895396B10324FBB3232CD3DEDB24BDB6703E7DD3F6E8659B2397EC8E5D8125C4FBF2C35823E3C887EFE03699EF6D43EEBCC43E7C5F60E196FDD11EBEE475FE9EDBB93B2E276FC0ED1D8F5D8579E0B5A791775FE7BEB5FDDA714899B927A4DCC2ABC2D2BBCADAB7DAC68F6CEB5F6DE75F6681C85EED1042760C05D96B1C4201F716776CD107971263F70A339F1A9BA046FBB016A7C856E72868F135F641444BAF4A87C0729760F79BCF764AAC5DBE8071D91296952CBCB2DCC2F202E2AB7897CAB08BC8B00AAFE511D71492BEA6BBE7DEA6FD4FB71F7BB5E78CF1912BD667EF7ADE7811F8E083DFDDB7B084461F696416F1D824F8DE079FEB2F5DAE1905BCB634BBF6E4A4FAB6358C42F274025774F6249A790F6554CDC90E1988F903F7B7A76EC8B00B706096AC174770D7D1D034404E856D300FF77F7CB3CCA6CD1B55D555F4670EBFA53E731C4728EF2B65A440ED65CBC4D6AC59859A0E64CFE10ED0C34F477197915989E2AEA2A2043700DCE1AB28EE73B7FC66E6FD1A7F1B94F2AFC7F6EDDBA1ADAF5EBD9A9191918181E1D4A953252525B3A6FCACF10BF7BF19BDBDDD9393E3D3D393E3C343055959EF9F1BE92B290930302C6765335CBBFEC3956BC89BABE9595DB985CDA9E97558DCDC69F9E6320BFD9F77954103BEC3EB41676A666F561EC13FF8F3B9CBEADC02E298257A42E2A16F4D1A6353A70B2B0792F27B62730662728763F350DCA77065FF61FE0BDC7BA20A00F7A1E49288A7A687A554D62D64DF2A24FDC0605FB97F549AAD3BDE3BA4169B54E21756E01584F70D4E7072DDAEAECE414BCDBA64F10EBD0D2E16169492929E8686B2BCBC3FB14EA89CCB3CD3E752965F5C47AA8410B2F32B8B08A07CB84FC06FBA06DC0BA945A8190F6B6F0A30B6CAF50BCDF30E869F5E19184D70092875F22F77F42DB7F7A9B44558AFB6F2A8B274AF730EA9760CACB0F38354DAFBC39264ED5D62EE1EF7F043C83523DFF3F7BDCFDE753976CDF1F065FF8B0F938C4C88969EADBE312D9E51859F91A25DEB1A4A34730FBAF2C4F5C855D7E3D7BD4EDE826F09BB6A14FBE07DE64BCB820F0E14BB00488D7D60AD43509D6370BD133471F03AB4D2CA67CEF4B91BD43806114DBDA0B99759FB97DB04945BFA41AA6D026BEC43EA9DC2218D8E481AEC426BAD83AACDFDC0FA6ABB0082A557856320DEC1CFEADC6D3D2149110CDD0A064E1E0C351F1583200D2BFF62264E0C1D37864E6431DB4A7A1E591A6E05063E750EB14DC232FB65542F696E7BBEEBE4E763D79CAE3C71BFF9C2EFC1FB102393C8E7E611CFCC421E1BFB3DFCE0F3D2ECC5F1AB8692EB25A9D835B925DF1CBA5AEC819DC8AFEDC195F4C695FC8E3B12F01D70FF7CF1FE6A2E614ECC12C515C81BAA5A6AEAC8279536E97F89FBFF629B3B8ABBDE465D74024BA8F0C80E30B2D2CB972F5DBB760D5AD5D19359C30F05B551B2E17A75755514F7952B25555595BFC41D6E0C3780970494F2AF33EFD7F8DBCC5AFED5D8B16307FC59A4A5A5A1B6B3B1B1DDBB77AFAEAE6ED6949F357EE1FE37637078601239F936F2E66A430D252C20E0F1CD1B87B66E655FB060190BEB16798537172E25BB7B427FEF2B2AEECB2D404EEB3173C0C8AF71FF32E8E10AC0F7CA80B0EAF0E8FA98F85A2C2EFCBDC9017945C905B40A4C5C8F7F3B94E3EC3396533A905200B80FE2F2877105938984C9F81FC01DC98FEC5D03B8B785644DE79027B32A123E389C91DFB08E8A538F6BD9453503524054B2B52B312082129D98EBEE8F0F8CC8F5F6FF74F5BA9CA020D4760941FE47D7AF264746B691C9BD8D8D554545DFC7FDDBBE43618725747650BEBC005F5F5615131476EDF819613A666ECC625DE935D6F79F25387AA43A7965BBF8C00A44994748A57B08D92DA8C625A8DE39A0D129A0C929A0D1D1BFD12908600564516A2150A54B4DDD6102753BF1C147ECCD573E276F5BED3869B3EBB4EF895BA59F5D9B5DC23ADCA3AAE0669F5C88C62EE98F3EFB9DBC6DA27FC076E729DF6337B1D75F641B99C3F5B536FE704BF8BF81E3739443407348B31BF4F1C8568FA836CFE8762F6C87774CA74F6CA75F1CC9DC8764E507E51DC51D8A7C957500D9368868E2596AEA059A5759F8912D902D3310B25500E05E6AEB5BE1125C60E7FDF1D865154E11210C2D746735715935A955CAE272727C4B45E8B8781730092C645EB6844D04C3B0144307598E61400F24B05D7CED6179ADA7BB4EBCDC77F6D3F16B36971E7ADC7EE5FFE863C833D3E057E66E4F3EDEDC754C897BF9320CD3367145E75B6FEAC233A70BEA41F6AF71873A6F75EDE95A5E312E0CB58A84ACAE929AA62AF8A8ABA5AF8BE20E4BED19DCA1BC83EC9BE0BFFF10EE1B0DF455660EEA8B4EA0C283EF12522BE4E464C4C5972928AC85863EE735FC501477B4C2A3B8C3CD50DCE11A03838D7337865BFE04DCD1E62E2929B968D1221E1E9E0F1F3E747777CF9AF2B3C62FDCFF668C8E8F8D8C8D0E8D0CF7F7F7B7B634118B8B701161FECECEF24B972D6565156564DABC66DDE7DB777283421A32B2DA3272BA129173F281EF739955FE0BD321C3334703866B3A7129E4D028F0BD2B3D9B1810F660C75E797A76D9254C9BC5A4029EBDEF49C907DC7BE37247128BC6128BA7928880FB647CD97F98FF02F7A68034C07DBA809269E1795979B3C2122E0D56A1236B344A7CC313AD5D08011184E0A8381BA79290A8783BA79DEBD6732D594287C1E8AA28BBD95897E6E5B652C81D75F5C87BA4B36AA39AA3A9FEF3C53FA595DCD0504E69AEAA6BACA841AFC9C4A5D8199BC9F20B7361A89444C4DF5EBE1561691F6FE79AE1E859E8EA9F67E35168ED41B072275ABA975BBA555AB85559B8912DDC5B9C821BECFC6BAD7D6AACBC6109215B78569ABAF57A63615EFAD111FFD636F9EE5BCF8397EC779C70DD7B2EF1C6EB7C238BAA4F6E559FDD0B8D2C71575F041FBBED7DE08ADBAE7341C76FA7DE7A477CEB506FE1DBEA10D2E914DEE61C5EFDBBECDF0C6A3D3477A8ED489C82017490BDCA3EB8D22EA8C2CA1F2EA2B89799FB5458FA51AC03A1B977B8C5F4F9240E07A68D8464543904963AF857B987E5DA7ABE3A78761D2BBF10866E0DFFD26837DF70379F007B77BB77A66F6E3EB97FF2EAEDA3171F1CBB785C67DB3E451DFD156BE4D985C4A958962E645C49CDBE9A9177A3989CE18AB57B57AB9FD1347CB0E3E88713D7ECAE3F7579F0C6F6DE8B337A3B6418B89762E88FACD30D7B63D3995034955FD31B87EF8BC30FC4962099C11D0275DEFEF64B45BE65B0DEA02A2907B8AB2BAB686BCF1E75601EEE20FB3F8BBBB2AA12E00EACC3042A3C5C83EC04292703957CFDFA75681907C7C1EB39B2E7709796964271575353F91A77E8FB5F82FE65E6FD1A7F9B59CBBF1A5BB76E85A5B8B8380683111212B2B3B31B1D1DFD1F9D2BF57BE317EE7F35E09F626C6AB27770A0B9BDADB1B9A91946534303995C53567AECB7DFD6AF90E058B8509C8DFDEC8E5D7E66663921A1C5A111EDBF9F960F32A73CE00E257D0E7754F6112C329F2E203645C7D746C48C17133B52B33F9FB9A4C2CEBF7211BDF4227ADB2B77DB7099BDC9F9BDB8BC9114FC784AC944327122E17F8B7B835F0A827B715DAE8DEF558D6D0AD4DCCA4CFC7B65940ABD4370D6CE50D873BC03833F5B148644069998AD606402D919172DD8BF6D6B4C70504D29B1B1B2A2B99A5C5F5EF11DDCBFEB7B5F73674B757D476D734F633B100FD7946415C4054582297C54746B0597BE387735CCDC1670CF72F6C67B0491DC83A1B9535C83EA5D831B5D835A5C82DA5C823B9C837BDC233B9C435BED029BED0260D9621FD86CE35F6FE533E0896DB2F56FB0F4697508AA36764DBAF92AF4C4EDF05377030E5CC39E7954F4C8BCF29D73DEBDCF41876E786C3FEBB7EF4ACE9D4FC417B6CDE67E036ED8118FB87ED7E876EB2050BEDD2D124AFA5C9A5CC3D1A09B68208D2E6170112DF2CD1E9150D5CBACFDD1E60EF35233EF720BDF4A2BFF7AA7F05A87D01A9BA06A4BFF4A539F0A136F58226FB13A06919C022BBD23B26D3D9FED3FB58A99476001DD5A61F1F68A9A4E727D4775433DA1B234BDB0383E0B9F905D969A1764E1ECF0ECFDA3E317762BEB28F088892D6612C0D008626878308B0431D412D46C4A3C4B77CA2A5FD4DF6574E8DC870BB7CD6F3E39A269B01C5E0630F467D40C13CCDCFB5388D3791490FD9BB83BDD7BA3C4BF1CC55D4F595D5D5119D9CEADA33D873BB47874CB8CBEAE1EE4BFF0F19B414D478F05F635EE8A8A0ADFC31D2600FA97B843C7FFF9B81B1A1AC272F9F2E580BB9898989B9B1B7252CFFFD9E952BF397EE1FE5703701FFD3DE8C1DF91EDEF13E3D3E3E325B9D90E2626DBB5B5051818841818B6282ABDBD712BD2C661B0A0642417DF169F56EA1B52E211D014113F925E30955D82E28E7EA669342E6B2C366B22360B26D37984D6D8A4BAF098B6F894DAA8F8F0F726F7B6EFFB4D7AAD120BCF058D8D3863DB912CC2583AB1CA2B8AEC19359A801F8D238CC512BFCEDC517C613E1A438020A75B8A2EF951DCFB638A3BB1797D8945F521C9CE579F6E119459B598558777B9D7B377498E1E492E9EE95EFEE5B1896196B6C77474A5B9B9644584776CD237BA7B2FC23FA09A40ACAFA82413CB5A287594D24A24C4EA79F99DF8F96928AF8565557139A41A5F01CBD2DC127C7ADE2AE1E502D40C22B4CCFB35F53CDF7E2A098BA144275607C7105D03CB5C907753298EFE75F6BEF5F6BE0D76BE4DB6BEADF6FE9076BBF9CB365BBF261B9F460BCF3A0B8F5A13D7B2F776454F4DB2EEBE77DE7C22E8C0F584F346D8530F9D0D8E9BA9EF0ED87B05AC6FB5F06FB50C68B30C8065BB55609B5520B2B409AAB70BACB1FFABA09D1DAC874073AFB60D82CE8E06E610A8ED10909D62170CB8D7DA06D7DB8634D885C212AEE9084E24B906E35D02C2DF9A9DD5DAB29A8D4F494C6A8FCE267447D2DFB76E55D7975437945437E12B1B8BCA5B4A2A1A0A4BF1F16958575F8BC7AFCE6EDFA727BD4E45546A290DABE0427AD125CCC0BDC842063956FEB55C227A12AB14F9C4965131EA084B3ADC7C5617953E98461A4A26F6C5150DC4160DC680EF08F17D33E98AC797F8C52E5BCC2CBC9871B5C0526941B18DDA1B545555F5371B686FD4D3DC840426BAFA7A3050DC814EF4034768E651F89F474D43154CD7D2D1D49E391107E0AEA1A5BE4C7CE99A35AB962E15555151DAB6CD106457555506B8C1747019EC8600F10A0A6B972F5F2A2A2A0C2F035FC2FD9F64DEAFF1B74129FF7A6CDBB66DF5EAD5203B8CB367CF9248A459537EE2F885FB5F0D14F7E13FFB3E353109BED754544404F85D3B735A494646828707D603CFFCF6DBBB6B374911D8B6E4CC9ECCFCA6F8D49A485C4B5C0ABAA1A677E6F3AB8333B88FC466CEE13E9955D49D90D61C05B74C6A8C4D4EB3777D7BF4EC6E9975724B98F6C8AC73BD63D4129B3E9E456A0E4BA90F8C1FC4157E0F77E8E9133812E44BE2C7B03FF68956C0BD0F5BD4169DD3135F501796E27AE3B9A1E82AD9C52CEA5CA24E339BBC41F60CDFC0C2B02897D7EFB6AD531061605C272979FEF8517B33F3A4686C6D59795B6D5D4325B9995CFBA3B83755D6D79128E4924A085CA410AA2A0A49A5D9455B54B424B9F8A0BC6F5EA368FFE4455170545504AED82B781EEEA8ECCDB6BE8DD6DECD56DF48877D00F8DE6AE30B818B75A66EE56F6DF1CFCC7CF75C00DCA38EDF0B3F7AC76BC73957C353B8B34FAADFB9FC2BB8C3F5753ED124F710A26768C86B93438ADA12746CEA92ABCEED3F02B2534AE7D684AA7FF7BDB2BDA2AEAFB679B0A1ADB7A6A9B3A2A626BF242B322ECCD9F3C9F96B270C7FDBA5BA414F6EFD2A2EE1A5B46CA2D42C50C0D597AF94E3E0175D48B769B99CC7C3774DB1D943A9A5FDB86244F63FE3DE1B87E04EF08F13A762811502147703AD0DEAAA6A1BB76C9EC31DA2A33FEB3B0C90FD1FC11D7A3A7CFBA6CD1B2130D96C68004BC995126BD7AE01B8A18FEFD8B10D0A38686E68B8195E51C065744B3ADAE8E166F03200AF01736AFF8799F76BFC6D50CABF1ED0DC65656541766A6AEACB972F979797CF9AF213C72FDCFF6A00EEBF1FFF7D7E7FEFE9EE2495E0BDDD9CAF9E3DADADA0202B26B65E52526FED5AE7E72FB33C7DDBB3F2068A083DD905ED2959F5D844727034BA633BEA3B7A7C02F01D701F4EC9194ACF05DF9BA2E3A1EF578446BBDC7D7A6CBD8638864A959DFFC1B6FD794EBE6399A5A36984EE98ECBE983CC07D14E0FE2A5389159309E510F4CCD763E0FB0CF13F8A7B577441734466575C5E6364BACFFD77BB562800EEEB98F93E9EBF86B3772B088DCC0C0CC1B97B3DBB78799D8830FB82059A0AEBDE3C7B868B8ACACBC8A094577634B534D736D65490AB4BABBF085C444221926B08DF4E4B555343595D2D9152575A0313085C59555876EFFC152DD9355C0B96C80B88BDBE782DDB2798141C9D61EF31877B8D833F5ADB4176489D85DB37D36AEFDB62E7036973F06B77F48749ADB92BF99353E4CC96199FDF2EFAEEBD1CB0EF6AF8F1BB050F4C5BAC025A2CFC6109B2C312646FB5467C6FB1FD61DCC976C155F6B38139044C877C1377A09FE8E04F740F2EF38BF47DF67EA3E46AFE85349B15D5DF3E32AA21965793C0F7D9974CD47768F1F5A5F0BA48813494573757525AAA6A2825247C464E51724684A79FE347B3E7D7EF1ED9BC4367958234AF303B860AFE8CCB19584416D2ED5EAD12F1D1BA3331AF3FA1A82B3A07917D26A03CF8DE1787EF8DC303EEC400DC8A25AC4BA998E50596C90A2EDDACAD8BE20EA66B1820F91FE18E1E24004C872594779478C07DD52A78AA89282B2BA2CD1D94DFBC7913BA65067007D6A1C543735FB64C0C9ABB8484F83CBBFF36F37E8DBFCDACE55F0D030303292929C09D8D8DEDC18307D5D5D5B3A6FCC4F10BF7BF1A5FE23ECFF7B1B1B1A1C17E4A654590AFD79533A7D6CBC9F03233B12D5E7460839EF99D7B05A1E11D0545BDC584CEECFC9A9884129FE0F68474F01DEDEF6879478F3FD3179B3A99533C9C91D71019D71C9BDC129F166766F768D741A905B4905D126BBCEFBFEC8CCF9D2E240FA7E0E14938FC1DDCA7932AC1779478F0FDBFC6BD332ABF312CBD3D0E39956BF84B8B436B346597B0CA50B3DDD8B12FCADA91101B9F1118E2616C726C8BA108033D2306B35D4FD7CDC1A1B4A8885050504924B537363701CEF8D26FE20EF912F42FD35CD988E25E4FAA6DAA68808B30A1E02B3D2CED8E6CDDC1BB844E9886E9F2CEBD710E6E78BFB0544B67C0BDDC39B0DA7116776483CC4C2B6FB0F2A8B7FE461A6C3CD165B3BD4F9B933FA4D1D6ABC6DC3DE5E66BFF43D7EDB71C77D97126E4F89DE41B6F486F1DDBEC431AADFC9BAC03D034DB04CEC62EA8EE2BCDE7651EEE14FB906A87D9C01CD9D57D26DFC33DC7C2ADD03500EF1D6A7FE789028F083B66E14183ED01AE9E50DBABCAC0F74A24A573EB40956DB54D2D750DB595D51584D2AA92D21A5245259E589C953BD2D9DB58412666E7C787463A7DB67879FBC1A9DD07D4645649B0F30851D18AD3B09CDFB823CBC9AF37B5A82B26B73D2C7D38A6080DF88ECADE83C3772614950526ACA4665F4EC5B25670B99CD0B22D3A7A1A6AEAF37047CEC4F4BBEFFF6073D7D2D18489A6B6868A9A324CD435D596AF582623B352484800F806D3A19883F2685507D9D16D3230477187D780952B25E7D9FDB799FB05FEC3CC5AFED5D0D5D55DBA7429E02E2A2AFAEEDDBBDADADA59537EE2F885FB5F0D14F7C1D90349FEC9F7D1F13174FFC8DAEA2A3727C7437BF6880B09D02FC04872731FDEA8EFF8EA557670487D4656677E5143723A2924B23521BD233EBD1B970EBECF6D7C877445254EE7954CE6E101F7BA485C5B6246B14F88E7A3971B0496AD5C48A740CF69B4F370897BE84476D9583AB11B9B0BB80FC711BFCE445205643CB17C2CA16C04570AD70CC51286B13FBCCD1D9A3BE0DE81CBEB492E4E32753DA7BE65150DFBF205F47BD6ABF91B9B97C62725F8F8BDBB7D474B4E8E73D1025E7ABACBA74EC7454637D5D4012E95C4F296BAA6BAAA1A6261C99F5827D6CCE54BD0BF0C800E9D1D26B084397A1170CF88C6195DBB29CD2BC88159BC4341C5E3D5875C77FF4C5BF739DCEBECFD67B7B6CFE0DEE2E0DBF4ADD45A7BD458B9C3B2D1DEA7C5C9BFD5390026B5D65E25AF6D22CF3D72DE79C673DFA5D8CBCFF28D2CAA4D3C5A1D421AACFD1B6D02D034D906A269FC71DC6B1DC3284EB38139A46E26DFC33DDBDC35D3C12BD5D6FDF5C90BE2F46CB0CA72F5D8E99CE434A8ED1565E555A4CA99207F5B643357696565694539A98C5842282E2C2A2796D65693EBAAC8BFBFCAD6B550EA80FBE28C9C8CB8444F3BA75BE72E08D133F353D128F28BBC3973991C91D49756DC1C96D21E963A1C53301314F7A25E5C118A7B4570920C2DE70A6A3645A115AB8497A3B86F32DCF24DDC67F2CFE0AEB751175887CE8EE20EFF2B98AC90149FDBE6BE7DFB56D01CCAFB962D067A7A1B00F4F5EBD7C14568EE203EBC06C8C9C9FC8B9B65343535050404162C58B06AD52A3B3BBBC6C6C69FFC6E2A8C5FB8FFD5989831FD4BDCE77C1F1C1D01FA01F7D191A1A2C27C2B33D3837B7F535E2307DE29AD587E6AFB36B3C78F527DFD1AB3725AB3F3AA63135A12D3C1F72E1CE23BFAE62ABAFF3BE03E9E51309E55D8169358171ED7149752139990E7EE7F6DE3760D6E61290CED0139A51023E3A6A8B4C194E27E5CE110EEDBB883E9A3F12494F5C19892012CBE2FAA6820B2E84771EF8D2D6E0ACFE84A2818C92ECF7309BEBD79FF5A066E510CB58A8098E3F33784B8843027E7AB870F4BF0F070502D5CB362B9A38525A1A0A8BBB5BD9152DB40AE43B7C95410CABE87FBF7B6CCA0B59D8CAF42E7E86699CAA2B2F2FC623773ABCD2AEA3C8B68D60B88BE397725C5CEADD83D10C57D66833B827BF31CEE4EFE4D2EFECDCEF3970D0E3E750EDE75765E0D4EBE2D2E01CDAE018D8EBE75763E35D63EA90F3E059DBE1779E969B69179E927178A956FB35368AD8D7F9D6D009A7ABB40340DF63F8C7B9D53788DF36C600E413FBEF43DDC0BED7D12CC1DFD9E7FB868B04368119D2813DBF33B0FC8C432A8ED807B4559250470477D87165F5C882F2EC11717171715159148A4FADA3A48756515BEA0B08C406CA8A96DAEAD6F20D780F88951312FEE3FE0A45A22C6C0BC63AD92EFDBCFBD99253D4905B5FE71DD111920FBC817B8F7C41775C523B85785A6C8D17249D0B02B094BAC161137DCA0AFA9AE61B0D5700EF7AF7CFF677047B7C3E8FF7E8A25832D9BE07FBB52460ADDE6AEAAAABC63C736147774B30C2CA1C2C372E3463D805E5454180AFEBFB8594659599983830370575353F3F1F1696969191D05367EEAF885FB5F0D14F7FE19DFE7F5F78191E1A191E1E1D1A1B1B1919EEECEC2823C571787E78FEF8BF1702DE7E658252AB45757C7F6E58B9298D8C6CCEC8AD8F8A6C4B4E6843428EFE03BBA71067C87F46093FBE2D3FB9332BB13D25A6292EBB1894D7170CB0CE7BB4F0FCAAB4862683438843E1EBA50E014D01597339C42F81EEE68E658EF8928E80ECFEF09CDFB51DC07E2092D9159BDC9C5D3C5B56501714FF79C5ACF2A2088A15ABE84C1ECEEA3FCE8186F738B031B37F2D2D20A32D1EFD0DB509499D5DAD8D4DFDDD3D9DAD6D9D2D158D35041ACAC2E23A30055916042AE2AAD4133833BD4F36FA4A1ACA196584BC693292594BAD23A08CCCBF3498DE5D5C96191D78E9D5CCAC42E46CD7061F30EAC894D6560F497B8A36FA582ECB004C46B9DBCEB1DBDE72D9B5CFCEA9C7D600E4B98D7BBF8D6DA7B926DDC9B5D428ADED927DDFF90FDDC8264E2566DE5536B17D0E8145263EB0F1334003A9A7A07E413527F9D79B8D73B47D4BACC06E69086997C0FF772CFB0E88F569F2FDCD8BD56851F43BD4A50D4FCCD07E8E028EEE5E595908AB259DCA1C5373636D73737D535D4536A6B1A9A1A3B3B3B3B3A3A1A1A1AF273F348C4D286BAFA7A4A4D75794529BEC4D3D9F5F06FBBD9162E5AC9C97D7EEBAE4CAFC06922A53D2EB3D23312F9FCF37770AF0E4B5D4DCF2345C7A92C22B95674C5B60D1BB53434BF87FB8CEFFF0CEEF03FD19A39B312FC4F34B4D461A2AEA9B674B918D4760E0EB6952B25817569692929290928ECAB56C9427F07D90D0DC1787DC05D4444485090FF5FC47DDDBA754C4C4C80BBBEBE7E7878785B5BDBD010E0F153C72FDCFF6ACC6D73474DFFB2B90F8D8D767677B5B435F7F5F54C4C8CF5F7F594E08BB011A1722B9609B032B32E5A282B2CF0E0CCD9247FBFAAC4E492C8E886A434F0BDFD8B8D33E07B7F5C5A5F6C7A47447C4774727F52765762662336B119973E905B9260E5744D7FDB4A0C9D3C15CB1DBD9D091F6D5AA3D2C7334A07E2F1E0FBD741DF04EB8929EA8A2EE888CC6B8FC86D0DCB6E0FCD1EFB7D1749345F9E4015DCFF3D6533C704464EAF3A9250DA16993D98429C263453C2D35E1FBAA0CC212A8059CC8359F8FEFAEDAC8828C74FC65BD4D599172F14E1E23879707F676BCB405F3FE0DED3D5DDDFD55743AE251611AA2B11DC51836696E40A547912F29EEA4C900AFFE5B2A1A2B1A694525D422613AA6B4975B5A49A2A7C35299FD84AAEC36764BDB9F7509A5B800383D9ABA81EF2D6A4260C57EA1258E9F4A7CD32203B2C6B6C3CAA6D3D28B6F39750DEEB9C7CA1BCD73800F73E147BAF6A6B3792B94BA36B4889B14BF64B2BFC27E7B98F9B82CBB0448F34801E4B600E6E64E280FCD0EF2D6B1D03EA1D02EA9C021B1C03E1FFD3E01C3613007D76D9E414D1E4846E96099CC13DB0CE2EA4DE3E189695F601350131616F4C9FED3FA12F2EC3B7805A79C54A07138BD6FAC619D967712F2F9BFDDB42F078029E50525884CF2F2C20104AC96432A5BAA6AC9404051F2A7C7B6B07A59A5C9C5794848B7FFEF8D96A8995EC9885F27C420F8F9C2CC7264E57353547A796B9858DC417FEBE59A660301639450CB25926BE08702787A7CDE0CE8DE02E22B97DC3461D75ED2D5B0DB5376E04D33537CD2E6770DFF8CFE1AEA9AAAEA2A8BC4E4D4359454D5161FD1A651585D56B6438B9581918E830180C3B3BABB8F832509E9595191A3A1717075CCFC6C6821E0D18DDC91DC4D7FEFE316466820C1DDDD9259A79B7F9EA179B1FE49BBF35D6AC59434F4F0FB81B1A1A62B1D8F6F6F6C141E8873F75FCC2FD6F06F80EFD1D029379F9D698C48685DDBA705E4240001E837CD4B4060AEBCDEF3F2A0C8B9AAC20F7E41535C42650C2A29B22E3BA71A9D0D60793B27AA35391C46474C76474E132DBE3335B13325B123389011161EF4C4F2BEB48619628D2B23FD8B82BCBC275BAA8BA272EBF233A773A873C9A5646F64FE84F2A992EAAAF094CEA4BC4F724E247322B485E31EF0E5C3AB37E93D18E93B6171E0DA496D587653687678F67564FE7D5F7E34ABA22F287E34B076388C358E2483471340A421A8F440293C1A812F8EA7062D94416B92DAED0F5CEBB7DAB75344564D6F22D5F2DB034CCDD67FFB6ED5C2C2CCB9789A9A8285557574ECD8C89B17128265D1D9D757575E5A4323C1E5F4EAA00862ACBABAAAAC8207E7D7D6373634B4B532BB99C422983D4FC87CB96BA86B6DA3AFBCFA6328222028BA88F68E8BADE7F9664E69067E55E66EF57E716D2E615D9E61EDAE8E85F63E55965E65A6DE95E6DE55163E35563EB5D67E783EE025F6BE743B1F6245B7B7EB5F46E74092BFAE094F2D824EECEBBA487C655D67E1DDEB1645B001D1CFF3AD0DF4170E4FF396F5966E2546EE6023F9D62E385FE5C58D6DA7A0FF8C677B947373B84D6DB04D45907D45AF9912D7DABCCBD9A9DC3613DA0DAC6BFCADAB7C2D28768E296F7C62EF9B979C8A3779F4E5C3AB0464514432D44457FFDF8A9E28C9CE1FE0170BDACA2BCACBC12F225EE95A55595A51533F3996DF16555B0DA04CBEEB61E12BEB4B498D4D7D93BD03D18111CBE7BFB1E6E0636FD35EB37AF5A6FFFE8650D2E83141CDB10953A9D57D9119531189B37FC7BC07784F8B8829EF882AAD0945BDB8F08621804300CDAD28A3BB437E9ABE9AAA9A86B6B219AEB6EDAA2B36993C6067D756D1D2D5DB868806E99F91A776D28E2334BE8E370FD46037DB899A6B686F46A19552D3588CC1AD9D50AAB361AEA6FDBB1455B575D534B554555417EADACA4D43241414E36363A5ADA058B1761A81643162EA15A04A15EB298869A8A96660964010603812B9918E9B938D98504F9972D155D21BE4C55454953434D4F5767B3C146C32D061064F38DBE3E72BC33FD4D102D5D3D2DF8B574F5366ED9B663E76FE0B2EE06EDB97CD37A2DBDD9C01C790F59173940A5B6363287FF395C545757D7D4D45CBC7831E07EFAF469F8B74375F8C9E5FD17EEFFE8989AC6E7E5597CF868A8A3BD9C975794954D6585E4B5BD07DC5EBDAB8E4FAA8D4F6E8A4F6E4D4CED4A4CEF8A4F6D8F4D688B8C07D9FBA3D2FBB033B8C76674FC8E7B45684C82A5E33DC33D8A741CF28B994ECBAB873E7E3790943F9852DC169D359C461C4A25D4842475C6E78F66979383135B63739AE3723A920A53ADBDAE6CD8A92720B54F56F582E6D6428FC8AAD0B4CE24C26056D56046456F12B1379ED0074D3F8638E33B69241A317DC6F772580E471146E3CB471248C3C9E56D3185412FAC4FAB6F57139259C5252AC52BEA6A696BA8BF899D956D85A484B6BE4E39B962727A66CFD07104F79E9E9E9696969A9A1A107DA6669657545420BA93C9B5B5E07B7D636323E0FE23A96EAE6F282F2979F9E0E1724E1E0966F62BDB767B3D791DFBC132F5935D81A94B859D4FBD73509333D4647F9014BC6EB00F6874086C760A6E710E6975096D730D43536BE3FB756A6C7D1B9D420ADE3900EB31B7DE24DCFF5869E5DBE689458EA83E9F7534814079BDBDF7D7190A8A1D08C0F6F945757A86B6B804C035146B77B2857BA74B589B7D48B34D20B2D78D5D50AB4348937D70837D50B5950FB2E5C72108D60C4ACD3DB25F5BC73FF81076EB4584D1A77747CEED949207DCA558B99F5EBD41CA2BEAEBEA863F26E05E5A019223B84350DCAB885590DFDFE1A82693C8689AEB5A0885C4B292F2DE8EBE8EE64E5F0FBF2DFA866CD48C1B572B1DD33608F96C539F980DB837C6644CE556B484A50CC481E97FF83E437C5E2F0EC1FDC6F66333B83301EEDB350D36AAE96AAA68E96821471CD0DFB865C3C6CD9A08EEBA7F8B3B7AF14BDC35B4D4353668EA6CD285C79292BAB2A2DA7A8D0DEA5A1BE0B563BDA0100F1F3F271717132B2B2D13D36246C6452C8C8BD99869F87839F978B9F9F97804F8790505F820E0384454440896F02576361646063A507EE102847B1101FE952BC4951415F4F5366CD9BC09966A6A6A0A0A0A003AAC62E8E81BC02FAFA6B5017E7F9D8D5B0CB6EED0D5D9A0AF03BF0E92AF7D47EFCB1CEE10640F213DB86308EEC03A8A3BFC086565652A2A2A1A1A9A4B972EC15300E5E117EEFF5F1E53D37D1D1DE9B8F80FCF8C0E6DDFAEB2525A864F405D42EA90B6AEC7EBB7F1764EE4685C5F76E1704E61775206F4F7DA8088FEE8D481A874F01D2DEF9D71196879AF8D4A2CF109B5BB7467E732D9358B18F539453E1E385DEA1132915DD6199BDB9550D09F5AD2169B03E988CFAF0B4F05DCDB12F221E1EFAC8175E9852CEB18F854D945EDAF3D2BF189192DA8ED49253563F3FA5348A3E955DD31C5BFE38E96771477640917C7122AA0BCF7C4E25BA2F3536D021EEF3907B84B30F18AB1F2BE79F8545D51998B8373CD5AF9DD07F60032337BFD4F4E4C4C20FB860E0DF5F5F5757676C24A68E517031EDCD5D5D5140A05DCFF8AEFBF4E7523A536291A7B7CF75E5E5A06D5A52B3E5CB81EFAD624E4D907ECF3CF696FAC8A4C9C2AADBDA02643736F760E8480EC4D8E41A8ECED6EE173A9B7F3FF3A33353C30EF8D6DFCBDF791D79EC7DD795B66EED9E21E5961E98D6E87999F99DD2EBF347D2EC81BB6765E35361E642BB72A0B970A33A77253C70A13E799E31F0436DA04B4D80777388777BB4575BA45B5B94654987B56597A975B78E13F39A73F378FBBF72EFAD6AB883BAF625E993DDB734C57505C74218D86B8B4CDDB0F94D2F296A6E619D9BF81FB4C73AF42E75FE25E49A8C4E7E2C1FD9ED61EB8DEE293859A821AC302EA4D6B948D4E5CCAF38F6A49292C0F8E6FC7E54DE654360426414F87B63EB765060DE05E1D967A73C771210C23E0AE29A5B0557D23E0AEA50A45FDBFC41DDA3A2C51DCD534547FDBBFDB60DBE60D33BEABA829AE949158B6424462E5328079C1420C1DDD42F05D5C5C405151D6405F7DE7B68DE666C6E6662616E6A6104B0B332B4B736B2B0BC8DD3BB7AE5CBE78F4C82168E80AEBE4C5448541797A3A9A45180C23ED12707F959C8C0ABC7CA82A2B2A2AAE5DBB565D430B7E2DE8EB403CFCF2E03BFCFEFA1B0D7E1477A01C7087BEAFA5A5054B030303B8A8AAAABA7AF5EA254B967070703C78F0003D1E24ACE00E0F0FA34EFC9CF10BF77F744C4D4F4F4E763634E6A424395B5A9C3F7870DD7271113A46315A86633AFAEFCE5F4A76746D49CE18C829E849CD6A89496C0A8FED8F4C1B8C4C9FF31DCA3BF8DE86CB68894D6BC2A6E08C6D6EEBEF5065E496C3D041790F79F27E3483D8935404851D701F4C2782E9207B634C16B0DE9341E84C2D0E7C61BA6DB9FC0A0C83CC6236A905CCE7D4B6265A780EE5929BE20A2A03920652CBA6F3EA0177F4E07FBFFBFE27DCA1B90FE1886D11794D91B9E501C9D6D79E6F58262F4ACD2648CB76F6E0516971097E5E3EA82AD76F5EABA05402EBF0A89DBDFBC8BD9F1C1D1D850731500E851D4C07D9678D9F195FF1FDD7A9AE24925C6D6C3556C9732CA0DAADACE1F3C618676E1FF8F075E4E3F7F1469F33DF58967C76AAB470ABB3F36971096A770FADB1F6814A0E70A3CA4385475B3C34FAAF53EF1000F539FBA555ECED3761979F626FBE2A35756F768BF82F7007D6A1AA436A6D3DE162B3B37F9B5B50A77B589B6370AB5D30DAD901F776978866A75068EEE5661EF80F8EA94F4CA26FBC0CB9FC24E2FAF3C4479FD2DF5AC7BEB5B8B3658F022BEF322AFADFD474C2DC3C91DD19C9941FC5BD28BBA838A7B8A6BCA6B5AE352331E3DEF57B32E2320C98253B15755C9F7D6C4A29684D2DAA0E4FEE4DC18F679537054373FF36EEE4F0B45B3B4F00EEFC18467589B55B54F500771DF50D3F8AFB97EF8EC21CC55D454DF9E0B143203BD476154D55D9552B59D818A9E916B17132B1B0D20B09F32A29AD3E7060E7C387D7ADAD3F05FAB9622383A62647A7A726907C712E4C08A994505890979880F3F7F301F48D9E3EBE76F5F2B9B3A7F9B939B8D95958981921DC5C1CCB968ACAAF5E03F8AAA8A8696AE9E8E96FDAB86933F477F8E5B5F5E0EEFC30EEF0444071D7D0D080398ABB8A8ACAB265CBA0B62F5FBEFCE3C78FADADADF0D48067CAC8C808FA34F939E317EEFFE84036C64F4E8D8C0C75765516E3DDAD6D0F6FDB26CDC3C7855928C5C2BE5B41C5F4CA0DF0BD2A32B6293EB53D19D94906701F0E4B1B0A4F03DF7BA3D3D18D3388EF71E9DDC9B944EF50FBCB77F74ACAAFC450EB7289BCD875B4D23F069E907DA9253DC9C563B99550DBC9C1891D49850DD8CCEEF49296843C97BBAF36F04B4A6298D6D2F34A2E62D1159076BCF512FA57596042A9771C34F7E9FCFA3E1CF2F9F281D892B9F23ED7DF613284BCAD4AEA88C86F0ACB6E8E2D0C7967BF738D96E022269EC58CFA2A1A429C3CE2624BF7EDDB6766614A69A88187ECEC7DFF6200F18D8D8D0D0D0DB5B5B5403CF85E5151816C58282BFB8AEFBF0AA5BC3A2739EDC5FD07CB39793831545777EE4D71F6CA72F40A79F22EE2D1BBB8C71F538C8CB35E9A17BEB5227D76A4587A34D8F9CEE18ECA8E5678C83CD6D1CCE11E73EB75E8A527E02C8A7BA595CF7CD6D17C1F77A8EDC03A100F417D6F74F46D710A6C75086AB20DACB3F4ADB5F0219B7B579A78103F3A17BDB1CB786A1A7FE76DC8C5C77E67EF01EEF10F3E64BEB1CEFBEC14FDCAF492F696954B9856D0319FDBB52F2B06D7DBD25E595EF1A3B817A4E595E6111A2BEB6B49147F57DF03DBF789720BB32FA63F65B03BDED1A7AFA0A235A9003A01F4839154626754F6D7B8C335803B2522FDCE6F2784310C7C183AD515AB0C54B437AAE96C408ED0856CD6000D376CDCA4B94177669BBBDE5FE00E855D7F13F225754D3598A3B82BA9286ED96128AFB85672A584B4EC4AD1A542740CD4B4748B79F9388E1D3D70F3C6652BF38F3151C124426E7B0B65A8BF6D74A87B726C707274686A6C18323D3E323D313A3D3986646A1CAE19EAEBEE6869AC235796118A8BF2B2F3B2D29F3D7E70F2E8A1F5F2AB5819E9A0C5532F592CC0CF2B2D2DB566CD1A20189AFBE62D5B0D361B02F1BA9BB66C32D8F2A3B8C3D0D7D747B7B3C37CF3E6CD70515959998B8B8B8E8E4E4141C1D9D9195667E14901A5E727EF0DF90BF77F788C0C0F4E8C0C4F8F8D8DF5F61173F36C3F7D3EB17397EE6A795ECCA2353CFC0755B5DE9E3E1FFCE173916F50537CF25066E11FB847A421E5FD77DFDBB0A9DD4939F59189092676463B0FA931F3CA53311F945174BFFDBC25267B30A3B4199B35925DDE95525C1D9A04ACC32A7673425E6558D28713D78075710CA3229BB00C3587128BC81DC3C321AFAC321D024B7DE3BB124BC6B2C9C3A9E5BD71DFC67D388AD01F513C9154D11F4700DCBB120869F6816775770B2E60E459C42027B29C8D9661B58CECE5CB97C322425BDA9A67EFF69F07E08E6E9C696E6E867552F01D3A3BC84E2291E6E0FE4F02B8877AF95D3A7C8C9F063976D8CBD3178B0322085E21F1EF2C71CF4D128C3E273EFE9074FF5DF2FD37E98F3FE4BF30C3BFB506D9EB6CFD006E901DDDE68E6E96812BBF4EAD1D2420E795F55C73279979B47A4455DBF8CD671DCDF7714736C29839559A3B93ADDC00F706071F28EFADAEC16453F78A4FAE8437F6052FACF39E59663E314DB9FF1177FB4DD0CCC9F9822F3D8EB9F326FDB979CE7BBBDC0FF6E91F6C031FBF3BA6A8B56C018D0C0BE7BD93E788D9B983DDBDE5A4B239DCBFF586EA37702FCE2CAC2EA96CA5341372F0C62F3FAACBABF032718930F33E3F73031F8AEBCD2D6B88CBEE4E2A82F5BFAE98DCE1846214F479B8F7C417D44665DEDD7D5204C308B82B2F97DDA4ACA5AFAAADA7A5FB1DDC3702D9DFC31D40D7DBA8ABA6A10ABEA3B8AF57529095971315171310E21711131697580AE55D435379C7CE2D09F1D8DC9CF45A3269A0B76D7A7200D9616D6A706A7CA0ABBDA9BBBD05D2D3D1DADBD9D6D7D50EE9EFEE18E8E94403F3B9C0975A1BEBD292E2DFBE7CB665A3AEA8A000131D2D3D1D0D331383989898ACACACBABA26B00EB803EB7A06C8F24771D7D2D2DAB87123BA9D5D535313C55D515191969696818101E6A1A1A1A8E9434343BF70FFFFF6E8EBE9EDEDEC1AE8E91D1F1C1E68EF00DF835C5C2C9FBF9460E39460665BC5C5BB556EEDA34347833E7C268444742567F546A40E85A6A2B8A31B677AB0E95DD8F4A688C49698D4E698D48A8028EF47AF764B4179A75566E63DB656ABC43BAA379D50EA1703851D582747A4F4641281F59694426230EEE1EE1320FBF2058CEA7CE26B98F85438C5B6492A3CDD732AFA937D5548725B5C7E5F32612A97DC8B1CDF153F1853328C2DF91D77244391259D41B9D3A9D55369D58DA1591D387C9177CCC3FDE7851632F12E66146462675840A5AAA8646464945F98D7D3F78DF30F80ECE3E3E3030303BDBDBD1D1D1DE03BF47728EFFF5D73B733363BB4651B1F159D2C27BFD9F57B156171D541D87C6B8FECCF8ED9EF6C539F1AE36EBFC25E7B0249B8F522E5DE1BE247C7D24F4E659F5D2ACDDCAB2D3C2956DED0E52130F93A646B6F28EF796FAD71F7DE845F7D127BE755B9A547874F3420FEBD7C0F77E8E94D4E7E2D2E01EDEEC19D9EA1DDDEE13D3E113D3E5105CFCCB31F9924DF799F78EB2D24FED69BB81BAFA2AF3D0F39FF30F2DAF3E4279FF3DFDB9798BB132D3DF1666EB9A6CE6EB79EEE59AD248259B29A8BFFD9951B5545F891BE01F8BB81ECC4CAF9B883E65FE35E538AA42C9FD85851D751DB9A9D9071E7E24D4981E55CB46C72FCE21EAFCDEA12F2DA53F050C98733CA7B138AEBFC932652CA0663670F3F80EEEA0E198845F686AC8D4EBFB7F784E802065E0CB5E252297D45357D554D7D9D0D3A5ADA1BA0886FDAB861A3BEE6061D75504E77C35FE0AEA1A50EA0437957555701DF376D466EA9A0B88E8D83959B978B979F4774A988A696EAF51B97EDED2C0303BC0707BA87067BC686918C0F778D0CB40FF5B50E74B78E0FF54D0CF743264706A64607A7C78690C02D5A1B21DD6D4D687ADA9BD14C4F8CF475B6128BF202BCDD1FDEBDB5597FC352312146061A26467A0101BED5AB5783C8D0DFD1E8C1F20771876F07DCD1EDEC1A1A1A5BB66C818BEBD7AFC760308C8C8CBB76ED4A4C4C449F17F08C80CA87CE7FCEF885FB3F3CBABBBB9B1A1A1BEAEAFBBB7BA647C747BA7B6A89A482A424150929F09D6FC1624966B6FDAA9A1677EEA5BA7BD56213BA235307C35211D9A1B94722E51DC5BD210457171EDF8C4D698D4B4FB6723EA7A62785A191C0D0AC59C29E6AEBDD995C94E3125487CDE802DC2353BBB288F5F1397D79E5E5E149F7771F5F8AA117A762D1159551E214D5149050621739AAB021E085694D6446634C4E477CE17461DDDCC919667CFF03F7C1087C9B6FE6741A653AA7BE2924AB35A6B0D43FE1ED993BC28B98F9A8983816D1D26016E8A8697C7CFF814CAE82D7AFD9BB3DF37E113C7667563D4761323232323838D8D3D3D3DADA5A5F5F0FE5BDA2A2E24771AF2DABFEF4E4C56E6D3D012A7A45C165F6F79E5687C7D785C495BB0695D9FB818939AF2D13EEBE89BAF228FCE2FDE8CB8F62AF3D4D7DF021FDD1A7CC279F739E99E5BDB028786555F8DA1A02D07F9D2A4BCF46A7A0FC7736F1F7DF465C7B1A77F775A5B557975F4C9D1352D2BF956FCB0E41F68DB17283F24EFC645BF0DA2CF3E987A47B2F71B79E27DD7983BBFE0A7BF959D465A3986B2FE26EBD86DA0E2B0A298F3F67BFB6C67F7601D64BADBC48B63E958E0195EE21B657EEED905D2784A192E7137A71F30E99401C191884D7C5AF7107CAFF02F76A7C451BA5B9B3AE2D2532E1DCC153424C3CDCD4AC4A4BE5E2EC7DDAD3098DB1B9D5A129E339D59DD8BC4AD7E8A9D4F239D9E7E38ECDF81277BDF5AA80FBC60DD0DC7F1877001D705751539EC37DDDFAB5988518F01D9AFB0A49F17DFB7FF3F276ABADA91CE8EF9A9E1E1B1F1BECEF696D6FA96D6DACEA68A1F475350EF7B7F576B440C06B487F57DB4077FB604F0704AC07F147077A867A3BE14BE07B47737D7B535D5D7539CCE125016E5C909DF1F9C3DBAD06FAE0FB020C868599515C5C1C5AB6A6A6B6A6960E04D9E365C3ACECFF21EE003A8ABB8A8ACA3CDC9998980E1C38909191813E3BFAFBFBA1F4A04F969F337EE1FE0F8FC9C9D9CC1C1978721AFE39C7C64179774BCBD7376FEFD1DE20C3CD2BCEC8A22FB3EAC9F1D3016F8C9B42E29B7DB1B5EE61B51EE13DE1291329452349F96D11C93DB8ACFA8884C6A8A4F6F84C64B799EBF74FA9E86C1491945EC87478AD769CA9F344492D044C27852614FA465544248F95D6A538F91D54D69565443E52B85F51C7F7ADB93C33EF520CADF412D6F35A5B122DDD87732BC6F3C82DD13914BF84697CF37426652C81348E230D44164DA7D74CA7540F85E307C28BFB230AFBB0C5BD7125D0DC1B62F2AAA2B356D0722E63E6615B400DCD7DEB4683F8381CDCD7997C7B404F01DC61557478781896689107EB6B2A6B2915B3FBCCC0A4B6AAAE9EDCD04081DAD59D959A5D5D46EEEDE82B2D2695132AE04B7161D10ACB57F22DA25D4EC77A6DC7FE781B97B299CFA6165ABA97DBFB5558FB949BB995BCB7CF31FA9C74E715E01E76EE2EF6AA51ECF5E771375EC45C7B1679E971D8F907E1171E465D7E0213B888BBF932EBA909B47BA8EDC80E330E01E5662E0413C7E4C7EFFDCEDC0CBE782FF78D05D9CE1B39DDB69DF737D3ECEC0F951C96B92F3EE36E19A53C780D8E27DF87B5874731D71FC7DE781277F3295C1F7FFB59C29DE789775F455D7A1C77ED65D2ED77C9F73E4092EE7F4879F809646F700E6DF7892198BA112C3C0623D35BFD6389D65E8DC1B8A3EB34E4D9780531547BB5362485460C767476B4B456565795555592AA2BCBAAAA2B2AAB2B2B28551594998F02207F4698CFFE3D67AEA92521A928243595D791724ACC5F7C529294675FC8A0BA72DDA353D729F1F90D71F94D31F9ADB1051DD8822E6C616F74615F54E1700C7E048B8725647026B06207B837C4657FBA74579E5D487021BDD2B2953A6B957495D57FDBBE435F176847827E30752EDFC37DFBCE6D70515D530DBE0AFD1858E717E4A367A483FA2C2C2CB879F3267B7BDBCA8AD2AECED6DE9EF6D191FED1A15EC8D860376462B0732E638370E53782D6F9AF33D2DB3E3D393C3D31D4D7D9DCD9D2D058579D1C1F6B696ACCCBC301E1E7E3111111929696565656D6D7D7DFB66D9BBEDE864DBA1B366ED081E8E9EAFC2DEE7BF6ECD182D7355DDDDDBB776FDDBA157C5FB3668D9898187AC8B00F1F3E80E9F07480253C1D60A5167D76FC9CF10BF77F78A0A4FFC9F731C878425884A7B5F5830B17B7AB69282F13D794923EA8AD7B67CFC178639B5C73975227FF3ABFE8DE988CD1D4A2C1C4BCB6A894CEB80CA8ED4DD894C6D854525054D06BE3073B0FEC9651905CC060202A6773F57155546A4F0EA93D1D5F87CB2684E0CA2393874B6BE31DBCF729EAACA4E702DC0F28EB067CB4DEB14A693DBBA0D462E66D926BEDAE3FAD0C4D1CC82A1F4C233586A54F17D60F2610877084D178526F58FE74522564249200BE0F4616218731C011BAE24B9AE20AC831398A7CE22B398498318B5916D31CDAB32F3F3B07649F42765AF8F680E68E5678185058D0095C0394D755D77F493CA252450DE05E945B0CD777B7F55410919D6A48F8322F4737390131FE853432CCDC77F71C4DB6752BF78F223A07145B7B529C83910FFADBF84201277D72287A6D99FDD438FDE1FB79B883EC11171F01EEE8127087520FAF079566EEE866994A0BE473AAE9CF8C432EDD8FBCFEA4F0830DC5DE671EE85FA6CCC4A1D6D613966077E8F9DBD1571F82E69197EF875DB8137EF16EC4A57B308FBAF200AE9FE1FE698E9169FE4B6BFC3B07C20727FC07474889B10B985EE318D4E011818717274B8FEED0247881C75B7A547A86ED97539265E6145C487D507F535244544F5B1BAC08565401EB7FC27D8E72987C8D7B1D895255585687AFCA8E497D76ED818C8038D742C62D8A3A160FDED4271436E30ADBE20A3BE28ABA638A7A62E01FBA78085B0CB27F89FBEC079E71F896C47CE3CBF756B1F0F3636855C465A0B96F5052DBB679CB8FE20EA0C3F5D0DCA1B303F1D0D3A1B0D3D2D32828ACDDB2C5E0F1E3873131D18D0D35FD7D5D43833D7F81FB0472CD9F584733CFF4DFD3DBD55C3BDCD336D6DF39D48D347D68FDE4F2D2F4E4841D86066BE5E57879B8B838D9252525D5D5D5A17D233B00E9FE18EE00BA8E8E0EB47598C0CB0340BF76ED5A7E7EFE850B17C26A81A9A929FAC15428375071BEB9F7C1FF6EFCC2FD1F1E08E6535FF93E3E5E575E519C9915E2E1F1E6FEFD6386DBB46457C90B8BAEE6E27F7BF4ACE71DA34C4B979AA01800BD3B3EAB39328912888565674216D4F6DAA8C4EA085C9E4780F3DDA797376E5F49C5B28A8EFBA49A81FF1BF3CAE8D49EBC3248352EB32C3A65905883B571DFB9565D828E438A81EB88A6419899E3AB53970F2A6AACA2E3849C56DB18F0DCB8019B395D54D397889FCEAFED88CC81B5EF89A4F2CED09CD138C2647CD9681411F13DAA7830A66430BEB42791D8125F541397B74771C37A112926CC224E5AC66B672F502AAB00F7AECEF6D9BBFDD580C731980E03265F1696B6C6F696FAD6C69A26201E8189540D94433A9A3B610E15BEB5A10D8887D780F4A48CD70F9F2D63E6125840A322B0ECCDF14B190E5E24EF7082933FC9CEB7CE1939A75D936350934320B2938C9527C5CCADD2D425E3B13174F36C2353403CF50194E57729F7DFA73DFC9878E74DD2DDB730C97B6101CDBDCADC836CE95565897C54B5C2CA35F78D59CC6DA38407AF0826F6754EBE350EE0B8E73753F2C1BAD2DC99F0D1067007D0417014F76FD5F617D0DC49C6CE95669E35D67E35B6FE141B6459631F08BF3CD93E80EC1404B5BDD4C61B6A7B837714E09E67E56EB85C76051DB30835FDE99DBF65C4E2DA1B1B29D564627919C8FE17B8A3BE7F897B4D495559163ED8C9E7D4F68382B41C024BD84E6F3B1869EBDD9C54D29E5002AFD93DB892FE38C2E0CC414647638923D812C8F04C902314CD9CAF0370EFCE20985EBB2FCBCCCD8BA1525D21BD49594D474919D96A0110CE388E28F845BE873BFA262AF477F07DA58C14C8CEC8CCC0CEC976E6CC2933D3CFA929491472557757DBE8C8C0D4F8D0F848FF2CD988ECB3B84F0ECCE2FECD4C0DF77E3303ED4D439D4DA37D1D701B58427FEF696FEEED6A75B2B33E73E2A8F8725166263A3151615515251D6D4D3555E51FC57D03DC573DBDCD9B3703F1AAAAAA50E1D7AF5FCFC2C2B278F1E2D5AB573B3838A0FBB603EE5077E0E9803E0B7ECEF885FB3F39A6A6A74727918C4F4C41266632393E0197C7068606DA3B6A4965096161C646467B376D92E0E165C160B6C9ADBDB77D9FDFB377459E41E4701C2534AEC23F92E815521D84ED49C9EB492FA8894EACC126D5C5A7253BB89B5EBAA5CA252A86A15BC72A7877D7D1582BB7E68CE24102A529A3B80C9BDA47208759386D91555C4ECD2ACDC47352775B8CBD7BACADDB9B53173708498A6296AC67E6BBBFED609A8DF750266924B362BAA0B635226B30A1643A9D0CB843659BC0958E6349E0FB70347E28963094401A482275249634C4173E3A74DE505E9D630135373DF383EBB75AEA1AA6A7266B6BC8B3F7FCAB01A0A3BEA3CD7DAEB3F4770DF4C253ACA50B8807C1A1B357965601EECD752D4DB5CD28FA30812F05F9069F3B7C926F11FD522AC6EDD20AF6379FE4BB05947A84101C7CAB9D83AAED90037B217BC53806B5380542DA1C039B1D03C8BFBF890A765798BA81ADE89BABF8777610E8EC7011BE847E88A9D6CEA7C6D6BBDAD6036F6C9B66F421EBE56780BEC1C5FF2F70A758BB3739F941792F7A6B91F9F443DE4B93FC57A659461F0BDF9843E0CAE27796F8F756F01A002F00C44FC88F03DCC9D6BE203B2CABAC7D8175E438EFCEC1550E01958E0114D7907AAFC8469FE8525B9F9857A6EABCA2C28B699733B3DD3C79AA303DA3A9AEB6B4B4B484540AB213C97F853B04BD06648734936AF3E2D2CD9EBCD3915366C3D048B20B1B9DBB5D1291DA9E4CEC4E24F6251007124A87E34B47E05F1C876C979BC31D7951FF02F781DC72CB5B8F57B1F2F26016AB88AF345051D75AAFA8A5A6FAA3B86BE9681A6EDBB26DC7D6F54A0A1C5CECD4B44B0484F861EEEAE2545C543038D037D0DFDBDBD331310E148E8D0DF77D13F719DFFF00FDCBCC337D2ED3A37DF05DD3237DD31343807B5B7D75674BC3F4D8501589E0686BB5D5405F809F1BFAFB4A29092545057535951FC51D4087DA6E6868A8A2A2029D1DA0575252A2A1A159B264899A9A9A9F9F1F0A3AFA6E2AACB9A2CF829F337EE1FE4F0E14F79119DF51E2FFF07D12FAFCC4E4C0607335392E34ECF99D7B06AAAA925C3C028B96E82C93BCBBF790D78B77A9F6EEC53E21E541D1948878A25F78674A6E5F66517D6C4A7D5C6A67566165547CA499ED11E50DB2745CA218DA2D2B15607D393F20BABBA0BCABA0BC2236BDBBB832C0D8464762B5F062466956BE73867B923C032AE252833E595CD0DFBA8A9E7D19867ADBF2D5B6971FE03D427B928AA6F3C99DD8BCB1D4B2E99C9A9EC8DCA1D892311C71220629EF80FB480C019EFC807B6712A129B1D8FD85C9B9ADFB4518D979E9986F9CBD584D2A9F1819265757CEDEF36F8DA9A929147774FB0C4AFCD820D4B2D1C19E21F463F1603A385E5B55076D1DC487E60ED003EE247C99D927F35D1BB7726296406D3CAFB335F48D39C12B14EFE45F62EBDDE011516EE1857C82DFDAA7C1CEBFD521A0DD29A8D325A4DD35A4D53904DDFDB1C539A4D121B0CED60FFD40134CD07D666A6D7CD1E313401A1CFD0177209B64EE54F0DE1288A7D87B01EEB0FC12F42FD3E212D0E515D6E1115263E35161E644B67283949B3AA213A01FDDCFBDCECEAB1EF9D8AA1FC9C4A5C2DC137E554885A537045E966A1C83EADDC32BEDFD1BBDA39AFD62286EA14DBE5892A3BFD78D27AB183978318B6578F95FDFB95B598CAFA7900B0B0BFF0277301DDD043F0FF7B68A069C7FE48D23E757728A7262E874562ADA3F33AE4BC5772413616DAC3FB114C57D341E917DE2FBB80FE697D9DD375ACF23C48759BC7EE972E8A56AF26BD495D7EBEB69EBEA23D1D9F8A77C0FF72D5B376FDD6EA8A9AD212C2A4445BD189A3B5C79EDC655424931B00E456164A0BFA7A3756264707A727474A06762A017C90CDC28EB7F9DE9A1EEEF65B4A775A2BF637A7C60ACBF1370EF69AD9F9E1C1EE9EFCECD4A7DF5EC89969A321F173B0F07ABF44A492D4DF51FC55D5959196DEE3059B3660DDADCA9A9A9C177030383989818F45900B8C372E8D7E107FEBF3B00F7B1A9E9D12964896E9CF9D3F619F83294D9BEFE1A52595440E09BC78F2E1E3E0CE55D949E515B62E5E5ADBBCC6FDE8B36B32D0D8A6A4FC9290D8C6C8A4B8349637C7A4B5256577651634A564948B4F1855BDBA515C5A958E4D9048F6918B83EFB581997D183AFAAC06574155578BE3757135B29B0804E868DFFF2AE4359811135C99939BE2176779F1C58AF2E4BC3AEC0C47B5E63B3CDA5FB452E21832925BDB8A2F1B4F2E9CCEABEE8FCB10412E00ECD7D2C92301C593C04E51D4704DCBB9308CD49F84CCFF0D797EECA0B2DE75C42BFCF7047624C5C4F477B7353C3EC3DFFCEF8B2BFA36372049EC7B0E63D313A3036D43BDCD7D9DFDDD603AC579791610EB59D504804EB93E2926F5CBEA9AFAACD8BA1511358FEFCD0D9747BEF0ABFA87C6B4FBCA5478B0F162A30C5CAB7CEC617706FB1F787DA0EBEB7B90437DA07A01F5F02C1C17128E928E8AD2EA128F110E8FB3007F411D96DDCA1B94361279A3A945BBAD43AFAD439F9C235F34C9F4BA3A36F9B5B1004EC06C7017148B5A52B2A3BFA09D5DF65F701DCC9D6DE35B6C8410E20E89126EBE055C72D1C5E9F900D3201719D2189D0D9A1BC973AF8191F3ABB62313D176601306AF3FE7D533519D68D72F2724BCA4920FB7F8E7B7D29A5A9B4C6D7C6ED37CDCD024BD8C499F84F1B1E08B7F56ACA20762412660F2E8423C2BFEF70DCECA9D5BF877B5F0ED1E5E96BEDA592428B68560B0AABC8C828C9C96AA828FE28EEBB76EF4437C83032333030D12B28AEBBFFF09E5F806F5F6FF7D8E8301485FEEEAEDECEB6D1C13E60FE1FC4BDBB89D2515FD5D75A07B781220FE57D72A8677A6A6462B8BFB98E1C191A74E9DCE9952B96B132D289080B2A2BADFF51DC353434B4670E190613605D5353535E5E9E818181969676CF9E3DE8AE32C3C3C3E8AE32E89BAB3F6DFCC2FD9F1C48739F9A392CF09F8907DC27C6C6A7908C4E8D8C0C7775D757546626C647FAFB69C9AF59232222C1C6A1202872404DEBF5998B9126D68480084A544255781C3932BE2921A3333DBF23B3A0392DA73E2933CECEFDDEDE136A022B24A8D9D6738BDDDE7D2CCD23183A7B657C665B6199EBEBCF4A422B7830D432EC02D7F71E2B088FC587C790A27119EE7E9F2E5CDF2C2E2B47CDA2CDB3EC84828EFBCD17F521C93D7185438984D144626F74FE544AE5681C613C8A381A5132185E381059843CC313885D8925D0DC6B12F25CDF98E9AE5ACF8CA152925DE36065D3504381B5E9D97BFED58087320C901D1D309FC37D6A741A0DCC278627A1CB03F4948A9AE1BE11E8EF45B9C550DE3D5DBC7EDBB65B7B9D2AAC85184ACADB5E7F54EA175D13149B6DEE5A64EED6E58F438EAE6E1708B237D9CE1CCFDDCE0FD2E4E00FDC83DAC037208E6C5537F7A89ED950837E4815DD5C031721707DB9994B95956B95AD5BA58D6B85B54BB59D7B9DB34F8DA357B99533D9DEE39B01D041ED26273FE01B10470F2903B283EF73C4CFF95E6FEF4BB1410E105FEF809CE5630EF726F7885AD7D0021367C0BD233821CBD8A1CC29A0C0C2EDCE866DC2182A760C46435AD6C7CEAEB7A51570CFCAC946365C7D813B38FEB7B8930BCA2C5F1AAB49AEE55EC0A8B67CCDFB6B8F33FD63EA53F16DF1F8EE58424F2CA13766F6E071A3D8522451C8EEB0C358E41A087CA92F96881CD23DBDC8EBD54743D9B54B69185772F3AE5EBA74DD4A296D75951FC57DC7AEEDCAAA4A3C7CDC3474D44B978B9D3E7B2A20C8BFB48C383E36D2DDD5D1D1D23CD0D33D36D43FDCDF33DCD785ECCC3E83FBE400C83E8BFB543F1274FE75E6993E97FED69ABE164A6F4BED4877CBF448EFF4C4E0F4F820F80E3FA5B7A3A5282FDBE4E33B7D1D4D011E4E5E1EAE15E2CB7E14777D7D7D5555552D2D2D9880ECD0DF656464383838E8E8E88E1C3952545404CF0530BDAFAF0F9E023D3D3DE8B3E3E78C5FB8FF93635E7347659FC57D62626C6474746468727404F9FCEAC0406773735D75C5935B3777EAEB2EE5E4605FB4488A8B7B8F9AE6DB8B57FDDE7FAE4FCAC00746E0FDC21A1352FB72F0ED99B94D29196DE97995D1C916379FEC905182F22E8AA1DFAFB421C2C2193A3BE0DE9E4F7279FE51817F190F66892C87E0ADFD27085109E91EFE94D8E45A5C5AC807F353AABAAB96B0C82C60D2E6107DB6F304DE2DAC23260F7CEF8E2DE88CCA9D48AF1A8A45EADB5044517F787E6F64417F4C711FAE04706F4D28ECCE2D0FB774DDA1ACCD885928CE27F4E6C9B36A120939C407DCE76F0D580F1D1C1C1C191981FB8ACA3E0AF77E646474786C7C7462721C5AFDCCDF0B59A7415243AE1F191A05DC0BB2F38905440B63336D156DAD354ACBA999F7AF56F67AF4B6363CA13E18976DE25C6CEADA1B90D0E4881C5E1191DDDAAFD1CAB7C1CAABC1D2A7DECAA76966930B500EFD1DDD1403B51DB86F710E8125C2BD851B885F69EE5A6EEA5C6AEC5069E9526DED06810A5F6B8F9CA7A9C6CEB3DCDC0996F33A3B1A8AAD47BD23823BDC12964D2EFED0E5E1C6803E7C0961DD61A6B3CF7CB5D129A0C2DCBDCAD2BBDACA079695165E10A4C83B0693ED03B2DFD936FB625BFC63135F9917D978667E7638B94E830FB3901583D15EB32EC8CD034A00BC82666565A17BCB4090DA5E594D2EAFA69457D79210E241F6B22A4A45E52CF1803B5C0FB893328A3EDC7DBE9A579C0743BF535EDBF3954569547A437C617B6C511716DF832DE98B2EE98F2E198A2640904381CEE03ECF7768EE6D4905FE6F3FEF59A72E41CF22C5CA2DCB2FA8B0426A9386BAC1064010795B554F1F7AEBEFCBDF839EB11AF2BB899A86869BE5564B3332D3D131502B2AAF7BFDF645766E464767CBE8C840632DB981523536D8373D350EE60E76B64D0F0F20B2F7FF03B803E5D323DD63BD6DC35DCDC8C5A9A1F181AEB6FAEA81EE76C0BD9C887773B23F72602F94772E4E766E2E0EB847C89DD29D91FD8FDFFF0FD9E7E16E6868A8A8A8A8A6A60613E8EF0A0A0A9292927C7C7C80FBC993278944223C177A67063C0BBABABAD067C7CF19BF70FF870778F565BE31FEF4E5C9DE9EAED090005837545752E06765A1C36096B3B3EF54554FF0F02C0A8BC8F60D48B477CCF3F4AB088DAC898E6B4BCDCA74F32BF48FF432FAB05356712535EB6629F9FBFB8EBF3977AD3C3685844DB27DF05C9A896B0D87C0521A66CBBB4F232C1DEB62534BFD23F25CFD526D5C5DEF185DD2DAACCF2BAEC2C8A744C7775D7B67AAB9FB445ED534BEB11357D8109ED189CDEB8F291C88298425A437B610A11F57D8119F3F5A44CEF20EBBBBFFE40A16646F77432DDD306FFFB1812178C59A9C9C1C9A193001D0E1718CDED1BF1DE8DF606266D9D8D4D2DADA8A1E0FAA341F7FF3DCA5157CA2EC18AAD54C9CE6E7AEE33D824B3D822BDC821B7DA29BDD22EA6C031AED829033565BFAB75805B45A06B459FBC3BCC1D2AFCEDA1FD923E54F410EED8B1C601D8D83F7ECD201F9F05195996BEE3393F89BCF53EEBDC1BFB7A1587BA2079884D23DF72D350E7F04251EA5FFCB25FCDF6A66FE9F7F5EC2B7CC6E9381F58C26DBD9136DC3A4D6CA8FF0C9B9C337B6139ABB896396858BD7ADA79A3C7097172DE5E6BD77F93A213BBF85524728282ACECDAF282595134B2130A92A2D239755D49655D69593AB2BC9E4FAA6B482C23C42694D630B7C3D272B1F701F691F70F968BD43498F1F432FC72868B4FF625970F2701EA5312AA737AE64308E80BC5B1EFBC799D6D173A9CF9ECE6566133C3A1FC21106B3CB6A62D3833F589FD5DBB69A55407021AD300DCB52267651260E51560EB9A52B3415D6ABAC59B76A8584BAA2F2C1DDBB8F1CD80F39B877CF0EC32DDA5A6A8AEBE5D7AD5DB54E61959AAA221F3FE782851841219E0B974F2524637BFADBA6A747C60667109FCBACE648A6FAFFFFCF9F5E00D08D3CF0B2013FB4BDA90EF980EBD438BCB4D8D95A2BAC935F80C15053532D5B26067C6FD9BA195DF3D0D2D154D754433ED1B4414B53F71BD1D0D000D3B76CD9B26AD52A797979809E8D8D8D9E9E9E9B9B3B3030101EE4C3C3C3F0C08672833EE67FE6F885FBBF3C46C686D333D33E9B7C3877F6A4EAFAB5DCCC8CC2AC2C9AB2B2B78E1EB17AF438C8C424C5C5B53A2AA63921A5312EBE253115B0AE8A4A8E3675B8BDEDC00611294D01F19DAB958FAAEB6778061505631D9FBC96E71090E71494A063B37FFC2ACAD28114184DF40E2D760FCC71F08A786DFAF1C8F9A3ABD5A1B9CB6158F64B29BBDE785E179E3A914F194827B5C5E5B7C7E6F7C4E5F7C6FE29704D677CFE485E656948BCE9B5876A622B3931D4EA32F28EA6966DB50D93E3C85121A1A7C3BA27FADED17FF2AED11CEB1028F190B68EF68E8E8E99779EA77393D2CE1D3AB68C9D9703B3C860B98CFBEDA7249FB052B7A07230D733A2C139140447CE586D1DD062E10F69B70A6CB30A04E21BADFC6B6D026A20DFC37DC6DCDF836C39A93475C97D629270FD45EA9DB7F8B7B6144B2F74AB3DD47CC8CC3181FFF409D599BDDD11CDE70534FF5610DC6BD02D4833B2B75ACFFCAAD68175E63E55A69E3DFEF1ADFEB108EE56AE2E371E29720BB1601649088B3DB97D8F9857D84CAE2DCD2F8249358154892742AA4A4A614E2696D5902A20551595E5F50D39656525144A55435331B1ACB89000B8B796D7BFBEF6484F4A5104C3A4C5276D72FA5E4D68FA446E4D7B64DE00AC9CC510D0CCE10E8E7F89FB641C093D57D7701CA123BEB02E2633D9DEE7FD991BFBD769A9F08B4B33F1882C615E4ACB2640CD24C2C82EC9272C27B25C564C5C594E7E93A68EDADA759ACACABA1A1A104D552575E5F56AAAEB3535949595D6F270B32D5A8C9194127BF8E4666E41EAC070C7F4F42068FB95C8FF64BEC61DDD0FA7BBAD697A7C18706F6DACF3F470839E4E4F47434B4B2D2226ACAEA3B169AB01FA2955E05B554B4D67E3862F41FFB2B9EBCF1C350C7D435555551570676565E5E0E058BA74697878383CD401F7B6B636785EA08FFC9F397EE1FE2F8FA9E9C9DAFA9AF48C646F2FB72BE7CFC82C15E3A5A793E4E696E5E23AA4A1F5F1D2D5386BFB7A5C626B521A39024B0E8FED4C2FA888484C73F2F57CFAFEDA963D1AFCCBD730F1A8F12E75357A1767E7EEF4F48D32FF5268EE520C1CAE2F3E445AD86739F910BC42C0F73C279F0C1B77F0FDCDFE537B25D7AEC4D0A9310B5CD1D816F6C2BC293A7B38ABA23FADB427110F9AF77F1114F76E5CFE6046695B72618CA5EB711D43BE45F42B38F81E5EBA9E9D9082EC0534B3551156392766F6771C1D45BAFCCC9DFBEEF81AF79E3E64D5757A7C62A8A72FD22FE8B78D5BF8E958783054370C77C77CB0AC9AF9606AA9831FC53504398097B55FF34C73473ABB5560BB7550874D302CE11AC09D6C0B41CE96371B3B1079AE7A7F21AFA317105F61E29CF5F053DC15A394DB6F8ADFD8549B7BD4D9FAA1B8A3B2FF83B8A3CD1D6487D4987AC1CA476F4042AD4778A6A953BA958BD5C55BEB38F801F7D52B65DEBF7C5D5A84AFAB22130B8B61524924918A4BCAF0044805A1142E427FAF2621675525526A88F5F5D5ADADA5E49A82C292B2D2CA2A7C451636E590DECED59C4BA568780E2B6CF479F8B9199B379E43E9C2160EC6948C02EB3301D0D180E3E331C81202B2A3B84FC5948ECEE0DE9D41684CCCCBF60CF57F636E72EDE1EDBDC70FEB6CD1149793E111E6A761E2A2661065E396141495125E2A2E2822212C222729A9B26E9D8E9A9A9EB6C6C60D5A5B366DD86EB8517E8D0C1B2B032DDD420D4D455B07534A1D6974A2777C1C79CB741EC7FF6CBE87FB506FE7F414722CC99E8ED6186CD4F1634704F8791919E9F905F9943554F4B76C04B8C17458AA69ABC304C487686CD0847CE9FBA64D9B5454547474743435356109FD9D8686066A3B5C89C3E1E0A10EB8777676A24F0D683F330FFF9F347EE1FE2F8F89A9F1FEC1BEDE9E8EAA32A2C5E78F2AAB57B12E5AC44D45C585C1280B0A9FD6DD687BFB7E86B35BB1B77F91BB4F7950647D5C5A8E4770868B7FAE6788EBC3D7BFAD5296A1655FC7CA7F67F7119BBB4666371F2AF189C93071ADA065757FF529D4C43AC5D695E41B5EE61701CD3DCFC9B7D83D28E4F9A7A73B0EA9B308AE59CCAAC92A7A6FD37EDC2767F01DCA3B7224A93FE38EFA0EB8F726178F1591C9D8F437676F4832F34079DFA7BBD9D9DC7A6A0CA924232323F00846D73D61FED7E51D95FD4BDC6139881CA460687274ACB5A6DEC1C44263D53AEEC574A2344C4EF79FC16A4743583CC93DB8CC29A0DA3908BCAEB5F147716FB1427007D93BEC42DA6D91C3A6436DFF21DCCB3F3B65DCFF1073E949D21D04F74A53B71A6B1F647BFD3764FFEF71AFB3FF13EEB0249B7A76B8477507C4973BF8675BBA269939BC3D7C66152B37CB82C59ACAAA0E56362038B9AC026407CD8172C01DF5BDBC8438E73BE05E545601B2D777761594966565E75791AA0BD2F21C3F59AF15901459CCA6C22BF9ECC0A5144BDF8EB8A2B18CAADED8E2612C82FB1816C11D4047F317B83763733AD3F03D39A48E2C426B7A714D526E7E704C849DFBB9AD7BB7AC5797E21604DC0518D996F30A0AB271312E5C22C6CB27B56C99E29A355A2A2A7A5AEAC0A3A181EE8EAD9BA42497313250B373301C3EB2272E3EAC6FB06D7CAA7F6808F96CD13C8EFFD97C0FF789E17E04F789D1A1BEEEE2A28267464F56AF92656666E4E4E658A7ACB061932E080EA6437907D3E1E21CEE73B2C397904D371B36C8CACA2A292981EC7A7A7A2B56ACC06030D0DCF7EFDF9F9D9D0D8F767854F7F4F4A075E717EEFF6F8DDEFE9EA191C1E9E9C9EEF636271B1BC09D0983E15CB0508C96419A995D8957E0A88A86F1E98B5E0F9F2799DBD446C55787C767B9F81778855262D2126D3D6E6CD9ABCA23A6C026B06395D2E52DBBEFEF3B2ECF21B08286456C11BDFBCB8FC11FCD331D3CAB0223CBFDC2326D5C72EC3D2B03A2F21D7DFD1FBEB9A0BC710387980C86DE804FE2F59E3309C64EF5E1A923E9A5A0F940CC1F417D47CBFB34B161B8A0CAE78D99CE72390E0C95F272E9EB27CEF676CEBE4784EEEC051368EE7FB1CBD73CD9E7323C3A323A3C323630545158F2EACE43697E51AE45B46B7945D21C3CEB23135BA292ABBCC2299EE1751EE16065A343709D35B285BDD1DCB7C9C20F886FB246B6C9D45BF9FD28EE65264E29F7DE455E7C947C17D92C5331837B8B73C83CD9298E687E1877F8AE79B8A3A934F1E8F6896DF48C2CB6F6CCB3F30C7F6B7A63D30E59664EC07DBBC196605FFF9A8A2A401C40A7945782E3686D4765878B50DB81FECAF28A4298B4B501EEF9786266462E095F161B1C7DFBD415FE452CC218E6BD6B747C8DCC2A039200F7FE44625F1C7E045B02B24F4423BE4F628968C0717409998E2541D039E05E179E5E8BCDA0C464D4E0B2C0F73E7C754346517E38EECC96DD80BB0C9F080F2D133F03EB526EFE65BC82C21C3C0C8B167332300A73712F1716965C262A27B562DD1A1915457921411E7A3AAA65CB041E3FB953565138353D383601AB6ACDFF16EEC8B1242747C787074607FB5A9A1BDD5C9D37E86831313130B130AE965FA53D73AE57F4900930D1DFA4078EA33B0241E07AB8060DE02E2727A7AAAAAAAFAF6F606020252505B87372723E78F0A0B4B4141EF0838383030303C03ABA5B30FA2CF839E317EEFFF268EB681D18E89B9E9A68AEAF337BF77EF50A09B6858B96B3B26F915758CF2724B6907A3523EB3EB975B70D76B8DF7908CD9D1C914008882E0D8A21472567BA06985CB87D60AD8606FF7275BE65BACB64F62B6AC932728953330B63683CA0B91B5B167906550644947A07E7D8BBE7397A97F986133D43D32D5DED2FDEBFA8B24995816F3D35E71E7185B7FBCE81EF4DE169F370477D87F2DE1597378DAF9B2CA94D72F039A16DB89C8E5D928D4F77AD72514E1E5AD861894EFE7AB3FB3765876B60ED75646878B0BB372F391D5E334418D905699837AF5A5F198EEB4CC86A8D4EA90B88690F4D6C0FC435B986B77B44D5DB0400E5F516BE10501E0213B2B9F70FE10ECB0A331714F7D4FBEF4BDEDB03EEC84EF16E61DF921DC57D3EEB68FEF47FFE237FE03EEF0DD52A73AF762F6CB9BD5FAEB94BA18B9FC7C3177BD728C9B070322FA23AB2EF400A2EA191520BB51D70AFAFA600E550D5E7B6C600EB403F845C555D4EAEAD696BAF6BEB20945516E4E34BF24ABC6CDDF6EB6EE7C6D049D2F2DCDE7EBCC03DAA3301DF1A99DB1E99D71F533C1A5D02B2A3F94F701FC9AEECCE203424E4D6C667B765E09B33F1B981D1DE9FAC5444A5A4B985E09F0970878871F1A9CBAF3FB06D172B0D2D1B2D1D84859A86817A31331D350F3BB3B00037072B03E0AEA8B8CAC1C1A2A3AB1E1A6DDF406B6767FD3FF4C6E977F35DDCC78791CF4D757700EE63A3C3F1B8D85D3BB7D3D3219F2D95965DA9A1A5AEA9AD01884300FA8D06FADF0BB475A8EDDA3343575777CD9A35B4B4B43C3C3C363636F5F5703711DCE1B10D13785EA0EDE7A78D5FB8FFCBA3B3B3B3AFAF6F686090588C7F7CEBF60A7E417E7A068D9532E6F71E9FDBB4751D1B8FD4423A45664E5D3ED1ABDA9BFC1EBFC47B879605614B83A2F33C02339CBC234D6CDE9FBE7C58594B894B508A9A494368F94A3A56882886DAE7DD67ACA57D997F58A9A77F89AB1FC933A8DC3BA4D423B0C0C13BDBDA2DD5D4D1FAF4F51372EA9A8C022A34DCFBC5D7591CBF9669E6F625EE43D82F708FC91DCBA918CDAFCAF78E303A7A414D5872292DDB72361E675BFB9A9A1AB823232323E8C7F060A0CA7F737C0F7728FB230383FD6D9DA9D171A776EDE75DC2B08285E7A4AE615342664F722EE0DE1A9E341C9F3B189DD1E11BDBEB876B778968770A6B730C6D750881B420BB4506D621AC0754DB41FCFF88BD2F045C9E89F71F714270AFB2704BBEFF26F2F2C3B447EF4B8D1DE062AD9D4F07AC22FCBE93CCEFDFE85BED842CE7993E973F9B3E17F8963FE18E065A7CB5954FA35B78AEB163A6A913C12BC4E2D22D4DC1A552AC08EEE74F9F29C8C96D6968C41714924A088DB5755565E5D5E5151032B2CF63556D35B98E4CA9A7D4D4526A9A3BBAEBDB3B9BDABBEA1B5AAA2B6BF0B9789B0F169BD76B0B2D6655E29530BDF0A82DBE7834ABBA2E28AD3E20B52FAA703CAA64328A80662A9A88661A3B8BFB979B6520C37184897CCA507E654F0EA927AFAC37BFBC0C9BEA64F4FE94C12E9125CC02D44C62CC9C4B397801774156CEBD5BB6DB7D36BF7CF2D4897DFBB7E86C582329C5CFCE0AB833D32D6167A1A7A35EC844BF64D326ADF070FFD1D1EEF1F1DEB68EDAB6B69A7F0BF7A9D1C1E1BEAEF6E686E1FE1E586F2E2ACC3F7CE800F592C58B162D90945CA1AEAEAAA9A9BE71A31E64C3066D0303E8F05FEC19A9A3A5ADADA9A5A50151535303DC555454242424A4A5A557AE5C09B8B3B0B0040707777474C0031E7087755998C093E217EEFF6F0D907DA0AFBFB7B32B2B25EDEAA973221C5C4BD9B976AA6BE2A371F68F9EEF91575ACFCCBD8A8A69056681060BCF4DDD6D3853FB22AF907CCFA05833FB547B0F626014D6C4F6D9A153AADCC2829805F22CDC20FB6A16EE658BE8023F9A273AB8550446143A79143979D706631BC3710437FF3433C71413FB528F9030A38F4F361F30E4935C856150A3E3BDADBD23F0DE5BA07C5E799FC37D208DD0974124F8C7985E7BB84556518C9A850D4375EFC6ADACAC2C78E0C21D814733FA50FE8B07F1F770EFEDEE19EAEBEF696E8B0F8D3CBA6527F7425A394EA11BBB0EB627E702EE2D51C99DD1695369F88984FCDEA0C4C1A0A401FF847E1F5CAF576C8F674CAF07B6CB3DBAC335B2D525FCC77077F4AAB2744F79F016704F7FFC81F4D911391DABBD6F874FE497AC4340F6D9D8CF671DCD57ACA381EFF5A738CCE28E6E994171A7D8F8519C8353DE5AC13F07D12FFCFDE94BAB59B924D9B99816535DBD78A9145FD2D6D45C9C5F00B837D73700EE607A4D55F51CEB0D35B5803E8CFEE131F0BDB5B3A7B3ABAFADB19D9083B77869BC718DFA0A7A5EBD656BDD1F7C1CC9A54CE7D5517C93289EF1FD910580FBF457B803EB803B0AFABC5D21AB0213C991A98D89799DD9C48E2C428A5BE0F55D87C51938E1A57D1933D76AA165F2CB24F919587919594FEE3B941881AD2E2164C627385A585E3A794A53516199001F1F1B33371B131506C3C248B367D796A424ECD4D4C0D050476363657B0BE5DFC21D6AFB40777B531D650839E1CC647959E9F16347162DC4C058B162B99A9ACA3CDC817B085CAFAAAAACACACA8A4B45E515161FDFA75B2B2B2727272C03A3D3D3D3333B38080C082050B162E5C88C3E1D07D82D1C60313785EFC45E9F95F8C5FB8FFCB637C74626860786C70F4E3EBB72AABD6AEE0E1E7A1A2BDB2F77043665E4D6246B64780D39D2797B5376FE25FBE968A5912B3F8F01AD57B5BF7F919BD87FEDE84CB28F18F48B07286FE7E41D750537099E412460576BE8DCBA5F7AC537D7AE474D8278B42376FBCAB27DED5BBC4CD074270F705DF2124CF902227DF141307D3A317B7094AAEC130AC5FCCAE4CC5E97EE969EA47E7AEC8ACE93CCA547A59477846837F424360522FAEA037B9981299DA994968CB263C3976419C9E4379858CBC8C9C8989497737724AA6A9A929E8EF7FFDAED137658774B4B54F4F4E77D4363EBF794F8896851B4373CE700FD6DAA5312EBD2D2EBD2336BD27367320366B24367B2226671A9B33169A06190D491D094E19094C1E0C4884F40724D43A85909D82AB1D0391C372D9FB57D8F995DB7A432A1D90D4BAF9573B7997583856397AD5BAF9E14D6D099FEC13EFBE8ABCF228FDC94790BDDEC1AFC1D1BFDE390039F0AF0312F41B2BECBDD054DABA57D97C235F424FB1F782A0B857D87855D9FA01EE4D8E21ADB0AAE11C0E69710EEBF6C3159BBBE59839937CC292AC9D6FFDB67F0D272F0766211B2D9DB3A353677B477D6D5D5343637363535D4D6D7F6FDFEC9F695E808CC9E9BAE6B6BAFA66B8383138E162E9A826AD20B09875050DB7C555A3665C616F4A697B645E4B68567B68F6405421B2E1053B1B74DB0B5AD8A75329E89E33D3A9E4A9C48ABEF082A168FC744E6D6B7C41671A7EA0A0B22E21C7C3E8E3F6552AA28B18B9314BE0A5F784E16F61CE9E170E1E03DCD996D0C92E5DE1E7EC5E598C2F2B28C485855F3A7152909D8D93915E8C8F9B89968A7A2146908FF3DCE92379D929D353D000BABBBA1A8607DAFFD7B87FF98126F45062E8D180877A3B91C9C8606F67DBC8F0E0F4D4848BB32313233D03031D13138382C2DA8307F703EB6BD6AC02C7A1CBEFDDBB7BC78E6DFAFABA20BBB4B494B0B02027273B0B0BD3A2458BA8A8A8E8E8E8A0AD73717101EEA2A2A24B972E8527C237C7CC93E0278D5FB8FFCB63626C727460646C60E4E30B0477297E116106B6BBC7CEB4E4E01BD3728921D8C80F9666A7AEDCD031DC27BE7A03A7B00687D02E49F9473B0F81EFA9B6EED9CEBE055EC16521312F0E9E3AAEBA4147485C995B484360E91E79E5E7C7CF857E349F873BE2FB0CEE043764FB4C96959BF7ED673734B7EC1491D661115E8D61BCADB9D3FAC4AD1C4BEF81C4E2E99CEAA1447C1BF81E9CDC9F543C904EAC8D4E6F49296CCD2A31BBF54455544A495C5A426CD9D3A74F29140A7A77262727D1F78ED08BF3062AD2D7B8C3E8EEEC9A1E9BA82A22DC3C718E8F8A41988AE9E6EEA3C98EDE4D33B877C5667C89FB2416F17D3A3A673A2A7B322273223C632C3C7D340C391B6DA36714A4C123A2DE3DBCCE2DACC625A4C62588E21C38873BB0FE07EE2676856FADE26FBF8880E63E837BADA31F1267FF7AD74048AD1B921AD70008D9C59FE2E2DFEC19DCE2F18D54DB7ACCE50BE27D90F506BB99BD211D821A1D829B1D42208D4E219D3EB14580BB856BA94F588C85FD956DBFC9B073B16230126262E1A1611363E3B02A33D83F0041FE329353B37FBB79999E86E6DED2D1DDD1DE333531DD5CD3FCEED12B796129C1452C1AC2B2EE8F8C3B124B0652CBBAB0851D61399DA13943D86254F339D9D1B60E251DF964F2CCA14047E349A38965C3F1A56349E51319D5807B557872BE7744F007EB3B3B8FACE716135E400FB5FDFCB67D96466F08C9990F2E5E1362E6E0A0615827251BEE1350929D9318196563FC7987FE462E067AF07DE552112E267ADA0518215ECE73270FA3B88F8FFCCBB80FF77541799F1C1DEAEB6A1F1B1D8647AE9BAB333313031B1B0BA80D7C4373876E0E13292909111121B89283838D9D9D95959519F487D7007A7A5A3A64D7785A4646464E4E4E111111E8EF0A0A0A1A1A1A3A3A3AC8D6C96F8D9907FB4F1ABF70FFB7C7E4F4E8C0D848DFD03BA357AA720A7242CBA43805DE5CB9D55150DA9E53D2804B2FF10D4FB170F67BF0FAC3FED357D5364963E85753B1E9F34B5CD4D8F2E1F865FF679FF03E117D3944D7FB2F8DCFDD3CAFB3558B5F7C1D2BFF2E39A5D7272E05BDFE5C04ACBB78A221B8FAA021BAF996B8F8E6DBB917DA7BA77EB6F7B8F6F8D58E2347572AAEC13069B2881C5CA9627AE46ABE9DFF60127E22B31C965D7179FD6984A19CF2FAD8AC1A5C5673263ED8C2F1A8EE566549396E56F693274F262525CDBD890AB2C3AA283A9F375091BE89FB3040D6D19D1C167D68D3362E0CB50C1BFFCB5357F37CC29A7119F3701F8BCD998AC99D4E289A8E2F9CC6154CC7E54FC7E6C13520FE3836BB3B38A92B38A93338A12328BE3D10D7EA1FDBEA8F6DF18BA6B806543BFBD57B05915D7D89362E14379807E2CD1DD29F19475D7D1A76F161C6D3CF15569EB58E01C89BA84E01752E41F0AA80BE30905D90543B07909DFD08660E44D36F04EDEFF37C27DB79531CFDC9F60114BB805ABB803A5B24F57681B50E419D7E7125B6DE450E3EA480C848339B530686E22C6CCC0B16E8A8A9A5A6A6227F90E1E1899943E1FFC5AE4730BABAFBFB07468687C607BA07D3E352CFEC3926C6C42BB284FDACFE9E18338FBEF4F2D1F4CA7E5C496F64415F44FE582C01D5FC4BD6C740765C69B37F7A1FB6B83F8ED01D5DD487234C65D54C6451BA134A1A6373536CBD2DAF3EBAA8BF4B4B5072D962663956FE4D728A81E60E053149C30D6DB0A6C54BC7CC4A45AB28B31A1B189A1285B5F9687C72EF7E6911319625542B4545D4D7AE1117E29FC33D3F6B16F79ECE86917F0FF711F8EAE8E0F4F8C8404FE7F81814EA497737175616262E4E767E3E1E082F0FD7B2A5A210F49A05180CD5E2858C0C743CDC9C70A59CACB4E2FA75AA2A4A9F3F7FB6B0B0707070F0F6F60E0B0B8B8F8F4F4F4FCFC9C9818AF3CD31FBCFF653C62FDCFFED31393DD23F3AD0D5F7F2A191B2CCDAB54B57AE1793B47DFAB6A3A0AC2397D09692DF189BD610955CE61311F3CACCEAD435751641C05D6E118B0AB3C06F12EBEE6F3B18F2DAAC3A3C31D6CC116B626F72E1F66E39650DDE65C754F5CCAEDC0B7D6756E8E28577F6F8DD77EF39DF4BDD030AEC3D8A1D7D4B9CFDB32C5C239F19BFFDEDF83641C9550B99E5A9B97E5BBEEED3912B19565ECDD1994319A513F9D5FD99A54379158D897995B1E9F5E985F96171AFAFDED55BA7C2B084067A8AB5B5755555157A8780A4EF1D43E32F701F1F1E69A8243B1A9B6BCBACE5C1506F105F6577FF65797802E0DE113B8BFB605CF6685CCE785CEE64EC0CEE73BEC7E6C135D0E8C1FD616C3664089B39189D819C703C32AD2F22B9373CA9D53FAAC927BC2D30B2C937147C6FF10F6F0F8A2CB7734F7CF836FCD2A388CB8FB35E9A53ECFD1A5D4380F57AD7E04A7B5F34E5F63E68CAECBCCBED3C1BDC821A5D03BECEEF9ACF6E9399DB2C53EB1C58E31804CD1D3964987D60836370937368936B786F6872954768955F6475647C9899F551BD4DCB5858D9962CD9F7DBAEBCBC3CF883F4F4F4C05AFCE8E8686767E75FACCEB7B6758D8F4D4F8E4F93CB29369F2CD56515F916B3ACE15A6671E379B14FEC4876F55846D568226930BA6820A260327E7663FA5C50D9A1A7D7FAA60C24948EA45474600BBBE24BA6F2EB8732AAAA43D20ADC23ECAE3F3DA2A8BB9E5D78F90246293ACE5DEB341E9FBC448C4BEB2AAF99EE197A78E93A236611E3022A859572D0DC7D1C9C2E1F3F29BF429265F11296C58B55D7ACDEBD7993D6FA7580BB08CF4C73CF4CFEBF80FBE8400FF209D589D1C1DEAE89F151781E7AB8BBB2B1324379E7E460A3A7A3414FB2CAC7CB4D474B2DBE7CA9C126FD1DDBB71E397CF0EA954B464F1F9B9A183B39DA7B7AB8353636363535B5B5B5C1631E5E86E125796C6CEC27EFF2F8BDF10BF77F7B4C4E0FF60C7536753EBEF1609D84DC7A71596D19053F13DBD66C4247161E706FC1657725E577E072F04EFE214FDE5F5235D823B10E8807DF211B78965FD5DD617BF5619A8377AE7B50D87BCB477B8E9FD3367C73FC52C87BCB4C47EF6217AF12677708C1C583E0EC0921BAF8402A3C838BEC3D4B9C7C486E0124D720A2734094D1A7E7DB0F6D16965E43CB2DBD90658BD8AA67BB4F45BCB5AE8D4C9BC2D7F66410BAD24B5AD28AC809D994B47C4A7A81BF95E321C39D0C34B4121212E7CE9D8B8A8A423B2694CDBFC51DD64E217FE03E353D393C5A9C91F3E8E2F5955C8222544C47350CC28CED1A7099AD7119C809AAE232FBE3B2E6709F8ACB03D0BF2CEC23D8ACE16804F489F802C8787CDE182E176E0C4D7F382663089B3E1095DC1316DF1F95D01D160BB2F745C60F4427D4BAF9C73F7C1379DD28F6CE2B8289739B576457406C871F1652E71602A9750FA9710B8690DD822050FF6B9CFC6A1D7DBE4E3DAC16CCA4C1C51FCD0CFA412D5E11CD1E912DEE483A3CA3BB7D62FBFCE37B8312E1E5A72924BE2526B5213123D4CC7ABF8EEE5256561E0686DBD7AF555454C09FA4BDBD7D70E6C86B00C7F7D68460B4B674C25F6F6860343E2AFEC2E13362ACFC6274DC3B1536C4DBF8D6637387322B4752CA2792CA87A09587E7A3B823479299311D657D301E39B63B983E9E53339957D7954068C515772611ABC33292AD7CAD2E3F3EAD6A20CFC8278AA15D49CDAEBB7CD5BD03A73CDE9B93D3F2FBAA1BA63BFA6E9C3C07B873D13129CBC9FB3AB9BDB87BDF40459D978E910683E1A0A1D155523A7560DF5EC3CD28EE177EC77D62A4BBB7B361ACFFFF1CEE8B31187AEA256C4C8C8B66261C2CCCB0D456570B0B0A8C0E0F4B8EC715E4645795915A1B1BFABBBB8606FBE19F696EC0BFD4DC98FDE7F957C72FDCFFD501B08D4FF7B6F5365737DE3A7F7DD55229C515729B1534B04EBE0D69851D5948736FC0A6B7C66476C666977B86E1DE5B599DB9F574C79193EBB437F14B00EE2B30344ACCFCBB24D7F93DFF14656C1BF1D1DAEDC12BC7BBCFC33FD914FA22C70D2E72F64471477C9FC19DE0EC0D21BAF8CDCAEE1650EA1258EB8F2D770F897A69727FC721C3156B2516324B2D60D61792BE637830ECAD15252AAD2DB9901297D992896FCE2EA94CCEA9CF23A48761A1B5F172727172722A2B2B7FFCF871AEBC7F6F4B022AFB3CDCD12F8C0F0E2746608F6DDB2D448DACF83F3A7826C32D08EE7E1B2EF34BDC816C1477307D223A7B3C2A6B342A73282A6330122DE9A9DFC37D0C07F4A70CC7A60C442776866061321297D2E01994F0E86DCCED97A94F8DA1B60F45A48C61336009E90B4B82F4842542BAC313BBC21220DDA1B80A1B8F4A6BB7AFD3E6150A69F70E43D3E1130E69F78DEC09C2750727F605260E04278F84A68E4764C0EF0C2B194331591D51A93D2979AD69B9019FCDB7ABAA093232F23233D95A5AA00786453FF10B2BF27011DD97EE9BA3B3A317FA41634D93A5B1A5A6BC2AFB420605A1954F8E5E290B4F6B4BC4F72412FA7025E38965C3D1C57D21B91333C7089B637D4EF6FEC4D2D12CF2647EFD685E6D4732B132242DCD2EC8CFC8C2FCD2937D721AEB99049662E8D6B208EC5EAD7663E761CBBBCFC26C5CF1D8E4C622522FB9E1D2E113DC348C1202222AABD69ABFFD7860F356694111D685544C98859CB4B4AAAB561DDDBDEBC86F3BE7702F9CD92CF3AFE3FEBDCD32603ACDE245EBE5D7AC5C21CECDCEC6CAC8003972607F5B5363676B4B6F67C7505FEFC4C8F0F4E4C4F4D42452CD906EF27F74FCC2FD5F1DD05847A63A9BBA6A4AC9974F5C90161057165FBD534537D53BBC2E25BF3B97D49B59521F9D561B9A581F9258EA169CFCC9CEFFE13BA76B8F3F1EB9784B6FD7563139D985CC2B30B4AB96B05DD2DE7A6FEB81CF676F80F2382BD76CF7A0D290B886B854C01DEFE436EBBB135ADE11DCB32D1C4A9CBC6A03A2AABC438BED7D00F7F6C89472DF48A77B2FAE6EDDAF252829B5981588D7E015BFBDE580E7D38F75B8ECA2E0D896AC92DE520A29298B9C5D549A9A6DFDE1B394F80AF4187867CE9C494F4F9FDBA517BD7FF3C697B57D1EEE237D03A15E7E86AADA3C0B68D584252D6F3D25852674A414B4C7CDE23E80CB1EC2E500D913B83C1477B4B38F45CF74F648E8E6E97D91692371B990E1D86CD073109B39109DD11F9DDA179532828349F20036A93732BE3D387A3026793036A9C6DD3FE6EE8BE89BCFD38C3ED73B0781EC9371D9C3D1E9435169A33199107861405E1B62330663D22143D8D4E9849CE9F8ACAFD3171483A63F3816CD40485C7F68FC4058527F78EA4878FA5864E66454D6547436F29A84CD865F1570EF4B2B684EC9767BFB4177F51A4E2A2A0E06BAD090200003FE506D1DEDA3E36330E9EDEF1B9B1887C9D78131D03F3231365D945B7CF3FC75314E21660CCD76455D9F77362DA9848E644273546E4764DE28201E59D81D9835862D01DCE7B1DE9B54DA93543A5E50DF954A6A8E2FAE8ECA8EB7F27D77EACE69CD9D0715F457D3F3496018D7B30A5DD0DB697BFB99DF7BCB5073C7487B0FAC93776E547C7946DED1EDBBF9E85964C5C465C4C42F1E3BB54A7419370D3DE7125A28EF2C8B178BF3F11968AAEFD9624087C18872FF1FC2FD7B6FA8D2522D6661A0BF72E1FCB54B1757CB48C39C8B8D15E6003A9AF1E1213463438333BBD9CCFC337C3560FDF59B63F6CB3F65FCC2FD5F1D33BBAF75D4B557E12BCE1F3A2DC5BB5465F9EABD6A1B7302B00D490543F99563B9956DD15935BEB85A9F38924350DA07878827C6C18F3EF8DD7D6D7BE6F64DCD6DBA9C4BE5163041D62E615767133EABB2D1E5CEF3343BAF5CF7A042EFB08A606CB113823BDE1191FD4BDC13DE9902EE6D91897581D185761E64DFF0DEB8AC9698D4908F562FCF5CDBBB5E7B1DA7881086461843ABB77CD5AD5D472A62D3D3BD431B734A8628CDC4A4CCB2F4DCEA9C227F0757A555F2744BA8972C5CB46BDBF698C8A8A1BEFE3FECF9EA718F5E879A0EF9E32653D3C35DBD7E4E2E7AF2EBB93054FA92ABDD9EBDA7C4A475A61602EEDD7159BD71D933B8E78E42738FCF03DFA771F908F1B1B963B139A33150CFB3866628FFC3F419EB7B23527B22922043B169DDE1F1BD91899DA1312D01517D5109902A67EFB06B8F42AE3C487AF2BEC6C96F383275049B311091D21F9E3C18990AE98F4C81C06B436F6432A42F2219B94D44F2D7190E4F9A0B7ACD6864CA48545A7F48F24068CA5078DA68440604941F0E4B03EEBB42935AC3937A53F31B12331C8D5EAAAD9064C160589650C5C644A37F967A58F11F1C00D63B61F57F6418BD725E608C8D8C4F0C8FA7E2520FFFB69F6331131B86FAE4A63D296EC1DD5915ED49C5B521E9CD21E92338627F645EA77F06F4F7E17822CA3A6A7A5732B12395D8964AECCB275760B38A8212F2FC62DD8C4C0E2A6D5ACD2CBC9A915F72118B1C35DB5E3965581DC40744974726667987C43B7979BC368E7274CF088EFC4D4B9F8B9A019A3B0F23AB9E8A0617351D3D0603B28BB07200E8ECD4D48A322B376B69FC2BB823FFF3E13F3281C83E8BFB604F073299D91512989E9E9A70737204CA39989804B8B86CCDCD3D9D9DF5B5B4D81818F83838EEDFBC89F474C8E4C4D4D828C83E32D00F15BEBF0F59C782B52B507B7C7C1C9ACDF030728CA4C1C141E837DF1C33FF683F69FCC2FD5F1D53D31D8D1D63DDC356EFCCB6A8EA712F605CC1C817F8C9A1262EAF31367F34AB723A9BDC1B95D7E495D0E81A5B651592FBC629F4DACBE807EF631F7F0ABDFBDAF5EC9DD786878E4AAED7A4E3D166E25F07CA6368B5D9846E686FF5BEFFB2D83DA8199B52E31F5EE5E94F70F02CB47629B2712539FBD4F884360763898E5EA54EDE70B1CCC5B7DCD5AFC2CDBF12CABE77706974BCD9C367EA2B649831180ECCA2951C7C2B58B8D8300BF4E4D6DD3B7E36CCD18D9492595B80A7E44173CFCC8D4B7875E7A1B6BC22E3022AE86E9F5FBEAD2DADE86D69AF2A2D1BED1F9C394DC9143CA0272626508C10ADC626468646E1D10FCF0178328C8F8E416F8267577D79C5B39B37459958B8172C3EACA91BF8D1BC36216DA4A0AC1B97DB1B87A43F36BB3F367700A9E44840F39920CDFA3FC9486C666F78D240542AB4EFC1E8B4F1F8AC9EB0F8425387D01B0F7DCEDF487DF9A923306A283AA52F22B13F32A9373CE1F76F447FCAEF4156147E2C50D2E7055E8A4662B3ABDC420693F3A789146248F4F51D7B041652716030EB968B031CF06781017F3774E739F8EBC140F6911E190144808FBEBED91360219F819C9C4AC0C61EDF7758908D8B879A79AB92A6FB3B8BC6F4A2DAB89C86D8ACF6D8FC81C4E2F164D24432710C57D28F2DA80B48853ADF9B523A944F1928AC69CF2DA3A41692E2B35AF155A494DC388F807757EF6D5FA7AAC4BF7415338F1066A1343593F9A5EB111F4C536C9D331D3C21D561B84C476FA7FBCF62AC1CDF5CB82ACDCECB8259B094835B909D83168301DC257905CEEC3D70F3D4591961611A0C46889D5542905F8C874B808D45698DF4BBE78FC8A4C2E9C9C1D1BEB6FA2A02F83BD9DF3B35D087667AB0FFAF32841EF0FD8FCF25FD7590336B8F748FFF91DE99F4436095B9ABBDA9145F584FA902B529951557CE9D63A6A5655A44FDE0CA8D9CC4D448BFA063BBF7C32B160F339BBEBA56776BFBC4D0C8C408C83E027FF3D1C1A1D90F1FFC1F1EBF70FF57C7D4745F4BCF705BBFF193B77AEB34781730C9B2894498B9352714B5E38A06134BC713CB6085BADD339962154EFAE05BF8CA25FAC69BF8071F139E7C8E7BF831FCD62BEF73F73FEF3C714775F3766E716D5A1E790CBDC242E6ED4252F7F476DA5DB813FAF47D8D7F24D937B4DA3388E4E60794436707D36109B8C312AE297545702F7307DC0308DE419901A1CFAEDC582D24C684C188B3736F5250D65DA3B09247409881457FADE2938B57036C1DF363136AF28B9B4A48F5450457638B2386BB4498399771F25D38782CDA3F9842286BAAAE99C31D4842372F40551F1C1E9A189B1C1F1A1B1E1C1A191A06D927C6C6274747268686CA0B0BEE9E3F2F404727B084E682E10EAC8D6343525A5F7631823BF2A159C07D36E0FB0CF1599039BB2150BA215F5EF365BEC03D7D06F79CEED0840213FBD05B8F7C2EDE487D6DDC1E1435884DEA8F4A18884AFE36EE33FBE18C45E5FE4010DC916D47F3641F8ECDAEF60CEB4FCE9B2AA92AF20FBB6CB853680195E0A2255AB2AB00EF9986377B3EF1995579E4A30330475F0EE1EF09B8C34578F8F476F7C01F39D43F70879E012F23AB3827FF991DFB22EDDCDB734B274AEB470AAAFA524B7AE20BFAE20A067185C3B8A2A1F8A2328F584A485A47320164EF27D6B616565466E41726A405BB78DABC337E7CF9DA1E2D3D594EDE1574CC2B19D8962DA0DE2A251BF4EA5D96935B89973FD12BA8C8D5B73E2221CFC9C7F3C10BF7872FAE6ED925CDCCC1B56009F474514E6E0136F6E55CBCAAD2724FAFDE307BF1DA40559575D1225E7A3AC05D98838D939E566699F0FD1B974AF2D2A6C7FB2787BA5A6ACBD17374FCEF7007D34747E7D20B41719F181DE8E96CA1549675B4344E4F4E120A0A4E1C3A44BF7011373DF3F39BF7F0A959B89088D3FB0FF330B070D231E92AAB77D4378D0F0E4FC2237664141ED540FC60FFC02FDC7F8DEF8FA9E9E1CEC1DE86CE2757EEA9AC58C3B7905959483AD13110D6947B607D392ABF27227F24AAB8C32B05FFCE2BFBB13D8A7BECDD7771F7DE63EFBD8B7BF429FEC9E788BB6F3C2F3EB8B65EEFA494D216AE654A546CEB1631EBB00A1E945C77495937CDD42EC7DA091C2FF70AACF40A22BAF916D8BA665AD8973879E19D11DF09AE3E88FB1EFEE51E0178EFA03817CF2B478E8BB0B0B360166D58BBFEC185CB90C386DB99310B8599D9E0797B66CF7EDB771F33A363EB4B4A3BAA281991711F1F3ED35EBD5E8899435152F6D1B55B99B8A4C18EEEB18121780E40A0690E8F8EA0B8C364727C6A7264023900E4C828725ED909E8F6A3538343E971B167F6EDE35EB4589285DDE8F8996CDFA0E6D4CCB6C4ACEEF8EC99DA8E06CA3B22FBB7718F49837C79CD97417107D6610ECB315C7667302ECFD836ECF663DF4B37D3DE7CEE088E1E8A49FE39B80FC665937D22FB927247F24B335C7D4EEB1A40735FC1C4BA535B677A741429EA33ACCFDB2DBABFBF1F3DBA034C007AB801BC40F677F7D89859AC939265A7A657975BFBEECEA3DCD0D8EEE24AE4205F09797551E97561292DE1E99D51D97D3179F032591794D61C5BD0975D39545CD75958494ACA49098E0C75F33EB2EDB74DCA1ACA5232921CBC9C180C3F6691042DB3E412862BFA5B92ACED0B3D7DCB03422BFCC3F12EBE752171798EDE89A6F61F4F5DDA2EB3568A918D6F112D27158D300BBBACD8B21D5A1B8E6CDE66F9FC758487F7932B57E54445B96969C438D80598181917620458198FEDDD191F1138DED73E3DD2DBD35CF33371FFB2B90FF5760E74B777B5368D0EF4C2C32F3E22729B9E3E3506B35240F4D3931715B945593109978F9F06DC59A868D5E5D7D75754237D055E70677087872EFCF17FE1FE6B7C7F4C4D8FF78E3657D45F38704A966FB9080DE76639B502DFD8EE8CB2C1B4F2C6E08CB68074C0BDCD2329F3911DEE9A71DE73C7A8EBAFA36EBE8AB8FE22F48A51E4EDD7B8C7C6407CD8ED570E27AE9B1F38FF44F7B723120ADA4CFC6B1732ADA762D560E479B5F3A0E589F3410F9F6798DB218E7B05C0B2C0D11D642F76F1423FB94A70F7257AF8957AFA17FB044539BA9EDEBD8F87869E6B09ED899DBB839C5C637C039C8C4D017A396131010666712E5E7802BFBBFF28CACB370F97D848A8C0FA065D3D765A5250145ACF162DDD106FBFC9E151586F45710786068606674E953A3D028E4F4C4F8D4E82EC50DB11D9A1DD8F22B87B3B3AECD0D161C760944496DA3D3422C72577A4E7D446257E077744F61FC5BD2F22790EF7D1B8AC8EA0B89C8FD611779FFA5FB99DFED604DD8566203A717066E3CCEFDFF8BFC2BD2E20A62739B73BA320C6CAE1A0AA16D4F6B54222170E1C9C1E1FFF9A7574F4F6F602EBF05574AB2EBC00C0DFB0282FFFE6E5AB7CCCEC1C340C07366FF7B771AA4CCB03DC5BB34A3A324A7A3208C3596513D9151399E5C34925BDB882C982BAF1A2FAC1829AC6D492AC00ACDB27AB27976F9E3D78949F991D5E1E96B273ADE21759C1C4B6948651928E45828AFEF19E83C9D6F69976CE78775F9267509E9D7BA56F448E8D3B2534EEF9FEE3CA9C8252F4ACFC0B69603D0FBE575F51C5FEEDC797576F993E7A86F30D8CF6F03ABFFFC0320EE4FCC0FCF4F48C180CDBE2051B94D6399A7D6CA9264D0F768F7436FF18EE83FDFF14EEBD1D2DE03B72E2D6B1918EFA065B135325B955B418CC462575C78F66B545A52569D98FAFDC1464E5A4C72C5A2B2943CC2B1CEAE9434EBF303C823C68A1BC8F8E218FF0FFC3E317EEFFEA989A9EE81BAB2C20EDD1DBBE8C855F8A4DF8A8CE8ECAA84C14F786A0F416BFD481B0FC66A7B8E43B165117DE663EB48EBDF11E7BF36DC4D59741179E865F7D197BFF13F6FEC7909BAFA21F19473CFCE873D5E8C3EED367576BE9B389AD5FC8B60643BF814D709FB8DC838D3B9C2EDDC6BD37CF77F22AF30A2EF70B2B72F22E74F181B5EC62373FBCBB7F894700C133B0D03B38D8D6E1D88EDFB8A8E9049958EF9CBD804FCD68AB249766E6B8995B5D3D7672B5D87266CC225E3A468D55F2E70F1C7E71EB2EB990901D9B68F6E2ADCE7A15D0415E42DADAD8B4ABA56D6460700EF7FEC181F14964B33BB27D660239E2C21FB51D1AEAF0F044FFC0CB7BF754A56538310BB6AE5D1F6161DB955BDC959957052574167784F5DF71CF9AC53D76CE6E201B91FD6F711FC2A6C3047087655B404CD67BCBA8FBCF02AEDEC97C6FD61D163B12973A888576FFBFC21D649FC3BD292CA13B29A7293EDDFFADF1F6D50A828BA9B565E55EDCBE3D3D310EB27F0F777487F7B1B1316463D7E8686F778FADA595C1063DC6854B96F108DCBF70352534BA2E9FD05A406ACF2DEDCA29EDCB260DE6968F64970FA411BAE2F21A23D3A74B9AFB73AACAC2D3C2CCDD5E5DBCB35BCB40567819F453E645D4E0FB2625D50B7B0FEED7D15315159761E258BE90C6F4C2D5747BE724739B7C270FC03DC7DAA5DC3334D7DABD3E147763C356E9C58C9234CC628B1944E958B6A96A1A5DBEDE584008B0B47F76E19AAF856D6566B6979985968C2CFB8205224C4CDCD4D41C540BE54404EF9E3B998D8B1A6AAD9FEA6D9FFA6F70FF4F3331886C6A9F611D0D823BFA866A6F6BD3787FCFF4E8F0D4407F617AC6B53367C5F904B8E818AE1E3915E4E8DE50525E958F377EFA5242408406839110144DC725F6B677229F271F1C425887672EBCB8FEDCC309FCE8F885FBBF3AA6A647BB868A9272F4D66908D373AD1796BEBDE7746352714732A12FB9B43D22B72328B3D33F8362159E7AD732E6C2BB841BC609778C71773FC6DC7A1779ED152C931E99E21E7E0EBFF526EE89499C9119F6F167DF6BCF4CF69EBBA2B87197A00C547819CC12651AD69D22925734F48D8F9EF57BF822D1C426C7DEBDC0D93BDFC5BBC0D527DFCDB7D0C3BFC833A0D82B30DF27D8EEF5DB5DFA9BB869E8C5B8788CAEDF22E309D3FD43032D6DED55146C40D0ED33E755E4568BB2710AB2B2CB08892AC9C8B95BD8FA38B858BCFDB8DB602B3F0B8718AFC0E5B3E76322A3067BFB908233F3317A68EE6313E350DEA1B9CFC83E8E36F74958C91D1B1F1F1C1CEDE93DBA6B97040F2FDFE225A7376EC9F2091C29A9E8C9CC2787C4F6E0FE8C7B1C22FB402CB27BE2EFB823B2FF87B8A31314F716BFE8F43766D8872F82AEDFCBFA60DE131E378A4BFBFFB17717E0519CEBFFF0833B84047777772D35DAD296522A50575CE28E0408712704D708715D77DF8DBBBBFBBAEF26D9F79E1D4853A4A7F4477BFAFE0FCFF5BD8661B3BBD9CCEC7CE61E7B4645821500478E633E79E12BC61DDDE1AEA0A677E0D942467A358E76F7DCA5DD4B564C1F326CFFCE376E050400EE509B3F5BBC032550B683E9F023F470AB582C2E2E2CFAE6C0C1A5F3179A8F1CB37BDB1B37FC820A5882A6DC9286CCC272BAA092C2AFA5085A6899424EBE945724E3140A59799961585CD0C32B36174F7CF2DDBB2B372F9A38D36CE8C8112603DFDEBCFDE0C79F065F724FB917E66563FFE1DA8DABC64F5A327C4C8A5740696C12EFDA1DD8BCAB8DC7E5DE8AA88EC2E6DF8EE605DFFD61F5D62526C3570E375D3166E2DE755BAFB9BAF393700691A288C4F4B2B4BFE2EC5ACEE432A3E27EDCF3D1C6D973974E9CB472EAB405A6E3E68E1BB36FE7D6F060FFD6E27C83E4BF837BAF4A2EEF6C83DF6B5029C58D8DB1F71E7CB075C7B4516357CF997FDB2B80998069CA2F6DC82F7D18746DDBF235234D4C66984EC0C7257536B702EE6AB902DD21033302BEDB8F67CFBFB2BDC6FDBFDA7A0D8A76290FC7D8B674FDACE113762FDFE27EC4BE935FDA4ACD15D10A14B422053EB72D9C511A109776F616DD328070CC9DE910C8700CA4D8FAE22C3D49B6BE8C3357282E41A9B65E04277F827300F15C30D1F54A8A93EFED438EAE1F7C7B62E3EE77C6CFDC653A0DF2DEE4B90716AF3DBD6BCFE5033F851CB6CCBE1F93F92026EB616C56785C76447C0E94ED8F123362931C7E3DBC6BE3A609C3472E9E39EB829D43657E8141A1D288C406B9B2BDB62E8D4ABF1D7CE5C837DF6D5CBE6286A9D98491A3F6EC7CEBC48FBF9EB1B2FB6ADF6773264F1B3762D4F68D9B2D4E9C948B25C8DDAE8D3D9D42F18E1C1EECED516B3520BB56AD83C503F51D861A994C2514BDB57EFD8C11A3E68F1CE3F8CD0F65384A6F498D4C90539F4A35E2FE9BECBFC7FD31EB48C86C0D09F242DCB5F05A1C1B1D4177CEB4C6E0B91EC1A4B397936C9CD3FDAE4AB1541D8DF7CA71EF2620175BA1E7B6F7C75D48E275D1D34A930821B64E3BE62D9C3E6CF8B77BF6C43F78D00BEB3F637BCA77F4FC22988CE03BD4EFC04A6D6D6D7262D2823973278E1BBF64F6BCD3BF1C21C42555E71436E695D46715366514B6651441FD2E4C2F6EE7E455E2D89961C9D46BE176FB7EFAE9CD7DEF2FD9BC7AF2826593666F58B802D60A9F7FB837D42FF0D1DD07456919D5D979D72E5DDEBD62CD8A7113364E9CC6B9F5A02605CF0FBD5D121EDB98482CBA13551F832F7B9090E4ECF1D3AAAD3BC64EDD663A6DCB845976077EC84E25C94A6BBA6B5AD4E5F50981D77D4ED9E16F3F480CB9E1F4C3CFB65F7FB771C6ECDD2B566F993F6FC6B0A1ABA64E3A77E248118B661075BC34EEC6E7FFC9207DFC3E661D097A2A24C80ED188BAE057EBC5E2EADC5C6F97738B264D351F3474CFA66DCCB8D41C121326604B6139E6C1A38FB6BD39DA64A0E9E0E1B1F7C35BEA1A0CDDBD0A8954613CDF1766D01F5C39FC6F68AF71FFAFB65E83A459484F246E9CBB0270DFBBFECD202B57715A4513215348CAED6657E829C54DF72905DE8FB22EDCE3D85C49FDF50214EF345B3FA28567CAF18BD85397C177BC8D77FCC98B44477FBCA31FD12590E5712BCDFF21DDFDC6A3D31702BF3EFED3AA6D9FCE5DBE7DF4A4955064990CDF3176CAFEF92B7F5AB723E37E74C6C398CCB0D8CCF0B8AC88F8ECC8849C4789E9B14907DFFF70F5C245E3870D5F3E779EABBD437166965A2892B5B5C3D0A05419B4BA8EBAFAF8B0F01FBEF872E1F41963060D1E6A62B279D5DA9F0E7EB3FFA3BDB3A74E1F64623271BCD9E6F51BC442118A3B780412C150DFD30D231A8D4E8D5CFCA1428FA9EAD51AB554AAE8EC5A3D77EEC40183968C33733B74BC8EC23694D62A04398D58C01D39C9BD4F7639850FB21B71E73EC69D8C5C77FA0477E0FBF9BE3F8B7B4B348EE31E443EE79E6CEB92E11F0AB8EBE97CE4AD48DCBF0977481FEE222A72B8383F1EE36F61BB69E69C69C387FFB86F1F2E2EB647AB41A6D59353658C7B689026954AD1B21D40118944302C2C2C0C0DB93A74E0A0D143876F5DB3DECBF5520683535F5C0E2567436E716B5E59475E796B567119998BBD7AFFC28F27F62C59BF70F0B80D13E62F1C3179B2C9C84926A357CC5CF0D5DECF3D2FBA45854714E4E45616976AC512614D7DD039D7CD73172C1963F6E69C85DCDB0F2BE252187E21F977221A6271853723EBA370150F12131DDCACB6BD7F60C19AF7A62FDC3169AEFBA1D38DDC2C5D55531327CBD0A52C4821FB9EB0BDE972E19AE339F7232723BDFC76CD5B7460EBCE0F56AD9E3170D08CC1038FEFDF97919A6CE86A33C81085FF46DCD550ADFF863B721D930A799F6EA9187EB5A6A3239FC5763C746CC28021E62683BE7E774F094300A94DCB6B2D28A745271D7CF7C3B12683469A0C0CBB7EBBB9AAD6A0EF9189C4328914C51DEDB1FD5FDB5EE3FE5F6DBD067153D78FFBBEDEB974C312D3997B566E4F0EBA9F1F4B15B18A7B33EAAAC2C84A5CAE81529A7DE901D52A20CFF53EC3D28F7ADA876CE185C4CA1B42B2F626DAF8106C7D70763E587B241863521C90243B7ADD3864EDB6FFBB43EB76EE9E3467C390716B078EDE34DC6CE7B8A91FCC5C746CD7FBB76D5CD21FC6D49358D54446565422F1F6FD8F77EC321D367CD4C04187BEFD2E972F30A835069DBE57A9EA51184F6DD4EAB412A94E2A6BA9AEB91118F4CEB6ED485F1C438641F138D97C82D9D87123870E1B3260E0001393E3478F151514C29F2816C3866FA3CE78F906949F508CCAE54A18876543D8D90553A0BDB1F1AA8FEFC6858B260F1AF2F1BA8DC41B773BD819AD545E27952B676518714759EF873B85AB247120BFC94E616BC910CE8B70EF61644952197A5A86819D0B23520CB3313215EB7031CEC28171C9BB292A096A76712A19A9DFA98257B95B068FF49100D11190C0FBA848C81FD241E4F41454E6C4A51CFFF8D31943879B9A981CFBE6EB9A9222E48AF6173410BFA3A3A3A5A505FD6F6C6CEC1B3B76C2DA74F3DAF597CF5FE0D3984DE5D535052502220D1B1E937A3FF2E6655FEB6F7ED9B37ACB8AF1D3660E1C35DD64040CA7998C593C6EC6BBABB69DF8FAD76BBEC16C2AB3A5A11156B49DED1D302F604663A363F7EE7C63CAE0A1AB264EFD71D7BBB9117145E13150B69786C5563C88AFBC1F577937BEE24E5C7D04A6F46E5CE6F508F6957B38DFEBD8809BD931988EF4027D719DA1B2A596C48D710B0838691378CA36D2DD871B11538821F2A3E21FBAB9FFFCCEEEA56346AF1C6F6AF7D5416A4498412EEB9649E4EDAD2D55153545050D6525D2D6E6FE9AFF5F0294F7686408EB1AB1412F3374AB0C7A253C0EB2F788450699AC90C9B6FFE5D0FCB1E630FD3FDBFE56C2D55BB0C55342E51510590D99851938EAE1CFBE321F387C9CC9902FF7EC85298CEE7387D2A45B87DC6EEC5F7D38F535EEFFE5D66BE8AC6BFB66CFE75B16AC5E3A7ED6FE8DEF906F4497243084F40225A3A4369C2A4DCA90C4F2590E576916FED967EF108E78F4E14EB1F48620C4DBF8F4F9FE0CF15ED13617EE9D70F0FFFAB0E3EE4F7F5CB9E583A9F3B78C305F653272A9C9B06DE3A77EB376ABEBC11F23CE5E66DC7A5898882BA330DFDFB27DDC08E43698270E1D2ACCC8ECD56800F46E950A167BD005ACD7CAE530D4C86440FFEDD0D04DEBD6AF5EB96AF1FC0593264C1C3362E48861C34DC78E9B3C71D25BBBDEC461B0507E02EE6D6D6D0013FCB928F15229722B6D64AF316C0DF41A1AABAB3DCF9D5F356BF6E401833FDBB8957AF37E072BBD9DC21351794A7626C8FE04773E1A90FD09EEAC27B8B35E0277560E8A7B43440A8A3BD3CDA7393A19C55D86A3FD03B8C35FD44A64EBF2CBD31FC5FFF2C147D3860E331F32F8E44F3FD45694BE0877D8E88106353BDA299B56ABBD75EBD6AA152BE7CC98F9CECE5D36A72CAE0604DD09B9E67BE1B2F5E1E33F7F7670DF1BEFBEB566D39A99F3678F369B3664F4DC91662B26CEDC3073E1A903BF381DB20C38E7197BF7511A83DB58D3A082996BECA70CE605CCDC84F0883D5BB701EEEBA7CD3AFAFEC7803B2A7BF9C3D8AA07F155F7E22A6F2369084B05E50B6FC580EFB4C03BC4805B5911494DF474436983A1ACA91AC388BEE01B72D2EE96CD9954FFABB081D2C8E4571068D49B77DD7E3AF4DEA2C5EBCCCCBFDCB8E9DCAFBF886A6A646D2D5AB1100223E2E64618AA859DFD8DFECB81225DAF9268945D1A45A74E2504EB9193296512BDB00BBE85A2AAAAD86B37BE78E3ADE983474E1F38FCEB37DF8BF20B694CCB2FA3F18B486C503E0B473BF1E57753878E361D30F4D3773F6093A8866EE4F225C01DBEC0C8A95FE8BCF9B7B6D7B8FF571BD05652BBEF8D0FD6CE5CB262C2DC9FDFDE9F114DACC2F0DAC939ED988CE61876572CAF3C28017B0C4CF74B77BA91F2FD79DA691FF09D66E14BB134C6DA0F42B6F623DAF8116CFD70767ED87E01DF93EC3C529DBDB0677C62ED2E5DFBC9C2E1ED7DB029FDA6E98C152623969B8C5C33D474D7E439DFAEDF71F6E08FF79C2F260485EE58B36EDCA891D3274E74B0B12E2B28404E42D768742A250C7BB41AE4CC168D1A9086A1A4A3A3BEBACACBC3D3C1C1E1EB835F6DD8B061DA94A963C68C193F7EFCE4C993611818180864C0A62B7884B20ED6C35028142B140AA8E22522314C818AFC029B23C7168C3707DCBFDDF116EB4E782733BD9DCC95D0F82A56A694CA87F4C92E37CA6EC49DF50477181A71A730C1F717E1DE4DCF14A7D075D474C01D46C0F7FAF0E4543BD7784B47B6BB5F6B6C2ABC15E02EC7D3F5B4B4578B7BCFEF7157901FE3AECC2EA6DF0BFF7AD7DB93870C993A76B4DD8963CD75D52FC21D261780020DB678E0BF3061DDDCDCA64C9ABC65C3C67776BDB9FFA3BD9F7DFCC9EE5D6FAD5DB27CD6C4291346209D3242C60F1C36DB74E2A685CB3FDDB5FBD8C1EF1D0E9FCC21F38A38D9F5F9955D0D1D2AA9B2BB1BD9AF0F734508952CAC77855D61376FBDB57EFDE4C143B72D586C7FE0DBFC88B8E2B018E432E60731957763916E906FC4545C8FAEBD9350712BB6EC761CF8CE09BA4FF0BEC6BCFAB0300667286EE8C9AF298EC1473A7BDCB6728971F5E6DE0E6F20B1DA9869CD345E513236C1DBDFF1F32F3F5EB26CC7B4E93BE7CEC18487A733681D753508C75AB55E2A06DC858DF5FD8DFE7D147F3E80BB52D22197B4CAC52D4A699B5E21428EB24AC580BBAEAD2D0D8BB3FEF687D593A6CD1B316EDBEC45965F7C1BE71F5ACFC9AEA409CA29BC96CCA27C02D3F6BB4373C69843F1BE67DB2E5A2ADEA0D1EB54C89DDC6146A0576FFC9BDB6BDCFFABADD750C8CF7D77CDF61593E6AD9BB6D86AFF4FE504412331B38590D99CC89360B33B2259BCB337137FB9C0B40C4CB30B05DC19A77CE816BE10F09D6EE947B532C6C6BFBFEFBF116FEF13677121D9C19DE41A40B9140CC43F38E1E47BF0D0D90F0F7C386DD15BE6B3368E9CB07AC8B80D2327BC3D6DFE172B367EBDE3ADB50B178F1F337AE9C2055E97DDC06E835E875C100F8B8A1E011D7C37F4F6C088B0BDADB1B6A6B6A68AC964E2F1F8FBF7EF9F397366FFFEFD2B56AC983061C20863037D9A9A9AA0DE0498600815220CE18FEEEC1442392F97CBD10B2CB338DCAFF7EE9B366CC4AC21238EEFF924333CAE8B9ED649E282E9CFE0CE7D823BFB09EE8FF3E771EF65668B926990DA8789C936E712AC9CB89E01EDF15814772591D9C3C87885A742F6E09E83BB849AD64C6049D2F252AF5CFF68DDC68983062D983AF982933D72B5E40B7047D78B7DADB8B8F8C4891343860C993B731664F6D4E9934CCDC60C1B317CE0E0D183869A0E1BB97CDEC2CD2BD67CFCD6EE63DFFFEC7DEE62F49D074C2C319BC53388B50699DE00C5BAC6D0A3EF85AD3285462D57AB443269776F4F735343A89FFFC6A54B270D1AB27BF53AAFE3160591F1C80E9987B195F763AAEEC456DD8AAEBC165D111A550DC3EBD1557712CAEE2508821FE2E0DB75F90AF3CAFDDE9C2A25AF30F3764C98DDC5474E6EF4A0DB65B1583137BB0E476FA2709A28ACC2D8E4B84B1EF69FEC7F77E69CB983067DBF77EF2527074A4A527B6D35BADB5DD5D52169697AC6F4BE3C2DF81F047097095BA5A266C05D2BEBE8554A0C4A69AF44ACEFECCCA3D2AE9C3DFFC6C2A533070EDB3E67F1D13DFB03AD9D71D7EE55D3D2D0B467169750B8E78E582C9D307DC2A0113B57ADC7C5261A545AC01D3956A4D7AB60718005F85FDC5EE3FE5F6DBD06461269D3BC95CB26CCD9316FF5B91F4E37B10BDA6879807B5B4A9A8E5EDAFC804AB2F24F3D72996373856B154C3AECC13CE58F86611140B70CA0590742A8D68164EB00A20D12824D00CEF649A078B7F3C6D879A6DA7AA4DA7B42521CBC929CBD935C7C5CDE3F707CEBFB9F2D58BB7DDC8C55834D970F1ABB7A98D9CA7193174C99663A6ECC96CD1B6FDEB8D6D1DEDADBA35729E5906EBD16865A8D0AF4D1EB342DCD8D4585F939D999582C96C561E7E4E50AD2D31E4547D9DADBBDFBEEBB8B172FDEBA75EBDDBB77854221F2571AEFAD2A9348D14E51DA3BBA007728DEA172878D5C3A0EFFEE966DE62603178F353BFBDDCF2589782123BD93C001CD55F4F427B823AC3FC19DFD187732F309EE0C0DC8FE87B8EB691900BA969206CA7725528449D4EAFBF149D66713AD9D053EC15D4904147718F63233FF01DC9BF0CC766E66A487EF8E454BC60F18B07AE17C3F4F37B90CCAE7FF8C3B4C461A8DF6FDF7DF0F1F3E7CD8A0C1C3070F193164E8981123A7984D58B16809D4EF07F77F1EE8ED7B27E45AD2A3183E8D595558226A6ED3491506B5CE005B506AE4EA0AA54425164B3BC5920E89A8532A96AA956ABDAEA2A2CCDDD575F9ECD913060FD9BF73D7DDF36EA5D1C9D59189D51109C6BEECE36B6FC7D6DE8805D9EB6FC4D5DE8A6F7C90DA1089CBBF1143760FC5BB5DA1F9DF96D2B39B535974DF5BE156AE38B7C0FC87092D04965290DF46E6C26C95F1B2DAE9BC9C88E85BD6F6DFAEDBB474C4C859A347BFB375B39BB3230D93D25056A2E868EB9601C14F81DE3FA0B6EA4FA657A580CA5D2DEFE851890C3A9941ABE8960A654D8D1D15156E9656FBB7EF9C3168D8DCA1A3BE7BE33DAFE3D60F5CBD08D7EE9711D8B5F4F43A66664756490523CDC7CA79C3CC8553878E5E337751FCC348BD4CA9576BF45AA47308A55AA5EFF9DD1AF7DFD65EE3FE5F6DBD8647D71E2C9D3867E5C479EFADD8EA71D4A1935FDAC52AEA24E70AF1D9065645D5750CEE9437C5D21F2A77909D6B1984CACE3A1D008107195608EE108A55C0737CB7F3E3BADDA49E094CB1BA1C7DFC6CD4B133095697B067FC486E2144B79008EB0B6E9FFFFCD3BA5D6F4F9ABF7698F952935173078E9C32769CD9F871EFBFF76E5C6CB4422E05DC61A854C8745A350C21C89D0D7ABBE1C1FABA9A82823C5F7FBFF8C484F2CA0AB952D12512A665A483E9172E5CF0F5F5CDCCCC04D3D13F1416863EDC3BBB4450C5EB743A519750DCD9951C15BD69D90A7393011BA7CD0EB2B26F24B325ACCC0E3C5B46E629C848C1FE7CDCC9CC97C51D40D7900530D299408654DD8B4BB07449B271C9F0BF2A4A2169281CC05D4BE51AD8D97F07EEA8EF7DB837E2184D0CFE4D17D735D3668C3331D9BA7AE58DD020D8E67F11EE30C5A0C136106CF1B4B4B45028147B7BFBEDDBB76FDBB4F9AD9D6F7CFCC19E6F0F7E657DF2B4BFA777FCA36826995A5154D25055236C6D57CB1506ADDE78305CDFA3D6F62ABAF552AD42A810764A60467448245D4A9958A354E8344AAD263F3FD7C9CE76EEC48980FB771F7C981C7CAD3C36B52E2AB93E32A93E3CB1FE7E42FDADD8BAEBB135A1D1D55791E2BDEE6E524338B6E4661CDBFB16D5F33A2FE841551421FF4E7CF219DF708BF39CC03B8D2934115520E364EBB34A7A72CABAB38B15829C061C991870E5E2C16FF7AF5E037FFB9259330EEEFDC8E3AC4B624458BE80276A6A30A840F0A74CEFCBD382FF4100F76EA5B8470B1B88B0E9295777B5D517E6F1F1786C58D896790B968C3383B27DD7BCC5CEDFFC72D5F6ECFD33EE29FED78B53680DF48C264E4E5756691D3BEBAA8BDBCE45ABA60D1B337FC2D4889B77B51279B7F1FA3B68F085D7EAFFD15E1E5FB6BDC6FDBFDA7A0D41177CE68C9EBC6EDAE27D1BDFF63B75067017B28BA5CC6229395F4F2BC9F579947ADC83E7104A3AE61577D029D3E13AFB7400A43FEE749B20C853B83FF6DDCE8F793684EAE48FB3F6483C7D31FEA46B82C5C5243B8F14276F0A945A1783635DBC6E9C703CFBE9F73F6C78F39DA90B578C99683A74989999E9FEFDFB8844BC4EA7E9EDED96C92472B9546F3C295D05A590520E2390D6D666B0C03F30203631A1B8BC4C653CBEA4EBD6FBFD3EAD00009E8549444154B7777654D7D614171743790EB823BB627AA1DAEF964B6500934ED72D14211DA542EB6CEF68AE6F7874F7DEEAF90B270E18F4F6E21561973C45BC6CB0A003CB921238123CFB3FE1CE4063C49D0EBEBF0877B433191801DC3BE249908A3B3171A79D00F7ACC06B120C05C55D47E3193839AFB06F1914F7BEE2BD3FEE75147690ADE3C2F166634C4CDEDCB231ECFE2D632FF7CFC75DABD5C2B60EAC1DC177185657579348A4DBB76F3F0A0B4F8A8BA71088020EB72027B7B6B24AD4D1A95128A542914A26EF412F91EF467AA18147BADADA75128D46AA51CB8073AD5CAD51E8748A1E1DC8A7ECD5CBB5EA8C8C348B13C7A78D1D0BB81FDEFF39E3416451644265585CE5FD98CA3B515537A22AAF4694078597F93FE43AFB735CFCD3DCAE65FBDFE37BDE229E0BC45F0862F9DE16043F6478DF7C647521D2D235F766147299022DBD8BCCEBCE28D66516ABD3F2E4DC2C219D5B91904AF20B0EB5B65D6066B678E6F44D2B967DF8E61B47BFFFF68A9707138FAD2B297AC6F4BE3C2DF81FE437DC351279575359767AFCBDDBE74E9FFE71EFDE4926030177F8CA597DFED57507D7DB8E1721C93EA105F1A44646662B3F1F706FE4E5DEB9E8F3CE8A0D33468C9B36CAF4EE956B2AA10470472EBEEBEE06DCD5DA17DEFEF0DFD05EE3FE5F6DBD0637DB7333869A6D9CB9ECC0B60F022CCE75F04A449C1205A74C46295012F2F817EF261FBD9C76F656EACF171F7C7C3ADBF916CA3AC30291FD29DC51DFFB134FB4F14B3AEA8A39E946B4F2A2D8FB531D0248F63E585BCF64EBCBE7DFF932F4BBD398F301BCD0705AF0BDBBB6AEB61F1DD8B776EBA80103CDCDC77FF5D501068306B243A45231E00E23C80E19BD16FE0BDC8333B5B5D52C1623292599CE6641E52E964ABA7B91BE36D0A0BB1180A18E8E0EE400945687E2AE5469845219BAABB2A3AD1D307A70FDC6AAD9F3A60C1AFEE1EA0D497E218ACC42052FB71DC71213D8222C13DDDB8E1E44ED8B8AFCD2FBDCFB708791F6382204C53DD9F64C76D00D29968AE09E42D5D3D20CDCDCFFD0E5EF13B81F0F5F1C00BD07CF47A327209D56AA8CDB22625A5A1D8E5E4D66FA5AD8CC193D66B489C97B3BB6C5443CF803DCA141B508C43FFE8F917BA110C01622DD1342610E6B50AD0EC615B085249102E530C1B56A0D4804135F219323ABD2C6269544A19569F5DADE5E301FDE04B6090CDDF25ED864E8966B147C3EF7F8A19F278D1C3969D090935F7E95169D907327B2F86664D1B5F0C290878581F70A7CEFE679DECA71BF11F99D65C4F796B1879D305697922DDDA24E9C8DB5BC883F1740BD18823BEB1F76D439DAF242D9FD442D335741C9684B6508095C11992FA270C534BE8A97A94DCBE9A2B08AE353772E5CB866CE9C851327CE33335BB760FE0F9FEE0BF5F42027253C657AAFF1CA2348FF5DEABF0F7242D753E9562B5472911AB653C4ED0D95C594E4C48BD6D6BBD7AE9B336CE40C93416FCD596CFBC98187CE9708BE371EB9784638B851036E1745135A6999426E8134B30C880F770FDCB37ACBAC11A693868CBA1D18A2EC1223B8F7F4E87BBA250A396CEBA0DFE47F677B8DFB3FD43A3B3B6179EA3BE3BBAAAA0AC6655DA20FB7BE3375C0D81903C7397D7D2C2F91DEC92DE9A0E54B18455DB8ACCE047E594812CD2E9870D29B6B7F55E0708D76CA0F34EF1F749F4C5FA8CF063DE26AE547B734C6CA876AE543369E3A9964E59EEAEC9378C627D1CD3FD937E4AB8D3B762E5836CCC464CD9A35376FDE840A113EA7440265FBEFEE9907DF6C78043E3F9D4E8F8E8E8E8888C82F2C108944E8F3A1C11FF8D44BFA1A2C09502A8AD4AAB29A9AE6963678A4282FFFC8B73FCE1D3FC1CC64C0A97D5F30EF46B450F942467A630AB5219EA4A0A63FB918F577310AFEFC68C882E74681E7185839322C4B9C42EF61643546A652CFFB92CF7A135DDCF343EE7526109504E4BE1C520C1386E8554ECF0B54DF7D76A3E3483D8E84C88768091C3D89D74DE6437444AE16C7ECC5B3213D782EFC173E1EAC9924346E1783DFC2E096E0495FEF7A7BCAE02113060FFEFC83F76A8A0AD532F11FE0FE470D35E6D9E1530D1E84D5871EE9C50DD6C4BADE1EB5018DBE55D82E574AFCFDBCDE7B63BBA989097CAA1097739C7B9159D7C20BAE84158684E7FADDA53879C71C728C3FEA4271F0E6BA5E619F0BA2B9F8911CBCB0D66E09A7CFC71C777974D425C9E212D6DEE7E14F76D1C7CFD63DC4EA68D9A2145657124365DC6441F7B3F54548E7D75299A9A1D7AD0E1CDC3C73D6B48103A70E1EB47CF2A46D4B16DDF6F34E7A782F87C3E86AAC414E61D42B754AB15CD46650490D4AA9412181209729C9247AB9442713AB445D92CE36615BB3B4AB5DA3804D168D4EAB56AB14FA6E756B5B239D4CB8E0E4F0DE962D8B4CCD170F1FBB61DCE4AF576E73FDF8DB3B471CC24F9C89B3B84070F22539F9C55B5E1404853726B32AE328550934797A293F2CF1E44707DE58B072EAD0D15F7DFC29034F52CB15B04E6D1776A97BF4AAEE7FF5A9EEAF71FF871A7A7A724B4B0B7A2A5B4343038C37D7D6EFDEF006C83E7FD8C4F33F5A14A6B03A38C5EDD43C19BD4846CC6B7AC4C8F38D6238844049CEB40E625B0743C1FE2CE87F1CBA2572DC1579A14500CBC20FC2B0F401E229B6BEC996EEA98EDE092EDE0997FC12BC823E5BBF75D3BC05234C066DDCB8F1FEFDFBE8992D80BBE2F7D75843492E954A2B2A2A68341AE0FEE8D1A3D2D252D01C7D3E34C0BD6FFCA9064B82BC5B2FD66A2A9B1A5B3BBBE091DCCCAC5F0F7E3BC7D47C8AC9109B2FBEE33F8C69A3A7899819CD187A53325549CB3052FE1279CAF4BE80D7803BD80DB8F732B30177CA391F23EE9EF9210FBA1229F0843F813BBF9FECBF631DEC463427B0F4244E37990BD191585A3CA317CF82F410D83A22724ABE9CCA06DC3B985CC0BD084F3CB8F3CDA943864E1D31E29B7D7B1BCBCBF472E4D2C7BFB71965EFEDEE4171D71A6587081542A95CE4E57EE1ADCD1BCD4C4C668F1875FBE2A5F4B0A8D2BB71C55722B27DEEF02E5DC5DBBAC71D7301CA0597AF15058717043ECCF5BB97E9758BEF16CA760D669C0D00EB71D61E247BBFC89F1D124FB83685137AA87992143604DDF441D7CDC86568C648687C45667E399E8C0D0EF53C7AE28737DFDE3967DEC251A3270D30F9EE83F74F7EF7B5CF59E78488FBB97C566B5D8552D261D0C8B4A2368DB0F549DA55C23655578752D861D0429D2E57CB252A196C438A5A9A1B8B8B0BD3D2F857AE065F74BBF0CBCF3FEE58BF016A887923C6ED9832EFC0B2CD173FF9FEE13167928B3FC5D18FE2E0CB3D7B85E31C84B372CF0A086F8C67D4C7D2EA1319525E5156788ADDE73FEC5AB072DA90D107DEFF98928A437679C9655D12B1A6B71B7C7F8DFBEB664089446E9D636C3002B57CB6207DD7F24D330799AE329BE377EA4C1521AD0B7027E74869856A5A71F96D2CD7F536C7E53ADBE12AF9A40FF9B837C7E6CA2BC11D8A7714F71407AF3827CF98F35E3197FDF6AEDAB066C6ACD18386EEDAB52B262606DD03008E43490EA0C33A09D99237E22E168B01740A8512151515171757535303A043439FA07F722EF6B30DC55DD6AD6FE8EC10C990EA9ECFE67CF3C9A7B3C68E9F3D74F4B99F0EE7C5613A59996256663B81DD8665AA1959AF1077301DEC96A43260A4212205708700EE85A161C2242A94F650D7436004F2D4DBF6E56571EF213C1FF75626AF008BFF62DBCE694387CD1D3FFEF0375F75D6D775ABFFFEFB3FBC007765B75224E93CE364BB79E5F2898306AD309F14E5E3971315DF108D2F0A0E639D0FC4DB5E4E3A752EC5C2957BF14AE58D18032DC740CDEE2665203728C77065494C49025D144743AC74F47BF48B23D6CABD2396D24BCF95A67254C6830D4FE34EE14AA95C9920479699274ECBAE22527157AE9DFDE1A7DD4B96CD1D367CC6E0C173C78C5E3F77F6276FEEB43BF2EBED203F1A36A940C031A8248F03E5BC5A6ED0C80D6AA541A36CAA2AAFAD28292BCACFCFCE6031E9D151913EDE9E7676364B972F99336FF604D371C8FE4693C1ABCCA77DB5E10DC78FBE7A70FA2CE942709AF71D8EEB55BA7300DB258861EF9772EA62A67F586D34A53991D59CCA91B0F20B6208177F3A89E2BEEFCDDD98D804C05DA3D148950A64D2BDC6FD758306F6C1B0AF330AA86DA1288E7F14BD71EE8AD943CCDE98BDEACE59DF26461EE0DE4ACC02DC55D4A2DCE058925D10F7CC0DBECB0DFC510FFC2F6E3CBBABFF47DC194FF6CC50EDFC00F7647BCF1807F74897CB61AE1EEF2D5EB974E2E431C3467CFCF1C7040201351A3EB04AA5826F337C7E946C781CD64C858585442211CA760C06D3DCDC8C3E0E0DE887A1F14F7C4E437157197ABB643285460D6F484CC57EF2F6BB33478E5D3466BCCF49EB0A1C4DC4CB86CA5D08DBEC24DE2BC45D45E4A117A982EF50C2D7872743D98EE25E742D5C944C03D0D1B21D4660F8D4DBF6E52FE00ED1F7C35D4C47706F6272B39352F66ED80CB82F9B36CDF6D8114547BB41F7F7DFFF0144D723F775D2F7746B7BBAA1FC5419749A5E9DDEA06B6D6B3C71F8E7157367C347DA3E6F616AE8F58298A4F6245A7EC07D8CD5C598238E0927CE509D7D4A4222C4F1B4C7FD5CE2056A2C4F91C206DCA5890CF09D75EE0AD5C93FEA5727B283AF24996560E401EE7A5AD68B70AF4B21B5D379DA9CE29EA28A4E6E3AE77E7888AD83FDC1AF579B4D583072D4E48103260E30993B6ECCB6E54B0EBCFFEEF16F0EBADB5ABAD9595EB6B7BAEC687DD9C1D6CDC9EEB2B3A39BB3A3B7EBB94B2E8ECE76D656A78EFFFAE30F1F7DF8C19AD52B67CE98366CC4D0112386998D1DB370FA8CB757AF3FFCE17EF79F4FDEB238136DEB46760DE65CBA06AB22BCC565A29507FE945BDC9133807B6518AE2D85DB494CEFA2659725D1422CCFBCBD78CDF4C1A3776FDA1E7DF7217297608341A543BAFD7DBD5BE675431A5AD5A23BA661D182A15C2EF7B87069D9A4B973874DF864F51B09FE77BA0465807B333E03701761B3D2BDC3B196BE2CA750AED335DC11F7BF863BD52A00F29878CBDF70A7D8FB275B7B24DA7B44D85DBA6FEF7AC7F9C21BB317CE193D76FCA831DF7CF30D8FC7830F0CC5BB4C2683F5106C76C010FDD8A07C5B5B5B4E4E0E0E878B8C8CA4D168E8E6083C199A51F83FC61DB90E4AA651E940798532EAE1C337376C9A3A74E40AF3C9A10E679B187C092F47484F13D3906D7625AD7FA7ED7F2A4F99DE17F8117A1D13D4E606766E5D5812E98C17F5BC2FE05E722312D047718721D4F830D2FF3DFBE72FE3AE21B155FD70AFA7B1F8D1B1BB57AC9E3274E8BA05F35DED6CBA6552831EA6CDE369F577B517E0DE6DD05755971DFCEC93B99326CC1D33F6E3751B2977EFE744C6B52650D23DAE83EC91BFD8E26CDCB2BC6FB58463E1AF06CA51CD017A511C55184B8174C590F997AE039751871CE867FC15585E0F2D479C026BD33C23EE8F0F99A047C521720AB73199D08CA776C2060D274DC44D6BA6322B30F8DCB884BB67CE5E3E74F887B7DFDA3A7BD6BCE1C3A60E30993178E0EC91C3260D309938D064D2209349832103270E1D3461E810F3E143174C9D3C6B82D914D3B113C68D361F3366CC88E1834C4C0698980C1E3C70CCE8910B66CDFA68D75B4EBF1EBB73DE23D12B04EB151A697501E3E44372F2C3585E4E39EE8A3BED46387D39F9E485DCA0C8829BF11D18BE9259D041C9ACC6B2C35D7DDF5BBE61DAA0515B96AEBAE11F2C151ABB7F80A90795BBF1FE91FFDAF61AF77FAE41A18AE28EEEA201DC7FFAE6BBD9A326CD1F36F1BB9D1FD3EEC62BF3EA01F7466C9A8C5A581F49E77B3CC059F991ACFCC168D2312FCA51AFBFB05BE629DCFB8EA9521D0200F7043BF787D6AEB7ADCF5CB375D93475D694C143278E1B7FF4E85128CCE11342CD0E1F12CA7674CF3BAA36E00EA57A4646466A6A6A4444445A5A1AFC14D604F0A7C133D1CA1D5D933DDBE051995EA385959C5E0BB87775B65FF30F58BF60F1C40183D64E9A7EDFF5B290972DE66677503852BA404613C8C8BC57853B04BD8E09AA720327AFF66122B04E73F58361D9AD28101F1E07E24176A8F161E4A9B7EDCBFF117729952DA473DB99DC4A22957AFFE1D6F90B270C1CB865D952AFF3670D1A60F66FAFDC8DFB6490AF2220DFB75B466BD0ABBB55B93919EFEFDA3163EC98E513277FFFE6BBAC8711FCDB61D5E1298CB3FEE13F59C71E75E25D0AA9B91D0FA0779332FAD243CEEC9F0CCF9B247B9F889F6D59E7835478818E9CD1954883098E4E3D23EE8F654771D773B2A07E6FC190EB12B00D2984361203945764E4F41697B7B1B89C8761379C9C6D3EFBFC8B4D9BDE9A3F7FCB8CE9B3060F9A3964D0F4A1C60C1B3A6DF8D029C3874F1E317CB489C908139351034C268C1E3977CAD4A5F3E72F5BB060F1FC79C3860E1E32C064FCF0111B172D3DFED957571DCEC75F0E4CBD1C1C6D7329D5D19BE8E88BB57287CA9D62EBCD74F0A738F8168444A707847561F8868CAA7672461D9E9BE47BFD9335DBA60E1CB962FA5CCFB317DA9B918EDB60D5A8E9D6BF3E5BE675431A7807F68180B05CA1D76D4AA5D2B777BC3165E0D88523261FFDE0604634B1BBB855C82E6E4C1500EEF9A18902CF8764BBA0D4A3EEF8A31EF4D3FE1CCB20E424C897C49DD20FF7BE136628D63E34C740C03DCEDEFD9ED5B9EB964E8116F66BCCA7989B0C983CDEDCDADABABABA1A3E21800EB8433D0E1F184A7874CF12FCB7B1B1512010242727878787171414C08FE041B1580CD53DFC99F034F82FF2373FD36049906B95008AAA1BE9FAB7A9AED6E3DCF925D3A6999998AC9F3233D2DD4796512064A7B7E11950B6CB683C0981F9AA70D752D2D0EB98A0363770F3017782B307FD823FE05E71270664477107D9E14DA0C0EFFF9EFDF37FC15D41F90DF7522C1177E3D6DAE933C79B986C5BBD32D0DD0D8CEDD628FF5BB84BE522368BB66DCD2AB072E38CD9C73FDCC77D18490FBE911BFA30D5E6C2FD1F4FA758BB16878677C5931558B60ACF1527D1209264BA3485214B65CA312C785C81E5667ADDC2DBBA3FFCC18AED1AAC260854787E5B2CE909EE482FCD4F7047A606A4879BA9A4723A5349CD89D8C6446C1B8E2CA6B2642C9E363347959E25E2F2EB49E49C4751B880C0FB4ECE81A74F1DD8B2E5CBAD5B3EDFBAE5B32D9BF76FDDBA6FDBD6BD5BB77DBC6DDBBE5DBBBE786FF74F5F7C617FF284CFC54BA18181D7838343FCFDF7EFFD78D5922563060D363519B47DDE12EBCFBEB9657536FEAC4F82A327DED91770C7597B102CDD0177863D7264B5E47A3CD3FD66672ACF50D0D449C96C20F289571F7CBE71D7940123E68D9FEC74DABAA1AA06E611942620BB42A37E8DFBEB86E00E85307089EED68047A0E05DBB7CE50493918B874FB6F8E4FBFC2486A1AC03706F48E103EE7C9FF074EF70BAD3D5845F2E24FF7C816B159C6E17CA38899C0AF914DF7F1CF4FCF727BE23B823FB649EE01E6B77F9AEE5D9D0D30EFEA76C579A4E1C676232D57CA2838303F00D9F106487061FB8ABAB0B56457DB8373434F078BCC4C444C0BDB4B414708795163C0770479F806EA03CDB60499069147A00A55BA3D6AA6A2ACACFD9DBCE35473A5CDD386546B497AF22BBA08B95D68CA14A281C28EB4438FA2BC41D3DD51DC5BDE641427FDCD1FDEC60FAABC55D4360E8892C08BAC31D2C93D0D85D0C2ED4A405A9B8C4ABA12B264D819273FB9A55C1DE1E861E9DFEEF3FA06A94FD39B87789DAA944DC86A58BA70C1DBA7DEE02AB4FBFE43D8C24F804F37CAFC79F72B9F7C32992B367FDC324601D02A0F799AEC471E0110D91AF25419D9E96E975136BED76FF3B0BB66B10E00EE2B744E38CB82367821A717FCC3A9AAE24823099284E25CBF074399905919018423C95E91B9C7BE7610B8EA44ECFEAC92D5008329A08E492C4A4521CBE088B2BC4E1F271D83C0C2E1B87CBC0E2D371F8FBFEFE31376F3252522A7272646DED3A29720798AE96161691E4EAE0B86EFE22539301CB4D271F7E77EF1D9BF314AFEBC98E5E38271F9C9D57EAE94BA9272E604F5DC29F728361C5CD24CA85AB1D295C43697B1735AB91C0A75D8F38B8F9EDA926C3678D1A6F7DF878756939CC23AD5E87F6C9F31AF7D70DA1BCDB789E097AF811F8F3F4F41C3B7C24E0BE7BD1C6471EA11DBC924672567532574CC9171373D37CC209F641D8935E4CBB2B3CBBABB4E33EB463DE029B9017E14EB144F6DED06D82C071D2695F088C306C83C996FE10F8A9D17704779AB52FC5D697E37A2DDEC20D364E31EE576ED99FFB6EE73B4BC79A4F1E3C74F1DCF9180C063E21180D6AA3BB59D01D32300EEBA7D6D6D6F4F4F4B8B8B8888808F01DA0EFECEC04D6C10B78025AB6A3AB81671B2C094A9D0A706F6A8795875EC066BCB969E3FAF90B964D9AFCDED295C5A9F8260AAB2C2EB937B340486436C6610DFCDC57853BA88DEE72817425528AAF4780EC29B6171817031A225264589614C38427A03BDCE1F94FBD6D5F5E847B2F354D83672B52A96A1CA397CA3730D2BB291C158EF622DCD5A515C7F77DBAC46C02E0FEFD679FD6961675B536F568557F37EE861EA8339052A30F770DD2F327CC2FBDFBC5F3B32798999B98C0BCB866EB9C191193F730067BE672C461AB149B73F957EED6DC8F6D8DC6A8086C3D55A025F3D0A0773744EE8145E4A809C8C1D5A2E0B0C2A087CA548E8E9CD110965C1796A4A3C22CE041D4140E044A7525950D51C310CF80290643888280446E8C8CC4949299120A0B0A79084C378890C1AE23505AD8DC36BEA081CD69E20ADAB3729A32B2CB186CCCDDFB91C15788D131F58585AA8E2EF43E047A995CD1D199C9629FB7B05E3773DEBCC1A3F72DDFE8FDFD895847E4226D9C8337D1CE9B64E70D653BD506098C909C0228E7AE2848D97A6E694938569F5BA3C8A974FEFAD08291E680FB47BBDE890B8B9489C4B0447489848DAD2DAF717FDD902A18F8032ED1C38FA0FCC58B17C70F1F3575C0D8BD2B7724F8DEEEE49702EEB5A97CE4682A2187E7F9006F17883BE5CDB20F11385C6342CD7ECC876FFDC27DEE7F127763179208EE8C3357624F5D04DC53DC82AE593B1FDCF2C6A251A693060DD9B87A2D8944824F0846C376067C66F81EC3101E81117804564E0281203636F6D1A3472929292D2D2DF0B7C093E1094006BA32409FFF6C832541A15542EDD8DCDA00EFC7655077AE5FBB76EEDC6513277CB671730986D04C655625610D59851222AB2D096FE0653F65EB7F4C7FD0FB077E841E2C7D16F7C6C85428DBFF3EDC91129ED4771EE463DCA5F945873FFA789199F91813931FBFFCBCB6A2A4ABADD9D8B7CCDFDC8CB8C3E029DCF5DDEA8B679D678E1B3BDEC4E483A5AB6E3B9CCB8B4A280E8F4FB63B1FF6AB05D6FE42D9CD8896A8546122091C7F21EE440E4C8AA687A98D0F52906942CF1227D18449E41E460682BB517623EE88EC28EEB0ADA3C3238111889A8844456229894C059189D6F230DDD0C0D4EBA47344BCF42E5E5A1393DDC4E2756464B7A66557B2B8FC84E4B8D0EB980761C53C7E7B45B5B2BDD3A0426E4560902BB3684CFB5F8E2C359B327FF0E8036BB65F39649DE4E293EAF81BEEA8EC28EEB4B35708CE015D293CC0BD2A86AC492F97A597FA1CB75B3266D2AC11A6EF6FD91971FB9EB8B30BBEE11299B4A3ABF3F154FD57B6D7B8FF434DA3D1A07B66D07D1750F0DADBDB9B8F1C3367F8C4AFB6BC4F088D14A7553493B39BF11972467107268379E936DEDA1F6FBC3635C3D8A50CE0CEB50CFA0BB893AC8CBE233B671EE34EB2F5253AFA3F3AE91A657329E16240C071EB4F566F9C3B7CF4A4A1C3F6EDF988C3E1C02784EA1B3E338CA0653B34101CB63FEAEAEAE009807B4C4C0C1E8F877515BA0E409F037F233474FCD9F604777D534B3DBC318B4ADCBA7AE5AA59B396989B1DFDF0E3323CA195CE6EC6530D59F9320A4B84A31AB8594FD9FA1FD31FF4A782E20ECF1126518BAE8553CFFB02EECC4B817DB8A3D5FDABC51D644771474F95E9C3BD5590F1C3BBBB17988E1F37C0E4D0375F35D654883A5A75DAE7EFCE7A85CD58B6FF0E7744F61E9D5221396B673375C408C07DEFCA75612E978A62924BC2E3A34F3944FC728A7ED6A3393C419E4281BF0ED9E34464EB491C34308EC6A8333C225061D94A0C0B4600F71E7ABA9E9686E04EE13CC6FD89EC4A1A534D65EAC9EC5E22926E1212F82F04E94682C854919028C94C158505819728681C152F53959E23E6A5375118CD744E675A5647466E3D5B90958A8BBB129A7CE75E2997DF5E5E25A96FEA96C8901ED3B4DD7C3CE9D0BE2FE60C1BB374F8F8A3BB3EBC6B7916EB1A08B8E3ED9F833BE7D28D543BEF9A70420FB7B425852365177471F223DC025699CF98316CECF6156B6FF807A3C754551AB5548E7484F7AF6DAF71FF871A94B42060DFFE8ADCDCDC43870E01EE8BC7CD38F2DE97BC0729D28CAA2652563B3947C52E6B89E7D2CE5DC759F9114EF900EE998E378075F6315F209E69F934EB689E8B3BDD361864EF8F3B72730F5B04778C8D17E01E637739CED5CFFDA7636F2F5C3673F0F0A923465A9D38959797079F102887CF0C237DB8C36A0928AFA8A8603018207B7C7C3C8D46832D12B46C47DB1FC80E0D545169E4BD807B731DAC3EA804CCC6654B564C9BB2C4D4F4E2AFBF56E0896D7464D3BB37330F705750D83DAC74E3BEDAA785FD83F4D7BC7FB49434C01D02E3807B616818E59C0FE0CE720B6A7A8481C76558561FEE4FBD67FFFC05DC35C69B8A3C390F928D5C9ECAE69691A95FECD83177DC38F321834FFCF4437B539DA4ABFD1FA8DCFBE38EC8FE047761579BFDE99393860E9D6462F2C586ADD117BC8AA393F2EE463C3A661B75D852E01E284E20F41D4E5062682FC09DA5C6717AA9193D9474188172DEC0CE864025FE187774574C3FDC7B295C03F971601CD24345A22532C177244FFA0E82C0ABF469D99AF45C094BD04CA4355158E2B46C51667E332F831D1913E51F847F10DE5250A46FEBD275087BC532834CA9EF14A5DC0BFB64F3CEA926433699CD70DEF76DB49307FE4210D6887BFF7D3228EEBCCBB7526C3C8BAEC5699985627256172DBB8D9EC57A10B763D692E943C7AC9EB5C0EBDCC5FA6AE4982A7CD535BAE79F38F02F69AF71FFE71A20D8E720D4BC9F7CF2C9F8E1A3564F5E60F7C5AFF9F134596675233153482FD0B0CB6B23699433A1803BF1B42F5AB9A3B8334FFAFD05DC09D646DFAD03D0DB36A1B8275B7B44595C8C77F68A3AE7ED72F0872DD3E74C1F3874EE78B32B7E01555555F009D14D0D18413F338C4385DED2D2525454442693A3A3A3939393B95C2E888FAE03D0E7BC68870CDA9EE0AE6B6CAA31F46888C909AB17CC593269C2C231636E9F3B578E23B4D2184A6E5AB7205B4A66E858020D15390AF714AF7F9CFEA0F78F9E9601E539200ECA8B9269F9210FC867BD53ED2EB22F07374761C1F4BF1B77585749FBE19E119FF8D1FAF573C68E9D346A84F5F123E28E168544D8AD7F7EB70DAFB0BD08F7A6BA6A8B43BF4E1E3264D6E061BFECDA9DE215541811CF0DBC1E79D426EEB86D8EDF35001DFEAE1E0A0F1C47A17F2EEEF21406C8DE43112852E9722CC3C0CCEC65A5CBF17423EE88EC08EE34261A23EE6C03F971601C4D0F95AD25D2752406444366205DC21903AFD5733334BC2C0983075B786D3049D37244E9794D2C01ED5E787C6008332A4E585A6110C90C729541A1368865595486B79DF3E6590BA69B0C796FDE0AEF1F4F26B878273978BE10F78B37B0F63ED981115262A682910FB8B7D232CB08EC8F5721DD87CD379BE274DABAACA008D908359EDC6C9CA8FFD2F61AF77FAE4191AB5221A5190CEFDCB9B365CB96B143866F98B1F4C20F161538BE3CABA60E9726661601EEA57771803BC1268064E1C7B6BD926617CAB34070671CF37955B843791267E39E7CCEEFD1592F9B7D07D6984F993678D8D2E9D353E2124070A8D6D1335EE0EB8B7E66805B2A95D6D7D7E7E4E4C09A0970C762B1191919403FFA1547B74BFAFEFBDC06AA28D532C0BDBEA1AA47A7C4C43F5A367BFAC2F1A6F3478DC2845C2DC5E05A48545D7AB6869B26C6530DDC0C199EFEAA70EF616401EE101D355D9C42CFBB729FE8E209B873DCAFB444E38075F8D13F803B6C9700EECD1C2EFD41D85B2B96CF1E3366BAE958676B0BA54CA8524A7BBAFFF62E6411D99F877B515EF6A16FBE06DC978E33B3FEE40B72F0CDDC07D1B80B5E8F8E5B279E72C80FBC097F1AD4ECA039082E8CC3BD08772586A1C173B5040E4C0D359183EC97A77251D99F8BBB9ECCEC253E4E37E9B7A0B243E009A8EC3A2A4B4BE5A8E93C25334D42E3B613E95D349E949FDDC1CEA8C4D37891B1947B615929F896BC427543AB41A602DF650DCDDE0E2E07DF7E7FE168B32523C6FFB46DF76DCBB3807BC4C9B3CF1E4D4571A7BB04D3CE8700EE2D094C25B340CACA6F6764B771F37E78F3C30563264E1D3EF6F80FBFE4A46520131126E36BDC5F37B4098542B4FB01187177775FB468D1A88143B6CD59E975C4A19E9AADC8ACAE4EE54958C56A5659DEB544DAB9EB64BB20B2851FCB2A486013C23D1D08B8D38F7ABF2ADCA13C4976F4C15E0C8A3CE3796ACFA7CBC698CD183A62FDC2850216073E1E802E33DE5803AA725827C1087C8FC562714D4D0D7AF9525454148140C8CDCD05CD614D004F8311581F407BD1A932D0FA70AFABAFD4A965C931E18BA64F9E376ED4DC11C338E11145C9A98D78527766AE9CC1E94C251A7899C264E2ABC2BD97998DE20E25BC2495911B7C8FE0EC01B8733D425A63F028EEF0F27F0C77DCF59B3B162F02DC674F30BBE064AFD7C8B51A454FEFDFBE99FF22DC390CEAD7FB3E993478F0BA29D32F7CFB0BEF5678DEBDA804FBF311472D134ED9E5065C932411D478A8A6597A321BC6D19DE31078048D96C804DC7544AE3489264F81323FAD879E0EC5BB82C03070329FE08E80FE0477BA9A4A472A74C2F3F2447634DD141604709793590A864046E389286C114320E164D41399D991098288D8AC84D46AB6A0ADA0585A55DFDB2996D435A693A81F6DD9B166EAECB943C7BC317BB1EBD78792DC82525D03EE1D767811EE386B2F81D7DDFC90E8EA303C54EE6A41A990932FCE2C3DBDEFEBA566D3CC070EFFF1F3837C26BB5BA7876F73DF1ECB7F677B8DFBDFD860D3AD7FDA3ADAD1CB975A5B5B9D1D9D664C9B3ED264D08E39AB828E9F69A5E729D2ABAA93B95226827B76702CF3FC4D8A3D7238946115C8B50AE69C0A601D45CE867C59DCFB1F50EDC39D68E78B77F4C3B8F8E3DDAE44B8781CDBFDF19251A673868DDAB66C796176AE442251CA15C87A0818D6E964126485D4A3EF168944D5955502812035390570271188050505603A3C071ABA3E80869E16699C00CFB627957B5D9556254D7C14BE68CAC439A347CD1D3634332EB12821B90E43ECC9CA935058EDC9780337AB2301F727707FDC29159AA74CEFCBB3B8E39DDC5F1E77D01CC51DF5FDB1F21A625A2F354385E7CA3074259ED54D4B3330337514BE02478792163D55E631EEC62B989AD9FCA42B57B72E983F73CC98799327BA9D71EAD5A9F53A95B1D3FCBFB7C11618B2F7ECC9015584F85E5D77B78E8049DEFFFE7B13070EDE326BAEF7A153990F62F2EEC5445B9D093B641977DC36CBE76A572C569E4201BE7B283C58872165FBF370EF26F3DB6371A278A2819505112591C5A9648320B75FE58EEC5D41CB76047A02558D7F4E40765829C2FB6BC96C584DEA281C18C2468094C852D2F8E03B72991B335DCC4CAB4822726E85316E3D2CC19025F9A59A8A064D7593A1A5AB9A9FF5D0276899F9D4D943472E1A31F6F3755B6F589D615E7D4874BF7AFF8823BA5B067C07D0FB7C874523E9E4A5DC8088E2D084D23BC9726A7E775695945722CD2C73FCFAF0CA49B3CC4C867DBD773F97C2ECD668D1A5E3F164FD57B6D7B8BFE2D68B1C37451ADAEB5E5F7D54DFDCD42EEC82850A6ADBC4F8848F3FD833C9D46CEAC8711F2FDBD648CC54082A2BE2187276A998945713412DBF8DC5DB05926C910ED9816C009D6D11C8B140862F7B111310DF2F08EE6867EE7CCF3B9E9FFC4CF6BCF6D0D16DFFAA8DAB4D274D3231D9B96C45AF52A3556BF4EAA7871A85B2A9A1312F2B9BC7E19270F887F71F50084485B113A5976A50248AA55DBD3DFAA6DA2A9B6347270C1D326DE8B0F757AE2AC153DA587C2153D0822177A452340C7E373D5D9A4A33E2DE97C7C2FE2EC61B24F54543863C2D3B04EC4677ACC348473C89E37E25EEB40B14EF99FE7714789E9692214E816DFF0C18EF4CA0EAA8994FFF962741407F72B30E0D215303BF11FDBDFD3E838AF438F07CE41C41E3C53B72634FEE423ABF9DC96F66A7DD38E3BA6BE9F27126267B76BD91101DD9D2DCA8562BB5FA17EE9681221156B7D0E0AB05FFD5181BFAA3976AB03206CAE117C9618EEA543A831E1997497CDDDDDFD9BC75F6C871B3060C8DBCE89BEC11C40CBA43BC149468E59A7CFABC12C39225D35558B696C09326515458A6F1A2ADDF9D3383E00E2123074E6108EB33342A12726A63DF7F8D0748D92A0A0CD13034649A06193E89715B07DDDC41D78B4F86C8946C89272AA8020523BD1DC36CC3323B889CDCFB71B1673D2B93C9CACCD2DE927A7D71434F7973259977C3F1D2E1DD9FCE30193467C0D0DD0B9779FE721CE37B15E77335CAD1EDE1699714276FD2D900EA9960AA5320D9CE8F6A078B860FC1C29BE6184CB4F3CF0F8C956133D5B46205AB48C6296DA5E7DC3EE3F3E5F6F7A60C1CBB6CFA3C8F336E751535B0F9A3D3BCAEDCFF971A8A7B7FD9D1FB2134B6B77649C4803BD4C551E111EFBEF1E6C4D1E3A68F343DFEEE97ADE41C39B7AC2185AFE694776233ABC2C8D5F78928EE141B0468001DF51D862F8BFB938E0790F4C79DE576C3F78BA314DF9B372C5C3E5EBA66ADD99469268377AFDB6050209A3F1BA554D682E2CE6213B1B8C88761743205B907106C92BC4CD3756BC562614FB7AEA1AACAFAE811F32143660C1DFEC1AAB595447A073B43C24A6FC3D1BBB0343D23BD8791011BF5FD64873C83FB634F339FE4AFE02EC7715F027754766310DC097DBF1A898A8444F12446DFE103F7E1CEEF6200EE698D9CB4100797ED8B9700EE1FBFFD56524C4C5B6BF31FE3DE6DEC46FF55E0AE86F52BFC22A5FA31EE3A1D82BBDBB973BBD66F04DCE70E1A157D3920C533841178177F2128D1F242F26957B4535F186AF10269124D8D03CD912B72FBE30EC5BBFA09EEC889312FC4BD7F10DCD5145ADFED128D41D1373EE1F7735F45E677245365649E8C9ADE85E734A7D0AA627119372270EEC175A90C19BF509D5921E117D513F9189F1B0E9FFEF8D58637170F1E39D3C464ED68F31FB7BDE5FDD3B11BA71DC26CCE279DF14A70F4C43AFB129D03B0B6DE384B4F82B5372C1A444B1F864308C126A03020568EC94670A71703EE6D8CFC18CFEBDFBDF9C9E40163164D9CEDE674A1A1ACCEA037A8147F7F2F9EFF87F61AF757DC10DA9F877B9BA84BA29003EE6D6D6D37AE866E5EBBDE74D8C8B963275C397DBE9D9A2762147651F274FCAAC6784EE543526324FDEFC69D7C36F8DA8F3634FFDB3E3F9D7A77EE92F593A6CF1D3AEA8BB7DE7911EE922E61737D03E0CEA633F0A99898C8471C0653AD7CE92B2A811591A8AB5BAFADABA8B038F4ABD9E0C133878DF868ED865A2ABB8B9B25E3647612596202B38795091BF52AC2D38BF7FF33B8FB5AD86C9EBFC0D464C0A7EFEDC626267676B469342A8DEE8567CBA0B8A3D739C37FA100FF6BB8C3AF4071FFAD72D7AA6552B1C3698BADCB56CE1965BA78C478B4DF4486DF6D8C8B6FB2F5A554CB8B6A2C4F9ECC82A18E9006253CE0AE2520BEF7E18EF8FE97717F9A7534C627FC7EEE03EE621C4B88638A883C484D2C3EEDDA4356E06DEED5073DB955DD79D57241493B23BB2086F0E89CAFDF11FB9BF617F72E5BB3C6D47CA1C9B08DA693F72F5973EAAD0F437EB5245E0E8E77F000DCF18E7E491697938E5F04DF61D12059F902EE786BFF7CBF68C05D4B2B01DCA5EC92766601E36EC2F1BDDF4E32193D6BCCE47356CEB5C5D5068D4122FAFB6FAEF27F68AF717FC5ED45B88B143295F1ACD8BA9A5AAF4B9797CD5D306EF0F0E5536611AE8443E5DE4ACC5270CA00F7EA4734A8DC9BA3987F2BEE383B1FAC836FD8C9F3F4803B4E9F7EBB7DDADC0D93672C1A33FEC4C1AF0D2A2D727FF767D2D1D28AE20E053B26293931362E9DC7D7AA5FBA8B5AC04528ECD469D5356565277FFEC974E0C059C347EEDBB8A581C113F1610B264B44E1CAC89C5E36B2C716DD12EFBF78FF3F83FB855F8FAE9D396BFC8081073EFE888CC58A455D80EC1FE00E5F2A905D2C16A3B8EB5EDC3BDB1F3760BDBB57AFE9D1A2B86B7BE17DD45289E8F077DFAF99BB60FE68B33566D308C177887E37693E37931C3C536CDC3056973438BE22850D431477F47C18A3EFFDF6CC18F7A5BC3CEE9097C05D49117462E81D589690C02D0D4F227B85D0FD6E943C4A3514D5B751D333EE259083EE45BBFAFB1FB2B9697B29330A73CDD6F9F89E8FDF9C3E6FF9D0312B078F7E6BD26CFBDDFBA3ED2E42E54E3C17483E13946CE90EB8E3ADBC68B601541B7FBAFD159CA56F9E6F94029B03B8CB694552667107ABB00CC375FEFEE4F441A693868CB3FAF5547166A156A615B50B5FE3FE3FD49EC51D8D42A3468EAF1B0CA5C5258ED6B633274C361B3A72C7E2557971D42642667D2A5F23A85273CA01F7FA2846CD03D2DF873BD1887B8AAD57ACBD27D9EFE689B7F76E9A3863F584A98BC74FB86C67FF22DC1B6BEB9AEAEA0177120E9F929008BEE767E7A0E70CBC54536B555D5D1D5A8DAAAAA4E4F88F3F00EE73478DF962DBCE269600C51D040407A172EF65666AC9BCA716EFFF6770B73DF0CDB24993CD060EFAEEB3FD2C0A452E93E87448676A8F27D333ADB717D9A1271289D0333460F8D770D7756B51DC155A258A3B6C3100EE9F7FF8D19229D3978C9BB863E642EE9D2846F03DBAF7CD3890DDCE1D6773194C47F7C9E889E9F214E464470D9EFD14EEE8C1CFBF8A3B3A82C6F8A3DFCDF1C701DCBBD939223C0BD9E19ECA28BC1F47F5094DBF1EDE46E41AF26BAA926938EF1B9167BCEFDA5D0A3C621771DEBF02CFAE26339302AF9C39F0FDDE25AB01F7C526433E99B5CCF5A3AF626CDD48E783181742F1F6BE580B0FB29D1FD32118C51D73DA3BC73B5289C9D1D14B65D442C0BD935DD4C12BF1B33ABF68EC745393113FECFF864B66CB3A65E20ED16BDCFF871A2A3B8A7B9FEC90C7FDFAF71AC0C453BF1E993CDA74DA28D34FB7BE5547CA04DC1B30026D5AB58C5ED410C76E4BE4670746FFDDB827D979259FF1C77A84FCB8F5DD8D93662C19670EB83F0CBEF222DCABCACAC177C01D97920A653B118B2B2D2CEA35DE74FFA55A1FEE95C5C547BFFF6EDC80010BC69A7EF3E63BCDECB42E6E96949D81E2AEA3A775D3D3FF1FAEDC8F7DB46F81E978F341837F3E7840C06221B772D66B559A3FEA7E0070170A8528EEE8B9A7203EFAA33FDF00F71E4337988EE2AEEF4170978984EF6EDB3ECF6CE2CA09D3F62C599BF728957F2D82E1732BD6F222CEC19360E7D14DCA40F7C9C0882295A925F0D43816F88EE28E5EB68A9CCD4266A3B2FF69DC21F0A397C0DDC0CB575005AD29F4AA47989C5B8FD2AF8755C71114DCBC6602B7300A4B09BC470CB8C3BAF188793D322302D3C12FE82EAFAD65B0C9A177BC0F9DFC74F16AC07DDDC0B19FCF5E71F357DB14072FC09DEC0C0B9A2FC33998E5788564E983E07EC233DB331C70D733CA64940209A348C82E56E5373CB818B469D6F2B126C3F6ECD89D1016DB59DFAE94FCFDB745FC3FB4D7B8BFE286CAFE2CEE5A780C7EDC6BC816A41FFEE68709C347CF379B72E8C3CFDB58856D94DC76728E2EBD4644CE6B4F4D176232892E21AF107786C573704F75F44D3E1710E7EAF7F5FA37364E99397BC4E805A666A4B838835AD7A37D4ECA8A8A51DC531393E2A363A84412708F7CB35F1E77A1B01370AF282A3AF2DDB750B92F3235FBE1DDF7A172EF6067889969220A574A62AB29482782FF0FEF73FFE99DF7E78C1E3361F0109808597CBE4EAB06DC95EADFDD8BFCA906B8777575A1A7DF410DF1D77007CD9FC25DAD5602EE5B57AF993DDA74DDE4595FACD9569148C9B91DCBF2BD1D637101EFE88577F0D453325578BE96940E23B254A69AC053E259C8DC2122FB6174B03246829CB0F897707F2EEBCF99E32A529A869E2123F36AA27182E07B9CC0DBC5E1899D249E9C934B0DB8CD087900953BD6E746FA83C492044A690AB38E9A26C92EECCACA6DE36408C2622E7FFBEB9B1367AD3019BE63F8C40B1F7EF3E0B023D13900E906D2DE9F7526042A77EC097786DD95D4E31E591E612A6C6E0FA34C4ACE17D30B459C125D714B62E0BDDD2BB78D3719BE65C9BAEB7E571BCBEB7B34DDAF71FF1F6A7DB2F7C71DC6F53DC653987B0D993CC12F07BE993874D4F229B32CBFFCA18B57DAC52814338BF419B59D846C11214782CF893DE5FEAA7047EF9EFA14EE587B1F8C8B7FCAF9C04767BD0EACDBB171DAEC694387CF1D6BCA23917A354FB38EA638BFA0A1A616704F8E4F888B8AA69329B59555AF04F7C5E3CD7F7A6F4F2393DFC64C13D2F9423247426429491C1591A3C031FF605147F2FF5BDCBF7DE3ED99234602EEC77EF83E373DBD5B8F9CA1F8B2B8C310FDD19F6F4FE10E853C827B57D7C6A5CB678E1CBB61EA9CAF37EEAAC7300BEE26707DEFC4595C203879131CBDC0743541F06FC01D3DA05A742F0EE7EA47BC1C54118D91D033BAA869390F124AE388E977E329C1F7B3C253EA08BC6A02BF02CF2EC753DBD3B30C15F5E28CFCB84B3E5FAFDABC7ED0B8CD834C4F6D7A2FF8C0B1141B4FBCBD2F8A3BDD2E30F9C845C03DE5987BA6FB43147739295F4A2B14B34BBA8B5BF1D722F76F7ED7CC64C4CA998BBDCF7BD414551960F2BFC6FD7FA7A1DC01E410D87E86A0E34D2DCDDD3ABDB8BDF36650C88685CBCC070EDFBFE39D871E81F5E42C75468D8257DE49CE55B1CB24A4BCEC90B8543B7F9C6D00D126806C0D22232E23B7B73E8D0CA9A7FDC816CFC9EFCF67FF2D28EEA8EF28EE045B04F707475DE801F71E38B97DBBED9DA5A613260E1CFCE3BE4F6B8B8B90B59356875CC5D8DDA3371E2F85FF02EBCDF50DF9D9392C1A1D708F897C24E070919B491A2FC27EA9A6D1A9753A8D5EA7A11108BBB76F1B6B62F2E6B215E70F1D6D66A7A1B8A3BB65404358B635C0221151BE6F51374A8D08FE7881FFD3B82B8CB7488577E86164B5C512B81E21580737F259EFE2EB8FA41836BC0A864A021F22C3727E7BFF67F2B2B81BEFCA4D93E2184A1A5FC64893F3B3DB1882F498C45DF3164D1D3274F1E429E76C6D4AF2F2A072D76AD57FB05B462E973736368A44C80D3CA1FD859A1D6D52B904646F1775C8350AB14202D6C39A029F9C3C61F8C8C90387AD359F1EEF114CF2BE5EFA3005EFEC4B3D171473DCA5F47AB41CC301DCBBA9591A629A02CBD653D25F847B3FB57F973EF45F14E469C6B9FC648EF763FDF15C4E07DC75CCAC4E0C1D7067F9DE207B5CE104DF297B94DA4AE0180AEBEA716C464858B2C75552D0BDFC687C07B7505FDA989F8815E5E48BD2F3DAB9992D34DE8DD30EBB27CE85CA7DE7B0C9570E1EA79C0DC6D878918CD76CE34F79B21CAF709DAE618F7BA6B9DE114673B5A44225A510706F25E7D410D2DBD24A0F7FF4D5F421E3A70C1BFFD11BEF170872B5F2D7A742FE2FB5E7E20E8F74747400EE6D0D4DC11E3E2B67CD9F3060D8576FED890FB8D148CE52A557CBB96528EE62626E66704C8AADDF2BC11D7DE1B3B86300F7E36769FE77EFD8B91EDCF2E622537328217FFAECB386B25228469EC2BD5BA3ADAFAE69AAABEFC33D3A2212709789C4FF77DCC7FC0FE02EC5D00177059527A50B50DCD3A21376CE5900B82F9D3ACDD5DEAEACA000C5FD0F2A77994CD6D0D0D087FB5FA8D9A1C1BCEA8FBB44294571C724244C1A86E0BECE7C7AA24730D1EB5AD9FD64BCA30FF54C60F431E7E2D047D214960ACFD791338078A8DCB524C17F09F7741535A30BCBA88C4CCD0C0D6307DCE285DCCBBB175B1A8551A5153793F8F99158E6B50872F07DCEADE80A2C4792555686A348F20ABB04391DBCAC2E4EE67DBB737BA62EDC3E6CC2F6211383BE3C4A3E139462E501DBB2C8BECA931ECFE2AE2217CAA885EDE49C3AC09D5F62F9F9CFB3474C9C3878EC7B5BDF1650B93AC5DF7F43F3FF437B8DFB2B6E30AF21CFE20E0B27A0595B527EC9C165BED9948926C37EDDF319F54E14E0AE4CAB92714A51DC85F8EC8CA0E8578B3BFA421477F213DCC34FB952FCEE5CB570DEB776EBBCB1A613870DFBF5E0C1D6DAEAFEB8EB546A1801E201F7C6DA3A14F7A4B878C03D8DCB938B25AF71FF8FB877D3330177199E097F9498CA93F1B25AE97C5E64ECB6997301F7153366BA393B559594742327BFA8E5CA17F60F2E9148EAEBEBFB70474F887CD9867C0F1552047771A742A792AA64BA6E6D6F8F3E212A0AC1DD64E8BAF1D3122F07913C42CBEE26E1EDBD69CE01D1871D8BAF444813192A0C173D6746964CFF8303AAFD41EF9FA728FF2D64E4E00AE4C92C86398EDC2DEBF1047FC23A3A97617ACA887C119ED5924CAB7A84C9BB139D76ED21F7CA3DF6957BCD046E3B2DA3939153914CA75D0D4BF60C65DF89AB21F31B183C697E512B3B1D70976714C49CF7DC3B73E9B6A1E65B069A057C7E98E81C906CE94EB0F68600EE4C87E03EDC45D15C1DF137DC1B48992DDCA20B876C9699CD361B306AFBAACDD898946EF96BDCFF971ACC6BC8B3B8EB345A50B2203DCBF6D0F1E9C3C74E36196EF5E50F3989A4264AB6425029611503EE4A5669273653E01F996CE3FB77E31E65E546F2B9E57FD4E6FDA56B678F1A3365E4C8E33FFE206C6B86CFFA18777D771FEE7555D50D35B5803B9BCE488C8D8B0A8FC8E00B1412E95F385BE67F1077199601B84B496C219923E5663653B9ECB0A8CDD36601EEAB67CFF1763D5F575101C222A724CA258F27D3330D58AFABAB43FB2682F6D77A35817985806ED07748BA947AB54C2D87D9A1D5A81EDDBD07B84F19306CBDD974C09DEC1E5A71378960EB4573F247719724D095A91CF46C77492215E9ABFD05A742A25D053C9BA74DEFCB4BE22EC67124448E98C4EFC4B16BE3083977A2E87E37522F051446A602EE86C206595A09FF6EDCA373BE49DE3732A3306DBC4CA8DC1BE9BC766EA626B734D1CDEF9359CB360F32DD3C60BCFF6787084EFE491697F1565EFD71C71DF74C3FFF1BEE7223EE4DA4AC2676C10D67AF2D73568E3519B676EEF2BB41375FE3FEBFD5FA647F0A775052235308A8CCA307BE83B27DDAA051677F3E51434B03DC65BC7211A3B0839403B8B7A5A4717DC292AC7DFE3EDC9193DC1D7CE21CBC70DE37DC7E3CBE63EE9269C3464C1D33C6F2E861A514396FB70F77AD5285D6EFB59555E07B414E2EE09E1013FB282C3C5390A692C95FE3FE1F7137F623CF941390CB6E3B892C0927A389C2A1DF0B5F3F69DA94C143D6CF5F10E87EB9B9B616BE1F6AB5520CD3FF05ADB3B3B3A6A606BD47634F4F8FE6496FFB2FD5E00500BACED0DD2915AA8DA7BAABB52AB94C72F76AE8D411A3670C1AB1C96C46F2E560AAC7B5CA7BC9443B6FBA7340CC11A7929048A8DC01772D5E004314F7175DC4F45771FFEDD6572AA200F264CEFE6EFEC2F41461D932324FC9C852D0333BF0ECD2C86476D01D8C5B20EF7A443D8E6D286D3194B5942652132E5F89BE144CBB1909DFABAEACDC1A12138A7755763154EE7BA62EDC3860ECD641E6815F1C79AA724777CBBC08F706665E6A48D887EB768D3319BA60C2AC4BF6E7F5B2D7FBDCFF671ACC68487FDC1FCB6EFC9942246160083F7EF285B9C99079C3C77B9DB06B4F2B6CA6E64838A55DB47C14F796243EDBEB41A295F7DF8D7B928B1FD6EBFA99833FAF9F327BF2E0A1334C4DED2C4FA13768FE1DEEC6614D45250470E73098F1D131910FC3B2D2D2D572C56BDCFF23EE3A6ABA02CF02DC85387A1B8E2E66A73792D994DB0F569B4D02DC372F5E12EAEBD3D1D40462AB540AA118B1FBB9ADADADADBABA1AC55DAFD7AB54AABFB0DB1DE6158ABB502ED61AF44A9D4AA5518A849DA17EFE33468F9B3564D4D689B3319E57E95E376AEEA7521C7CD92E41F1475DCA42A3A0605763797A62BA0A83F4E88B5EA1FADCEE07FE6EDCA5049E9CC207DC55CC6C3145509F44CEBB17CB09B94F0BBC53F008A3CA2837547508B905DCDB31C93E3771C1772B89F4665E5A259E06C5BB909B75D7E6CC9BA633D69B8C7E63F89490AF4E50CF5DC1DA7A93EDFC48B6BE84D35E6CA710BEE3EF70D71871876513C19D9693194FF9EEDDFD80FBB491134E7D77442B512227CCFC5BDB6BDC5F657B0A77348FF5EBE995760A490929DF7EF8E94493A18BC74C0AB07291E45600EE62764927350FBE400A6649530297E9712FC1D2EBEFC63DF55C60AA47A8ED67DFAE309F6A3670D04C7333673B6B432F72C5691FEE1A85B257A78761757905A430370F708F8B8A06DCB3D333909FBEC6FD3FE16EBCBD1F4B4164776169AD589A8895D64062916EDE5B31CE1C70DFB66CF9CDC000515B1B8A7B97E885375C6E6969A9AAAA4271D7E9744AA5F2AFE12ED728F4861EC01D8857E99143B81DEDAD01EE1EB3C799CD1D3E76C7947904EF6B1C9FDB750FB134277FEED92BC927CF57DE8845AF60EA216742F1AE48651ABBB07F7EC761AF1AF7FE93371B99B6E434C05D4A499351D3A5B4F40E22A721995A1E83A3F8DFE220C53B172A77481D81C7B8198D09BC9D1397524D639663297514364C79FF5F4E6E1A6AB6D664E43B6366DEF8DE9275E93AC1C18FE61848B1F7275A78739CAFF6E12E89FA1DEE8DC4CC3A4A562D33F7D4673F8E37196E3E68CCD77B3ED78815AF71FF1F6A28EEFD897FAC5F778FA8AD83109704B84F3619BE62FCB42B76E71579552D941C29E04ECEED22E6A818252DB11CF6E5BB49A7BD50D98D373E455CEE8B11779F6787A8DDE8D0283B32A45BFA01EB0C4BE47118A7583FC61D63EF833B1F8CB97CD576EF57CBC74C34371934D7DCDCD5DE013EE4E303AAF0B90177B91AC15DAEAE2A2BAF2EAB4270A7B311DC1F44E464646A159A7F27EE6ACAEF5847F32CEE387B04F7926B11F0B8962480A10ACF5512B8720C0BF91544E4FD9F1A6A884FFAFBED873BEABB71887E98DFBAFC5591D2B4143EC82E23B1DBB1D4660C1570AF233209D7EF2C1D6706B86F5FB9F2F6951051473BE0AE54AB3A852FACDC9B9B9B2B2B2B3B3B11FDB55AAD42A1F80BC754615EC9342AC05DA490C050ABD7C01AA5A3A5D9EF92DB7CD3090B4698BE31653EC9F71ADBEF4E5D3886E6E2C7760D4EB1B850793B5E4D48D391337A68393011E4180E8C6B887C0872A32563604EA96136115F783EFBD3A6A331B26ECC6F6B530477C2B3731682E0AEA6654AA97CA4E330325F424D93D0D3BBA8696D641EE04EF2BF951F85EB296A30B4C8A59965E99118C09D171603C57B1986524B60562493DD0FFEB2CE64EC1A93517B4CE7DFFEC98E7BF90ED93998E11C82F4F46BE9C775BE0EB8138E79661871EF2614A227CC0809394D84CC3A5266676685FDB7C7CC4C468C3319B1F7CD3D6A91FC65BFFFFF647B8DFBAB6FE8EC86219AC7ADD7A095C85D2C6C56CD9C3F75E0C8F7576CE4442695E3581DB47C29B35842CE57520ABBE9A5CDE174EE991BC4D3BE340B7F34680D8EDC6AC306E9DE3DFBFC6D9AA577EA2FAEB8A317E916BE2C5B7F9EFD1581730822B8950F3A04C7FB8646E59121C5DA074234760989B5F7C19E09A07ADFFA75EBFB5B27CE9D3D60D48EF94B39893879537B8F42AB57E97A34BD065D2F0C1562795B637B4D797575594D41763E094B8E0E8FA211E96D8DAD06BDA15BF75770D76AD5DD7A2D05879B663A6EDC8001E626268FFC025F843B52CA917F1FE3C52C4FF47C5C2C23312EFCF023C5EF9F8FD68380BB819583DC4F2395294EA2F13DAE269E72E1BA07955D0B93A652A00895A6D290FDC8C00D1E398F1B8A53C00BCA55E0ECC9D0788F0E84F5ECFEC4231DBB13D3B5F8343541605C0120D142CD4E42B6211444A682C26E4B2188A9ACBA1442078B27C9CE0FB471983A6888A9C9804FDEDDCDA1D1601A6A74DAB62EA10A3923F2715FBEBDBDBD80383AD1A0602F2A2A822154EB603ADA0301B497F51DE695CED02B54C96128552277C48587CA73F37EDCF719CC851926834EBDBF8F7B33AC242239FF767475784A5D786AC5DD04490ACC882C6122A33D9626C37015387E673C4D8EE541601C8D122F404280498DAE86FF64E0F97D8EF74F7FD37F0BCC71218E2D267325648190C4EB2272A1726FC2B36A3034E6B5B0448FE09C685C6F458BA141A8296DA8200BE27DAF257A85D6E059DD053535A98CDBA7CEFEB87AD75BA3E76C3031BBF69D5DBC8527C6D63FFAC8C5A89FCEA79EF4265AFAA71EF5E0DA5FC51EBE9C75EE8E3246D08DC993C6A7499233C4B86CE464077A414E0CD9C7E2ECDAE98BCD068EFE66DF410A8EF4B2DFFF7FB2BDC6FD6F6CBFE10EFFF4F46AC432A753562B67CC03DC3F58B989FB28B992C001DCE58C6209290F0A0403ADACF5218DEF728372CA977EDA1F82E20EB243154FB40D24D9FA739DAE326DFC58D67EE96742735D6F659DBF9179E65ACEF99B0C4B90FD7110D99F0464475987908DE7F3A2B8639CFC281E370E6F7A6FBBD99C790346BF396F455A2241DDD4D123D7EB55DD46DC0D46DC9546DC6B8DB8171231A4E8F01823EEEDFF00EEE8F2DF5F6A247F883B6CB603EE68D0E73F8BBB34899666C49D7F19707F204F25EB886CF436437A12721E480F4580DE3C0F58EF9717E20ED1E20590C7AF22F2F5240104561580BB9CCA6A4D258AE9ECDA54421B8B2BCACCF5B6B49A3A6828FCED7BDF79974DA7C16451E9F4AD42A152AF07DC51D3FBE30E057B414141474707B0AE830D9F279DFDF63DE14F369857F0CA4EA5027097A994ADCD2DB0A1569E9DFBE3C79F4E321930CB64C8E90FF6716F879744A5E4DD8BA97C945CF308D3144BD250B27B5985727C9A2885A32667E968B9329C000D3C884641483706DDBBD237EFFE63F87F40F9B38139DE856501EE620A827B2789DB41E1B51039D5181AEB7A78BC4770760CAEBB12C15D5DDA504E11C4F9DE2006DE6D67641BCA5ACB13A83E5F9FFA78EA8A8D269336984CB8FBF399141B7F82E395F8131E71872EE32C0228D6577027BCB9F6A1F8C3EED9E7EF02EE3DA979CAF8745972A6049BADA41777D1F2F363A98156AE1B662D1B3F60D4971F7E86494879D9EFFF3FD95EE3FE373698EF8F673DFCD3DDA3124AEC8F9F5E3E6D0EE0FEE1EA2D82184C0D990FE5008ABB9A5204B8B73CA0729CAE3D853B22BBCD63DC8916DE8493EE94D39E88DAA73D538F5C201C77EBAFF9533196EDCFC13DC9C19BE816FAEB86771FE3BE70557A2A59DB26EA85CD7D754F7FDC5B1BDAFEABB823E3BFC90EF91DEE4F119FFE8FE0FE3BD6D13C0F77647FC563DC31040983538721B632391D82CC4BC78EFF47DCD153628CD30CB9020EC51D951DBD9121E80F23E813FE648379052F407197AB55EDAD6D807B4946D637EF7F34D964E06C93A1961FEEE7DF8D2C8D4ECDBF1F5B159552178D13E3B806769181570AAC83E67A7A1E400FDCFF1771975078126A1A52B99379423AB24FA6064B07DC133CAFE4C4E27BAA5A017755D963DC313E379A29E9DD79B5BC9BD1163B3FDD3A74EAF6A1D33E9DBAEAD1093782F315EAD9EBA9567E29277CC8B62174BB5092853F1B703FEA917BE1BE2A36AD1793AF4CCA94A76401EE324A01E05E9CC80C7570DF366FF57893917BDFDCF3E86ED8CB7EFFFFC9F61AF7BFB1C17C7F3CEBE11F7DB7BC436873E4C4D229B300F78FD76ECB4C20343232BB98F9327A9198988BE2DE748FCC72B84A7AB25B8662BCF729C84EB009C0DB05E2EDFDD92E5718F601541B5FC01A7FCA1D77F232DB29B8D03B0C451CF227718FB371C75EBCF2E3FAB7B798CD9E3770CCDB8BD764E1683D5D321477E446CDFD7007D95FE3FED8F1E7E39EF602DC39C86E191ABB0D4B943239F558520B83DDC4E2B9FCF4F39FC1BDCFEEB6B6B6E2E262A150080F42F1DE87FE5FC05D65E8ED5020BB65141A75475B3BE05EC04FFBFCCD77A79A0C9E3B70B8D5479FA5DD8F2A8FC5163E8CAF89C134C412644401688E56EEE2542E5AB9C3A4FE6FE12EC273A4748194960EB277D10412765607231DC1FD6644A257486E1CA1FB09EE65647EACCFF5A88B01853184EA14E67DDB4BFB66ADDD3060C2C1799B2EEFFD25DECA9B7C36947EFE26DE2E08CA76AA7D28C3FE1AD93280E3184A3CEE957FE9218ABB3A255B89C901DC610905DC2B30BC7BAE016F2DDD04B8BFB369D755DFA097FDFEFF93ED35EE7F6383F9FE78D61B4F4191B47658FC7264D1C4E980FBBE0D3B735328AD9C5C09AB5046CB1711B234B44203A3B4E10E9E6E1F443AED4DB1F48590AD7C8D971DF961EDFCB00EFE387B7FA4FB692B4FF4C6606878E7420B7DC351BE217DCA3F95A7707F74FA42F2B980EFD6ECDA3C7ED6BCC163DF5DB63E97CC32C8D4062552B6A3B883F27291A2A5BEB5AA14DDE7FE5FC4FD4F12FF4FE1FE1BEB88EC10047702EF09EE5C901DC55D496201EEED38929CCD6BC0919B68CC1A0AC3EAC0C117E1AE416EC281E0DEDDDDAD523DEEDEBDB9B9B9A2A2422A45EE540E053BFC087DFC2FEC9651F474B7CB6580BB4AA7EDEAE804DC73D8DC8FB7EE9C3660C8BC41236CF67E91FE20BA220E571496501B8B6D8C234A097C2D35074A7590BD2B8905A02B8919A8EC2FC03D0D9DE07F2EE80EF7A7117F5160FE0A095C39335D0E55911177392FB79399518DA1B16F4526795FCD8B27F654B7191A45807B8911778CFFADB47BB124FF5BF67B0E6C1A3A69D3A009165BF7465AB82558FB105D4228674271B601784B7FB26D30CDEE0AF1B41FE00EDBCDF9EEE128EE5A4CAE069F0FB80BF1D92246613D392BC6E7E687EB764D3019B57DF9C64BCEE75FF6FBFF4FB6D7B8FF8DAD3FEE7AB546D8D47AE2875FE69B4D01DC3FDBFC66218ED1292894B28BA4D43C312E534B2F02DCEB6FE3687681440B6F84752B5F92952F2A3BC6DE2FD5D11F423D1F8273F04DB5F5223AFA131CFC124FBB451F3AF3E81767501BEC86BC8878F4711477B46F9958179FAF56EDD8387EE6DCA1E3DE5DB9B180C133A8F40635B2C3FD35EE7F1A77E38F887C90FD09EEE839824F702723953BE0AEE0F01BF194060ABD1C4F3EBAF7933FC01DBDFA1404572A917EC4A05A6F6C6CACAEAE56281EF73C038FA0232F7B9D2ACC2B79B7BE4D2605DCD57A9DA84B08B8673258EFADDF3C7DE0D0F98347A2B857C6E38BC313EBE2704DF124C01DAA7598B680BB30990DA003E2522CFFBF88BB8295216564B413D81D149E8C9BD34E4F2B4D22B26E3F4AF20DCD4930E2DE245294A3B887664626736F3DBA79DAE5CBA59B56998C7D6BEC6C97DD5FC7D87842E58E7508C43B04A55AF9624FFB12AD03495601F8933E08EE96FE859E91CAD8B41E6CBE1E97AF23164A7139803B72BF3D76112E34E2C08E3D93068E59376F85ED310B9880FFDAF61AF7BFB1F5C75DA7527736341FFDF6C7B9A69300F72FB6BE5D42648B334B659C42293547844BD3D30A0C8CE2DA9B29145B5F82A527C9DA1B82B7F146CF5C4C76F44972F24D74F665FBDE4B71F28D38793EDEDA9DE8128877F24FB0708B3C72069E066A3F457C7FE5FB7047DFF0EE11E72847CF032BB7AF1B3F63DE30D3DD6B3617B2D30CBADE5E4D77AFB6074620DD6ABD5C246BAE6BAA2CA9A82EAB2AC8CE276208C6B365A8FFCCD93248C86CD56F7906FA6788FFDB71FF5D9EFCE831EEC8753D4F7047CEFE467157D2391D78B2922B682250EBC9B4A214DCCFEF7FF022DCB5C81153846CBD5E0F9AA3757A4343435555551FEE7D957BDFFE993FD9605EC9F4BA56A90470D774EBC548BF9E86342AFDAD55EBFA70CF7818D31F77099EA724A64124180E448EE783E0522C5786E341E0BF68E0413446DC5F262F897B278E2D63A489A882A6545A0B812566653693B979D129EC3B51C97ED7721349BD35ED7DB8C7F886E6C660533C831D3FFAEACD0973B70C9FF4C3F26D015F9F8CB5F588B1B89C64ED9562ED9B6CE18D39ED8DB3F42558F8624E78B20177AB8022EF28555C7A2FAEA09B50A82715A1B82B78E5B2F44AC6FDC41FDEDD3F75D0B85533171FFDEE97D7B8FF8FB6FEB86B95AA8EFAA623DFFC3067DC44C0FDCB6DEF9491B9D2CC3239E04ECE16638DB8334B6A6EA52017CB197127587B636DBD51D9139C7C125C7CE3CEF87A1E3C6AB1FDE36F976C3DB1F17DDF2F8E82F289B69EA976DE587B446DD47794F83FC03DC5C1E7D661C748078F2F576C5B3B7EC65CC07DDD96426E3A78FD14EE32A1F4FF57B8FF26FBDF8FFB63D6D13CB91C1F647FDC9DD653B8AB786928EE054998EFDF79F74FE28EEE64AFAFAFAFACAC94C9906EC5E011ADF1361D308296F67FBEF5C75DDBD32D41FAF5340828B43796AF7E6EE5DE188717E3B828DF003A04F8867150FED5E1FEB4E07F1098C51D589698C6EF22F36A93C9F5185A3B5D5087676686C773EE4627FA5FCB4924F5D4B61B9A45F2F286620A823BF356E40D0BA76F57EFD83862D2FB93179EF9E06084E545ECB9A0E8D36E09961E4996DE89A73C534F7901EEF8D33E28EE54EB40C05D199FDE8D2FE8211675938B11DC09392A41A52ABB96178E39F4C181E943C62F9FB6E09783DFBFC6FD7FB4F5C7BD57A76FACA8FE7AEFFE19A3C6CF1931FEFBB73F02DCDB39794A5EB18296D795C253E2337B69852D6124EEF96B54878094936E443B5FBAEB55DAA56B98F341F167FD52DCAF52AF3CF866CD1B3BC7CF593DC8EC9D090B2C77ED7B647B197F31E4FE11E787475C68AE57F9EEB7934FB945FCE08039EDCE76B9C2720C62DA05B0ED0260C8B04702EF4C720AC0B9043C3C753ECCC1FDED194BE7988C5A3D658EED2FC7E4AD9D066DB75EA94570D71B7A34DD4A89A2B3A5A3B1A6A1AEB21670CF49CF4E4D48890A7BC4A1B391BB47EA0D0A99F26571375E61DFA35629C2EEDCD9B4623900B77BF55A7F5B8717E1AE22B1C04715858584CC5653386A0A0FF23CE291BC087739547C58969E92DE4BCF6A7B84655F08C058BB525D3CF2026E489389BD54D099D54D466856E3587F887BFF47FA707F5CB0C3CBE17D9010991A024345600853892D495835472061B0EB30446D41716E7CF2A79B364F1E3078DE8409E7EDEC3B5A9A61B2687B7A55DDDDCFF61703B5797B7B7B4D4D4D7575B55C2E471F04DCFB8AF7976AF0E6F26EBDDA78B6BB482645EE6FDE63887F103677ACD9149341ABC64D0CB1B0AFC25032EF20B7AF6B49A134C4E294940C351949DF1A142DE451DC9FCDD376FFC73C23F81F047EBB90C09531D325F47428DB5B499C361ABF380E47B8722B35E04635956768101A9AC592E29A2A762637169770E576F029BB63BBDE7F6FFA42C8896DEFDD3BE59472D6EFCE1187584BB798931792ADBC6867AFB2CE84E2AD7CB027BD4856FEC83DF62E3F1446B090B21D5FA048CD96A566C9F0B92DC90221BD409E5195154B3EBDFFC76903C7CD1D33E5F3F7F6BEC6FD7FB43D857B7355EDF7FBBF9C35C67CF670D36F767D504264A3B8AB9EC19DE2180046233BD6CF0553DD6F602F5F7DE4E27DCFDEED8E83DB5BD397AC1A3E71E920D32DE36602F4013F5A463B79DD3B7EE691E525C2D920DAF990644BF798C367934F5C82DA1F4AF53FC0FDA1FDE537672C993D60D4EA69736D0F1D9701EEBA6E5D3FDC1562794773FB7F1377A8D649CC5788BB8E9C86E2CEB91888B5B9407176EF8F3BD4DA2F81FB63D67F273B1A90BD0F77118684E22EA6B300774D7E51766CE2271B3602EEF3274E74B577F863DCD56A35E00EB2575555A1953B3CE595E02E944AFE04EE8497C69DF8C29E1B9E9397D927035190D391D3DBA9DC4E2ABF83CA6FA5F2AAB1D48CB03862C86DE69D478DDC2C4393C8D02A9195D557B232080F626FB97AD97E7260FF92356F4F9EBB7FD11ADB77F6DD3DE908B847DB5C4AB2F38AB77003DC292E57E84E57524F79241D7103D981F81CF7305124BB8750D84D2804DCE5986C39210FC19D9A2F13546445114F7FF23DE03E6FECD4037B3E7D8DFBFF687B0AF7F6BAC6C35F7F3FDF6CCAAC61E3BEDCF64E218ED1C1CD57730B55B49CAE148E129FDE4BCB6F0923705CAF521CFD922DDDE22D2FA63879933C42319E576FD99C3B73F0E7A3EFED9B3770CCDC01A3978D98B076CCD437A62C3CF1D6BE2B47EC6F9D70493D1798E2E48BB1F7C13BFAE1ACBD128E5F483C760177DAFD59DC89CE01D833010F4E9F7FE07079E78CC533068C5C357DAECD9113B2F62E831EC5DD60C41D390FB2A3B9B3A1BAB1B6A2AEBAAC26273D373501131516CDA173C51D927F1077FA63DC292C3515F59DF304F77EC41BF322DC15C6EE075E0DEEBFB1FE9BECE87E1804771252B61B435793E8121CA53519A762F34534664D0A5E955B901115F7E19AB553060E790A77E468AA11F7FEC2AB54AAD6D6D64A63EB3B5B06CAF97F16F72CF4982A1A2531A3FF0933BF8F11F797CBD382FF4100773145D088A542D92EE564B7D305B98F1269A1F7A8D7EF976268E2BC3228DB0D2D62C0BD98C20DF7BBE6F2E3B1BD4BD66C359DB27BDAFCE36FBCEF79F0D7FBA79DB117FC899782702E7EC9B6EE29369E64E7408A7D60D271B7B85FCE251EBE80B5F0C9F18A1046717A89453DC422252607C5BD3559D045C913714A046198E31F7E3D7DC0D845A633BEFFE4CBD7B8FF8F3664417D32D6A3D5895BDA2D7E39B274CAACE983477FB27E476E0AA5935700B8ABA939A2DFE34E72F2C33978C7595D8A77F0C0B98724B8057AFC72EA8B8D3B374E9E3DC964F0A2D11377CC5DB675FAC25563A67CB8689DF3A73FF8FF6C45F0BC1EE7E09568EB4973BDCA387F35E5F4E5B8C3E7B0A72EA3B8F7F9DE87FB430BD7FBF66E3BA62F9A3E60E4CA19F36C8E9E947420B8EB55DD7DB8CB458AF6A68EFAAA06F422A6578BFBC3DBB701F7B12626FF24EE5A92A08796D91E85E35E0A02DCC94E979FC55D8565BE1877E3C833B2C3AB50DCF56404F727BE23B8CB08B436309DCD175219D5C93845761E3F3CEADD65CB9F8B3B726D12A2F76FD354A9543637379797975754544824486FEFF01428E7F54F7A2078A9F6F7E32EF83DDC7F264F0BFE074171AF4EC4D7636832415E0B85CBBCF10013708DF320AA2BB34857D908B877D777B4E796B1E3309E562E0777ECDE306EF2DAE1A65F2C5DE7F9DDE13BA79C226D5DF19702993E3708670352EC3C00778A4B1054EE98D39E49472EA61EBF8CB7F2CBF379248EE119C825BDA46215365781CD5110F3DB52D23A48399DF402F6ED84C3BBBF98663266D9843987BEFCEE35EEFFA3ED29DC955D62E7D3D6AB672D986AEC5B263381D0C52FD4700AD5B42C510A4B8917F4D2739B2270AC8B5748CE3EF48BC1C98E1EF14EEE296E01F79C2F5AECFD62EB8CB9534C862C339FFEFEBAAD47F61DFCEA8DF7374C9AB36DEA829FB6BDEFB8F7DB44D7C01807CF64471FA6FB4DCEE59B045B1F64AFBD95172AFB7371BF677769EBD40553068C58396BBECDF153922E61B70EE97B00C51D3D0FB2ADB1BDAEB21E64FF6FE3CE30C688BB312F3AC4FA22DC95042EE0AE21F2BBA9191DD1789E5B30E04E7274FBABB8F7B18EC8FE1877321B8D8EC44003B82BC9CCF6548292C5EB24D32A1331D28C6CF6FDF037162C9C3A68E8824993FA70D774F728743A5577B7BEA71BF8467D87A142A1686C6C2C2929292B2B138BC5F008D4EC7DB8F75F0DFC9906CFFEFB717F5AE45718C0BD8BCCAB4A4270EF626554A59049C13709576EE5256075E50D86860E43A350525C5344E644065C3BFAE9375B672D5E397CDC0EF3A9A7DEFAE0B69563B4B35BAC935BCA391FCC39DF445BF79853E7132C2E525C02B8E7AFD19D82A8767E0C8760A24D40BE5FB4244E60A0961928A51A7CBE0A9FA7241574603200F756720E3534EAE7B73E9D6E3266CD9485A7BE3FF41AF7FFD106CBD2E385CF88BB5EA674733CB371C1B24926C3DE5CB84A1083110A0A50DCC5C9BFC39DE8ECC3760F4D3DEB13EFE211E972D9E3D7139F6FD8B6648CD9049301DFEDD977D1C22E2C30D4DBEECCBE0D3BB74F5FB477E9C6AF56EFBC7AD83EDCEA22E66C20F56228ED7C08C9298064EF47B6F101D639B6CFC7FDAEDDA52D53E64F36190EB8DB9DB4900A454FE12E13CA5B1BDA0077F43CF7FFEA6E99FF2BEE2A220F7057137828EEFCCB570077A2C3A597DC2DF342DCBB291CC813DF9928EE1A32033E6A0786A860723B48D48A8454715A26FDF6FDADB3E74C1B3C6CE1E4C9171C1C3B5B5B60B2F4E1AEEBD603DF7DB8CB64B2FAFAFAA2A2A2D2D2D2BE2B54552A157A46CDFF20EEAD38663D96D28863D4E1E89961B1803BF77E540D8DDB53D56C68EAD2D7B5D7F272526F879F3F6AF9FEBAED0B469A6F349DFCC5F2B5EEDFFC1CE6783ECAE952C2198F18FB4B577F38157CE058E067876E7D6B91627599732E147CE79FBF9676E916C92EA830205696906EA0951B68651A62819A90AF221776E1B2905EDD0999C4E0F0EF777E0CB86F9CB9CCE1F0E9D7B8FF8F3658961E2F7C6827E92AADCFF94BDB96AE9E603264FB9CA5DC47C9A2B4C795FBB3B8935C03E21D2E3FB43E177CD4FAF87B7B374D9D3573F0F019C3475EF7F0A3C4A75466E45163926CBEFAF9BD25EBDE98B964ABF91CCB773EBB71CC09EB0AF5BE4FBC851BE0CE38738564EDFD22DCEF5BBADEB1BDB879F2BC490386AF9ABDC0FE94A5F805B8D756D4559654FDF77087E297FA0477B092F9D7708700EE2A3C574F49EF8C2108DC43007782FDC5578B7B378505B2A3D1916880BB96CE05DCE50C4E3B915216972CE4A7536EDCD9387DC6B3B8CBB55AF45448E01BD93D0393A9A7472A95D6D5D515141440F18EF60A09ACFF2FE35E9F446EA3B09BC99CFC4749942BB768A1774B52485D990568E5AEAE6ACEC33342CE5EFEE69D8F564D9D37CD64C4EE398BAD3FF804CAF6870EE71EDA9C4DBDE01B6175CEE1CD4F7E5DBAE5F0922D8E5B3EBAF9D529AC85072C172CE7609EEB758AC395C2E078695286815969605468498580BB9A522422E400EE0DB874ACFFFD6FB77F38C364ECF6B9ABCE9EB47D8DFBFF5643173818A241FF83E0AEEBF6BFE4B17DC5DAF1268337CE5AC4884CECCA2C51F20A55B4ACAE148E8220E866E43746E09817AF125C7C12ECDC1F5A9EB97ACCFEFCD73FEF5BB365F6D091E62683668F33A324616A0A4B0D1225F8EE69E3BC77FD8E4D93E62E1E34EE8B655B027FB24A750D8A387DE1DEAF8E58075FC6F9AB384B4F30FD29DCC1FD3EDCE1B550B9AF9EB5C0E1A4A54C2406DCB5EAEE1ED8E2D71B741A04F7E64604F7F25204F7AC0C04F7C870047761E713DC5FB201EE30319EC23DD006C1BDFDF7B86B902E7F9FB7CF1D82EC73FF1DEE0AE4258F4D9753903CEBBB2C95A9C4717A28E95DD184B4CB21789B8B443B0477B111773511C11DB9D7048EA1A702EEC80700C7918E7F9F74FFFB58FCDF4C7F2C7B7FDCFB7C472B771D83D78521CBE9DC3602A53C3659C8CD205DBBB571CA8CE943862F9A84E0DED5D2065F0FADAE5BA1D1AA74C859EE803BD2513E7C6BBA8DB8D7D4E6E7E797141523B8EBBB11DC154A04F7DEBF823BAC3F60B5002F164B25C83550BD86D88761B3C6994D1C3068B9E9C4202BFB4A0C25C3887B732AA5CE883B127216C08ADE7EC4887B9A91725EDFD0D803300C1FE3DEAF8FFBFF30FC8F81D5093A84C8C9E995098476567A0B9DCFBDFF28D13B987E3BAC96CE5316552A4B6A0CF5EDCA8A46413CEEE251ABF7566C9C3FC26CAAC990CF566EF4F8F650ACAB5798DDF9FB966770EEC180FBA1353B770C9DF4E6B0290767ACBAF0CE97F77F76883F7D29C5C613EA1E9273707E48AC2435D3C02E37B02A34E47C25A940412B101173DBC959B5F8B4E4803B5F6FDB337DC0E8ED0BD7BA5A3922D3F4DFDA5EE3FE8A1BCCEB6EE3B02F8F5BAFA15BA3C525A5EC79E3EDE1262653478EB3FAF1305419ADF42C09334742CBE9C4F3BB30FCD64446C1CD78E2A52BD1F61E8917FCAF5B9F3FB8E5CD8926434D4D067DF2CEFBC15EBE7AA5BA5BA5814ACFA0ED11D536A5DC8BF8FE9D8FE70C1CBD74C8F8F767AD38BBF7FB1807CF1417FF68CB4B187B9F2CDF87A4D39E3CFB20817308D9C22BFE9733D1BFB8249E76C338F9E1DDAEDA7DF8D5C609B3A70F18B96BC5BA87A137159D2243376CF61B90A5BFC7D0D36D100B65E565D54505A59515B5E0BB809F999C88898E8AE7B2059D1D62F88B5EFE5E4006B95206AFEBEDD1D3C9A42F3EDC633A70E0B209934E7EF2593D9DDB4AE77752B922124784A3CBB00C1581AD03A3098CBEC87F0B0B34EF1F581F18877C2915B94D0F446E8C828C9C1F899C75471080CE5A2CBF9794A949E114F8DE2559B9B15C7CB27CAECAF1341D8523C5527A19020D850DD6F730D39478E4373E358400FD8F83A73F1EBE384A3C5D81670953283DBC3C1923AD261ED74E17247B052D1E3A66CE90911B662F20C624B6D536883A3A61623637B7C2F444F8D6687B757A98482A99BCB1BEA1B6B20A861525A5486F01C80CEA862F127A9B14187F3C595FA669B47A905DA9463AAE696D6D7571B01F3570D0281393C5E6138FEEFD9470F5563D9E5193442A7A185BF230AE3E8ED896CA9010F852D8F4210A6444BE18C7ED4C6118AF5D32F6E76E1C2A713C2532E403D9109DF14E267F66D83F7D9A433A1218B0CE5010D285A95C2996AFA6E6C00AA605C3CE884AAC62700BF114CCB5DBE43B119DD9C5867629B06E6893C88AAAD2E3303EA7ECDE5DB46A96C9F055A653BE58BF23C12DF0E649A790C33631CE9E04CFD0BBA7CF1CDBF2DE9BA6B3768D9BBD7E90F92293A130E2F8FEC13BA7CE269CF3A707DC8BB5F76C4BE11A326AC5C44C213E53CD2E52300A3BC8192A417935962DCE2CBFEEECB66DFECAE9C3C7AE9ABD88F8BACBDFFF9D866A0E0B1C9AFEB8C372A8D7EA9864EA97FBF68F1D34CC7CF8E8A35F7D2F4825B571F3DA6959EDE48C4E4A661721BD2E8E967D2D86EA7913BE6A9167BC2FFF74EADDA5EBCC4C86CC1C3FF1F08F3FC74545EBD51A48AF4667D076CB5A3A984938E74327DF5BBE61A6C9F0F5E3A6FFB2E5BDEBC79C92CEFAC73B7A273BFA302E84526D7C798EC1108AA537EE2472A3778A4B10F56228E06EBFE7ABCDE6B3670C18F9E6F275E1576F2A9153D71FE30EB2434446DC0B51DCCBAA01F72423EE1C23EEBD20D1FF19F7F1037EC3BD85C6135210DCA53806E0AEC1B3BBC97C259E85DCA6EE4980753468B5FE0CEE5C605D424570477D7F0A773D966F2066689339853E77C9966E6C679F4CEF10198EAAA522B87733F86A324B944284110581FE6C00EBA7F8FEE3206B053C4B944AEFE115C8691935F10423EEC146DC47AF9F351F706FAF6910B723B8B73421B81B50BB9FE0DE54570FB8371B71971871479F808CA0B8BF2C2EBDB04DA69748242A950A5EDADCDAE2E4683F7CF0A0912626B3C7997EF3D6BB519E7EE5C9C4DA6472694402E0DE90486EC7B124648198C49710793232E2BB08CB06D911DC8D31CACE53639100D92F9517E12E4AE1C8891932423A6CD48A303C152D4749CD6EC1738B70B40C0C8916118BBDFD303395282DAB31B48AF475AD407C1D3B23D223E0E8079F6E9C346BF170D33D4BD63AEEFF2EF6BCFFED93676E1E774E3C1F40F0BC7EE3B8F32FEBDFD93A66C6AA81E3378F99BE7EC4E42D6367FCB0E16DB76F8EC1866CAAD7359AFFDD76BC40CB2F1551B2C4D46C292B5F48CBEEA2652B32CA6AC8FC464E8E9785E3AAE973270E1DB575E55A1E95F1D2D3FF1F6CAF717F950DD5FCB9B82B6472A8B60AB2722C8E9D986936097CFFE6A34FC991F19D82C24602BF09C79330F3E0CB54FE88C00F0E6705DC4F750BB96E71F6D03B9FAC309B3E61D088ED6B3604F9F8951414C21A42A352EB546AF05D2B925566E5C75CBBE37ED26EE1B0F10B068DDD356981F5EE2F6E9F423A054B74F6C5B90490EDFC18B6FE203BF6841BDEC283EE12CCBC788D7CF12AEE5288ED9E837DB84784DEFA0BB87777BFF4575BA190C19A0E706790485FEEF90DF73A1A0770175179FD71D79378803B9AFEC443D4BFEB500C911D1D3E55B6FF47DCD33D43A4A9142D9903C31EBA4043628B9288DD3458A93C2ED59FCA6F95FB9F083C1FB97BAA1177193DA32A01C13DC93368D190D17F1EF79A8A4A18FEDDB88F1E3860EA8891C8F10F0BDBB407D135C9E4CA98D492F0F8A664AA90C49351D351DC61AA2A29E9E0FBDF8D3BB00EA53A0CDB93595D182EE0AEA6E7B69105E56436F66E7854C055665442735681B6AEA5B7B1C3D0D4D95DD342BB1F65F9E957DBA6CF07D9B74E9B67B1F7C0C3331E114E9E774E9F7B607D1173F92AD63DD4EF27CB03CBB6AE1D36718EC9E08FE6AEFE7CE9E6ED6673DE9EBAF8D79D1FBAFF78EA9EBD5B792CB98B9A2566E482E9327601945CCD78BE9095A7CCAA68646416A4D2ECBEF975F66833F3C1233E7FFFA3AAC292979EFEFF607B8DFBAB6C30A321CFC51DE95E1536BD6BEBFD3CBCD62E5A367AC0900FB6BE111974BD3DADB00ECFADC771659C42F0BD2802CBBE12C6BA1296703108AA897717AC9E3968F4A289D38F7CFB238D4002D6BB8D3DC12AE50AA8DF0D6A9DACB5B33C2D879388FB7CEBDBEB27CE9E6B326AE7E40596BB3FBF7ACC31C6C5077F3184E8E84FB2F5C59C748B3B7C2EF9941BD93990703628CECE13E386E0BEC17C16E0BE6B0582BBAA536CE806759F8F7B45794D9A200B708F894E00DC3BDA45F084BF8CBBA15BCF2222B89B9B0C5C613EE9D4DECFEA28EC56909DCA1393B9323CF359DC9FF21D39DC6A0C98DE6F9C0FFA3C85FBE38B219FEC96790A77817BB0389904A6A3B8AB892C6122414F85DFFB3BD3FBF214DF7F1C78BE82C8EDC232F4BC022903C1BD95CE4FF00A5A3064D4ECA1A3D7CDFE43DCBB7B945259636D5D7579050C5F21EE5A2D82BB52FD18774723EE63860C321F3264EDF49916FBBF4CF6BD521287AD4AC041F10EB88B2902053D13B96D299EA3A46568E859E0FB3F83BB182F684B6222B833F320ED94B4CC786C847FC823FF90622A5B57DF0A41CA7691B294C40AB0727A6BDEB2798346AD1A37F9CB4D6FF89DB42385DEBF6777E98E95EB23176F8CE7B5E8B3BE673FFB69CFEC95CB068C5B6432EAF4BB9FB91E38F4D1C2756B474DD93D77E5B1773FBDF8ED31705C0CBF889C2162E42A78C52D0441553243C8C997659537B0B270D71F7EFDF68713070E9F36CAD4FEF869E4BABF975E02FEB9F61AF757D96046439E8BBBF19666BD72A138263C72CF1B6F8F193874C3C265DE76675A78794D94F4567A963CBD54CC29A888A3086E443342C26E5BBB1E79FB93E56326CF1C3AF6A36D6FDEF00FAE2DAF84B7D3F774CBD52AA95C86DCA8A10796D46E40B9ABBAE196A7FF4F7BF62F1E3D7186C9B037A62D3AF5DEE7572DCE40F98F3F13483D7705884FB0704BB6F600D9312EFE619617522E5DB1FEE0C07AF359D34C4600EE61D76E29BB8CBBD15F8C7B7A5A767212B63FEE7AFD4BEF9751A2B8EBF56C22E9E0F37097917980BB1CC754E3583A225789E33C371AE3414E889AF478041D07CD51D95F847B0F31A3FF3E77EEA500D05C45604A52C850B003EE5D09781D85DB1FF4FE798AEF3F0E3C5F4EE275E0187A41A1989951994068A1F3E3BC02FBE3DE56FB7BDCBB7BFAE3DE50535B55560EC357863BD235CDD3B80F1D3268F4B0C1E3060D9A3776DCBE8D5BAE58DAA7DD8FAA4CC4954725D72790007715331B7017E2D80A6ABA9691FD0FE02EC6F2E5C40CC0BD3585D585E72B9979526A56039645B8F1202AE81AE351BCB8A4CAD025D3D436AB2A1B0C1DD2BBAE9E3FBCF9C1D29166CB46997FB27AB3DD97DFDF7671235F7B70DBE6C27D7BB71857FF84CB57424FB91CD9F91194EA8B4CC67C306FF5755BD704EF50CB8F0E6E9B340FAA9C8F966DFC75D7475DEC3C113BBF839E0D0BA332BDAC99925E83658BF945B0855D49E107DA9D7B63E91AD8925E3E7BFEADC0108356FF17A6FF3FD65EE3FE2A1BAAF973716F6A684476BB2BD50C12E5E703DF980D1B35D76CF2F12FBE856F4C3B2F5F9A5926111477B2721B88FCACB064BCFF6D972F7E7E7FD1DA990347AD993EEFCC29EB743A5BD625D26AB59A6EBD54AD14C9A40A9512C11D7E81AEBB5BAAACC8CC7B1870F5E09B1F2C339DBA68B8D9DBF3569EFAF860F049A7687B0FF2C5AB0C8F9BF87308EBC48B573117821F397824B8055BEE39B06EC2AC290346EC5CB12EFCFA6D955002EFD6A3EF7D2EEE90A770EF86D5C05FC3BDF739B8D792592D14AE98C6975078C85E751C134A7535F169D3FBD2077A5FD0735A9EC51DDD2DA3221AEF5E8DE377933254299C3CDFBB446B37C6191FE645BF8E041C282C4E45705712999DF1380D85038F3CF7802A1A14EEFF38842D0C3985DF4160EAD20AC5ACCCF24442239D07B8CF1B3272E6D0D16BE6CCC7C7FE863B7A40B5B71FEE0A89B4BEBAA6B2B40C862FC4FDE51BE08E1E50851737B6B63838D90F31E26E3A74C8B4E1C337CF9A6BFBF95758BFAB4531C9157198CA18AC90C403DCBBF09C8E54064C55A8DCE524C1DF8ABB8294D999CC9610D2C4A4F44E3C5F4CCE90D1B25B53D9B9E1C9C9576ED11EC5D7F2B37A9A3A0077557563635A6E198DFBD3DB1F6E99366FC988F17B96AD7338F86380A5E3DDB3EE719EC1B7EC2EDE77F67874C1FF818BE7B983873E5ABC7EE588898B068E3DFBED116E7862199173F79CD7D75BDFDD3469EEC6C9733F58B23E3332158A2D21B700224D2BE960E542E125CD2EAF6364E424938FEE3DB064E2F4D96327BCBF7D171D4744CE83EC5BC2FF7DED35EEAFB2A19ABF0877AD5AD3ADD2E4A465D81D3F3D65CC78F3C123F66E7B531083694F2B54E65737D033AA09DC465A067CBDC2CEFB7CB5F9ED95E3A64E3119B667D38ED8DB0F24AD1D1A85B2AEAE4ED5AD136B9442B954AA54E8BAF5BDBDBDDD3ABD4EA1D24915251939777C837FF868FFAAA973E68D32DF3A7BC9575BDEB9F0C5AF50A7E3DDAEA69C0F8C73F24E720D4CBE181C75CE37DE2DF8E4875FAE9E3073F24004F7B0FEB81B4FB386884492F2F2CAC2C2E2CACA6A487A7A6672726A4C4C1C87C36B6FEFECEEEED5E95E1A973FC61D3D1552466243F10E32AA881C051EF21891FE41A426F63F091D093C029AA3BBDDD19D337DBE2B89486FB44A025F47CE50A67272FDEEE2ADDDE8677D68AE3E6DF17858970853287A5A9A82C86E8FC323BBEF8D076F9F1AF605DD47F41F87F02AF8735A894C4D7AA1909D599A886F60F0A23D03E6F4C3BDA5EE7767CB00EE3A8D16E6298CC824D2DAEA9AB292D29AAA6A188ABA84F020808E9C4EF3EA70B773B61F3C74D0A86183CD478D98327CF82253B3AFB7EDBAEF72312732AE2A095F1496D081672B19599D38765B324D4AE243D92EC6715E15EE689EC5BD3D9905B2CB69D950B043BA4869A5111862C02DE2ADB012064F565E0BACEB1BDAE41575AC4709EE27AC374C9A356FF0E8B566D38EEDD91FEA70FEEE798F9B4E176F395FBAE374F9C159AF7057DF204B9743EF7CB271C2ECB903462F1A3A3E25E46E4B5A81A6A229338170F188E55B8B562F1B3765CBB405D7EC2F6445635B59390DD4F4267A6607BF006A76714E79318E490F8F7F67C586C94347AF9C35FFD7AFBE2B2F2CFEDD12FEEF6BAF717F950D9DD7A8EC90FEB3BEB9B149AD5401EEC5B9F9E76D1D678C9F38CA64C0CE656B3037C39AF879D2FCAA420C3D278158434BE34726075ABABCBD60D58C81A3269A0CFB66CF3E1E89066F07B867E5642B741AA146D1A5944954203A2CA7C8252D52B1C4D0DDABEC12E770043EE72FBDB97693D98061662643168F997470FDAE4B5F1D79E8E8FEC0E1F24DCB73307C74CE37ECAC778C7BF0890FBF5C65C47DC74A0477B5480A1FF745B85755D5646464FD1DB8A30754ABC9CC262AB78BC187E25D4C86AA8D09322A491C2981074129E91F74670B4A7C5FE01100BDEF6C993EE291900408F404BE869221C372B202EEA6DAB951CEF9515C7D9BE371F0EB3A53291A461AAC575A12F07232474A643D37F0A9FE7C2444A4F3F11612539D5ED8C5C92C4AC2D73179515E01B3868C98310CC11DD7873B7C439A5B11B1FF29DCE5BFC77DF8B04113C68D9E3272C4CC11233F5CB936C8CA5E101E559542CCBB17D386652A80392CAB35892A21F2603276A532D1B9F0CA7147F7C9C8C999AD292C092553C9CC53B0F2648C9C163C37E356748CAB2F2732A139A74859D5D09E572229AD16975445FA04BFB568E52C93E1534D066D9B3EDFE5DB5F233D02C22FFB85DA9DBB62ED72E7ACE77D579F7BE7BD3D8E587FB9F9ADC523CCA7990C5F38D23C1F36ADAA5B0C42555346E11D77FF8F36EC583066E2EA89B34E7DF2152EF44135555084A197E0982DBCBC8E8C6248560A39F576F8EA6973C7990CD9B46C95DD498BB6A6E6BF36FDFFB1F61AF757D9FE00771883855329966A640A7212E6D3DD7BE6994F593B67D1F7EF7D02DF9B9EDAF66A467A254D20CEAF14C4E33C4FD96F9FBB0CD87D7FC3364A7C8A41A5438E416A10CAB5861E95A1476DE8811188AEB7A71BB96D03B2CCC306BB422429CCC8BE1772FDF0D7DF6F5EBE7AC1F8C96BCD677EB2728BF3973FDF3FE38909BC9DE27F33E2821F942757ED5C2DBFF87EFB8215B099F9E57B1FC5DC0B6BAB6DD0A9D462A1442C964280EFFAFAC6EAEADA9A9A3A18696D6D6F68688A8A8AC1607011118FBABA44F0DF9696B6C77FDD4B3450A9C7A0D395E6E43A9D3A35C774FC94C143DE5DB6B28C44AF21319BC9AC0E0A474CE548A9C8798D3232A72991D298446949A6B5A532C0972E3C474CE00231503FAAC9E95A4A064447CD44A3A566428D2967652998BF051E8180F2326ABA829A0EAF05A4CA1F2666863C60FB5C2FBC175D1595D286A189481C311939115342E1C96802253303A26265AAD9591A4EB68E970BD1C36A98C495119F1303BF00092FBF979BD7C3C9D5B3B221F05A31334D99556028A951E594B470D28B70E4AB8E67B72D583C7BB4E9AE35EBD3E96C717BA7B8B30BA60B4C707D77AF5E0BF31AD9DBA652285B9A9A2BCACA4B8B4B40F6C2FC82C6FA06781058375E6BA679FCCC976C6AB516E61ABCAC532C82E2A0ACA6EAE3CF3E99B370EEC8514327988E99653E7EFEF8F16B264F3BB07947D0696BC6B53B790FE3CA229261E2EBB8F9BDFC42153D534DCBECE516C0C6D0E3D3909EAC621F6F3F3D03F79FCC53B8E7DF8EAB8D254BE9D99AB412212DB3E81186EC77F3D179EF6A86A0ABB8D2D026D2D6B56463C93ED68E1FADD9BC70E4F8D5E3A76E9D3EFFC7373F08B074BC7FC10B8A7728DBE3FCAE865D0EB871CEC3F987A3BB97AD9F3E60E4BCE1E30FEE7CCFCBDAB9A745A46DE83074C90D524D4D667EC0998BB0AC2D369BBA76F29CF3BF9E82255156545380A567C4E3A1C05757355F3C6AF5D3479FAD9C366796D9A4533F1F2EC92BE8D5E9910369FFE2F61AF757D950CD5F84BB5C2A534BE55AB93283C1B13E7262CBD2552B67CC7B77F5A694EB0F3AF2CAABD89975FCDCB69C5228104E1EF81E6A8499A3CDBEFE701F9FC23068F400B746A5D64233CA8EA60F7708FA2BB44A5543550D198BF77673FFE1CBAF766FDD69663278C9D8C91FACDC042589D709BB9B67DCE1EB1EE11174E7A28FC37787772E59BDC87CEA67EF7C1075E701E08EECED85CF0DEFD46BD068741289ACB353088E83F58D8DCD407C5C5C028DC6C0E108E873FE52838FDAD3ABD396E6E7BB5859CE36379F3478F01B4B969551181564462D915687A3D6A712EB92703571A95531A91D145E0795DF49E577D104427A9A848EDCA84146CF684C20B7245220AD0994B6442AA423810A6A779179C84BFA05B9933299571983AD8AC55544638AC31333AF8793BD42E29D2E87599DA1FB850A42EF153C88298F4AAE884E8154C5626AE271308454C76161BC36015F9748A84F22362493C4541E0456004F0DEBE2E003636B6230F099616D5101EF1699541A99589E88AB23D13BD819F5544E5E328E7A3FFCCC4F87178E377F16F736E3C6D063B27B7A9572056CEDA1B8979796BD2ADC552A4DF313DC957A04F78FF6EF9DBD70EE58D351D3A64E5C3463DAA24993605BEA83556BCFFFF44BBC975FF6BDE892B04458B942F1AE6664C9C802D806D232B2FF0EDC21E83E19C05D4ECB56710A14DC82660237F76122FDCA7D6AD05DEAB587ED39C5E2B21A79455D3537233EE4E6E92FBED93273C13493A11FAED8F0F5F6779CBEFEF99AA3EB838BDE375D2EDD70BC70F7BCC7ED8B3E974EDA22C7A2CCA74F193472F3BCA58EBF1C8FBB76B7A743D2DD2EEE15CABB3BA5B539450FAF5C87656DF9B439E0FBB1FD5F736252858555B03C96507995AC8C32BAE0E8A75FEDD9B463F98CB9DBD76CF072BD5451520ACBA348247A3C59FF95ED35EEAFB2A19ABF08775820750A15F85E5B54F620F4E6577B3E593C69C642D3C99E564E59385A2537ABBDA8B2263DEFEA45CFDD1BB6CD193771F9ECF9CE16369505C506AD5EA350C2D20EB683E668CD8ECAFE14EEB0C12E174BEAAAAA1914EACD9050570767B341C3CD070E9F3E7CECF249333F58BBD5E28BEF831C5C237C42A078F9F9E3CF974E9A613660D8DB9BB641B1DF5C558B745D295729E41A8958D1D2DC515E569D975B94935D909B53D850DF5253DD10111E9D928C0B0F8BEAEA94C02350CE1BFFB69768C693E3F57ABDB6B4A4E89C93FDBC2993CD060FDA387F7E0E8E5880239512C8D5245A0389D64A66B451986D14B6342D4F2CC813F17385BC1C2127BB8B9DD5C5CA1432323AC87C214500119105624A1A44424E9350D31B718C7AFC73A2CD2985A8328B449C2C784E5E6422FBEA3DBCEFD5A298D41A0CB59D2E90F07264823C8822BD409D55DC46E343E0F10E465A172B43C8CE84174AD8592D4436A4F599A14A90AF84F0F3E4BC5C19271B9E2981CF09AFE2654AB3F3F565358AA2F27AB6801F9FE46D65B76DF1D299634C77AE5D9FC6608B3A3A85FD7007B811B28DA7CAB434345696968123D5E515C5F905CDF50DF035801F41CDA8576B900E2DFECFB897D456EDF90CC17DFACC29CB962EDCB07AF9AAF973974C9AB47DDEC2E31F7F126AE320B8190EB837275185042E6C3309716C318E23233EBE41CAFF1D77BD3130D21F77292553C1C805DCBBA81905112944BF9B04FF9BF95198366E4E6F6387B4A2AE8CC18BBB72C3FEBB5FDE5BB97EF168F3A926437EDDBDF7EC0F47A060BFE7EA19E6E61BE1EEFFC0D52BC4FEDC85E3D6DFECFE78D9E499C85ECA09D30EED3F187BF37E795A4EAF586190A97B447249535B6369250B4772B1B0D9B67CCDF491A61F6CDC7ED72BB021BB4851DDDC925B9A96428A08BCF6F6EA8DCBA6CE5EB360C9A95F8F6013936BAB6BA45229526BFD8BDB6BDC5F6543357F2EEE5067217B4B152AB9502C6E6A83E2DDF984257C5DC69B0CFEF1E3CF1E85DC2C64F225D58D052C81C3E1938B26CF983862CC5B9BB63DB87E0B2A3B28A8A5421114FE7DB8A3AC3F853BFC142A3B588540DA5BDB32D3337029A99FEDF9186A8D99C65DFC13068DD8347FE92F7BBF387FDC2AE8CCA51307BF5F3F6FC9CCB1E69FBCFD5EF4FD305133D2C9091A783FA542DBDE26ACAF6BAEAD69ACAB6DD2EB0C2AA58E4CA2F3B8E9580C51A7ED158BE472F94BDFC353DDAD81E8BAB59595E5172F9C5D307BC698410396CD98FEE84A48D2B59BB40761D909C93564AA4890A1CD2BEA29A92C23D24A08B4623CB50847294C2515A5108B92082589841A2CBDD698062C03D28465421A71CC161AAFF97969A1F39BA8DC3A22B3389990FE30061F7C23FA82D73D87F3F46BF704F7A30AE33015A9E42A2CB51A47AB2530EA492C340D6476238583BEBC95218034C083CF4B233C93CC86917A22B38EC0A8C1D1AAB15478C32626B799CDEFCCCC6B4DCBCEC712B1B7EE9E3D721C709F31C674C7BAE7E08EEC5EEBE905BE61258D9EDE0EBED75656A1B8ABE58AA771EFFB86FDB986E20E5FCE0E8948DEFD18F7998BE6CE59387BEDBA95DBB7AC5FB764D17C73F31593A67CBA69B3DD17076981378B1EC403EE1D5856278609B88BB0ECAE54E6DF8D7B1B86D34E12D4639869776230DEA194907BF524AEA1BAD52056B5E695A4DCB867F3F58F6F2D59B56CFCE415E3A76C983AC7E1AB9FAE3A9C8FF40800DC21D1DEC10F2F78FB9CB2DBBB65D78AE9734D4D864C1B65BAFFEDF76FFB055764E6E94432835C6DD0F5EAC4F2F69A86CEBAA6FAB2CA87376E7FB167EFA461A3974C9D65F3F3D11C1A47DBD2D55C501673EDCEE96F7E5A603E75FAE8F1B0290C8B644D45654B4B4B9748F892D3FE9F6EAF717F950DB5F1B9B843DD0D4519E02EED14AABB248D6555D73CFDDE5CBB09BE76BB566D387BD29A9688692DABA6A7E2BFFBF40BB361A3268E1CFBCDFE2FD8543A2CC3B0480BDB3BE01D743A1D2CFE7DA0F70FFC48269389C562A552D9DB8BD4C61D1D1DB0519F9C98E4EBE9B5FFA3BD73264F1B6932D07CF0889533E6BDBD76B3ED2FC70EECFE08BEF773CD267FF1C1C7716191ED758D3A95BAB35D0455796787B8A9B1ADAAB2AEB4A41252515E03C45757D5473D8AA39019985402FC613DF017BE6483A921D328A43AA5AA5B53555FEDE5E3BE78D1BCE1834C664D30FBE9D34F8F7F79C0F9E79FFDAD6C1E5CBA947A258475FF81202A361F4FC923310AC9CC121AA782C1AF62A5D5B1331A3899ED69F95D6905424181585020492B940AD0E47709723AD31EA73DFDB734B005754C5E358D5D8423A74527106EDC8DF5097C78D1831D169519975C4AA0D6D039B50C2EA49EC56FE2A6439A79192DFCCC5641565B5A36BC4347462E623437E3B9E9106443DAF9596DBCCC164E7A333BAD89258094E14879C998623C05B64B280F231E7AF9DAFFFCEB3BEB374C1B6BBA7DDD7A3EF377B8EBBB7B9123A53DB002D749BA84F5D535E5C5255565E530F2AA7057FE1EF7E2BAAA0F3E47709F3863E2FC8573562C5DB070FAD429C3874F1B3A6CCD94291F2E5BF9C8E9527AE8C3C60472DBFFD7DE79404575AD7B7C68431D98A1F7221D04C18E3EDB55A2A0A82F76133B7683C6C49EC4167BEF25F62E3644A47790A628880D153182740666986186FEFE337BC2E506CC85BC9B9B2CB27FEB5B679DBAF73EBBFCBF6F9F99391318531614C70F4FE6853C28BA1DF9478B7B55F46388FB2BFF90B8231782F79E48387DED634C5A634E81E86D5E7240F0E645CB8639BBDB6A683B6B1B7AB9F69AF599CFFEE56B2F6FDB777DE7C1A3ABD6EF5AF2EDDEA5AB36CF5EBC70E4383335B6810ACB5AD7C86788E7FE1FB73F4E4896FC58AFAEA94920C610ADE5090A7FCEC390ACAEE463ACAD5BB1CA84ADABA3ACEE337068C0F92BF959D90FC363372E5B39D0A587A93AC7DEC462D18C39C97109027E555959597905B78375FFDF868AFB7F12A2E66D8A7B25B742F29C542812702B112F70F30A832EFB2F9B35CF8AADEF686C3166B0E7F1DDFB1FC7275D3A71FAB3FE83D4E414CDF50C972FF143D4862410B6971515E372C997251A24524E962D0D9A8E7922C45D2090FA80FA7AEC292F2FE755F13333337F3A71D277E6AC7EEE3DAD0D4D4DD9BA88D69D4C2CCDB574B5184AD89C39614AF8DD207471A886ECF3CE9AC6CA0A41DE8742C8FAAB976FC9F399F44799C78EFEE47FFDF6F9739711B6971473793CD95F36B713D4467935AF4CC4AB6A14BF2BFCB0E7E06E671707257986AE86AAB5A1BE83A1A1BB99697F6B6B4F67A7B13D7B4CEED76FCAA0C1DBBE59B175E59A3D6B7F38B4E1C7935B769EDF7DE0DABE23989267DE8B806505463CBB17F9225062AF02A35E0645A45EBB9372FD76B325FBCB2CE18A7FFCE5EBD197AE869DBD1070F4C4C51DBB8FFFB0F1C0AAB55777EE0D38742CE2CC051C25863393AEDF7A12189C712F040651CE0A0E7F1612F13C3412967EFB5E9BF624E03EECF19D20AC3FBC7937ED4640AAFF1DD8F55D7B4EAFDF7876D3D6B35BB6EFF976D5EAD9BE33478D1EECE6DE2CEE6525A5500AD44C418944DC257ADDD008ED86E823607FF5EC39F985EA271FCB34F7B0F60171CF2B94887B11EF9FE26E6A6F25AFA1A8A6A5CA61AB6BAB296BC931D80C8681BC9C0D53E587B15303BEDBFEEAC21DE83BC2F69AB8C7D591691F6F84FDD1E22E8879F2DA3F347AFFE9A09D47134F5DCD0D4B1465E534E595465CB8B67FCDFAC9833CBBE99B226CF7ECDADD6FDCD41D7E2BCE6DDA7971CB9E136B376D9CBD6889CF84E983868F71EDD3DFD2DE80A9E166E33073FCE4E37B0E3C8C4D2CCF2F6CAAAEC1E06C148A9B307FAC12569496D508AB9BEAEA31D6AE5FBEE26465C39267BADB39ED5ABF39E4C69D93BBF64F1EEE63C1D6C320FD5F4FAF93FB0EE5BCCC469855C1ABAC14549131FE97858AFB7F12B434AC4D71E796958B84D58DE2DAFA6A716395885F589A1197E4FFD3B99EB64E98EED919987E3D77E1ED0B57B67DB7A187938BB29C82A3B5ED968D9B4A0B258F4A8A0A0A4B8A8AC94826FA4E962D81948B44D24F5C6B6AC462B1E415054261955020AEAFE3F2796F72DE8687861DD8B567CED469FDDD7ADA189A42DF31514550E368663577EAF45B97AE3E4E497B94925A5E5AC92DE79797F18A0ACBDEE7E6237847C08E1584F3D813702728263A01913B1C40B5102EA4637D1B75522CE0165757F01A45EF4B3F1E3C71D0A57B5779398686B2829116CB84A561AAA662A2CC34612A9829295828295A282B731414B49498BA2A6AC6EA9A165ADAD63AFA8EBA46CEFA2653067F069B3668386CC6E011B09983B0FC6CD9B8C9CBC64D82F98DFF171BEAE432CCD915F60FC7AE036CEC7B9A983BE9EADB6A711CD9BA3D0CCD065A3B0C737485FDC3BEEB5007174FA76E338679C1667A7ACFFA6CE49C113EBE5EA3E77A8F81AD9C32BD4D1BD5AD276CA46B0F6F97EE5E5DDD4738BB0D77EAF699A38BB74BB7BE26661EA69603ACEDDC0D4DECB4752C595AB8A94F8A3BD6A0DED522B873C83A1177C8FA1F27EEC3C7CBC45D5E598EA9C460AB2819696A98B158C64C256306638C95F3DEA9F31EEC3BF5FAD25D44EE8D4959B5B18FF3AE87FCD1E2FEFE562494FDD2EA2D10F7F7A1094DD9F98DAFF3CBD29F7F357EEAE7FD87F431B771333083B22F183361E7D295A7366EDFB374D50F33172CFBDF29BE9E3E63DD3DFA1A59B968E83969E9635ABC64D6DCDB17AFE63C7BC92B2A1571790D0251537DA3E4A721D522C83A899930ABC6287B9691D9BF571F8E8A7A17235304E9DBD6ADF79DFC65776B07C44043BAF7D9B46A5D72741C1C6D716191E427E275B5B00E56FF7F152AEEFF61D0D8CDB24E8C80A977B574644A4263716D5549F9FBE7D94F125306F6E8C356525565C88F1F39FAF0AEBDCB162DB1B3ECC29457707771DDBB7B0FE27D2491FF21AFB4B88424878ED86C2D819A6349F282B8F3F97CC91371517551596995F487E690FE174FB34E1F3B3173EA97FDBBF77234EFD2C5C044474583ADACE66C6BEF33DC6BB4F7488F5EBDCD4D2DECEC1CBABBF71E3870F088E1A3C68F9F387BD6BC254BFC6263126362E2F6EC3E70E9D21544EE489BCFABEEE82F54518C627E39F49DDF20CA2B2B3CF2D3B16E3D5D19720C254586B39DB5B3B595A3B9A99DA1818D9EB68D36DB9AA365C5E1E86BB074582C3D0D96AEBA86AE9ABA9EAA3A845E5F59CD5045DD5859DD4445C3545962E6CA2C62FAF28ACDA6D7C2CC35B52CD99C2EDA3A300B2DB691AA9A8E82A21683C16230F415942C591C3B1D3D5B6D7D6BB6B60D470FEB068A2A068A4C43255523A68A342335535596999A862E43519721DF7A69A9CEB6506799AB6A9AA9AAA33C26CAAAC64A6AC64C15277D037D790514C65C9D65A8A4ACA7C434C1EDA86B186AB13D7AF47810F74F71278F652475D4D008D18182BC7D95FD3CEB99E4C5611FF220EE7952719734BDF4DB323271EF202D1FCB347FA06A668709A4B63A4B455D8D69A8CB4143B8DBDADA1B18982BA93828A82D1F363AF0C7BD4FCEF91704C534A43E17C73FC9BD1E4C7E2026D5F724A9B84BDF744FF45D62E48F4DFEED5262E25089894253ABC35205E1A9BC88D48AA8D417D7EE056E3F7C6EF5E6E8E3170519AF9B0A2A0A929F849CBAD8C3B48B9D8E81B5A64E2F4BDB29C3BC7E58E877F8FBCDA7B6EC9A3766C2D83E038639BB8FE8D66BA0ADB31D4BC74695ED666431FF8B19678F9EF8F0F69DE45B5A357555E515D5FC2A54326A52C0AF12578BC8B0927CF5A5AC1CA36CF8D0613AE81E3A7AE3478F9DFBE58C21BDFB196BE9283318633DBD2E9C38F5F39B1CC9ABDCDEE640DC5187FC6A61871BE0BF0815F7FF3CBFD5DED29ED4D22E9D3B3F65C2440D15553906C3CAC272D08081DDDDDC7538DA5F4C995A5858882BB85CAE40208076D7D6D6221827C9B41FC957E361D2701E3D18B30762C70F1F593C7F815B571715A632B2569457505250C48A82144545A6A2A2A292923293C9545656555656363232313737C790777373F3F59DF7E0C10359069FA0A4A404C5966DB400378D51C1130A521FA6EDDAB3DB6BE40803033D068391FDEA4566C6E38498E89BD7AEEEDFB973F9922553C68D1BE9E9D9DDB59B8B73577B5B3B4B730B637D030C3C96AA9A1A53599FAD0DD3D3E2E86AB275585A7A1A5ABAEA9A306D0D0D380398AEA6A69E96164C9FCD86B1D5D4DA34157979A929FE6AC9516771D4D55B2FB5352459B45E3219F24C06A3F5125958181999EAEBE31C6B33B3411E1EDD5D5D700B2C758D695F7C191F1B475C32EA0A0D0D974C5E0C5751CE2D2828F839F77D4E4E0EA4E4DDBB77AF5F6563BDF06301CE81BECBAAF277818E505C5AC2ADACA86F6C78F1EAE5D2AF97E9EAEB315594E7CDF34D4949AAE257F27915E9A9296BBEF9C6D1CCC25441B52B4B67FA806137B6EFFB3932B12CFED18790D8F777235E5FBB9B7F27AC3258F27F29E2F0E4DA88A4A6E8B4A6B8C7E2A03871504CEBA520204A101081A5F06E6475604C756094E85E6C7590E425424D49194D0F324BEF4621416E4462FEFD98F40B37127EBA881CAF6CD99D7AF36EC5B3ECF7C90F0FAEDB38A297871A9CB19AA68B95ADA7C7804923C7CC183769D68429304C464D59DA1C79651D45552713CBCF878EF8DEEF9B63BBF64934BDC570FB176B8B756BD6A2A76150F4EED90B2351D2D3B475A0F8D074340A461042343401DA485C5B03935DF697848AFB9FCCA3478FB66EDDDAA3470F75C80787636969696C6C8CF555AB5695964A7EB8585929F9C71C74A63ACCC545227255FBC155CD40389A8989893971E284AFAF6FBF7EFDECEDEDBB48B1B2B23292626868686060A0AFAFAFA7A7A7ABABABA3A3037D27BA8F428E1A352A2828080E03E9A0786DD27226D128FDA367DC0E04EBF9F3E7898989E7CF9F5FB66CD9E0C1832D2C2CB4B5B5A1BD885EA16E15151558C231E4E5E5BD79F3E6E5CB97717171D1D1D1E1E1E1C8F1D6AD5B57AF5EBD78F1E2B973E7500630528AB7B7B79797D70829640F39EAE3E3337AF4E83152D67D82F59FE0F34F8004DBE4EB4F70E6CC991B376E5CBB76EDE4C993583F75EAD4A2458B1C1D1DD5D4D4264D9A141616868A42FDE0C6513970E7986FA106B0929B9BFBFAF5EB5752B2B3B3511BD8535454D4A6CBEC108812CACBCB9123B24E4E4EFEE28B2FE4E4E4545454D022C8919CF3E1C30754F29C6933CC586C1345B5BE16D66BA6CF09397EE6E9DDD0DC9098C2E8A4E2F0F88AA8A4EAE8E4EAA82441709CE07EAC383856F2575650F3FBD1ADADFA5E24315150148CEC14064717DD0CE285C7221D6E585C716874414854F6EDFB29E7AF841D3D157BFE4A7AC0FD8C9088E86B370EFCB061CA67DEDD2CAD2DF58C6C4D2D5C6CEC7BBBB80DE8D967709F7EB041BD3D74D458466C1D7B73AB217DFBCF9B3673FFB69DC1B702D212933E25E29F02BDAB77EFDE8836D0EDD1F9592CD6800103366DDA84FE89D1872E8DC188180B9D1FAD066497FD25A1E2FE27838E029D850AB8BABA62C0433D31CC3435352F5FBE8C718EFE8425FA1056A0CE1896B2CBDA0DF4173DB27547C4D886648484841C3E7CF8FBEFBF5FB162C59A356B206A8B172F86FA2C58B060EEDCB9B367CF9E3163C6B469D3BEFCF24B3800C83A3ABDBCBC3CBA3BD40A0A8E524926046D21CB462A2590ADC78F1F474444040404E04EA1267DFAF481C3C0CD42D97BF6EC3976EC5808CDBFBD3BDC0B52967C965055F5514A7E7E3EDC009408FC2CE5C58B177009806822806001C8659BA01EDA84A4D91A925A6B48EEADC17DC94A2F0529C097DBDADA423B500FA1A1A1CD0E1B67E2D6D04C100EDC20D404520E8A8B8BE1ED525252D2D3D37177B865E23B014E23D7B61F6401F78014900B7A544242C2840913D0ACD0F7E5CB972371721ACEC9CCCC0CF0BFF9596F0F7BB6BE893C73889DF377337C6FED3DFC32304CF0E8594954223726991F955C199AC00D8CE40644F0EE458B42E344AD5E8D490CD2DF6C352171C4707EC1ADE08F01A1E5A1B1955188D9A39E5CB81E7DE4A79043C73202EE973DC9AACDCD7F1A19B375F9B7435CDD6C387A961C5D6B4353330323436D5D326933E0E898E819981B1ABB39751D3670F0FC59730EECDA131A18F4EAE9336E5189E4CB451D945F7418F47944571886E8F05DBB76C5A078FAF4296A9B8C20D2035175E4FCBF3254DCFF7C205277EEDC993F7FBEB3B333C63CC267C40E595959187E6418E31C123540DDC825ED47AAEA1264DBBF80643180A1206FDFBE856AA4A5A53D7BF6ECFDFBF788ACB182DC31B69F3C798243985B3C7CF870CB962D8834A14A703CBD7AF53A78F0206249488F2CB9564037A11438E7C1830708B7B76DDBE6E7E73773E64C683A52505555C5F8C13405C13552466C8B1B247203B082B2416111ECA39C448F3017466D6027A24E20CBE60F8394A435B2C3ED06D28CDB916D4837BFFBEE3BDC3BE6675055F8C85FD5E1BB77EF506968858C8C0C784434011A02CD01FF8143381955213BF577817641ED357B14342E5C381A05FABE74E9524C0EB013B7893A4755177CC83BB069CB84C19EA64C556339A57FD8775D377D4EF88973A549E9394191F921D1A561F1652171654151E5415182D0F8DAC864618B7767B63471587C1B1691208C4A2ABA1F59703FE2637064D6955BF7771FBCBD6D77C8E1E3E2EC774D7985E5CF5EDD38727CFC90A106CA2A9A0C392396165B594D4D91297DE425AFA9A20659777570F2E8D16BD7966D678E9F8C0C0E7DF3FC25AFB4BC4E286A10D5D49247EA1D01A30C7DDBD3D373E0C08198026236838923F693C803E3880C9CDF3112FFFB5071FF93412080C18FD8F6DEBD7B889DA74F9FFED5575F410A258F561B1B310E49AF2212FF3BC4452AECE4ED3312DF20152809F02898FE13E924A2D93CE0DB04B1F0993367A04766666646464613274E3C72E4C8952B57A00E6D82992C2604244E1F3C78B09D9D1DFC16444D51511197F7EBD70FF1D18F3FFE78F3E64D28177926C3E3F1306C488560494611565A82421264DBD23DE42E00CE972A7F395203B829DC1A9205B2DB6E05F26A13A4D926C8A24D480DB7062D8BF89A5C8B4D08F4AA55AB304563329998AB2D5CB8F0DCB973F07FA85E1C42A48FC2234E47EB9089021C24041D4E0E5E01B5441ECACB9AE47741EA19F586759407CA058F0B2F8B46417BA10C38847A9365D4D0F822EDD1811F360D7072D5632899C8AB207EDF346761F8B1D3AF03C3F3C3E2B97129C2844755B1A9BC48C9DF9A0B231F54B5F8CFDB96061D1785C7FFCA0411F14DE9CF4A22E2B26FDECBB87C33E1E4B9B083C712CF5E79151AC5CD7C91762768FF9AF5702D0E86263A8ACA307D350D7B732B3BCB2E2EF68EFD7BF519E733E6EBC55FEDDEBAFDF4B1133FBFC929CEFB28ACE049DEB15EDF086517702BCBC9D7103A487C7CFCC99327D12EFEFEFE9855A3E6B1135D054B0C25D2DFA427FED5A1E2FE27838144562043089F4342423053C6DC10038F1C25EA0CF9C0263A96F4DC0E8074304A017A27FC04648B08225286E8601387700E0E613FD120801370083B7115B91C2727252521CAF6F0F050565646AC0781F6F2F282DCB789A1A1A19E9E9E969616540C512141414161CC98318810E127901A260AD01AE48502E006912FCA804C0172C77EE835B97DD9CD7C029C801400CA89144073E19BCB4FF6B7869CD31A59D2AD40A9DA0439B609B2C655280CA419AA8D907CF3E6CD4E4E4EF2F2F22C16CBDADA7AD0A041F07F8810C90700A1A1A1C1C1C1F0F477EFDEC512FD2132321212832914427804F508BD49C301D4182955FBC1ADC17F601E80390152867F1D326488A9A9E9D4A9532F5FBE0C47823A47A3C8526E6C129573E3EF05AF5BEC37D4ADA7990A8BE8FBF27153E2CF5E7E7A2BA83836459896294ECDAC8A4B2B0B8B2D0E8AAC94BC3B33A6B55585C7351B3F2C965845782C3F21F55D5068CAD9CB91474E269C3A9F71EBEE9B88D8DCF8A4D39BB62D1A3FC9DDD4CA5495656F68E2E1D2AD7F37F7EE0E8EDFFA2D5BB762D5CE1FB79E3B792AE27EC8CBCC2C6E5189E42FE36BEB9BEA1A20EB584AFE81B24A58555E2179DD66C7C51D9E154E0EED852189AA26BD91B42390F4CE8E3F1DFD53A0E2FE2783B8A0B9AF205CC226FA13D63108A15944D3A14188B6C80992F33A8254A964907E49C0212C3186C93A402E24AC23A06713E00600C63C467E4A4ACA860D1B1C1D1D21D9106E7D7D7DD54F2027270729C70A241E5A367CF8F0B973E7AE5DBB1682F5F0E143C81CC9141051966D48C11E1406F78E624037251AFC0B44D40079E00EC83377F2801BDE02570149182F14122F452E9425DD6E48E2AD4113B489D407B501A95E526044F14821282868C58A1598F593A77098CD70381CCC876C6D6DEDEDEDB162626222F950DBC8082B565656D88933E112F6EEDD7BE9D2A5B8B8B8DCDC5CDC1D29674781B2C3AD1E3C78102E76F2E4C97DFBF645D88E4CCF9F3F0FB947DF43EDA1B951632839BF9257535955F82637252CFAF0969D3E03064BBEDFA9A8EC616EFDCDC42F0E7CBD32E2E8E99CFB51DC84B4F2F8D4A288F8BCA0F0F2F0386ED86F5979682CAC2C2406561216F3E8FCB5E47397430F1F0FDC7728F992FF8B90C8883317F77CBB7AA88B5B5723932EDA7A035CDDFD66CF3BB86DD7919D7BB7AFDF94129FF8E4E1A3B7AFB24B0A0A853C7EF397FD6B8492EFADD749FF3E1E8675B140F83B9EB903741BB41756D07CE88AA807CC9C9ABB28563094B0427A29D9F9D7848AFB9F0CB409E30DBD04FD092316438B741DF4B0E6DE839D1059AC60D449AEE908E89A40AAED9218166912D101480DB94367498ED04132036D09CEC7519208D983E9C5ECD9B3A1081026C4EF10F136B1B1B1812421BA9F38712202D2C0C040A81B2EC78D90EC082806B2C00AF411B7893220239493D0F2CC76426E0DC8B6FF1DA8E136911DFE7F832A45CBE2BE50CF241CC66DA20E77EFDEEDEBEBEBE6E6A6A6A646A63588E501365554543037025867B3D906060650795435D41F53A5D5AB575FBF7EFDE9D3A7082D7F4739A1E0C78F1FC7FC092D88A9039C345C0BBC358A04DF8312A257206522F1B939EF10FF4A7ECC29AC79F52863E3F255CE26E61C86BC95BAA6B992EA70A76E9BE62C083D7EFA4D7054515C5261EC838F91F1C59109251171ADAD383C16561416032B947E2B06F63134EAFA961D770F1C0ED87FE8CE8143C9FEB753EF046E98BFB88B265B9B2167C5D11EE1F13F9B57AD890B0E2FC8795FFAE1E3CF6F72F8DC0AC997FDA5AF578388579496BD7F9BF332EB19F60B2A7938447EDE0593BC225BF47BDA111D8F34196A00DE0EA312B3A5E6FE8F3E896AC709A8225414D9F9D7848A3BA563408B21588F1F3F46048A40927C970693FA2953A66065D6AC59F3E7CF5FB468118268A83991090C8C66A7224BE56F0F5403629A9E9E7EEDDAB575EBD6F9F8F82042D7D6D6868EB709C41D724FDC80A9A9A9B7B7F79A356B8E1E3D9A939383AA4652E401972C75A9064180E04A71425454D4912347962D5B866682C7B5B6B68663466A1A1A1A2E2E2E3367CEDCB66D9BECB25FD1D8D420AE6FAA6D94BCEFAD82FFE1E59B3B172FFB4E98ECA86F6CA8C8345550B6D7E0783A74FD66FC942B5B776504DC2F4E4ACB8F8ACF8F88837D088BF939343A3738F2DDFD889CA0F0C2E8C4A29807C5B149055109D89371F556ECB1D3817B0FDE3B74FCE6BE4367366ED9BC70C9AC11A3063A38DBB0B5751414ADB4F5C68FF03E7BF8F8DBAC173555A246717DAD402CAC9446E21DB2BF3154DC29ED0233531E8FD71CBF10E140340AED46B88758066AD252BB7108331248180E211492EDA5B402F583BA7DFDFAF5C3870FE3E3E3CF7D024F4FCF1E3D7A1819194194959494E00610C863CF8C19333003F0F3F35BBB76EDF6EDDB0F1F3E7CE6CC998BD29F029C3C7972CF9E3D88F471CEB061C3A0E388D6E11BB4B4B41C1C1C860E1D0A4FBC63C70E38E9CCCC4C59695A51C9E5550B44907818A2F8978F33AFFC7476C3D7DF2284B7E1E898A9AADB73748739BB2E1A3B6EF7F21517B6EC48BD7E3B23E0DEDBC898A29487154F9EF2329F61599E9E51FAF07141526A4E546CE6DDA0B8F3976EEF3D70EABBF5FBBEFE66C7D2E5AB67FBCEF01A39B49B9BAB8999BDAEBE83A1918B85C59AAF969E3E743823394DC0AD6CAA6BAA15D709F8425E05FFD7DAFD6FED6F0C15774ABB4060C8E74BDE392CDBFE05883BE4A97548DEFCC89B3C6691EDA5FC026A923C8F6AC96F5414F41A4A8D291144D9C6C6465353534E4E0E4A2D2F2FCF6432592C96BEBE3EB4DBD1D1D1CDCD0DA2EFEAEA6A6767676C6C2CFD71AE9AAAAA2AE274C83AF6F4EFDF1FCE003E20212101713D9AB575499AA9A8E089AAE1B6A51B0D4DA22AC96B14DF643EF59BED3BC5DBA7BF7357C8B1B516C7D9C0A8AF8DDD1067976593A66E98B7F0D8F71B028E9E88BF76E3E1DDA0F47BC18F02EF63F9E0C6EDB0B3176E1C387C7AF3D6FD2BD76C59ECF7BDEFFC7FB8BAF5B4B2B6D264235A37D6D0E8656F3F79D4E8AFE72F484F4CCECD7E53CD134A04BA012EB05628A84114212D07A55D5071A7740C08018409DA8DA81CB17C05463F8F874D483C741C87B0024D272B002BE4B18CEC7A8A1432DD41CD00541714B64CFAAB25D9E156E01C1C4D4F4FBF71E30622F4050B16F8F8F80C1A34485D5D9D3CA647380FA1973EB691A0A0A04056141515A1FBDDBA75F3F2F29A3A752A427B7F7FFFB4B4B48F1F3F9207CAC81A8D28CBA615E21AC9AB9D61D0D8FAFA4644D092CF306BEB1F2524055EBBBEFDBB1FA67FFEF96037774723632355353643CE90C9B4E670FA58DB8CF4F098EE3D72E1A4495F4F9BBE7CE6CCF9E3C64F1F35EAF38183300119E0E8D4DBC6A6A7A595BB85058BC1D0565434E3707A3A384CF4F6DEB47AD5ED4B975363E3CA0A8A0495BCBA9A7AC406A82A8150545BF7370FC43B0C15774A0768FEAC0910D526FBA1DD38D452C1EB7EF9E625F8D5131B0A68B35AB0094FD926CD27408E0B0A0AB2B2B2626363838282A64D9B06C91E376E9CB7B7F7902143FAF6EDEBEEEE8EB0DDD3D373F8F0E1A3478FC6092B57AE3C72E44860606062622271B7C81AED8506828F41E2E59FF851180A27ACA917D537D5343689EB9BAA44E22A81F46D7138D0D80477F4FC517AE075FF035BB67D356B8ECF9021FD5C5DB514E53515E434190C963C83A320AFABAA2C79D92747CB465FCF84ADA9CB5452673034180C2CD9F2726C25050B3DDD7E6EDDE67EF1E5A19DBB22EF05656765551497D608ABAB7802F2B336C87A254F5851552DFA65FE40692754DC29ED026A0E2180B200AC4317883071B9DCD2D252F27B540483882EA114D00B1C05AD459F4240D42C907E3B88482D01B52A5B6B45494949656565B33705A858B405F909714A4A0A843B2626263C3C3C2424E4FEFDFB90722CA3A2A25253535FBD7A45BEC04E1A024BAC930FBA49529F020D5C545E59C0AD2CE309F8A2DAEADA3A18796B99E4587D83A88A5F5E58F8EEF98BA4A8E81B17CF9F38B06FCCF061C3FEC7A3BB93BDA5A11E4795A92AC75096BC434D622A0C862653C14487DDD5C66A60EF1EA3860D193FCA6BA5DF9243BB76C40487E4BF7B87105DF26702F50D92BF8795E60013D737540A44E53C014F28A6FADE21A8B853DA053408408C9A2131A0ECF02768D677994475FCAB8D9D15C913AB5F7E5E0B9DE5FFF27205D9E156409DE14771896C5BCA6FD47F99F4E7ACBF926FB4059C0A724152C854B6F7D340498B79551FCAB8F965DC4A712D1A0F26AAAB17896B25CE895F25AA1634D4881B3143ABAA2A2BCCFF90F3FADEED1BFE972FFC74F4D08E1F37AEFE66D9E27973664F9B3A7DCAC43EDDBB0DE8DB6BD4F06133BF98BC6AF9D2DDDB7EC439174E9F7C9A9EF62EFB05B7A8A8B65A8874EAA1EB62493723B9C36A1B3163A82DE70B2B0462AC909DEDB7BF3354DC29ED8244E2ADC138848234C7E65881E240B09A3721E890A4660923FB29A825D44C73BD3503E56D13D9E116A03E3149423A5237F1CFD730603FC02544229BC1219C4F8EE27CB21305282E2ECECECE269BBF02E208E75026A82EA9E023CEAF47B11B1ACB79FC82C262A40F0FC1ABE48A45C2A6C67A69C45D572FC63AEEA80ECBC6869A6A3EAFB828FFC3BB9CD7D9CF73DFBCCE7DF7FAE3CFEF4B8A3FF2B9E582AA0A1C15F2B892F3EB6AB15E525C58F031AFACB498149B5BC1E35709AB453502710DBFBA0661BB405C27463E2D84BB3DF677868A3B8542F924BFD24A626D203B207D1CDFD125B14FD07CFC37CFA2B40115770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9845071A75028944E0815770A8542E9743435FD1FC2FCFD5D57B64EF60000000049454E44AE426082, NULL)
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000001', N'SH0000000002', N'ST0000000001', 1, NULL, NULL)
GO
INSERT [dbo].[TimeKeeping] ([WS_ID], [StaffID], [ShiftID], [ST_ID], [AbsenceUse], [CheckInTime], [CheckOutTime]) VALUES (N'WS0000000001', N'S0000000001', N'SH0000000003', N'ST0000000001', 1, NULL, NULL)
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000001', N'Liên ca')
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000002', N'Từng ca')
GO
INSERT [dbo].[WorkSchedule] ([WS_ID], [StaffID], [WorkDate]) VALUES (N'WS0000000001', N'S0000000001', CAST(N'2023-12-06' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AllowanceName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Allowance] ADD  CONSTRAINT [UQ_AllowanceName] UNIQUE NONCLUSTERED 
(
	[AllowanceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardTypeName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[CardType] ADD  CONSTRAINT [UQ_CardTypeName] UNIQUE NONCLUSTERED 
(
	[CardTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ContractTypeName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[ContractType] ADD  CONSTRAINT [UQ_ContractTypeName] UNIQUE NONCLUSTERED 
(
	[ContractTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DepartmentName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UQ_DepartmentName] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_InterfaceName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Interface] ADD  CONSTRAINT [UC_InterfaceName] UNIQUE NONCLUSTERED 
(
	[InterfaceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_OperationName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Operation] ADD  CONSTRAINT [UC_OperationName] UNIQUE NONCLUSTERED 
(
	[OperationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PositionName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [UQ_PositionName] UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_BeginTime]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_BeginTime] UNIQUE NONCLUSTERED 
(
	[BeginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_EndTime]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_EndTime] UNIQUE NONCLUSTERED 
(
	[EndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_ShiftName] UNIQUE NONCLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftTypeName]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[ShiftType] ADD  CONSTRAINT [UQ_ShiftTypeName] UNIQUE NONCLUSTERED 
(
	[ShiftTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Account] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardID]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_CardID] UNIQUE NONCLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 10/12/2023 4:51:46 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CheckWorkSchedule]    Script Date: 10/12/2023 4:51:46 PM ******/
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
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [CHECK_Account] CHECK  ((len([Account])>=(5) AND len([Account])<(15)))
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AL_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AU_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CardID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CT_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CoTr_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_DP_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_IT_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_OP_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_PS_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ShiftID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[CheckShiftTime]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ST_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_StaffID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_TKM_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_WS_ID]    Script Date: 10/12/2023 4:51:46 PM ******/
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