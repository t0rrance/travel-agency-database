CREATE VIEW "dba"."Pracownik_wartosc_zamowien"
AS
    SELECT 
        P.ID_PRACOWNIKA as ID_Pracownika,
        P.Imie as Imie,
        P.Nazwisko as Nazwisko,
        count(Z.ID_ZAMOWIENIA)  as Ilosc_umow,
        Wartosc_umowy_pracownik(P.ID_PRACOWNIKA) as Przychod
    FROM 
        Pracownik P left join Zamowienie Z on P.ID_PRACOWNIKA = Z.ID_PRACOWNIKA
    GROUP BY 
        ID_Pracownika,
        Imie,
        Nazwisko,
        Przychod
    ORDER BY Przychod DESC


CREATE VIEW "dba"."Zamowienia" AS
    SELECT
        Zamowienie.ID_ZAMOWIENIA AS NR,
        Zamowienie.Ilosc_miejsc AS Ilosc_osob,
        Zamowienie.Data_zamowienia,
        Zamowienie.Data_platnosci,
        Wycieczka.Nazwa,
        (SELECT SUM(IF DZ.ID_DODATKU IS NULL  THEN 0 ELSE Z.Ilosc_miejsc*D.Cena ENDIF)  
    FROM Zamowienie Z 
    LEFT JOIN (Dodatki_zamowienia DZ INNER JOIN Dodatki D ON D.ID_DODATKU = DZ.ID_DODATKU) 
        ON Z.ID_ZAMOWIENIA = DZ.ID_ZAMOWIENIA WHERE Z.ID_ZAMOWIENIA = Zamowienie.ID_ZAMOWIENIA) AS Dodatki,
            (SELECT SUM(IF N.ID_NOCLEGU IS NULL  THEN 0 ELSE Z.Ilosc_miejsc*N.Cena ENDIF)  
    FROM Zamowienie Z  INNER JOIN Wycieczka W ON Z.ID_WYCIECZKI = W.ID_WYCIECZKI
    LEFT JOIN (HotelWycieczki HW INNER JOIN Nocleg N ON  N.ID_NOCLEGU = HW.ID_NOCLEGU)
        ON HW.ID_WYCIECZKI = W.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = Zamowienie.ID_ZAMOWIENIA)as Nocleg,
            Wycieczka.Cena*Zamowienie.ilosc_miejsc AS Wycieczka,
            Wycieczka +Dodatki+Nocleg AS Razem
    FROM Zamowienie  
    INNER JOIN Wycieczka  
        ON Zamowienie.ID_WYCIECZKI = Wycieczka.ID_WYCIECZKI