(define (integrate-series a)
  (stream-map / a integers))

(define cosine-series (cons-stream 1 (integrate-series (stream-map - zeros sin-series))))
(define sin-series (cons-stream 0 (integrate-series cosine-series)))
