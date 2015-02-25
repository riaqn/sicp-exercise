(define (partial-sums s)
  (let ((s0 (stream-car s)))
    (cons-stream s0 (stream-map (lambda (x) (+ x s0)) (partial-sums (stream-cdr s))))))
