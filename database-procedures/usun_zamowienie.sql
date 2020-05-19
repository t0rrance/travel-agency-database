CREATE PROCEDURE "dba"."Usun_zamowienie"(IN ID_Z INTEGER )
AS BEGIN 
     DECLARE @licznik  INTEGER
     SET @licznik = (SELECT count(Z.ID_ZAMOWIENIA) FROM Zamowienie Z
     WHERE Z.ID_ZAMOWIENIA = ID_Z)
  
     IF (@licznik<>0) 
        BEGIN
           BEGIN TRANSACTION
           UPDATE Wycieczka W SET W.Ilosc_zajetych = W.Ilosc_zajetych - Z.Ilosc_miejsc 
           FROM Zamowienie Z INNER JOIN Wycieczka W ON Z.ID_WYCIECZKI = W.ID_WYCIECZKI 
           WHERE Z.ID_ZAMOWIENIA = ID_Z   
           DELETE FROM Jedzie J
           WHERE J.ID_ZAMOWIENIA = ID_Z 
           DELETE FROM Zamowienie Z
           WHERE Z.ID_ZAMOWIENIA = ID_Z            
           COMMIT
           MESSAGE 'ZAMOWIENIE USUNIETO!' TO CLIENT            
        END
     ELSE 
        BEGIN
           MESSAGE 'BRAK ZAMOWIENIA O PODANYM ID' TO CLIENT
           RAISERROR 23000
           'BLAD! BRAK ID!'
        END
END