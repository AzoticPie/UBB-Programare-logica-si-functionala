;;; Verifica daca un atom se afal intr-o lista 
;;; is_member(l:list, n:atom)
;;; l: lista in care se cauta atomul n
;;; n: valoarea cautata in lista l
;;; returns: (t) daca atomul n se afla in lista l, nil altfel
(defun is_member(l n)
    (cond
        ((and (atom l) (equal l n)) '(t))
        ((atom l) nil)
        ((and (atom (car l)) (equal (car l) n)) '(t))
        ((listp l)
            (mapcan #'(lambda (a) (is_member a n)) (cdr l))
        )
    )
) 

;;; Verifica daca un atom se afal intr-o lista folosind functia is_member
;;; helper(l:list, n:atom)
;;; l: lista neliniara in care este reprezentat un arbore de tipul(2)
;;; n: valoarea nodului cautat
;;; returns: (Valoarea functiei is_member ca si atom) 
;;;          t daca atomul n se afla in lista l, nil altfel
(defun helper(l n)
  (car (f l n))
)