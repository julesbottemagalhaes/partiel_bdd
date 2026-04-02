SELECT athlete.id_athlete, athlete.nom, athlete.prenom, epreuve.nom, note.valeur FROM athlete
INNER JOIN participation ON athlete.id_athlete = participation.id_athlete
INNER JOIN epreuve ON participation.id_epreuve = epreuve.id_epreuve
INNER JOIN run ON epreuve.id_epreuve = run.id_epreuve
INNER JOIN note ON run.id_run = note.id_run
