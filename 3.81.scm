(define (random-numbers requests)
  (define (iter x requests)
     (let ((nextx (if (eq? (stream-car requests) 'generate)
                      (rand-update x)
                      (stream-car requests))))
       (cons-stream nextx
                    (iter nextx (stream-cdr requests)))))
  (iter rand-init requests))
