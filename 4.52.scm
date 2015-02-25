(define (if-fail-try exp)
  (cadr exp))
(define (if-fail-fall exp)
  (caddr exp))
(define (analyze-if-fail exp)
  (let ((try (analyze (if-fail-try exp))
        (fall (analyze (if-fail-fall exp)))
    (lambda (env succeed fail)
      (try env
           succeed
           (lambda ()
             (fall env
                   succeed
                   fail))))))))
