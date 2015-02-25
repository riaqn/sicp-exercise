(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect -1 0)
                     (make-vect 0 1)))

(define (rotate-180 painter)
  (transform-painter painter
                     (make-vect 1 1)
                     (make-vect -1 0)
                     (make-vect 0 -1)))

(define (rotate-270 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 -1)
                     (make-vect 1 0)))

