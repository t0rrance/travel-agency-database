/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     25.01.2019 21:59:48                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI_SLOWNIK_SLOWNIK_') then
    alter table Dodatki
       delete foreign key FK_DODATKI_SLOWNIK_SLOWNIK_
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI__DODATKI_N_DODATKI') then
    alter table Dodatki_noclegu
       delete foreign key FK_DODATKI__DODATKI_N_DODATKI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI__DODATKI_N_NOCLEG') then
    alter table Dodatki_noclegu
       delete foreign key FK_DODATKI__DODATKI_N_NOCLEG
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI__DODATKI_W_DODATKI') then
    alter table Dodatki_wycieczki
       delete foreign key FK_DODATKI__DODATKI_W_DODATKI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI__DODATKI_W_WYCIECZK') then
    alter table Dodatki_wycieczki
       delete foreign key FK_DODATKI__DODATKI_W_WYCIECZK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI__DODATKI_Z_DODATKI') then
    alter table Dodatki_zamowienia
       delete foreign key FK_DODATKI__DODATKI_Z_DODATKI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DODATKI__DODATKI_Z_ZAMOWIEN') then
    alter table Dodatki_zamowienia
       delete foreign key FK_DODATKI__DODATKI_Z_ZAMOWIEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOTELWYC_HOTELWYCI_NOCLEG') then
    alter table HotelWycieczki
       delete foreign key FK_HOTELWYC_HOTELWYCI_NOCLEG
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOTELWYC_HOTELWYCI_WYCIECZK') then
    alter table HotelWycieczki
       delete foreign key FK_HOTELWYC_HOTELWYCI_WYCIECZK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_JEDZIE_JEDZIE_ZAMOWIEN') then
    alter table Jedzie
       delete foreign key FK_JEDZIE_JEDZIE_ZAMOWIEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_JEDZIE_JEDZIE2_KLIENT') then
    alter table Jedzie
       delete foreign key FK_JEDZIE_JEDZIE2_KLIENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOCLEG_TYPY_TYP_NOCL') then
    alter table Nocleg
       delete foreign key FK_NOCLEG_TYPY_TYP_NOCL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ZAMOWIEN_REALIZUJE_PRACOWNI') then
    alter table Zamowienie
       delete foreign key FK_ZAMOWIEN_REALIZUJE_PRACOWNI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ZAMOWIEN_ZAMAWIA_KLIENT') then
    alter table Zamowienie
       delete foreign key FK_ZAMOWIEN_ZAMAWIA_KLIENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ZAMOWIEN_ZAMOWIENI_WYCIECZK') then
    alter table Zamowienie
       delete foreign key FK_ZAMOWIEN_ZAMOWIENI_WYCIECZK
end if;

drop index if exists Dodatki.Slownik_FK;

drop index if exists Dodatki.Dodatki_PK;

drop table if exists Dodatki;

drop index if exists Dodatki_noclegu.Dodatki_noclegu_PK;

drop table if exists Dodatki_noclegu;

drop index if exists Dodatki_wycieczki.Dodatki_wycieczki_PK;

drop table if exists Dodatki_wycieczki;

drop index if exists Dodatki_zamowienia.Dodatki_zamowienia_PK;

drop table if exists Dodatki_zamowienia;

drop index if exists HotelWycieczki.HotelWycieczki_PK;

drop table if exists HotelWycieczki;

drop index if exists Jedzie.Jedzie_PK;

drop table if exists Jedzie;

drop index if exists Klient.Klient_PK;

drop table if exists Klient;

drop index if exists Nocleg.Typy_FK;

drop index if exists Nocleg.Nocleg_PK;

drop table if exists Nocleg;

drop index if exists Pracownik.Pracownik_PK;

drop table if exists Pracownik;

drop index if exists Slownik_dodatkow.Slownik_dodatkow_PK;

drop table if exists Slownik_dodatkow;

drop index if exists Typ_Noclegu.Typ_Noclegu_PK;

drop table if exists Typ_Noclegu;

drop index if exists Wycieczka.Wycieczka_PK;

drop table if exists Wycieczka;

drop index if exists Zamowienie.Realizuje_FK;

drop index if exists Zamowienie.Zamowienia_FK;

drop index if exists Zamowienie.Zamawia_FK;

drop index if exists Zamowienie.Zamowienie_PK;

drop table if exists Zamowienie;

