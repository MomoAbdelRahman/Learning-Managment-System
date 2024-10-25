USE [master]
GO
/****** Object:  Database [LMS]    Script Date: 20-May-24 2:45:18 PM ******/
CREATE DATABASE [LMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMS] SET RECOVERY FULL 
GO
ALTER DATABASE [LMS] SET  MULTI_USER 
GO
ALTER DATABASE [LMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LMS', N'ON'
GO
ALTER DATABASE [LMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [LMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LMS]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[email] [varchar](40) NOT NULL,
	[pass] [varchar](20) NULL,
	[Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[announcements]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[announcements](
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[content] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ccode] ASC,
	[sem] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignment]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignment](
	[Aname] [varchar](40) NOT NULL,
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[due_date] [date] NULL,
	[done] [bit] NULL,
	[descript] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Aname] ASC,
	[ccode] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignment_submissions]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignment_submissions](
	[Aname] [varchar](40) NOT NULL,
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[Submission] [varchar](255) NULL,
	[StID] [int] NOT NULL,
	[grade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Aname] ASC,
	[ccode] ASC,
	[sem] ASC,
	[StID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[ccode] [varchar](7) NOT NULL,
	[semester] [varchar](11) NOT NULL,
	[inst_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ccode] ASC,
	[semester] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_data]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_data](
	[ccode] [varchar](7) NOT NULL,
	[cname] [varchar](70) NULL,
	[pre-requisites] [varchar](7) NULL,
	[credits] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ccode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[venue] [varchar](10) NULL,
	[proctor_ID] [int] NULL,
	[exan_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ccode] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam_submissions]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_submissions](
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[StID] [int] NOT NULL,
	[grade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ccode] ASC,
	[sem] ASC,
	[StID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[Iname] [varchar](40) NULL,
	[ID] [int] NOT NULL,
	[email] [varchar](40) NULL,
	[pass] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[Mname] [varchar](255) NOT NULL,
	[ccode] [varchar](7) NOT NULL,
	[link] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Mname] ASC,
	[ccode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registered]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registered](
	[StID] [int] NOT NULL,
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[feedback] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StID] ASC,
	[ccode] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[ID] [int] NOT NULL,
	[Sname] [varchar](40) NULL,
	[Major] [varchar](15) NULL,
	[batch] [int] NULL,
	[email] [varchar](40) NULL,
	[pass] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thread]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thread](
	[ccode] [varchar](7) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[question] [varchar](255) NULL,
	[posted_on] [date] NULL,
	[StID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ccode] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thread_entries]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thread_entries](
	[title] [varchar](255) NOT NULL,
	[ccode] [varchar](7) NOT NULL,
	[comment] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[title] ASC,
	[ccode] ASC,
	[comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[todo]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[todo](
	[StID] [int] NOT NULL,
	[task] [varchar](100) NOT NULL,
	[done] [bit] NULL,
	[ccode] [varchar](7) NULL,
	[sem] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[StID] ASC,
	[task] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transcript]    Script Date: 20-May-24 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transcript](
	[StID] [int] NOT NULL,
	[ccode] [varchar](7) NOT NULL,
	[sem] [varchar](11) NOT NULL,
	[grade] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[StID] ASC,
	[ccode] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[announcements]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[assignment]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD FOREIGN KEY([StID])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD FOREIGN KEY([Aname], [ccode], [sem])
REFERENCES [dbo].[assignment] ([Aname], [ccode], [sem])
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([ccode])
REFERENCES [dbo].[course_data] ([ccode])
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([inst_ID])
REFERENCES [dbo].[instructor] ([ID])
GO
ALTER TABLE [dbo].[course_data]  WITH CHECK ADD FOREIGN KEY([pre-requisites])
REFERENCES [dbo].[course_data] ([ccode])
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD FOREIGN KEY([proctor_ID])
REFERENCES [dbo].[instructor] ([ID])
GO
ALTER TABLE [dbo].[exam_submissions]  WITH CHECK ADD FOREIGN KEY([StID])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[exam_submissions]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD FOREIGN KEY([ccode])
REFERENCES [dbo].[course_data] ([ccode])
GO
ALTER TABLE [dbo].[registered]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[registered]  WITH CHECK ADD FOREIGN KEY([StID])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[thread]  WITH CHECK ADD FOREIGN KEY([ccode])
REFERENCES [dbo].[course_data] ([ccode])
GO
ALTER TABLE [dbo].[thread]  WITH CHECK ADD FOREIGN KEY([StID])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[thread_entries]  WITH CHECK ADD FOREIGN KEY([ccode], [title])
REFERENCES [dbo].[thread] ([ccode], [title])
GO
ALTER TABLE [dbo].[todo]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[todo]  WITH CHECK ADD FOREIGN KEY([StID])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[transcript]  WITH CHECK ADD FOREIGN KEY([ccode], [sem])
REFERENCES [dbo].[course] ([ccode], [semester])
GO
ALTER TABLE [dbo].[transcript]  WITH CHECK ADD FOREIGN KEY([StID])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD CHECK  (([grade]>=(0) AND [grade]<=(10)))
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD CHECK  (([StID]>=(200000000) AND [StID]<=(300000000)))
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD CHECK  (([inst_ID]>=(0) AND [inst_ID]<=(2000)))
GO
ALTER TABLE [dbo].[exam_submissions]  WITH CHECK ADD CHECK  (([grade]>=(0) AND [grade]<=(100)))
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD CHECK  (([ID]>=(0) AND [ID]<=(2000)))
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD CHECK  (([batch]>=(2000) AND [batch]<=(3000)))
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD CHECK  (([ID]>=(200000000) AND [ID]<=(300000000)))
GO
ALTER TABLE [dbo].[transcript]  WITH CHECK ADD CHECK  (([grade]>=(0) AND [grade]<=(4.00)))
GO
ALTER TABLE [dbo].[transcript]  WITH CHECK ADD CHECK  (([StID]>=(200000000) AND [StID]<=(300000000)))
GO
USE [master]
GO
ALTER DATABASE [LMS] SET  READ_WRITE 
GO
