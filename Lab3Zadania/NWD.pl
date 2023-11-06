nwd(A, 0, Wynik) :- Wynik is A.
nwd(A, B, Wynik1) :- B > 0, R is A mod B, nwd(B, R, Wynik1).