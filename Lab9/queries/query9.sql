DROP FUNCTION IF EXISTS TASK9;
GO
CREATE FUNCTION TASK9 (@COD_GRUPA INT, @IS_GOOD VARCHAR(50))
RETURNS @TABEL TABLE
(NUME VARCHAR(50), PRENUME VARCHAR(50), NOTA_MEDIE DECIMAL(10,2), IS_GOOD VARCHAR(50))
AS
BEGIN
  IF (@IS_GOOD = 'sirguincios')
  BEGIN 
  	INSERT INTO @TABEL
  	SELECT TOP 1 Nume_Student, Prenume_Student, AVG(CAST(Nota AS DECIMAL(10, 2))) AS Nota_Medie
  	FROM studenti
-----TASK 9
DROP FUNCTION IF EXISTS TASK9;
GO
CREATE FUNCTION TASK9 (@COD_GRUPA INT, @IS_GOOD VARCHAR(50))
RETURNS @TABEL TABLE
(NUME VARCHAR(50), PRENUME VARCHAR(50), NOTA_MEDIE DECIMAL(10,2), IS_GOOD VARCHAR(50))
AS
BEGIN
  IF (@IS_GOOD = 'sirguincios')
  BEGIN 
  	INSERT INTO @TABEL
  	SELECT TOP 1 Nume_Student, Prenume_Student, AVG(CAST(Nota AS DECIMAL(10, 2))) AS NOTA_MEDIE, @IS_GOOD AS IS_GOOD
  	FROM studenti.studenti_reusita A JOIN studenti.studenti B 
  	ON A.Id_Student = B.Id_Student
  	WHERE Id_Grupa = @COD_GRUPA
  	GROUP BY A.Id_Student, B.Nume_Student, B.Prenume_Student
  	ORDER BY AVG(CAST(Nota AS DECIMAL(10, 2))) DESC
  END
  ELSE IF (@IS_GOOD = 'slab')
  BEGIN
  	INSERT INTO @TABEL
  	SELECT TOP 1 Nume_Student, Prenume_Student, AVG(CAST(Nota AS DECIMAL(10, 2))) AS NOTA_MEDIE , @IS_GOOD AS IS_GOOD
  	FROM studenti.studenti_reusita A JOIN studenti.studenti B 
  	ON A.Id_Student = B.Id_Student
  	WHERE Id_Grupa = @COD_GRUPA
  	GROUP BY A.Id_Student, B.Nume_Student, B.Prenume_Student
  	ORDER BY AVG(CAST(Nota AS DECIMAL(10, 2))) ASC
  END
  RETURN
  END
GO
SELECT * FROM TASK9(1, 'sirguincios')
SELECT * FROM TASK9(1, 'slab')