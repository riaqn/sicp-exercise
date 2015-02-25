(define sum 0) ;sum=0
(define (accum x) (set! sum (+ x sum)) sum)
(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20))) ; sum=1

(define y (stream-filter even? seq)) ; sum=3
(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq)) ; sum=1+2+3+4+5=15
(stream-ref y 7) ; sum=1+2+3+4+5+6+7=28
(display-stream z) ; sum=1+..+20=210
