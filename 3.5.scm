(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (iter trials-remaining trials-passed)
    (if (= trials-remaining 0)
        (* (- x2 x1) (- y2 y1) (/ trials-passed trials))
        (let ((x (random-range x1 x2))
              (y (random-range y1 y2)))
          (if (P x y)
              (iter (-1+ trials-remaining)
                    (1+ trials-passed))
              (iter (-1+ trials-remaining)
                    trials-passed)))))
    (iter trials 0))

(define (random-range low high)
  (+ low (random (- high low))))
  
(estimate-integral
 (lambda (x y) (< (+ (square x) (square y)) 1))
 -1.0 1.0 -1.0 1.0 100000)
