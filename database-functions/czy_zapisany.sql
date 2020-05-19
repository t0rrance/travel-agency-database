CREATE FUNCTION "dba"."Czy_zapisany"( IN @id_klient integer, @id_zam integer)
RETURNS INTEGER
DETERMINISTIC  
BEGIN
	 DECLARE wynik INTEGER;   
     IF NOT EXISTS(SELECT J.ID_ZAMOWIENIA FROM Jedzie J
     WHERE J.ID_KLIENTA = @id_klient) 
     THEN 
         SET wynik = 0;
         RETURN 0;
     ELSE 
         BEGIN           
         DECLARE @ID_ZAMOWIENIA INTEGER;         
         DECLARE kursor CURSOR FOR
         (SELECT J.ID_ZAMOWIENIA 
         FROM Jedzie J
         WHERE J.ID_KLIENTA = @id_klient);
         SET wynik = 0;
         OPEN kursor;
         petla: LOOP
             FETCH NEXT kursor INTO @ID_ZAMOWIENIA;
             IF sqlcode <> 0 THEN
             leave petla END IF;   

             IF EXISTS(SELECT Z.ID_ZAMOWIENIA FROM Zamowienie Z INNER JOIN Wycieczka W 
                 ON Z.ID_WYCIECZKI = W.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @ID_ZAMOWIENIA AND

                 (W.Data_wyjazdu > (SELECT W.Data_wyjazdu FROM Zamowienie Z INNER JOIN 
                 Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam )                 
                 AND W.Data_wyjazdu < (SELECT W.Data_powrotu FROM Zamowienie Z INNER JOIN 
                 Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)                         
                 OR
                 W.Data_wyjazdu < (SELECT W.Data_wyjazdu FROM Zamowienie Z INNER JOIN 
                 Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)
                 AND W.Data_powrotu > (SELECT W.Data_powrotu FROM Zamowienie Z INNER JOIN 
                 Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)
                 OR
                 W.Data_powrotu > (SELECT W.Data_wyjazdu FROM Zamowienie Z INNER JOIN 
                 Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)
                 AND W.Data_powrotu < (SELECT W.Data_powrotu FROM Zamowienie Z INNER JOIN 
                 Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam))) 
              THEN                
                 SET wynik =(SELECT Z.ID_ZAMOWIENIA FROM Zamowienie Z INNER JOIN Wycieczka W 
                     ON Z.ID_WYCIECZKI = W.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @ID_ZAMOWIENIA AND

                     (W.Data_wyjazdu > (SELECT W.Data_wyjazdu FROM Zamowienie Z INNER JOIN 
                     Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam )                 
                     AND W.Data_wyjazdu < (SELECT W.Data_powrotu FROM Zamowienie Z INNER JOIN 
                     Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)                         
                     OR
                     W.Data_wyjazdu < (SELECT W.Data_wyjazdu FROM Zamowienie Z INNER JOIN 
                     Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)
                     AND W.Data_powrotu > (SELECT W.Data_powrotu FROM Zamowienie Z INNER JOIN 
                     Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)
                     OR
                     W.Data_powrotu > (SELECT W.Data_wyjazdu FROM Zamowienie Z INNER JOIN 
                     Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)
                     AND W.Data_powrotu < (SELECT W.Data_powrotu FROM Zamowienie Z INNER JOIN 
                     Wycieczka W ON W.ID_WYCIECZKI = Z.ID_WYCIECZKI WHERE Z.ID_ZAMOWIENIA = @id_zam)));                            
             ENDIF
             END LOOP petla;
             CLOSE kursor;
             DEALLOCATE kursor;                          
          END
          ENDIF;   
    	  RETURN wynik;
END