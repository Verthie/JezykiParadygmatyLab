; dotimes -  służy do iteracji określoną liczbę razy. Jest bardziej zwięzłe niż konstrukcje do, jest zwykle używane do prostych iteracji
(dotimes (i 10) (print i)) ; wyswietlanie w petli iteracji od 0 do 9

; do - używane do tworzenia pętli. Jest to konstrukcja umożliwiająca wykonywania sekwencji instrukcji wielkorotnie.
(do ((i 0 (incf i))
    (j 10 (decf j))) ; inicjalizacja - i=0 i++, j=10 j--
    ((zerop j) 'done) ; warunek zakończenia - dopóki j nie jest równe 0
    (print (+ i j))) ; krok - print i+j

; let - pozwala wprowadzać lokalne zmienne wewnątrz bloku kodu. zakres istnieje tylko wewnątrz danego bloku
; loop - umożliwia tworzenie różnych rodzajów pętli w jednym bloku loop
; when - konstrukcja warunkowa, która wykonuje ciało swojego bloku tylko wtedy, gdy warunek jest spełniony 
(let ((i 10))
    (loop 
        (when (zerop i) (return))
        (print (decf i))))

; dolist - makro służące do iteracji przez elementy listy. Przyjmuje dwie zmienne: pierwsza to zmienna iteracyjna, a druga to lista przez, którą iterujemy

; 1 do n
(loop
    for i from 1 to n)

; 0 do n -1
(loop
    for i from 0 below n)

; cons - tworzenie listy poprzez dodanie nowego elementu na początek istniejącej listy, można stworzyć liste nieodwrotnie
(cons 1 2)
=> (1 . 2)

(cons 1 (cons 2 (cons 3 nil)))
=> (1 2 3)

; list - tworzenie listy
(list 1 2 3 4 5)
=> (1 2 3 4 5)

; ' - tworzenie listy
'(1 2 3 4 5)
=> (1 2 3 4 5)

; car - zwraca glowe listy
(car '(1 2 3 4 5)) 
=> 1

; cdr - zwraca ogon listy
(cdr '(1 2 3 4 5 6))
=> (2 3 4 5 6)

; (nth numer lista) - zwraca element o danej pozycji z listy 
; endp - zwraca wartosc prawdy jesli jest to ostatni element listy (np. jesli za elementem '6' jest nil to 6 jest ostatnim elementem, tak wiec zwraca true)

; reverse - odwraca elementy listy
(reverse '(1 2 3 4 5))

; remove - usuwa element z listy
; last - zwraca ostatni element z listy
; append - dodaje element do listy

; member - zwraca pierwszy ogon w ktorym podana wartosc ('a) jest glowa listy
(member 'a '(b d a c))
=> (A C)

(member 'a '(b d c d a d f d e d))
=> (A D F D E D)

; find - przeszukuje liste w poszukiwaniu podanego elementu i go zwraca po odnalezieniu
(find 'a '( b d a c))
=> A

; union - laczy zbiory (nie dziala jak append poniewaz usuwa duplikaty przy laczeniu, dziala jak matematyczna suma zbiorow)
(union '(a) '(b))
=> (A B)

; set-difference - odejmuje elemnty z drugiego zbioru w zbiorze pierwszym
(set-difference '(a b) '(a))
=> B

; setq - służy do przypisywania wartości do zmiennych
(setq stos nil)
=> nil

; push - dodaje element na początek listy, czyli na jej głowę, można tworzyć liste odwrotnie
(push 10 stos)
=> (10)

(push 12 stos)
=> (12 10)

(push 145 stos)
=> (145 12 10)

; pop - usuwa pierwszy element z listy i zwraca ten element
(pop stos)
=> 145

stos
=> (12 10)

(setq plist '(:a 1 :b 2 :c 3)) ; tworzenie wartości key-value (mapa)
=> (:A 1 :B 2 :C 3)

; przypisywania wartości różnym typom miejsc (places), takim jak zmienne, elementy listy, itp.
(setf (getf plist :a) 10) ; przypisanie wartości 10 do zmiennej a w liście plist
=> 10

(remf plist :b)
=> T

; Zad 1 Napisz program który łączy dwie listy: (1 2 3 4) i (a b c d)
; Rozwiazanie z wbudowana funkcja
(defun laczlisty () 
    (let ((listA '(a b c d)) ; let - tworzenie tymczasowej zmiennej
    (listB '(1 2 3 4))
    (stos nil))
    (dolist (x (reverse listB))
        (push x stos))
    (dolist (x (reverse listA))
        (push x stos))
    stos))
    
; Rozwiazanie rekurencyjne
(setq lista1 '(a b c d))
(setq lista2 '(1 2 3 4))
(defun polacz-listy (lista1 lista2)
    (if (null lista1) lista2 (cons (car lista1) (polacz-listy (cdr lista1) lista2))))

; Rozwiazanie 12.12.2023
(defun laczenieList (lista1 lista2)
    (let ((wynik '()))
        (dolist (item lista1)
            (push item wynik))
        (dolist (item lista2)
            (push item wynik))
        (reverse wynik)))

; Zad 2 Napisz funkcję która odwraca listę
(defun odwroc (lista)
    (let ((wynik '()))
        (dolist (item lista)
            (push item wynik))
        wynik))

; Zad 3 Napisz funkcję, która sprawdza, czy podana lista jest palindromem
(defun palindrom (lista)
    (let ((tempList (odwroc lista)))
        (equal lista tempList)))

; Zad 4 Napisz funkcję, która sortuje rosnąco listę liczb całkowitych
(defun wstawelement (element lista)
    (if (null lista) 
        (list element) 
        (if (< element (car lista))
            (cons element lista)
            (cons (car lista) (wstawelement element (cdr lista))))))

(defun sortlist (lista)
    (let ((wynik '()))
        (dolist (item lista)
            (setq wynik (wstawelement item wynik)))
        wynik))


; format
(format t "Zadanie 1~%")
=> Zadanie 1

(format t "Zadanie 1~% Podaj liczbe: ")
=> Zadanie 1
 Podaj liczbe:

#| Funkcje do wklejenia do działania switcha
(defun laczenieList (lista1 lista2)
    (let ((wynik '()))
        (dolist (item lista1)
            (push item wynik))
        (dolist (item lista2)
            (push item wynik))
        (reverse wynik)))

(defun iloczyn (lista1 lista2)
    (if (or (null lista1) (null lista2))
        '()
        (cons (* (car lista1) (car lista2))
            (iloczyn (cdr lista1) (cdr lista2)))))
 |#

; Napisać switch'a
(defun switch()
    (loop
    (format t " Lista zadań:~% ")
    (format t " Zadanie 1~% ")
    (format t " Zadanie 5~% ")
    (format t " Podaj numer zadania: ") (setq zadanie (read))
    (format t " Podaj liste: ") (setq lA (read))
    (format t " Podaj liste: ") (setq lB (read))
    (cond ((= zadanie 1) (format t " Wynik polaczenia listy A i B: ~a~%" (laczenieList lA lB)))
        ((= zadanie 5) (format t " Wynik iloczynu list A i B: ~a~%" (iloczyn lA lB))))))

; Zad 5 Napisz funkcję, która oblicza iloczyn dwóch list liczbowych parami różnych, w wyniku otrzymujemy listę iloczynów
(defun iloczyn (lista1 lista2)
    (if (or (null lista1) (null lista2))
        '()
        (cons (* (car lista1) (car lista2))
            (iloczyn (cdr lista1) (cdr lista2)))))

; Zad 6 Napisz funkcję, która zlicza ilość wystąpień liczb podzielnych przez trzy na podanej liście
(defun dziel3 (liczba)
    (= (mod liczba 3) 0))

(defun zadanie6 (lista)
    (let ((licznik 0))
        (dolist (item lista)
            (if (dziel3 item)
                (setq licznik (+ licznik 1))))
    licznik))

; Zad 7 Napisz funkcję w języku CLisp, który dla podanej listy liczb całkowitych, wypisze ile jest liczb podzielnych przez N na podanej liście, N powinno być parametrem funkcji
(defun dzieln (liczba n)
    (= (mod liczba n) 0))

(defun zadanie7 (lista n)
    (let ((licznik 0))
        (dolist (item lista)
            (if (dzieln item n)
                (setq licznik (+ licznik 1))))
    licznik))

; Zad 8 Napisz funkcję, która dla podanego stosu wybierze tylko wartości podzielne przez 5 i zapisze na stosie w odwrotnym porządku
(defun zadanie8 (stos)
  (let ((nowy-stos '()))
    (dolist (element stos)
      (when (= 0 (mod element 5))
        (push element nowy-stos)))
    nowy-stos))


; Zad 9 Napisz funkcję, która generuje listę liczb całkowitych z przedziału <A,B> podanego przez użytkownika. Można zastosować funkcję push.
(defun zadanie9 ()
    (setq lA (read))
    (setq lB (read))
    (let (wynik '())
        (if (> lA lB) 
        (loop for i from lB to lA
        do (push i wynik))
        (if (< lA lB) 
        (loop for i from lA to lB
        do (push i wynik)) 
        (push lA wynik)))
    (reverse wynik)))

; Zad 10 Napisz funkcję, która generuje listę znaków z podanego przedziału kodów ASCII
(defun genascii (p k)
    (loop for kod from p to k
    collect (code-char kod)) ; collect - zbiera wartości w trakcie iteracji i tworzy z nich listy, code-char - zwraca znak na podstawie kodu
)