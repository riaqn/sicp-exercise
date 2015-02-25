(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        (else ((get 'deriv (operator exp)) (operands exp) env))))
