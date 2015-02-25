(define cont-frac
  (lambda (n d k)
    (define iter (lambda (i result)
                    (if (= i 0)
                        result
                        (iter (- i 1) (/ (n i) (+ (d i) result))))))
    (iter k 0)))

(+ (cont-frac (lambda (i) 1.0)
           (lambda (i) (if (= (remainder i 3) 2)
                       (* (+ (quotient i 3) 1) 2)
                       1))
           1000
           ) 2)
