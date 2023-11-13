%Zadanie 2.
pisz_liste([]).
pisz_liste([H|T]) :- write(H), write(' '), pisz_liste(T).

%Zadanie 3.
nalezy(E, [E|_]). 
nalezy(E, [_|T]) :- nalezy(E, T).

%Zadanie 4.
dlugosc([], 0).
dlugosc([_|T], Wynik) :- dlugosc(T, Wynik1), Wynik is Wynik1+1.

%Zadanie 5.
%L1 = [1,2,3]
%L2 = [5,6,7]
%L3 = [L1, L2]
%L3 = [1,2,3,5,6,7]

laczlisty([], Lista, Lista).
laczlisty([H|T], Lista2, [H|Wynik]) :- 
    laczlisty(T, Lista2, Wynik).

%Zadanie 6.
%L1 = 1,2,3
%E = 34
%L2 = 34,1,2,3

dodaj(E, Lista, NowaLista) :-
    NowaLista = [E|Lista].

dodajVer2(E,Lista,[E|Lista]).

%Zadanie 7.

usunElement(X,[],[]).
%Gdy głowa listy jest równa X wtedy pomijamy element X i rekurencyjnie wykonujemy usunElement na 
%ogonie listy aby otrzymać nową listę
usunElement(X,[X|Tail],NowaLista) :- 
    usunElement(X, Tail, NowaLista).
usunElement(X, [H|T], [H|NowaLista]) :-
    X \= H,
    usunElement(X, T, NowaLista).

%Zadanie 8.
%L=[1,2,3,4,5]
%Wynik: X: 5

ostatni(X, [X]).
ostatni(X, [_|T]) :- ostatni(X,T).

%Zadanie 9.

początek([], _).
początek([XH|XT], [YH|YT]) :-
    XH =:= YH,
    początek(XT, YT).