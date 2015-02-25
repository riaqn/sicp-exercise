(define cont-frac
  (lambda (n d k)
    (define iter (lambda (i)
                    (if (> i k)
                        0
                        (/ (n i) (+ (d i) (iter (+ i 1)))))))
    (iter 1)))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
