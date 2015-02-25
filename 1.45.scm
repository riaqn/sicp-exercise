(define n-root-cons
  (lambda (x n)
    (lambda (y)
      (/ x (exp (* (- n 1) (log y)))))))

(define average-damp
  (lambda (f)
    (lambda (x) (/ (+ x (f x)) 2))))

(define (fixed-point f first-guess tolerance)
  (define (close-enougn? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enougn? guess next)
          next
          (try next))))
  (try first-guess))

(define compose (lambda (f g)
                  (lambda (x) (f (g x)))))

(define repeated (lambda (f n)
                   (if (= n 1)
                       f
                       (compose f (repeated f (- n 1))))))

(define n-root
  (lambda (x n tol)
    (define to-be-fixed (n-root-cons x n))
    (define j (floor (/ (log n) (log 2))))
    (fixed-point ((repeated average-damp j) to-be-fixed) 1 tol)))

(exp (* 6 (log (n-root 1000 6 0.0001))))
