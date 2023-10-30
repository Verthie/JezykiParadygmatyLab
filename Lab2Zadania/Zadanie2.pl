zatrudnienie(anna, nowak, zelmer, duza_firma, 2000).
zatrudnienie(katarzyna, bert, amazon, duza_firma, 200).
zatrudnienie(marcin, krzak, spacex, srednia_firma, 500).
zatrudnienie(krzysztof, pajak, google, mala_firma, 4000).
zatrudnienie(amelia, wiertlo, disney, mala_firma, 1400).
zatrudnienie(stefan, komputer, nestle, srednia_firma, 3100).

czy_zadowolona(X) :- zatrudnienie(X, _, _, Wielkosc, Zarobki), Wielkosc=mala_firma, Zarobki>2500.
czy_osoby(X) :- zatrudnienie(X, _, _, Wielkosc, Zarobki), Wielkosc=duza_firma, Zarobki<1500.