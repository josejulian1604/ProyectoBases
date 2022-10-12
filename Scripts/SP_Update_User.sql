USE [Municipalidad]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Update_User
	-- Add the parameters for the stored procedure here
	@UserName VARCHAR(128),
	@Password VARCHAR(128),
	@TipoUsuario VARCHAR(128),
	@IdPersona INT,
	@ID INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

UPDATE [dbo].[Usuario]
   SET [UserName] = @UserName
      ,[Password] = @Password
      ,[TipoUsuario] = @TipoUsuario
      ,[IdPersona] = @IdPersona
 WHERE ID = @ID
 END