/*==============================================================*/
/* Table: Dodatki                                               */
/*==============================================================*/
create table Dodatki 
(
   ID_DODATKU           integer                        not null,
   ID_SLOWNIKA          integer                        null,
   Nazwa                varchar(100)                   not null,
   Cena                 integer                        not null,
   constraint PK_DODATKI primary key (ID_DODATKU)
);

comment on table Dodatki is 
'Spis dodatk�w (atrakcji) danego wyjazdu/hotelu.';

comment on column Dodatki.ID_DODATKU is 
'Identyfikator dodatku';

comment on column Dodatki.ID_SLOWNIKA is 
'Idenytfikator s�ownika';

comment on column Dodatki.Nazwa is 
'Nazwa noclegu';

comment on column Dodatki.Cena is 
'Cena jednostkowa za osob�';

/*==============================================================*/
/* Index: Dodatki_PK                                            */
/*==============================================================*/
create unique index Dodatki_PK on Dodatki (
ID_DODATKU ASC
);

/*==============================================================*/
/* Index: Slownik_FK                                            */
/*==============================================================*/
create index Slownik_FK on Dodatki (
ID_SLOWNIKA ASC
);

/*==============================================================*/
/* Table: Dodatki_noclegu                                       */
/*==============================================================*/
create table Dodatki_noclegu 
(
   ID_DODATKU           integer                        not null,
   ID_NOCLEGU           integer                        not null,
   constraint PK_DODATKI_NOCLEGU primary key (ID_DODATKU, ID_NOCLEGU)
);

comment on table Dodatki_noclegu is 
'Dodatki danego miejsca noclegowego';

comment on column Dodatki_noclegu.ID_DODATKU is 
'Identyfikator dodatku';

comment on column Dodatki_noclegu.ID_NOCLEGU is 
'Identyfikator noclegu';

/*==============================================================*/
/* Index: Dodatki_noclegu_PK                                    */
/*==============================================================*/
create unique index Dodatki_noclegu_PK on Dodatki_noclegu (
ID_DODATKU ASC,
ID_NOCLEGU ASC
);

/*==============================================================*/
/* Table: Dodatki_wycieczki                                     */
/*==============================================================*/
create table Dodatki_wycieczki 
(
   ID_DODATKU           integer                        not null,
   ID_WYCIECZKI         integer                        not null,
   constraint PK_DODATKI_WYCIECZKI primary key (ID_DODATKU, ID_WYCIECZKI)
);

comment on table Dodatki_wycieczki is 
'Dodatki danej wcieczki';

comment on column Dodatki_wycieczki.ID_DODATKU is 
'Identyfikator dodatku';

comment on column Dodatki_wycieczki.ID_WYCIECZKI is 
'Identyfikator wycieczki';

/*==============================================================*/
/* Index: Dodatki_wycieczki_PK                                  */
/*==============================================================*/
create unique index Dodatki_wycieczki_PK on Dodatki_wycieczki (
ID_DODATKU ASC,
ID_WYCIECZKI ASC
);

/*==============================================================*/
/* Table: Dodatki_zamowienia                                   */
/*==============================================================*/
create table Dodatki_zamowienia 
(
   ID_DODATKU           integer                        not null,
   ID_ZAMOWIENIA        integer                        not null,
   constraint PK_DODATKI_zamowienia primary key (ID_DODATKU, ID_ZAMOWIENIA)
);

comment on table Dodatki_zamowienia is 
'Klient mo�e dokupi� dodatki do wycieczki';

comment on column Dodatki_zamowienia.ID_DODATKU is 
'Identyfikator dodatku';

comment on column Dodatki_zamowienia.ID_ZAMOWIENIA is 
'Identyfikator zamowienia';

/*==============================================================*/
/* Index: Dodatki_zamowienia_PK                                */
/*==============================================================*/
create unique index Dodatki_zamowienia_PK on Dodatki_zamowienia (
ID_DODATKU ASC,
ID_ZAMOWIENIA ASC
);

/*==============================================================*/
/* Table: HotelWycieczki                                        */
/*==============================================================*/
create table HotelWycieczki 
(
   ID_NOCLEGU           integer                        not null,
   ID_WYCIECZKI         integer                        not null,
   Data_przyjazdu       date                           not null,
   Data_wyjazdu         date                           not null,
   constraint PK_HOTELWYCIECZKI primary key (ID_NOCLEGU, ID_WYCIECZKI)
);

