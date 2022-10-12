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
CREATE PROCEDURE Insert_PropiedadXCC
	-- Add the parameters for the stored procedure here
	@IdPropiedad INT,
	@IdConceptoCobro INT,
	@FechaInicio DATE,
	@FechaFin DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[PropiedadXCC]
           ([IdPropiedad]
           ,[IdConceptoCobro]
           ,[FechaInicio]
           ,[FechaFin])
     VALUES
           (@IdPropiedad
		   ,@IdConceptoCobro
		   ,@FechaInicio
		   ,@FechaFin)

END
GO