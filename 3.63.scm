(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0
     (stream-map (lambda (guess) (sqrt-improve guess x))
                 guesses)))
  guesses)

(define (sqrt-stream x)
  (cons-stream 1.0 (stream-map
                    (lambda (guess) (sqrt-improve guess x))
                    (sqrt-stream x))))


Note the first one, that for every element queried in guesses, the result is cached, and further query require computation.
while the second one, everytime a new stream is constructed, which require a fresh computation every time.