comment on table HotelWycieczki is 
'Spis hoteli wykorzystanych podczas danej wycieczki';

comment on column HotelWycieczki.ID_NOCLEGU is 
'Identyfikator noclegu';

comment on column HotelWycieczki.ID_WYCIECZKI is 
'Identyfikator wycieczki';

comment on column HotelWycieczki.Data_przyjazdu is 
'Data zameldowania w hotelu';

comment on column HotelWycieczki.Data_wyjazdu is 
'Data wymeldowania';

/*==============================================================*/
/* Index: HotelWycieczki_PK                                     */
/*==============================================================*/
create unique index HotelWycieczki_PK on HotelWycieczki (
ID_NOCLEGU ASC,
ID_WYCIECZKI ASC
);

/*==============================================================*/
/* Table: Jedzie                                                */
/*==============================================================*/
create table Jedzie 
(
   ID_ZAMOWIENIA        integer                        not null,
   ID_KLIENTA           integer                        not null,
   constraint PK_JEDZIE primary key (ID_ZAMOWIENIA, ID_KLIENTA)
);

comment on table Jedzie is 
'Klient jedzie na zamowion� wycieczk�';

comment on column Jedzie.ID_ZAMOWIENIA is 
'Identyfikator zamowienia';

comment on column Jedzie.ID_KLIENTA is 
'Identyfikator klienta';

/*==============================================================*/
/* Index: Jedzie_PK                                             */
/*==============================================================*/
create unique index Jedzie_PK on Jedzie (
ID_ZAMOWIENIA ASC,
ID_KLIENTA ASC
);

/*==============================================================*/
/* Table: Klient                                                */
/*==============================================================*/
create table Klient 
(
   ID_KLIENTA           integer                        not null,
   Ulica                varchar(50)                    null,
   Nr                   varchar(10)                    null,
   Kod                  varchar(6)                     not null,
   Miejscowosc          varchar(80)                    not null,
   Kraj                 varchar(80)                    not null,
   Pesel                char(11)                       not null,
   Imie                 varchar(30)                    not null,
   Nazwisko             varchar(30)                    not null,
   Telefon              char(9)                        not null,
   constraint PK_KLIENT primary key (ID_KLIENTA)
);

comment on table Klient is 
'Tabela zawieraj�ca list� klient�w biura podr�y';

comment on column Klient.ID_KLIENTA is 
'Identyfikator klienta';

comment on column Klient.Ulica is 
'Nazwa ulicy
';

comment on column Klient.Nr is 
'Numer mieszkania';

comment on column Klient.Kod is 
'Kod pocztowy';

comment on column Klient.Miejscowosc is 
'Nazwa miejscowo�ci';

comment on column Klient.Kraj is 
'Nazwa Kraju';

comment on column Klient.Pesel is 
'Numer PESEL osoby';

comment on column Klient.Imie is 
'Imi� osoby';

comment on column Klient.Nazwisko is 
'Nazwisko osoby';

comment on column Klient.Telefon is 
'Numer telefonu osoby';

/*==============================================================*/
/* Index: Klient_PK                                             */
/*==============================================================*/
create unique index Klient_PK on Klient (
ID_KLIENTA ASC
);

/*==============================================================*/
/* Table: Nocleg                                                */
/*==============================================================*/
create table Nocleg 
(
   ID_NOCLEGU           integer                        not null,
   ID_TYPU              integer                        not null,
   Ulica                varchar(50)                    null,
   Nr                   varchar(10)                    null,
   Kod                  varchar(6)                     not null,
   Miejscowosc          varchar(80)                    not null,
   Kraj                 varchar(80)                    not null,
   Nazwa                varchar(100)                   not null,
   Standard             integer                        not null,
   Telefon              char(9)                        not null,
   Cena                 integer                        not null,
   constraint PK_NOCLEG primary key (ID_NOCLEGU)
);

comment on table Nocleg is 
'Tabela zawiera spis nocleg�w';

comment on column Nocleg.ID_NOCLEGU is 
'Identyfikator noclegu';

comment on column Nocleg.ID_TYPU is 
'Identyfikator typu';

comment on column Nocleg.Ulica is 
'Nazwa ulicy
';

comment on column Nocleg.Nr is 
'Numer mieszkania';

comment on column Nocleg.Kod is 
'Kod pocztowy';

