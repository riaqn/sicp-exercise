(define (install-zero-package)
  (define (=zero?complex z)
    (= (magnitude z) 0))

  (define (=zero?rational z)
    (= (numer z) 0))

  (define (=zero?ordinary z)
    (= z 0))

  (put '=zero? '(complex) =zero?complex)
  (put '=zero? '(rational) =zero?rational)
  (put '=zero? '(scheme-number) =zero?ordinary))
