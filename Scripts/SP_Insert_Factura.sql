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
CREATE PROCEDURE Insert_Factura
	-- Add the parameters for the stored procedure here
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
	
INSERT INTO [dbo].[Factura]
           ([Fecha]
           ,[FechaVencimiento]
           ,[TotalOriginal]
           ,[TotalPagar]
           ,[Estado]
           ,[IdPropiedad])
     VALUES
           (@Fecha
           ,@FechaVencimiento
           ,@TotalOriginal
           ,@TotalPagar
           ,@Estado
           ,@IdPropiedad)

END
