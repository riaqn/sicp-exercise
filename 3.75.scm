(define (make-zero-crossings input-stream last-value last-avpt)
  (let ((avpt (/ (+ (strema-car input-stream)
                    last-value)
                 2)))
    (cons-stream
     (sign-change-detector avpt last-avpt)
     (make-zero-crossings
      (stream-cdr input-stream) (stream-car input-stream) avpt))))
