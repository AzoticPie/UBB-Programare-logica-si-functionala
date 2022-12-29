;;; Elimina al N-lea element al unei liste liniare
;;; elimNth(l:list, n:int)
;;; L: lista originala in care se elimina al N-lea element
;;; N: al catalea elemtn se elimina din L
;;; returns: lista noua formata din L fara al N-lea element
(defun elimNth(l n)
    (cond
        (
            (and (> n 1) (not(null l)))
            (cons (car l) (elimNth (cdr l) (- n 1)) )
        )
        (T (cdr l))
    )
)

;;; Determina succesorul unui numar reprezentat ca lista liniara de cifre
;;; succesor(l:list)
;;; L: lista originala de cifre la care se adauga un 1
;;; returns: o lista liniara reprezentand succesorul lui numarului reprezentat de lista L
(defun succesor(l)
    (cond
        ((= (length l) 1)  
            (list (+ (car l) 1))
        )
    
        (T
            (let ((temp (succesor (cdr l))))

                (cond 
                    ((= (car temp) 10)
                        (append (list (+ (car l) 1)) '(0) (cdr temp))
                    )
                    (T 
                        (append (list (car l)) temp)
                    )
                ) 
                        
            )
        )
    )
)

;;; Aplica functia de succesor pe un numar reprezentat ca lista liniara de cifre si rezolva cazul in care ramane nr 10 la inceput
;;; b(l:list)
;;; L: lista originala de cifre la care se adauga un 1
;;; returns: o lista liniara reprezentand succesorul lui numarului reprezentat de lista L
(defun b(l)
    (let ((temp (succesor l)))
        (cond 
            ((>= (car temp) 10)
                (append '(1 0) (cdr temp))
            )
            (t
                temp
            )
        )
    )

)

;;; Verifica daca un atom se afla intr-o lista neliniara
;;; contine(l:list, n:atom)
;;; L: lista neliniara in care se cauta atomul n
;;; N: Atomul care se cauta in lista L
;;; returns: T daca atomul n se afla in lista L, nil altfel
(defun contine(l n)
    (cond
        ;list is null
        ((null l) nil)
        ;elem is a number
        ((and (numberp (car l)) (numberp n))
            (if (= (car l) n) T
            (contine (cdr l) n))
        )
        ;l1 and n are other atoms
        ((and (atom (car l)) (not(numberp n)))
            (if (equal (car l) n) T
            (contine (cdr l) n))
        )
        ;elem is another atom and n is a number
        ((atom (car l)) 
            (contine (cdr l) n)
        )
        ;elem is a list
        (T  
            (or (contine (car l) n) (contine (cdr l) n))
        )
    )
)

;;; Transforma o lista neliniara intr-o lista liniara de atomi
;;; liniar(l:list)
;;; L: lista neliniara originala
;;; returns: lista liniara formata din atomii listei L
(defun liniar(l)
  (cond
     ((null l) nil)
     ((atom (car l)) (append (list(car l)) (liniar (cdr l))))
     (t (append (liniar (car l)) (liniar (cdr l))))
  )
)

;;; Elima elementele dublicate dintr-o lista liniara de numere
;;; elim_dub(l:list)
;;; L: lista originala din care se elimina dublicatele
;;; returns: multimea listei L
(defun elim_dub(l)
    (cond 
        ((null l) nil)
        ((contine (cdr l) (car l))
            (elim_dub (cdr l))
        )
        (t
            (append (list (car l)) (elim_dub (cdr l)))
        )
    )
)

;;; Construieste multimea atomilor unei liste
;;; c_helper(l:list)
;;; L: Lista neliniara din care se construieste multimea atomilor 
;;; returns: multimea atomilor din lista neliniara L
(defun c_helper(l)
    (elim_dub (liniar l))
)

;;; Verifica daca o lista liniara este multime
;;; is_set(l:list)
;;; L: Lista liniara data
;;; returns: T daca lista L este multime, nil altfel
(defun is_set(l)
    (cond 
        ((null l) t)
        ((contine (cdr l) (car l))
            nil
        )
        (t
            (is_set (cdr l))
        )
    )
)