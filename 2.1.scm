(define make-rat
  (lambda (n d)
    (let ((g (gcd n d)))
      (if (negative? d)
          (cons (- n) (- d))
          (cons n d)))))

(make-rat -1 -2)
(make-rat 1 -2)
(make-rat 1 2)
(make-rat -1 2)
