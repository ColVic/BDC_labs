DROP PROCEDURE IF EXISTS OUTPUTPAR;
GO
CREATE PROCEDURE OUTPUTPAR
	@Nrstud INT OUTPUT
AS
	SELECT @Nrstud = Count(Distinct(Id_Student))
	FROM plan_studii.discipline AS C, studenti.studenti_reusita AS D
	WHERE Nota < '5' AND Nota IS NOT NULL

DROP PROCEDURE IF EXISTS dbo.spINSERT_universitatea;

DECLARE @value INT,
		@Nrstud INT

EXEC @value = [dbo].[OUTPUTPAR]
	 @Nrstud = @Nrstud OUTPUT

SELECT @Nrstud as N'@Nrstur'

SELECT 'Return value = ' = @value;