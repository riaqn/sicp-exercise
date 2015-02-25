(define (cons x y)
  (list 'pair (lambda (m) (m x y))))
(define (pair? obj)
  (tagged-list? obj 'pair))

(define (car z)
  ((cadr z) (lambda (x y) x)))

(define (cdr z)
  ((cadr z) (lambda (x y) y)))

(define (driver-loop)
  (prompt-for-input input-prompt)
  (let ((input (read)))
    (let ((output
           (actual-value input the-global-environment))
          (announce-output output-prompt)
          (user-print output)))))

(define (user-print object)
  (cond ((compound-procedure? object)
         (display (list 'compound-procedure
                     (procedure-parameters object)
                     (procedure-body object)
                     '<procedure-env>)))
        ((pair? object)
         (display (car object))
         (display "...more element"))
        (else (display object))))

