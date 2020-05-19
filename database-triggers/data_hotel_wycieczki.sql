CREATE TRIGGER "Data_hotel_wycieczki" BEFORE INSERT, UPDATE
ORDER 1 ON "dba"."HotelWycieczki"
REFERENCING OLD AS old_n NEW AS new_n
FOR EACH ROW
BEGIN
    DECLARE msg LONG VARCHAR;
	IF (new_n.Data_przyjazdu < new_n.Data_wyjazdu 
        AND new_n.Data_przyjazdu >=  (SELECT W.Data_wyjazdu FROM Wycieczka W 
        WHERE W.ID_WYCIECZKI = new_n.ID_WYCIECZKI)
        AND new_n.Data_wyjazdu <= (SELECT W.Data_powrotu FROM Wycieczka W 
        WHERE W.ID_WYCIECZKI = new_n.ID_WYCIECZKI))
    THEN
        SET msg = 'Data jest poprawna';
        MESSAGE msg TO CLIENT;
    ELSE
        SET msg = 'DATA JEST NIEPOPRAWNA!';
        MESSAGE msg TO CLIENT;
        RAISERROR 23000
        'DATA JEST NIEPOPRAWNA!'
    ENDIF
END
