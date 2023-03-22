USE [master]
GO
/****** Object:  Database [Fiotec]    Script Date: 22/03/2023 09:09:01 ******/
CREATE DATABASE [Fiotec]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fiotec', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Fiotec.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fiotec_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Fiotec_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Fiotec] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fiotec].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fiotec] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fiotec] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fiotec] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fiotec] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fiotec] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fiotec] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fiotec] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fiotec] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fiotec] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fiotec] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fiotec] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fiotec] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fiotec] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fiotec] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fiotec] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fiotec] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fiotec] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fiotec] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fiotec] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fiotec] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fiotec] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Fiotec] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fiotec] SET RECOVERY FULL 
GO
ALTER DATABASE [Fiotec] SET  MULTI_USER 
GO
ALTER DATABASE [Fiotec] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fiotec] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fiotec] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fiotec] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fiotec] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fiotec] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fiotec', N'ON'
GO
ALTER DATABASE [Fiotec] SET QUERY_STORE = ON
GO
ALTER DATABASE [Fiotec] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Fiotec]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/03/2023 09:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dados]    Script Date: 22/03/2023 09:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dados](
	[Id] [uniqueidentifier] NOT NULL,
	[NomeArquivo] [nvarchar](max) NOT NULL,
	[Remetente] [nvarchar](max) NOT NULL,
	[Destinatario] [nvarchar](max) NOT NULL,
	[DataHora] [nvarchar](max) NOT NULL,
	[Conteudo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Dados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PalavraChave]    Script Date: 22/03/2023 09:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PalavraChave](
	[Id] [uniqueidentifier] NOT NULL,
	[nome] [nvarchar](max) NOT NULL,
	[categoria] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PalavraChave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Fiotec] SET  READ_WRITE 
GO
