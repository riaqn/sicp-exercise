(define (mul-series s1 s2)
  (cons-stream (* (stream-cat s1) (stream-cat s2))
               (add-streams (scale-stream (stream-cat s1) (stream-cdr s2))
                            (mul-series (stream-cdr s1) s2))))
