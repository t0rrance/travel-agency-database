CREATE PROCEDURE "dba"."Sprawdz_czy_oplacone"()
BEGIN
     DECLARE @ID_ZAMOWIENIA INTEGER;
     DECLARE @wynik INTEGER;
     DECLARE kursor CURSOR FOR
     (SELECT Z.ID_ZAMOWIENIA FROM Zamowienie Z WHERE Z.Data_platnosci
     IS NULL AND (DAYS(CURRENT DATE) - DAYS(Z.Data_zamowienia)) > 14);
     
     OPEN kursor;
     petla: LOOP
          FETCH NEXT kursor INTO @ID_ZAMOWIENIA;
          IF sqlcode <> 0 THEN leave petla END IF; 
          CALL Usun_zamowienie(@ID_ZAMOWIENIA);
          OPEN kursor;
     END LOOP petla;
     CLOSE kursor;
     DEALLOCATE kursor;
END
