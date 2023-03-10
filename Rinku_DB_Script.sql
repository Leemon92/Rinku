USE [Rinku_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdEmployee]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_UpdEmployee]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveMovement]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_SaveMovement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPayrollByID]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_GetPayrollByID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMovementID]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_GetMovementID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeID]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_GetEmployeeID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployee]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_GetEmployee]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateEmployee]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP PROCEDURE [dbo].[sp_CreateEmployee]
GO
ALTER TABLE [dbo].[tbl_employes] DROP CONSTRAINT [DF_tbl_employes_Active]
GO
ALTER TABLE [dbo].[tbl_employes] DROP CONSTRAINT [DF_tbl_employes_CreationDte]
GO
ALTER TABLE [dbo].[tbl_cat_configuration] DROP CONSTRAINT [DF_tbl_cat_configuration_Active]
GO
ALTER TABLE [dbo].[tbl_cat_configuration] DROP CONSTRAINT [DF_tbl_cat_configuration_CreationDte]
GO
/****** Object:  Table [dbo].[tbl_movements]    Script Date: 09/01/2023 12:10:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_movements]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_movements]
GO
/****** Object:  Table [dbo].[tbl_employes]    Script Date: 09/01/2023 12:10:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_employes]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_employes]
GO
/****** Object:  Table [dbo].[tbl_cat_rol]    Script Date: 09/01/2023 12:10:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_cat_rol]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_cat_rol]
GO
/****** Object:  Table [dbo].[tbl_cat_configuration]    Script Date: 09/01/2023 12:10:18 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_cat_configuration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_cat_configuration]
GO
USE [master]
GO
/****** Object:  Database [Rinku_DB]    Script Date: 09/01/2023 12:10:18 a. m. ******/
DROP DATABASE [Rinku_DB]
GO
/****** Object:  Database [Rinku_DB]    Script Date: 09/01/2023 12:10:18 a. m. ******/
CREATE DATABASE [Rinku_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rinku_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Rinku_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rinku_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Rinku_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Rinku_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rinku_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rinku_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rinku_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rinku_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rinku_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rinku_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rinku_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rinku_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rinku_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rinku_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rinku_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rinku_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rinku_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rinku_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rinku_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rinku_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rinku_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rinku_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rinku_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rinku_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rinku_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rinku_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rinku_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rinku_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Rinku_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Rinku_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rinku_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rinku_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rinku_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rinku_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Rinku_DB', N'ON'
GO
ALTER DATABASE [Rinku_DB] SET QUERY_STORE = OFF
GO
USE [Rinku_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Rinku_DB]
GO
/****** Object:  Table [dbo].[tbl_cat_configuration]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cat_configuration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NOT NULL,
	[WorkDayH] [int] NULL,
	[WorkDay] [int] NULL,
	[SalaryPHour] [decimal](12, 2) NULL,
	[SalaryPShip] [decimal](12, 2) NULL,
	[Bonus] [decimal](12, 2) NULL,
	[Tax] [int] NULL,
	[ExtraTax] [int] NULL,
	[FoodVoucher] [int] NULL,
	[WeeksPMonth] [int] NULL,
	[CreationDte] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_cat_configuration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cat_rol]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cat_rol](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_cat_rol] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_employes]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[CreationDte] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[ModificationDte] [datetime] NULL,
 CONSTRAINT [PK_tbl_employes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_movements]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_movements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDEmploye] [int] NOT NULL,
	[IDMonth] [int] NOT NULL,
	[QtyShip] [int] NULL,
 CONSTRAINT [PK_tbl_movements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_cat_configuration] ON 

INSERT [dbo].[tbl_cat_configuration] ([ID], [idRol], [WorkDayH], [WorkDay], [SalaryPHour], [SalaryPShip], [Bonus], [Tax], [ExtraTax], [FoodVoucher], [WeeksPMonth], [CreationDte], [Active]) VALUES (1, 1, 8, 6, CAST(30.00 AS Decimal(12, 2)), CAST(5.00 AS Decimal(12, 2)), CAST(10.00 AS Decimal(12, 2)), 9, 3, 4, 4, CAST(N'2023-01-06T00:29:19.347' AS DateTime), 1)
INSERT [dbo].[tbl_cat_configuration] ([ID], [idRol], [WorkDayH], [WorkDay], [SalaryPHour], [SalaryPShip], [Bonus], [Tax], [ExtraTax], [FoodVoucher], [WeeksPMonth], [CreationDte], [Active]) VALUES (2, 2, 8, 6, CAST(30.00 AS Decimal(12, 2)), CAST(5.00 AS Decimal(12, 2)), CAST(5.00 AS Decimal(12, 2)), 9, 3, 4, 4, CAST(N'2023-01-06T00:29:54.320' AS DateTime), 1)
INSERT [dbo].[tbl_cat_configuration] ([ID], [idRol], [WorkDayH], [WorkDay], [SalaryPHour], [SalaryPShip], [Bonus], [Tax], [ExtraTax], [FoodVoucher], [WeeksPMonth], [CreationDte], [Active]) VALUES (3, 3, 8, 6, CAST(30.00 AS Decimal(12, 2)), CAST(5.00 AS Decimal(12, 2)), CAST(0.00 AS Decimal(12, 2)), 9, 3, 4, 4, CAST(N'2023-01-06T00:29:54.320' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_cat_configuration] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_cat_rol] ON 

INSERT [dbo].[tbl_cat_rol] ([ID], [Rol]) VALUES (1, N'Chofer')
INSERT [dbo].[tbl_cat_rol] ([ID], [Rol]) VALUES (2, N'Cargador')
INSERT [dbo].[tbl_cat_rol] ([ID], [Rol]) VALUES (3, N'Auxiliar')
SET IDENTITY_INSERT [dbo].[tbl_cat_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_employes] ON 

INSERT [dbo].[tbl_employes] ([ID], [idRol], [Name], [CreationDte], [Active], [ModificationDte]) VALUES (1, 1, N'Chofer 1', CAST(N'2023-01-06T03:03:52.103' AS DateTime), 0, CAST(N'2023-01-08T10:48:04.097' AS DateTime))
INSERT [dbo].[tbl_employes] ([ID], [idRol], [Name], [CreationDte], [Active], [ModificationDte]) VALUES (2, 2, N'Cargador 1', CAST(N'2023-01-06T13:46:58.380' AS DateTime), 0, CAST(N'2023-01-08T11:32:31.350' AS DateTime))
INSERT [dbo].[tbl_employes] ([ID], [idRol], [Name], [CreationDte], [Active], [ModificationDte]) VALUES (3, 3, N'Juan Carlos Gonzalez', CAST(N'2023-01-06T13:47:56.050' AS DateTime), 1, CAST(N'2023-01-08T11:15:09.610' AS DateTime))
INSERT [dbo].[tbl_employes] ([ID], [idRol], [Name], [CreationDte], [Active], [ModificationDte]) VALUES (1002, 3, N'Angelica Rodriguez', CAST(N'2023-01-08T11:20:30.490' AS DateTime), 1, CAST(N'2023-01-08T11:31:57.383' AS DateTime))
INSERT [dbo].[tbl_employes] ([ID], [idRol], [Name], [CreationDte], [Active], [ModificationDte]) VALUES (1003, 2, N'Rodrigo Olivares', CAST(N'2023-01-08T11:26:49.127' AS DateTime), 0, CAST(N'2023-01-08T11:29:19.320' AS DateTime))
INSERT [dbo].[tbl_employes] ([ID], [idRol], [Name], [CreationDte], [Active], [ModificationDte]) VALUES (1004, 2, N'Jose Alfredo Gzz', CAST(N'2023-01-08T11:29:50.597' AS DateTime), 1, CAST(N'2023-01-08T11:30:07.087' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_employes] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_movements] ON 

INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (1, 2, 1, 1500)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (2, 2, 2, 1241)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (3, 2, 3, 845)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (4, 1, 12, 2415)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (5, 3, 5, 85)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (6, 1002, 4, 6)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (7, 1003, 6, 999)
INSERT [dbo].[tbl_movements] ([ID], [IDEmploye], [IDMonth], [QtyShip]) VALUES (8, 2, 7, 12)
SET IDENTITY_INSERT [dbo].[tbl_movements] OFF
GO
ALTER TABLE [dbo].[tbl_cat_configuration] ADD  CONSTRAINT [DF_tbl_cat_configuration_CreationDte]  DEFAULT (getdate()) FOR [CreationDte]
GO
ALTER TABLE [dbo].[tbl_cat_configuration] ADD  CONSTRAINT [DF_tbl_cat_configuration_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[tbl_employes] ADD  CONSTRAINT [DF_tbl_employes_CreationDte]  DEFAULT (getdate()) FOR [CreationDte]
GO
ALTER TABLE [dbo].[tbl_employes] ADD  CONSTRAINT [DF_tbl_employes_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateEmployee]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 05-01-2023 >
-- Description:	< NEW EMPLOYEE>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateEmployee] 
	@idRol	INT,
	@name	VARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

    IF NOT EXISTS(SELECT * FROM [dbo].[tbl_employes] WITH(NOLOCK) WHERE upper(LTRIM(RTRIM([Name])))=upper(LTRIM(RTRIM(@name))) AND idRol=@idRol)
	BEGIN
		INSERT INTO [dbo].[tbl_employes]
		   ([idRol],[Name]) VALUES (@idRol,@name)

		SELECT SCOPE_IDENTITY() AS Result;
	END
	ELSE
	BEGIN
		SELECT '-101' AS Result
	END
	END TRY  
		BEGIN CATCH  
			SELECT  
				ERROR_NUMBER() AS ErrorNumber  
				,ERROR_SEVERITY() AS ErrorSeverity  
				,ERROR_STATE() AS ErrorState  
				,ERROR_PROCEDURE() AS ErrorProcedure  
				,ERROR_LINE() AS ErrorLine  
				,ERROR_MESSAGE() AS Result;  
	END CATCH 	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployee]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 05-01-2023 >
-- Description:	< GET EMPLOYEE>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetEmployee] 
AS
BEGIN
	SET NOCOUNT ON;

		SELECT 
		  FORMAT(A.ID ,'000000#') as EmployeeNumber    
		  ,A.Name as EmployeeName
		  ,B.Rol
		  ,CONVERT(VARCHAR(20),A.CreationDte,13) AS CreationDte
		  ,Case
			WHEN A.Active = 1 THEN 'Active'
			ELSE 'Disabled'
		   END as Active
		  ,A.Active as idActive
		  ,A.ID
		  ,A.idRol
	  FROM [dbo].[tbl_employes] A WITH(NOLOCK)
	  LEFT JOIN  [dbo].[tbl_cat_rol] B WITH(NOLOCK) ON A.idRol=B.ID
	  ORDER BY A.ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeID]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 05-01-2023 >
-- Description:	< GET EMPLOYEE>
-- =============================================
create PROCEDURE [dbo].[sp_GetEmployeeID] 
@IDEmployee		INT
AS
BEGIN
	SET NOCOUNT ON;

		SELECT A.Name, B.Rol
	  FROM [dbo].[tbl_employes] A WITH(NOLOCK)
	  LEFT JOIN  [dbo].[tbl_cat_rol] B WITH(NOLOCK) ON A.idRol=B.ID
	  WHERE A.ID=@IDEmployee

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMovementID]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 07-01-2023 >
-- Description:	< GET MOVEMENTS>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMovementID] 
@IDEmployee	INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE  @tbl_Months TABLE (ID INT, Name VARCHAR(50))

	INSERT INTO @tbl_Months
		SELECT number, DATENAME(MONTH, '1900-' + CAST(number as varchar(2)) + '-1') monthname
				FROM master..spt_values
		WHERE Type = 'P' and number between 1 and 12 ORDER BY Number

	SELECT 
		 FORMAT(B.ID,'000000#') as EmployeeNumber    
		,B.Name as EmployeeName
		,C.Name AS 'Month'
		,A.QtyShip
		,A.IDEmploye, A.IDMonth
	FROM [dbo].[tbl_movements] A WITH(NOLOCK)
		LEFT JOIN [dbo].[tbl_employes] B WITH(NOLOCK) ON A.IDEmploye=B.ID
		INNER JOIN @tbl_Months C ON A.IDMonth=C.ID
	WHERE A.IDEmploye=@IDEmployee
	ORDER BY A.IDMonth 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPayrollByID]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 06-01-2023 >
-- Description:	< GET PAYROLL >
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPayrollByID] 
@IDEmplye	INT,
@IDMonth	INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY  
	DECLARE  @tbl_Months TABLE (ID INT, Name VARCHAR(50))

	DECLARE	    @PWorkDayH          INT
			  , @PWorkDay		    INT
			  , @PSalaryPHour	    INT
			  , @PSalaryPShip	    INT
			  , @PBonus		        INT
			  , @PTax			    DECIMAL(3,2)
			  , @PExtraTax	        DECIMAL(3,2)
			  , @PFoodVoucher	    DECIMAL(3,2)
			  , @PWeeksPMonth	    INT			  
			  , @idRolUser		    INT
			  , @usr_WorkHours	    INT
			  , @usr_MonthlySalary	DECIMAL(12,2)
			  , @usr_ShipSalary	    DECIMAL(12,2)
			  , @usr_BonusSalary	DECIMAL(12,2)
			  , @usr_FoodVoucher	DECIMAL(12,2)
			  , @usr_TotalSalary    DECIMAL(12,2)
			  , @usr_Tax	        DECIMAL(12,2)
			  , @usr_ExtraTax       DECIMAL(12,2)
			  , @usr_ToPay          DECIMAL(12,2)
			  
		INSERT INTO @tbl_Months
			SELECT number, DATENAME(MONTH, '1900-' + CAST(number as varchar(2)) + '-1') monthname
					FROM master..spt_values
			WHERE Type = 'P' and number between 1 and 12 ORDER BY Number


		SET @idRolUser=(SELECT CONVERT(INT,idRol) FROM [dbo].[tbl_employes] A WITH(NOLOCK) WHERE ID=@IDEmplye)
		
		SELECT TOP 1
		       @PWorkDayH	 = [WorkDayH]   
			  ,@PWorkDay	 = [WorkDay]	
			  ,@PSalaryPHour = [SalaryPHour]	
			  ,@PSalaryPShip = [SalaryPShip]	 
			  ,@PBonus		 = [Bonus]    
			  ,@PTax		 = CONVERT(DECIMAL(3,2),(CONVERT(DECIMAL(3,2),Tax) / 100))  		
			  ,@PExtraTax	 = CONVERT(DECIMAL(3,2),(CONVERT(DECIMAL(3,2),ExtraTax) / 100))    
			  ,@PFoodVoucher = CONVERT(DECIMAL(3,2),(CONVERT(DECIMAL(3,2),FoodVoucher) / 100))   	
			  ,@PWeeksPMonth = [WeeksPMonth]
		FROM  [dbo].[tbl_cat_configuration] WITH(NOLOCK)
			 WHERE idRol=@idRolUser AND Active=1 ORDER BY ID DESC

		SELECT 
		        @usr_WorkHours	    = ((@PWorkDayH * @PWorkDay) * @PWeeksPMonth)
			  , @usr_MonthlySalary	= CONVERT(DECIMAL(12,2),(@usr_WorkHours * @PSalaryPHour))
			  , @usr_ShipSalary	    = CONVERT(DECIMAL(12,2),(@PSalaryPShip * ISNULL(QtyShip,0)))
			  , @usr_BonusSalary	= CONVERT(DECIMAL(12,2), @usr_WorkHours * @PBonus)			  
			  , @usr_TotalSalary    = CONVERT(DECIMAL(12,2),(@usr_MonthlySalary + @usr_ShipSalary + @usr_BonusSalary))
			  , @usr_FoodVoucher    = CONVERT(DECIMAL(12,2),(@usr_TotalSalary * @PFoodVoucher))
			  , @usr_Tax    = CONVERT(DECIMAL(12,2),(@usr_TotalSalary * @PTax))
			  , @usr_ExtraTax    = 
			  (
				   CASE
						WHEN @usr_TotalSalary>10000 THEN CONVERT(DECIMAL(12,2), (@usr_MonthlySalary * @PExtraTax))
						ELSE 0.00
					END
			  )
			  , @usr_ToPay = (@usr_TotalSalary - @usr_Tax - @usr_ExtraTax)
			  FROM [dbo].[tbl_employes] A WITH(NOLOCK)
				  LEFT JOIN  [dbo].[tbl_cat_rol] B WITH(NOLOCK) ON A.idRol=B.ID
				  LEFT JOIN  [dbo].[tbl_movements] C WITH(NOLOCK) ON A.ID=C.IDEmploye
				WHERE A.ID=@IDEmplye AND C.IDMonth=@IDMonth
				
			SELECT
			   FORMAT(A.ID ,'000000#') as EmployeeNumber    
			  ,A.Name as EmployeeName
			  ,B.Rol
			  ,D.Name as 'Month'
			  ,@usr_WorkHours						     as 'HoursWorked'
			  ,CONVERT(DECIMAL(12,2),@usr_MonthlySalary) as 'Salary'
			  ,CONVERT(DECIMAL(12,2),@usr_ShipSalary)    as 'PaymentDeliveries'
			  ,CONVERT(DECIMAL(12,2),@usr_BonusSalary)   as 'BonusPayment'
			  ,CONVERT(DECIMAL(12,2),@usr_FoodVoucher)   as 'FoodVouchers'			  
			  ,CONVERT(DECIMAL(12,2),@usr_TotalSalary)   as 'Total'
			  ,CONVERT(DECIMAL(12,2),@usr_Tax)			 as 'Tax'
			  ,CONVERT(DECIMAL(12,2),@usr_ExtraTax)	     as 'ExtraTax'
			  ,CONVERT(DECIMAL(12,2),@usr_ToPay)	     as 'AmountToPay'
			FROM [dbo].[tbl_employes] A WITH(NOLOCK)
				  LEFT JOIN  [dbo].[tbl_cat_rol] B WITH(NOLOCK) ON A.idRol=B.ID
				  LEFT JOIN  [dbo].[tbl_movements] C WITH(NOLOCK) ON A.ID=C.IDEmploye
				  INNER JOIN @tbl_Months D ON C.IDMonth=D.ID
				WHERE A.ID=@IDEmplye AND C.IDMonth=@IDMonth
	END TRY  
	BEGIN CATCH  
			SELECT  
				ERROR_NUMBER() AS ErrorNumber  
				,ERROR_SEVERITY() AS ErrorSeverity  
				,ERROR_STATE() AS ErrorState  
				,ERROR_PROCEDURE() AS ErrorProcedure  
				,ERROR_LINE() AS ErrorLine  
				,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveMovement]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 05-01-2023 >
-- Description:	< NEW EMPLOYEE>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveMovement] 
	@pIDEmployee	INT,
	@pIDMonth		INT,
	@pQtyShip		DECIMAL(12,2)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
    IF NOT EXISTS(SELECT * FROM [dbo].[tbl_movements] WITH(NOLOCK) WHERE [IDEmploye]=@pIDEmployee AND [IDMonth]=@pIDMonth)
	BEGIN
		INSERT INTO [dbo].[tbl_movements]
		   ([IDEmploye],[IDMonth],[QtyShip]) VALUES (@pIDEmployee,@pIDMonth,@pQtyShip)

		SELECT SCOPE_IDENTITY() AS Result
	END
	ELSE
	BEGIN
		UPDATE [dbo].[tbl_movements]
			SET QtyShip=@pQtyShip
		WHERE IDEmploye=@pIDEmployee AND IDMonth=@pIDMonth

		IF(@@ROWCOUNT > 0)
			SELECT '-501' AS Result
	END
	END TRY  
		BEGIN CATCH  
			SELECT  
				ERROR_NUMBER() AS ErrorNumber  
				,ERROR_SEVERITY() AS ErrorSeverity  
				,ERROR_STATE() AS ErrorState  
				,ERROR_PROCEDURE() AS ErrorProcedure  
				,ERROR_LINE() AS ErrorLine  
				,ERROR_MESSAGE() AS Result;  
	END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdEmployee]    Script Date: 09/01/2023 12:10:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		< ESAÚ LIMÓN >
-- Create date: < 06-01-2023 >
-- Description:	< UPD EMPLOYEE>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdEmployee] 
@P_ID		INT,
@P_idRol	INT,
@P_Name	VARCHAR(250),
@P_Status	BIT
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
			IF EXISTS(SELECT ID FROM [dbo].[tbl_employes] A WITH(NOLOCK) WHERE ID=@P_ID)
			BEGIN
				UPDATE [dbo].[tbl_employes]
				SET  idRol=@P_idRol
					,Name=@P_Name
					,Active=@P_Status
					,ModificationDte=GETDATE()
				WHERE ID=@P_ID
			
				SELECT CONVERT(VARCHAR(3),@@ROWCOUNT) AS Result
			END
			ELSE
			BEGIN
				SELECT '-101' AS Result
			END
		END TRY  
		BEGIN CATCH  
			SELECT  
				ERROR_NUMBER() AS ErrorNumber  
				,ERROR_SEVERITY() AS ErrorSeverity  
				,ERROR_STATE() AS ErrorState  
				,ERROR_PROCEDURE() AS ErrorProcedure  
				,ERROR_LINE() AS ErrorLine  
				,ERROR_MESSAGE() AS Result;  
		END CATCH 		
END
GO
USE [master]
GO
ALTER DATABASE [Rinku_DB] SET  READ_WRITE 
GO
