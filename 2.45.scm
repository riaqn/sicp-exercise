(define (split p1 p2)
  (let ((wrapped (lambda (painter n))))
    (if (= n 0)
        painter
        (let ((smalller (wrapped painter (- n 1))))
          (p1 painter (p2 smaller smaller))))))


(define (right-split (split beside below)))
(define (up-split (split below beside)))