comment on column Nocleg.Miejscowosc is 
'Nazwa miejscowo�ci';

comment on column Nocleg.Kraj is 
'Nazwa Kraju';

comment on column Nocleg.Nazwa is 
'Nazwa noclegu';

comment on column Nocleg.Standard is 
'Standard hotelu - im wy�sza cyfra tym wy�szy standard hotelu';

comment on column Nocleg.Telefon is 
'Numer telefonu osoby';

comment on column Nocleg.Cena is 
'Cena jednostkowa za osob�';

/*==============================================================*/
/* Index: Nocleg_PK                                             */
/*==============================================================*/
create unique index Nocleg_PK on Nocleg (
ID_NOCLEGU ASC
);

/*==============================================================*/
/* Index: Typy_FK                                               */
/*==============================================================*/
create index Typy_FK on Nocleg (
ID_TYPU ASC
);

/*==============================================================*/
/* Table: Pracownik                                             */
/*==============================================================*/
create table Pracownik 
(
   ID_PRACOWNIKA        integer                        not null,
   Ulica                varchar(50)                    null,
   Nr                   varchar(10)                    null,
   Kod                  varchar(6)                     not null,
   Miejscowosc          varchar(80)                    not null,
   Kraj                 varchar(80)                    not null,
   Pesel                char(11)                       not null,
   Imie                 varchar(30)                    not null,
   Nazwisko             varchar(30)                    not null,
   Telefon              char(9)                        not null,
   constraint PK_PRACOWNIK primary key (ID_PRACOWNIKA)
);

comment on table Pracownik is 
'Tabela zawiera spis pracownik�w';

comment on column Pracownik.ID_PRACOWNIKA is 
'Identyfikator pracownika';

comment on column Pracownik.Ulica is 
'Nazwa ulicy
';

comment on column Pracownik.Nr is 
'Numer mieszkania';

comment on column Pracownik.Kod is 
'Kod pocztowy';

comment on column Pracownik.Miejscowosc is 
'Nazwa miejscowo�ci';

comment on column Pracownik.Kraj is 
'Nazwa Kraju';

comment on column Pracownik.Pesel is 
'Numer PESEL osoby';

comment on column Pracownik.Imie is 
'Imi� osoby';

comment on column Pracownik.Nazwisko is 
'Nazwisko osoby';

comment on column Pracownik.Telefon is 
'Numer telefonu osoby';

/*==============================================================*/
/* Index: Pracownik_PK                                          */
/*==============================================================*/
create unique index Pracownik_PK on Pracownik (
ID_PRACOWNIKA ASC
);

/*==============================================================*/
/* Table: Slownik_dodatkow                                      */
/*==============================================================*/
create table Slownik_dodatkow 
(
   ID_SLOWNIKA          integer                        not null,
   Opis                 varchar(250)                   not null,
   constraint PK_SLOWNIK_DODATKOW primary key (ID_SLOWNIKA)
);

comment on table Slownik_dodatkow is 
'Slownik kategorii dodatk�w';

comment on column Slownik_dodatkow.ID_SLOWNIKA is 
'Idenytfikator s�ownika';

comment on column Slownik_dodatkow.Opis is 
'Opis kategorii';

/*==============================================================*/
/* Index: Slownik_dodatkow_PK                                   */
/*==============================================================*/
create unique index Slownik_dodatkow_PK on Slownik_dodatkow (
ID_SLOWNIKA ASC
);

/*==============================================================*/
/* Table: Typ_Noclegu                                           */
/*==============================================================*/
create table Typ_Noclegu 
(
   ID_TYPU              integer                        not null,
   Opis                 varchar(250)                   not null,
   constraint PK_TYP_NOCLEGU primary key (ID_TYPU)
);

comment on table Typ_Noclegu is 
'Typ noclegu wraz z opisem ';

comment on column Typ_Noclegu.ID_TYPU is 
'Identyfikator typu';

comment on column Typ_Noclegu.Opis is 
'Opis kategorii';

/*==============================================================*/
/* Index: Typ_Noclegu_PK                                        */
/*==============================================================*/
create unique index Typ_Noclegu_PK on Typ_Noclegu (
ID_TYPU ASC
);

