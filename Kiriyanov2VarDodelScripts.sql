USE [master]
GO
/****** Object:  Database [Вар2Кириянов]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[Авторизация]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[Артикул]    Script Date: 01.11.2024 2:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Артикул](
	[ИДАртикул] [int] IDENTITY(1,1) NOT NULL,
	[Артикул] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДАртикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[КатегорияПродукта]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[Пользователи]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[Поставщики]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[ПредметыВЗаказе]    Script Date: 01.11.2024 2:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПредметыВЗаказе](
	[ИДПредметыВЗаказе] [int] IDENTITY(1,1) NOT NULL,
	[ИДЗаказ] [int] NOT NULL,
	[Колво] [int] NOT NULL,
	[ИДАртикул] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПредметыВЗаказе] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукт]    Script Date: 01.11.2024 2:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукт](
	[ИДПродукт] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](200) NOT NULL,
	[Цена] [float] NOT NULL,
	[ЕИ] [nvarchar](50) NOT NULL,
	[ИДПроизводитель] [int] NOT NULL,
	[ИДПоставщик] [int] NOT NULL,
	[ИДКатегорияПродукта] [int] NOT NULL,
	[Скидка] [float] NOT NULL,
	[МаксимальнаяСкидка] [float] NOT NULL,
	[Описание] [nvarchar](500) NOT NULL,
	[Фото] [text] NOT NULL,
	[ИДАртикул] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПродукт] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Производитель]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[ПунктыВыдачи]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[РольПользователя]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[Склад]    Script Date: 01.11.2024 2:08:53 ******/
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
/****** Object:  Table [dbo].[СтатусЗазаза]    Script Date: 01.11.2024 2:08:53 ******/
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
ALTER TABLE [dbo].[ПредметыВЗаказе]  WITH CHECK ADD  CONSTRAINT [FK_Артикул_ПредмЗак] FOREIGN KEY([ИДАртикул])
REFERENCES [dbo].[Артикул] ([ИДАртикул])
GO
ALTER TABLE [dbo].[ПредметыВЗаказе] CHECK CONSTRAINT [FK_Артикул_ПредмЗак]
GO
ALTER TABLE [dbo].[ПредметыВЗаказе]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_ЗакПрод] FOREIGN KEY([ИДЗаказ])
REFERENCES [dbo].[Заказы] ([ИДЗаказ])
GO
ALTER TABLE [dbo].[ПредметыВЗаказе] CHECK CONSTRAINT [FK_Заказ_ЗакПрод]
GO
ALTER TABLE [dbo].[Продукт]  WITH CHECK ADD  CONSTRAINT [FK_Артикул_Прод] FOREIGN KEY([ИДАртикул])
REFERENCES [dbo].[Артикул] ([ИДАртикул])
GO
ALTER TABLE [dbo].[Продукт] CHECK CONSTRAINT [FK_Артикул_Прод]
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
