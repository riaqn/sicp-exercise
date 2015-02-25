(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (cons (stream-car s) x))
                (pairs t u))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(stream-filter (lambda (triple) (= (+ (square (car triple))
                                  (square (cadr triple)))
                               (square (caddr triple))))
               (triples integers integers integers))
