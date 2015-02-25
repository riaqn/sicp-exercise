(define compose (lambda (f g)
                  (lambda (x) (f (g x)))))

(define repeated (lambda (f n)
                   (if (= n 1)
                       f
                       (compose f (repeated f (- n 1))))))

((repeated square 2) 5)
