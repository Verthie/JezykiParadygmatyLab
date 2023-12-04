; Zad 1.
> (+ 2 (/ (* 3 4) 8)) => 7/2

; Zad 2.
> (+ (sin 12) (cos (mod 256 32))) => 0.46342707

; Zad 3.
(defun suma (x y) (+ x y))
> (suma 5 10) => 15

; Zad 4.
(defun parzysta (x) (if (evenp x) 'parzysta 'nieparzysta))
> (parzysta 10) => PARZYSTA
> (parzysta 7) => NIEPARZYSTA

; Zad 5.
(defun silnia (x) (if(> x 0) (* x (silnia (- x 1))) 1) )
> (silnia 5) => 120

; Zad 6.
(defun fib (n) 
    (cond 
        ((= n 0) 0) 
        ((= n 1) 1)
        (t (+ (fib (- n 1)) (fib (- n 2))))
        )
)
> (fib 7) => 13

; Zad 7.
(defun sumaparz (przedzialp przedzialk)
    (if (evenp przedzialp) (incf przedzialp))
    (if (evenp przedzialk) (decf przedzialk))
    ; (print przedzialp)
    ; (print przedzialk)
    (if (< przedzialp przedzialk) (+ przedzialk (sumaparz przedzialp (- przedzialk 2))) przedzialp)
)
> (sumaparz 5 10) => 21

; Zad 8.
(defun sumakwadratow (przedzialp przedzialk)
    ; (print przedzialp)
    ; (print przedzialk)
    (if (< przedzialp przedzialk) (+ (* przedzialk przedzialk) (sumakwadratow przedzialp (- przedzialk 1))) (* przedzialp przedzialp))
)
> (sumakwadratow 5 10) => 355 