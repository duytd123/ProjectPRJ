USE [master]
GO
/****** Object:  Database [SmartStore]    Script Date: 3/11/2024 11:49:16 PM ******/
CREATE DATABASE [SmartStore]
use [SmartStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartStore_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SmartStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmartStore_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SmartStore.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SmartStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmartStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartStore] SET RECOVERY FULL 
GO
ALTER DATABASE [SmartStore] SET  MULTI_USER 
GO
ALTER DATABASE [SmartStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SmartStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SmartStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [SmartStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SmartStore]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/11/2024 11:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] NOT NULL,
	[date] [date] NULL,
	[userID] [int] NULL,
	[productID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/11/2024 11:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/11/2024 11:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/11/2024 11:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[Status] [varchar](10) NULL,
	[CustomerID] [int] NULL,
	[ReceiverName] [nvarchar](100) NULL,
	[ReceiverPhone] [nvarchar](20) NULL,
	[ReceiverAddress] [nvarchar](200) NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/11/2024 11:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[ImageURL] [varchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/11/2024 11:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Mobile & Tablets', N'Explore all the new products from UNPACKED, Meet our Galaxy tablets')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'TV & Computing', N'Upgrade your TV entertainment experience, Discover Galaxy laptops')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Home Appliances', N'Quality is in the details, Backed by industry-leading warranties, Innovations for better living')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'For Business', N'Discover the latest business innovations')

GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (1, 1, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (1, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (2, 3, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (2, 4, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (3, 5, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (3, 6, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (4, 7, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (4, 8, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (5, 9, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (5, 10, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (6, 11, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (6, 12, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (7, 13, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (7, 14, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (8, 15, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (8, 16, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (9, 17, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (9, 18, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (10, 19, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (10, 20, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (11, 21, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (11, 22, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (12, 23, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (12, 24, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (13, 25, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (13, 26, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (14, 27, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (14, 28, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (15, 29, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (15, 30, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (16, 31, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (16, 32, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (17, 33, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (17, 34, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (18, 35, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (18, 36, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (19, 37, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (19, 38, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (20, 39, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (20, 40, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (21, 41, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (21, 42, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (22, 43, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (22, 44, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (23, 45, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (23, 46, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (24, 47, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (24, 48, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (25, 49, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (25, 50, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (26, 51, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (26, 52, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (27, 53, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (27, 54, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (28, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (28, 2, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (29, 3, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (29, 4, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (30, 5, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (30, 6, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (31, 7, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (31, 8, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (32, 9, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (32, 10, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (33, 11, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (33, 12, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (34, 13, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (34, 14, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (35, 15, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (35, 16, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (36, 17, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (36, 18, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (37, 19, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (37, 20, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (38, 21, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (38, 22, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (39, 23, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (39, 24, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (40, 25, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (40, 26, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (41, 27, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (41, 28, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (42, 29, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (42, 30, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (43, 31, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (43, 32, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (44, 33, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (44, 34, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (45, 35, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (45, 36, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (46, 37, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (46, 38, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (47, 39, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (47, 40, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (48, 41, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (48, 42, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (49, 43, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (49, 44, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (50, 45, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (50, 46, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (51, 47, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (51, 48, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (52, 49, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (52, 50, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (53, 51, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (53, 52, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (54, 53, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (54, 54, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (55, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (56, 2, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (57, 3, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (58, 4, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (59, 5, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (60, 6, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (61, 7, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (62, 8, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (63, 9, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (64, 10, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (65, 11, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (66, 12, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (67, 13, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (68, 14, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (69, 15, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (70, 16, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (71, 17, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (72, 18, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (73, 19, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (74, 20, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (75, 21, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (76, 22, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (77, 23, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (78, 24, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (79, 25, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (80, 26, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (81, 27, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (82, 28, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (83, 29, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (84, 30, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (85, 31, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (86, 32, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (87, 33, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (88, 34, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (89, 35, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (90, 36, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (91, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (94, 3, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (95, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (95, 8, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (96, 15, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (97, 12, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (97, 8, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (99, 13, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (99, 25, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (100, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (100, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (101, 10, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (102, 7, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (103, 7, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (105, 4, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (106, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (108, 7, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (108, 32, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (93, 3, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (92, 2, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (98, 3, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (103, 10, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (107, 3, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (104, 6, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (111, 6, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (112, 5, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (112, 6, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (113, 5, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (113, 11, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (114, 3, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (114, 12, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (115, 14, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (115, 15, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (118, 2, 9)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (119, 3, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (121, 27, 10)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (110, 3, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (116, 6, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (116, 23, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (117, 7, 8)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (120, 15, 8)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (122, 27, 10)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (122, 7, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity]) VALUES (122, 13, 6)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (1, CAST(N'2022-06-01T08:30:00.000' AS DateTime), N'Done', 1, N'John Doe', N'0123456789', N'123 Main St', CAST(2199.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (2, CAST(N'2022-06-02T09:15:00.000' AS DateTime), N'Process', 2, N'Jane Smith', N'0987654321', N'456 Elm St', CAST(5999.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (3, CAST(N'2022-06-03T10:45:00.000' AS DateTime), N'Process', 3, N'David Johnson', N'0345678912', N'789 Oak St', CAST(2999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (4, CAST(N'2022-06-04T12:00:00.000' AS DateTime), N'Wait', 4, N'Sarah Williams', N'0678912345', N'567 Pine St', CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (5, CAST(N'2022-06-05T14:20:00.000' AS DateTime), N'Process', 5, N'Robert Brown', N'0234567891', N'321 Cedar St', CAST(799.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (6, CAST(N'2022-06-06T16:40:00.000' AS DateTime), N'Done', 6, N'Jennifer Davis', N'0765432189', N'987 Maple Ave', CAST(2699.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (7, CAST(N'2022-06-07T18:10:00.000' AS DateTime), N'Wait', 7, N'Michael Anderson', N'0456789123', N'654 Oak St', CAST(399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (8, CAST(N'2022-06-08T20:30:00.000' AS DateTime), N'Process', 8, N'Jessica Thompson', N'0891234567', N'246 Elm St', CAST(199.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (9, CAST(N'2022-06-09T22:45:00.000' AS DateTime), N'Done', 9, N'William Lee', N'0567891234', N'789 Pine St', CAST(1999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (10, CAST(N'2022-06-10T23:59:59.000' AS DateTime), N'Process', 11, N'Christopher Moore', N'0987654321', N'246 Cedar St', CAST(11999.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (11, CAST(N'2022-06-11T10:05:00.000' AS DateTime), N'Process', 12, N'Amanda Taylor', N'0345678912', N'567 Elm St', CAST(2399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (12, CAST(N'2022-06-12T14:30:00.000' AS DateTime), N'Done', 13, N'Daniel Anderson', N'0678912345', N'789 Pine St', CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (13, CAST(N'2022-06-13T16:45:00.000' AS DateTime), N'Wait', 14, N'Melissa Thomas', N'0234567891', N'123 Oak St', CAST(999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (14, CAST(N'2022-06-14T18:55:00.000' AS DateTime), N'Process', 15, N'Joshua Martinez', N'0765432189', N'456 Maple Ave', CAST(4499.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (15, CAST(N'2022-06-15T20:20:00.000' AS DateTime), N'Done', 16, N'Stephanie Hernandez', N'0456789123', N'789 Elm St', CAST(1199.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (16, CAST(N'2022-06-16T09:40:00.000' AS DateTime), N'Wait', 17, N'Andrew Nelson', N'0891234567', N'321 Pine St', CAST(169.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (17, CAST(N'2022-06-17T11:55:00.000' AS DateTime), N'Process', 18, N'Elizabeth Adams', N'0567891234', N'654 Main St', CAST(3999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (18, CAST(N'2022-06-18T13:30:00.000' AS DateTime), N'Done', 19, N'Joseph Mitchell', N'0123456789', N'987 Elm St', CAST(3899.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (19, CAST(N'2022-06-19T15:45:00.000' AS DateTime), N'Wait', 21, N'Matthew Perez', N'0345678912', N'246 Maple Ave', CAST(799.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (20, CAST(N'2022-06-20T17:50:00.000' AS DateTime), N'Process', 22, N'Isabella Wright', N'0678912345', N'567 Pine St', CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (21, CAST(N'2022-06-21T19:15:00.000' AS DateTime), N'Done', 23, N'Ethan Lopez', N'0234567891', N'789 Oak St', CAST(2399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (22, CAST(N'2022-06-22T08:25:00.000' AS DateTime), N'Wait', 24, N'Samantha Hill', N'0765432189', N'123 Elm St', CAST(7499.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (23, CAST(N'2022-06-23T10:35:00.000' AS DateTime), N'Process', 25, N'Christopher Lewis', N'0456789123', N'456 Main St', CAST(1999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (24, CAST(N'2022-06-24T12:45:00.000' AS DateTime), N'Done', 26, N'Ashley Green', N'0891234567', N'789 Maple Ave', CAST(149.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (25, CAST(N'2022-06-25T14:50:00.000' AS DateTime), N'Wait', 27, N'Andrew Baker', N'0567891234', N'321 Oak St', CAST(2999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (26, CAST(N'2022-06-26T16:55:00.000' AS DateTime), N'Process', 28, N'Madison Hall', N'0123456789', N'654 Elm St', CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (27, CAST(N'2022-06-27T18:30:00.000' AS DateTime), N'Done', 29, N'Daniel Young', N'0987654321', N'987 Pine St', CAST(979.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (28, CAST(N'2022-06-28T20:40:00.000' AS DateTime), N'Wait', 31, N'Joseph Rivera', N'0678912345', N'246 Cedar St', CAST(1099.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (29, CAST(N'2022-06-29T22:55:00.000' AS DateTime), N'Process', 32, N'Mia Bell', N'0234567891', N'567 Elm St', CAST(3999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (30, CAST(N'2022-06-30T10:10:00.000' AS DateTime), N'Done', 33, N'Alexander Mitchell', N'0765432189', N'789 Pine St', CAST(4499.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (31, CAST(N'2022-07-01T12:30:00.000' AS DateTime), N'Wait', 34, N'Emily Turner', N'0456789123', N'123 Oak St', CAST(599.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (32, CAST(N'2022-07-02T14:45:00.000' AS DateTime), N'Process', 35, N'David Roberts', N'0891234567', N'456 Maple Ave', CAST(399.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (33, CAST(N'2022-07-03T16:55:00.000' AS DateTime), N'Done', 36, N'Olivia Nelson', N'0567891234', N'789 Elm St', CAST(1799.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (34, CAST(N'2022-07-04T09:20:00.000' AS DateTime), N'Wait', 37, N'Daniel Smith', N'0123456789', N'321 Pine St', CAST(599.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (35, CAST(N'2022-07-05T11:40:00.000' AS DateTime), N'Process', 38, N'Sophia Anderson', N'0987654321', N'654 Main St', CAST(399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (36, CAST(N'2022-07-06T13:50:00.000' AS DateTime), N'Done', 39, N'Jacob White', N'0345678912', N'987 Elm St', CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (37, CAST(N'2022-07-07T16:05:00.000' AS DateTime), N'Wait', 41, N'Michael Taylor', N'0234567891', N'246 Maple Ave', CAST(7999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (38, CAST(N'2022-07-08T18:15:00.000' AS DateTime), N'Process', 42, N'Charlotte Thomas', N'0765432189', N'567 Pine St', CAST(3599.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (39, CAST(N'2022-07-09T20:30:00.000' AS DateTime), N'Done', 43, N'William Garcia', N'0456789123', N'789 Oak St', CAST(499.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (40, CAST(N'2022-07-10T22:40:00.000' AS DateTime), N'Wait', 44, N'Sophia Martinez', N'0891234567', N'123 Elm St', CAST(499.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (41, CAST(N'2022-07-11T09:55:00.000' AS DateTime), N'Process', 45, N'Jayden Thompson', N'0567891234', N'456 Main St', CAST(2999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (42, CAST(N'2022-07-12T12:15:00.000' AS DateTime), N'Done', 46, N'Chloe Johnson', N'0123456789', N'789 Maple Ave', CAST(1799.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (43, CAST(N'2022-07-13T14:30:00.000' AS DateTime), N'Wait', 47, N'James Brown', N'0987654321', N'321 Oak St', CAST(339.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (44, CAST(N'2022-07-14T16:45:00.000' AS DateTime), N'Process', 48, N'Amelia Miller', N'0345678912', N'654 Elm St', CAST(1999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (45, CAST(N'2022-07-15T19:00:00.000' AS DateTime), N'Done', 49, N'Benjamin Davis', N'0678912345', N'987 Pine St', CAST(2599.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (46, CAST(N'2022-07-16T08:20:00.000' AS DateTime), N'Process', 51, N'Mia Harris', N'0765432189', N'246 Cedar St', CAST(1199.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (47, CAST(N'2022-07-17T10:35:00.000' AS DateTime), N'Process', 52, N'Elijah Clark', N'0456789123', N'567 Elm St', CAST(499.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (48, CAST(N'2022-07-18T12:50:00.000' AS DateTime), N'Done', 53, N'Grace Adams', N'0891234567', N'789 Pine St', CAST(1199.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (49, CAST(N'2022-07-19T15:00:00.000' AS DateTime), N'Wait', 54, N'Lucas Lewis', N'0567891234', N'123 Oak St', CAST(4999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (50, CAST(N'2022-07-20T17:15:00.000' AS DateTime), N'Process', 55, N'Lily Carter', N'0123456789', N'456 Maple Ave', CAST(2999.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (51, CAST(N'2022-07-21T19:30:00.000' AS DateTime), N'Done', 56, N'Henry Wright', N'0987654321', N'789 Elm St', CAST(299.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (52, CAST(N'2022-07-22T21:45:00.000' AS DateTime), N'Wait', 57, N'Zoe Hall', N'0345678912', N'246 Pine St', CAST(1499.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (53, CAST(N'2022-07-23T10:00:00.000' AS DateTime), N'Process', 58, N'Jackson Walker', N'0678912345', N'567 Cedar St', CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (54, CAST(N'2022-07-24T12:15:00.000' AS DateTime), N'Done', 59, N'Victoria King', N'0234567891', N'789 Maple Ave', CAST(1469.97 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (55, CAST(N'2022-07-25T14:30:00.000' AS DateTime), N'Process', 61, N'Penelope Turner', N'0456789123', N'246 Main St', CAST(1099.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (56, CAST(N'2022-07-26T16:45:00.000' AS DateTime), N'Process', 62, N'Gabriel Adams', N'0891234567', N'567 Elm St', CAST(1399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (57, CAST(N'2022-07-27T19:00:00.000' AS DateTime), N'Done', 63, N'Addison Rivera', N'0567891234', N'789 Pine St', CAST(1999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (58, CAST(N'2022-07-28T21:15:00.000' AS DateTime), N'Wait', 64, N'Liam Bell', N'0123456789', N'123 Oak St', CAST(2599.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (59, CAST(N'2022-07-29T10:30:00.000' AS DateTime), N'Process', 65, N'Natalie Martinez', N'0987654321', N'456 Maple Ave', CAST(1499.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (60, CAST(N'2022-07-30T12:45:00.000' AS DateTime), N'Done', 66, N'Layla Thompson', N'0345678912', N'789 Elm St', CAST(1799.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (61, CAST(N'2022-07-31T15:00:00.000' AS DateTime), N'Wait', 67, N'Caleb Garcia', N'0678912345', N'135 Pine St', CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (62, CAST(N'2022-08-01T17:15:00.000' AS DateTime), N'Process', 68, N'Henry Wright', N'0234567891', N'246 Main St', CAST(1999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (63, CAST(N'2022-08-02T19:30:00.000' AS DateTime), N'Done', 69, N'Zoe Hill', N'0765432189', N'567 Elm St', CAST(399.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (64, CAST(N'2022-08-03T21:45:00.000' AS DateTime), N'Wait', 71, N'Benjamin Green', N'0891234567', N'123 Oak St', CAST(499.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (65, CAST(N'2022-08-04T10:00:00.000' AS DateTime), N'Process', 72, N'Lily Rodriguez', N'0567891234', N'456 Maple Ave', CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (66, CAST(N'2022-08-05T12:15:00.000' AS DateTime), N'Done', 73, N'Samuel Adams', N'0123456789', N'789 Elm St', CAST(2999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (67, CAST(N'2022-08-06T14:30:00.000' AS DateTime), N'Wait', 74, N'Aria Cooper', N'0987654321', N'135 Pine St', CAST(199.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (68, CAST(N'2022-08-07T16:45:00.000' AS DateTime), N'Process', 75, N'Grayson Lee', N'0345678912', N'246 Main St', CAST(1599.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (69, CAST(N'2022-08-08T19:00:00.000' AS DateTime), N'Done', 76, N'Scarlett Hernandez', N'0678912345', N'567 Cedar St', CAST(199.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (70, CAST(N'2022-08-09T21:15:00.000' AS DateTime), N'Wait', 77, N'Wyatt Morris', N'0234567891', N'789 Maple Ave', CAST(1599.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (71, CAST(N'2022-08-10T10:30:00.000' AS DateTime), N'Process', 78, N'Audrey Ross', N'0765432189', N'123 Oak St', CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (72, CAST(N'2022-08-11T12:45:00.000' AS DateTime), N'Done', 79, N'Levi Butler', N'0456789123', N'456 Maple Ave', CAST(699.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (73, CAST(N'2022-08-12T15:00:00.000' AS DateTime), N'Wait', 81, N'Oliver Reed', N'0567891234', N'135 Pine St', CAST(3999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (74, CAST(N'2022-08-13T17:15:00.000' AS DateTime), N'Process', 82, N'Emily Coleman', N'0123456789', N'246 Main St', CAST(3399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (75, CAST(N'2022-08-14T19:30:00.000' AS DateTime), N'Done', 83, N'Daniel Gray', N'0987654321', N'567 Cedar St', CAST(1199.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (76, CAST(N'2022-08-15T21:45:00.000' AS DateTime), N'Wait', 84, N'Avery Ross', N'0345678912', N'789 Maple Ave', CAST(599.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (77, CAST(N'2022-08-16T10:00:00.000' AS DateTime), N'Process', 85, N'Victoria Cooper', N'0678912345', N'123 Oak St', CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (78, CAST(N'2022-08-17T12:15:00.000' AS DateTime), N'Done', 86, N'Logan Richardson', N'0234567891', N'456 Maple Ave', CAST(1199.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (79, CAST(N'2022-08-18T14:30:00.000' AS DateTime), N'Wait', 87, N'Chloe Adams', N'0765432189', N'789 Elm St', CAST(499.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (80, CAST(N'2022-08-19T16:45:00.000' AS DateTime), N'Process', 88, N'Gabriel Carter', N'0456789123', N'135 Pine St', CAST(1699.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (81, CAST(N'2022-08-20T19:00:00.000' AS DateTime), N'Done', 89, N'Madison Hernandez', N'0891234567', N'246 Main St', CAST(1499.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (82, CAST(N'2022-08-21T21:15:00.000' AS DateTime), N'Wait', 10, N'Emily Wilson', N'0123456789', N'135 Main St', CAST(2399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (83, CAST(N'2022-08-22T10:30:00.000' AS DateTime), N'Process', 11, N'Christopher Moore', N'0987654321', N'246 Cedar St', CAST(599.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (84, CAST(N'2022-08-23T12:45:00.000' AS DateTime), N'Done', 12, N'Amanda Taylor', N'0345678912', N'567 Elm St', CAST(999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (85, CAST(N'2022-08-24T15:00:00.000' AS DateTime), N'Wait', 13, N'Daniel Anderson', N'0678912345', N'789 Pine St', CAST(169.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (86, CAST(N'2022-08-25T17:15:00.000' AS DateTime), N'Process', 14, N'Melissa Thomas', N'0234567891', N'123 Oak St', CAST(1399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (87, CAST(N'2022-08-26T19:30:00.000' AS DateTime), N'Done', 15, N'Joshua Martinez', N'0765432189', N'456 Maple Ave', CAST(1999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (88, CAST(N'2022-08-27T21:45:00.000' AS DateTime), N'Wait', 16, N'Stephanie Hernandez', N'0456789123', N'789 Elm St', CAST(399.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (89, CAST(N'2022-08-28T10:00:00.000' AS DateTime), N'Process', 17, N'Andrew Nelson', N'0891234567', N'321 Pine St', CAST(1299.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (90, CAST(N'2022-08-29T12:15:00.000' AS DateTime), N'Done', 18, N'Elizabeth Adams', N'0567891234', N'654 Main St', CAST(3199.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (91, CAST(N'2023-07-18T00:49:50.407' AS DateTime), N'Wait', 91, N'Thai Ha', N'0123456789', N'Vietnam', CAST(1099.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (92, CAST(N'2023-07-18T01:08:12.667' AS DateTime), N'Wait', 91, N'Thai Ha', N'01236789', N'Vietnam', CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (93, CAST(N'2023-07-18T01:42:40.130' AS DateTime), N'Wait', 91, N'Huy Tuan', N'0123456789', N'Namdinh, Vietnam', CAST(1999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (94, CAST(N'2023-07-18T02:47:42.600' AS DateTime), N'Wait', 91, N'Nguyen Van A', N'0123456789', N'Vietnam', CAST(1999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (95, CAST(N'2023-07-18T05:13:04.490' AS DateTime), N'Wait', 91, N'Hanh Phuc', N'0987654321', N'Hanoi, Vietnam', CAST(1699.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (96, CAST(N'2023-07-18T06:14:40.470' AS DateTime), N'Wait', 91, N'Buon Ngu', N'0987654321', N'Tan Xa, Hanoi, Vietnam', CAST(999.95 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (97, CAST(N'2023-07-18T15:52:39.767' AS DateTime), N'Wait', 91, N'Huy Tuan', N'0123456789', N'Vietnam', CAST(2499.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (98, CAST(N'2023-07-18T16:09:50.270' AS DateTime), N'Wait', 91, N'HT', N'1234567890', N'VN', CAST(3999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (99, CAST(N'2023-07-18T19:10:53.277' AS DateTime), N'Wait', 91, N'Bui Thi Thu Ha', N'0123456789', N'Hai Phong', CAST(699.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (100, CAST(N'2023-07-20T15:39:35.020' AS DateTime), N'Process', 92, N'thaottp', N'43353536803', N'Hola', CAST(1799.98 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (101, CAST(N'2023-07-27T15:37:57.700' AS DateTime), N'Wait', 91, N'Thai Ha', N'012356789', N'Ha Giang', CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (102, CAST(N'2023-08-12T23:14:20.023' AS DateTime), N'Wait', 91, N'Huy Tuan', N'0123456789', N'VN', CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (103, CAST(N'2023-08-15T19:26:19.047' AS DateTime), N'Wait', 91, N'Huy Tuan', N'0123456789', N'VN', CAST(549.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (104, CAST(N'2023-08-18T19:01:44.143' AS DateTime), N'Wait', 91, N'ws', N'2345', N'ád', CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (105, CAST(N'2023-09-01T21:00:56.240' AS DateTime), N'Wait', 91, N'BDK', N'0123456789', N'VN', CAST(1299.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (106, CAST(N'2023-09-04T11:45:37.450' AS DateTime), N'Wait', 91, N'HT', N'0123456789', N'VN', CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (107, CAST(N'2023-09-07T12:13:23.713' AS DateTime), N'Wait', 93, N'lan', N'099999999', N'Ha Ni', CAST(1999.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (108, CAST(N'2023-09-11T22:43:41.657' AS DateTime), N'Wait', 91, N'sdfghjk', N'345678', N'dfty', CAST(999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (109, CAST(N'2024-03-03T00:58:41.863' AS DateTime), N'done', 94, N'Ha Trung', N'0944362986', N'Phu Tho', CAST(899.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (110, CAST(N'2024-03-11T16:08:03.180' AS DateTime), N'done', 23, N'ethanlopez', N'0977345976', N'vinhome central part quận bình thạnh tphcm', CAST(10799.95 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (111, CAST(N'2024-03-11T16:13:30.740' AS DateTime), N'done', 23, N'ethanlopez', N'0987123419', N'xã phúc yên, thị xã phúc yên, tỉnh vĩnh phúc', CAST(3887.96 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (112, CAST(N'2024-03-11T16:16:29.230' AS DateTime), N'done', 23, N'ethanlopez', N'0944362986', N'Võ Lao Thanh Ba Phu Tho', CAST(10367.91 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (113, CAST(N'2024-03-11T16:23:10.280' AS DateTime), N'done', 22, N'isabellawright', N'0977345899', N'thach that ha noi', CAST(10367.91 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (114, CAST(N'2024-03-11T16:34:23.240' AS DateTime), N'done', 32, N'miabell', N'0977864837', N'khu 3 Hoàng Cương- Thanh Ba - Phu Tho', CAST(12959.92 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (115, CAST(N'2024-03-11T16:36:40.527' AS DateTime), N'done', 35, N'davidroberts', N'0987123419', N'phường Mai dịch cầu giấy hà nội', CAST(4535.90 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (116, CAST(N'2024-03-11T16:39:06.440' AS DateTime), N'done', 35, N'davidroberts', N'0987123419', N'phường Hoàng Cầu cầu giấy hà nội', CAST(4697.92 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (117, CAST(N'2024-03-11T22:41:07.600' AS DateTime), N'done', 95, N'sa', N'0977345879', N'thach that ha noi', CAST(2591.91 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (118, CAST(N'2024-03-11T22:44:12.003' AS DateTime), N'done', 27, N'andrewbaker', N'0987123419', N'phường Mai dịch cầu giấy hà nội', CAST(6803.90 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (119, CAST(N'2024-03-11T22:44:43.003' AS DateTime), N'done', 27, N'andrewbaker', N'0944362986', N'Võ Lao Thanh Ba Phu Tho', CAST(8639.96 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (120, CAST(N'2024-03-11T22:45:10.977' AS DateTime), N'done', 27, N'andrewbaker', N'0977345879', N'thach that ha noi', CAST(1727.91 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (121, CAST(N'2024-03-11T22:45:27.970' AS DateTime), N'done', 27, N'andrewbaker', N'0944362986', N'Võ Lao Thanh Ba Phu Tho', CAST(16199.89 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [Status], [CustomerID], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [Total]) VALUES (122, CAST(N'2024-03-11T22:47:38.403' AS DateTime), N'done', 27, N'andrewbaker', N'0987123419', N'xã phúc yên, thị xã phúc yên, tỉnh vĩnh phúc', CAST(18467.79 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (1, N'Galaxy S21', CAST(1099.99 AS Decimal(10, 2)), 50, N'Flagship smartphone with top-notch features', N'icon/s21.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (2, N'Galaxy Tab S7', CAST(699.99 AS Decimal(10, 2)), 30, N'Powerful tablet for productivity and entertainment', N'icon/tabs7.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (3, N'QLED TV', CAST(1999.99 AS Decimal(10, 2)), 10, N'High-quality QLED TV with stunning picture quality', N'icon/qledtv.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (4, N'Notebook 9 Pro', CAST(1299.99 AS Decimal(10, 2)), 20, N'Versatile laptop for work and creativity', N'icon/notebook9pro.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (5, N'Refrigerator', CAST(1499.99 AS Decimal(10, 2)), 15, N'Spacious refrigerator with advanced cooling technology', N'icon/refrigerator.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (6, N'Washing Machine', CAST(899.99 AS Decimal(10, 2)), 25, N'Efficient washing machine with multiple wash programs', N'icon/washingmachine.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (7, N'Galaxy Watch', CAST(299.99 AS Decimal(10, 2)), 40, N'Smartwatch with health and fitness tracking features', N'icon/watch.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (8, N'Galaxy Book', CAST(999.99 AS Decimal(10, 2)), 10, N'Portable 2-in-1 laptop for productivity on the go', N'icon/book.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (9, N'Galaxy A52', CAST(399.99 AS Decimal(10, 2)), 50, N'Mid-range smartphone with great camera capabilities', N'icon/a52.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (10, N'Galaxy Tab A7', CAST(249.99 AS Decimal(10, 2)), 20, N'Affordable tablet for entertainment and everyday tasks', N'icon/taba7.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (11, N'4K UHD TV', CAST(899.99 AS Decimal(10, 2)), 15, N'Ultra high-definition TV for an immersive viewing experience', N'icon/4kuhdtv.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (12, N'Galaxy Book Flex', CAST(1499.99 AS Decimal(10, 2)), 10, N'Convertible laptop with a stunning QLED display', N'icon/bookflex.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (13, N'Microwave Oven', CAST(199.99 AS Decimal(10, 2)), 30, N'Convenient microwave oven for quick and easy cooking', N'icon/microwaveoven.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (14, N'Dishwasher', CAST(799.99 AS Decimal(10, 2)), 10, N'Efficient dishwasher for hassle-free dishwashing', N'icon/dishwasher.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (15, N'Galaxy Buds Pro', CAST(199.99 AS Decimal(10, 2)), 40, N'Wireless earbuds with active noise cancellation', N'icon/budspro.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (16, N'Galaxy Chromebook', CAST(799.99 AS Decimal(10, 2)), 10, N'Premium Chromebook with a vibrant display and powerful performance', N'icon/chromebook.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (17, N'Galaxy Note20', CAST(999.99 AS Decimal(10, 2)), 30, N'Feature-packed smartphone with S Pen functionality', N'icon/note20.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (18, N'Galaxy Tab S6 Lite', CAST(349.99 AS Decimal(10, 2)), 20, N'Versatile tablet for creativity and entertainment', N'icon/tabs6lite.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (19, N'QLED 8K TV', CAST(3999.99 AS Decimal(10, 2)), 5, N'Premium 8K QLED TV with exceptional picture quality', N'icon/qled8ktv.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (20, N'Galaxy Book Pro', CAST(1699.99 AS Decimal(10, 2)), 10, N'Ultra-slim and lightweight laptop for professionals', N'icon/bookpro.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (21, N'Air Conditioner', CAST(1199.99 AS Decimal(10, 2)), 15, N'Powerful and energy-efficient air conditioner for your home', N'icon/airconditioner.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (22, N'Vacuum Cleaner', CAST(299.99 AS Decimal(10, 2)), 25, N'Efficient vacuum cleaner for keeping your home clean', N'icon/vacuumcleaner.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (23, N'Galaxy Watch Active2', CAST(249.99 AS Decimal(10, 2)), 40, N'Stylish smartwatch with advanced health tracking features', N'icon/watchactive2.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (24, N'Galaxy XCover6 Pro', CAST(599.99 AS Decimal(10, 2)), 10, N'Rugged and ready, keep your gloves on', N'icon/xcover6pro.jpg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (25, N'Galaxy A72', CAST(499.99 AS Decimal(10, 2)), 50, N'Mid-range smartphone with a large display and long-lasting battery', N'icon/a72.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (26, N'Galaxy Tab S7+', CAST(849.99 AS Decimal(10, 2)), 30, N'Premium tablet with a large AMOLED display and S Pen support', N'icon/tabs7p.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (27, N'Frame TV', CAST(1499.99 AS Decimal(10, 2)), 10, N'TV designed to blend in with your home decor', N'icon/frametv.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (28, N'Galaxy Book Ion', CAST(1199.99 AS Decimal(10, 2)), 20, N'Lightweight and powerful laptop with a stunning display', N'icon/bookion.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (29, N'Smart Oven', CAST(599.99 AS Decimal(10, 2)), 15, N'Combination microwave and convection oven for versatile cooking', N'icon/smartoven.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (30, N'Robot Vacuum', CAST(499.99 AS Decimal(10, 2)), 25, N'Autonomous vacuum cleaner that keeps your floors clean', N'icon/robotvacuum.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (31, N'Galaxy Buds Live', CAST(169.99 AS Decimal(10, 2)), 40, N'Wireless earbuds with a unique bean-shaped design', N'icon/budslive.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (32, N'Galaxy Chromebook 2', CAST(699.99 AS Decimal(10, 2)), 10, N'Sleek Chromebook with a vivid QLED display', N'icon/chromebook2.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (33, N'Galaxy Z Fold2', CAST(1999.99 AS Decimal(10, 2)), 30, N'Innovative foldable smartphone with a large flexible display', N'icon/zfold2.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (34, N'Galaxy Tab A', CAST(199.99 AS Decimal(10, 2)), 20, N'Affordable tablet for everyday use', N'icon/taba.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (35, N'4K Curved TV', CAST(1299.99 AS Decimal(10, 2)), 10, N'Curved TV for an immersive viewing experience', N'icon/4kcurvedtv.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (36, N'Galaxy Book Flex2', CAST(1599.99 AS Decimal(10, 2)), 15, N'Convertible laptop with a vibrant QLED display and improved performance', N'icon/bookflex2.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (37, N'Air Purifier', CAST(399.99 AS Decimal(10, 2)), 25, N'Air purifier that filters out pollutants for clean and fresh air', N'icon/airpurifier.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (38, N'Robotic Mop', CAST(299.99 AS Decimal(10, 2)), 15, N'Robotic mop that makes floor cleaning effortless', N'icon/roboticmop.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (39, N'Galaxy Buds2 Pro', CAST(249.99 AS Decimal(10, 2)), 40, N'Premium wireless earbuds with advanced sound quality', N'icon/buds2pro.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (40, N'Galaxy Book Go', CAST(599.99 AS Decimal(10, 2)), 10, N'Affordable and lightweight laptop for everyday tasks', N'icon/bookgo.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (41, N'Galaxy Note 20 Ultra', CAST(1199.99 AS Decimal(10, 2)), 30, N'Powerful smartphone with an immersive display and versatile camera', N'icon/note20ultra.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (42, N'Galaxy Tab S7 FE', CAST(599.99 AS Decimal(10, 2)), 20, N'Feature-rich tablet for productivity and entertainment', N'icon/tabs7fe.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (43, N'Neo QLED TV', CAST(2499.99 AS Decimal(10, 2)), 10, N'Cutting-edge TV with Neo Quantum Processor for stunning visuals', N'icon/neoqledtv.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (44, N'Galaxy Book Pro 360', CAST(1799.99 AS Decimal(10, 2)), 20, N'Convertible laptop with a 360-degree hinge and powerful performance', N'icon/bookpro360.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (45, N'Smart Dishwasher', CAST(999.99 AS Decimal(10, 2)), 15, N'Smart dishwasher with advanced features for efficient cleaning', N'icon/smartdishwasher.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (46, N'Robot Window Cleaner', CAST(399.99 AS Decimal(10, 2)), 10, N'Robot window cleaner that cleans windows effortlessly', N'icon/robotwindowcleaner.jpg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (47, N'Galaxy Buds+', CAST(149.99 AS Decimal(10, 2)), 40, N'Wireless earbuds with long battery life and clear audio', N'icon/budsp.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (48, N'Galaxy Chromebook Go', CAST(499.99 AS Decimal(10, 2)), 10, N'Affordable and lightweight Chromebook for everyday use', N'icon/chromebookgo.jpg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (49, N'Galaxy Z Flip', CAST(1499.99 AS Decimal(10, 2)), 30, N'Stylish foldable smartphone with a compact design', N'icon/zflip.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (50, N'Galaxy Tab A7 Lite', CAST(199.99 AS Decimal(10, 2)), 20, N'Compact and affordable tablet for entertainment on the go', N'icon/taba7lite.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (51, N'Galaxy XCover Pro', CAST(300.00 AS Decimal(10, 2)), 10, N'Work Anywhere, Without Sacrifice, Edge-to-Edge Screen, Limitless Possibilities', N'icon/xcoverpro.jpg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (52, N'Galaxy Tab Active4 Pro', CAST(759.00 AS Decimal(10, 2)), 10, N'Made for the tough jobs, durability you can rely on', N'icon/tabactive4pro.jpg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (53, N'Galaxy Tab Active3', CAST(489.99 AS Decimal(10, 2)), 10, N'Power for Hours, tackle Any Job, in Any Place', N'icon/galaxytabactive3.jpg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (54, N'Galaxy Tab Active Pro', CAST(679.99 AS Decimal(10, 2)), 10, N'Enterprise mobility management and ongoing support', N'icon/tabactivepro.jpg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (55, N'Galaxy S23 Ultra', CAST(1379.99 AS Decimal(10, 2)), 20, N'The best smartphone in the world', N'icon/s23.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (56, N'galaxy a60', CAST(6000.00 AS Decimal(10, 2)), 29, N'ádhfasuhfuasfhiuwheshnfjkashd', N'icon/s23.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (57, N'galaxy a59', CAST(2000.00 AS Decimal(10, 2)), 19, N'Very beatiful and have many features to help users', N'icon/s23.jpg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Quantity], [Description], [ImageURL], [CategoryID]) VALUES (58, N'galaxy s25ultra new ', CAST(2000.00 AS Decimal(10, 2)), 29, N'asdflaksjdfjsafkjkei 12341234', N'icon/galaxya53.png', 1)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (1, N'johndoe', N'12345678', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (2, N'janesmith', N'password2', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (3, N'davidjohnson', N'password3', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (4, N'sarahwilliams', N'password4', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (5, N'robertbrown', N'password5', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (6, N'jenniferdavis', N'password6', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (7, N'michaelanderson', N'password7', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (8, N'jessicathompson', N'password8', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (9, N'williamlee', N'password9', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (10, N'emilywilson', N'password10', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (11, N'christophermoore', N'password11', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (12, N'amandataylor', N'password12', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (13, N'danielanderson', N'password13', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (14, N'melissathomas', N'password14', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (15, N'joshuamartinez', N'password15', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (16, N'stephaniehernandez', N'password16', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (17, N'andrewnelson', N'password17', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (18, N'elizabethadams', N'password18', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (19, N'josephmitchell', N'password19', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (21, N'matthewperez', N'password21', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (22, N'isabellawright', N'password22', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (23, N'ethanlopez', N'password23', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (24, N'samanthahill', N'password24', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (25, N'christopherlewis', N'password25', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (26, N'ashleygreen', N'password26', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (27, N'andrewbaker', N'password27', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (28, N'madisonhall', N'password28', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (29, N'danielyoung', N'password29', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (31, N'josephrivera', N'password31', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (32, N'miabell', N'password32', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (33, N'alexandermitchell', N'password33', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (34, N'emilyturner', N'password34', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (35, N'davidroberts', N'password35', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (36, N'olivianelson', N'password36', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (37, N'danielsmith', N'password37', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (38, N'sophiaanderson', N'password38', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (39, N'jacobwhite', N'password39', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (41, N'michaeltaylor', N'password41', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (42, N'charlottethomas', N'password42', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (43, N'williamgarcia', N'password43', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (44, N'sophiamartinez', N'password44', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (45, N'jaydenthompson', N'password45', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (46, N'chloejohnson', N'password46', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (47, N'jamesbrown', N'password47', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (48, N'ameliamiller', N'trung', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (49, N'benjamindavis', N'password49', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (51, N'miaharris', N'password51', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (52, N'elijahclark', N'password52', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (53, N'graceadams', N'password53', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (54, N'lucaslewis', N'password54', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (55, N'lilycarter', N'password55', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (56, N'henrywright', N'password56', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (57, N'zoehall', N'password57', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (58, N'jacksonwalker', N'password58', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (59, N'victoriaking', N'password59', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (61, N'penelopeturner', N'password61', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (62, N'gabrieladams', N'password62', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (63, N'addisonrivera', N'password63', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (64, N'liambell', N'password64', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (65, N'nataliemartinez', N'password65', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (66, N'laylathompson', N'password66', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (67, N'calebgarcia', N'password67', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (68, N'henrywright', N'password68', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (69, N'zoehill', N'password69', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (71, N'benjamingreen', N'password71', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (72, N'lilyrodriguez', N'password72', 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (73, N'samueladams', N'password73', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (74, N'ariacooper', N'password74', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (75, N'graysonlee', N'password75', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (76, N'scarletthernandez', N'password76', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (77, N'wyattmorris', N'password77', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (78, N'audreyross', N'password78', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (79, N'levibutler', N'password79', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (81, N'oliverreed', N'password81', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (82, N'emilycoleman', N'password82', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (83, N'danielgray', N'password83', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (84, N'averyross', N'password84', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (85, N'victoriacooper', N'password85', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (86, N'loganrichardson', N'password86', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (87, N'chloeadams', N'password87', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (89, N'madisonhernandez', N'password89', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (90, N'duy', N'12345', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role]) VALUES (90, N'admin', N'123455', 2)

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CustomerID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CategoryID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([Quantity]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [SmartStore] SET  READ_WRITE 
GO
