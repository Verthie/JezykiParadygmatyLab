osoba(barni).
osoba(stan).
osoba(grzegorz).
osoba(wiktoria).
osoba(magdalena).
osoba(helena).

czas_wolny(barni, pilka_nozna).
czas_wolny(stan, gry_komputerowe).
czas_wolny(grzegorz, wspinaczka_gorska).
czas_wolny(wiktoria, ogladanie_filmow).
czas_wolny(magdalena, rysowanie).
czas_wolny(helena, programowanie).

wiek(barni, 13).
wiek(stan, 23).
wiek(grzegorz, 27).
wiek(wiktoria, 17).
wiek(magdalena, 12).
wiek(helena, 20).

wiek_mlodszy(Os1,Os2) :- wiek(Os1, A), wiek(Os2, B), A<B. 