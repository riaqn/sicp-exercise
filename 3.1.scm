(define (make-accumulator sum)
  (lambda (a)
    (begin (set! sum (+ sum a))
           sum)))

(define A (make-accumulator 5))

(A 10)
(A 10)

           
