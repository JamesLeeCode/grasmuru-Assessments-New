USE [master]
GO
/****** Object:  Database [school]    Script Date: 2022/06/13 04:42:48 ******/
CREATE DATABASE [school]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'school', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\school.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'school_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\school_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [school] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [school].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [school] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [school] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [school] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [school] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [school] SET ARITHABORT OFF 
GO
ALTER DATABASE [school] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [school] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [school] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [school] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [school] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [school] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [school] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [school] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [school] SET  DISABLE_BROKER 
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [school] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [school] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [school] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [school] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [school] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [school] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [school] SET RECOVERY FULL 
GO
ALTER DATABASE [school] SET  MULTI_USER 
GO
ALTER DATABASE [school] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [school] SET DB_CHAINING OFF 
GO
ALTER DATABASE [school] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [school] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [school] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [school] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'school', N'ON'
GO
ALTER DATABASE [school] SET QUERY_STORE = OFF
GO
USE [school]
GO
/****** Object:  Table [dbo].[campus]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campus](
	[campus_id] [varchar](20) NOT NULL,
	[campus_name] [varchar](20) NOT NULL,
	[campus_admin] [varchar](12) NOT NULL,
	[campus_phone] [varchar](12) NOT NULL,
 CONSTRAINT [PK_campus] PRIMARY KEY CLUSTERED 
(
	[campus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_offered]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_offered](
	[course_name] [varchar](20) NOT NULL,
	[course_code] [int] IDENTITY(1,1) NOT NULL,
	[currently_offered] [bit] NULL,
 CONSTRAINT [PK_course_offered_1] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[module_code] [varchar](20) NOT NULL,
	[exam_hall_name] [varchar](50) NOT NULL,
	[exam_time] [timestamp] NOT NULL,
	[exam_date] [date] NOT NULL,
	[campus_id] [varchar](20) NOT NULL,
	[supervising_lecturer_id] [text] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturer_info]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturer_info](
	[id] [int] NOT NULL,
	[full_names] [nchar](30) NOT NULL,
	[course_code] [text] NOT NULL,
	[tot_number_couurce] [int] NULL,
	[on_leave] [bit] NOT NULL,
 CONSTRAINT [PK_lecturer_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modules]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modules](
	[module_name] [varchar](50) NOT NULL,
	[module_code] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_modules] PRIMARY KEY CLUSTERED 
(
	[module_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_exams]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_exams](
	[student_id] [varchar](20) NOT NULL,
	[exam_id] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_types]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_types](
	[student_type] [varchar](20) NOT NULL,
	[description] [ntext] NOT NULL,
 CONSTRAINT [PK_student_type] PRIMARY KEY CLUSTERED 
(
	[student_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_info]    Script Date: 2022/06/13 04:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_info](
	[student_name] [varchar](20) NOT NULL,
	[student_surname] [varchar](20) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[age]  AS (datepart(year,getdate())-datepart(year,[date_of_birth])),
	[student_id] [int] IDENTITY(1000,1000000) NOT NULL,
	[student_type] [varchar](20) NOT NULL,
	[course_code] [varchar](30) NOT NULL,
	[module_code] [varchar](10) NOT NULL,
 CONSTRAINT [PK_students_info] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[course_offered] ADD  CONSTRAINT [DF_course_offered_currently_offered]  DEFAULT ((1)) FOR [currently_offered]
GO
ALTER TABLE [dbo].[lecturer_info] ADD  CONSTRAINT [DF_lecturer_info_on_leave]  DEFAULT ((0)) FOR [on_leave]
GO
ALTER TABLE [dbo].[student_types]  WITH CHECK ADD  CONSTRAINT [FK_student_types_student_types] FOREIGN KEY([student_type])
REFERENCES [dbo].[student_types] ([student_type])
GO
ALTER TABLE [dbo].[student_types] CHECK CONSTRAINT [FK_student_types_student_types]
GO
ALTER TABLE [dbo].[student_types]  WITH CHECK ADD  CONSTRAINT [FK_student_types_student_types1] FOREIGN KEY([student_type])
REFERENCES [dbo].[student_types] ([student_type])
GO
ALTER TABLE [dbo].[student_types] CHECK CONSTRAINT [FK_student_types_student_types1]
GO
ALTER TABLE [dbo].[students_info]  WITH CHECK ADD  CONSTRAINT [FK_students_info_students_info1] FOREIGN KEY([student_id])
REFERENCES [dbo].[students_info] ([student_id])
GO
ALTER TABLE [dbo].[students_info] CHECK CONSTRAINT [FK_students_info_students_info1]
GO
ALTER TABLE [dbo].[students_info]  WITH CHECK ADD  CONSTRAINT [KF_student_type] FOREIGN KEY([student_type])
REFERENCES [dbo].[student_types] ([student_type])
GO
ALTER TABLE [dbo].[students_info] CHECK CONSTRAINT [KF_student_type]
GO
USE [master]
GO
ALTER DATABASE [school] SET  READ_WRITE 
GO
