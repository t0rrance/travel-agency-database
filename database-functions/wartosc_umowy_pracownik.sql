CREATE FUNCTION "dba"."Wartosc_umowy_pracownik"( IN id_P INTEGER)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	 DECLARE razem INTEGER;
     DECLARE ilosc_osob INTEGER;
     DECLARE Cena_wycieczki INTEGER;
     DECLARE Cena_dodatku_wycieczki INTEGER;
     DECLARE @ID_ZAMOWIENIA INTEGER;
     DECLARE @ID_WYCIECZKI INTEGER;
     DECLARE dodatki_wycieczki integer;
     DECLARE hotel_wycieczki integer;
     DECLARE kursor CURSOR FOR
     (SELECT Z.ID_ZAMOWIENIA, Z.ID_WYCIECZKI
     FROM Zamowienie Z
     WHERE Z.ID_PRACOWNIKA = id_P);
     SET razem=0;
     SET dodatki_wycieczki = 0;
     SET HOTEL_WYCIECZKI = 0;
     OPEN kursor;
     petla: LOOP
          FETCH NEXT kursor INTO @ID_ZAMOWIENIA, @ID_WYCIECZKI;
          IF sqlcode <> 0 THEN
          leave petla END IF;           
          SET Cena_wycieczki = (SELECT Cena 
          FROM Wycieczka w
          WHERE W.ID_WYCIECZKI = @ID_WYCIECZKI);    
          SET ilosc_osob = (SELECT Ilosc_miejsc
          FROM Zamowienie Z
          WHERE Z.ID_ZAMOWIENIA = @ID_ZAMOWIENIA);
          SET dodatki_wycieczki = 
              (select SUM(IF DZ.ID_DODATKU IS NULL  THEN 0 ELSE Z.Ilosc_miejsc*D.Cena ENDIF)  
              FROM Zamowienie Z left join
              (Dodatki_zamowienia DZ   inner join Dodatki D on  D.ID_DODATKU = DZ.ID_DODATKU) 
              on Z.ID_ZAMOWIENIA = DZ.ID_ZAMOWIENIA where Z.ID_ZAMOWIENIA = @ID_ZAMOWIENIA);
          SET hotel_wycieczki = 
              (select SUM(IF N.ID_NOCLEGU IS NULL  THEN 0 ELSE Z.Ilosc_miejsc*N.Cena ENDIF)  
              FROM Zamowienie Z  inner join Wycieczka W on Z.ID_WYCIECZKI = W.ID_WYCIECZKI
              left join (HotelWycieczki HW   inner join Nocleg N on  N.ID_NOCLEGU = HW.ID_NOCLEGU)
              on HW.ID_WYCIECZKI = W.ID_WYCIECZKI where Z.ID_ZAMOWIENIA = @ID_ZAMOWIENIA);
          SET razem = razem +Cena_wycieczki*ilosc_osob + dodatki_wycieczki+ hotel_wycieczki;           
    END LOOP petla;
    CLOSE kursor;
    DEALLOCATE kursor;
    RETURN razem;
END