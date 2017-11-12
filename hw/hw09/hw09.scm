(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
    (cond
        ((< x 0) -1)
        ((= x 0) 0)
        ((> x 0) 1)
    )
)

(define (square x) (* x x))

(define (pow b n)
    (define (run k)
        (if (= k 1)
            b
            (* b (run (- k 1)))
        )
    )
    (if (integer? (/ n 2))
        (square (run (/ n 2)))
        (* b (square (run (/ (- n 1) 2))))
    )
)

(define (ordered? s)
    (cond
        ((null? (cdr s)) True)
        ((> (car s) (cadr s)) False)
        (else (ordered? (cdr s)))
    )
)

(define (nodots s)
    (cond
        ((null? s) '())
        ((not (pair? s)) (list s))
        ((pair? (car s)) (cons (nodots (car s)) (nodots (cdr s))))
        (else (cons (car s) (nodots (cdr s))))
    )
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond
        ((empty? s) #f)
        ((> (car s) v) False)
        ((= (car s) v) True)
        (else (contains? (cdr s) v))
    )
)

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond
        ((empty? s) (list v))
        ((= v (car s)) s)
        ((> (car s) v) (cons v s))
        ((< (car s) v) (cons (car s) (add (cdr s) v)))
    )
)

(define (intersect s t)
    (cond
        ((or (empty? s) (empty? t)) nil)
        (else
            (define e1 (car s)) (define e2 (car t))
            (cond
                ((= e1 e2) (cons e1 (intersect (cdr s) (cdr t))))
                ((< e1 e2) (intersect (cdr s) t))
                ((< e2 e1) (intersect s (cdr t)))
            )
        )
    )
)

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond
        ((empty? s) t)
        ((empty? t) s)
        ((= (car s) (car t)) (cons (car s) (union (cdr s) (cdr t))))
        ((< (car s) (car t)) (cons (car s) (union (cdr s) t)))
        ((< (car t) (car s)) (cons (car t) (union s (cdr t))))
    )
)