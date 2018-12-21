SELECT COUNT(Nota), Nume_Student, Prenume_Student
FROM dbo.studenti
INNER JOIN dbo.studenti_reusita ON dbo.studenti_reusita.Id_Student = dbo.studenti.Id_Student
GROUP BY Nume_Student, Prenume_Student;