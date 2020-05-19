INSERT INTO dba.Slownik_dodatkow(ID_SLOWNIKA,Opis)
VALUES (1,'Wycieczka'),
(2,'Nocleg');


INSERT INTO dba.Dodatki(ID_DODATKU,ID_SLOWNIKA,Nazwa,Cena)
VALUES (1,1,'Lot balonem',1000),
(2,1,'Safari',4500),
(3,1,'Nurkowanie',2000),
(4,1,'Wycieczka objazdowa miasta',300),
(5,1,'Zwiedzanie muze�w',120),
(6,2,'Aquapark',500),
(7,2,'Siłownia',400),
(8,2,'Pełne wyżywienie',1000),
(9,2,'Śniadanie i obiad',700),
(10,2,'SPA',500);


INSERT INTO dba.Typ_Noclegu(ID_TYPU,Opis)
VALUES (1,'Hotel'),
(2,'Pensjonat'),
(3,'Domek letniskowy');


INSERT INTO dba.Nocleg(ID_NOCLEGU,ID_TYPU,Ulica,Nr,Kod,Miejscowosc,Kraj,Nazwa,Standard,Telefon,Cena)
VALUES (1,1,'Nassari','15','05-264','Giza','Egipt','Nootel',5,'548987895',450),
(4,1,'Rue de Rivoli','564','98-293','Paryż','Francja','Mercue',5,'938472123',780),
(5,1,'Rua Augusta','98','25-394','Lizbona','Portugalia','Ramada',5,'393874731',1000),
(6,2,'De Crosa','164','58-874','Lizbona','Portugalia','Star',3,'394830239',650),
(7,3,'Donde','875','25-456','Lizbona','Portugalia','Matras',2,'885746392',150),
(8,1,'Lacaje','78','23-698','Madryt','Hiszpania','Novotel',5,'948372943',450),
(9,2,'Decaje','12','36-785','Malaga','Hiszspania','Sofitel',4,'874732843',700),
(10,1,'Macaro','63','08-233','Malaga','Hiszpania','Marriott',5,'564736523',650),
(11,1,'Holia','232','09-322','Amsterdam','Holandia','Marriott',5,'888555333',780);


INSERT INTO dba.Klient(ID_KLIENTA,Ulica,Nr,Kod,Miejscowosc,Kraj,Pesel,Imie,Nazwisko,Telefon)
VALUES (1,'Kaliskiego','13','01-480','Warszawa','Polska','98021212345','Karol','Sagan','518091132'),
(2,'Nowa','1','01-234','Warszawa','Polska','84010112345','Eryk','Blar','997997997'),
(3,'Kopernika','234','08-981','Łódź','Polska','76042223459','Martyna','Śruba','523098655'),
(4,'Słoneczna','5A','02-123','Kraków','Polska','77032800011','Karolina','Czartoryska','888333666'),
(5,'Kaliskiego','13','01-480','Warszawa','Polska','56051199992','Michał','Mystkowski','999222111'),
(6,'Leśna','23','12-454','Olsztyn','Polska','72081018111','Małgorzata','Mistrz','844323444'),
(7,'Koralowa','44','03-222','Gdańk','Polska','55041375284','Andrzej','Mroczek','111222333'),
(8,'Kolska','65','32-644','Warszawa','Polska','75090389285','Michał','Bułhakow','943721893'),
(9,'Królewska','7','43-335','Kołobrzeg','Polska','91102728743','Weronika','Kowalska','993847332'),
(10,'Pańska','87','66-753','Wrocław','Polska','97051073596','Marek','Jankowski','938222343'),
(11,'Krucza','34','21-525','Wrocław','Polska','85110337664','Arkadiusz','Izdebski','584777333'),
(12,'Mroczna','22','33-222','Poznań','Polska','87042193413','Paulina','Kuras','811232323'),
(13,'Koha','33','53-555','Berlin','Niemcy','63091338469','Martyna','Fortepian','876554111'),
(14,'Kartezjusza','1C/422','01-480','Warszawa','Polska','90070211136','Krzysztof','Zdrowowicz','720816234'),
(15,'Górczewska','3','66-234','Gdańsk','Polska','97040436854','Wiktoria','Mała','049383743'),
(16,'Kwiatowa','6','09-663','Warszawa','Polska','94052427256','Kamila','Kureta','223222222');


