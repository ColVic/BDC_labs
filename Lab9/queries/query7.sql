DROP FUNCTION IF EXISTS TASK7;
GO
CREATE FUNCTION TASK7 (@DATE DATE)
RETURNS INT
   BEGIN
   	DECLARE @AGE INT;
   	SELECT @AGE = DATEDIFF(YEAR, @DATE,GETDATE())
   	FROM studenti.studenti
   	WHERE Data_Nastere_Student = @DATE
   RETURN @AGE
   END
GO
SELECT Nume_Student, Prenume_Student, dbo.TASK7(Data_Nastere_Student) AS VIRSTA
FROM studenti.studenti
GO