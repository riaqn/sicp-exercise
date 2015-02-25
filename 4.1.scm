(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((x (eval (first-operand exps) env)))
        (cons x
              (list-of-values (rest-operands exps) env)))))

;here comes the right-to-left one
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((x (list-of-values (rest-operands exps) env)))
        (cons (eval (first-operand exps) env)
              x))))
