(define make-segment
  (lambda (start end) (cons start end)))

(define start-segment
  (lambda (segment) (car segment)))

(define end-segment
  (lambda (segment) (cdr segment)))

(define make-point
  (lambda (x y) (cons x y)))

(define x-point
  (lambda (point) (car point)))
(define y-point
  (lambda (point) (cdr point)))

(define average
  (lambda (x1 x2) (/ (+ x1 x2) 2)))

(define midpoint-segment
  (lambda (segment)
    (make-point (average (x-point (start-segment segment)) (x-point (end-segment segment)))
                (average (y-point (start-segment segment)) (y-point (end-segment segment))))))

(define print-point
  (lambda (p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")))

(print-point (midpoint-segment (make-segment (make-point 1 2)
                                             (make-point 3 4))))
