CREATE TRIGGER Verifier_note
BEFORE INSERT ON note
FOR EACH ROW
BEGIN
    DECLARE max_note FLOAT;
    DECLARE min_note FLOAT;
IF max_note IS NOT NULL AND NEW.valeur > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erreur, la note ne peut pas être au dessus de 100';
    END IF;
END;
