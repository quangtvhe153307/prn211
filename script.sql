USE [master]
GO
/****** Object:  Database [PRNProject]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[ACCOUNTS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[Application_Status]    Script Date: 7/20/2022 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application_Status](
	[Status] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APPLICATIONS]    Script Date: 7/20/2022 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPLICATIONS](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](125) NULL,
	[Cost] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAMPUSES]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[COURSE_SCHEDULES]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[COURSES]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[CURICULUM]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[CURICULUM_SUBJECT]    Script Date: 7/20/2022 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURICULUM_SUBJECT](
	[CuriculumID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[TermNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CuriculumID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTMENTS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[INSTRUCTORS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[MAJOR_CUR]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[MAJORS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[NEWS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[ROLL_CALL_BOOKS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[ROOMS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[Student_Application]    Script Date: 7/20/2022 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Application](
	[StudentID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[SentDate] [datetime] NULL,
	[filePath] [varchar](255) NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT_COURSE]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[STUDENTS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
	[Balanced] [money] NULL,
 CONSTRAINT [PK_STUDENTS] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBJECTS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
/****** Object:  Table [dbo].[TERMS]    Script Date: 7/20/2022 1:48:16 PM ******/
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
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (69, N'a', N'a', N'a', N'aa', 2, N'ins6')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (70, N'a', N'a', N'a', N'a', 2, N'ins7')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (71, N'a', N'a', N'a', N'a', 2, N'ins8')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (72, N'a', N'a', N'a', N'a', 2, N'ins9')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (73, N'a', N'a', N'a', N'a', 2, N'ins10')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (74, N'a', N'a', N'a', N'a', 2, N'ins11')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (75, N'a', N'a', N'a', N'a', 2, N'ins12')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (76, N'a', N'a', N'a', N'a', 2, N'ins13')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (77, N'a', N'a', N'a', N'a', 2, N'ins14')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (78, N'a', N'a', N'a', N'a', 2, N'ins15')
INSERT [dbo].[ACCOUNTS] ([UserID], [Password], [Phone], [Email], [Address], [Role], [Username]) VALUES (79, N'a', N'a', N'a', N'a', 2, N'ins16')
SET IDENTITY_INSERT [dbo].[ACCOUNTS] OFF
GO
SET IDENTITY_INSERT [dbo].[Application_Status] ON 

