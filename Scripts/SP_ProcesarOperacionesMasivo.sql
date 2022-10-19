-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE ProcesarOperacionesMasivo

	@data_xml	XML

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE
		@index		INT = 0,
		@countOps	INT		

	-- Contar num operaciones
	SET @countOps = (SELECT COUNT(*) FROM @data_xml.nodes('Datos/Operacion') T(item))
	DECLARE @tempPersonas TABLE(
			[Nombre]		VARCHAR(128),
			[ValorDocId]	BIGINT,
			[IdTipoDoc]		INT,
			[email]			VARCHAR(128),
			[telefono1]		BIGINT,
			[telefono2]		BIGINT
	)

	DECLARE @tempPropiedad TABLE(
			[Area]			FLOAT,
			[ValorFiscal]	VARCHAR(128),
			[FechaRegistro]	DATE,
			[IdTipoTerreno]	INT,
			[IdTipoZona]	INT,
			[IdUsuario]		INT,
			[NumeroFinca]	INT)

	WHILE (@index < @countOps)
	BEGIN
		SET @index = @index + 1;

		INSERT INTO @tempPersonas(Nombre,ValorDocId,IdTipoDoc,email,telefono1,telefono2)
			SELECT
			item.value('@Nombre','VARCHAR(128)')			AS	'Nombre',
			item.value('@ValorDocumentoIdentidad','BIGINT')	AS	'ValorDocId',
			C.ID											AS	'IdTipoDoc',
			item.value('@Email','VARCHAR(128)')				AS	'email',
			item.value('@Telefono1','BIGINT')				AS	'telefono1',
			item.value('@Telefono2','BIGINT')				AS	'telefono2'
			FROM @data_xml.nodes('Datos/Operacion[sql:variable("@index")]/Personas/Persona') T(item)
			INNER JOIN dbo.TipoDocIdent C
			ON C.Nombre = T.Item.value('@TipoDocumentoIdentidad', 'VARCHAR(128)')
		CONTINUE
	END
	INSERT INTO dbo.Persona
	SELECT * FROM @tempPersonas
END

DECLARE @data		TABLE(result XML)
DECLARE @statement	VARCHAR(MAX)
DECLARE @xml		XML

SET @statement = 'SELECT * FROM OPENROWSET(BULK ''C:\DBI\ProyectoPt1\Operaciones.xml'', SINGLE_CLOB) as xmlData' 
INSERT INTO @data EXEC(@statement)
SELECT @xml = result FROM @data 
EXEC ProcesarOperacionesMasivo @xml

SELECT * FROM Persona
DELETE Persona