USE [master]
GO
/****** Object:  Database [ГКДорогиРосии]    Script Date: 10.10.2024 3:24:24 ******/
CREATE DATABASE [ГКДорогиРосии]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ГКДорогиРосии', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ГКДорогиРосии.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ГКДорогиРосии_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ГКДорогиРосии_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ГКДорогиРосии] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ГКДорогиРосии].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ГКДорогиРосии] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET ARITHABORT OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ГКДорогиРосии] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ГКДорогиРосии] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ГКДорогиРосии] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ГКДорогиРосии] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ГКДорогиРосии] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ГКДорогиРосии] SET  MULTI_USER 
GO
ALTER DATABASE [ГКДорогиРосии] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ГКДорогиРосии] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ГКДорогиРосии] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ГКДорогиРосии] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ГКДорогиРосии] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ГКДорогиРосии] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ГКДорогиРосии] SET QUERY_STORE = ON
GO
ALTER DATABASE [ГКДорогиРосии] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ГКДорогиРосии]
GO
/****** Object:  Table [dbo].[Должность]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должность](
	[ИДДолжность] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеДолжности] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДДолжность] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ДолжностьСотрудникаПодразделения]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ДолжностьСотрудникаПодразделения](
	[IDДолжСотрПодразд] [int] IDENTITY(1,1) NOT NULL,
	[ИДСотрудник] [int] NOT NULL,
	[РабочийТелефон] [char](17) NOT NULL,
	[Кабинет] [nvarchar](50) NOT NULL,
	[ИДДолжность] [int] NOT NULL,
	[ИДСтруктурноеПодразделение] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDДолжСотрПодразд] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КалендарьОтсутсвия]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КалендарьОтсутсвия](
	[ИДКалендарьОтсутсвия] [int] IDENTITY(1,1) NOT NULL,
	[ИДСотрудник] [int] NOT NULL,
	[ДатаНачала] [date] NOT NULL,
	[ДатаКонца] [date] NOT NULL,
	[ИДПричинаОтсутсвия] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДКалендарьОтсутсвия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КлассификацияОбучения]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КлассификацияОбучения](
	[ИДКлассификацияОбучение] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеКлассОбучения] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДКлассификацияОбучение] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обучение]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обучение](
	[ИДОбучение] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеОбучения] [nvarchar](50) NOT NULL,
	[ИДКлассификацияОбучение] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДОбучение] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ОбучениеСотрудника]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ОбучениеСотрудника](
	[ИДОбучениеСотрудников] [int] IDENTITY(1,1) NOT NULL,
	[ИДОбучение] [int] NOT NULL,
	[ИДСотрудник] [int] NOT NULL,
	[ДатаНачала] [date] NOT NULL,
	[ДатаКонца] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДОбучениеСотрудников] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПричинаОстутсвия]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПричинаОстутсвия](
	[ИДПричинаОтсутсвия] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеПричОтсутсв] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДПричинаОтсутсвия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Событие]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Событие](
	[ИДСобытия] [int] IDENTITY(1,1) NOT NULL,
	[НаименовСобытия] [nvarchar](100) NOT NULL,
	[ДатаСобытитя] [date] NOT NULL,
	[ИДСтруктурноеПодразделение] [int] NOT NULL,
	[ИДДолжность] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДСобытия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ИДСотрудник] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[ЭлектроннаяПочта] [nvarchar](50) NOT NULL,
	[МобильныйТелефон] [char](17) NOT NULL,
	[ДатаРождения] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДСотрудник] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СтруктурноеПодразделение]    Script Date: 10.10.2024 3:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СтруктурноеПодразделение](
	[ИДСтруктурноеПодразделение] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеСтруктПодразд] [nvarchar](10) NOT NULL,
	[КорпоративнаяПочта] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ИДСтруктурноеПодразделение] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ДолжностьСотрудникаПодразделения]  WITH CHECK ADD  CONSTRAINT [FK_Должность_ДолжСотрудн] FOREIGN KEY([ИДДолжность])
REFERENCES [dbo].[Должность] ([ИДДолжность])
GO
ALTER TABLE [dbo].[ДолжностьСотрудникаПодразделения] CHECK CONSTRAINT [FK_Должность_ДолжСотрудн]
GO
ALTER TABLE [dbo].[ДолжностьСотрудникаПодразделения]  WITH CHECK ADD  CONSTRAINT [FK_Подраздел_ДолжСотрудн] FOREIGN KEY([ИДСтруктурноеПодразделение])
REFERENCES [dbo].[СтруктурноеПодразделение] ([ИДСтруктурноеПодразделение])
GO
ALTER TABLE [dbo].[ДолжностьСотрудникаПодразделения] CHECK CONSTRAINT [FK_Подраздел_ДолжСотрудн]
GO
ALTER TABLE [dbo].[ДолжностьСотрудникаПодразделения]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_ДолжнСотрудника] FOREIGN KEY([ИДСотрудник])
REFERENCES [dbo].[Сотрудники] ([ИДСотрудник])
GO
ALTER TABLE [dbo].[ДолжностьСотрудникаПодразделения] CHECK CONSTRAINT [FK_Сотрудник_ДолжнСотрудника]
GO
ALTER TABLE [dbo].[КалендарьОтсутсвия]  WITH CHECK ADD  CONSTRAINT [FK_ПричОтсутсв_КалендОтсутсв] FOREIGN KEY([ИДПричинаОтсутсвия])
REFERENCES [dbo].[ПричинаОстутсвия] ([ИДПричинаОтсутсвия])
GO
ALTER TABLE [dbo].[КалендарьОтсутсвия] CHECK CONSTRAINT [FK_ПричОтсутсв_КалендОтсутсв]
GO
ALTER TABLE [dbo].[КалендарьОтсутсвия]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_КалендОтсутсв] FOREIGN KEY([ИДСотрудник])
REFERENCES [dbo].[Сотрудники] ([ИДСотрудник])
GO
ALTER TABLE [dbo].[КалендарьОтсутсвия] CHECK CONSTRAINT [FK_Сотрудник_КалендОтсутсв]
GO
ALTER TABLE [dbo].[Обучение]  WITH CHECK ADD  CONSTRAINT [FK_ОБучение_КлассОбуч] FOREIGN KEY([ИДКлассификацияОбучение])
REFERENCES [dbo].[КлассификацияОбучения] ([ИДКлассификацияОбучение])
GO
ALTER TABLE [dbo].[Обучение] CHECK CONSTRAINT [FK_ОБучение_КлассОбуч]
GO
ALTER TABLE [dbo].[ОбучениеСотрудника]  WITH CHECK ADD  CONSTRAINT [FK_ОБучение_ОбучСотрудн] FOREIGN KEY([ИДОбучение])
REFERENCES [dbo].[Обучение] ([ИДОбучение])
GO
ALTER TABLE [dbo].[ОбучениеСотрудника] CHECK CONSTRAINT [FK_ОБучение_ОбучСотрудн]
GO
ALTER TABLE [dbo].[ОбучениеСотрудника]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_ОбучСотрудн] FOREIGN KEY([ИДСотрудник])
REFERENCES [dbo].[Сотрудники] ([ИДСотрудник])
GO
ALTER TABLE [dbo].[ОбучениеСотрудника] CHECK CONSTRAINT [FK_Сотрудник_ОбучСотрудн]
GO
ALTER TABLE [dbo].[Событие]  WITH CHECK ADD  CONSTRAINT [FK_Событие_Должность] FOREIGN KEY([ИДДолжность])
REFERENCES [dbo].[Должность] ([ИДДолжность])
GO
ALTER TABLE [dbo].[Событие] CHECK CONSTRAINT [FK_Событие_Должность]
GO
ALTER TABLE [dbo].[Событие]  WITH CHECK ADD  CONSTRAINT [FK_Событие_Подраздел] FOREIGN KEY([ИДСтруктурноеПодразделение])
REFERENCES [dbo].[СтруктурноеПодразделение] ([ИДСтруктурноеПодразделение])
GO
ALTER TABLE [dbo].[Событие] CHECK CONSTRAINT [FK_Событие_Подраздел]
GO
USE [master]
GO
ALTER DATABASE [ГКДорогиРосии] SET  READ_WRITE 
GO
