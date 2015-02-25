(define cont-frac
  (lambda (n d k)
    (define iter (lambda (i result)
                    (if (= i 0)
                        result
                        (iter (- i 1) (/ (n i) (+ (d i) result))))))
    (iter k 0)))

(define tan-cf
  (lambda (x k) 
    (cont-frac (lambda (i) (if (= i 1)
                           x
                           (- (square x))))
               (lambda (i) (- (* i 2) 1))
               k)))

(tan-cf (/ 3.1415926 4) 100)
