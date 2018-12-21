CREATE PROCEDURE dbo.spINSERT_universitatea
	@Id INT = '210',
	@Name VARCHAR(50) = 'Agapi',
	@Surmane VARCHAR(50) = 'Ionela',
	@Birth DATE = '2010-12-12',
	@Address VARCHAR(500) = NULL,
	@Grupa CHAR(6) = 'INF171'
AS

INSERT INTO studenti.studenti
	(Id_Student, Nume_Student,Prenume_Student,Data_Nastere_Student,Adresa_Postala_Student)
VALUES (@Id, @Name, @Surmane, @Birth, @Address)


INSERT INTO studenti.studenti_reusita (Id_Student,Id_Disciplina,Id_Profesor,Id_Grupa,Tip_Evaluare,Nota,Data_Evaluare)
VALUES (@Id, 105, 110, (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = @Grupa), N'Examen', NULL, NULL)

EXECUTE dbo.spINSERT_universitatea;