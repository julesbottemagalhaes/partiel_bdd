SELECT athlete.nom, athlete.prenom, COUNT(*) AS nombre_epreuves FROM athlete
INNER JOIN participation ON athlete.id_athlete = participation.id_athlete
INNER JOIN epreuve ON participation.id_epreuve = epreuve.id_epreuve
GROUP BY athlete.id_athlete
