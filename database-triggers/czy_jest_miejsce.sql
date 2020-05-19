CREATE TRIGGER "Czy_jest_miejsce" BEFORE INSERT, UPDATE
ORDER 1 ON "dba"."Zamowienie"
REFERENCING OLD AS old_name NEW AS new_n 
FOR EACH ROW 
BEGIN 
    DECLARE roznica integer;
    IF (new_n.Ilosc_miejsc + (SELECT W.Ilosc_zajetych FROM Wycieczka W WHERE new_n.ID_WYCIECZKI = W.ID_WYCIECZKI)
        <= (SELECT W.Ilosc_miejsc FROM Wycieczka W WHERE new_n.ID_WYCIECZKI = W.ID_WYCIECZKI) ) THEN 
        MESSAGE 'Ilosc miejsc jest wystarczajaca' TO CLIENT;
        UPDATE Wycieczka W SET Ilosc_zajetych = Ilosc_zajetych + new_n.Ilosc_miejsc 
        WHERE W.ID_WYCIECZKI = new_n.ID_WYCIECZKI
    ELSE
        IF ((SELECT W.Ilosc_zajetych FROM Wycieczka W WHERE new_n.ID_WYCIECZKI = W.ID_WYCIECZKI)
            = (SELECT W.Ilosc_miejsc FROM Wycieczka W WHERE new_n.ID_WYCIECZKI = W.ID_WYCIECZKI) )    THEN
            RAISERROR 23000
           'BRAK MIEJSC!'
        ELSE         
            SET roznica = ((SELECT W.Ilosc_miejsc FROM Wycieczka W WHERE new_n.ID_WYCIECZKI = W.ID_WYCIECZKI)
            -(SELECT W.Ilosc_zajetych FROM Wycieczka W WHERE new_n.ID_WYCIECZKI = W.ID_WYCIECZKI));
            MESSAGE 'Mozesz wykupic maksymalnie wykupic: '||roznica||' miejsc!'TO CLIENT; 
            RAISERROR 23000
            'BLAD W LICZBIE UCZESTNIKOW!'
        ENDIF
   ENDIF   
END