(define (find s predicate)
  	(cond
		((null? s) #f)
		((predicate (car s)) (car s))
		(else (find (cdr-stream s) predicate))
	)
)

(define (scale-stream s k)
  	(cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))
)

(define (has-cycle s)
    (define (is-in elem lst)
        (cond
            ((null? lst) #f)
            ((eq? elem (car lst)) #t)
            (else (is-in elem (cdr lst)))
        )
    )
    (define (helper lst seen)
        (cond
            ((null? lst) #f)
            ((is-in lst seen) #t)
            (else (helper (cdr-stream lst) (cons lst seen)))
        )
    )
    (helper s nil)
)

(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
