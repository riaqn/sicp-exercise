(define (is-safe col cols)
  (define (iter depth cols)
    (if (or (= col (car cols))
            (= depth (abs (- col (car cols)))))
        false
        (iter (+ depth 1) (cdr cols)))))
        
(define (queens n)
  (define (iter cols i)
    (if (= i n)
        cols
        (let ((col (an-integer-between 0 n)))
          (if (is-safe col cols)
              (iter (cons col cols) (+ i 1)))))))
