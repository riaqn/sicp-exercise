(define (reverse l)
  (define (iter l l0)
    (if (= (length l) 0)
        l0
        (iter (cdr l) (cons (car l) l0))))
  (iter l '()))

(reverse (list 1 3 4 5 6))