/*==============================================================*/
/* Table: Wycieczka                                             */
/*==============================================================*/
create table Wycieczka 
(
   ID_WYCIECZKI         integer                        not null,
   Nazwa                varchar(100)                   not null,
   Ilosc_miejsc         integer                        not null,
   Ilosc_zajetych       integer                        not null,
   Cena                 integer                        not null,
   Data_wyjazdu         date                           not null,
   Data_powrotu         date                           not null,
   constraint PK_WYCIECZKA primary key (ID_WYCIECZKI)
);

comment on table Wycieczka is 
'Tabela zawiera spis wycieczek oferowanych przez biuro';

comment on column Wycieczka.ID_WYCIECZKI is 
'Identyfikator wycieczki';

comment on column Wycieczka.Nazwa is 
'Nazwa noclegu';

comment on column Wycieczka.Ilosc_miejsc is 
'Ilo�� dodatk�w (max)';

comment on column Wycieczka.Ilosc_zajetych is 
'Ilo�� miejsc ju� wykupionych';

comment on column Wycieczka.Cena is 
'Cena jednostkowa za osob�';

comment on column Wycieczka.Data_wyjazdu is 
'Data wymeldowania';

comment on column Wycieczka.Data_powrotu is 
'Data powrotu  z wycieczki';

/*==============================================================*/
/* Index: Wycieczka_PK                                          */
/*==============================================================*/
create unique index Wycieczka_PK on Wycieczka (
ID_WYCIECZKI ASC
);

/*==============================================================*/
/* Table: Zamowienie                                            */
/*==============================================================*/
create table Zamowienie 
(
   ID_ZAMOWIENIA        integer                        not null,
   ID_KLIENTA           integer                        not null,
   ID_WYCIECZKI         integer                        not null,
   ID_PRACOWNIKA        integer                        not null,
   Ilosc_miejsc         integer                        not null,
   Data_zamowienia      date                           not null,
   Data_platnosci       date                           null,
   constraint PK_ZAMOWIENIE primary key (ID_ZAMOWIENIA)
);

comment on table Zamowienie is 
'Tabela zawiera spis zamowie� ';

comment on column Zamowienie.ID_ZAMOWIENIA is 
'Identyfikator zamowienia';

comment on column Zamowienie.ID_KLIENTA is 
'Identyfikator klienta';

comment on column Zamowienie.ID_WYCIECZKI is 
'Identyfikator wycieczki';

comment on column Zamowienie.ID_PRACOWNIKA is 
'Identyfikator pracownika';

comment on column Zamowienie.Ilosc_miejsc is 
'Ilo�� dodatk�w (max)';

comment on column Zamowienie.Data_zamowienia is 
'Data podpisania umowy';

comment on column Zamowienie.Data_platnosci is 
'Data zaksi�gowania wp�aty';

/*==============================================================*/
/* Index: Zamowienie_PK                                         */
/*==============================================================*/
create unique index Zamowienie_PK on Zamowienie (
ID_ZAMOWIENIA ASC
);

/*==============================================================*/
/* Index: Zamawia_FK                                            */
/*==============================================================*/
create index Zamawia_FK on Zamowienie (
ID_KLIENTA ASC
);

/*==============================================================*/
/* Index: Zamowienia_FK                                         */
/*==============================================================*/
create index Zamowienia_FK on Zamowienie (
ID_WYCIECZKI ASC
);

/*==============================================================*/
/* Index: Realizuje_FK                                          */
/*==============================================================*/
create index Realizuje_FK on Zamowienie (
ID_PRACOWNIKA ASC
);

alter table Dodatki
   add constraint FK_DODATKI_SLOWNIK_SLOWNIK_ foreign key (ID_SLOWNIKA)
      references Slownik_dodatkow (ID_SLOWNIKA)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki.FK_DODATKI_SLOWNIK_SLOWNIK_ is 
'Ka�dy dodatek ma swoj� kategori�';

alter table Dodatki_noclegu
   add constraint FK_DODATKI__DODATKI_N_DODATKI foreign key (ID_DODATKU)
      references Dodatki (ID_DODATKU)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki_noclegu.FK_DODATKI__DODATKI_N_DODATKI is 
'Dodatki danego miejsca noclegowego';

alter table Dodatki_noclegu
   add constraint FK_DODATKI__DODATKI_N_NOCLEG foreign key (ID_NOCLEGU)
      references Nocleg (ID_NOCLEGU)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki_noclegu.FK_DODATKI__DODATKI_N_NOCLEG is 
