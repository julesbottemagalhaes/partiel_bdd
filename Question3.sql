SELECT athlete.nom, pays.nom FROM athlete
INNER JOIN pays ON athlete.id_pays = pays.id_pays
