CREATE FUNCTION "dba"."Propozycja_wyjazdu"(IN @id_klient INTEGER)
RETURNS INTEGER
DETERMINISTIC
BEGIN  
    DECLARE wynik INTEGER;
    IF NOT EXISTS (SELECT J.ID_ZAMOWIENIA FROM Jedzie J
    WHERE J.ID_KLIENTA = @id_klient)
    THEN
        SET wynik = 0;
        RETURN 0;
    ELSE    
        BEGIN
        DECLARE srednia NUMERIC;
        DECLARE @ID_WYCIECZKI INTEGER;
        DECLARE kursor CURSOR FOR
        (SELECT W.ID_WYCIECZKI FROM WYCIECZKA W);

        SET srednia = (SELECT ROUND(AVG(
            (SELECT SUM(IF N.ID_NOCLEGU IS NULL THEN 0 ELSE N.Cena ENDIF)
            FROM Zamowienie Z INNER JOIN Wycieczka W ON Z.ID_WYCIECZKI = W.ID_WYCIECZKI
            LEFT JOIN (HotelWycieczki HW INNER JOIN Nocleg N on N.ID_NOCLEGU = HW.ID_NOCLEGU)
            ON HW.ID_WYCIECZKI = W.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = Zamowienie.ID_ZAMOWIENIA) +
            Wycieczka.Cena), 2)

        FROM
        Jedzie J INNER JOIN Zamowienie ON Zamowienie.ID_Zamowienia = J.ID_Zamowienia
        INNER JOIN Wycieczka ON Zamowienie.ID_WYCIECZKI = Wycieczka.ID_WYCIECZKI
        WHERE J.ID_KLIENTA = @id_klient);

    SET wynik = (SELECT W.ID_Wycieczki FROM Wycieczka W WHERE W.ID_Wycieczki = 1);

    OPEN kursor;
    petla: LOOP
        FETCH NEXT kursor INTO @ID_Wycieczki;
        IF sqlcode <> 0 THEN
        LEAVE petla END IF;

        IF((SELECT ABS((SELECT(SELECT SUM(IF N.ID_NOCLEGU IS NULL THEN 0 ELSE N.Cena ENDIF)
        FROM Wycieczka W LEFT JOIN (HotelWycieczki HW INNER JOIN Nocleg N ON N.ID_NOCLEGU = HW.ID_NOCLEGU)
        ON HW.ID_WYCIECZKI = W.ID_WYCIECZKI AND W.ID_WYCIECZKI = Wycieczka.ID_WYCIECZKI) + Wycieczka.Cena
        FROM Wycieczka WHERE Wycieczka.ID_WYCIECZKI = @ID_Wycieczki) - srednia))
        <
        (SELECT ABS((SELECT(SELECT SUM(IF N.ID_NOCLEGU IS NULL THEN 0 ELSE N.Cena ENDIF)
        FROM Wycieczka W LEFT JOIN (HotelWycieczki HW INNER JOIN Nocleg N ON N.ID_NOCLEGU = HW.ID_NOCLEGU)
        ON HW.ID_WYCIECZKI = W.ID_WYCIECZKI AND W.ID_WYCIECZKI = Wycieczka.ID_WYCIECZKI) + Wycieczka.Cena
        FROM Wycieczka WHERE Wycieczka.ID_WYCIECZKI = wynik) - srednia)))
        THEN
            SET wynik = @ID_Wycieczki;
        ENDIF
        END LOOP petla;
        CLOSE kursor;
        DEALLOCATE kursor;
    END
    ENDIF;
RETURN wynik;
END