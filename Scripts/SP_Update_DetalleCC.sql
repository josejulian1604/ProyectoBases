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
CREATE PROCEDURE Update_DetalleCC 
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Monto MONEY,
	@IdConceptoCobro INT,
	@IdFactura INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
UPDATE [dbo].[DetalleCC]
   SET [Monto] = @Monto
      ,[IdConceptoCobro] = @IdConceptoCobro
      ,[IdFactura] = @IdFactura
 WHERE ID = @Id
END