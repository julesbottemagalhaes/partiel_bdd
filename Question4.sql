CREATE PROCEDURE Classement_par_epreuve()
BEGIN
    SELECT epreuve.nom, athlete.nom, athlete.prenom, AVG(note.valeur)
    FROM epreuve
    INNER JOIN participation ON epreuve.id_epreuve = participation.id_epreuve
    INNER JOIN athlete ON participation.id_athlete = athlete.id_athlete
    INNER JOIN note ON participation.id_participation = note.id_participation
    GROUP BY epreuve.id_epreuve, athlete.id_athlete
    ORDER BY AVG(note.valeur) DESC;
END;
