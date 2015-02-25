(define (adjoin-set x set)
  (if (null? set) (list x)
      (let ((cur (car set)))
      (cond  ((= x cur) set)
             ((< x cur) (cons x set))
             ((> x cur) (cons cur (adjoin-set x (cdr set))))))))

(adjoin-set 5 '(3 5 7 9))
(adjoin-set 4 '(3 5 7 9))
(adjoin-set 1 '(3 5 7 9))
(adjoin-set 10 '(3 5 7 9))
  


