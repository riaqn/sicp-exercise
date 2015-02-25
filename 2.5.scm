(define (cons x y)
  (define integer-exp
    (lambda (x y)
      (if (= y 0)
          1
          (* x (integer-exp x (-1+ y))))))
  (* (integer-exp 2 x) (integer-exp 3 y)))

(define integer-fact
  (lambda (x z)
    (define div (integer-divide z x))
    (if (= (integer-divide-remainder div) 0)
        (1+ (integer-fact x (integer-divide-quotient div)))
        0)))

(define (car z)
  (integer-fact 2 z))

(define (cdr z)
  (integer-fact 3 z))

(car (cons 5 6))
(cdr (cons 7 8))
