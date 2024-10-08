USE [master]
GO
/****** Object:  Database [Продажи_лекция_22_КД]    Script Date: 08.10.2024 16:24:58 ******/
CREATE DATABASE [Продажи_лекция_22_КД]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Продажи_лекция_22_КД', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Продажи_лекция_22_КД.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Продажи_лекция_22_КД_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Продажи_лекция_22_КД_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Продажи_лекция_22_КД].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ARITHABORT OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET  MULTI_USER 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET QUERY_STORE = ON
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Продажи_лекция_22_КД]
GO
/****** Object:  Table [dbo].[Архив]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Архив](
	[id_номерТовАрхив] [int] IDENTITY(1,1) NOT NULL,
	[id_тов] [int] NOT NULL,
	[Наименование] [nvarchar](200) NOT NULL,
	[Цена] [float] NOT NULL,
	[ЕИ] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_номерТовАрхив] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЖурналИзменений]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЖурналИзменений](
	[Код_изменений] [int] IDENTITY(1,1) NOT NULL,
	[Код_тов] [int] NOT NULL,
	[Операция] [nvarchar](200) NOT NULL,
	[ДатаИзменения] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_изменений] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Код_клиента] [int] NOT NULL,
	[НаименованиеКлиента] [nvarchar](50) NOT NULL,
	[ИНН] [int] NULL,
	[Город] [nvarchar](50) NULL,
	[Телефон] [nvarchar](12) NULL,
 CONSTRAINT [PK__Клиенты__3480254DE6FF36BC] PRIMARY KEY CLUSTERED 
(
	[Код_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продажи]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продажи](
	[Код_прод] [int] NOT NULL,
	[ДатаПродажи] [date] NOT NULL,
	[Код_тов] [int] NOT NULL,
	[Код_клиента] [int] NOT NULL,
	[Количество] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_прод] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[id_товНаСкладе] [int] IDENTITY(1,1) NOT NULL,
	[id_тов] [int] NOT NULL,
	[Колво] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_товНаСкладе] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[Код_тов] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Цена] [float] NOT NULL,
	[ЕИ] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_тов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Архив] ON 

INSERT [dbo].[Архив] ([id_номерТовАрхив], [id_тов], [Наименование], [Цена], [ЕИ]) VALUES (2, 1, N'Мука пшеничниная', 180, N'кг')
SET IDENTITY_INSERT [dbo].[Архив] OFF
GO
SET IDENTITY_INSERT [dbo].[ЖурналИзменений] ON 

INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (314, 16, N'Позиция изменена Конфеты', CAST(N'2024-09-27T17:23:30.167' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (315, 26, N'Позиция изменена миска супа', CAST(N'2024-09-27T17:25:57.137' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (316, 26, N'Позиция изменена миска супа', CAST(N'2024-09-27T17:25:57.137' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (317, 16, N'Позиция изменена Конфеты', CAST(N'2024-09-27T17:30:26.780' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (318, 16, N'Позиция изменена Конфеты', CAST(N'2024-09-27T17:30:26.780' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (319, 17, N'Позиция изменена ацфаваыа', CAST(N'2024-09-27T17:31:23.577' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (320, 17, N'Позиция изменена ацфаваыа', CAST(N'2024-09-27T17:31:23.577' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (321, 17, N'Позиция изменена ацфаваыа', CAST(N'2024-09-27T17:31:26.290' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (322, 17, N'Позиция изменена ацфаваыа', CAST(N'2024-09-27T17:31:26.290' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (323, 17, N'Позиция изменена ацфаваыа', CAST(N'2024-09-27T17:31:27.510' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (324, 17, N'Позиция изменена ацфаваыа', CAST(N'2024-09-27T17:31:27.510' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (325, 18, N'Позиция изменена варвылдо', CAST(N'2024-09-27T17:31:29.010' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (326, 18, N'Позиция изменена варвылдо', CAST(N'2024-09-27T17:31:29.010' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (327, 17, N'Позиция изменена ggggg', CAST(N'2024-09-27T17:32:34.057' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (328, 18, N'Позиция изменена ggggg', CAST(N'2024-09-27T17:32:42.323' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (329, 19, N'Позиция изменена g', CAST(N'2024-09-27T17:32:43.037' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (330, 20, N'Позиция изменена g', CAST(N'2024-09-27T17:32:43.477' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (331, 21, N'Позиция изменена g', CAST(N'2024-09-27T17:32:43.960' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (332, 22, N'Позиция изменена g', CAST(N'2024-09-27T17:32:44.333' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (333, 1, N'Позиция изменена Мука пшеничниная', CAST(N'2024-09-27T17:47:57.373' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (334, 1, N'Позиция изменена Мука пшеничниная', CAST(N'2024-09-27T17:47:57.373' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (335, 28, N'Позиция изменена ккк', CAST(N'2024-10-01T13:42:06.970' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (336, 28, N'Добавлена позиция ккк', CAST(N'2024-10-01T13:42:06.973' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (337, 29, N'Позиция изменена rrr', CAST(N'2024-10-01T14:47:54.950' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (338, 29, N'Добавлена позиция rrr', CAST(N'2024-10-01T14:47:54.953' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (339, 29, N'Удален товар rrr', CAST(N'2024-10-01T15:20:49.643' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (340, 9, N'Удален товар Сосиски молочные', CAST(N'2024-10-01T15:22:06.697' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (341, 29, N'Позиция изменена rar', CAST(N'2024-10-01T15:45:54.320' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (342, 29, N'Добавлена позиция rar', CAST(N'2024-10-01T15:45:54.320' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (343, 29, N'Удален товар rar', CAST(N'2024-10-01T15:47:10.900' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (344, 11, N'Удален товар 321', CAST(N'2024-10-04T17:44:36.557' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (345, 29, N'Позиция изменена rrr', CAST(N'2024-10-04T18:10:22.187' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (346, 29, N'Добавлена позиция rrr', CAST(N'2024-10-04T18:10:22.187' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (347, 29, N'Удален товар rrr', CAST(N'2024-10-04T18:14:44.773' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (348, 19, N'Удален товар g', CAST(N'2024-10-04T18:21:46.763' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (349, 21, N'Удален товар g', CAST(N'2024-10-04T18:22:50.023' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (350, 29, N'Позиция изменена rrr', CAST(N'2024-10-08T13:54:05.347' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (351, 29, N'Добавлена позиция rrr', CAST(N'2024-10-08T13:54:05.347' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (352, 30, N'Позиция изменена 15', CAST(N'2024-10-08T15:13:23.477' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (353, 30, N'Добавлена позиция 15', CAST(N'2024-10-08T15:13:23.477' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (354, 30, N'Позиция изменена shokolad', CAST(N'2024-10-08T15:13:29.863' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (355, 30, N'Позиция изменена shokoladd', CAST(N'2024-10-08T15:13:33.970' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (356, 30, N'Позиция изменена shokoladd', CAST(N'2024-10-08T15:13:45.383' AS DateTime))
INSERT [dbo].[ЖурналИзменений] ([Код_изменений], [Код_тов], [Операция], [ДатаИзменения]) VALUES (357, 30, N'Позиция изменена shokoladd', CAST(N'2024-10-08T15:13:45.383' AS DateTime))
SET IDENTITY_INSERT [dbo].[ЖурналИзменений] OFF
GO
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (1, N'ООО "Рога и копыта"', 1111111, N'Сочи', N'+79881111111')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (2, N'ИП Иванова И.И.', 258996314, N'Москва', N'+79151452236')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (3, N'ИП Пивоваров И.И.', 258996314, N'Санкт-Петербург', N'')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (4, N'ООО "Перевал"', 258996314, N'Сочи', N'587496534')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (5, N'БМСТ', 258996314, N'Санкт-Петербург', N'')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (6, N'ИП Горячкина П.П.', 258996314, N'Сочи', N'987456321')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (7, N'Ppppppp', 258996314, N'Sochi', N'+6578954211')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (8, N'Spppppp', 258996314, N'Sochi', N'+01578954211')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (10, N'Klient1', 1223134545, N'N', N'+7898955')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (11, N'Klient2', 122315, N'N', N'+7898955546')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (12, N'Klient3', 1223134545, N'N', N'+78989555')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (1245, N'ghg', 111, N'hghfh', N'777')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (1247, N'ghg', 111, N'hghfh', N'777')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (1248, N'ghg', 111, N'hghfh', N'777')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (1249, N'ghg', 111, N'hghfh', N'777')
INSERT [dbo].[Клиенты] ([Код_клиента], [НаименованиеКлиента], [ИНН], [Город], [Телефон]) VALUES (1250, N'ghg', 111, N'hghfh', N'777')
GO
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (1, CAST(N'2022-01-18' AS Date), 1, 3, 50)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (2, CAST(N'2022-01-19' AS Date), 2, 3, 22)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (3, CAST(N'2022-02-01' AS Date), 3, 1, 12)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (4, CAST(N'2022-01-19' AS Date), 2, 2, 10)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (5, CAST(N'2022-02-22' AS Date), 3, 3, 25)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (6, CAST(N'2022-02-22' AS Date), 1, 1, 4)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (7, CAST(N'2022-04-12' AS Date), 3, 1, 25)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (9, CAST(N'2022-04-15' AS Date), 1, 4, 10)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (11, CAST(N'2022-09-30' AS Date), 8, 6, 12)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (12, CAST(N'2022-09-30' AS Date), 8, 1, 1)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (13, CAST(N'2022-12-15' AS Date), 13, 1, 125.5)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (14, CAST(N'2022-12-16' AS Date), 13, 1, 100)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (15, CAST(N'2022-12-16' AS Date), 13, 1, 100)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (16, CAST(N'2022-10-12' AS Date), 16, 11, 125.5)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (17, CAST(N'2022-11-12' AS Date), 1, 11, 100)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (18, CAST(N'2022-11-22' AS Date), 1, 11, 100)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (19, CAST(N'2022-11-25' AS Date), 1, 11, 800)
INSERT [dbo].[Продажи] ([Код_прод], [ДатаПродажи], [Код_тов], [Код_клиента], [Количество]) VALUES (20, CAST(N'2022-11-26' AS Date), 1, 11, 200)
GO
SET IDENTITY_INSERT [dbo].[Склад] ON 

INSERT [dbo].[Склад] ([id_товНаСкладе], [id_тов], [Колво]) VALUES (44, 3, 500)
INSERT [dbo].[Склад] ([id_товНаСкладе], [id_тов], [Колво]) VALUES (45, 13, 20)
SET IDENTITY_INSERT [dbo].[Склад] OFF
GO
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (1, N'Мука пшеничниная', 180, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (2, N'Конфеты "Мишка"', 13843.786620802574, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (3, N'Шпроты "Штурвал"', 8306.2719724815433, N'банка')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (8, N'Мармелад "Кроха"', 4060.8440754354242, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (10, N'Сардельки "Рощинские"', 13843.786620802574, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (13, N'Конфеты_1', 28149.032795631905, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (14, N'Конфеты51', 2768.7573241605155, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (15, N'Y5Y', 28841.222126672019, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (16, N'Конфеты', 9.9, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (17, N'ggggg', 5.67, N'ео')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (18, N'ggggg', 4.86, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (20, N'g', 1562.232865194735, N'см')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (22, N'g', 26.121388032, N'kg')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (23, N'rgestj', 29.02376448, N'cm')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (24, N'vagner', 24.186470400000005, N'см')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (25, N'котлета', 8.1, N'шт')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (26, N'миска супа', 18, N'шт')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (27, N'кошкожена', 10, N'шт')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (28, N'ккк', 9, N'кг')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (29, N'rrr', 9, N'шт')
INSERT [dbo].[Товары] ([Код_тов], [Наименование], [Цена], [ЕИ]) VALUES (30, N'shokoladd', 18, N'kg')
GO
ALTER TABLE [dbo].[ЖурналИзменений] ADD  DEFAULT (getdate()) FOR [ДатаИзменения]
GO
ALTER TABLE [dbo].[Продажи]  WITH CHECK ADD  CONSTRAINT [FK__Продажи__Код_кли__4E88ABD4] FOREIGN KEY([Код_клиента])
REFERENCES [dbo].[Клиенты] ([Код_клиента])
GO
ALTER TABLE [dbo].[Продажи] CHECK CONSTRAINT [FK__Продажи__Код_кли__4E88ABD4]
GO
ALTER TABLE [dbo].[Продажи]  WITH CHECK ADD FOREIGN KEY([Код_тов])
REFERENCES [dbo].[Товары] ([Код_тов])
GO
ALTER TABLE [dbo].[Склад]  WITH CHECK ADD  CONSTRAINT [СкладТовар] FOREIGN KEY([id_тов])
REFERENCES [dbo].[Товары] ([Код_тов])
GO
ALTER TABLE [dbo].[Склад] CHECK CONSTRAINT [СкладТовар]
GO
/****** Object:  Trigger [dbo].[УменьшНаСкладеПриПродаже]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[УменьшНаСкладеПриПродаже]
on [dbo].[Продажи]
after insert
as begin

declare @КолВоКупленых float;
declare @ИдКплТов int;
set @КолВоКупленых = (select Количество from inserted)
set @ИдКплТов = (select Код_тов from inserted)
if @КолВоКупленых <=0
begin 
raiserror ('Количество проданного товара не может быть меньше или равно нулю', 16, 1)
end

else
update Склад
set Колво = Колво - @КолВоКупленых
where склад.id_тов = @ИдКплТов
end
GO
ALTER TABLE [dbo].[Продажи] ENABLE TRIGGER [УменьшНаСкладеПриПродаже]
GO
/****** Object:  Trigger [dbo].[ПроверкаОтрКол]    Script Date: 08.10.2024 16:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[ПроверкаОтрКол] 
on [dbo].[Склад]
INSTEAD OF UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE Колво < 0) > 0
    BEGIN
        RAISERROR('Количество товара не может быть отрицательным!', 16, 1);
        RETURN;
		end
		else 
		begin
		 UPDATE Склад
    SET Склад.id_тов = i.id_тов, Склад.Колво = i.Колво
    FROM Склад
    JOIN inserted i ON Склад.id_тов = i.id_тов;
    end 
	end
GO
ALTER TABLE [dbo].[Склад] ENABLE TRIGGER [ПроверкаОтрКол]
GO
/****** Object:  Trigger [dbo].[ТриггерУдаленияТовара]    Script Date: 08.10.2024 16:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ТриггерУдаленияТовара]
    ON [dbo].[Склад]
    AFTER UPDATE
AS BEGIN 
	
	DELETE FROM Склад WHERE Колво = 0
	if (select count(id_тов) from Склад where Колво = 0) > 0
	DELETE FROM Склад WHERE Колво = 0	
	
	declare @удалИдТов int 
	set @удалИдТов = (select id_тов from deleted)

	insert into Архив (id_тов, Наименование, Цена, ЕИ)
	select Код_тов, Наименование, Цена, ЕИ
	from Товары
	where Товары.Код_тов = @удалИдТов
	

END
GO
ALTER TABLE [dbo].[Склад] ENABLE TRIGGER [ТриггерУдаленияТовара]
GO
/****** Object:  Trigger [dbo].[ОбновлениеЖурнала]    Script Date: 08.10.2024 16:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create trigger [dbo].[ОбновлениеЖурнала]
on [dbo].[Товары]
after insert
as begin
insert into ЖурналИзменений(Код_тов, Операция)
select Код_тов, 'Добавлена позиция ' + Наименование
from INSERTED
end

GO
ALTER TABLE [dbo].[Товары] ENABLE TRIGGER [ОбновлениеЖурнала]
GO
/****** Object:  Trigger [dbo].[ОбновлениеЖурналаИзменений]    Script Date: 08.10.2024 16:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[ОбновлениеЖурналаИзменений]
on [dbo].[Товары]
after update
as begin
insert into ЖурналИзменений(Код_тов, Операция)
select inserted.Код_тов, 'Позиция изменена ' + inserted.Наименование
from INSERTED
join deleted on inserted.Код_тов = deleted.Код_тов
where deleted.Наименование = inserted.Наименование
end



GO
ALTER TABLE [dbo].[Товары] ENABLE TRIGGER [ОбновлениеЖурналаИзменений]
GO
/****** Object:  Trigger [dbo].[ОбновлениеЖурналаПриУдалении]    Script Date: 08.10.2024 16:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[ОбновлениеЖурналаПриУдалении]
on [dbo].[Товары]
after delete
as begin
insert into ЖурналИзменений(Код_тов, Операция)
select Код_тов, 'Удален товар ' + Наименование
from DELETED
end
GO
ALTER TABLE [dbo].[Товары] ENABLE TRIGGER [ОбновлениеЖурналаПриУдалении]
GO
/****** Object:  Trigger [dbo].[СнижениеЦены]    Script Date: 08.10.2024 16:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[СнижениеЦены]
on [dbo].[Товары]
after insert, UPDATE
as begin
UPDATE Товары
set Цена = Товары.Цена + (Товары.Цена * -0.1)
from Товары, inserted
where Товары.Код_тов = inserted.Код_тов 
end
GO
ALTER TABLE [dbo].[Товары] ENABLE TRIGGER [СнижениеЦены]
GO
USE [master]
GO
ALTER DATABASE [Продажи_лекция_22_КД] SET  READ_WRITE 
GO
