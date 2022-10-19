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
CREATE PROCEDURE Update_Factura
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Fecha DATE,
	@FechaVencimiento DATE,
	@TotalOriginal FLOAT,
	@TotalPagar FLOAT,
	@Estado INT,
	@IdPropiedad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[Factura]
   SET [Fecha] = @Fecha
      ,[FechaVencimiento] = @FechaVencimiento
      ,[TotalOriginal] = @TotalOriginal
      ,[TotalPagar] = @TotalPagar
      ,[Estado] = @Estado
      ,[IdPropiedad] = @IdPropiedad
 WHERE ID = @Id

END