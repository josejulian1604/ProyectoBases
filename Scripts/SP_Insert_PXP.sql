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
CREATE PROCEDURE Insert_PXP
	-- Add the parameters for the stored procedure here
	@IdPersona INT,
	@IdPropiedad INT,
	@FechaInicio DATE,
	@FechaFin DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[PXP]
           ([IdPersona]
           ,[IdPropiedad]
           ,[FechaInicio]
           ,[FechaFin])
     VALUES
           (@IdPersona
		   ,@IdPropiedad
		   ,@FechaInicio
		   ,@FechaFin)

END
GO