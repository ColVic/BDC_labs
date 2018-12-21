DECLARE @DISC VARCHAR(20);
DECLARE @TEST VARCHAR(20);
SET @DISC = 'Baze de date'
SET @TEST = 'Testul 1'

SELECT TOP 10 Nume_Student, Prenume_Student, Nota
FROM studenti_reusita R
INNER JOIN discipline D ON R.Id_Disciplina = D.Id_Disciplina
INNER JOIN studenti S ON R.Id_Student = S.Id_Student
WHERE Tip_Evaluare = @TEST AND Disciplina = @DISC AND Nota = IF (Nota <> 6 AND Nota <> 8, Nota, NULL)
