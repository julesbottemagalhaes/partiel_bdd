SELECT athlete.nom, pays.nom FROM athlete
INNER JOIN pays ON athlete.id_pays = pays.id_pays
INNER JOIN participation ON athlete.id_athlete = participation.id_athlete
INNER JOIN epreuve ON participation.id_epreuve = epreuve.id_epreuve
INNER JOIN run ON epreuve.id_epreuve = run.id_epreuve
WHERE run.id_epreuve IS NULL
