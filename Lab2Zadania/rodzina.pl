rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzys).
rodzic(krzys, mikolaj).
kobieta(zofia).
kobieta(kasia).
kobieta(ania).
mezczyzna(andrzej).
mezczyzna(marcin).
mezczyzna(krzys).
mezczyzna(mikolaj).

potomek(Y,X):-
	rodzic(X,Y).
matka(X,Y):-
	rodzic(X,Y),
	kobieta(X).
dziadkowie(X,Z):-
	rodzic(X,Y),
	rodzic(Y,Z).
siostra(X,Y):-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X).

% 1. Każdy kto ma dziecko jest szczesliwy
szczesliwy(X) :- rodzic(X, _).
% Dla kazdego X, jesli X ma dziecko, które ma siostre wtedy X ma dwoje dzieci
dwoje_dzieci(X) :- rodzic(X, Dziecko), siostra(Dziecko, _).

% 2. Zapisz relacje wnuk za pomoca relacji rodzic
wnuk(Wnuk, X):-
	rodzic(X,Y),
	rodzic(Wnuk, Y).

% 3. Zdefiniuj regule ciotka(X,Y) wykorzystujac fakty rodzice i regule siostra
ciotka(C,X):-
	rodzic(Y,X),
	siostra(C,Y).

% 4. Zdefiniuj regule nastepca
nastepca(N,Y):-
	rodzic(Y,N).
nastepca(N,Z):-
	rodzic(Y,N),
	nastepca(Y,Z).