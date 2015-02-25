(define (install-raise-package)
  (define (raise-integer i)
    (make-rational i 1))

  (define (raise-rational r)
    (make-real (/ (numer r) (denom r))))

  (define (raise-real r)
    (make-complex-real-imag r 0))

  (put 'raise '(integer) raise-integer)
  (put 'raise '(rational) raise-rational)
  (put 'raise '(real) raise-real))
