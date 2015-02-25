(define (last-pair l)
  (if (= (length l) 1)
      l
      (last-pair (cdr l))))

(last-pair (list 23 72 149 34))
