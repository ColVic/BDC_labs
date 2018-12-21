DROP TRIGGER IF EXISTS inregistrare_noua_noua;
GO
CREATE TRIGGER inregistrare_noua_noua ON plan_studii.orarul
	AFTER UPDATE
	AS
	IF UPDATE(Auditoriu)
	BEGIN
		SELECT DISTINCT( 'Lectia la disciplina " ' + UPPER(d.Disciplina)+
		'" de la ora ' + CAST(inserted.Ora AS VARCHAR(5)) + ' pentru grupa ' +  CAST(g.Cod_Grupa AS CHAR(6)) +
		' a fost transferat in aula ' + CAST (inserted.Auditoriu AS CHAR(3)) + ' din aula ' +  CAST (deleted.Auditoriu AS CHAR(3)))
		FROM ((inserted INNER  JOIN plan_studii.discipline d ON inserted.Id_Disciplina = d.Id_Disciplina) INNER JOIN grupe g ON inserted.Id_Grupa =  g.Id_Grupa)
			INNER JOIN plan_studii.orarul s ON inserted.Id_Disciplina = s.Id_Disciplina,
			deleted INNER JOIN plan_studii.orarul p ON deleted.Id_Disciplina = p.Id_Disciplina,
			plan_studii.orarul f
		WHERE f.Auditoriu <> inserted.Auditoriu and deleted.Auditoriu <>inserted.Auditoriu
	END;