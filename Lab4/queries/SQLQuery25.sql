SELECT Cod_Grupa
FROM dbo.grupe
INNER JOIN dbo.studenti_reusita ON dbo.grupe.Id_Grupa = dbo.studenti_reusita.Id_Grupa
GROUP BY Cod_Grupa
HAVING COUNT(DISTINCT Id_Student) > 24;