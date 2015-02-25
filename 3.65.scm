(define (exp-summands n)
  (cons-stream (/ 1 n)
               (stream-map - (exp-summands (+ n 1)))))
(define exp-stream
  (partial-sums (exp-summands 1)))

(display-stream (euler-transform exp-stream))

(define (make-tableau transform s)
  (cons-stream s (make-tableau transform (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car (make-tableau transform s)))
