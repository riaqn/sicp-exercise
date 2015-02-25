(define double
  (lambda (proc)
    (lambda (x) (proc (proc x)))))

((double 1+) 5)
