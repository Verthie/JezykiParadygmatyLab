sasiad(1, 2).
sasiad(1, 3).
sasiad(1, 4).
sasiad(1, 5).
sasiad(2, 3).
sasiad(2, 4).
sasiad(3, 4).
sasiad(4, 5).

kolor(niebieski).
kolor(czerwony).
kolor(zolty).
kolor(fioletowy).

sasiedzi(X, Y) :- sasiad(X, Y); sasiad(Y, X).