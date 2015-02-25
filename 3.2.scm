(define (make-monitored proc)
  (let ((count 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) count)
            ((eq? arg 'reset-count) (set! count 0))
            (else (begin (set! count (1+ count))
                         (proc arg)))))))

(define s (make-monitored sqrt))

(s 100)

(s 'how-many-calls?)
(s 100)

(s 'reset-count)
(s 'how-many-calls?)
