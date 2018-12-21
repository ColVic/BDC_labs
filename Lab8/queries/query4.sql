--test for first view

SELECT * 
FROM dbo.ex1
GO
ALTER TABLE studenti.studenti DROP COLUMN Data_Nastere_Student
GO
--test second view

SELECT * 
FROM dbo.ex2
GO
ALTER TABLE plan_studii.discipline DROP COLUMN Disciplina
GO