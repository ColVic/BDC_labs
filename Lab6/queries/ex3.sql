ALTER TABLE dbo.grupe ADD Sef_grupa INT, Prof_Indrumator INT;

UPDATE dbo.grupe
	SET Sef_grupa = ( SELECT TOP 1 Id_Student 
					  FROM dbo.studenti_reusita SR
					  WHERE dbo.grupe.Id_Grupa = SR.Id_Grupa
					  GROUP BY Id_Student
					  ORDER BY AVG(CONVERT(FLOAT, Nota)) DESC),
		Prof_Indrumator = ( SELECT TOP 1 Id_Profesor
							FROM dbo.studenti_reusita SR
							WHERE dbo.grupe.Id_Grupa = SR.Id_Grupa
							GROUP BY Id_Profesor
							ORDER BY COUNT(Id_Disciplina) DESC, Id_Profesor);