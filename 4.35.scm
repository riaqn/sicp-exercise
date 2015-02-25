(define (an-integer-between low high)
  (if (= low high)
      (amb)
      (amb low (an-integer-between (+ low 1) high))))
