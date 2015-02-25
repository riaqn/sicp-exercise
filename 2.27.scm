(define (deep-reverse l)
  (define (iter l result)
    (if (null? l)
        result
        (iter (cdr l) (cons (if (list? (car l))
                                (deep-reverse (car l))
                                (car l))
                            result))))
  (iter l '()))

(deep-reverse '((1 2) (3 4)))
