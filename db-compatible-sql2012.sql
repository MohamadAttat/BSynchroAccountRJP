USE [master]
GO
/****** Object:  Database [BSynchroAccountRJPDB]    Script Date: 11/12/2022 3:20:05 PM ******/
CREATE DATABASE [BSynchroAccountRJPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BSynchroAccountRJPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BSynchroAccountRJPDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BSynchroAccountRJPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BSynchroAccountRJPDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BSynchroAccountRJPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET  MULTI_USER 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [BSynchroAccountRJPDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/12/2022 3:20:05 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/12/2022 3:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/12/2022 3:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 11/12/2022 3:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221112001147_Init', N'7.0.0')
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (1, 3, CAST(43.00 AS Decimal(18, 2)), CAST(N'2022-11-12T05:04:48.3341383' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (2, 3, CAST(213.00 AS Decimal(18, 2)), CAST(N'2022-11-12T05:08:09.6439622' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (3, 3, CAST(3243.00 AS Decimal(18, 2)), CAST(N'2022-11-12T05:11:27.8356652' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (4, 3, CAST(3243.00 AS Decimal(18, 2)), CAST(N'2022-11-12T05:11:51.2279021' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (5, 3, CAST(234324.00 AS Decimal(18, 2)), CAST(N'2022-11-12T05:20:21.3872440' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (6, 3, CAST(213.00 AS Decimal(18, 2)), CAST(N'2022-11-12T05:23:41.1563771' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (7, 3, CAST(33.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:03:05.7194752' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (8, 3, CAST(33.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:03:05.7194764' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (9, 3, CAST(33.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:03:38.0875801' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (10, 3, CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:03:44.0371397' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (11, 3, CAST(33.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:37:07.7864574' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (12, 3, CAST(2321.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:41:39.8999613' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (13, 3, CAST(231.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:44:18.8540429' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (14, 3, CAST(213.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:45:19.5259481' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (15, 3, CAST(213.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:45:22.4111672' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (16, 3, CAST(213.00 AS Decimal(18, 2)), CAST(N'2022-11-12T13:45:30.4187439' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (17, 3, CAST(234.00 AS Decimal(18, 2)), CAST(N'2022-11-12T15:10:22.1184264' AS DateTime2), CAST(N'2022-11-12T15:10:22.1184264' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (18, 3, CAST(1.00 AS Decimal(18, 2)), CAST(N'2022-11-12T15:14:47.2409061' AS DateTime2), CAST(N'2022-11-12T15:14:47.2409061' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (19, 3, CAST(213.00 AS Decimal(18, 2)), CAST(N'2022-11-12T15:15:21.6298136' AS DateTime2), CAST(N'2022-11-12T15:15:21.6298136' AS DateTime2))
INSERT [dbo].[Accounts] ([Id], [CustomerId], [Balance], [DateCreated], [DateUpdated]) VALUES (20, 3, CAST(231.00 AS Decimal(18, 2)), CAST(N'2022-11-12T15:15:42.4723556' AS DateTime2), CAST(N'2022-11-12T15:15:42.4723556' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Surname], [DateCreated], [DateUpdated]) VALUES (3, N'Mohamad', N'Attat', CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Surname], [DateCreated], [DateUpdated]) VALUES (4, N'Walid', N'Nassim', CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Surname], [DateCreated], [DateUpdated]) VALUES (5, N'Maha', N'Ayoub', CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Surname], [DateCreated], [DateUpdated]) VALUES (6, N'Malak', N'Daher', CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Surname], [DateCreated], [DateUpdated]) VALUES (7, N'Pierre', N'Jabbour', CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2))
INSERT [dbo].[Customers] ([Id], [Name], [Surname], [DateCreated], [DateUpdated]) VALUES (8, N'Samar', N'Azzi', CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2), CAST(N'2022-11-12T02:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (1, 1, CAST(43.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (2, 2, CAST(213.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (3, 3, CAST(3243.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (4, 4, CAST(3243.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (5, 5, CAST(234324.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (6, 6, CAST(213.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (7, 7, CAST(33.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (8, 8, CAST(33.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (9, 9, CAST(33.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (10, 11, CAST(33.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (11, 12, CAST(2321.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (12, 13, CAST(231.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (13, 14, CAST(213.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (14, 15, CAST(213.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (15, 16, CAST(213.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (16, 17, CAST(234.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (17, 18, CAST(1.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:14:47.3748123' AS DateTime2), CAST(N'2022-11-12T15:14:47.3748123' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (18, 19, CAST(213.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:21.6346091' AS DateTime2), CAST(N'2022-11-12T15:15:21.6346091' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Amount], [Type], [DateCreated], [DateUpdated]) VALUES (19, 20, CAST(231.00 AS Decimal(18, 2)), N'deposit', CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2), CAST(N'2022-11-12T15:15:42.4780559' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
/****** Object:  Index [IX_Accounts_CustomerId]    Script Date: 11/12/2022 3:20:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_CustomerId] ON [dbo].[Accounts]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_AccountId]    Script Date: 11/12/2022 3:20:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_AccountId] ON [dbo].[Transactions]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts_AccountId]
GO
USE [master]
GO
ALTER DATABASE [BSynchroAccountRJPDB] SET  READ_WRITE 
GO
