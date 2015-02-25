(let <VAR> <BINDINGS> <BODY>)

(let ((<VAR> (lambda (<names>) <BODY>)))
  (<VAR> <values>))

((lambda (<VAR>) (<VAR> <values>))
 (lambda (<names>) <BODY>))

;those three should be equivalent

(define (let->combination exp)
  (if (list? (cadr exp))
      (let ((bindings (cadr exp))
            (body (caddr exp)))
        (list (cons ('lambda (cons (map car bindings) body)))
              (map cadr bindings)))
      (let ((var (cadr exp))
            (bindings (caddr exp))
            (body (cadddr exp)))
        (list (list 'lambda (list var) (cons var (map cadr bindings)))
              (cons 'lambda (cons (map car bindings) body))))))
        
