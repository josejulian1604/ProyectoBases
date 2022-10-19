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
CREATE PROCEDURE Update_DetalleCCAgua
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Monto MONEY,
	@IdMovimientoConsumo INT,
	@IdDetalleCC INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[DetalleCCAgua]
   SET [Monto] = @Monto
      ,[IdMovimientoConsumo] = @IdMovimientoConsumo
      ,[IdDetalleCC] = @IdDetalleCC
 WHERE ID = @Id
END