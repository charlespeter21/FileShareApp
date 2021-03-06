USE [master]
GO
/****** Object:  Database [FILESHARE]    Script Date: 01/23/2016 12:47:56 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'FILESHARE')
BEGIN
CREATE DATABASE [FILESHARE] ON  PRIMARY 
( NAME = N'FILESHARE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\FILESHARE.mdf' , SIZE = 277504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FILESHARE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\FILESHARE_log.ldf' , SIZE = 164672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [FILESHARE] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FILESHARE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FILESHARE] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [FILESHARE] SET ANSI_NULLS OFF
GO
ALTER DATABASE [FILESHARE] SET ANSI_PADDING OFF
GO
ALTER DATABASE [FILESHARE] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [FILESHARE] SET ARITHABORT OFF
GO
ALTER DATABASE [FILESHARE] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [FILESHARE] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [FILESHARE] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [FILESHARE] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [FILESHARE] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [FILESHARE] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [FILESHARE] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [FILESHARE] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [FILESHARE] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [FILESHARE] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [FILESHARE] SET  DISABLE_BROKER
GO
ALTER DATABASE [FILESHARE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [FILESHARE] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [FILESHARE] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [FILESHARE] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [FILESHARE] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [FILESHARE] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [FILESHARE] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [FILESHARE] SET  READ_WRITE
GO
ALTER DATABASE [FILESHARE] SET RECOVERY FULL
GO
ALTER DATABASE [FILESHARE] SET  MULTI_USER
GO
ALTER DATABASE [FILESHARE] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [FILESHARE] SET DB_CHAINING OFF
GO
USE [FILESHARE]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/23/2016 12:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](50) NULL,
	[Email_Id] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[User_Group_Id] [int] NULL,
	[JoiningDate] [datetime] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 01/23/2016 12:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserGroup](
	[User_Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Group_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[User_Group_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UploadHistory]    Script Date: 01/23/2016 12:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UploadHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UploadHistory](
	[Upload_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[File_Id] [int] NULL,
	[User_Id] [int] NULL,
	[Uploaded_Date] [datetime] NULL,
 CONSTRAINT [PK_UploadHistory] PRIMARY KEY CLUSTERED 
(
	[Upload_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UploadFile]    Script Date: 01/23/2016 12:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UploadFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UploadFile](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](200) NULL,
	[FileSize] [int] NULL,
	[ContentType] [varchar](200) NULL,
	[FileExtension] [varchar](50) NULL,
	[FilePath] [varchar](max) NULL,
 CONSTRAINT [PK_UploadFile] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DownloadHistory]    Script Date: 01/23/2016 12:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DownloadHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DownloadHistory](
	[Download_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[File_Id] [int] NULL,
	[User_Id] [int] NULL,
	[Downloaded_Date] [datetime] NULL,
 CONSTRAINT [PK_DownloadHistory] PRIMARY KEY CLUSTERED 
(
	[Download_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Db_Details]    Script Date: 01/23/2016 12:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Db_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Db_Details](
	[ServerName] [varchar](50) NULL,
	[DatabaseName] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GeneratePassword]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GeneratePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 21-01-2016
-- Description:	Stored procedure to generate new password
-- =============================================
create procedure [dbo].[sp_GeneratePassword]
    @len int,
    @min tinyint = 48,
    @range tinyint = 74,
    @exclude varchar(50) = ''0:;<=>?@O[]`^\/'',
    @output varchar(50) output
as 
    declare @char char
    set @output = ''''
 
    while @len > 0 begin
       select @char = char(round(rand() * @range + @min, 0))
       if charindex(@char, @exclude) = 0 begin
           set @output += @char
           set @len = @len - 1
       end
    end
;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_FileDetailsReport]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_FileDetailsReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 18-01-2016
-- Description:	Stored procedure to get file reports
-- =============================================
CREATE PROCEDURE [dbo].[sp_FileDetailsReport]
	-- Add the parameters for the stored procedure here
	----@Key		VARCHAR(50)=NULL,
	----@FromDate	VARCHAR(50) =NULL,
	----@ToDate	VARCHAR(50) =NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	----SET @FromDate = ISNULL(@FromDate, ''20130101'')
	----SET @ToDate = ISNULL(@ToDate, GETDATE())
	
    SELECT ROW_NUMBER() Over (Order by FileID) As [S.N.],  FileName,FileExtension,
    U.User_Name, FileSize, UH.Uploaded_Date ,
    (SELECT ISNULL( COUNT (DH.File_Id),0) ) AS DownloadedCount FROM UploadFile UF 
	INNER JOIN UploadHistory UH ON UF.FileID=UH.File_Id 
	INNER JOIN Users U ON U.User_Id=UH.User_Id
	LEFT JOIN DownloadHistory DH ON DH.File_Id=UF.FileID
	------WHERE @Key IS NULL OR UF.FileName LIKE  ''%''+@Key+''%''
	------AND UH.Uploaded_Date BETWEEN convert(datetime,@FromDate, 120) AND convert(datetime,@ToDate, 120)
	GROUP BY UF.FileID, UF.FileName, UF.FileExtension,UF.FileSize,
	u.User_Name,UH.Uploaded_Date 
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DownloadFile]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DownloadFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 17-01-2016
-- Description:	Save Details  of download history
-- =============================================
CREATE PROCEDURE [dbo].[sp_DownloadFile] 
	-- Add the parameters for the stored procedure here
	@UserId		int,
	@FileId		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO DownloadHistory (User_Id,File_Id, Downloaded_Date) 
	VALUES(@UserId,@FileId,SYSDATETIME())
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateNewUser]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CreateNewUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 21-01-2016
-- Description:	StoredProcedure to create new user
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateNewUser] 
	-- Add the parameters for the stored procedure here
	@Username		Varchar(50),
	@Email			Nvarchar(50),
	@FirstName		varchar(50),
	@Lastname		Varchar(50),
	@Password		varchar(MAX),
	@UsergroupId	Int
	
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	Insert into Users (User_Name,Password,FirstName,LastName,Email_Id,User_Group_Id,JoiningDate)
	Values(@Username,@Password,@FirstName,@Lastname,@Email,@UsergroupId,GETDATE())
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckUser]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CheckUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckUser]
	-- Add the parameters for the stored procedure here
	@username		Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT  COUNT(*) AS UserCount from Users where USER_NAME=@username
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckLogin]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CheckLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 17-01-2016
-- Description:	Check Login
-- =============================================
CREATE PROCEDURE [dbo].[sp_CheckLogin]
	@UserName NVARCHAR(128), 
	@Password NVARCHAR(512)
 
AS
BEGIN
 
IF EXISTS(SELECT U.User_Group_Id FROM Users U
 WHERE u.User_Name = @username AND 
 u.password = @password)
 BEGIN
    SELECT ''true'' AS UserExists
    
    SELECT U.User_Group_Id,U.User_Id,u.Email_Id,u.User_Name FROM Users U
	WHERE u.User_Name = @username AND 
	u.password = @password
  END  
ELSE
    SELECT ''false'' AS UserExists

END
		

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePassword]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdatePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 21-01-2016
-- Description:	Stored procedure to update password
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdatePassword]
	-- Add the parameters for the stored procedure here
	@UserName			varchar(50),
	--@CurrentPassword	varchar(50),
	@NewPassword		varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set Password=@NewPassword
	where USER_NAME=@UserName 
	
	if @@ROWCOUNT=0
	return -1;
	
	return 0;
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertFileDetails]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertFileDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 17/01/2015
-- Description:	Stored Procedure to insert details into Uploadfile Table and Upload history Table
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertFileDetails]
	-- Add the parameters for the stored procedure here
	@FileName		VARCHAR(200),
	@FileSize		INT ,
	@FileExtension	VARCHAR(50),
	@ContentType	VARCHAR(200)=NULL,
	@FilePath		VARCHAR(200),
	@UserId			INT
	
	
	
AS
BEGIN
	DECLARE @FileID INT
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY
			-- Insert statements for procedure here
			INSERT INTO UploadFile (FileName, FileSize,FileExtension,ContentType,FilePath) 
			VALUES (@FileName,@FileSize,@FileExtension,@ContentType,@FilePath)
			
			SELECT @FileID= SCOPE_IDENTITY()
			
			INSERT INTO UploadHistory(File_Id,User_Id,Uploaded_Date)
			VALUES(@FileID,@UserId,SYSDATETIME())
			COMMIT
		END TRY
			
		BEGIN CATCH
			ROLLBACK TRAN
		END CATCH 
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDetails]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetUserDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 18-01-2016
-- Description:	Stored procedure to get file reports
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserDetails] 
	-- Add the parameters for the stored procedure here
	--@Key		VARCHAR(50)=NULL,
	--@FromDate	VARCHAR(50) =NULL,
	--@ToDate	VARCHAR(50) =NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	----SET @FromDate = ISNULL(@FromDate, ''20130101'')
	----SET @ToDate = ISNULL(@ToDate, GETDATE())

    -- Insert statements for procedure here
	SELECT ROW_NUMBER() Over (Order by U.User_Id) As [S.N.],
	u.User_Name,u.Email_Id,
	CONVERT(datetime, U.JoiningDate, 103)  AS JoiningDate 
	FROM Users U 

	--WHERE @Key IS NULL OR U.User_Name LIKE  ''%''+@Key+''%''
	--AND U.JoiningDate BETWEEN convert(datetime,@FromDate, 120) AND convert(datetime,@ToDate, 120)
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserCount]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetUserCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 18-01-2016
-- Description:	Get Count of Users
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserCount] 
	
	
AS
BEGIN
	Declare @UserCount int
	SET NOCOUNT ON;

    SELECT @UserCount= COUNT(USER_ID) FROM Users
	Return @UserCount
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUploadHistory]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetUploadHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 18-01-2016
-- Description:	Stored procedure to get Upload reports
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUploadHistory]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT ROW_NUMBER() OVER(ORDER BY U.USER_NAME) AS [S.N.],  U.User_Name, UF.FileName, UH.Uploaded_Date

    FROM UploadHistory UH INNER JOIN 
	 Users U ON UH.User_Id=U.User_Id ,
	 UploadFile UF 
	 Where UH.File_Id=UF.FileID and
	 U.User_Id=UH.User_Id
	 Group By U.User_Name,UF.FileName,UH.Uploaded_Date
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUploadCount]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetUploadCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetUploadCount] 
	
	
AS
BEGIN
	Declare @UploadCount int
	SET NOCOUNT ON;

    SELECT @UploadCount = COUNT(FILE_ID) FROM UploadHistory
	Return @UploadCount
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFileDetailsSearch]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetFileDetailsSearch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 17-01-2016
-- Description:	Stored procedure to get all file details  after search
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetFileDetailsSearch]
	-- Add the parameters for the stored procedure here
	@Key		VARCHAR(MAX)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ROW_NUMBER() Over (Order by FileID) As [S.N.], UF.FileID, FileName,FileExtension,U.User_Name, FileSize FROM UploadFile UF 
	INNER JOIN UploadHistory UH ON UF.FileID=UH.File_Id 
	INNER JOIN Users U ON U.User_Id=UH.User_Id
	WHERE  UF.FileName LIKE  ''%''+@Key+''%'' OR U.User_Name LIKE  ''%''+@Key+''%''
     
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFileDetails]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetFileDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 17-01-2016
-- Description:	Stored procedure to get all file details
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetFileDetails]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ROW_NUMBER() Over (Order by FileID) As [S.N.], UF.FileID, FileName,FileExtension,U.User_Name, FileSize FROM UploadFile UF 
	INNER JOIN UploadHistory UH ON UF.FileID=UH.File_Id 
	INNER JOIN Users U ON U.User_Id=UH.User_Id
     
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDownloadHistory]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDownloadHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 18-01-2016
-- Description:	Stored procedure to get Download reports
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetDownloadHistory]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT ROW_NUMBER()OVER(ORDER BY U.USER_NAME) AS [S.N.],  U.User_Name, UF.FileName, DH.Downloaded_Date,
COUNT( *) As [NumOfDownloads]
    FROM DownloadHistory DH INNER JOIN 
	 Users U ON DH.User_Id=U.User_Id 
	 inner join UploadFile UF on UF.FileID=DH.File_Id
	 
	 Where DH.File_Id=UF.FileID and
	 Dh.User_Id=DH.User_Id
	 Group By U.User_Name,UF.FileName,DH.Downloaded_Date
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDownloadCount]    Script Date: 01/23/2016 12:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetDownloadCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Charles Peter
-- Create date: 18-01-2016
-- Description:	Get Count of download
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetDownloadCount] 
	
	
AS
BEGIN
	Declare @DownloadCount int
	SET NOCOUNT ON;

    SELECT @DownloadCount= COUNT(FILE_ID) FROM DownloadHistory
	Return @DownloadCount
END
' 
END
GO
