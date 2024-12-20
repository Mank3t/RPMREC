USE [master]
GO
/****** Object:  Database [CreativeStore]    Script Date: 22.10.2024 3:45:36 ******/
CREATE DATABASE [CreativeStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CreativeStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CreativeStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CreativeStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CreativeStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CreativeStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CreativeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CreativeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CreativeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CreativeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CreativeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CreativeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CreativeStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CreativeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CreativeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CreativeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CreativeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CreativeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CreativeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CreativeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CreativeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CreativeStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CreativeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CreativeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CreativeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CreativeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CreativeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CreativeStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CreativeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CreativeStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CreativeStore] SET  MULTI_USER 
GO
ALTER DATABASE [CreativeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CreativeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CreativeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CreativeStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CreativeStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CreativeStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CreativeStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [CreativeStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CreativeStore]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[IDManufacturer] [int] IDENTITY(1,1) NOT NULL,
	[ManufName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDManufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[IDOrderProd] [int] IDENTITY(1,1) NOT NULL,
	[IDOrder] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Ammount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDOrderProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IDOrder] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryDate] [date] NULL,
	[IDPickUpPoint] [int] NOT NULL,
	[ReciveCode] [nvarchar](100) NOT NULL,
	[IDOrderStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[IDOrderStatus] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDOrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoints]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoints](
	[IDPickUpPoint] [int] IDENTITY(1,1) NOT NULL,
	[PickUpPointCode] [int] NOT NULL,
	[HouseNumber] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](100) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPickUpPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdCategory]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdCategory](
	[IDProdCategory] [int] IDENTITY(1,1) NOT NULL,
	[ProdCAtegoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[Article] [nvarchar](100) NOT NULL,
	[ProdName] [nvarchar](200) NOT NULL,
	[Price] [float] NOT NULL,
	[MeasureUnit] [nvarchar](50) NOT NULL,
	[IDManufacturer] [int] NOT NULL,
	[IDProvider] [int] NOT NULL,
	[IDProdCategory] [int] NOT NULL,
	[Discount] [float] NULL,
	[ProdDescription] [nvarchar](500) NOT NULL,
	[ProdImage] [nvarchar](200) NOT NULL,
	[MaxDiscount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[IDProvider] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage](
	[IDStoreProduct] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDStoreProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAuth]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuth](
	[IDUserAuth] [int] IDENTITY(1,1) NOT NULL,
	[IDUserRole] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[UserLogin] [nvarchar](100) NOT NULL,
	[UserPassword] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUserAuth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[IDUserRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUserRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.10.2024 3:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([IDManufacturer], [ManufName]) VALUES (1, N'АртМир')
INSERT [dbo].[Manufacturer] ([IDManufacturer], [ManufName]) VALUES (2, N'Волшебная мастерская')
INSERT [dbo].[Manufacturer] ([IDManufacturer], [ManufName]) VALUES (3, N'ОригамиПлюс')
INSERT [dbo].[Manufacturer] ([IDManufacturer], [ManufName]) VALUES (4, N'ФлюидАрт')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProducts] ON 

INSERT [dbo].[OrderProducts] ([IDOrderProd], [IDOrder], [IDProduct], [Ammount]) VALUES (1, 1, 3, 1)
INSERT [dbo].[OrderProducts] ([IDOrderProd], [IDOrder], [IDProduct], [Ammount]) VALUES (2, 1, 4, 1)
INSERT [dbo].[OrderProducts] ([IDOrderProd], [IDOrder], [IDProduct], [Ammount]) VALUES (3, 2, 4, 1)
INSERT [dbo].[OrderProducts] ([IDOrderProd], [IDOrder], [IDProduct], [Ammount]) VALUES (4, 2, 5, 1)
SET IDENTITY_INSERT [dbo].[OrderProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IDOrder], [IDUser], [OrderNumber], [OrderDate], [DeliveryDate], [IDPickUpPoint], [ReciveCode], [IDOrderStatus]) VALUES (1, 7, 2, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 1, N'932', 1)
INSERT [dbo].[Orders] ([IDOrder], [IDUser], [OrderNumber], [OrderDate], [DeliveryDate], [IDPickUpPoint], [ReciveCode], [IDOrderStatus]) VALUES (2, 9, 3, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 5, N'933', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([IDOrderStatus], [OrderStatusName]) VALUES (1, N'Новый')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickUpPoints] ON 

INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (1, 344288, N'1', N' ул. Чехова', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (2, 614164, N'30', N'  ул. Степная', N' г.Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (3, 394242, N'43', N' ул. Коммунистическая', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (4, 660540, N'25', N' ул. Солнечная', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (5, 125837, N'40', N' ул. Шоссейная', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (6, 125703, N'49', N' ул. Партизанская', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (7, 625283, N'46', N' ул. Победы', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (8, 614611, N'50', N' ул. Молодежная', N' г. Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (9, 454311, N'19', N' ул. Новая', N' г.Чапаевск')
INSERT [dbo].[PickUpPoints] ([IDPickUpPoint], [PickUpPointCode], [HouseNumber], [StreetName], [CityName]) VALUES (10, 660007, N'19', N' ул. Октябрьская', N' г.Чапаевск')
SET IDENTITY_INSERT [dbo].[PickUpPoints] OFF
GO
SET IDENTITY_INSERT [dbo].[ProdCategory] ON 

INSERT [dbo].[ProdCategory] ([IDProdCategory], [ProdCAtegoryName]) VALUES (1, N'Творчество')
INSERT [dbo].[ProdCategory] ([IDProdCategory], [ProdCAtegoryName]) VALUES (2, N'Рисование')
SET IDENTITY_INSERT [dbo].[ProdCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (1, N'А112Т4', N'Творческий набор', 889, N'шт.', 1, 1, 1, 2, N'Творческий набор юного художника для рисования', N'А112Т4.jpg', 30)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (2, N'H648T5', N'Набор для рисования', 849, N'шт.', 2, 2, 2, 4, N'Набор для рисования и творчества в чемоданчике с мольбертом', N'H648T5.jpg', 15)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (3, N'G753H6', N'Набор для рисования', 1999, N'шт.', 3, 2, 2, 5, N'Набор для рисования и творчества, 145 предметов, розовый', N'G753H6.png', 10)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (4, N'N745G4', N'Творческий набор', 1000, N'шт.', 2, 2, 1, 2, N'Molly набор для творчества Флюид Арт Планета Земля', N'N745G4.jpg', 20)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (5, N'Y354G6', N'Творческий набор', 200, N'шт.', 1, 1, 1, 3, N'Origami Набор для творчества оригами На земле, на воде, на воздухе', N'Y354G6.jpg', 5)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (6, N'K674F4', N'Творческий набор', 1170, N'шт.', 1, 3, 1, 4, N'Aquabeads Аквамозаика Студия новичка с формой-перевертышем', N'K674F4.jpg', 30)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (7, N'C745H6', N'Набор для рисования', 999, N'шт.', 3, 1, 2, 3, N'Набор для рисования и творчества', N'C745H6.png', 15)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (8, N'H745G5', N'Творческий набор', 645, N'шт.', 4, 2, 1, 5, N'Набор для детского творчества "Умный песок" Кексики', N'H745G5.jpg', 15)
INSERT [dbo].[Products] ([IDProduct], [Article], [ProdName], [Price], [MeasureUnit], [IDManufacturer], [IDProvider], [IDProdCategory], [Discount], [ProdDescription], [ProdImage], [MaxDiscount]) VALUES (9, N'O735F5', N'набор для рисования', 1300, N'шт.', 1, 3, 2, 3, N'Я-Художник! / Набор для рисования из 10 предметов', N'O735F5.jpg', 25)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([IDProvider], [ProviderName]) VALUES (1, N'Леонардо')
INSERT [dbo].[Providers] ([IDProvider], [ProviderName]) VALUES (2, N'Буквоед')
INSERT [dbo].[Providers] ([IDProvider], [ProviderName]) VALUES (3, N'АртКвартал')
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
SET IDENTITY_INSERT [dbo].[storage] ON 

INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (1, 1, 6)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (2, 2, 12)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (3, 3, 4)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (4, 4, 6)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (5, 5, 8)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (6, 6, 2)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (7, 7, 4)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (8, 8, 15)
INSERT [dbo].[storage] ([IDStoreProduct], [IDProduct], [Quantity]) VALUES (9, 9, 5)
SET IDENTITY_INSERT [dbo].[storage] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAuth] ON 

INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (1, 1, 1, N'jsdrg8x0zqp5@outlook.com', N'2L6KZG')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (2, 1, 2, N's8w0btpz94o7@gmail.com', N'uzWC67')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (3, 1, 3, N'lq6tsbvy5gue@yahoo.com', N'8ntwUp')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (4, 2, 4, N'hzks9681fmgc@outlook.com', N'YOyhfR')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (5, 2, 5, N'khg8y7dsqim2@outlook.com', N'RSbvHv')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (6, 2, 6, N'0wxz32c9hgsb@tutanota.com', N'rwVDh9')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (7, 3, 7, N'340quyv18aoi@yahoo.com', N'LdNyos')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (8, 3, 8, N'7jwstxrhqd85@outlook.com', N'gynQMT')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (9, 3, 9, N'0tsyif3h85ca@yahoo.com', N'AtnDjr')
INSERT [dbo].[UserAuth] ([IDUserAuth], [IDUserRole], [IDUser], [UserLogin], [UserPassword]) VALUES (10, 3, 10, N'gs3wm0d9lcx1@outlook.com', N'JlFRCZ')
SET IDENTITY_INSERT [dbo].[UserAuth] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([IDUserRole], [RoleName]) VALUES (1, N'Aдминистратор')
INSERT [dbo].[UserRole] ([IDUserRole], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[UserRole] ([IDUserRole], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (1, N'Тимофей', N'Соловьев', N'Маркович')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (2, N'Майя', N'Савельева', N'Михайловна')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (3, N'Андрей', N'Назаров', N'Никитич')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (4, N'Леонид', N'Кулешов', N'Андреевич')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (5, N'Игорь', N'Попов', N'Александрович')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (6, N'Тимур', N'Петров', N'Сергеевич')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (7, N'София', N'Севастьянова', N'Савельевна')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (8, N'Ярослава', N'Рыбакова', N'Глебовна')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (9, N'Лейла', N'Петрова', N'Артёмовна')
INSERT [dbo].[Users] ([IDUser], [UserName], [Surname], [LastName]) VALUES (10, N'Александр', N'Щербаков', N'Александрович')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderProd] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Orders] ([IDOrder])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_Order_OrderProd]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_Products_OrderProd] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProduct])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_Products_OrderProd]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_PIckUpP_Order] FOREIGN KEY([IDPickUpPoint])
REFERENCES [dbo].[PickUpPoints] ([IDPickUpPoint])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_PIckUpP_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Status_Order] FOREIGN KEY([IDOrderStatus])
REFERENCES [dbo].[OrderStatus] ([IDOrderStatus])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Status_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_User_Order] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_User_Order]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Category_Product] FOREIGN KEY([IDProdCategory])
REFERENCES [dbo].[ProdCategory] ([IDProdCategory])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Category_Product]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Manuf_Product] FOREIGN KEY([IDManufacturer])
REFERENCES [dbo].[Manufacturer] ([IDManufacturer])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Manuf_Product]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Prov_Product] FOREIGN KEY([IDProvider])
REFERENCES [dbo].[Providers] ([IDProvider])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Prov_Product]
GO
ALTER TABLE [dbo].[storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProduct])
GO
ALTER TABLE [dbo].[storage] CHECK CONSTRAINT [FK_Storage_Product]
GO
ALTER TABLE [dbo].[UserAuth]  WITH CHECK ADD  CONSTRAINT [FK_Role_Auth] FOREIGN KEY([IDUserRole])
REFERENCES [dbo].[UserRole] ([IDUserRole])
GO
ALTER TABLE [dbo].[UserAuth] CHECK CONSTRAINT [FK_Role_Auth]
GO
ALTER TABLE [dbo].[UserAuth]  WITH CHECK ADD  CONSTRAINT [FK_User_Auth] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[UserAuth] CHECK CONSTRAINT [FK_User_Auth]
GO
USE [master]
GO
ALTER DATABASE [CreativeStore] SET  READ_WRITE 
GO
