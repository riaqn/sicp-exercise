(define (div-series s1 s2)
  (let ((scale (/ 1 (stream-cat s2)))) ;this will check constant of s2 automatically
    (mul-series s1 (scale-stream scale (invert-unit-series (sclae-stream sclae s2))))))
