USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 1/16/2021 11:38:31 AM ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital', N'ON'
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[Cleaner]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cleaner](
	[EGN] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EGN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[EGN] [bigint] NOT NULL,
	[DoctorQualification] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EGN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EGN] [bigint] NOT NULL,
	[EName] [varchar](20) NOT NULL,
	[ELastName] [varchar](20) NOT NULL,
	[Salary] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EGN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse](
	[EGN] [bigint] NOT NULL,
	[NurseQualification] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EGN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PEGN] [bigint] NOT NULL,
	[PName] [varchar](20) NOT NULL,
	[PLastName] [varchar](20) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[DEGN] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PEGN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[RecordID] [int] NOT NULL,
	[RecordDate] [date] NOT NULL,
	[PEGN] [bigint] NOT NULL,
	[HospitalEntry] [smalldatetime] NOT NULL,
	[HospitalExit] [smalldatetime] NOT NULL,
	[Diagnosis] [varchar](20) NOT NULL,
	[TreatmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNumber] [int] NOT NULL,
	[RoomType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomCleaner]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomCleaner](
	[CEGN] [bigint] NOT NULL,
	[RoomNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CEGN] ASC,
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomNurse]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomNurse](
	[NEGN] [bigint] NOT NULL,
	[RoomNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NEGN] ASC,
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment](
	[TreatmentID] [int] NOT NULL,
	[TreatmentType] [varchar](20) NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TreatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 1/16/2021 11:38:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] NOT NULL,
	[UnitName] [varchar](20) NOT NULL,
	[Manager] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cleaner] ([EGN]) VALUES (7508543858)
