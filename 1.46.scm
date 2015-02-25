(define iterative-improve
  (lambda (good-enough? improve)
    (define wrapped
      (lambda (guess)
        (define next-guess (improve guess))
        (if (good-enough? next-guess guess)
            guess
            (wrapped (improve guess)))))
    wrapped))

(define good-enough?
  (lambda (rel-err)
    (lambda (x0 x)
      (< (abs (/ (- x x0) x0)) rel-err))))

(define sqrt
  (lambda (x good-enough?)
    ((iterative-improve good-enough
                        (lambda (y) (/ (+ y (/ x y)) 2)))
     1)))

(sqrt 100.0 (good-enough? 0.0001))

(define fixed-point
  (lambda (f guess good-enough?)
    ((iterative-improve good-enough?
                        f) guess)))

(define x (fixed-point cos 0 (good-enough? 0.0001)))
