(define make-point
  (lambda (x y) (cons x y)))

(define x-point
  (lambda (point) (car point)))
(define y-point
  (lambda (point) (cdr point)))

(define make-rectangle
  (lambda (p1 p2 p3) (list p1 p2 p3)))

(define p1-rectangle
  (lambda (rec) (car rec)))

(define p2-rectangle
  (lambda (rec) (cadr rec)))

(define p3-rectangle
  (lambda (rec) (caddr rec)))
  
(define distance-point
  (lambda (p1 p2) (sqrt (+ (square (- (x-point p1) (x-point p2)))
                      (square (- (y-point p1) (y-point p2)))))))

(define perimeter-rectangle
  (lambda (rec)
    (* 2 (+ (distance-point (p1-rectangle rec)
                            (p2-rectangle rec))
            (distance-point (p2-rectangle rec)
                            (p3-rectangle rec))))))

(define area-rectangle
  (lambda (rectangle)
    (* (distance-point (p1-rectangle rec)
                       (p2-rectangle rec))
       (distance-point (p2-rectangle rec)
                       (p3-rectangle rec)))))

(define rec
  (make-rectangle (make-point 1 1) (make-point 1 2) (make-point 2 2)))

(perimeter-rectangle rec)
(area-rectangle rec)
