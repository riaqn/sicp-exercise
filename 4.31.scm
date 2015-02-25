;reimplement the (apply) should be sufficient

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (map (lambda (x) (if (list? x) (car x) x)) (procedure-parameters procedure))
           (map (lambda (x y)
                  (if (list? x)
                      (if (eq? (cadr x) 'lazy)
                          (delay-it y env)
                          (delay-it-memo y env))
                      (actual-value y env)))
                (procedure-parameters procedure)
                arguments)
           (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))

(define (deley-it exp env)
  (list 'thunk exp env))
(define (delay-it-memo exp env)
  (list 'thunk-memo exp env))

(define (force-it obj)
  (cond ((thunk? obj)
         (actual-value
          (think-exp obj)
          (thunk-env obj)))
        ((thunk-memo? obj)
         (let ((result (actual-value
                        (thunk-exp obj)
                        (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result)  ; replace `exp' with its value
           (set-cdr! (cdr obj) '())     ; forget unneeded `env'
           result))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))
