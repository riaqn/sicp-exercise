(let* ((x 3)
       (y (+ x 2))
       (z (+ x y 5)))
  (* x z))

(let ((x 3))
  (let ((y (+ x 2)))
    (let ((z (+ x y 5)))
      (* x z))))

;the above two should be equivlent

(define (let-bindings exp) (cadr exp))
(define (let-body exp) (caddr exp))

(define (let*->nested-lets exp)
  (define (iter bindings body)
    (if (null? bindings)
        body
        (list 'let
              (list (car bindings))
              (iter (cdr bindings) body))))
  (iter (let-bindings exp) (let-body)))

;well, I think it should sufficient :-)
