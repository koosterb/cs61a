;; Scheme ;;

; Q2
; -1 if x < y, 0 if x == y, 1 if x > y
(define (over-or-under x y)
    (cond
        ((< x y) -1)
        ((= x y) 0)
        ((> x y) 1)
    )
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

; Q3
(define (filter f lst)
    (define (helper lst result)
        (cond
            ((= 0 (length lst)) result)
            ((f (car lst)) (helper (cdr lst) (append result (list (car lst)))))
            (else (helper (cdr lst) result))
        )
    )
    (helper lst 'nil)
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

; Q4
(define (make-adder num)
    (lambda (x) (+ x num))
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13