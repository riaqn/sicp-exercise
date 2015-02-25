(define (averager a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (adder a b u)
    (constant 2 v)
    (multiplier c v u)))
    
