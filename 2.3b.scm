(define make-point
  (lambda (x y) (cons x y)))

(define x-point
  (lambda (point) (car point)))
(define y-point
  (lambda (point) (cdr point)))

(define make-rectangle
  (lambda (p1 w h theta) (list p1 w h theta)))

(define p1-rectangle
  (lambda (rec) (car rec)))

(define w-rectangle
  (lambda (rec) (cadr rec)))

(define h-rectangle
  (lambda (rec) (caddr rec)))

(define theta-rectangel
  (lambda (rec) (cadddr rec)))
  
(define perimeter-rectangle
  (lambda (rec)
    (* 2 (+ (w-rectangle rec)
            (h-rectangle rec)))))

(define area-rectangle
  (lambda (rectangle)
    (* (w-rectangle rec)
       (h-rectangle rec))))

(define rec
  (make-rectangle (make-point 0 0) 1 2 0.1))

(perimeter-rectangle rec)
(area-rectangle rec)
