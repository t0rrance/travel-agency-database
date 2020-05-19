CREATE MATERIALIZED VIEW "dba"."Hotel_dodatek"
IN "system" AS
    SELECT 
        W.ID_WYCIECZKI,
        W.Nazwa AS Nazwa_wycieczki,
        W.Cena as Cena_wycieczki,
        D.Nazwa as Dodatek_nazwa,
        D.Cena as Dodatek_cena,
        N.Nazwa as Nocleg_nazwa,
        N.Cena as Nocleg_cena
    FROM Wycieczka W 
    INNER JOIN HotelWycieczki HW 
        ON HW.ID_WYCIECZKI = W.ID_WYCIECZKI 
    INNER JOIN Nocleg N ON N.ID_NOCLEGU = HW.ID_NOCLEGU 
    INNER JOIN Dodatki_noclegu DN ON DN.ID_NOCLEGU = N.ID_NOCLEGU
    INNER JOIN Dodatki D ON D.ID_DODATKU = DN.ID_DODATKU