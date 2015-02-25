;we use the stream to represent all bindings in environment and all
;its enclosing environment

(define (frame+env->stream frame env)
  (if (null? frame)
      (if (null? env)
          (empty-stream)
          (frame+env->stream (enclosing-environment env) (first-frame env)))
      (cons-stream (car frame) (frame+env->stream env (cdr frame)))))
  
(define (env->stream env)
  (frame+env->stream '() env))

;now the lookup and set can be written in a much simpler way

(define (lookup-variable-value var env)
  (define (iter s)
    (if (stream-null? s)
        (error "Unbound variable" var)
        (if (eq? var (car (stream-car s)))
            (cdr (stream-car s))
            (iter (stream-cdr s)))))
  (iter (env->stream env)))

(define (set-variable-value! var val env)
  (define (iter s)
    (if (stream-null? s)
        (error "Unbound variable -- SET!" var)
        (if (eq? var (car (stream-car s)))
            (set-cdr! (stream-car s) val)
            (iter (stream-cdr s)))))
  (iter (env->stream env)))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (iter s)
      (if (stream-null? s)
          (add-binding-to-frame! var val frame)
          (if (eq? var (car (stream-car s)))
              (set-cdr! (stream-car s) val)
              (iter (stream-cdr s)))))
    (iter (frame+env->stream frame the-empty-environment))))