'Dodatki danego miejsca noclegowego';

alter table Dodatki_wycieczki
   add constraint FK_DODATKI__DODATKI_W_DODATKI foreign key (ID_DODATKU)
      references Dodatki (ID_DODATKU)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki_wycieczki.FK_DODATKI__DODATKI_W_DODATKI is 
'Dodatki danej wcieczki';

alter table Dodatki_wycieczki
   add constraint FK_DODATKI__DODATKI_W_WYCIECZK foreign key (ID_WYCIECZKI)
      references Wycieczka (ID_WYCIECZKI)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki_wycieczki.FK_DODATKI__DODATKI_W_WYCIECZK is 
'Dodatki danej wcieczki';

alter table Dodatki_zamowienia
   add constraint FK_DODATKI__DODATKI_Z_DODATKI foreign key (ID_DODATKU)
      references Dodatki (ID_DODATKU)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki_zamowienia.FK_DODATKI__DODATKI_Z_DODATKI is 
'Klient mo�e dokupi� dodatki do wycieczki';

alter table Dodatki_zamowienia
   add constraint FK_DODATKI__DODATKI_Z_ZAMOWIEN foreign key (ID_ZAMOWIENIA)
      references Zamowienie (ID_ZAMOWIENIA)
      on update restrict
      on delete restrict;

comment on foreign key Dodatki_zamowienia.FK_DODATKI__DODATKI_Z_ZAMOWIEN is 
'Klient mo�e dokupi� dodatki do wycieczki';

alter table HotelWycieczki
   add constraint FK_HOTELWYC_HOTELWYCI_NOCLEG foreign key (ID_NOCLEGU)
      references Nocleg (ID_NOCLEGU)
      on update restrict
      on delete restrict;

alter table HotelWycieczki
   add constraint FK_HOTELWYC_HOTELWYCI_WYCIECZK foreign key (ID_WYCIECZKI)
      references Wycieczka (ID_WYCIECZKI)
      on update restrict
      on delete restrict;

alter table Jedzie
   add constraint FK_JEDZIE_JEDZIE_ZAMOWIEN foreign key (ID_ZAMOWIENIA)
      references Zamowienie (ID_ZAMOWIENIA)
      on update restrict
      on delete restrict;

comment on foreign key Jedzie.FK_JEDZIE_JEDZIE_ZAMOWIEN is 
'Klient jedzie na zamowion� wycieczk�';

alter table Jedzie
   add constraint FK_JEDZIE_JEDZIE2_KLIENT foreign key (ID_KLIENTA)
      references Klient (ID_KLIENTA)
      on update restrict
      on delete restrict;

comment on foreign key Jedzie.FK_JEDZIE_JEDZIE2_KLIENT is 
'Klient jedzie na zamowion� wycieczk�';

alter table Nocleg
   add constraint FK_NOCLEG_TYPY_TYP_NOCL foreign key (ID_TYPU)
      references Typ_Noclegu (ID_TYPU)
      on update restrict
      on delete restrict;

comment on foreign key Nocleg.FK_NOCLEG_TYPY_TYP_NOCL is 
'Ka�de miejsce noclegowe ma swoj� kategori�';

alter table Zamowienie
   add constraint FK_ZAMOWIEN_REALIZUJE_PRACOWNI foreign key (ID_PRACOWNIKA)
      references Pracownik (ID_PRACOWNIKA)
      on update restrict
      on delete restrict;

comment on foreign key Zamowienie.FK_ZAMOWIEN_REALIZUJE_PRACOWNI is 
'Pracownik relalizuje umow� z klientem';

alter table Zamowienie
   add constraint FK_ZAMOWIEN_ZAMAWIA_KLIENT foreign key (ID_KLIENTA)
      references Klient (ID_KLIENTA)
      on update restrict
      on delete restrict;

comment on foreign key Zamowienie.FK_ZAMOWIEN_ZAMAWIA_KLIENT is 
'Klient wykupuje wycieczk�';

alter table Zamowienie
   add constraint FK_ZAMOWIEN_ZAMOWIENI_WYCIECZK foreign key (ID_WYCIECZKI)
      references Wycieczka (ID_WYCIECZKI)
      on update restrict
      on delete restrict;

comment on foreign key Zamowienie.FK_ZAMOWIEN_ZAMOWIENI_WYCIECZK is 
'Zamowienia na dane wycieczki';

