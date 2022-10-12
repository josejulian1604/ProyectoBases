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
CREATE PROCEDURE Insert_DetalleCC
	-- Add the parameters for the stored procedure here
	@Monto MONEY,
	@IdConceptoCobro INT,
	@IdFactura INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[DetalleCC]
           ([Monto]
           ,[IdConceptoCobro]
           ,[IdFactura])
     VALUES
           (@Monto
           ,@IdConceptoCobro
           ,@IdFactura)
END