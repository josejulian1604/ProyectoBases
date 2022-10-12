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
CREATE PROCEDURE Insert_MovimientoConsumo
	-- Add the parameters for the stored procedure here
	@Fecha DATE,
	@Monto MONEY,
	@IdTipoMovimiento INT,
	@IdPropiedadCCAgua INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[MovimientoConsumo]
           ([Fecha]
           ,[Monto]
           ,[IdTipoMovimiento]
           ,[IdPropiedadCCAgua])
     VALUES
           (@Fecha
		   ,@Monto
		   ,@IdTipoMovimiento
		   ,@IdPropiedadCCAgua)


END
GO