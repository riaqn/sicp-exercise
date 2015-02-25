(define (lookup-variable-value var env)
  (define (iter s)
    (if (stream-null? s)
        (error "Unbound variable" var)
        (if (eq? var (car (stream-car s)))
            (let ((ret (cdr (stream-car s))))
              (if (eq? ret *unassigned*)
                  (error "It's not assigned yet" val)
                  ret))
            (iter (stream-cdr s)))))
  (iter (env->stream env)))

(define u <E1>)
(define v <E2>)
<E3>

(let ((u '*unassigned*)
      (v '*unassigned*))
  (set! u <E1>)
  (set! v <E2>)
  <E3>)

(define (scan-out-defines body)
  (let* ((defines (filter (lambda (x) (eq? (car x) 'define)) body))
         (vars (map cadr defines))
         (vals (map caddr defines)))
    (cons 'let
          (cons
           (map (lambda (x) (list x '*unassigned*)) vars)
           (cons
            (cons
             'begin
             (map (lambda (x y) (list 'set! x y)) vars vals))
            (filter (lambda (x) (not (eq? (car x) 'define))) body))))))

;it's better to install it in make-procedure, we only scan once.
