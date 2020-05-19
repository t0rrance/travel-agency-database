# Projekt bazy danych - biuro podróży 
Baza danych została stworzona w celu usprawnienia zarządzania biurem podróży. Zawiera informacje na temat klientów i zamówień, pracowników i sprzedanych przez nich wycieczek, spis dostępnych wycieczek, noclegów oraz dodatków, które może wykupić dodatkowo klient. Baza umożliwia wygenerowanie statystyki na temat ilości i wartości sprzedanych umów przez pracownika. Zawiera mechanizm sprawdzający czy umowa została opłacona i w przypadku braku wpłaty w ciągu 2 tygodni zamówienie zostaje usunięte. Umożliwia stworzenie zamówienia wycieczki biorąc pod uwagę fakt ograniczonej liczby miejsc na dany wyjazd. Posiada zabezpieczenie przed zapisaniem klienta na wyjazd jeśli występuje kolizja czasowa (jedzie w tym samym czasie na inną wycieczkę).