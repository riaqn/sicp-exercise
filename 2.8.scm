(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (make-interval a b) (cons a b))

(sub-interval (make-interval 1 2) (make-interval 0.5 0.6))
