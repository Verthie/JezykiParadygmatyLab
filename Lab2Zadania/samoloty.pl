lot(a2324, warszawa, krakow, 1800, 1845, day(1, 1, 1, 1, 1, 1, 1)).
lot(lf224, warszawa, rzeszow, 1850, 1930, day(1, 1, 1, 1, 1, 1, 1)).
lot(m232, warszawa, berlin, 1400, 1525, day(1, 0, 1, 1, 0, 0, 1)).
lot(a231, warszawa, monachium, 1420, 1600, dni(0, 1, 1, 0, 1, 1, 1)).
lot(l324, warszawa, londyn, 1330, 1600, day(1, 1, 1, 1, 1, 1, 1)).
lot(a2324, krakow, warszawa, 700, 745, day(1, 1, 1, 1, 1, 1, 1)).
lot(lf224, rzeszow, warszawa, 850, 940, day(1, 1, 1, 1, 1, 1, 1)).
lot(m232, berlin, warszawa, 1600, 1725, day(1, 0, 1, 1, 0, 0, 1)).
lot(a231, monachium, warszawa, 1720, 1850, day(0, 1, 1, 0, 1, 1, 1)).
lot(l324, londyn, warszawa, 1720, 1940, day(1, 1, 1, 1, 1, 1, 1)).

wtorek_lot(Numer) :- lot(Numer, _, _, _, _, day(_, 1, _, _, _, _, _)).
lot_rzewar(GOd, GPrzy) :- lot(_, rzeszow, warszawa,GOd,GPrzy,_).
lot_a2324(TrasaOd, TrasaDo) :- lot(a2324, TrasaOd, TrasaDo, _, _, _).
kurs_berwar(Dni) :- lot(_, berlin, warszawa, _, _, Dni).
ladawanie_war(Numer) :- lot(Numer, _, warszawa, _, GPrzy, _), ((GPrzy>=800, GPrzy=<1000); GPrzy>1800).

% write() - writes
% read(X) - allows user to change value of the parameter
% repeat - endless reapeat of the program until user aborts, hits ; or writes end.
% fail - zawsze zwraca fałsz

wtorek_loty :-
    write('Przeloty we wtorek: '), nl,
    wtorek_lot(X),
    write('Numer lotu: '), write(X), nl,
    fail.

rzeszow_warszawa_loty :-
    write('Godziny przelotow na trasie rzeszow-warszawa: '), nl,
    lot_rzewar(X, Y),
    write(X), write(' - '), write(Y), nl,
    fail.

trasa_a2324 :-
    write('Trasa lotu o numerze a2324: '), nl,
    lot_a2324(X, Y),
    write(X), write(' - '), write(Y), nl,
    fail.

kurs_berwar :-
    write('Dni, w jakich kursuje samolot z berlina do warszawy: '), nl,
    kurs_berwar(X),
    write(X), nl,
    fail.

ladawanie_warszawa_loty :-
    write('Numery samolotow ladujacych w warszawie w godzinach od 8:00 do 10:00 lub po 18:00: '), nl,
    ladawanie_war(X),
    write(X), nl,
    fail.
