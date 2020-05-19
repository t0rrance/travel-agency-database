CREATE PROCEDURE "dba"."Wycieczki_cena_od_do"(in od_ceny INTEGER, do_ceny INTEGER)
AS
BEGIN
	SELECT
        W.ID_WYCIECZKI AS Nr,
        W.Nazwa,
        W.Ilosc_miejsc,
        W.Ilosc_zajetych,
        W.Cena+(IF N.Cena IS NULL  THEN 0 ELSE N.Cena ENDIF) AS Cena,
        W.Data_wyjazdu,
        W.Data_powrotu,
        (IF N.Nazwa IS NULL  THEN 'Brak_noclegu' ELSE N.Nazwa ENDIF) AS Nocleg,
        (IF TN.Opis IS NULL  THEN 'Brak' ELSE TN.Opis ENDIF) AS Typ_noclegu,
        (IF N.Kraj IS NULL  THEN 'Brak' ELSE N.Kraj ENDIF) AS Kraj
    FROM Wycieczka W  
    LEFT JOIN (HotelWycieczki HW INNER JOIN Nocleg N 
                                    ON  N.ID_NOCLEGU = HW.ID_NOCLEGU 
                                    INNER JOIN Typ_Noclegu TN 
                                        ON N.ID_TYPU = TN.ID_TYPU)
        ON HW.ID_WYCIECZKI = W.ID_WYCIECZKI 
    WHERE  W.Cena+(IF N.Cena IS NULL  THEN 0 ELSE N.Cena ENDIF) <= do_ceny AND 
        W.Cena+(IF N.Cena IS NULL  THEN 0 ELSE N.Cena ENDIF) >= od_ceny
        AND W.Ilosc_miejsc - W.Ilosc_zajetych <> 0
    ORDER BY CENA ASC 
END