; Zadanie 1
(setq lista '())
(defclass book ()
  ((title :initarg :title :accessor book-title)
   (author :initarg :author :accessor book-author)
   (publisher :initarg :publisher :accessor book-publisher)
   (publish-date :initarg :publish-date :accessor book-publish-date)
   (isbn :initarg :isbn :accessor book-isbn)))

(defmethod display-book ((b book))
  (format t "Tytul: ~A~%Autor: ~A~%Wydawnictwo: ~A~%Rok wydania: ~A~%ISBN: ~A~%"
          (book-title b)
          (book-author b)
          (book-publisher b)
          (book-publish-date b)
          (book-isbn b)))

(defun dodaj ()
  (format t " Dodaj nowa ksiazke~%")
  (format t " Tytul: ") (setq newbook-title (read))
  (format t " Autor: ") (setq newbook-author (read))
  (format t " Wydawnictwo: ") (setq newbook-publisher (read))
  (format t " Rok wydania: ") (setq newbook-publish-date (read))
  (format t " ISBN: ") (setq newbook-isbn (read))
  (defparameter *book* (make-instance 'book
                  :title newbook-title
                  :author newbook-author
                  :publisher newbook-publisher
                  :publish-date newbook-publish-date
                  :isbn newbook-isbn))
  (push *book* lista)
)

(defun usun ()
  (format t " Lista ksiazek:~% ")
  (dolist (ksiazka lista)
    (print (book-title ksiazka)))
  (format t "~%Podaj ksiazke do usuniecia: ") (setq deletebook-title (read))
  (dolist (ksiazka lista)
    (if (string= deletebook-title (book-title ksiazka))
    (setq lista (remove ksiazka lista))
)))

(defun wyszukaj ()
(format t "Podaj tytul ksiazki: ") (setq deletebook-title (read))
(dolist (ksiazka lista)
  (if (string= deletebook-title (book-title ksiazka))
    (format t "Tytul: ~A~%Autor: ~A~%Wydawnictwo: ~A~%Rok: ~A~%ISBN: ~A~%"
    (book-title ksiazka) 
    (book-author ksiazka) 
    (book-publisher ksiazka) 
    (book-publish-date ksiazka) 
    (book-isbn ksiazka)))))

; Zadanie 2.
(setq lista '())
(defclass student ()
  ((first-name :initarg :first-name :accessor student-first-name)
  (last-name :initarg :last-name :accessor student-last-name)
  (album :initarg :album :accessor student-album)
  (grades :initarg :grades :accessor student-grades :initform nil)))

(defclass grade ()
  ((subject-id :initarg :subject-id :accessor grade-subject-id)
  (semester :initarg :semester :accessor grade-semester)
  (grade :initarg :grade :accessor grade-grade)
  (date :initarg :date :accessor grade-date)))

(defun dodajstudenta (  )
  (format t " Dodaj nowego studenta~%")
  (format t " Imie: ") (setq new-first-name (read))
  (format t " Nazwisko: ") (setq new-last-name (read))
  (format t " Numer albumu: ") (setq new-nralbum (read))
  (defparameter *new-student* (
    make-instance 'student 
    :first-name new-first-name 
    :last-name new-last-name 
    :album new-nralbum))
  (push *new-student* lista) *new-student*)

(defun dodajocene (student subject-id semester grade date)
  (defparameter *new-grade* (
    make-instance 'grade
    :subject-id subject-id
    :semester semester
    :grade grade
    :date date))
  (push *new-grade* (student-grades student)))

(defun wyszukaj ()
  (format t "Podaj numer albumu studenta: ") (setq nralbum (read))
  (dolist (student lista)
    (when (string= nralbum (student-album student))
      (format t "Imię: ~A~%Nazwisko: ~A~%Album: ~A~%"
        (student-first-name student)
        (student-last-name student)
        (student-album student))
      (dolist (grade (student-grades student))
        (format t "Przedmiot: ~A~%Semestr: ~A~%Ocena: ~A~%Termin: ~A~%"
          (grade-subject-id grade)
          (grade-semester grade)
          (grade-grade grade)
          (grade-date grade)))
      (return))))