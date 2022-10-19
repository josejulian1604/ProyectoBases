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
CREATE PROCEDURE Update_MovimientoConsumo 
	-- Add the parameters for the stored procedure here
	@Id INT,
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
UPDATE [dbo].[MovimientoConsumo]
   SET [Fecha] = @Fecha
      ,[Monto] = @Monto
      ,[IdTipoMovimiento] = @IdTipoMovimiento
      ,[IdPropiedadCCAgua] = @IdPropiedadCCAgua
 WHERE ID = @Id

END