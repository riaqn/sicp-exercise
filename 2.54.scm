(define (equal? a b)
  (cond ((and (pair? a) (pair? b))
         (if (and (equal? (car a) (car b))
               (equal? (cdr a) (cdr b)))
          true
          false))
        ((and (not (pair? a)) (not (pair? b)))
         (eq? a b))
        (else false)))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
