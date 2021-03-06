USE [master]
GO
/****** Object:  Database [SantasLittleHelper]    Script Date: 11/3/2020 3:39:30 PM ******/
CREATE DATABASE [SantasLittleHelper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SantasLittleHelper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLTESTING\MSSQL\DATA\SantasLittleHelper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SantasLittleHelper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLTESTING\MSSQL\DATA\SantasLittleHelper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SantasLittleHelper] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SantasLittleHelper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SantasLittleHelper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET ARITHABORT OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SantasLittleHelper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SantasLittleHelper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SantasLittleHelper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SantasLittleHelper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SantasLittleHelper] SET  MULTI_USER 
GO
ALTER DATABASE [SantasLittleHelper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SantasLittleHelper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SantasLittleHelper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SantasLittleHelper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SantasLittleHelper] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SantasLittleHelper', N'ON'
GO
ALTER DATABASE [SantasLittleHelper] SET QUERY_STORE = OFF
GO
USE [SantasLittleHelper]
GO
/****** Object:  Table [dbo].[decoration]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[decoration](
	[loginid] [int] NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[done] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gift]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gift](
	[loginid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[done] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[party]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[party](
	[loginid] [int] NOT NULL,
	[description] [nvarchar](200) NOT NULL,
	[done] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[people]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[people](
	[loginid] [int] NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlogin]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userlogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[decortoggle]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[decortoggle]
@description nvarchar(200)
AS


UPDATE decoration
SET done = ~done
WHERE description = @description;

GO
/****** Object:  StoredProcedure [dbo].[deleteFromDecor]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 


CREATE PROCEDURE [dbo].[deleteFromDecor]

 

@description nvarchar(200)

 

AS

 

DELETE FROM decoration WHERE description = @description;

GO
/****** Object:  StoredProcedure [dbo].[deleteFromParty]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteFromParty]

@description nvarchar(200)

AS

DELETE FROM party WHERE description = @description;
GO
/****** Object:  StoredProcedure [dbo].[giftToggle]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[giftToggle]
@description nvarchar(200)
AS


UPDATE gift
SET done = ~done
WHERE description = @description;
GO
/****** Object:  StoredProcedure [dbo].[removegift]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removegift]
@description nvarchar(200)
AS
DELETE FROM gift 
WHERE description = @description;
GO
/****** Object:  StoredProcedure [dbo].[toggle]    Script Date: 11/3/2020 3:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[toggle]
@description nvarchar(200)
AS

UPDATE party
SET done = ~done
WHERE description = @description;
GO
USE [master]
GO
ALTER DATABASE [SantasLittleHelper] SET  READ_WRITE 
GO
