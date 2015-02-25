((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fib k)
      (if (< k 2)
          1
          (+ (fib fib (- k 1)) (fib fib (- k 2)))))))
 10)

(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true
         (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false
         (ev? ev? od? (- n 1))))))
