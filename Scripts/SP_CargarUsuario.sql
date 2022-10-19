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
CREATE PROCEDURE CargarUsuario

	@data_xml	XML

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE
		@index		INT = 0,
		@countOps	INT		

	-- Contar num operaciones
	SET @countOps = (SELECT COUNT(*) FROM @data_xml.nodes('Datos/Operacion') T(item))
	DECLARE @tempUsuario TABLE(
			[UserName]		VARCHAR(128),
			[Password]		VARCHAR(128),
			[TipoUsuario]	VARCHAR(128),
			[IdPersona]		INT
			)

	WHILE (@index < @countOps)
	BEGIN
		SET @index = @index + 1;

		INSERT INTO @tempUsuario(UserName, Password, TipoUsuario, IdPersona)
		SELECT
			item.value('@Username', 'VARCHAR(128)')		AS UserName,
			item.value('@Password', 'VARCHAR(128)')		AS Password,
			item.value('@TipoUsuario', 'VARCHAR(128)')	AS TipoUsuario,
			P.ID										AS IdPersona
			FROM @data_xml.nodes('Datos/Operacion[sql:variable("@index")]/Usuario/Usuario') T(item)
			INNER JOIN dbo.Persona P ON P.ValorDocId = T.item.value('@ValorDocumentoIdentidad', 'BIGINT')
	END
	INSERT INTO dbo.Usuario
	SELECT * FROM @tempUsuario
END
GO