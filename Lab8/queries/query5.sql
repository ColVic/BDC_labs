WITH cte1 AS (SELECT * FROM studenti.studenti)
SELECT * 
FROM cte1;
WITH cte2 AS (SELECT Disciplina, AVG(Nota) AS AvgMark 
			  FROM plan_studii.discipline AS C, studenti.studenti_reusita AS D
			  WHERE C.Id_Disciplina = D.Id_Disciplina and Tip_Evaluare = 'Examen'
			  GROUP BY Disciplina
		      HAVING AVG(Nota) >7.0)
SELECT * FROM cte2
ORDER BY Disciplina DESC;