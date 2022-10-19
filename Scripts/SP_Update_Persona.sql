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
CREATE PROCEDURE Update_Persona
	-- Add the parameters for the stored procedure here
	@Id INT,
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
UPDATE [dbo].[Persona]
   SET [Nombre] = @Nombre
      ,[ValorDocId] = @ValorDocId
      ,[IdTipoDoc] = @IdTipoDoc
      ,[email] = @Email
      ,[telefono1] = @Telefono1
      ,[telefono2] = @Telefono2
 WHERE ID = @Id

END