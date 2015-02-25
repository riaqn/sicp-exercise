(define (install-equ-package)
  (define (equ-complex z1 z2)
    (and (= (real-part z1) (real-part z2))
         (= (imag-part z1) (imag-part z2))))

  (define (equ-rational z1 z2)
    (= (* (numer z1) (denom z2))
       (* (numer z2) (denom z1))))

  (define (equ-ordinary z1 z2)
    (= z1 z2))

  (put 'equ '(complex complex) equ-complex)
  (put 'equ '(rational rational) equ-rational)
  (put 'equ '(scheme-number scheme-number) equ-ordinary))
