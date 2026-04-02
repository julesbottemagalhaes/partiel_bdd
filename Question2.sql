SELECT athlete.nom, athlete.prenom FROM athlete
INNER JOIN participation ON athlete.id_athlete = participation.id_athlete
INNER JOIN epreuve ON participation.id_epreuve = epreuve.id_epreuve
