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
CREATE PROCEDURE Insert_PropiedadCCAgua
	-- Add the parameters for the stored procedure here
	@NombreMedidor VARCHAR(128),
	@SaldoAcumulado MONEY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[PropiedadCCAgua]
           ([NombreMedidor]
           ,[SaldoAcumulado])
     VALUES
           (@NombreMedidor
		   ,@SaldoAcumulado)

END
GO