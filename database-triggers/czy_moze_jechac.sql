CREATE TRIGGER "Czy_moze_jechac" BEFORE INSERT, UPDATE
ORDER 1 ON "dba"."Jedzie"
REFERENCING OLD AS old_name NEW AS new_n 
FOR EACH ROW 
BEGIN
    IF((SELECT Czy_zapisany(new_n.ID_KLIENTA, new_n.ID_ZAMOWIENIA))= 0) THEN
          MESSAGE 'Poprawnie wporwadzono.' TO CLIENT;
    ELSE 
         MESSAGE 'Klient zapisany w tym czasie na wyjazd o ID: '
         ||(SELECT Czy_zapisany(new_n.ID_KLIENTA, new_n.ID_ZAMOWIENIA))||'.' TO CLIENT;
         RAISERROR 23000
         'Blad!'
    endif
END