(letrec ((<VAR_1> <EXP_1>) ... (<VAR_N> <EXP_N>))
  <BODY>)

(let ((<var_1> '*unassigned)
      (<var_2> '*unassigned)
      ...)
  (begin
    (set! <var_1> <exp_1>)
    (set! <var_2> <exp_2>)
    ...)
  <body>)

(define (letrec->let exp)
  (let ((pairs (cadr body))
        (body (cddr body)))
    (cons 'let
          (cons (map (lambda (x) (list (car x) '*unassigned)) pairs)
                (cons 
                 (cons 'begin
                       (map (lambda (x) (cons 'set! x)) pairs))
                 body)))))
