USE [master]
GO
/****** Object:  Database [PRNProject]    Script Date: 7/18/2022 2:05:48 AM ******/
CREATE DATABASE [PRNProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRNProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRNProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRNProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRNProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRNProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRNProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRNProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRNProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRNProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRNProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRNProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRNProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRNProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRNProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRNProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRNProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRNProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRNProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRNProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRNProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRNProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRNProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRNProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRNProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRNProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRNProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRNProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRNProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRNProject] SET RECOVERY FULL 
GO
ALTER DATABASE [PRNProject] SET  MULTI_USER 
GO
ALTER DATABASE [PRNProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRNProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRNProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRNProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRNProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRNProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRNProject', N'ON'
GO
ALTER DATABASE [PRNProject] SET QUERY_STORE = OFF
GO
USE [PRNProject]
GO
/****** Object:  Table [dbo].[ACCOUNTS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNTS](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](25) NULL,
	[Address] [varchar](255) NULL,
	[Role] [int] NULL,
	[Username] [varchar](127) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAMPUSES]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAMPUSES](
	[CampusId] [int] NOT NULL,
	[CampusCode] [nvarchar](50) NULL,
	[CampusName] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Campuses] PRIMARY KEY CLUSTERED 
(
	[CampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COURSE_SCHEDULES]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COURSE_SCHEDULES](
	[TeachingScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[TeachingDate] [datetime] NULL,
	[Slot] [int] NULL,
	[RoomId] [int] NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_TEACHING_SCHEDULES] PRIMARY KEY CLUSTERED 
(
	[TeachingScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COURSES]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COURSES](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](50) NULL,
	[CourseDescription] [nvarchar](300) NULL,
	[SubjectId] [int] NOT NULL,
	[InstructorId] [int] NULL,
	[TermId] [int] NULL,
	[CampusID] [int] NULL,
 CONSTRAINT [PK_COURSES] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURICULUM]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURICULUM](
	[CuriculumID] [int] IDENTITY(1,1) NOT NULL,
	[CuriculumName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CuriculumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURICULUM_SUBJECT]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURICULUM_SUBJECT](
	[CuriculumID] [int] NULL,
	[SubjectID] [int] NULL,
	[TermNo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTMENTS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTMENTS](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_DEPARTMENTS] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUCTORS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUCTORS](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[InstructorFirstName] [nvarchar](50) NULL,
	[InstructorMidName] [nvarchar](50) NULL,
	[InstructorLastName] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_INSTRUCTORS] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAJOR_CUR]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAJOR_CUR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MajorId] [int] NULL,
	[CuriculumId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAJORS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAJORS](
	[MajorID] [int] IDENTITY(1,1) NOT NULL,
	[MajorName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEWS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEWS](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Title] [ntext] NULL,
	[Context] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLL_CALL_BOOKS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLL_CALL_BOOKS](
	[RollCallBookId] [int] IDENTITY(1,1) NOT NULL,
	[TeachingScheduleId] [int] NULL,
	[StudentId] [int] NULL,
	[IsAbsent] [bit] NULL,
	[Comment] [nvarchar](300) NULL,
 CONSTRAINT [PK_ROLL_CALL_BOOKS] PRIMARY KEY CLUSTERED 
(
	[RollCallBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROOMS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOMS](
	[RoomId] [int] NOT NULL,
	[RoomCode] [nvarchar](50) NULL,
	[CampusId] [int] NULL,
	[Capacity] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ROOMS] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT_COURSE]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT_COURSE](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Mark] [float] NULL,
 CONSTRAINT [PK_STUDENT_COURSE] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENTS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENTS](
	[StudentId] [int] NOT NULL,
	[Roll#] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MidName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[MajorCurId] [int] NULL,
 CONSTRAINT [PK_STUDENTS] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBJECTS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBJECTS](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectCode] [nvarchar](50) NULL,
	[SubjectName] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_SUBJECTS] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TERMS]    Script Date: 7/18/2022 2:05:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TERMS](
	[TermId] [int] NOT NULL,
	[TermName] [nvarchar](50) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACCOUNTS] ON 

INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (2, N'a', N'6', N'22222', N'5656', 1, N'st1')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (3, N'a', N'a', N'a', N'a', 1, N'st2')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (4, N'a', N'a', N'a', N'a', 1, N'st3')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (5, N'a', N'a', N'a', N'a', 1, N'st4')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (6, N'a', N'a', N'a', N'a', 1, N'st5')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (7, N'a', N'a', N'a', N'a', 1, N'st6')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (8, N'a', N'a', N'a', N'a', 1, N'st7')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (9, N'a', N'a', N'a', N'a', 1, N'st8')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (10, N'a', N'a', N'a', N'a', 1, N'st9')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (11, N'a', N'a', N'a', N'a', 1, N'st10')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (12, N'a', N'a', N'a', N'a', 1, N'st11')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (13, N'a', N'a', N'a', N'a', 1, N'st12')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (14, N'a', N'a', N'a', N'a', 1, N'st13')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (15, N'a', N'a', N'a', N'a', 1, N'st14')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (16, N'a', N'a', N'a', N'a', 1, N'st15')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (17, N'a', N'a', N'a', N'a', 1, N'st16')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (18, N'a', N'a', N'a', N'a', 1, N'st17')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (19, N'a', N'a', N'a', N'a', 1, N'st18')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (20, N'a', N'a', N'a', N'a', 1, N'st19')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (21, N'a', N'a', N'a', N'a', 1, N'st20')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (22, N'a', N'a', N'a', N'a', 1, N'st21')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (23, N'a', N'a', N'a', N'a', 1, N'st22')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (24, N'a', N'a', N'a', N'a', 1, N'st23')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (25, N'a', N'a', N'a', N'a', 1, N'st24')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (26, N'a', N'a', N'a', N'a', 1, N'st25')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (27, N'a', N'a', N'a', N'a', 1, N'st26')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (28, N'a', N'a', N'a', N'a', 1, N'st27')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (29, N'a', N'a', N'a', N'a', 1, N'st28')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (30, N'a', N'a', N'a', N'a', 1, N'st29')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (31, N'a', N'a', N'a', N'a', 1, N'st30')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (32, N'a', N'a', N'a', N'a', 1, N'st31')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (33, N'a', N'a', N'a', N'a', 1, N'st32')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (34, N'a', N'a', N'a', N'a', 1, N'st33')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (35, N'a', N'a', N'a', N'a', 1, N'st34')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (36, N'a', N'a', N'a', N'a', 1, N'st35')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (37, N'a', N'a', N'a', N'a', 1, N'st36')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (38, N'a', N'a', N'a', N'a', 1, N'st37')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (39, N'a', N'a', N'a', N'a', 1, N'st38')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (40, N'a', N'a', N'a', N'a', 1, N'st39')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (41, N'a', N'a', N'a', N'a', 1, N'st40')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (42, N'a', N'a', N'a', N'a', 1, N'st41')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (43, N'a', N'a', N'a', N'a', 1, N'st42')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (44, N'a', N'a', N'a', N'a', 1, N'st43')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (45, N'a', N'a', N'a', N'a', 1, N'st44')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (46, N'a', N'a', N'a', N'a', 1, N'st45')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (47, N'a', N'a', N'a', N'a', 1, N'st46')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (48, N'a', N'a', N'a', N'a', 1, N'st47')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (49, N'a', N'a', N'a', N'a', 1, N'st48')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (50, N'a', N'a', N'a', N'a', 1, N'st49')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (51, N'a', N'a', N'a', N'a', 1, N'st50')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (52, N'a', N'a', N'a', N'a', 1, N'st51')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (53, N'a', N'a', N'a', N'a', 1, N'st52')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (54, N'a', N'a', N'a', N'a', 1, N'st53')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (55, N'a', N'a', N'a', N'a', 1, N'st54')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (57, N'a', N'a', N'a', N'a', 1, N'st55')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (58, N'a', N'a', N'a', N'a', 1, N'st56')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (59, N'a', N'a', N'a', N'a', 1, N'st57')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (60, N'a', N'a', N'a', N'a', 1, N'st58')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (61, N'a', N'a', N'a', N'a', 2, N'ins1')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (62, N'a', N'a', N'a', N'a', 2, N'ins2')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (63, N'a', N'a', N'a', N'a', 2, N'ins3')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (64, N'a', N'a', N'a', N'a', 2, N'ins4')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (65, N'a', N'a', N'a', N'a', 2, N'ins5')
SET IDENTITY_INSERT [dbo].[ACCOUNTS] OFF
GO
INSERT [dbo].[CAMPUSES] ([CampusId], [CampusCode], [CampusName], [Description]) VALUES (1, N'BSE-HN', N'BSE-HN', NULL)
GO
SET IDENTITY_INSERT [dbo].[COURSE_SCHEDULES] ON 

INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (1, 1, CAST(N'2011-07-23T12:26:12.443' AS DateTime), 1, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (2, 1, CAST(N'2011-07-24T12:26:12.450' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (3, 1, CAST(N'2011-07-25T12:26:12.450' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (4, 4, CAST(N'2011-07-26T12:26:12.450' AS DateTime), 1, 215, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (5, 4, CAST(N'2011-07-27T12:26:12.450' AS DateTime), 2, 215, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (6, 4, CAST(N'2011-07-28T12:26:12.450' AS DateTime), 3, 215, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (7, 5, CAST(N'2011-07-29T12:26:12.450' AS DateTime), 1, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (8, 5, CAST(N'2011-07-30T12:26:12.450' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (9, 5, CAST(N'2011-07-31T12:26:12.450' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (10, 6, CAST(N'2011-08-01T12:26:12.450' AS DateTime), 1, 214, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (11, 6, CAST(N'2011-08-02T12:26:12.450' AS DateTime), 2, 214, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (12, 6, CAST(N'2011-08-03T12:26:12.450' AS DateTime), 3, 214, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (13, 7, CAST(N'2011-08-04T12:26:12.450' AS DateTime), 1, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (14, 8, CAST(N'2011-08-05T12:26:12.450' AS DateTime), 1, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (15, 1, CAST(N'2011-08-06T12:26:12.450' AS DateTime), 1, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (16, 4, CAST(N'2011-08-07T12:26:12.450' AS DateTime), 1, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (17, 5, CAST(N'2011-07-23T12:26:12.450' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (18, 6, CAST(N'2011-07-24T12:26:12.450' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (19, 7, CAST(N'2011-07-25T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (20, 8, CAST(N'2011-07-26T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (21, 1, CAST(N'2011-07-27T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (22, 4, CAST(N'2011-07-28T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (23, 5, CAST(N'2011-07-29T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (24, 6, CAST(N'2011-07-30T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (25, 7, CAST(N'2011-07-31T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (26, 8, CAST(N'2011-08-01T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (27, 1, CAST(N'2011-08-02T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (28, 4, CAST(N'2011-08-03T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (29, 5, CAST(N'2011-08-04T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (30, 6, CAST(N'2011-08-05T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (31, 7, CAST(N'2011-08-06T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (32, 8, CAST(N'2011-08-07T12:26:12.453' AS DateTime), 2, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (33, 1, CAST(N'2011-07-23T12:26:12.453' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (34, 1, CAST(N'2011-07-24T12:26:12.453' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (35, 1, CAST(N'2011-07-25T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (36, 1, CAST(N'2011-07-26T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (37, 1, CAST(N'2011-07-27T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (38, 1, CAST(N'2011-07-28T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (39, 1, CAST(N'2011-07-29T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (40, 1, CAST(N'2011-07-30T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (41, 1, CAST(N'2011-07-31T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (42, 1, CAST(N'2011-08-01T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (43, 1, CAST(N'2011-08-02T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (44, 1, CAST(N'2011-08-03T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (45, 1, CAST(N'2011-08-04T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (46, 1, CAST(N'2011-08-05T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (47, 1, CAST(N'2011-08-06T12:26:12.457' AS DateTime), 3, 216, NULL)
INSERT [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId], [CourseId], [TeachingDate], [Slot], [RoomId], [Description]) VALUES (48, 1, CAST(N'2011-08-07T12:26:12.457' AS DateTime), 3, 216, NULL)
SET IDENTITY_INSERT [dbo].[COURSE_SCHEDULES] OFF
GO
SET IDENTITY_INSERT [dbo].[COURSES] ON 

INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (1, N'SE0507', N'SE0507', 30, 1, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (4, N'SE0508', N'SE0508', 30, 2, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (5, N'SE0509', N'SE0509', 30, 3, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (6, N'SE0511', N'SE0511', 30, 4, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (7, N'SE0512', N'SE0512', 30, 1, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (8, N'SE0510', N'SE0510', 30, 2, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (9, N'SE0515', N'SE0515', 30, 3, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (11, N'SE1611', N'SE1611', 56, 5, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (12, N'SE1611', N'SE1611', 241, 4, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (13, N'SE1611', N'SE1611', 199, 1, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (14, N'SE1611', N'SE1611', 221, 2, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (15, N'SE1611', N'SE1611', 224, 3, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (16, N'SE1612', N'SE1612', 56, 5, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (17, N'SE1612', N'SE1612', 241, 4, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (18, N'SE1612', N'SE1612', 199, 1, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (19, N'SE1612', N'SE1612', 221, 2, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (20, N'SE1612', N'SE1612', 224, 3, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (21, N'SE1613', N'SE1613', 56, 5, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (22, N'SE1613', N'SE1613', 241, 4, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (23, N'SE1613', N'SE1613', 199, 1, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (25, N'SE1613', N'SE1613', 221, 2, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (26, N'SE1613', N'SE1613', 224, 3, 12, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (27, N'SE1611', N'SE1611', 56, 5, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (28, N'SE1611', N'SE1611', 241, 4, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (29, N'SE1611', N'SE1611', 199, 1, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (30, N'SE1611', N'SE1611', 221, 2, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (31, N'SE1611', N'SE1611', 224, 3, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (32, N'SE1612', N'SE1612', 56, 5, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (33, N'SE1612', N'SE1612', 241, 4, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (34, N'SE1612', N'SE1612', 199, 1, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (35, N'SE1612', N'SE1612', 221, 2, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (36, N'SE1612', N'SE1612', 224, 3, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (37, N'SE1613', N'SE1613', 56, 5, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (38, N'SE1613', N'SE1613', 241, 4, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (39, N'SE1613', N'SE1613', 199, 1, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (40, N'SE1613', N'SE1613', 221, 2, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (41, N'SE1613', N'SE1613', 224, 3, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (42, N'SE1611', N'SE1611', 57, 5, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (43, N'SE1611', N'SE1611', 240, 4, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (44, N'SE1611', N'SE1611', 239, 1, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (45, N'SE1611', N'SE1611', 223, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (46, N'SE1611', N'SE1611', 225, 3, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (47, N'SE1612', N'SE1612', 57, 5, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (48, N'SE1612', N'SE1612', 240, 4, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (49, N'SE1612', N'SE1612', 239, 1, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (50, N'SE1612', N'SE1612', 223, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (51, N'SE1612', N'SE1612', 225, 3, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (52, N'SE1613', N'SE1613', 57, 5, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (53, N'SE1613', N'SE1613', 240, 4, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (54, N'SE1613', N'SE1613', 239, 1, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (55, N'SE1613', N'SE1613', 223, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (56, N'SE1613', N'SE1613', 225, 3, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (57, N'SE1611', N'SE1611', 58, 5, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (58, N'SE1611', N'SE1611', 282, 4, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (59, N'SE1611', N'SE1611', 281, 1, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (60, N'SE1611', N'SE1611', 265, 2, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (61, N'SE1611', N'SE1611', 278, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (62, N'SE1612', N'SE1612', 58, 5, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (63, N'SE1612', N'SE1612', 282, 4, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (64, N'SE1612', N'SE1612', 281, 1, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (65, N'SE1612', N'SE1612', 265, 2, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (66, N'SE1612', N'SE1612', 278, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (67, N'SE1613', N'SE1613', 58, 5, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (68, N'SE1613', N'SE1613', 282, 4, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (69, N'SE1613', N'SE1613', 281, 1, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (70, N'SE1613', N'SE1613', 265, 2, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (71, N'SE1613', N'SE1613', 278, 3, 15, 1)
SET IDENTITY_INSERT [dbo].[COURSES] OFF
GO
SET IDENTITY_INSERT [dbo].[CURICULUM] ON 

INSERT [dbo].[CURICULUM] ([CuriculumID], [CuriculumName]) VALUES (1, N'BIT_SE_16A_NET')
SET IDENTITY_INSERT [dbo].[CURICULUM] OFF
GO
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 283, 1)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 284, 1)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 285, 1)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 286, 1)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 287, 1)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 288, 2)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 289, 2)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 290, 2)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 291, 2)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 292, 2)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 293, 3)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 294, 3)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 295, 3)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 296, 3)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 297, 3)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 298, 4)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 299, 4)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 300, 4)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 301, 4)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 302, 4)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 303, 5)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 304, 5)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 305, 5)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 306, 5)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 309, 5)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 310, 6)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 311, 6)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 312, 7)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 313, 7)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 314, 7)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 315, 7)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 316, 7)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 317, 8)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 318, 8)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 319, 8)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 320, 8)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 321, 8)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 322, 8)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 323, 9)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 324, 9)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 325, 9)
INSERT [dbo].[CURICULUM_SUBJECT] ([CuriculumID], [SubjectID], [TermNo]) VALUES (1, 326, 9)
GO
SET IDENTITY_INSERT [dbo].[DEPARTMENTS] ON 

INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (1, N'Business Administration', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (2, N'Chinese', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (3, N'Computing Fundamental', N'CF')
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (4, N'English', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (5, N'English Preparation Course', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (6, N'Greenwich 3 years', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (7, N'Information Technology Specialization', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (8, N'Japanese', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (9, N'Mathematics', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (10, N'Physical Training', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (11, N'Soft Skill', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (12, N'Software Engineering', N'SE')
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (13, N'Top-up', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (14, N'LAB', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (15, N'On the job training', NULL)
INSERT [dbo].[DEPARTMENTS] ([DepartmentId], [DepartmentName], [Description]) VALUES (16, N'Graduation', NULL)
SET IDENTITY_INSERT [dbo].[DEPARTMENTS] OFF
GO
SET IDENTITY_INSERT [dbo].[INSTRUCTORS] ON 

INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (1, N'Thu', N'Vinh', N'Tran', 12, 61)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (2, N'Quang', N'Ngoc', N'La', 3, 62)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (3, N'Tu', NULL, N'Do', 3, 63)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (4, N'Trung', NULL, N'Nguyen', 12, 64)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (5, N'Quang', N'Van ', N'Tran', 10, 65)
SET IDENTITY_INSERT [dbo].[INSTRUCTORS] OFF
GO
SET IDENTITY_INSERT [dbo].[MAJOR_CUR] ON 

INSERT [dbo].[MAJOR_CUR] ([Id], [MajorId], [CuriculumId]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[MAJOR_CUR] OFF
GO
SET IDENTITY_INSERT [dbo].[MAJORS] ON 

INSERT [dbo].[MAJORS] ([MajorID], [MajorName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[MAJORS] ([MajorID], [MajorName]) VALUES (2, N'Artificial Intelligence')
INSERT [dbo].[MAJORS] ([MajorID], [MajorName]) VALUES (3, N'Information Assurance')
SET IDENTITY_INSERT [dbo].[MAJORS] OFF
GO
SET IDENTITY_INSERT [dbo].[NEWS] ON 

INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (1, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (2, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (3, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (4, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (5, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (6, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (7, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (8, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (9, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (10, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (11, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (12, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (13, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (14, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (15, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (17, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (18, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (19, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (20, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (21, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (22, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (23, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (24, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (25, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (26, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (27, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (28, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (29, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (30, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (31, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (32, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (33, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (34, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (35, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (36, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (37, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (38, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (39, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (40, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (41, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (42, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (43, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (44, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (45, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (46, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (47, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (48, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (49, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (50, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (51, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (52, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (53, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (54, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (55, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (56, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (57, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (58, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (59, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (60, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (61, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (62, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (63, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (64, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (65, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (66, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (67, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (68, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (69, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (70, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
INSERT [dbo].[NEWS] ([NewsID], [UserID], [CreatedDate], [Title], [Context]) VALUES (71, 63, CAST(N'2022-07-09T22:59:01.563' AS DateTime), N'Chúc mừng sinh nhật, Kujou Sara!', N'Bạn muốn học cung thuật của tengu? Được, tôi sẽ chỉ cho bạn.
Từ lúc bắt đầu đưa cung lên, cần tập trung tinh thần, vứt bỏ mọi tạp niệm trong lòng.
Nhưng chỉ cần có một chút xao động trong tâm trí, mũi tên trên dây sẽ đi lệch khỏi hồng tâm.
Và chính khát vọng không gì lay chuyển được trong tim, đã giúp tôi luôn bắn trúng mục tiêu... nhìn kỹ nhé!
Bạn muốn xem thêm ảnh động của Kujou Sara? Vậy thì hãy mau truy cập tài khoản TikTok chính thức của Genshin Impact để cùng xem nhé!
https://www.tiktok.com/@genshinimpact_en')
SET IDENTITY_INSERT [dbo].[NEWS] OFF
GO
SET IDENTITY_INSERT [dbo].[ROLL_CALL_BOOKS] ON 

INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1, 1, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (2, 1, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (3, 1, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (4, 1, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (5, 1, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (6, 1, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (7, 1, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (8, 1, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (9, 1, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (10, 1, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (11, 1, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (12, 1, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (13, 1, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (14, 1, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (15, 1, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (16, 1, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (17, 1, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (18, 1, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (19, 1, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (20, 1, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (21, 1, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (22, 1, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (23, 1, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (24, 1, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (25, 1, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (26, 1, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (27, 1, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (28, 1, 28, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (29, 1, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (30, 1, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (31, 2, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (32, 2, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (33, 2, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (34, 2, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (35, 2, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (36, 2, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (37, 2, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (38, 2, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (39, 2, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (40, 2, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (41, 2, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (42, 2, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (43, 2, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (44, 2, 14, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (45, 2, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (46, 2, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (47, 2, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (48, 2, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (49, 2, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (50, 2, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (51, 2, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (52, 2, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (53, 2, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (54, 2, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (55, 2, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (56, 2, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (57, 2, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (58, 2, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (59, 2, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (60, 2, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (61, 3, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (62, 3, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (63, 3, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (64, 3, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (65, 3, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (66, 3, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (67, 3, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (68, 3, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (69, 3, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (70, 3, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (71, 3, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (72, 3, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (73, 3, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (74, 3, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (75, 3, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (76, 3, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (77, 3, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (78, 3, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (79, 3, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (80, 3, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (81, 3, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (82, 3, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (83, 3, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (84, 3, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (85, 3, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (86, 3, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (87, 3, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (88, 3, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (89, 3, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (90, 3, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (91, 4, 31, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (92, 4, 32, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (93, 4, 33, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (94, 4, 34, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (95, 4, 35, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (96, 4, 36, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (97, 4, 37, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (98, 4, 38, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (99, 4, 39, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (100, 4, 40, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (101, 4, 41, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (102, 4, 42, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (103, 4, 43, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (104, 4, 44, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (105, 4, 45, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (106, 4, 46, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (107, 4, 47, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (108, 4, 48, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (109, 4, 49, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (110, 4, 50, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (111, 4, 51, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (112, 4, 52, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (113, 4, 53, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (114, 4, 54, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (115, 4, 55, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (116, 4, 56, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (117, 4, 57, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (118, 4, 58, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (119, 5, 31, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (120, 5, 32, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (121, 5, 33, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (122, 5, 34, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (123, 5, 35, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (124, 5, 36, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (125, 5, 37, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (126, 5, 38, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (127, 5, 39, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (128, 5, 40, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (129, 5, 41, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (130, 5, 42, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (131, 5, 43, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (132, 5, 44, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (133, 5, 45, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (134, 5, 46, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (135, 5, 47, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (136, 5, 48, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (137, 5, 49, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (138, 5, 50, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (139, 5, 51, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (140, 5, 52, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (141, 5, 53, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (142, 5, 54, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (143, 5, 55, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (144, 5, 56, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (145, 5, 57, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (146, 5, 58, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (147, 6, 31, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (148, 6, 32, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (149, 6, 33, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (150, 6, 34, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (151, 6, 35, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (152, 6, 36, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (153, 6, 37, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (154, 6, 38, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (155, 6, 39, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (156, 6, 40, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (157, 6, 41, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (158, 6, 42, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (159, 6, 43, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (160, 6, 44, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (161, 6, 45, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (162, 6, 46, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (163, 6, 47, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (164, 6, 48, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (165, 6, 49, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (166, 6, 50, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (167, 6, 51, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (168, 6, 52, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (169, 6, 53, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (170, 6, 54, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (171, 6, 55, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (172, 6, 56, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (173, 6, 57, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (174, 6, 58, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (175, 7, 59, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (176, 7, 60, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (177, 7, 61, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (178, 7, 62, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (179, 7, 63, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (180, 7, 64, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (181, 7, 65, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (182, 7, 66, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (183, 7, 67, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (184, 7, 68, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (185, 7, 69, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (186, 7, 70, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (187, 7, 71, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (188, 7, 72, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (189, 7, 73, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (190, 7, 74, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (191, 7, 75, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (192, 7, 76, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (193, 7, 77, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (194, 7, 78, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (195, 7, 79, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (196, 7, 80, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (197, 7, 81, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (198, 7, 82, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (199, 7, 83, 1, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (200, 7, 84, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (201, 7, 85, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (202, 7, 86, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (203, 7, 87, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (204, 8, 59, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (205, 8, 60, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (206, 8, 61, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (207, 8, 62, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (208, 8, 63, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (209, 8, 64, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (210, 8, 65, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (211, 8, 66, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (212, 8, 67, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (213, 8, 68, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (214, 8, 69, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (215, 8, 70, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (216, 8, 71, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (217, 8, 72, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (218, 8, 73, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (219, 8, 74, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (220, 8, 75, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (221, 8, 76, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (222, 8, 77, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (223, 8, 78, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (224, 8, 79, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (225, 8, 80, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (226, 8, 81, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (227, 8, 82, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (228, 8, 83, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (229, 8, 84, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (230, 8, 85, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (231, 8, 86, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (232, 8, 87, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (233, 9, 59, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (234, 9, 60, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (235, 9, 61, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (236, 9, 62, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (237, 9, 63, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (238, 9, 64, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (239, 9, 65, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (240, 9, 66, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (241, 9, 67, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (242, 9, 68, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (243, 9, 69, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (244, 9, 70, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (245, 9, 71, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (246, 9, 72, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (247, 9, 73, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (248, 9, 74, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (249, 9, 75, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (250, 9, 76, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (251, 9, 77, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (252, 9, 78, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (253, 9, 79, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (254, 9, 80, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (255, 9, 81, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (256, 9, 82, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (257, 9, 83, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (258, 9, 84, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (259, 9, 85, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (260, 9, 86, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (261, 9, 87, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (262, 10, 147, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (263, 10, 148, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (264, 10, 149, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (265, 10, 150, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (266, 10, 151, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (267, 10, 152, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (268, 10, 153, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (269, 10, 154, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (270, 10, 155, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (271, 10, 156, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (272, 10, 157, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (273, 10, 158, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (274, 10, 159, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (275, 10, 160, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (276, 10, 161, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (277, 10, 162, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (278, 10, 163, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (279, 10, 164, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (280, 10, 165, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (281, 10, 166, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (282, 10, 167, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (283, 10, 168, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (284, 10, 169, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (285, 10, 170, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (286, 10, 171, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (287, 10, 172, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (288, 10, 173, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (289, 10, 174, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (290, 10, 175, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (291, 10, 176, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (292, 11, 147, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (293, 11, 148, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (294, 11, 149, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (295, 11, 150, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (296, 11, 151, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (297, 11, 152, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (298, 11, 153, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (299, 11, 154, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (300, 11, 155, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (301, 11, 156, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (302, 11, 157, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (303, 11, 158, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (304, 11, 159, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (305, 11, 160, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (306, 11, 161, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (307, 11, 162, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (308, 11, 163, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (309, 11, 164, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (310, 11, 165, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (311, 11, 166, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (312, 11, 167, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (313, 11, 168, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (314, 11, 169, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (315, 11, 170, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (316, 11, 171, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (317, 11, 172, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (318, 11, 173, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (319, 11, 174, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (320, 11, 175, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (321, 11, 176, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (322, 12, 147, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (323, 12, 148, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (324, 12, 149, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (325, 12, 150, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (326, 12, 151, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (327, 12, 152, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (328, 12, 153, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (329, 12, 154, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (330, 12, 155, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (331, 12, 156, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (332, 12, 157, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (333, 12, 158, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (334, 12, 159, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (335, 12, 160, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (336, 12, 161, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (337, 12, 162, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (338, 12, 163, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (339, 12, 164, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (340, 12, 165, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (341, 12, 166, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (342, 12, 167, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (343, 12, 168, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (344, 12, 169, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (345, 12, 170, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (346, 12, 171, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (347, 12, 172, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (348, 12, 173, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (349, 12, 174, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (350, 12, 175, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (351, 12, 176, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (352, 13, 88, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (353, 13, 89, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (354, 13, 90, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (355, 13, 91, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (356, 13, 92, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (357, 13, 93, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (358, 13, 94, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (359, 13, 95, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (360, 13, 96, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (361, 13, 97, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (362, 13, 98, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (363, 13, 99, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (364, 13, 100, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (365, 13, 101, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (366, 13, 102, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (367, 13, 103, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (368, 13, 104, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (369, 13, 105, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (370, 13, 106, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (371, 13, 107, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (372, 13, 108, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (373, 13, 109, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (374, 13, 110, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (375, 13, 111, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (376, 13, 112, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (377, 13, 113, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (378, 13, 114, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (379, 13, 115, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (380, 13, 116, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (381, 13, 117, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (382, 14, 118, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (383, 14, 119, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (384, 14, 120, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (385, 14, 121, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (386, 14, 122, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (387, 14, 123, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (388, 14, 124, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (389, 14, 125, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (390, 14, 126, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (391, 14, 127, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (392, 14, 128, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (393, 14, 129, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (394, 14, 130, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (395, 14, 131, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (396, 14, 132, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (397, 14, 133, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (398, 14, 134, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (399, 14, 135, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (400, 14, 136, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (401, 14, 137, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (402, 14, 138, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (403, 14, 139, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (404, 14, 140, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (405, 14, 141, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (406, 14, 142, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (407, 14, 143, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (408, 14, 144, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (409, 14, 145, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (410, 14, 146, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (411, 15, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (412, 15, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (413, 15, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (414, 15, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (415, 15, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (416, 15, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (417, 15, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (418, 15, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (419, 15, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (420, 15, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (421, 15, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (422, 15, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (423, 15, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (424, 15, 14, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (425, 15, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (426, 15, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (427, 15, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (428, 15, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (429, 15, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (430, 15, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (431, 15, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (432, 15, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (433, 15, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (434, 15, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (435, 15, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (436, 15, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (437, 15, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (438, 15, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (439, 15, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (440, 15, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (441, 16, 31, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (442, 16, 32, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (443, 16, 33, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (444, 16, 34, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (445, 16, 35, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (446, 16, 36, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (447, 16, 37, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (448, 16, 38, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (449, 16, 39, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (450, 16, 40, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (451, 16, 41, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (452, 16, 42, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (453, 16, 43, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (454, 16, 44, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (455, 16, 45, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (456, 16, 46, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (457, 16, 47, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (458, 16, 48, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (459, 16, 49, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (460, 16, 50, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (461, 16, 51, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (462, 16, 52, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (463, 16, 53, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (464, 16, 54, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (465, 16, 55, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (466, 16, 56, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (467, 16, 57, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (468, 16, 58, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (469, 17, 59, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (470, 17, 60, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (471, 17, 61, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (472, 17, 62, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (473, 17, 63, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (474, 17, 64, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (475, 17, 65, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (476, 17, 66, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (477, 17, 67, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (478, 17, 68, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (479, 17, 69, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (480, 17, 70, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (481, 17, 71, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (482, 17, 72, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (483, 17, 73, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (484, 17, 74, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (485, 17, 75, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (486, 17, 76, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (487, 17, 77, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (488, 17, 78, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (489, 17, 79, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (490, 17, 80, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (491, 17, 81, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (492, 17, 82, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (493, 17, 83, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (494, 17, 84, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (495, 17, 85, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (496, 17, 86, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (497, 17, 87, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (498, 18, 147, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (499, 18, 148, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (500, 18, 149, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (501, 18, 150, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (502, 18, 151, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (503, 18, 152, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (504, 18, 153, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (505, 18, 154, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (506, 18, 155, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (507, 18, 156, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (508, 18, 157, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (509, 18, 158, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (510, 18, 159, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (511, 18, 160, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (512, 18, 161, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (513, 18, 162, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (514, 18, 163, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (515, 18, 164, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (516, 18, 165, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (517, 18, 166, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (518, 18, 167, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (519, 18, 168, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (520, 18, 169, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (521, 18, 170, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (522, 18, 171, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (523, 18, 172, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (524, 18, 173, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (525, 18, 174, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (526, 18, 175, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (527, 18, 176, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (528, 19, 88, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (529, 19, 89, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (530, 19, 90, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (531, 19, 91, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (532, 19, 92, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (533, 19, 93, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (534, 19, 94, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (535, 19, 95, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (536, 19, 96, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (537, 19, 97, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (538, 19, 98, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (539, 19, 99, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (540, 19, 100, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (541, 19, 101, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (542, 19, 102, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (543, 19, 103, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (544, 19, 104, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (545, 19, 105, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (546, 19, 106, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (547, 19, 107, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (548, 19, 108, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (549, 19, 109, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (550, 19, 110, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (551, 19, 111, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (552, 19, 112, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (553, 19, 113, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (554, 19, 114, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (555, 19, 115, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (556, 19, 116, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (557, 19, 117, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (558, 20, 118, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (559, 20, 119, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (560, 20, 120, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (561, 20, 121, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (562, 20, 122, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (563, 20, 123, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (564, 20, 124, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (565, 20, 125, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (566, 20, 126, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (567, 20, 127, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (568, 20, 128, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (569, 20, 129, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (570, 20, 130, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (571, 20, 131, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (572, 20, 132, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (573, 20, 133, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (574, 20, 134, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (575, 20, 135, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (576, 20, 136, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (577, 20, 137, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (578, 20, 138, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (579, 20, 139, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (580, 20, 140, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (581, 20, 141, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (582, 20, 142, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (583, 20, 143, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (584, 20, 144, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (585, 20, 145, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (586, 20, 146, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (587, 21, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (588, 21, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (589, 21, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (590, 21, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (591, 21, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (592, 21, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (593, 21, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (594, 21, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (595, 21, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (596, 21, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (597, 21, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (598, 21, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (599, 21, 13, 1, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (600, 21, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (601, 21, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (602, 21, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (603, 21, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (604, 21, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (605, 21, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (606, 21, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (607, 21, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (608, 21, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (609, 21, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (610, 21, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (611, 21, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (612, 21, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (613, 21, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (614, 21, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (615, 21, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (616, 21, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (617, 22, 31, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (618, 22, 32, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (619, 22, 33, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (620, 22, 34, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (621, 22, 35, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (622, 22, 36, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (623, 22, 37, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (624, 22, 38, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (625, 22, 39, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (626, 22, 40, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (627, 22, 41, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (628, 22, 42, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (629, 22, 43, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (630, 22, 44, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (631, 22, 45, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (632, 22, 46, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (633, 22, 47, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (634, 22, 48, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (635, 22, 49, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (636, 22, 50, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (637, 22, 51, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (638, 22, 52, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (639, 22, 53, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (640, 22, 54, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (641, 22, 55, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (642, 22, 56, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (643, 22, 57, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (644, 22, 58, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (645, 23, 59, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (646, 23, 60, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (647, 23, 61, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (648, 23, 62, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (649, 23, 63, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (650, 23, 64, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (651, 23, 65, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (652, 23, 66, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (653, 23, 67, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (654, 23, 68, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (655, 23, 69, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (656, 23, 70, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (657, 23, 71, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (658, 23, 72, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (659, 23, 73, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (660, 23, 74, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (661, 23, 75, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (662, 23, 76, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (663, 23, 77, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (664, 23, 78, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (665, 23, 79, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (666, 23, 80, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (667, 23, 81, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (668, 23, 82, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (669, 23, 83, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (670, 23, 84, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (671, 23, 85, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (672, 23, 86, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (673, 23, 87, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (674, 24, 147, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (675, 24, 148, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (676, 24, 149, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (677, 24, 150, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (678, 24, 151, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (679, 24, 152, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (680, 24, 153, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (681, 24, 154, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (682, 24, 155, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (683, 24, 156, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (684, 24, 157, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (685, 24, 158, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (686, 24, 159, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (687, 24, 160, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (688, 24, 161, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (689, 24, 162, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (690, 24, 163, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (691, 24, 164, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (692, 24, 165, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (693, 24, 166, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (694, 24, 167, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (695, 24, 168, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (696, 24, 169, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (697, 24, 170, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (698, 24, 171, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (699, 24, 172, 1, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (700, 24, 173, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (701, 24, 174, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (702, 24, 175, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (703, 24, 176, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (704, 25, 88, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (705, 25, 89, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (706, 25, 90, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (707, 25, 91, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (708, 25, 92, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (709, 25, 93, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (710, 25, 94, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (711, 25, 95, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (712, 25, 96, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (713, 25, 97, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (714, 25, 98, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (715, 25, 99, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (716, 25, 100, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (717, 25, 101, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (718, 25, 102, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (719, 25, 103, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (720, 25, 104, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (721, 25, 105, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (722, 25, 106, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (723, 25, 107, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (724, 25, 108, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (725, 25, 109, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (726, 25, 110, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (727, 25, 111, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (728, 25, 112, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (729, 25, 113, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (730, 25, 114, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (731, 25, 115, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (732, 25, 116, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (733, 25, 117, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (734, 26, 118, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (735, 26, 119, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (736, 26, 120, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (737, 26, 121, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (738, 26, 122, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (739, 26, 123, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (740, 26, 124, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (741, 26, 125, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (742, 26, 126, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (743, 26, 127, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (744, 26, 128, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (745, 26, 129, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (746, 26, 130, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (747, 26, 131, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (748, 26, 132, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (749, 26, 133, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (750, 26, 134, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (751, 26, 135, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (752, 26, 136, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (753, 26, 137, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (754, 26, 138, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (755, 26, 139, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (756, 26, 140, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (757, 26, 141, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (758, 26, 142, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (759, 26, 143, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (760, 26, 144, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (761, 26, 145, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (762, 26, 146, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (763, 27, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (764, 27, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (765, 27, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (766, 27, 4, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (767, 27, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (768, 27, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (769, 27, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (770, 27, 8, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (771, 27, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (772, 27, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (773, 27, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (774, 27, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (775, 27, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (776, 27, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (777, 27, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (778, 27, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (779, 27, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (780, 27, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (781, 27, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (782, 27, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (783, 27, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (784, 27, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (785, 27, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (786, 27, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (787, 27, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (788, 27, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (789, 27, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (790, 27, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (791, 27, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (792, 27, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (793, 28, 31, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (794, 28, 32, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (795, 28, 33, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (796, 28, 34, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (797, 28, 35, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (798, 28, 36, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (799, 28, 37, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (800, 28, 38, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (801, 28, 39, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (802, 28, 40, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (803, 28, 41, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (804, 28, 42, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (805, 28, 43, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (806, 28, 44, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (807, 28, 45, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (808, 28, 46, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (809, 28, 47, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (810, 28, 48, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (811, 28, 49, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (812, 28, 50, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (813, 28, 51, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (814, 28, 52, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (815, 28, 53, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (816, 28, 54, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (817, 28, 55, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (818, 28, 56, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (819, 28, 57, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (820, 28, 58, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (821, 29, 59, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (822, 29, 60, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (823, 29, 61, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (824, 29, 62, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (825, 29, 63, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (826, 29, 64, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (827, 29, 65, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (828, 29, 66, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (829, 29, 67, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (830, 29, 68, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (831, 29, 69, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (832, 29, 70, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (833, 29, 71, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (834, 29, 72, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (835, 29, 73, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (836, 29, 74, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (837, 29, 75, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (838, 29, 76, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (839, 29, 77, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (840, 29, 78, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (841, 29, 79, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (842, 29, 80, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (843, 29, 81, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (844, 29, 82, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (845, 29, 83, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (846, 29, 84, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (847, 29, 85, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (848, 29, 86, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (849, 29, 87, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (850, 30, 147, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (851, 30, 148, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (852, 30, 149, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (853, 30, 150, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (854, 30, 151, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (855, 30, 152, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (856, 30, 153, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (857, 30, 154, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (858, 30, 155, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (859, 30, 156, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (860, 30, 157, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (861, 30, 158, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (862, 30, 159, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (863, 30, 160, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (864, 30, 161, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (865, 30, 162, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (866, 30, 163, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (867, 30, 164, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (868, 30, 165, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (869, 30, 166, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (870, 30, 167, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (871, 30, 168, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (872, 30, 169, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (873, 30, 170, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (874, 30, 171, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (875, 30, 172, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (876, 30, 173, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (877, 30, 174, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (878, 30, 175, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (879, 30, 176, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (880, 31, 88, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (881, 31, 89, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (882, 31, 90, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (883, 31, 91, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (884, 31, 92, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (885, 31, 93, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (886, 31, 94, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (887, 31, 95, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (888, 31, 96, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (889, 31, 97, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (890, 31, 98, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (891, 31, 99, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (892, 31, 100, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (893, 31, 101, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (894, 31, 102, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (895, 31, 103, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (896, 31, 104, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (897, 31, 105, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (898, 31, 106, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (899, 31, 107, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (900, 31, 108, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (901, 31, 109, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (902, 31, 110, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (903, 31, 111, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (904, 31, 112, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (905, 31, 113, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (906, 31, 114, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (907, 31, 115, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (908, 31, 116, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (909, 31, 117, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (910, 32, 118, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (911, 32, 119, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (912, 32, 120, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (913, 32, 121, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (914, 32, 122, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (915, 32, 123, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (916, 32, 124, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (917, 32, 125, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (918, 32, 126, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (919, 32, 127, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (920, 32, 128, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (921, 32, 129, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (922, 32, 130, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (923, 32, 131, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (924, 32, 132, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (925, 32, 133, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (926, 32, 134, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (927, 32, 135, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (928, 32, 136, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (929, 32, 137, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (930, 32, 138, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (931, 32, 139, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (932, 32, 140, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (933, 32, 141, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (934, 32, 142, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (935, 32, 143, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (936, 32, 144, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (937, 32, 145, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (938, 32, 146, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (939, 33, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (940, 33, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (941, 33, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (942, 33, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (943, 33, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (944, 33, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (945, 33, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (946, 33, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (947, 33, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (948, 33, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (949, 33, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (950, 33, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (951, 33, 13, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (952, 33, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (953, 33, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (954, 33, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (955, 33, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (956, 33, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (957, 33, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (958, 33, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (959, 33, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (960, 33, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (961, 33, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (962, 33, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (963, 33, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (964, 33, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (965, 33, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (966, 33, 28, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (967, 33, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (968, 33, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (969, 34, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (970, 34, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (971, 34, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (972, 34, 4, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (973, 34, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (974, 34, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (975, 34, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (976, 34, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (977, 34, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (978, 34, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (979, 34, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (980, 34, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (981, 34, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (982, 34, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (983, 34, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (984, 34, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (985, 34, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (986, 34, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (987, 34, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (988, 34, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (989, 34, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (990, 34, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (991, 34, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (992, 34, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (993, 34, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (994, 34, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (995, 34, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (996, 34, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (997, 34, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (998, 34, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (999, 35, 1, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1000, 35, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1001, 35, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1002, 35, 4, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1003, 35, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1004, 35, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1005, 35, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1006, 35, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1007, 35, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1008, 35, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1009, 35, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1010, 35, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1011, 35, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1012, 35, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1013, 35, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1014, 35, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1015, 35, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1016, 35, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1017, 35, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1018, 35, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1019, 35, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1020, 35, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1021, 35, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1022, 35, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1023, 35, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1024, 35, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1025, 35, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1026, 35, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1027, 35, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1028, 35, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1029, 36, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1030, 36, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1031, 36, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1032, 36, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1033, 36, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1034, 36, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1035, 36, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1036, 36, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1037, 36, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1038, 36, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1039, 36, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1040, 36, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1041, 36, 13, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1042, 36, 14, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1043, 36, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1044, 36, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1045, 36, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1046, 36, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1047, 36, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1048, 36, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1049, 36, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1050, 36, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1051, 36, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1052, 36, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1053, 36, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1054, 36, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1055, 36, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1056, 36, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1057, 36, 29, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1058, 36, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1059, 37, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1060, 37, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1061, 37, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1062, 37, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1063, 37, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1064, 37, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1065, 37, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1066, 37, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1067, 37, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1068, 37, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1069, 37, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1070, 37, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1071, 37, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1072, 37, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1073, 37, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1074, 37, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1075, 37, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1076, 37, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1077, 37, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1078, 37, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1079, 37, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1080, 37, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1081, 37, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1082, 37, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1083, 37, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1084, 37, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1085, 37, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1086, 37, 28, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1087, 37, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1088, 37, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1089, 38, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1090, 38, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1091, 38, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1092, 38, 4, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1093, 38, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1094, 38, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1095, 38, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1096, 38, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1097, 38, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1098, 38, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1099, 38, 11, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1100, 38, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1101, 38, 13, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1102, 38, 14, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1103, 38, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1104, 38, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1105, 38, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1106, 38, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1107, 38, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1108, 38, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1109, 38, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1110, 38, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1111, 38, 23, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1112, 38, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1113, 38, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1114, 38, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1115, 38, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1116, 38, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1117, 38, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1118, 38, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1119, 39, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1120, 39, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1121, 39, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1122, 39, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1123, 39, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1124, 39, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1125, 39, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1126, 39, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1127, 39, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1128, 39, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1129, 39, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1130, 39, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1131, 39, 13, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1132, 39, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1133, 39, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1134, 39, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1135, 39, 17, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1136, 39, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1137, 39, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1138, 39, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1139, 39, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1140, 39, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1141, 39, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1142, 39, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1143, 39, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1144, 39, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1145, 39, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1146, 39, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1147, 39, 29, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1148, 39, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1149, 40, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1150, 40, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1151, 40, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1152, 40, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1153, 40, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1154, 40, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1155, 40, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1156, 40, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1157, 40, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1158, 40, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1159, 40, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1160, 40, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1161, 40, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1162, 40, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1163, 40, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1164, 40, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1165, 40, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1166, 40, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1167, 40, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1168, 40, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1169, 40, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1170, 40, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1171, 40, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1172, 40, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1173, 40, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1174, 40, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1175, 40, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1176, 40, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1177, 40, 29, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1178, 40, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1179, 41, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1180, 41, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1181, 41, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1182, 41, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1183, 41, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1184, 41, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1185, 41, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1186, 41, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1187, 41, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1188, 41, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1189, 41, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1190, 41, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1191, 41, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1192, 41, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1193, 41, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1194, 41, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1195, 41, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1196, 41, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1197, 41, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1198, 41, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1199, 41, 21, 1, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1200, 41, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1201, 41, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1202, 41, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1203, 41, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1204, 41, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1205, 41, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1206, 41, 28, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1207, 41, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1208, 41, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1209, 42, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1210, 42, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1211, 42, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1212, 42, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1213, 42, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1214, 42, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1215, 42, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1216, 42, 8, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1217, 42, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1218, 42, 10, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1219, 42, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1220, 42, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1221, 42, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1222, 42, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1223, 42, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1224, 42, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1225, 42, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1226, 42, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1227, 42, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1228, 42, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1229, 42, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1230, 42, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1231, 42, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1232, 42, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1233, 42, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1234, 42, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1235, 42, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1236, 42, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1237, 42, 29, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1238, 42, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1239, 43, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1240, 43, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1241, 43, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1242, 43, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1243, 43, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1244, 43, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1245, 43, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1246, 43, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1247, 43, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1248, 43, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1249, 43, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1250, 43, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1251, 43, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1252, 43, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1253, 43, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1254, 43, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1255, 43, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1256, 43, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1257, 43, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1258, 43, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1259, 43, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1260, 43, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1261, 43, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1262, 43, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1263, 43, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1264, 43, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1265, 43, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1266, 43, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1267, 43, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1268, 43, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1269, 44, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1270, 44, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1271, 44, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1272, 44, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1273, 44, 5, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1274, 44, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1275, 44, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1276, 44, 8, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1277, 44, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1278, 44, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1279, 44, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1280, 44, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1281, 44, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1282, 44, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1283, 44, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1284, 44, 16, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1285, 44, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1286, 44, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1287, 44, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1288, 44, 20, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1289, 44, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1290, 44, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1291, 44, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1292, 44, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1293, 44, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1294, 44, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1295, 44, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1296, 44, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1297, 44, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1298, 44, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1299, 45, 1, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1300, 45, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1301, 45, 3, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1302, 45, 4, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1303, 45, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1304, 45, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1305, 45, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1306, 45, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1307, 45, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1308, 45, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1309, 45, 11, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1310, 45, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1311, 45, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1312, 45, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1313, 45, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1314, 45, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1315, 45, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1316, 45, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1317, 45, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1318, 45, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1319, 45, 21, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1320, 45, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1321, 45, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1322, 45, 24, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1323, 45, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1324, 45, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1325, 45, 27, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1326, 45, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1327, 45, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1328, 45, 30, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1329, 46, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1330, 46, 2, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1331, 46, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1332, 46, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1333, 46, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1334, 46, 6, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1335, 46, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1336, 46, 8, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1337, 46, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1338, 46, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1339, 46, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1340, 46, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1341, 46, 13, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1342, 46, 14, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1343, 46, 15, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1344, 46, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1345, 46, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1346, 46, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1347, 46, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1348, 46, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1349, 46, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1350, 46, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1351, 46, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1352, 46, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1353, 46, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1354, 46, 26, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1355, 46, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1356, 46, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1357, 46, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1358, 46, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1359, 47, 1, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1360, 47, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1361, 47, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1362, 47, 4, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1363, 47, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1364, 47, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1365, 47, 7, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1366, 47, 8, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1367, 47, 9, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1368, 47, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1369, 47, 11, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1370, 47, 12, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1371, 47, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1372, 47, 14, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1373, 47, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1374, 47, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1375, 47, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1376, 47, 18, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1377, 47, 19, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1378, 47, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1379, 47, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1380, 47, 22, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1381, 47, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1382, 47, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1383, 47, 25, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1384, 47, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1385, 47, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1386, 47, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1387, 47, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1388, 47, 30, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1389, 48, 1, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1390, 48, 2, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1391, 48, 3, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1392, 48, 4, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1393, 48, 5, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1394, 48, 6, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1395, 48, 7, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1396, 48, 8, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1397, 48, 9, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1398, 48, 10, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1399, 48, 11, 0, NULL)
GO
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1400, 48, 12, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1401, 48, 13, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1402, 48, 14, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1403, 48, 15, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1404, 48, 16, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1405, 48, 17, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1406, 48, 18, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1407, 48, 19, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1408, 48, 20, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1409, 48, 21, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1410, 48, 22, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1411, 48, 23, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1412, 48, 24, 1, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1413, 48, 25, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1414, 48, 26, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1415, 48, 27, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1416, 48, 28, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1417, 48, 29, 0, NULL)
INSERT [dbo].[ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment]) VALUES (1418, 48, 30, 0, NULL)
SET IDENTITY_INSERT [dbo].[ROLL_CALL_BOOKS] OFF
GO
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (103, N'P103', 1, 32, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (105, N'P105', 1, 32, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (107, N'P107', 1, 24, N'Meeting room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (110, N'P110', 1, 30, N'Meeting room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (113, N'P113', 1, 32, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (115, N'P115', 1, 32, N'Meeting room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (122, N'P122', 1, 20, N'Theoretical theatre', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (125, N'P125', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (127, N'P127', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (128, N'P128', 1, 70, N'Class room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (129, N'P129', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (131, N'P131', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (133, N'P133', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (135, N'P135', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (137, N'P137', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (139, N'P139', 1, 30, N'Meeting room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (202, N'P202', 1, 130, N'Class room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (203, N'P203', 1, 35, N'Theoretical theatre', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (204, N'P204', 1, 130, N'Class room', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (206, N'P206', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (208, N'P208', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (210, N'P210', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (212, N'P212', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (213, N'P213', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (214, N'P214', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (215, N'P215', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (216, N'P216', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (217, N'P217', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (218, N'P218', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (219, N'P219', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (220, N'P220', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (221, N'P221', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (223, N'P223', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (225, N'P225', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (227, N'P227', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (228, N'P228', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (229, N'P229', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (230, N'P230', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (231, N'P231', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (232, N'P232', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (233, N'P233', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (234, N'P234', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (235, N'P235', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (236, N'P236', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (237, N'P237', 1, 30, N'Computer lab', NULL)
INSERT [dbo].[ROOMS] ([RoomId], [RoomCode], [CampusId], [Capacity], [Type], [Description]) VALUES (239, N'P239', 1, 30, N'Computer lab', NULL)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (1, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (4, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (5, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 147, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 148, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 149, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 150, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 151, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 152, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 153, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 154, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 155, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 156, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 157, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 158, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 159, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 160, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 161, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 162, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 163, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 164, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 165, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 166, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 167, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 168, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 169, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 170, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 171, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 172, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 173, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 174, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 175, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (6, 176, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 91, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 92, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 93, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 94, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 95, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 96, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 97, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 98, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 99, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 100, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 101, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 102, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 103, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 104, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 105, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 106, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 107, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 108, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 109, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 110, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 111, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 112, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 113, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 114, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 115, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 116, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (7, 117, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 118, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 119, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 120, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 121, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 122, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 123, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 124, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 125, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 126, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 127, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 128, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 129, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 130, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 131, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 132, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 133, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 134, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 135, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 136, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 137, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 138, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 139, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 140, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 141, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 142, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 143, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 144, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 145, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (8, 146, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 24, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (11, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (12, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (13, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (14, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 4, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (15, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (27, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (28, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 14, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (29, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (30, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (31, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 24, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (42, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (43, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (44, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (45, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 4, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (46, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (57, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (58, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 14, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (59, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (60, 30, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 1, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 2, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 3, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 4, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 5, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 6, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 7, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 8, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 9, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 10, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 11, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 12, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 13, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 14, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 15, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 16, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 17, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 18, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 19, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 20, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 21, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 22, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 23, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 24, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 25, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 26, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 27, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 28, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 29, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (61, 30, 9)
GO
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (1, N'00257', N'Trần123', N'Văn', N'Quang', 2, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (2, N'00462', N'1', N'Giang', N'Đặng', 3, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (3, N'00466', N'Quang', N'Ngọc', N'Nguyễn', 4, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (4, N'00599', N'Dũng', N'Ngọc', N'Nguyễn', 5, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (5, N'00610', N'Vũ', N'Anh', N'Nguyễn', 6, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (6, N'00640', N'Hải', N'Phú', N'Nguyễn', 7, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (7, N'00806', N'Linh', N'Ngọc Nhật', N'Nguyễn', 8, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (8, N'00901', N'Khánh', N'Hà', N'Nguyễn', 9, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (9, N'00918', N'Thắng', N'Việt', N'Nguyễn', 10, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (10, N'00922', N'Trình', N'Đức', N'Đào', 11, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (11, N'00923', N'Hùng', N'Lâm', N'Nguyễn', 12, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (12, N'00957', N'Minh', N'Quang', N'Lê', 13, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (13, N'01069', N'Anh', N'Đức', N'Phạm', 14, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (14, N'01152', N'Toàn', N'Đức', N'Trần', 15, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (15, N'01241', N'Khánh', N'Duy', N'Nguyễn', 16, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (16, N'01349', N'Hoàng', N'Danh', N'Vũ', 17, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (17, N'01369', N'Thắng', N'Ngọc', N'Hồ', 18, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (18, N'01504', N'Dương', N'Ngọc', N'Lương', 19, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (19, N'01530', N'Sơn', N'Ngọc', N'Nguyễn', 20, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (20, N'01536', N'Hải', N'Tiến', N'Đinh', 21, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (21, N'01541', N'Phương', N'Minh', N'Khuất', 22, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (22, N'01589', N'Nam', N'Văn', N'Trương', 23, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (23, N'01619', N'Thắng', N'Quyết', N'Hoàng', 24, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (24, N'01648', N'Đức', N'Trọng', N'Trương', 25, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (25, N'01667', N'Dũng', N'Minh', N'Nguyễn', 26, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (26, N'01692', N'Nhân', N'Thị', N'Đặng', 27, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (27, N'01710', N'Thanh', N'Quang', N'Trần', 28, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (28, N'01764', N'Anh', N'Hoàng', N'Vũ', 29, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (29, N'01777', N'Hiếu', N'Trung', N'Đoàn', 30, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (30, N'01929', N'Minh', N'Đức', N'Nguyễn', 31, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (31, N'00778', N'Tuấn', N'Viết Anh', N'Lê', 32, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (32, N'01073', N'An', N'Ngọc', N'Lương', 33, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (33, N'01137', N'Linh', N'Khánh', N'Trần', 34, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (34, N'01153', N'Thành', N'Minh', N'Nguyễn', 35, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (35, N'01252', N'Thạnh', N'Xuân', N'Vũ', 36, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (36, N'01255', N'Bách', N'Tùng', N'Nguyễn', 37, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (37, N'01384', N'Huỳnh', N'Thế', N'Nguyễn', 38, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (38, N'01425', N'Thắng', N'Chiến', N'Đỗ', 39, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (39, N'01449', N'Thành', N'Thị Minh', N'Đào', 40, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (40, N'01495', N'Bình', N'Thị', N'Hoàng', 41, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (41, N'01498', N'Hưng', N'Khánh', N'Nguyễn', 42, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (42, N'01537', N'Đông', N'Danh', N'Hoàng', 43, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (43, N'01548', N'Hạnh', N'Thu', N'Nguyễn', 44, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (44, N'01551', N'Hưng', N'Bảo', N'Phạm', 45, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (45, N'01571', N'Trung', N'Việt', N'Dương', 46, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (46, N'01579', N'Linh', N'Việt', N'Nguyễn', 47, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (47, N'01581', N'Quý', N'Văn', N'Vương', 48, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (48, N'01598', N'Đức', N'Anh', N'Nguyễn', 49, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (49, N'01607', N'Mai', N'Thị Tuyết', N'Dương', 50, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (50, N'01640', N'Nghĩa', N'Trọng', N'Nguyễn', 51, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (51, N'01738', N'Tươi', NULL, N'Trần', 52, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (52, N'01751', N'Trung', NULL, N'Nguyễn', 53, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (53, N'01779', N'Trung', NULL, N'Trần', 54, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (54, N'01822', N'Trung', NULL, N'Nguyễn', 55, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (55, N'01834', N'Tùng', NULL, N'Nguyễn', 57, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (56, N'01922', N'Mai', NULL, N'Tạ', 58, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (57, N'01939', N'Thịnh', NULL, N'Vũ', 59, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (58, N'01945', N'Đức', NULL, N'Nguyễn', 60, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (59, N'00589', N'Tùng', NULL, N'Hồ', 61, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (60, N'00600', N'Đức', NULL, N'Trần', 62, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (61, N'00855', N'Lộc', NULL, N'Nguyễn', 63, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (62, N'00873', N'Trung', NULL, N'Đặng', 64, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (63, N'01180', N'Minh', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (64, N'01291', N'Dương', NULL, N'Lê', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (65, N'01312', N'Tuấn', NULL, N'Võ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (66, N'01372', N'Nam', NULL, N'Phùng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (67, N'01399', N'Hiếu', NULL, N'Chu', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (68, N'01447', N'Giang', NULL, N'Bùi', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (69, N'01499', N'Anh', NULL, N'Lưu', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (70, N'01522', N'Thu', NULL, N'Ngô', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (71, N'01529', N'Quân', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (72, N'01559', N'Đức', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (73, N'01603', N'Dung', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (74, N'01724', N'Hiếu', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (75, N'01727', N'Hải', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (76, N'01750', N'Tuấn', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (77, N'01752', N'Long', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (78, N'01762', N'Anh', NULL, N'Vũ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (79, N'01770', N'Tú', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (80, N'01780', N'Hải', NULL, N'Đặng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (81, N'01783', N'Minh', NULL, N'Trương', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (82, N'01808', N'Dương', NULL, N'Phùng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (83, N'01874', N'Cường', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (84, N'01885', N'Đức', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (85, N'01888', N'Khôi', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (86, N'01913', N'Xuân', NULL, N'Lê', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (87, N'60510', N'Huyền', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (88, N'00682', N'Vịnh', NULL, N'Vũ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (89, N'00846', N'Linh', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (90, N'00936', N'Hiệp', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (91, N'01082', N'Nam', NULL, N'Võ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (92, N'01272', N'Quân', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (93, N'01278', N'Cường', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (94, N'01475', N'Vũ', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (95, N'01480', N'Dũng', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (96, N'01488', N'Tuấn', NULL, N'Vũ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (97, N'01569', N'Chung', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (98, N'01600', N'Thế', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (99, N'01627', N'Quân', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (100, N'01631', N'Nga', NULL, N'Phùng', NULL, 1)
GO
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (101, N'01646', N'Tùng', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (102, N'01657', N'Quân', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (103, N'01686', N'Quang', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (104, N'01687', N'Nhật', NULL, N'Dương', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (105, N'01703', N'Đạt', NULL, N'Hoàng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (106, N'01708', N'Tài', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (107, N'01719', N'Minh', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (108, N'01745', N'Cường', NULL, N'Nghiêm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (109, N'01754', N'Đạo', NULL, N'Bùi', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (110, N'01786', N'Tuấn', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (111, N'01802', N'Phụng', NULL, N'Ngô', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (112, N'01823', N'Ngân', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (113, N'01858', N'Ánh', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (114, N'01880', N'Dũng', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (115, N'01899', N'Cường', NULL, N'Phan', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (116, N'01902', N'Việt', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (117, N'01930', N'Thủy', NULL, N'Dương', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (118, N'00625', N'Quân', NULL, N'Lê', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (119, N'00645', N'Trung', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (120, N'00724', N'Long', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (121, N'00833', N'Tuấn', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (122, N'00866', N'Anh', NULL, N'Hoàng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (123, N'01126', N'Hiếu', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (124, N'01164', N'Huy', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (125, N'01486', N'Trung', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (126, N'01523', N'Trung', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (127, N'01526', N'Vương', NULL, N'Kiều', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (128, N'01566', N'Doanh', NULL, N'Đinh', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (129, N'01592', N'Xuyến', NULL, N'Vũ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (130, N'01621', N'Huy', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (131, N'01622', N'Oai', NULL, N'Đặng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (132, N'01636', N'Sơn', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (133, N'01652', N'Hùng', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (134, N'01662', N'Ly', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (135, N'01675', N'Hải', NULL, N'Phan', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (136, N'01681', N'Thắng', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (137, N'01682', N'Anh', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (138, N'01735', N'Hằng', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (139, N'01785', N'Tú', NULL, N'Tô', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (140, N'01800', N'Anh', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (141, N'01807', N'Quang', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (142, N'01825', N'Hoàng', NULL, N'Lê', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (143, N'01835', N'Lợi', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (144, N'01889', N'Sơn', NULL, N'Lương', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (145, N'01906', N'Tùng', NULL, N'Trịnh', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (146, N'01907', N'Cường', NULL, N'Hoàng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (147, N'00444', N'Mạnh', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (148, N'00797', N'Anh', NULL, N'Ngô', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (149, N'00844', N'Tú', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (150, N'00939', N'Vinh', NULL, N'Tô', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (151, N'01001', N'Hiếu', NULL, N'Hoàng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (152, N'01005', N'Hoàng', NULL, N'Đào', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (153, N'01012', N'Hoàng', NULL, N'Trương', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (154, N'01142', N'Anh', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (155, N'01204', N'Hà', NULL, N'Lê', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (156, N'01250', N'Linh', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (157, N'01339', N'Nam', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (158, N'01361', N'Vũ', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (159, N'01481', N'Hải', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (160, N'01482', N'Bách', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (161, N'01487', N'Tú', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (162, N'01496', N'Quang', NULL, N'Hoàng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (163, N'01511', N'Thực', NULL, N'Đinh', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (164, N'01518', N'Vũ', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (165, N'01639', N'Lâm', NULL, N'Lưu', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (166, N'01655', N'Cường', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (167, N'01663', N'Đức', NULL, N'Chu', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (168, N'01677', N'Oanh', NULL, N'Đỗ', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (169, N'01696', N'Hoàng', NULL, N'Bùi', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (170, N'01734', N'Hưng', NULL, N'Giang', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (171, N'01827', N'Việt', NULL, N'Trần', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (172, N'01828', N'Tuấn', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (173, N'01855', N'Toán', NULL, N'Nguyễn', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (174, N'01884', N'Trọng', NULL, N'Hoàng', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (175, N'01952', N'Ngọc', NULL, N'Phạm', NULL, 1)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId]) VALUES (176, N'01955', N'Trang', NULL, N'Nguyễn', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[SUBJECTS] ON 

INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (20, N'MA101', N'Advanced Mathematics 1', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (21, N'MA102', N'Advanced Mathematics 2', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (22, N'DM101', N'Discrete Mathematics 1', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (23, N'DM102', N'Discrete Mathematics 2', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (24, N'MA201', N'Probability and Statistics', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (25, N'CF100', N'Introduction to Computing', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (26, N'CF101', N'Programming Fundamental Using C', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (27, N'CF102', N'Object Oriented Programming Using C++', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (28, N'CF103', N'Data Structures and Algorithms Using Java', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (29, N'CF104-1', N'Operating Systems', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (30, N'CF105', N'Introduction to Databases', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (31, N'CF205', N'Java Application Development', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (32, N'CF112', N'C# and .NET Technology', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (33, N'EN011', N'English 1 - Top Notch Fundamental', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (34, N'EN021', N'English 2 - Top Notch 1', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (35, N'EN031', N'English 3 - Top Notch 2', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (36, N'EN041', N'English 4 - Top Notch 3', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (37, N'EN051', N'English 5 - Summit 1', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (38, N'EB111', N'Business English 1 - Intelligent Business Elementa', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (39, N'EB121', N'Business English 2 - Intelligent Business Preinter', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (40, N'EB131', N'Business English 3 - Intelligent Business Intermed', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (41, N'JP111', N'Japanese 1 - Sơ cấp 1', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (42, N'JP112', N'Japanese 2 - Sơ cấp 2', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (43, N'JP113', N'Japanese 3 - Sơ cấp 3', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (44, N'JP114', N'Japanese 4 - Sơ cấp 4', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (45, N'EIT201', N'Ethics in Information Technology', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (46, N'SE101', N'Introduction to Software Engineering', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (47, N'SE213', N'Software Requirements', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (48, N'SE214', N'Software Quality Assurance and Testing', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (49, N'SS101', N'Business Communication', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (50, N'SS102', N'Working in Group', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (51, N'EN061', N'English 6 - Summit 2 (lite)', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (52, N'SE212', N'Human Computer Interface', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (53, N'SE211', N'Software Construction', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (54, N'BD201', N'Soccer', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (55, N'CL201', N'Badminton', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (56, N'VO101', N'Vovinam 1', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (57, N'VO102', N'Vovinam 2', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (58, N'VO103', N'Vovinam 3', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (59, N'VO104', N'Vovinam 4', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (60, N'CF104-2', N'Network', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (61, N'JP115', N'Japanese 5 - Sơ cấp 5', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (62, N'HS111', N'Maxism - Leninism 1', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (63, N'GC2-SQL SDO', N'Working with SQL Server Database Objects', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (64, N'COMP1302', N'Database Design and Implementation', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (65, N'COMP1303', N'Distributed Information Systems', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (66, N'COMP1305', N'IT Project and Quality Management', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (67, N'COMP1562', N'Operating Systems (Topup)', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (68, N'COMP1304', N'Information Systems Engineering', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (69, N'JP211', N'Japanese 6 - Trung cấp 1', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (70, N'SE216', N'IT Project Management', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (71, N'CF206', N'C# and .NET Technology OLD', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (72, N'EN062', N'English 6 - Summit 2', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (73, N'Aptech1', N'Aptech semester 1', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (74, N'NK', N'Extra curriculum activities', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (75, N'GC1-C', N'Elementary Programming with C', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (76, N'GC1-CF', N'Computer Fundamentals', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (77, N'GC1-HDJ', N'HTML, DHTML & JavaScript', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (78, N'GC1-PRJ', N'Project SEM I', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (79, N'GC1-DW', N'Dream-weaver 8.0', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (80, N'EN161', N'IELTS graduation', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (81, N'HS112', N'Maxism - Leninism 2', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (82, N'ES301', N'Digital Fundamentals', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (83, N'SE315', N'Software Architecture and Design', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (84, N'ES311', N'Embedded System Hardware', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (85, N'IS301', N'IT Application in Enterprise', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (86, N'IS311', N'Principles of Accounting and Finance', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (87, N'IS312', N'E-commerce', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (88, N'MA101-2', N'Advanced Mathematics for Business', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (89, N'CF100-2', N'Introduction to Computing for Business', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (90, N'MG101', N'Introduction to Management', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (91, N'SS102-2', N'Working in Group for Business', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (92, N'EN151', N'IELTS Foundation', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (93, N'EB112', N'Business English 1 - Market Leader Elementary', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (94, N'EN162', N'TOEIC', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (95, N'COMP1564', N'Systems Programming', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (96, N'COMP1158', N'Systems Building 2', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (97, N'COMP1303', N'Distributed Information Systems', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (98, N'AW', N'Academic Writing', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (99, N'GC1-RDBMS', N'RDBMS and Database Management', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (100, N'GC1-Java', N'Learn Java by Example', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (101, N'GC1-Project', N'Project Semester 1', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (102, N'EB141', N'Business English 4 - Intelligent Business Upper', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (103, N'CF001', N'Learning to program with Alice', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (104, N'EN001', N'Advanced English Study Skills', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (105, N'CF110', N'Core Java', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (106, N'SS201', N'Business Communication', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (107, N'OB201', N'Organizational Behavior', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (108, N'ECO201', N'Basic Micro Economics', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (109, N'ECO202', N'Basic Macro Economics', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (110, N'EB221', N'Business English 2 - Market Leader Preintermediate', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (111, N'SE300', N'SW Entrepreneurship', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (112, N'ES312', N'Embeded Software Development', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (113, N'ES313', N'Digital Signal Processing', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (114, N'JP221', N'Japanese 7 - Trung cấp 2', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (115, N'HS121', N'Ho Chi Minh Ideology', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (116, N'IS321', N'Advanced XML', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (117, N'IS322', N'Advanced Database', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (118, N'CF111', N'Advanced Java', 3)
GO
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (119, N'GC2-ADVJ', N'A Guide to Advanced Java', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (120, N'GC2-DJava', N'Distributed Computing in Java', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (121, N'GC2-SJava', N'Working with Database and Security in Java', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (122, N'GC2-XML', N'XML by Example', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (123, N'GC2-C#', N'Programming in C#', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (124, N'GC2-ADV C#', N'Advanced Programming in C#', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (125, N'GC2-ePRJ', N'eProject (Java)', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (126, N'COMP1510', N'Application Development for Mobile Devices', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (127, N'TVA1', N'Tiếng Việt trình độ A ', 13)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (128, N'SE400-IS', N'Đồ án tốt nghiệp chuyên ngành IS', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (129, N'HS131', N'Revolutionary way of Vietnam Communist Party', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (130, N'IS323', N'Data Warehousing Fundamentals', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (131, N'IS313', N'ERP Fundamentals', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (132, N'ES321', N'Smart card introduction', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (133, N'ES322', N'Công nghệ không dây và giao tiếp di động', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (134, N'EB331', N'Business English 3, MKL -Intermediate', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (135, N'CH311', N'Chinese 1', 2)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (136, N'MA301', N'Statistics and Data Processing', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (137, N'AC301', N'Accounting Principles', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (138, N'MK301', N'Marketing Principles', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (139, N'SE400-ES', N'Đồ án tốt nghiệp chuyên ngành ES', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (140, N'JMS', N'Japan Monozukuri and Software development', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (141, NULL, N'test en 5', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (142, N'Test001', N'test add subject', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (143, N'CH412', N'Chinese 2', 2)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (144, N'FN401', N'Moneytary and Global Economics', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (145, N'LW101', N'Business Law fundementals', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (146, N'FN402', N'Corporate Finance', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (147, N'SS401', N'Critical Thinking and Problem Solving', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (148, N'EB441', N'Business English MKL Upper', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (149, N'GC3-WFC#', N'Windows Forms With C#', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (150, N'GC3-ASP', N'Beginning ASP.NET', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (151, N'GC3-DHA', N'DataBase Handling in ASP.NET', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (152, N'GC3-AASP', N'Avanced Features of ASP.NET', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (153, N'GC3-PWSN', N'Programming Web Services in .NET', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (154, N'GC3-AFFS', N'Advanced Features of SQL Server 2005', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (155, N'GC1-C', N'Programming in C', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (156, N'JPS111', N'Japanese 1 - Sơ cấp 1', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (157, N'ENM301', N'Business English 3; MKL -Intermediate', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (158, N'ACC101', N'Accounting Principles', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (159, N'ACC191', N'Principles of Accounting and Finance', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (160, N'CHN111', N'Chinese 1', 2)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (161, N'CHN121', N'Chinese 2', 2)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (162, N'CSD201', N'Data Structures and Algorithms Using Java', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (163, N'CSI101', N'Introduction to Computing', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (164, N'CSI102', N'Introduction to Computing for Business', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (165, N'DBD301', N'Advanced Database', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (166, N'DBI201', N'Introduction to Databases', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (167, N'DBW301', N'Data Warehousing Fundamentals', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (168, N'DGT201', N'Digital Fundamentals', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (169, N'DGT301', N'Digital Signal Processing', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (170, N'ECO111', N'Basic Micro Economics', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (171, N'ECO121', N'Basic Macro Economics', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (172, N'ENI101', N'Business English 1 - Intelligent Business Elementa', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (173, N'ENI201', N'Business English 2 - Intelligent Business Preinter', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (174, N'ENI301', N'Business English 3 - Intelligent Business Intermed', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (175, N'ENI401', N'Business English 4 - Intelligent Business Upper', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (176, N'ENL101', N'IELTS Foundation', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (177, N'ENL201', N'Advanced Academic English', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (178, N'ENM101', N'Business English 1 - Market Leader Elementary', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (179, N'ENM201', N'Business English 2 - Market Leader Preintermediate', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (180, N'ENM411', N'Business English MKL Upper', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (181, N'ENO201', N'Advanced Practical English', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (182, N'ENT001', N'English 1 - Top Notch Fundamental', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (183, N'ENT101', N'English 2 - Top Notch 1', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (184, N'ENT201', N'English 3 - Top Notch 2', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (185, N'ENT301', N'English 4 - Top Notch 3', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (186, N'ENT401', N'English 5 - Summit 1', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (187, N'ENT501', N'English 6 - Summit 2', 5)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (188, N'ESH201', N'Embedded System Hardware', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (189, N'ESH391', N'Smart card introduction', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (190, N'ESS301', N'Embeded Software Development', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (191, N'ETR402', N'SW Entrepreneurship', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (192, N'FIN201', N'Moneytary and Global Economics', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (193, N'FIN202', N'Corporate Finance', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (194, N'HCI201', N'Human Computer Interface', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (195, N'HCM201', N'Ho Chi Minh Ideology', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (196, N'ISC301', N'E-commerce', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (197, N'ISM301', N'ERP Fundamentals', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (198, N'ITA201', N'IT Application in Enterprise', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (199, N'ITE301', N'Ethics in Information Technology', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (200, N'JPS121', N'Japanese 2', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (201, N'JPS131', N'Japanese 3', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (202, N'JPS141', N'Japanese 4', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (203, N'JPS151', N'Japanese 5', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (204, N'JPS211', N'Japanese 6', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (205, N'JPS221', N'Japanese 7', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (206, N'LAW101', N'Business Law fundementals', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (207, N'MAA101', N'Advanced Mathematics 2', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (208, N'MAC101', N'Advanced Mathematics 1', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (209, N'MAC102', N'Advanced Mathematics for Business', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (210, N'MAD111', N'Discrete Mathematics 1', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (211, N'MAD121', N'Discrete Mathematics 2', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (212, N'MAS201', N'Statistics and Data Processing', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (213, N'MAS291', N'Probability & Statistics', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (214, N'MBS391', N'Wireless and Mobile communication', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (215, N'MGT101', N'Introduction to Management', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (216, N'MKT101', N'Marketing Principles', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (217, N'MLN101', N'Maxism - Leninism', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (218, N'MLN121', N'Maxism - Leninism 2', 11)
GO
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (219, N'NWC201', N'Network', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (220, N'OBE101', N'Organizational Behavior', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (221, N'OSG201', N'Operating Systems', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (222, N'PRF191', N'Programming Fundamental Using C', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (223, N'PRJ101', N'Core Java', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (224, N'PRJ201', N'Advanced Java', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (225, N'PRN291', N'C# and .NET Technology', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (226, N'PRO001', N'Learning to program with Alice', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (227, N'PRO191', N'Object Oriented Programming Using C++', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (228, N'PRX301', N'Advanced XML', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (229, N'SWP492', N'Captone project - Embeded Software', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (230, N'SWP491', N'Captone project - Information System', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (231, N'SSC001', N'Business Communication', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (232, N'SSC101', N'Business Communication', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (233, N'SSG001', N'Working in Group', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (234, N'SSG101', N'Working in Group for Business', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (235, N'SSP291', N'Critical Thinking and Problem Solving', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (236, N'SWC201', N'Software Construction', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (237, N'SWD391', N'Software Architecture and Design', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (238, N'SWE101', N'Introduction to Software Engineering', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (239, N'SWM301', N'IT Project Management', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (240, N'SWQ391', N'Software Quality Assurance and Testing', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (241, N'SWR301', N'Software Requirements', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (242, N'VNR201', N'Revolutionary way of Vietnam Communist Party', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (243, N'VOV111', N'Vovinam 1', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (244, N'VOV121', N'Vovinam 2', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (245, N'VOV131', N'Vovinam 3', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (246, N'VOV141', N'Vovinam 4', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (247, N'SSM201', N'Management Skills', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (248, N'RLTT', N'Specific Collective Training', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (249, N'CF201', N'Object Oriented Programming Using C++', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (250, N'CF104', N'Operating Systems and Network', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (251, N'GC1-BDWS', N'Building Dynamic Website', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (252, N'GC1-DW8', N'Dreamweaver 8', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (253, N'GC1-MSSQL', N'Database Development in SQL Server', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (254, N'GC1-Project i10', N'Project Semester 1 i10', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (255, N'GC1-CF i10', N'Computer Fundamentals i10', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (256, N'GC3-ASP', N'Beginning ASP.Net', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (257, N'GC3-DHA', N'Database Handling in ASP.Net', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (258, N'GC3-AASP', N'Advanced Features of ASP.Net', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (259, N'GC3-PWSN', N'Programming Web Services in .Net', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (260, N'GC3-eProject', N'Project Semester 3', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (261, N'COV111', N'Chess 1', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (262, N'COV121', N'Chess 2', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (263, N'COV131', N'Chess 3', 10)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (264, N'GC3-AFSS', N'Advanced Features of SQL Server 2005', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (265, N'MNL101', N'Maxism - Leninism 2', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (266, N'SSN301', N'Negotiation and Conflict Solving Skills', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (267, N'ENM421', N'Upper-Intermediate 2 - Business English 2', 4)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (268, N'CHN131', N'Chinese 3', 2)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (269, N'ACC302', N'Managerial Accounting ', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (270, N'FIN302', N'Financial Statement Analysis', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (271, N'FIN303', N'Advanced corporate finance', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (272, N'MKT201', N'Consumer Behavior', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (273, N'MKT202', N'Service Marketing Management', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (274, N'MKT301', N'Marketing Research', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (275, N'GC2-XML i10', N'XML Simplified', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (276, N'GC2-JP1', N'Java Programming I', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (277, N'GC2-CC1', N'Introduction to Cloud Computing', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (278, N'GC2-JP2', N'Java Programming II', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (279, N'GC2-AJV1', N'Advanced Java Programming I', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (280, N'GC2-AJV2', N'Advanced Java Programming II', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (281, N'GC2-PCS', N'Programming in C#', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (282, N'GC2-EPJ i10', N'Eproject Semester 2 i10', 6)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (283, N'SSL101c', N'Academic Skills for University Success', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (284, N'CSI104', N'Introduction to Computer Science', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (285, N'PRF192', N'Programming Fundamentals', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (286, N'MAE101', N'Mathematics for Engineering', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (287, N'CEA201', N'Computer Organization and Architecture', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (288, N'PRO192', N'Object-Oriented Programming', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (289, N'MAD101', N'Discrete mathematics', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (290, N'OSG202', N'Operating Systems', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (291, N'SSG103', N'Communication and In-Group Working Skills', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (292, N'NWC203c', N'Computer Networking', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (293, N'JPD113', N'Elementary Japanese 1-A1.1', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (294, N'CSD201', N'Data Structures and Algorithms', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (295, N'DBI202', N'Introduction to Databases', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (296, N'LAB211', N'OOP with Java Lab', 14)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (297, N'WED201c', N'Web Design', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (298, N'MAS291', N'Statistics and Probability', 9)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (299, N'JPD123', N'Elementary Japanese 1-A1.2', 8)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (300, N'IOT102', N'Internet of Things', 7)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (301, N'PRJ301', N'Java Web Application Development', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (302, N'SWE201c', N'	Introduction to Software Engineering', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (303, N'SWP391', N'Application development project', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (304, N'ITE302c', N'Ethics in IT', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (305, N'SWR302', N'Software Requirement', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (306, N'SWT301', N'Software Testing', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (309, N'PRN211', N'PRN211', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (310, N'SYB302c', N'	Entrepreneurship', 1)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (311, N'OJT202', N'	On the job training', 15)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (312, N'ENW492c', N'Writing Research Papers', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (313, N'PRN221', N'PRN221', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (314, N'PRU211m ', N'C# Programming and Unity', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (315, N'PRM392', N'Mobile Programming', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (316, N'SWD392', N'SW Architecture and Design', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (317, N'PMG202c', N'Project management', 12)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (318, N'WDU203c', N'UI/UX Design', NULL)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (319, N'PRN231 ', N'PRN231 ', 3)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (320, N'PRU221m', N'Object-Oriented Programming for Unity Games', 3)
GO
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (321, N'MLN122', N'Political economics of Marxism – Leninism', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (322, N'MLN111', N'Philosophy of Marxism – Leninism', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (323, N'MLN131', N'Scientific socialism', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (324, N'VNR202', N'History of Việt Nam Communist Party', 11)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (325, N'SEP490', N'	SE Capstone Project', 16)
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (326, N'HCM202', N'Ho Chi Minh Ideology', 11)
SET IDENTITY_INSERT [dbo].[SUBJECTS] OFF
GO
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (1, N'Spring2017', CAST(N'2017-01-09T00:00:00.000' AS DateTime), CAST(N'2017-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (2, N'Summer2017', CAST(N'2017-05-08T00:00:00.000' AS DateTime), CAST(N'2017-09-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (3, N'Fall2017', CAST(N'2017-09-04T00:00:00.000' AS DateTime), CAST(N'2017-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (4, N'Spring2018', CAST(N'2018-01-08T00:00:00.000' AS DateTime), CAST(N'2018-05-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (5, N'Summer2018', CAST(N'2018-05-14T00:00:00.000' AS DateTime), CAST(N'2018-09-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (6, N'Fall2018', CAST(N'2018-09-10T00:00:00.000' AS DateTime), CAST(N'2018-12-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (7, N'Spring2019', CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2019-05-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (8, N'Summer2019', CAST(N'2019-05-13T00:00:00.000' AS DateTime), CAST(N'2019-09-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (9, N'Fall2019', CAST(N'2019-09-09T00:00:00.000' AS DateTime), CAST(N'2019-12-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (10, N'Spring2020', CAST(N'2020-01-06T00:00:00.000' AS DateTime), CAST(N'2020-05-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (11, N'Summer2020', CAST(N'2020-05-18T00:00:00.000' AS DateTime), CAST(N'2020-09-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (12, N'Fall2020', CAST(N'2020-09-14T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (13, N'Spring2021', CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (14, N'Summer2021', CAST(N'2021-05-10T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (15, N'Fall2021', CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-12-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (16, N'Spring2022', CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TERMS] ([TermId], [TermName], [FromDate], [ToDate], [Description]) VALUES (17, N'Summer2022', CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ACCOUNTS__536C85E4B5A8E5A6]    Script Date: 7/18/2022 2:05:49 AM ******/
ALTER TABLE [dbo].[ACCOUNTS] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COURSE_SCHEDULES]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_SCHEDULES_COURSES] FOREIGN KEY([CourseId])
REFERENCES [dbo].[COURSES] ([CourseId])
GO
ALTER TABLE [dbo].[COURSE_SCHEDULES] CHECK CONSTRAINT [FK_COURSE_SCHEDULES_COURSES]
GO
ALTER TABLE [dbo].[COURSE_SCHEDULES]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_SCHEDULES_ROOMS] FOREIGN KEY([RoomId])
REFERENCES [dbo].[ROOMS] ([RoomId])
GO
ALTER TABLE [dbo].[COURSE_SCHEDULES] CHECK CONSTRAINT [FK_COURSE_SCHEDULES_ROOMS]
GO
ALTER TABLE [dbo].[COURSES]  WITH CHECK ADD  CONSTRAINT [FK_COURSES_Campuses] FOREIGN KEY([CampusID])
REFERENCES [dbo].[CAMPUSES] ([CampusId])
GO
ALTER TABLE [dbo].[COURSES] CHECK CONSTRAINT [FK_COURSES_Campuses]
GO
ALTER TABLE [dbo].[COURSES]  WITH CHECK ADD  CONSTRAINT [FK_COURSES_INSTRUCTORS] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[INSTRUCTORS] ([InstructorId])
GO
ALTER TABLE [dbo].[COURSES] CHECK CONSTRAINT [FK_COURSES_INSTRUCTORS]
GO
ALTER TABLE [dbo].[COURSES]  WITH CHECK ADD  CONSTRAINT [FK_COURSES_SUBJECTS] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[SUBJECTS] ([SubjectId])
GO
ALTER TABLE [dbo].[COURSES] CHECK CONSTRAINT [FK_COURSES_SUBJECTS]
GO
ALTER TABLE [dbo].[COURSES]  WITH CHECK ADD  CONSTRAINT [FK_COURSES_TERMS] FOREIGN KEY([TermId])
REFERENCES [dbo].[TERMS] ([TermId])
GO
ALTER TABLE [dbo].[COURSES] CHECK CONSTRAINT [FK_COURSES_TERMS]
GO
ALTER TABLE [dbo].[CURICULUM_SUBJECT]  WITH CHECK ADD  CONSTRAINT [FK_CS_CURICULUM] FOREIGN KEY([CuriculumID])
REFERENCES [dbo].[CURICULUM] ([CuriculumID])
GO
ALTER TABLE [dbo].[CURICULUM_SUBJECT] CHECK CONSTRAINT [FK_CS_CURICULUM]
GO
ALTER TABLE [dbo].[CURICULUM_SUBJECT]  WITH CHECK ADD  CONSTRAINT [FK_CS_SUBJECT] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SUBJECTS] ([SubjectId])
GO
ALTER TABLE [dbo].[CURICULUM_SUBJECT] CHECK CONSTRAINT [FK_CS_SUBJECT]
GO
ALTER TABLE [dbo].[INSTRUCTORS]  WITH CHECK ADD  CONSTRAINT [FK_INSTRUCTORS_ACCOUNTS] FOREIGN KEY([UserID])
REFERENCES [dbo].[ACCOUNTS] ([UserID])
GO
ALTER TABLE [dbo].[INSTRUCTORS] CHECK CONSTRAINT [FK_INSTRUCTORS_ACCOUNTS]
GO
ALTER TABLE [dbo].[INSTRUCTORS]  WITH CHECK ADD  CONSTRAINT [FK_INSTRUCTORS_DEPARTMENTS] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DEPARTMENTS] ([DepartmentId])
GO
ALTER TABLE [dbo].[INSTRUCTORS] CHECK CONSTRAINT [FK_INSTRUCTORS_DEPARTMENTS]
GO
ALTER TABLE [dbo].[MAJOR_CUR]  WITH CHECK ADD  CONSTRAINT [FK_MJ_Curiculum] FOREIGN KEY([CuriculumId])
REFERENCES [dbo].[CURICULUM] ([CuriculumID])
GO
ALTER TABLE [dbo].[MAJOR_CUR] CHECK CONSTRAINT [FK_MJ_Curiculum]
GO
ALTER TABLE [dbo].[MAJOR_CUR]  WITH CHECK ADD  CONSTRAINT [FK_MJ_Major] FOREIGN KEY([MajorId])
REFERENCES [dbo].[MAJORS] ([MajorID])
GO
ALTER TABLE [dbo].[MAJOR_CUR] CHECK CONSTRAINT [FK_MJ_Major]
GO
ALTER TABLE [dbo].[NEWS]  WITH CHECK ADD  CONSTRAINT [fk_News_Accounts] FOREIGN KEY([UserID])
REFERENCES [dbo].[ACCOUNTS] ([UserID])
GO
ALTER TABLE [dbo].[NEWS] CHECK CONSTRAINT [fk_News_Accounts]
GO
ALTER TABLE [dbo].[ROLL_CALL_BOOKS]  WITH CHECK ADD  CONSTRAINT [FK_ROLL_CALL_BOOKS_COURSE_SCHEDULES] FOREIGN KEY([TeachingScheduleId])
REFERENCES [dbo].[COURSE_SCHEDULES] ([TeachingScheduleId])
GO
ALTER TABLE [dbo].[ROLL_CALL_BOOKS] CHECK CONSTRAINT [FK_ROLL_CALL_BOOKS_COURSE_SCHEDULES]
GO
ALTER TABLE [dbo].[ROLL_CALL_BOOKS]  WITH CHECK ADD  CONSTRAINT [FK_ROLL_CALL_BOOKS_STUDENTS] FOREIGN KEY([StudentId])
REFERENCES [dbo].[STUDENTS] ([StudentId])
GO
ALTER TABLE [dbo].[ROLL_CALL_BOOKS] CHECK CONSTRAINT [FK_ROLL_CALL_BOOKS_STUDENTS]
GO
ALTER TABLE [dbo].[ROOMS]  WITH CHECK ADD  CONSTRAINT [FK_ROOMS_Campuses] FOREIGN KEY([CampusId])
REFERENCES [dbo].[CAMPUSES] ([CampusId])
GO
ALTER TABLE [dbo].[ROOMS] CHECK CONSTRAINT [FK_ROOMS_Campuses]
GO
ALTER TABLE [dbo].[STUDENT_COURSE]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_COURSE_COURSES] FOREIGN KEY([CourseId])
REFERENCES [dbo].[COURSES] ([CourseId])
GO
ALTER TABLE [dbo].[STUDENT_COURSE] CHECK CONSTRAINT [FK_STUDENT_COURSE_COURSES]
GO
ALTER TABLE [dbo].[STUDENT_COURSE]  WITH CHECK ADD  CONSTRAINT [FK_STUDENT_COURSE_STUDENTS] FOREIGN KEY([StudentId])
REFERENCES [dbo].[STUDENTS] ([StudentId])
GO
ALTER TABLE [dbo].[STUDENT_COURSE] CHECK CONSTRAINT [FK_STUDENT_COURSE_STUDENTS]
GO
ALTER TABLE [dbo].[STUDENTS]  WITH CHECK ADD  CONSTRAINT [FK_Student_MC] FOREIGN KEY([MajorCurId])
REFERENCES [dbo].[MAJOR_CUR] ([Id])
GO
ALTER TABLE [dbo].[STUDENTS] CHECK CONSTRAINT [FK_Student_MC]
GO
ALTER TABLE [dbo].[STUDENTS]  WITH CHECK ADD  CONSTRAINT [FK_STUDENTS_ACCOUNTS] FOREIGN KEY([UserID])
REFERENCES [dbo].[ACCOUNTS] ([UserID])
GO
ALTER TABLE [dbo].[STUDENTS] CHECK CONSTRAINT [FK_STUDENTS_ACCOUNTS]
GO
ALTER TABLE [dbo].[SUBJECTS]  WITH CHECK ADD  CONSTRAINT [FK_SUBJECTS_DEPARTMENTS] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DEPARTMENTS] ([DepartmentId])
GO
ALTER TABLE [dbo].[SUBJECTS] CHECK CONSTRAINT [FK_SUBJECTS_DEPARTMENTS]
GO
USE [master]
GO
ALTER DATABASE [PRNProject] SET  READ_WRITE 
GO
