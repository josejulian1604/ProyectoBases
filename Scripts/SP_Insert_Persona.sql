USE [Municipalidad]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Insert_Persona
	-- Add the parameters for the stored procedure here
	@Nombre VARCHAR(128),
	@ValorDocId BIGINT,
	@IdTipoDoc INT,
	@Email VARCHAR(128),
	@Telefono1 BIGINT,
	@Telefono2 BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[Persona]
           ([Nombre]
           ,[ValorDocId]
           ,[IdTipoDoc]
           ,[email]
           ,[telefono1]
           ,[telefono2])
     VALUES
           (@Nombre
		   ,@ValorDocId
		   ,@IdTipoDoc
		   ,@Email
		   ,@Telefono1
		   ,@Telefono2)

END
GO
