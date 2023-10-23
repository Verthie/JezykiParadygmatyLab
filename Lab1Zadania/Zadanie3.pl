osoba(magdalena, pawel, karolina, kobieta, 13).
osoba(monika, pawel, karolina, kobieta, 16).
osoba(jakub, pawel, karolina, mezczyzna, 21).
osoba(marianna, pawel, karolina, kobieta, 26).
osoba(kulfon, pawel, karolina, mezczyzna, 28).
osoba(gargamel, pawel, karolina, mezczyzna, 30).
osoba(pawel, stan, elzbieta, mezczyzna, 56).
osoba(karolina, franciszek, bozena, kobieta, 55).

rodzenstwo(X, Y) :- osoba(X, Ojciec, Matka, _, _), osoba(Y, Ojciec, Matka, _, _), X \= Y.
brat(X, Y) :- osoba(X, Ojciec, Matka, mezczyzna, _), osoba(Y, Ojciec, Matka, mezczyzna, _), X \= Y.
siostra(X, Y) :- osoba(X, Ojciec, Matka, kobieta, _), osoba(Y, Ojciec, Matka, kobieta, _), X \= Y.
% bracia(X) :-
% siostry(X) :-