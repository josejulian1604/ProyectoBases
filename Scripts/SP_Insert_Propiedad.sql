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
CREATE PROCEDURE Insert_Propiedad 
	-- Add the parameters for the stored procedure here
	@Area FLOAT,
	@ValorFiscal VARCHAR(128),
	@FechaRegistro DATE,
	@IdTipoTerreno INT,
	@IdTipoZona INT,
	@IdUsuario INT,
	@NumeroFinca INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[Propiedad]
           ([Area]
           ,[ValorFiscal]
           ,[FechaRegistro]
           ,[IdTipoTerreno]
           ,[IdTipoZona]
           ,[IdUsuario]
           ,[NumeroFinca])
     VALUES
           (@Area
		   ,@ValorFiscal
		   ,@FechaRegistro
		   ,@IdTipoTerreno
		   ,@IdTipoZona
		   ,@IdUsuario
		   ,@NumeroFinca)

END
GO