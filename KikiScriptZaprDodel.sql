USE [master]
GO
/****** Object:  Database [Вар2Кириянов]    Script Date: 25.10.2024 18:04:38 ******/
CREATE DATABASE [Вар2Кириянов]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Вар2Кириянов', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Вар2Кириянов.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Вар2Кириянов_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Вар2Кириянов_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Вар2Кириянов] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Вар2Кириянов].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Вар2Кириянов] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET ARITHABORT OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Вар2Кириянов] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Вар2Кириянов] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Вар2Кириянов] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Вар2Кириянов] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Вар2Кириянов] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Вар2Кириянов] SET  MULTI_USER 
GO
ALTER DATABASE [Вар2Кириянов] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Вар2Кириянов] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Вар2Кириянов] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Вар2Кириянов] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Вар2Кириянов] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Вар2Кириянов] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Вар2Кириянов] SET QUERY_STORE = ON
GO
ALTER DATABASE [Вар2Кириянов] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Вар2Кириянов]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[ИДАвторизация] [int] IDENTITY(1,1) NOT NULL,
	[ИДРоль] [int] NOT NULL,
	[ИДПользователь] [int] NOT NULL,
	[Логин] [nvarchar](100) NOT NULL,
	[Пароль] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДАвторизация] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[ИДЗаказ] [int] IDENTITY(1,1) NOT NULL,
	[ИДПользователь] [int] NOT NULL,
	[НомерЗаказа] [int] NOT NULL,
	[ДатаЗаказа] [datetime] NULL,
	[ДатаДоставки] [date] NULL,
	[ИДПунктВыдачи] [int] NOT NULL,
	[КодПолучеия] [nvarchar](100) NOT NULL,
	[ИДСтатусЗаказа] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДЗаказ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КатегорияПродукта]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КатегорияПродукта](
	[ИДКатегорияПродукта] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДКатегорияПродукта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[ИДПользователь] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](100) NOT NULL,
	[Фамиллия] [nvarchar](100) NOT NULL,
	[Отчество] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПользователь] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ИДПоставщик] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПоставщик] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПредметыВЗаказе]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПредметыВЗаказе](
	[ИДПредметыВЗаказе] [int] IDENTITY(1,1) NOT NULL,
	[ИДЗаказ] [int] NOT NULL,
	[ИДПродукт] [int] NOT NULL,
	[Колво] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПредметыВЗаказе] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукт]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукт](
	[ИДПродукт] [int] IDENTITY(1,1) NOT NULL,
	[Артикул] [nvarchar](100) NOT NULL,
	[Наименование] [nvarchar](200) NOT NULL,
	[Цена] [float] NOT NULL,
	[ЕИ] [nvarchar](50) NOT NULL,
	[ИДПроизводитель] [int] NOT NULL,
	[ИДПоставщик] [int] NOT NULL,
	[ИДКатегорияПродукта] [int] NOT NULL,
	[Скидка] [float] NOT NULL,
	[Описание] [nvarchar](500) NOT NULL,
	[Фото] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПродукт] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Производитель]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Производитель](
	[ИДПроизводитель] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПроизводитель] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПунктыВыдачи]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПунктыВыдачи](
	[ИДПунктВыдачи] [int] IDENTITY(1,1) NOT NULL,
	[КодПунткаВыдачи] [int] NOT NULL,
	[Дом] [nvarchar](50) NOT NULL,
	[Улица] [nvarchar](100) NOT NULL,
	[Город] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПунктВыдачи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РольПользователя]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РольПользователя](
	[ИДРоль] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДРоль] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[ИДПродНаСклад] [int] IDENTITY(1,1) NOT NULL,
	[ИДПродукт] [int] NOT NULL,
	[Колво] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПродНаСклад] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СтатусЗазаза]    Script Date: 25.10.2024 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СтатусЗазаза](
	[ИДСтатусЗаказ] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДСтатусЗаказ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Авторизация] ON 

INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (1, 1, 1, N'm4ic8j5qgstw@gmail.com', N'2L6KZG')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (2, 1, 2, N'd43zfg9tlsyv@gmail.com', N'uzWC67')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (3, 1, 3, N'8ohgisf6k45w@outlook.com', N'8ntwUp')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (4, 2, 4, N'hi1brwj46czx@mail.com', N'YOyhfR')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (5, 2, 5, N'fvkbcamhlj52@gmail.com', N'RSbvHv')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (6, 2, 6, N'9qxnce8jwruv@gmail.com', N'rwVDh9')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (7, 3, 7, N'dotiex942p1r@gmail.com', N'LdNyos')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (8, 3, 8, N'n0bmi2h1xral@tutanota.com', N'gynQMT')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (9, 3, 9, N'sfm3t278kdvz@yahoo.com', N'AtnDjr')
INSERT [dbo].[Авторизация] ([ИДАвторизация], [ИДРоль], [ИДПользователь], [Логин], [Пароль]) VALUES (10, 3, 10, N'ilb8rdut0v7e@mail.com', N'JlFRCZ')
SET IDENTITY_INSERT [dbo].[Авторизация] OFF
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 

INSERT [dbo].[Заказы] ([ИДЗаказ], [ИДПользователь], [НомерЗаказа], [ДатаЗаказа], [ДатаДоставки], [ИДПунктВыдачи], [КодПолучеия], [ИДСтатусЗаказа]) VALUES (1, 7, 1, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21' AS Date), 1, N'401', 1)
INSERT [dbo].[Заказы] ([ИДЗаказ], [ИДПользователь], [НомерЗаказа], [ДатаЗаказа], [ДатаДоставки], [ИДПунктВыдачи], [КодПолучеия], [ИДСтатусЗаказа]) VALUES (2, 8, 2, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22' AS Date), 3, N'402', 1)
INSERT [dbo].[Заказы] ([ИДЗаказ], [ИДПользователь], [НомерЗаказа], [ДатаЗаказа], [ДатаДоставки], [ИДПунктВыдачи], [КодПолучеия], [ИДСтатусЗаказа]) VALUES (3, 9, 3, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23' AS Date), 5, N'403', 2)
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
SET IDENTITY_INSERT [dbo].[КатегорияПродукта] ON 

INSERT [dbo].[КатегорияПродукта] ([ИДКатегорияПродукта], [Наименование]) VALUES (1, N'Спортивный инвентарь')
INSERT [dbo].[КатегорияПродукта] ([ИДКатегорияПродукта], [Наименование]) VALUES (2, N'Одежда')
SET IDENTITY_INSERT [dbo].[КатегорияПродукта] OFF
GO
SET IDENTITY_INSERT [dbo].[Пользователи] ON 

INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (1, N'Аиша', N'Пахомова', N'Анатольевна')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (2, N'Роман', N'Жуков', N'Богданович')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (3, N'Анастасия', N'Киселева', N'Максимовна')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (4, N'Арина', N'Григорьева', N'Арсентьевна')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (5, N'Лев', N'Иванов', N'Михайлович')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (6, N'Лев', N'Григорьев', N'Давидович')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (7, N'Степан', N'Поляков', N'Егорович')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (8, N'Алиса', N'Леонова', N'Кирилловна')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (9, N'Платон', N'Яковлев', N'Константинович')
INSERT [dbo].[Пользователи] ([ИДПользователь], [Имя], [Фамиллия], [Отчество]) VALUES (10, N'Ева', N'Ковалева', N'Яковлевна')
SET IDENTITY_INSERT [dbo].[Пользователи] OFF
GO
SET IDENTITY_INSERT [dbo].[Поставщики] ON 

INSERT [dbo].[Поставщики] ([ИДПоставщик], [Наименование]) VALUES (1, N'Спортмастер')
INSERT [dbo].[Поставщики] ([ИДПоставщик], [Наименование]) VALUES (2, N'Декатлон')
SET IDENTITY_INSERT [dbo].[Поставщики] OFF
GO
SET IDENTITY_INSERT [dbo].[ПредметыВЗаказе] ON 

INSERT [dbo].[ПредметыВЗаказе] ([ИДПредметыВЗаказе], [ИДЗаказ], [ИДПродукт], [Колво]) VALUES (1, 1, 1, 2)
INSERT [dbo].[ПредметыВЗаказе] ([ИДПредметыВЗаказе], [ИДЗаказ], [ИДПродукт], [Колво]) VALUES (2, 2, 3, 3)
INSERT [dbo].[ПредметыВЗаказе] ([ИДПредметыВЗаказе], [ИДЗаказ], [ИДПродукт], [Колво]) VALUES (3, 3, 5, 10)
INSERT [dbo].[ПредметыВЗаказе] ([ИДПредметыВЗаказе], [ИДЗаказ], [ИДПродукт], [Колво]) VALUES (4, 1, 5, 2)
INSERT [dbo].[ПредметыВЗаказе] ([ИДПредметыВЗаказе], [ИДЗаказ], [ИДПродукт], [Колво]) VALUES (5, 2, 6, 3)
INSERT [dbo].[ПредметыВЗаказе] ([ИДПредметыВЗаказе], [ИДЗаказ], [ИДПродукт], [Колво]) VALUES (6, 3, 7, 10)
SET IDENTITY_INSERT [dbo].[ПредметыВЗаказе] OFF
GO
SET IDENTITY_INSERT [dbo].[Продукт] ON 

INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (1, N'А112Т4', N'Боксерская груша', 778, N'шт.', 1, 1, 1, 5, N'Боксерская груша X-Match черная', N'А112Т4.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (2, N'G598Y6', N'Спортивный мат', 2390, N'шт.', 2, 2, 1, 2, N'Спортивный мат 100x100x10 см Perfetto Sport № 3 бежевый', N'G598Y6.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (3, N'F746E6', N'Шведская стенка', 9900, N'шт.', 3, 2, 1, 3, N'Шведская стенка ROMANA Next, pastel', N'F746E6.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (4, N'D830R5', N'Тренажер прыжков', 1120, N'шт.', 4, 1, 1, 4, N'Тренажер для прыжков Moby Kids Moby-Jumper со счетчиком', N'D830R5.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (5, N'B538G6', N'Спортивный костюм', 839, N'шт.', 5, 1, 2, 3, N'Спортивный костюм playToday (футболка + шорты)', N'B538G6.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (6, N'D648N7', N'Набор для хоккея', 350, N'шт.', 6, 2, 1, 4, N'Набор для хоккея Совтехстром', N'D648N7.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (7, N'F735B6', N'Игровой набор', 320, N'шт.', 6, 2, 1, 2, N'Игровой набор Совтехстром Кегли и шары', N'F735B6.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (8, N'F937G4', N'Игровой набор', 480, N'шт.', 7, 1, 1, 4, N'Набор Abtoys Бадминтон и теннис ', N'F937G4.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (9, N'E324U7', N'Велотренажер', 6480, N'шт.', 8, 1, 1, 5, N'Велотренажер двойной DFC B804 dual bike', N'E324U7.jpg')
INSERT [dbo].[Продукт] ([ИДПродукт], [Артикул], [Наименование], [Цена], [ЕИ], [ИДПроизводитель], [ИДПоставщик], [ИДКатегорияПродукта], [Скидка], [Описание], [Фото]) VALUES (10, N'G403T5', N'Тюбинг', 1450, N'шт.', 9, 1, 1, 4, N'Тюбинг Nordway, 73 см', N'G403T5.jpg')
SET IDENTITY_INSERT [dbo].[Продукт] OFF
GO
SET IDENTITY_INSERT [dbo].[Производитель] ON 

INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (1, N'X-Match')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (2, N'Perfetto Sport')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (3, N'ROMANA Next')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (4, N'Moby Kids')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (5, N'playToday')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (6, N'Совтехстром')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (7, N'Abtoys')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (8, N'DFC')
INSERT [dbo].[Производитель] ([ИДПроизводитель], [Наименование]) VALUES (9, N'Nordway')
SET IDENTITY_INSERT [dbo].[Производитель] OFF
GO
SET IDENTITY_INSERT [dbo].[ПунктыВыдачи] ON 

INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (1, 344288, N'1', N' ул. Чехова', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (2, 614164, N'30', N'  ул. Степная', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (3, 394242, N'43', N' ул. Коммунистическая', N' Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (4, 660540, N'25', N' ул. Солнечная', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (5, 125837, N'40', N' ул. Шоссейная', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (6, 125703, N'49', N' ул. Партизанская', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (7, 625283, N'46', N' ул. Победы', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (8, 614611, N'50', N' ул. Молодежная', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (9, 454311, N'19', N' ул. Новая', N'Дубна')
INSERT [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи], [КодПунткаВыдачи], [Дом], [Улица], [Город]) VALUES (10, 660007, N'19', N' ул. Октябрьская', N'Дубна')
SET IDENTITY_INSERT [dbo].[ПунктыВыдачи] OFF
GO
SET IDENTITY_INSERT [dbo].[РольПользователя] ON 

INSERT [dbo].[РольПользователя] ([ИДРоль], [Наименование]) VALUES (1, N'Администратор')
INSERT [dbo].[РольПользователя] ([ИДРоль], [Наименование]) VALUES (2, N'Менеджер')
INSERT [dbo].[РольПользователя] ([ИДРоль], [Наименование]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[РольПользователя] OFF
GO
SET IDENTITY_INSERT [dbo].[Склад] ON 

INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (1, 1, 6)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (2, 2, 16)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (3, 3, 5)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (4, 4, 8)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (5, 5, 17)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (6, 6, 7)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (7, 7, 9)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (8, 8, 12)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (9, 9, 5)
INSERT [dbo].[Склад] ([ИДПродНаСклад], [ИДПродукт], [Колво]) VALUES (10, 10, 13)
SET IDENTITY_INSERT [dbo].[Склад] OFF
GO
SET IDENTITY_INSERT [dbo].[СтатусЗазаза] ON 

INSERT [dbo].[СтатусЗазаза] ([ИДСтатусЗаказ], [Наименование]) VALUES (1, N'Новый')
INSERT [dbo].[СтатусЗазаза] ([ИДСтатусЗаказ], [Наименование]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[СтатусЗазаза] OFF
GO
ALTER TABLE [dbo].[Авторизация]  WITH CHECK ADD  CONSTRAINT [FK_Польз_Авторизац] FOREIGN KEY([ИДПользователь])
REFERENCES [dbo].[Пользователи] ([ИДПользователь])
GO
ALTER TABLE [dbo].[Авторизация] CHECK CONSTRAINT [FK_Польз_Авторизац]
GO
ALTER TABLE [dbo].[Авторизация]  WITH CHECK ADD  CONSTRAINT [FK_Роль_Авториз] FOREIGN KEY([ИДРоль])
REFERENCES [dbo].[РольПользователя] ([ИДРоль])
GO
ALTER TABLE [dbo].[Авторизация] CHECK CONSTRAINT [FK_Роль_Авториз]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Польз_Заказ] FOREIGN KEY([ИДПользователь])
REFERENCES [dbo].[Пользователи] ([ИДПользователь])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Польз_Заказ]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_ПунктВыд_Заказ] FOREIGN KEY([ИДПунктВыдачи])
REFERENCES [dbo].[ПунктыВыдачи] ([ИДПунктВыдачи])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_ПунктВыд_Заказ]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Статус_Заказ] FOREIGN KEY([ИДСтатусЗаказа])
REFERENCES [dbo].[СтатусЗазаза] ([ИДСтатусЗаказ])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Статус_Заказ]
GO
ALTER TABLE [dbo].[ПредметыВЗаказе]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_ЗакПрод] FOREIGN KEY([ИДЗаказ])
REFERENCES [dbo].[Заказы] ([ИДЗаказ])
GO
ALTER TABLE [dbo].[ПредметыВЗаказе] CHECK CONSTRAINT [FK_Заказ_ЗакПрод]
GO
ALTER TABLE [dbo].[ПредметыВЗаказе]  WITH CHECK ADD  CONSTRAINT [FK_Продукт_ПредмЗаказ] FOREIGN KEY([ИДПродукт])
REFERENCES [dbo].[Продукт] ([ИДПродукт])
GO
ALTER TABLE [dbo].[ПредметыВЗаказе] CHECK CONSTRAINT [FK_Продукт_ПредмЗаказ]
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD  CONSTRAINT [FK_Категор_Продукт] FOREIGN KEY([ИДКатегорияПродукта])
REFERENCES [dbo].[КатегорияПродукта] ([ИДКатегорияПродукта])
GO
ALTER TABLE [dbo].[Продукт] CHECK CONSTRAINT [FK_Категор_Продукт]
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD  CONSTRAINT [FK_Поставщ_Продукт] FOREIGN KEY([ИДПоставщик])
REFERENCES [dbo].[Поставщики] ([ИДПоставщик])
GO
ALTER TABLE [dbo].[Продукт] CHECK CONSTRAINT [FK_Поставщ_Продукт]
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD  CONSTRAINT [FK_Произв_Продукт] FOREIGN KEY([ИДПроизводитель])
REFERENCES [dbo].[Производитель] ([ИДПроизводитель])
GO
ALTER TABLE [dbo].[Продукт] CHECK CONSTRAINT [FK_Произв_Продукт]
GO
ALTER TABLE [dbo].[Склад]  WITH CHECK ADD  CONSTRAINT [FK_Склад_Продукт] FOREIGN KEY([ИДПродукт])
REFERENCES [dbo].[Продукт] ([ИДПродукт])
GO
ALTER TABLE [dbo].[Склад] CHECK CONSTRAINT [FK_Склад_Продукт]
GO
USE [master]
GO
ALTER DATABASE [Вар2Кириянов] SET  READ_WRITE 
GO
