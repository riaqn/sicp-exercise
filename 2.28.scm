(define (fringe t)
  (cond ((null? t) '())
        ((list? t)
         (append (fringe (car t)) (fringe (cdr t))))
        (else (list t))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
