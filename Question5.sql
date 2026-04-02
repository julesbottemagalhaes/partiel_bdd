CREATE TRIGGER Verifier_note
BEFORE INSERT ON note
FOR EACH ROW
BEGIN
# je me suis aperçu en testant avec cette commande : INSERT INTO note (id_run, id_juge, id_critere, valeur) VALUES (15,6,4,101);
# que mon trigger ne marchait pas donc j'ai essayé avec cette autre méthode et apres les test cela marche
    IF NEW.valeur > 100 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erreur, la note ne peut pas être au dessus de 100';
    END IF;
    IF NEW.valeur < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erreur, la note ne peut pas être en dessous de 0';
    END IF;
END;
