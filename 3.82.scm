;lets assume that random-range is a ranged random stream.
(define (estimate-integral P x1 x2 y1 y2)
  (stream-map (lambda (p) (* p (* (- x2 x1) (- y2 y1))))
              (monte-carlo (stream-map P (random-range x1 x2) (random-range y1 y2)))))
