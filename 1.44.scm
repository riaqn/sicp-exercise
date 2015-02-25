(define dx 0.001)
(define smooth
  (lambda (f)
    (lambda (x)
      (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))))

(define compose (lambda (f g)
                  (lambda (x) (f (g x)))))

(define repeated (lambda (f n)
                   (if (= n 1)
                       f
                       (compose f (repeated f (- n 1))))))

(define n-fold-smooth (lambda (f n) ((repeated smooth n) f)))

((n-fold-smooth square 10) 1)
