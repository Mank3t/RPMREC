USE [master]
GO
/****** Object:  Database [Convinience_Store]    Script Date: 22.06.2024 16:57:43 ******/
CREATE DATABASE [Convinience_Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Convinience_Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Convinience_Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Convinience_Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Convinience_Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Convinience_Store] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Convinience_Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Convinience_Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Convinience_Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Convinience_Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Convinience_Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Convinience_Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Convinience_Store] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Convinience_Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Convinience_Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Convinience_Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Convinience_Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Convinience_Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Convinience_Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Convinience_Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Convinience_Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Convinience_Store] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Convinience_Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Convinience_Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Convinience_Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Convinience_Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Convinience_Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Convinience_Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Convinience_Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Convinience_Store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Convinience_Store] SET  MULTI_USER 
GO
ALTER DATABASE [Convinience_Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Convinience_Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Convinience_Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Convinience_Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Convinience_Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Convinience_Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Convinience_Store] SET QUERY_STORE = ON
GO
ALTER DATABASE [Convinience_Store] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Convinience_Store]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID_Client] [int] NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email_Adress] [nvarchar](50) NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ID_Color] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID_Manufacturer] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Products]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Products](
	[ID_Order] [int] NOT NULL,
	[ID_Product] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID_Order] [int] NOT NULL,
	[ID_Client] [int] NOT NULL,
	[Delivery_Date] [date] NOT NULL,
	[Order_Date] [date] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[ID_Payment_Type] [int] NOT NULL,
	[Order_Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[ID_Payment_Type] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Payment_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Photo]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Photo](
	[ID_Product_Photo] [int] NOT NULL,
	[ID_Product] [int] NOT NULL,
	[Photo] [image] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Product_Photo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[ID_Product_Type] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Product_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_Product] [int] NOT NULL,
	[Article] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ID_Product_Type] [int] NOT NULL,
	[ID_Color] [int] NOT NULL,
	[ID_Manufacturer] [int] NOT NULL,
	[Desrcription] [nvarchar](1000) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 22.06.2024 16:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[ID_Login] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([ID_Client], [First_Name], [Surname], [Email_Adress], [Phone_Number]) VALUES (1, N'Вячеслав', N'Кузнецов', N'pon12@mai.ru', N'89991233322')
INSERT [dbo].[Client] ([ID_Client], [First_Name], [Surname], [Email_Adress], [Phone_Number]) VALUES (2, N'Максим', N'Кириянов', N'Popstar1@yandex.ru', N'85278732465')
INSERT [dbo].[Client] ([ID_Client], [First_Name], [Surname], [Email_Adress], [Phone_Number]) VALUES (3, N'Владимир', N'Куницин', N'Ploch@mail.ru', N'92895648912')
INSERT [dbo].[Client] ([ID_Client], [First_Name], [Surname], [Email_Adress], [Phone_Number]) VALUES (4, N'Роман', N'Иванов', N'Nifarak@gmail.com', N'87851672754')
INSERT [dbo].[Client] ([ID_Client], [First_Name], [Surname], [Email_Adress], [Phone_Number]) VALUES (5, N'Мария', N'Келлер', N'KelMar@yandex.ru', N'87777777777')
GO
INSERT [dbo].[Color] ([ID_Color], [Title]) VALUES (1, N'Красный')
INSERT [dbo].[Color] ([ID_Color], [Title]) VALUES (2, N'Серебряннный')
INSERT [dbo].[Color] ([ID_Color], [Title]) VALUES (3, N'Чёрный')
INSERT [dbo].[Color] ([ID_Color], [Title]) VALUES (4, N'Бежевый')
INSERT [dbo].[Color] ([ID_Color], [Title]) VALUES (5, N'Коричневый')
GO
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Title]) VALUES (1, N'Samsung')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Title]) VALUES (2, N'Neff')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Title]) VALUES (3, N'Smeg')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Title]) VALUES (4, N'Kaiser')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Title]) VALUES (5, N'Sony')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Title]) VALUES (6, N'HTC')
GO
INSERT [dbo].[Payment_Type] ([ID_Payment_Type], [Title]) VALUES (1, N'Наличные при выдаче')
INSERT [dbo].[Payment_Type] ([ID_Payment_Type], [Title]) VALUES (2, N'Картой на сайте')
INSERT [dbo].[Payment_Type] ([ID_Payment_Type], [Title]) VALUES (3, N'Картой при выдаче')
GO
INSERT [dbo].[Product_Type] ([ID_Product_Type], [Title]) VALUES (1, N'Пылесос')
INSERT [dbo].[Product_Type] ([ID_Product_Type], [Title]) VALUES (2, N'Утюг')
INSERT [dbo].[Product_Type] ([ID_Product_Type], [Title]) VALUES (3, N'Чайник')
INSERT [dbo].[Product_Type] ([ID_Product_Type], [Title]) VALUES (4, N'Стиральная машина')
INSERT [dbo].[Product_Type] ([ID_Product_Type], [Title]) VALUES (5, N'Электро плита')
INSERT [dbo].[Product_Type] ([ID_Product_Type], [Title]) VALUES (6, N'Телевизор')
GO
INSERT [dbo].[Products] ([ID_Product], [Article], [Title], [ID_Product_Type], [ID_Color], [ID_Manufacturer], [Desrcription], [Price]) VALUES (1, N'1231', N'afgdf', 1, 2, 1, N'wefwefwef', 24122)
INSERT [dbo].[Products] ([ID_Product], [Article], [Title], [ID_Product_Type], [ID_Color], [ID_Manufacturer], [Desrcription], [Price]) VALUES (2, N'123', N'efsefweg', 2, 3, 1, N'wrfqwrqwr', 2423)
GO
INSERT [dbo].[UserLogin] ([ID_Login], [Username], [UserPassword]) VALUES (1, N'Admin', N'123')
INSERT [dbo].[UserLogin] ([ID_Login], [Username], [UserPassword]) VALUES (2, N'A', N'A')
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Orders] ([ID_Order])
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Products] ([ID_Product])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Client] ([ID_Client])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ID_Payment_Type])
REFERENCES [dbo].[Payment_Type] ([ID_Payment_Type])
GO
ALTER TABLE [dbo].[Product_Photo]  WITH CHECK ADD FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Products] ([ID_Product])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ID_Color])
REFERENCES [dbo].[Color] ([ID_Color])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ID_Manufacturer])
REFERENCES [dbo].[Manufacturer] ([ID_Manufacturer])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ID_Product_Type])
REFERENCES [dbo].[Product_Type] ([ID_Product_Type])
GO
USE [master]
GO
ALTER DATABASE [Convinience_Store] SET  READ_WRITE 
GO
