USE [master]
GO
/****** Object:  Database [MVCTutorial]    Script Date: 4/10/2018 2:01:41 PM ******/
CREATE DATABASE [MVCTutorial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCTutorial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MVCTutorial.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVCTutorial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MVCTutorial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MVCTutorial] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCTutorial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCTutorial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCTutorial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCTutorial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCTutorial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCTutorial] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCTutorial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCTutorial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCTutorial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCTutorial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCTutorial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCTutorial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCTutorial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCTutorial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCTutorial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCTutorial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVCTutorial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCTutorial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCTutorial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCTutorial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCTutorial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCTutorial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVCTutorial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCTutorial] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MVCTutorial] SET  MULTI_USER 
GO
ALTER DATABASE [MVCTutorial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCTutorial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCTutorial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCTutorial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MVCTutorial] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MVCTutorial]
GO
/****** Object:  Table [dbo].[tblDepartament]    Script Date: 4/10/2018 2:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartament](
	[DepartamentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDepartament] PRIMARY KEY CLUSTERED 
(
	[DepartamentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 4/10/2018 2:01:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudent](
	[StudentId] [int] IDENTITY(101,1) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IsDelete] [bit] NULL,
	[DepartamentId] [int] NULL,
 CONSTRAINT [PK_tblStudent] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblDepartament] ON 

INSERT [dbo].[tblDepartament] ([DepartamentId], [DepartamentName]) VALUES (1, N'CSE')
INSERT [dbo].[tblDepartament] ([DepartamentId], [DepartamentName]) VALUES (2, N'EEE')
INSERT [dbo].[tblDepartament] ([DepartamentId], [DepartamentName]) VALUES (3, N'ETE')
INSERT [dbo].[tblDepartament] ([DepartamentId], [DepartamentName]) VALUES (4, N'ICT')
INSERT [dbo].[tblDepartament] ([DepartamentId], [DepartamentName]) VALUES (5, N'BBA')
SET IDENTITY_INSERT [dbo].[tblDepartament] OFF
SET IDENTITY_INSERT [dbo].[tblStudent] ON 

INSERT [dbo].[tblStudent] ([StudentId], [StudentName], [Email], [IsDelete], [DepartamentId]) VALUES (101, N'Jose', N'antunezjosemaria@hotmail.com', 0, 1)
INSERT [dbo].[tblStudent] ([StudentId], [StudentName], [Email], [IsDelete], [DepartamentId]) VALUES (102, N'Mauro', N'mauro@gmail.com', 0, 2)
INSERT [dbo].[tblStudent] ([StudentId], [StudentName], [Email], [IsDelete], [DepartamentId]) VALUES (103, N'Pablo', N'pa@gmail.com', 0, 4)
SET IDENTITY_INSERT [dbo].[tblStudent] OFF
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblDepartament] FOREIGN KEY([DepartamentId])
REFERENCES [dbo].[tblDepartament] ([DepartamentId])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblDepartament]
GO
USE [master]
GO
ALTER DATABASE [MVCTutorial] SET  READ_WRITE 
GO
