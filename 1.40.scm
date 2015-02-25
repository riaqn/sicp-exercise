(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g 0.0001) x)))))
(define (deriv g dx)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess 0.0001))

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

(define cubic (lambda (a b c) (lambda (x) (+ (* x x x) (* a x x) (* b x) c))))

(newtons-method (cubic 1 2 -42) 1)