INSERT INTO dba.Wycieczka(ID_WYCIECZKI,Nazwa,Ilosc_miejsc,Ilosc_zajetych,Cena,Data_wyjazdu,Data_powrotu)
VALUES (1,'3 dni w Egipcie',30,11,1450,'2018-09-16 00:00','2018-09-22 00:00'),
(2,'Paryż w pigułce',20,0,4500,'2018-06-18 00:00','2018-06-26 00:00'),
(3,'Wczasy w Portugalii',15,15,12000,'2018-08-15 00:00','2018-08-28 00:00'),
(4,'Weekend w Hiszpanii',30,30,2389,'2018-05-11 00:00','2018-05-13 00:00'),
(5,'Wyjazd do Włoch',15,3,2500,'2018-05-12 00:00','2018-05-15 00:00'),
(6,'Wyjazd do Czech',10,0,3000,'2018-06-06 00:00','2018-06-26 00:00'),
(7,'Wczasy na Chorwacji',40,0,5000,'2018-04-26 00:00','2018-05-15 00:00'),
(8,'10 dni na Chorwacji',30,3,7000,'2018-04-10 00:00','2018-04-21 00:00'),
(9,'Weekend w Paryżu',20,4,1200,'2018-05-18 00:00','2018-05-20 00:00'),
(10,'Weekend w Pradze',15,10,1000,'2018-06-15 00:00','2018-06-17 00:00'),
(11,'Holandia w pigułce',40,15,4500,'2018-09-14 00:00','2018-09-20 00:00');


INSERT INTO dba.Pracownik(ID_PRACOWNIKA,Ulica,Nr,Kod,Miejscowosc,Kraj,Pesel,Imie,Nazwisko,Telefon)
VALUES (1,'Krucza','456','06-231','Warszawa','Polska','51021286571','Marek','Nowak','999555888'),
(2,'Jaskócza','23','04-342','Pruszków','Polska','75092386945','Angelika','Jurek','777888663'),
(3,'Browarna','90','07-234','Marki','Polska','89112767926','Anna','Nirwa','645777333'),
(4,'Jakaś','22','15-898','Poznań','Polska','84081648115','Karol','Mrok','857464822')


INSERT INTO dba.Zamowienie(ID_ZAMOWIENIA,ID_KLIENTA,ID_WYCIECZKI,ID_PRACOWNIKA,Ilosc_miejsc,Data_zamowienia,Data_platnosci)
VALUES (1,1,1,2,2,'2018-01-15 00:00','2018-01-20 00:00'),
(2,2,3,2,2,'2018-01-01 00:00','2018-01-02 00:00'),
(3,4,1,3,5,'2018-02-03 00:00','2018-02-07 00:00'),
(4,15,4,3,2,'2018-02-09 00:00','2018-02-09 00:00'),
(5,10,5,1,3,'2018-02-15 00:00','2018-02-16 00:00'),
(6,3,1,2,2,'2018-02-20 00:00','2018-02-20 00:00');


INSERT INTO dba.HotelWycieczki(ID_NOCLEGU,ID_WYCIECZKI,Data_przyjazdu,Data_wyjazdu)
VALUES (1,1,'2018-09-16 00:00','2018-09-22 00:00'),
(5,3,'2018-08-18 00:00','2018-08-27 00:00'),
(9,4,'2018-05-11 00:00','2018-05-13 00:00'),
(4,9,'2018-05-18 00:00','2018-05-20 00:00'),
(4,2,'2018-06-18 00:00','2018-06-26 00:00'),
(1,11,'2018-09-14 00:00','2018-09-20 00:00'),
(5,1,'2018-09-17 00:00','2018-09-20 00:00')


INSERT INTO dba.Jedzie(ID_ZAMOWIENIA,ID_KLIENTA)
VALUES (2,15),(3,6),(3,5),
(3,8),(3,10),(4,1),
(4,2),(4,3),(4,9),
(4,11),(4,15),(4,13),
(5,7),(5,4),(5,2),
(6,9),(6,8);


INSERT INTO dba.Dodatki_noclegu(ID_DODATKU,ID_NOCLEGU)
VALUES (6,1),(7,1),(8,1),
(9,1),(10,1),(6,4),
(7,4),(8,4),(9,4),
(10,4),(8,11);


INSERT INTO dba.Dodatki_wycieczki(ID_DODATKU,ID_WYCIECZKI)
VALUES (1,1),(2,1),(5,1),
(1,3),(5,3),(1,4),
(3,9),(4,9),(1,11),
(3,1)


INSERT INTO dba.Dodatki_zamowienia(ID_DODATKU,ID_ZAMOWIENIA)
VALUES (1,1),(2,1),(3,1),
(6,1),(7,1),(7,2),
(3,2);