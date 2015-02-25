(define (invert-unit-series s)
  (cons-stream 1 (stream-map - zeros (mul-series (stream-cdr s) (invert-unit-series s)))))
