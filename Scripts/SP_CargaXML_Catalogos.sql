USE [Municipalidad]
GO
/****** Object:  StoredProcedure [dbo].[CargaXML_Catalogos]    Script Date: 10/17/2022 6:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CargaXML_Catalogos]
	-- Add the parameters for the stored procedure here
	@FilePath VARCHAR(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @xml XML
	DECLARE @SQL NVARCHAR(1000)= 'SET @xml = (SELECT * FROM OPENROWSET (BULK ''' + @FilePath + ''', SINGLE_CLOB) AS XmlData)'
	--Variable que almacena el XML
    EXEC sp_executesql @SQL, N'@xml XML OUTPUT', @xml OUTPUT;

	INSERT INTO TipoMovimientoConsumo --Almacena los datos en Tabla TipoMovimientoConsumo
	SELECT
	TEMPTipoMovimientoConsumo.value('@Nombre', 'VARCHAR(128)') AS Nombre
	FROM 
	@xml.nodes('/Catalogo/TipodeMovimientoLecturadeMedidores/TipodeMovimientoLecturadeMedidor') AS TEMPTABLE(TEMPTipoMovimientoConsumo)

	-----------------------------------------------------------------------------
	
	INSERT INTO TipoTerreno --Almacena los datos en Tabla TipoTerreno
	SELECT
	TEMPTipoTerreno.value('@Nombre', 'VARCHAR(128)') AS Nombre
	FROM
	@xml.nodes('/Catalogo/TipoUsoPropiedades/TipoUsoPropiedad') AS TEMPTABLE(TEMPTipoTerreno)

	------------------------------------------------------------------------------

	INSERT INTO TipoZona --Almacena los datos en Tabla TipoZona
	SELECT
	TEMPTipoZona.value('@Nombre', 'VARCHAR(128)') AS Nombre
	FROM
	@xml.nodes('/Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') AS TEMPTABLE(TEMPTipoZona)

	-------------------------------------------------------------------------------

	INSERT INTO TipoDocIdent
	SELECT
	TEMPTipoDocIdent.value('@Nombre', 'VARCHAR(128)') AS Nombre,
	TEMPTipoDocIdent.value('@Mascara', 'VARCHAR(128)') AS Mascara
	FROM
	@xml.nodes('/Catalogo/TipoDocumentoIdentidades/TipoDocumentoIdentidad') AS TEMPTABLE(TEMPTipoDocIdent)
END