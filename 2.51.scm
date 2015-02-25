(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
           (transform-painter
            painter1
            (make-vect 0.0 0.0)
            (make-vect 1.0 0.0)
            split-point))
          (paint-top
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.0)
            (make-vect 1.0 0.5))))
      (lambda (frame)
        (paint-below frame)
        (paint-top frame)))))