INSERT [dbo].[Application_Status] ([Status], [StatusName]) VALUES (1, N'Pending')
INSERT [dbo].[Application_Status] ([Status], [StatusName]) VALUES (2, N'Approved')
INSERT [dbo].[Application_Status] ([Status], [StatusName]) VALUES (3, N'Rejected')
SET IDENTITY_INSERT [dbo].[Application_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[APPLICATIONS] ON 

INSERT [dbo].[APPLICATIONS] ([ApplicationId], [ApplicationName], [Cost]) VALUES (1, N'Đơn xin phúc khảo', 50000.0000)
INSERT [dbo].[APPLICATIONS] ([ApplicationId], [ApplicationName], [Cost]) VALUES (2, N'Đơn miễn điểm danh', 100000.0000)
INSERT [dbo].[APPLICATIONS] ([ApplicationId], [ApplicationName], [Cost]) VALUES (3, N'Đơn bảo lưu', 200000.0000)
INSERT [dbo].[APPLICATIONS] ([ApplicationId], [ApplicationName], [Cost]) VALUES (4, N'Đơn đăng ký thi cải thiện', 0.0000)
SET IDENTITY_INSERT [dbo].[APPLICATIONS] OFF
GO
INSERT [dbo].[CAMPUSES] ([CampusId], [CampusCode], [CampusName], [Description]) VALUES (1, N'BSE-HN', N'BSE-HN', NULL)
GO
SET IDENTITY_INSERT [dbo].[COURSES] ON 

INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (1, N'SE0507', N'SE0507', 30, 1, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (4, N'SE0508', N'SE0508', 30, 2, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (5, N'SE0509', N'SE0509', 30, 3, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (6, N'SE0511', N'SE0511', 30, 4, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (7, N'SE0512', N'SE0512', 30, 1, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (8, N'SE0510', N'SE0510', 30, 2, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (9, N'SE0515', N'SE0515', 30, 3, 5, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (11, N'SE1611', N'SE1611', 283, 15, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (12, N'SE1611', N'SE1611', 284, 4, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (13, N'SE1611', N'SE1611', 285, 2, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (14, N'SE1611', N'SE1611', 286, 13, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (15, N'SE1611', N'SE1611', 287, 11, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (16, N'SE1612', N'SE1612', 283, 15, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (17, N'SE1612', N'SE1612', 284, 4, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (18, N'SE1612', N'SE1612', 285, 2, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (19, N'SE1612', N'SE1612', 286, 13, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (20, N'SE1612', N'SE1612', 287, 11, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (21, N'SE1613', N'SE1613', 283, 15, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (22, N'SE1613', N'SE1613', 284, 4, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (23, N'SE1613', N'SE1613', 285, 2, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (25, N'SE1613', N'SE1613', 286, 13, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (26, N'SE1613', N'SE1613', 287, 11, 13, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (27, N'SE1611', N'SE1611', 288, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (28, N'SE1611', N'SE1611', 289, 13, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (29, N'SE1611', N'SE1611', 290, 3, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (30, N'SE1611', N'SE1611', 291, 15, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (31, N'SE1611', N'SE1611', 292, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (32, N'SE1612', N'SE1612', 288, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (33, N'SE1612', N'SE1612', 289, 13, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (34, N'SE1612', N'SE1612', 290, 3, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (35, N'SE1612', N'SE1612', 291, 15, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (36, N'SE1612', N'SE1612', 292, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (37, N'SE1613', N'SE1613', 288, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (38, N'SE1613', N'SE1613', 289, 13, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (39, N'SE1613', N'SE1613', 290, 3, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (40, N'SE1613', N'SE1613', 291, 15, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (41, N'SE1613', N'SE1613', 292, 2, 14, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (42, N'SE1611', N'SE1611', 293, 12, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (43, N'SE1611', N'SE1611', 294, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (44, N'SE1611', N'SE1611', 295, 2, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (45, N'SE1611', N'SE1611', 296, 8, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (46, N'SE1611', N'SE1611', 297, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (47, N'SE1612', N'SE1612', 293, 12, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (48, N'SE1612', N'SE1612', 294, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (49, N'SE1612', N'SE1612', 295, 2, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (50, N'SE1612', N'SE1612', 296, 8, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (51, N'SE1612', N'SE1612', 297, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (52, N'SE1613', N'SE1613', 293, 12, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (53, N'SE1613', N'SE1613', 294, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (54, N'SE1613', N'SE1613', 295, 2, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (55, N'SE1613', N'SE1613', 296, 8, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (56, N'SE1613', N'SE1613', 297, 3, 15, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (57, N'SE1611', N'SE1611', 298, 13, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (58, N'SE1611', N'SE1611', 299, 12, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (59, N'SE1611', N'SE1611', 300, 11, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (60, N'SE1611', N'SE1611', 301, 2, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (61, N'SE1611', N'SE1611', 302, 10, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (62, N'SE1612', N'SE1612', 298, 13, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (63, N'SE1612', N'SE1612', 299, 12, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (64, N'SE1612', N'SE1612', 300, 11, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (65, N'SE1612', N'SE1612', 301, 2, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (66, N'SE1612', N'SE1612', 302, 10, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (67, N'SE1613', N'SE1613', 298, 13, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (68, N'SE1613', N'SE1613', 299, 12, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (69, N'SE1613', N'SE1613', 300, 11, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (70, N'SE1613', N'SE1613', 301, 2, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (71, N'SE1613', N'SE1613', 302, 10, 16, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (73, N'SE1611', N'SE1611', 303, 4, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (74, N'SE1611', N'SE1611', 304, 1, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (75, N'SE1611', N'SE1611', 305, 10, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (76, N'SE1611', N'SE1611', 306, 4, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (78, N'SE1611', N'SE1611', 309, 3, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (79, N'SE1612', N'SE1612', 303, 4, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (80, N'SE1612', N'SE1612', 304, 1, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (81, N'SE1612', N'SE1612', 305, 10, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (82, N'SE1612', N'SE1612', 306, 4, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (83, N'SE1612', N'SE1612', 309, 3, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (84, N'SE1613', N'SE1613', 303, 4, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (85, N'SE1613', N'SE1613', 304, 1, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (86, N'SE1613', N'SE1613', 305, 10, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (87, N'SE1613', N'SE1613', 306, 4, 17, 1)
INSERT [dbo].[COURSES] ([CourseId], [CourseCode], [CourseDescription], [SubjectId], [InstructorId], [TermId], [CampusID]) VALUES (88, N'SE1613', N'SE1613', 309, 3, 17, 1)
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
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (6, N'Jobina', NULL, N'Grist', 1, 69)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (7, N'Adriaens', NULL, N'De Gregoli', 2, 70)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (8, N'El', NULL, N'Woolfitt', 14, 71)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (9, N'Cleavland', NULL, N'Attenbarrow', 15, 72)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (10, N'Mic', NULL, N'Isenor', 12, 73)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (11, N'Tadd', NULL, N'Beckhurst', 7, 74)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (12, N'Lotta', NULL, N'Cudbertson', 8, 75)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (13, N'Edith', NULL, N'Marwood', 9, 76)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (14, N'Lila', NULL, N'Dorot', 13, 77)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (15, N'Dyan', NULL, N'House', 11, 78)
INSERT [dbo].[INSTRUCTORS] ([InstructorId], [InstructorFirstName], [InstructorMidName], [InstructorLastName], [DepartmentId], [UserID]) VALUES (16, N'Take', NULL, N'Son', 16, 79)
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
GO
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
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (16, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 50, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (17, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (18, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (19, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (20, 60, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (21, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (22, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (23, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 70, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (25, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (26, 90, 9)
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
GO
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
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (32, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (33, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (34, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 40, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (35, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (36, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (37, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 80, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (38, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (39, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (40, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (41, 90, 9)
GO
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
GO
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
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (47, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 50, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (48, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (49, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (50, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (51, 60, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (52, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (53, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (54, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 70, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (55, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (56, 90, 9)
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
GO
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
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (62, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (63, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (64, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 40, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (65, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 31, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 32, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 33, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 34, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 35, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 36, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 37, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 38, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 39, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 40, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 41, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 42, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 43, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 44, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 45, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 46, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 47, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 48, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 49, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 50, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 51, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 52, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 53, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 54, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 55, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 56, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 57, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 58, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 59, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (66, 60, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (67, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 80, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (68, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (69, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (70, 90, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 61, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 62, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 63, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 64, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 65, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 66, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 67, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 68, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 69, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 70, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 71, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 72, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 73, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 74, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 75, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 76, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 77, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 78, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 79, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 80, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 81, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 82, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 83, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 84, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 85, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 86, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 87, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 88, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 89, 9)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (71, 90, 9)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 1, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 2, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 3, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 4, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 5, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 6, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 7, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 8, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 9, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 10, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 11, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 12, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 13, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 14, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 15, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 16, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 17, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 18, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 19, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 20, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 21, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 22, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 23, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 24, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 25, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 26, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 27, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 28, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 29, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (73, 30, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 1, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 2, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 3, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 4, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 5, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 6, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 7, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 8, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 9, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 10, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 11, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 12, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 13, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 14, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 15, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 16, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 17, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 18, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 19, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 20, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 21, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 22, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 23, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 24, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 25, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 26, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 27, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 28, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 29, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (74, 30, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 1, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 2, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 3, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 4, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 5, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 6, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 7, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 8, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 9, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 10, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 11, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 12, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 13, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 14, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 15, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 16, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 17, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 18, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 19, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 20, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 21, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 22, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 23, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 24, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 25, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 26, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 27, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 28, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 29, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (75, 30, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 1, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 2, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 3, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 4, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 5, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 6, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 7, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 8, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 9, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 10, NULL)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 11, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 12, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 13, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 14, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 15, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 16, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 17, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 18, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 19, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 20, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 21, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 22, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 23, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 24, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 25, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 26, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 27, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 28, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 29, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (76, 30, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 1, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 2, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 3, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 4, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 5, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 6, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 7, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 8, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 9, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 10, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 11, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 12, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 13, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 14, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 15, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 16, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 17, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 18, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 19, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 20, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 21, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 22, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 23, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 24, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 25, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 26, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 27, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 28, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 29, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (78, 30, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 31, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 32, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 33, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 34, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 35, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 36, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 37, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 38, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 39, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 40, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 41, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 42, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 43, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 44, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 45, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 46, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 47, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 48, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 49, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 50, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 51, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 52, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 53, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 54, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 55, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 56, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 57, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 58, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 59, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (79, 60, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 31, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 32, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 33, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 34, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 35, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 36, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 37, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 38, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 39, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 40, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 41, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 42, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 43, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 44, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 45, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 46, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 47, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 48, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 49, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 50, NULL)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 51, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 52, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 53, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 54, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 55, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 56, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 57, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 58, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 59, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (80, 60, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 31, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 32, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 33, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 34, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 35, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 36, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 37, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 38, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 39, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 40, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 41, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 42, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 43, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 44, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 45, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 46, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 47, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 48, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 49, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 50, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 51, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 52, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 53, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 54, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 55, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 56, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 57, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 58, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 59, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (81, 60, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 31, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 32, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 33, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 34, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 35, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 36, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 37, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 38, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 39, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 40, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 41, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 42, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 43, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 44, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 45, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 46, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 47, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 48, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 49, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 50, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 51, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 52, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 53, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 54, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 55, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 56, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 57, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 58, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 59, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (82, 60, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 31, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 32, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 33, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 34, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 35, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 36, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 37, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 38, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 39, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 40, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 41, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 42, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 43, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 44, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 45, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 46, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 47, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 48, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 49, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 50, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 51, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 52, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 53, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 54, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 55, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 56, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 57, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 58, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 59, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (83, 60, NULL)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 61, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 62, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 63, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 64, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 65, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 66, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 67, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 68, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 69, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 70, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 71, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 72, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 73, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 74, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 75, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 76, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 77, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 78, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 79, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 80, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 81, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 82, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 83, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 84, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 85, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 86, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 87, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 88, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 89, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (84, 90, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 61, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 62, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 63, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 64, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 65, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 66, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 67, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 68, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 69, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 70, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 71, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 72, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 73, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 74, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 75, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 76, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 77, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 78, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 79, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 80, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 81, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 82, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 83, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 84, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 85, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 86, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 87, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 88, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 89, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (85, 90, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 61, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 62, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 63, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 64, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 65, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 66, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 67, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 68, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 69, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 70, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 71, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 72, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 73, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 74, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 75, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 76, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 77, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 78, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 79, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 80, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 81, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 82, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 83, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 84, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 85, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 86, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 87, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 88, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 89, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (86, 90, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 61, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 62, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 63, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 64, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 65, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 66, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 67, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 68, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 69, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 70, NULL)
GO
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 71, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 72, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 73, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 74, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 75, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 76, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 77, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 78, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 79, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 80, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 81, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 82, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 83, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 84, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 85, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 86, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 87, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 88, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 89, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (87, 90, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 61, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 62, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 63, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 64, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 65, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 66, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 67, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 68, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 69, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 70, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 71, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 72, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 73, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 74, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 75, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 76, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 77, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 78, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 79, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 80, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 81, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 82, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 83, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 84, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 85, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 86, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 87, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 88, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 89, NULL)
INSERT [dbo].[STUDENT_COURSE] ([CourseId], [StudentId], [Mark]) VALUES (88, 90, NULL)
GO
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (1, N'00257', N'Trần123', N'Văn', N'Quang', 2, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (2, N'00462', N'1', N'Giang', N'Đặng', 3, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (3, N'00466', N'Quang', N'Ngọc', N'Nguyễn', 4, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (4, N'00599', N'Dũng', N'Ngọc', N'Nguyễn', 5, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (5, N'00610', N'Vũ', N'Anh', N'Nguyễn', 6, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (6, N'00640', N'Hải', N'Phú', N'Nguyễn', 7, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (7, N'00806', N'Linh', N'Ngọc Nhật', N'Nguyễn', 8, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (8, N'00901', N'Khánh', N'Hà', N'Nguyễn', 9, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (9, N'00918', N'Thắng', N'Việt', N'Nguyễn', 10, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (10, N'00922', N'Trình', N'Đức', N'Đào', 11, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (11, N'00923', N'Hùng', N'Lâm', N'Nguyễn', 12, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (12, N'00957', N'Minh', N'Quang', N'Lê', 13, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (13, N'01069', N'Anh', N'Đức', N'Phạm', 14, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (14, N'01152', N'Toàn', N'Đức', N'Trần', 15, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (15, N'01241', N'Khánh', N'Duy', N'Nguyễn', 16, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (16, N'01349', N'Hoàng', N'Danh', N'Vũ', 17, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (17, N'01369', N'Thắng', N'Ngọc', N'Hồ', 18, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (18, N'01504', N'Dương', N'Ngọc', N'Lương', 19, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (19, N'01530', N'Sơn', N'Ngọc', N'Nguyễn', 20, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (20, N'01536', N'Hải', N'Tiến', N'Đinh', 21, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (21, N'01541', N'Phương', N'Minh', N'Khuất', 22, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (22, N'01589', N'Nam', N'Văn', N'Trương', 23, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (23, N'01619', N'Thắng', N'Quyết', N'Hoàng', 24, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (24, N'01648', N'Đức', N'Trọng', N'Trương', 25, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (25, N'01667', N'Dũng', N'Minh', N'Nguyễn', 26, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (26, N'01692', N'Nhân', N'Thị', N'Đặng', 27, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (27, N'01710', N'Thanh', N'Quang', N'Trần', 28, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (28, N'01764', N'Anh', N'Hoàng', N'Vũ', 29, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (29, N'01777', N'Hiếu', N'Trung', N'Đoàn', 30, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (30, N'01929', N'Minh', N'Đức', N'Nguyễn', 31, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (31, N'00778', N'Tuấn', N'Viết Anh', N'Lê', 32, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (32, N'01073', N'An', N'Ngọc', N'Lương', 33, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (33, N'01137', N'Linh', N'Khánh', N'Trần', 34, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (34, N'01153', N'Thành', N'Minh', N'Nguyễn', 35, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (35, N'01252', N'Thạnh', N'Xuân', N'Vũ', 36, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (36, N'01255', N'Bách', N'Tùng', N'Nguyễn', 37, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (37, N'01384', N'Huỳnh', N'Thế', N'Nguyễn', 38, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (38, N'01425', N'Thắng', N'Chiến', N'Đỗ', 39, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (39, N'01449', N'Thành', N'Thị Minh', N'Đào', 40, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (40, N'01495', N'Bình', N'Thị', N'Hoàng', 41, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (41, N'01498', N'Hưng', N'Khánh', N'Nguyễn', 42, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (42, N'01537', N'Đông', N'Danh', N'Hoàng', 43, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (43, N'01548', N'Hạnh', N'Thu', N'Nguyễn', 44, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (44, N'01551', N'Hưng', N'Bảo', N'Phạm', 45, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (45, N'01571', N'Trung', N'Việt', N'Dương', 46, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (46, N'01579', N'Linh', N'Việt', N'Nguyễn', 47, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (47, N'01581', N'Quý', N'Văn', N'Vương', 48, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (48, N'01598', N'Đức', N'Anh', N'Nguyễn', 49, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (49, N'01607', N'Mai', N'Thị Tuyết', N'Dương', 50, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (50, N'01640', N'Nghĩa', N'Trọng', N'Nguyễn', 51, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (51, N'01738', N'Tươi', NULL, N'Trần', 52, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (52, N'01751', N'Trung', NULL, N'Nguyễn', 53, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (53, N'01779', N'Trung', NULL, N'Trần', 54, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (54, N'01822', N'Trung', NULL, N'Nguyễn', 55, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (55, N'01834', N'Tùng', NULL, N'Nguyễn', 57, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (56, N'01922', N'Mai', NULL, N'Tạ', 58, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (57, N'01939', N'Thịnh', NULL, N'Vũ', 59, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (58, N'01945', N'Đức', NULL, N'Nguyễn', 60, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (59, N'00589', N'Tùng', NULL, N'Hồ', 61, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (60, N'00600', N'Đức', NULL, N'Trần', 62, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (61, N'00855', N'Lộc', NULL, N'Nguyễn', 63, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (62, N'00873', N'Trung', NULL, N'Đặng', 64, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (63, N'01180', N'Minh', NULL, N'Trần', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (64, N'01291', N'Dương', NULL, N'Lê', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (65, N'01312', N'Tuấn', NULL, N'Võ', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (66, N'01372', N'Nam', NULL, N'Phùng', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (67, N'01399', N'Hiếu', NULL, N'Chu', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (68, N'01447', N'Giang', NULL, N'Bùi', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (69, N'01499', N'Anh', NULL, N'Lưu', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (70, N'01522', N'Thu', NULL, N'Ngô', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (71, N'01529', N'Quân', NULL, N'Nguyễn', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (72, N'01559', N'Đức', NULL, N'Phạm', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (73, N'01603', N'Dung', NULL, N'Nguyễn', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (74, N'01724', N'Hiếu', NULL, N'Nguyễn', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (75, N'01727', N'Hải', NULL, N'Phạm', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (76, N'01750', N'Tuấn', NULL, N'Nguyễn', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (77, N'01752', N'Long', NULL, N'Trần', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (78, N'01762', N'Anh', NULL, N'Vũ', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (79, N'01770', N'Tú', NULL, N'Phạm', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (80, N'01780', N'Hải', NULL, N'Đặng', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (81, N'01783', N'Minh', NULL, N'Trương', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (82, N'01808', N'Dương', NULL, N'Phùng', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (83, N'01874', N'Cường', NULL, N'Phạm', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (84, N'01885', N'Đức', NULL, N'Nguyễn', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (85, N'01888', N'Khôi', NULL, N'Phạm', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (86, N'01913', N'Xuân', NULL, N'Lê', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (87, N'60510', N'Huyền', NULL, N'Trần', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (88, N'00682', N'Vịnh', NULL, N'Vũ', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (89, N'00846', N'Linh', NULL, N'Trần', NULL, 1, 100000.0000)
INSERT [dbo].[STUDENTS] ([StudentId], [Roll#], [FirstName], [MidName], [LastName], [UserID], [MajorCurId], [Balanced]) VALUES (90, N'00936', N'Hiệp', NULL, N'Trần', NULL, 1, 100000.0000)
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
INSERT [dbo].[SUBJECTS] ([SubjectId], [SubjectCode], [SubjectName], [DepartmentId]) VALUES (318, N'WDU203c', N'UI/UX Design', 12)
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
/****** Object:  Index [UQ__ACCOUNTS__536C85E4B5A8E5A6]    Script Date: 7/20/2022 1:48:16 PM ******/
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
ALTER TABLE [dbo].[Student_Application]  WITH CHECK ADD  CONSTRAINT [FK_SA_A] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[APPLICATIONS] ([ApplicationId])
GO
ALTER TABLE [dbo].[Student_Application] CHECK CONSTRAINT [FK_SA_A]
GO
ALTER TABLE [dbo].[Student_Application]  WITH CHECK ADD  CONSTRAINT [FK_SA_S] FOREIGN KEY([StudentID])
REFERENCES [dbo].[STUDENTS] ([StudentId])
GO
ALTER TABLE [dbo].[Student_Application] CHECK CONSTRAINT [FK_SA_S]
GO
ALTER TABLE [dbo].[Student_Application]  WITH CHECK ADD  CONSTRAINT [FK_SA_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Application_Status] ([Status])
GO
ALTER TABLE [dbo].[Student_Application] CHECK CONSTRAINT [FK_SA_Status]
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
