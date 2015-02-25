(define (cubesum p)
  (+ (cube (car p))
     (cube (cadr p))))
                                    
(define sums
  (weighted-pairs integers integers cubesum))

(define (iter sums)
  (if (= (cubesum (stream-car sums))
         (cubesum (stream-cadr sums)))
      (begin 
        (display (stream-car sums))
        (display (stream-cadr sums)))))

(iter sums)
