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

(exact->inexact (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1 0.0000001))
