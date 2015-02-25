(define (div-interval x y)
  (if (<= (* (upper-bound y) (lower-bound y)) 0)
      0
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(div-interval (make-interval 1 2) (make-interval -1 1))
