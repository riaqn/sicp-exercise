(define (make-zero-crossings input-stream last-value)
  (let ((value (stream-car input-stream)))
    (cons-stream
     (sign-change-detector value last-value)
     (make-zero-crossings
      (stream-cdr input-stream) value))))

(define (smooth s last-value)
  (let ((value (stream-car s)))
    (cons-stream (/ (+ last-value value) 2)
                 (smooth (strema-cdr s) value))))

(make-zero-crossings (smooth i 0) 0)
