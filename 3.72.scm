(define (squaresum p)
  (+ (square (car p))
     (square (cadr p))))
                                    
(define sums
  (weighted-pairs integers integers squaresum))

(define (iter sums)
  (if (= (squaresum (stream-car sums))
         (squaresum (stream-cadr sums))
         (squaresum (stream-caddr sums)))
      (begin 
        (display (stream-car sums))
        (display (stream-cadr sums))))
  (iter (stream-cdr sums)))

(iter sums)
