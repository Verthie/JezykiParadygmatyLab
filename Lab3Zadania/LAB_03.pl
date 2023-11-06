rzeczownik(kot).
rzeczownik(ananas).
rzeczownik(mleko).
rzeczownik(ala).
rzeczownik(egzamin).
rzeczownik(student).
rzeczownik(gry).

czasownik(lubi).
czasownik(pić).
czasownik(pisze).
czasownik(pije).
czasownik(widzi).
czasownik(gra).

przymiotnik(truskawkowe).
przymiotnik(pieknie).
przymiotnik(szybki).
przymiotnik(duzy).

dlugosc(kontener1, 20).
dlugosc(kontener2, 25).
szerokosc(kontener1, 30).
szerokosc(kontener2,9).
wysokosc(kontener1, 15).
wysokosc(kontener2, 10).

%Zadanie 2
poprawne(Slowo1, Slowo2, Slowo3) :- 
    (   
    rzeczownik(Slowo1), czasownik(Slowo2), rzeczownik(Slowo3)
	) ->
	write('Zdanie prawidlowe');
	write('Zdanie nieprawidlowe'), 
    false.


sprawdz :-
    write('Podaj 3 slowa'), nl,
    write('rzeczownik:'), nl,
    read(X), nl,
    write('czasownik:'), nl,
    read(Y), nl,
    write('rzeczownik:'), nl,
    read(Z), nl,
    poprawne(X, Y, Z).

%Zadanie 3
poprawne(Slowo1, Slowo2, Slowo3, Slowo4, Slowo5) :- 
    (   
    przymiotnik(Slowo1), rzeczownik(Slowo2), czasownik(Slowo3), przymiotnik(Slowo4), rzeczownik(Slowo5)
	) ->
	write('Zdanie prawidlowe');
	write('Zdanie nieprawidlowe'), 
    false.


sprawdz5 :-
    write('Podaj 5 slow'), nl,
    write('przymiotnik:'), nl,
    read(A), nl,
    write('rzeczownik:'), nl,
    read(B), nl,
    write('czasownik:'), nl,
    read(C), nl,
    write('przymiotnik:'), nl,
    read(D), nl,
    write('rzeczownik:'), nl,
    read(E), nl,
    poprawne(A, B, C, D, E).

%Zadanie 4
objetosc(Kontener, Wynik) :- 
    dlugosc(Kontener, X), szerokosc(Kontener, Y), wysokosc(Kontener, Z),
    Wynik is X*Y*Z.

%Zadanie 5
nwd(X,X,X). % X = Y, D = X
nwd(X,Y,D) :-
    X<Y,
    Y1 is Y-X, nwd(X,Y1,D).

nwd(X,Y,D) :-
	Y<X,
	nwd(Y,X,D).


    