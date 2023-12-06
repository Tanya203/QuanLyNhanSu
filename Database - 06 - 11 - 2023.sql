USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 6/11/2023 3:20:21 PM ******/
CREATE DATABASE [QuanLyNhanSu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhanSu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhanSu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Allowance]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[AllowanceDetail]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Authority]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Authorizations]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[CardDetail]    Script Date: 6/11/2023 3:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDetail](
	[CardID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[Amount] [decimal](38, 3) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_CardDetail] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC,
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 6/11/2023 3:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CT_ID] [varchar](15) NOT NULL,
	[CardTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Interface]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Month]    Script Date: 6/11/2023 3:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[Month] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthSalaryDetail]    Script Date: 6/11/2023 3:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthSalaryDetail](
	[Month] [varchar](20) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[TotalWorkHours] [decimal](38, 2) NULL,
	[TotalSalaryHours] [decimal](38, 3) NULL,
	[TotalBonus] [decimal](38, 3) NULL,
	[TotalFine] [decimal](38, 3) NULL,
	[TotalAllowance] [decimal](38, 3) NULL,
 CONSTRAINT [PK_MonthSalaryDetail] PRIMARY KEY CLUSTERED 
(
	[Month] ASC,
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperateHistory]    Script Date: 6/11/2023 3:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperateHistory](
	[DateTime] [varchar](100) NOT NULL,
	[StaffID] [varchar](15) NULL,
	[OP_ID] [varchar](15) NULL,
	[DetailOperation] [nvarchar](500) NULL,
 CONSTRAINT [PK_OperateHistory] PRIMARY KEY CLUSTERED 
(
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[ShiftType]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 6/11/2023 3:20:21 PM ******/
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
	[Picture] [varchar](50) NULL,
	[LockDate] [datetime] NULL,
	[Dept] [decimal](38, 3) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeKeeping]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[TimeKeepingMethod]    Script Date: 6/11/2023 3:20:21 PM ******/
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
/****** Object:  Table [dbo].[WorkSchedule]    Script Date: 6/11/2023 3:20:21 PM ******/
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
INSERT [dbo].[OperateHistory] ([DateTime], [StaffID], [OP_ID], [DetailOperation]) VALUES (N'15:18:43.171649 | 06/11/2023', N'S00000000001', N'OP0000000001', N'Đăng nhập')
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
INSERT [dbo].[Position] ([PS_ID], [DP_ID], [PositionName]) VALUES (N'PS0000000001', N'DP0000000001', N'Trưởng phòng giám đốc')
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'CA0000000001', N'1', CAST(N'07:30:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'CA0000000002', N'2', CAST(N'13:30:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'CA0000000003', N'3', CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Shift] ([ShiftID], [ShiftName], [BeginTime], [EndTime]) VALUES (N'CA0000000004', N'4', CAST(N'23:00:00' AS Time), CAST(N'03:00:00' AS Time))
GO
INSERT [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MiddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate], [Dept]) VALUES (N'S00000000001', N'PS0000000001', N'CT0000000001', N'TK001', N'$2a$12$knXCHv99aRmPfehXQBT1bu7B6qR4IhFuaEL0gqZ25Hp6DVcNP83Te', N'079202007088', N'Nguyễn', N'Gia', N'Huy', CAST(N'2002-04-17' AS Date), N'538/19', N'Đoàn Văn Bơ', N'14', N'4', N'Hồ Chí Minh', N'Nam', N'0906375047', N'nguyengiahuy@gmail.com', N'Cử nhân', CAST(N'2023-11-06' AS Date), CAST(N'2025-01-01' AS Date), N'Bình thường', 15, CAST(150000.000 AS Decimal(38, 3)), NULL, NULL, NULL)
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000001', N'Liên ca')
GO
INSERT [dbo].[TimeKeepingMethod] ([TKM_ID], [TimeKeepingMethodName]) VALUES (N'TKM0000000002', N'Từng ca')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AllowanceName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Allowance] ADD  CONSTRAINT [UQ_AllowanceName] UNIQUE NONCLUSTERED 
(
	[AllowanceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardTypeName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[CardType] ADD  CONSTRAINT [UQ_CardTypeName] UNIQUE NONCLUSTERED 
(
	[CardTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ContractTypeName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[ContractType] ADD  CONSTRAINT [UQ_ContractTypeName] UNIQUE NONCLUSTERED 
(
	[ContractTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DepartmentName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UQ_DepartmentName] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_InterfaceName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Interface] ADD  CONSTRAINT [UC_InterfaceName] UNIQUE NONCLUSTERED 
(
	[InterfaceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_OperationName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Operation] ADD  CONSTRAINT [UC_OperationName] UNIQUE NONCLUSTERED 
(
	[OperationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PositionName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [UQ_PositionName] UNIQUE NONCLUSTERED 
(
	[PositionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_BeginTime]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_BeginTime] UNIQUE NONCLUSTERED 
(
	[BeginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_EndTime]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_EndTime] UNIQUE NONCLUSTERED 
(
	[EndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Shift] ADD  CONSTRAINT [UQ_ShiftName] UNIQUE NONCLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ShiftTypeName]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[ShiftType] ADD  CONSTRAINT [UQ_ShiftTypeName] UNIQUE NONCLUSTERED 
(
	[ShiftTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Account]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Account] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CardID]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_CardID] UNIQUE NONCLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 6/11/2023 3:20:22 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CheckWorkSchedule]    Script Date: 6/11/2023 3:20:22 PM ******/
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
GO
ALTER TABLE [dbo].[CardDetail] CHECK CONSTRAINT [FK_CardDetail_Staff]
GO
ALTER TABLE [dbo].[ContractType]  WITH CHECK ADD  CONSTRAINT [FK_ContractType_TimeKeepingMethod] FOREIGN KEY([TKM_ID])
REFERENCES [dbo].[TimeKeepingMethod] ([TKM_ID])
GO
ALTER TABLE [dbo].[ContractType] CHECK CONSTRAINT [FK_ContractType_TimeKeepingMethod]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [FK_MonthSalaryDetail_MonthSalary] FOREIGN KEY([Month])
REFERENCES [dbo].[Month] ([Month])
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [FK_MonthSalaryDetail_MonthSalary]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [FK_MonthSalaryDetail_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
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
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_Shift] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Shift] ([ShiftID])
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_Shift]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_ShiftType] FOREIGN KEY([ST_ID])
REFERENCES [dbo].[ShiftType] ([ST_ID])
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_ShiftType]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_Staff]
GO
ALTER TABLE [dbo].[TimeKeeping]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeeping_WorkSchedule] FOREIGN KEY([WS_ID])
REFERENCES [dbo].[WorkSchedule] ([WS_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimeKeeping] CHECK CONSTRAINT [FK_TimeKeeping_WorkSchedule]
GO
ALTER TABLE [dbo].[WorkSchedule]  WITH CHECK ADD  CONSTRAINT [FK_WorkSchedule_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
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
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_TotalAllowance] CHECK  (([TotalAllowance]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_TotalAllowance]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_TotalBonus] CHECK  (([TotalBonus]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_TotalBonus]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_TotalFine] CHECK  (([TotalFine]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_TotalFine]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_TotalSalaryHours] CHECK  (([TotalSalaryHours]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_TotalSalaryHours]
GO
ALTER TABLE [dbo].[MonthSalaryDetail]  WITH CHECK ADD  CONSTRAINT [CHECK_TotalWorkHours] CHECK  (([TotalWorkHours]>=(0)))
GO
ALTER TABLE [dbo].[MonthSalaryDetail] CHECK CONSTRAINT [CHECK_TotalWorkHours]
GO
ALTER TABLE [dbo].[ShiftType]  WITH CHECK ADD  CONSTRAINT [CHECK_SalaryCoefficient] CHECK  (([SalaryCoefficient]>(0)))
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AL_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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

    DECLARE @NewALID varchar(15);

    -- Find the maximum used AL_ID value
    DECLARE @MaxALID varchar(15);
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_AU_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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

    DECLARE @NewAU_ID varchar(15);

	-- Find the maximum used AU_ID value
	DECLARE @MaxAU_ID varchar(15);
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CardID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
		DECLARE @NewCardID varchar(15);

		-- Find the maximum used CardID value
		DECLARE @MaxCardID varchar(15);
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

		-- Insert the new record with the generated CardID value
		INSERT INTO [dbo].[Card] ([CardID], [CT_ID], [StaffID], [DateCreated])
		SELECT @NewCardID,
			   [CT_ID],
			   [StaffID],
			   [DateCreated]
		FROM inserted;
	END;

GO
ALTER TABLE [dbo].[Card] ENABLE TRIGGER [AUTO_GENERATE_CardID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CT_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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

    -- Insert the new record with the generated CT_ID value
    INSERT INTO [dbo].[CardType] ([CT_ID], [CardTypeName])
    SELECT @NewCT_ID,
           [CardTypeName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[CardType] ENABLE TRIGGER [AUTO_GENERATE_CT_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_CoTr_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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

    -- Insert the new record with the generated CT_ID value
    INSERT INTO [dbo].[ContractType] ([CT_ID], [TKM_ID], [ContractTypeName])
    SELECT @NewCT_ID,
           [TKM_ID],
           [ContractTypeName]
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[ContractType] ENABLE TRIGGER [AUTO_GENERATE_CoTr_ID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_DP_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_IT_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_OP_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_PS_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ShiftID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[CheckShiftTime]    Script Date: 6/11/2023 3:20:22 PM ******/
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
					OR (c.BeginTime > c.EndTime AND i.BeginTime > i.EndTime)							
					OR (c.BeginTime > c.EndTime AND i.BeginTime < c.EndTime AND i.EndTime > c.EndTime)										
					OR (c.BeginTime > c.EndTime AND i.BeginTime < c.EndTime AND i.EndTime < c.EndTime)
					OR (c.BeginTime > c.EndTime AND i.BeginTime > c.BeginTime AND i.EndTime > c.BeginTime))
    BEGIN
        RAISERROR (N'TIME_CHECK_ERROR', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
ALTER TABLE [dbo].[Shift] ENABLE TRIGGER [CheckShiftTime]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_ST_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_StaffID]    Script Date: 6/11/2023 3:20:22 PM ******/
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

		-- Find the maximum used StaffID value
		DECLARE @MaxStaffID varchar(15);
		SELECT @MaxStaffID = MAX(StaffID) FROM [dbo].[Staff];

		-- If the table is empty, start with S00000000001
		IF @MaxStaffID IS NULL
		BEGIN
			SET @NewStaffID = 'S00000000001';
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
		INSERT INTO [dbo].[Staff] ([StaffID], [PS_ID], [CT_ID], [Account], [Password], [CardID], [LastName], [MIddleName], [FirstName], [Brithday], [HouseNumber], [Street], [Ward], [District], [Province_City], [Gender], [Phone], [Email], [EducationLevel], [EntryDate], [ContractDuration], [Status], [DayOffAmount], [BasicSalary], [Picture], [LockDate], [Dept])
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
			   [LockDate],
			   [Dept]
		FROM inserted;
	END;
GO
ALTER TABLE [dbo].[Staff] ENABLE TRIGGER [AUTO_GENERATE_StaffID]
GO
/****** Object:  Trigger [dbo].[AUTO_GENERATE_TKM_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
/****** Object:  Trigger [dbo].[AUTO_GENERATE_WS_ID]    Script Date: 6/11/2023 3:20:22 PM ******/
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
