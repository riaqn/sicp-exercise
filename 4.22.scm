(define (analyze-let exp)
  (let ((pairs (cadr exp))
        (body (cddr exp)))
    (lambda (env)
      (analyze-application
       (cons (cons ('lambda (cons (map car pairs) body)))
             (map cadr pairs))))))