INSERT [dbo].[Cleaner] ([EGN]) VALUES (7937057921)
INSERT [dbo].[Cleaner] ([EGN]) VALUES (8205390611)
INSERT [dbo].[Cleaner] ([EGN]) VALUES (8705316035)
INSERT [dbo].[Cleaner] ([EGN]) VALUES (9058930647)
INSERT [dbo].[Cleaner] ([EGN]) VALUES (9309569268)
INSERT [dbo].[Cleaner] ([EGN]) VALUES (9490586350)
GO
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (5219315567, N'Oncologist')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (5617251098, N'Endocrinologist')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (6018012390, N'Nephrologist')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (6720110434, N'Gastroenterologist')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (7216081956, N'Cardiologist')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (7413240124, N'Oncologist')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (8415278901, N'Pediatrician')
INSERT [dbo].[Doctor] ([EGN], [DoctorQualification]) VALUES (9014092511, N'Cardiologist')
GO
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (5219315567, N'Elena', N'Bogdanova', 3500)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (5617251098, N'Marin', N'Petkov', 4100)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (6018012390, N'Alexander', N'Ivanov', 4100)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (6720110434, N'Martin', N'Ivanov', 3350)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7216081956, N'Kalina', N'Georgieva', 3860)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7322231568, N'Krasimira', N'Georgieva', 1600)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7413240124, N'Konstantin', N'Marinov', 2900)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7508543858, N'Alex', N'Tomov', 1150)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7517021164, N'Vladimir', N'Alexandrov', 1800)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7716032709, N'Boyan', N'Atanasov', 2000)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (7937057921, N'Yordan', N'Malinov', 1250)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (8205390611, N'Mladen', N'Gergov', 1300)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (8415278901, N'Ivan', N'Petrov', 3500)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (8705316035, N'Angel', N'Krasimirov', 1000)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (8714288826, N'Kalin', N'Nenchev', 1500)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (8715220456, N'Maya', N'Ivanova', 1900)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (8825142294, N'Anna', N'Krasimirova', 1600)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (9014092511, N'Marya', N'Kamenova', 2850)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (9016222010, N'Raya', N'Antonova', 1650)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (9058930647, N'Lydia', N'Borisova', 1100)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (9224190324, N'Nevena', N'Karapetrova', 1800)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (9309569268, N'Rangel', N'Yordanov', 1550)
INSERT [dbo].[Employee] ([EGN], [EName], [ELastName], [Salary]) VALUES (9490586350, N'Magdalena', N'Boeva', 1200)
GO
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (7322231568, N'Critical Care Nurse')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (7517021164, N'Registered Nurse')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (7716032709, N'Pediatric Nurse')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (8714288826, N'Registered Nurse')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (8715220456, N'CRNA')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (8825142294, N'Cardiac Nurse')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (9016222010, N'Oncology Nurse')
INSERT [dbo].[Nurse] ([EGN], [NurseQualification]) VALUES (9224190324, N'Registered Nurse')
GO
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (1098568201, N'Gergana', N'Petrova', 186, 8415278901)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (2028150324, N'Georgi', N'Dimitrov', 186, 8415278901)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (4826551257, N'Marya', N'Koleva', 156, 5219315567)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (4934120403, N'Petar', N'Georgiev', 154, 7413240124)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (5419290013, N'Militsa', N'Petrova', 111, 9014092511)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (6319301107, N'Momchil', N'Petkov', 111, 7216081956)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (7827092568, N'Ivan', N'Ivanov', 135, 6720110434)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (8916235899, N'Elitsa', N'Alexandrova', 160, 6018012390)
INSERT [dbo].[Patient] ([PEGN], [PName], [PLastName], [RoomNumber], [DEGN]) VALUES (9825110678, N'Alexandra', N'Marinova', 251, 5617251098)
GO
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (11784, CAST(N'2020-11-15' AS Date), 7827092568, CAST(N'2020-11-15T15:19:00' AS SmallDateTime), CAST(N'2020-11-19T11:04:00' AS SmallDateTime), N'Gastroparesis', 23)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (12979, CAST(N'2020-09-12' AS Date), 5419290013, CAST(N'2020-09-12T11:20:00' AS SmallDateTime), CAST(N'2020-09-30T10:56:00' AS SmallDateTime), N'(CAD)', 12)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (29586, CAST(N'2020-11-12' AS Date), 6319301107, CAST(N'2020-11-12T19:02:00' AS SmallDateTime), CAST(N'2020-11-26T09:12:00' AS SmallDateTime), N'Cardiomyopathy', 27)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (38794, CAST(N'2020-09-25' AS Date), 8916235899, CAST(N'2020-09-25T22:03:00' AS SmallDateTime), CAST(N'2020-10-01T11:22:00' AS SmallDateTime), N'Ataxia', 44)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (46983, CAST(N'2020-09-13' AS Date), 9825110678, CAST(N'2020-09-14T00:01:00' AS SmallDateTime), CAST(N'2020-09-19T10:30:00' AS SmallDateTime), N'Thyrotoxicosis', 15)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (49047, CAST(N'2020-12-22' AS Date), 4826551257, CAST(N'2020-12-22T14:03:00' AS SmallDateTime), CAST(N'2021-01-04T13:57:00' AS SmallDateTime), N'Leukemia', 34)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (58937, CAST(N'2020-11-07' AS Date), 4934120403, CAST(N'2020-11-07T09:25:00' AS SmallDateTime), CAST(N'2020-11-10T10:02:00' AS SmallDateTime), N'Lymphoma', 46)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (67363, CAST(N'2020-12-03' AS Date), 2028150324, CAST(N'2020-12-03T16:45:00' AS SmallDateTime), CAST(N'2020-12-10T10:05:00' AS SmallDateTime), N'Bronchitis', 10)
INSERT [dbo].[Record] ([RecordID], [RecordDate], [PEGN], [HospitalEntry], [HospitalExit], [Diagnosis], [TreatmentID]) VALUES (73401, CAST(N'2021-01-03' AS Date), 1098568201, CAST(N'2021-01-03T13:29:00' AS SmallDateTime), CAST(N'2021-01-07T10:10:00' AS SmallDateTime), N'Flu', 10)
GO
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (111, N'Ward')
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (135, N'Deluxe')
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (154, N'Ward')
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (156, N'Deluxe')
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (160, N'Deluxe')
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (186, N'Ward')
INSERT [dbo].[Room] ([RoomNumber], [RoomType]) VALUES (251, N'Ward')
GO
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (7508543858, 186)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (7937057921, 154)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (8205390611, 160)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (8205390611, 251)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (8705316035, 111)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (8705316035, 186)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (9058930647, 156)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (9058930647, 251)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (9309569268, 154)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (9309569268, 160)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (9490586350, 111)
INSERT [dbo].[RoomCleaner] ([CEGN], [RoomNumber]) VALUES (9490586350, 135)
GO
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (7322231568, 156)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (7322231568, 251)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (7517021164, 186)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (7716032709, 160)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (7716032709, 186)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (8714288826, 251)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (8715220456, 154)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (8715220456, 156)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (8825142294, 111)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (8825142294, 135)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (9016222010, 154)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (9016222010, 160)
INSERT [dbo].[RoomNurse] ([NEGN], [RoomNumber]) VALUES (9224190324, 111)
GO
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (10, N'Antibiotics', 55.3)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (12, N'CABG', 15000)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (15, N'Radioactive iodine', 500)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (23, N'Prochlorperazine', 1550.5)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (27, N'Pacemaker', 17000)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (34, N'Splenectomy', 29500)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (44, N'Acetazolamide', 330.5)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentType], [Price]) VALUES (46, N'Chemotherapy', 2250)
GO
INSERT [dbo].[Unit] ([UnitID], [UnitName], [Manager]) VALUES (1109, N'Cardiology', 7216081956)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [Manager]) VALUES (5799, N'Neuro-ICU', 6018012390)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [Manager]) VALUES (5904, N'PICU', 8415278901)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [Manager]) VALUES (6432, N'Gastroenterology', 6720110434)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [Manager]) VALUES (8729, N'Endocrinology', 5617251098)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [Manager]) VALUES (9603, N'Oncology', 5219315567)
GO
/****** Object:  Index [UQ__Record__5E860D37D1FFCB76]    Script Date: 1/16/2021 11:38:31 AM ******/
ALTER TABLE [dbo].[Record] ADD UNIQUE NONCLUSTERED 
(
	[PEGN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Unit__B01A6905E9CE8725]    Script Date: 1/16/2021 11:38:31 AM ******/
ALTER TABLE [dbo].[Unit] ADD UNIQUE NONCLUSTERED 
(
	[Manager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cleaner]  WITH CHECK ADD FOREIGN KEY([EGN])
REFERENCES [dbo].[Employee] ([EGN])
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([EGN])
REFERENCES [dbo].[Employee] ([EGN])
GO
ALTER TABLE [dbo].[Nurse]  WITH CHECK ADD FOREIGN KEY([EGN])
REFERENCES [dbo].[Employee] ([EGN])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([DEGN])
REFERENCES [dbo].[Doctor] ([EGN])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD FOREIGN KEY([PEGN])
REFERENCES [dbo].[Patient] ([PEGN])
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD FOREIGN KEY([TreatmentID])
REFERENCES [dbo].[Treatment] ([TreatmentID])
GO
ALTER TABLE [dbo].[RoomCleaner]  WITH CHECK ADD FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[RoomCleaner]  WITH CHECK ADD FOREIGN KEY([CEGN])
REFERENCES [dbo].[Cleaner] ([EGN])
GO
ALTER TABLE [dbo].[RoomNurse]  WITH CHECK ADD FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[RoomNurse]  WITH CHECK ADD FOREIGN KEY([NEGN])
REFERENCES [dbo].[Nurse] ([EGN])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([Manager])
REFERENCES [dbo].[Doctor] ([EGN])
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
