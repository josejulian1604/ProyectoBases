USE [Municipalidad]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Julian Gutierrez
-- Create date: 10/10/2022
-- Description:	Insertar Usuario en tabla Usario
-- =============================================
CREATE PROCEDURE Insert_User
	-- Add the parameters for the stored procedure here
	@UserName VARCHAR(128),
	@Password VARCHAR(128),
	@TipoUsuario VARCHAR (128),
	@IdPersona INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[Usuario]
           ([UserName]
           ,[Password]
           ,[TipoUsuario]
           ,[IdPersona])
     VALUES
           ( @UserName
           , @Password
           , @TipoUsuario
           , @IdPersona)
END