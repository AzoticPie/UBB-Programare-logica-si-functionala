(defun find_path_r(l n)
    (cond
        ;(), n=0
        ((null l) nil)
        ;(l1), l1 = node
        ((equal (car l) n)
            (cons (car l ) ())
        )
        (t 
        ;loop prin fiecare copil, daca se gaseste el n, result nu e nil si se returneaza
            (loop for subtree in (cdr l) 
                do (let ((result (find_path_r subtree n)))
                    (if result (cons (car l) result) ())
                    )
            )
        )
        ;
    )
)

;;; Determina calea de la radacina la un nod dat intr-un arbore de tip (2)
;;; find_path(l:list, n:atom)
;;; l: lista neliniara in care este reprezentat un arbore de tipul(2)
;;; n: valoarea nodului cautat
;;; returns: o lista liniara cu calea de la radacina lui l la nodul n
(defun find_path(l n)
    (cond
        ;(), n=0
        ((null l) nil)
        ;(l1), l1 = node
        ((equal (car l) n)
            (cons (car l ) nil)
        )
        (t 
        ;loop prin fiecare subtree, daca se gaseste  in el n, result nu e nil si se concateneaza
            (let ((result (mapcan #'(lambda (temp) (find_path temp n)) (cdr l))))
                (if result (cons (car l) result) nil)
            )
        )
        ;
    )
)

;(find_path '(A (B) (C (D) (E))) 'C)